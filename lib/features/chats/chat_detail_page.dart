import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:record/record.dart';

import '../../core/audio/app_audio_playback.dart';
import '../../core/constants/app_assets.dart';
import '../../core/im/im_service.dart';
import '../../core/network/app_apis.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_emoji.dart';
import '../../core/utils/zodiac.dart';
import '../../core/widgets/app_action_bottom_sheet.dart';
import '../../core/widgets/app_asset_image.dart';
import '../../core/widgets/app_network_image.dart';
import '../../core/widgets/app_tip_dialog.dart';
import '../../core/widgets/center_toast.dart';
import '../../core/widgets/chat_message_action_popup.dart';
import '../../core/widgets/network_or_asset_avatar.dart';
import '../home/chat_user_profile_page.dart';
import '../home/models/chat_user_profile.dart';
import '../report/report_page.dart';
import '../wallet/wallet_page.dart';
import 'data/cash_gift_dto.dart';
import 'data/chats_list_controller.dart';
import 'data/emote_dto.dart';
import 'im_search_page.dart';
import 'models/chat_conversation.dart';
import 'widgets/album_selection_preview_page.dart';
import '../profile/album_photo_viewer_page.dart';

part 'widgets/chat_detail_models.dart';
part 'widgets/chat_detail_app_bar.dart';
part 'widgets/chat_detail_body.dart';
part 'widgets/chat_detail_input.dart';
part 'widgets/chat_detail_gift_sheet.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({
    super.key,
    required this.conversation,
    this.chatsController,
  });

  final ChatConversation conversation;

  /// 发送时同步列表（含左滑删除后重新出现）。
  final ChatsListController? chatsController;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _messagesScroll = ScrollController();
  final GlobalKey<_DmInputBarState> _inputBarKey = GlobalKey<_DmInputBarState>();

  /// 0 = 简介展开，1 = 简介收起（仅导航栏行）。
  late final AnimationController _introCollapse;

  /// 有 Moments 缩略图时简介更高；加大把手拖拽范围。
  static const double _introDragRange = 120;

  /// 本地 + 环信 1v1 历史。
  final List<_ChatLine> _messages = [];
  final Set<String> _seenMsgIds = {};
  final Map<String, GlobalKey> _messageItemKeys = {};
  StreamSubscription<ImChatMessage>? _imSub;
  bool _historyHasMore = true;
  bool _historyLoading = false;
  String _historyCursor = '';
  /// 首次打开后才允许上拉历史（避免与滚到底部竞态）。
  bool _allowHistoryLoadMore = false;

  late ChatConversation _conversation = widget.conversation;
  ChatUserProfile? _peerProfile;
  String? _selfAvatarUrl;
  bool _following = false;
  bool _blocked = false;
  /// 对方是否已将你拉黑。
  bool _blockedByPeer = false;
  bool _loadingPeer = true;
  String _peerEmUser = '';
  /// 后端数字用户 id（关注 / 拉黑 / 礼物）。与环信 id 不同。
  String _peerAppUid = '';

  String get _peerUid {
    final id = _conversation.id;
    if (id.startsWith('dm_')) return id.substring(3);
    if (id.startsWith('sys_')) return id.substring(4);
    return id;
  }

  /// 优先已解析的应用 uid；仅当会话 id 为数字时才回退。
  String get _relationUid {
    final fromProfile = (_peerProfile?.userId ?? '').trim();
    if (fromProfile.isNotEmpty) return fromProfile;
    final cached = _peerAppUid.trim();
    if (cached.isNotEmpty) return cached;
    final id = _peerUid.trim();
    if (RegExp(r'^\d+$').hasMatch(id)) return id;
    return '';
  }

  String get _imConversationId {
    if (_peerEmUser.isNotEmpty) return _peerEmUser;
    if (_conversation.emUserName.isNotEmpty) return _conversation.emUserName;
    return '';
  }

  /// 私聊发出消息的对端公共 attributes（对齐 forya toName / toAvatar / …）。
  ImPeerAttrs get _dmPeerAttrs {
    final peer = _peerProfile;
    final name = (peer?.nickname.trim().isNotEmpty ?? false)
        ? peer!.nickname.trim()
        : _conversation.title.trim();
    final avatar = (peer?.avatarUrl ?? _conversation.avatarUrl ?? '').trim();
    var gender = '';
    if (peer != null && peer.hasGender) {
      gender = peer.isMale ? 'male' : 'female';
    }
    return ImPeerAttrs(
      name: name,
      avatar: avatar,
      userid: _relationUid,
      gender: gender,
    );
  }

  @override
  void initState() {
    super.initState();
    _following = widget.conversation.isFollowing;
    _peerEmUser = widget.conversation.emUserName;
    _introCollapse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _imSub = ImService.messages.listen(_onImMessage);
    _messagesScroll.addListener(_onMessagesScroll);
    // 打开会话时清除列表角标 + 环信未读。
    widget.chatsController?.markRead(widget.conversation.id);
    final em = _imConversationId;
    widget.chatsController?.setActiveConversation(
      em.isNotEmpty ? em : widget.conversation.id,
    );
    if (em.isNotEmpty) {
      unawaited(ImService.markConversationRead(em));
    }
    unawaited(_loadFromApi());
  }

  Future<void> _loadFromApi() async {
    final rawId = _peerUid.trim();
    final rawEm = _peerEmUser.trim().isNotEmpty
        ? _peerEmUser.trim()
        : _conversation.emUserName.trim();
    var emHint = rawEm;
    if (emHint.isEmpty &&
        rawId.isNotEmpty &&
        !RegExp(r'^\d+$').hasMatch(rawId)) {
      emHint = rawId;
    }
    if (rawId.isEmpty && emHint.isEmpty) {
      if (mounted) setState(() => _loadingPeer = false);
      return;
    }

    try {
      // 会话 key 为环信用户名时解析数字应用 uid，并检测对方是否拉黑你。
      var appUid = RegExp(r'^\d+$').hasMatch(rawId) ? rawId : '';
      var blockedByPeer = false;
      if (emHint.isNotEmpty) {
        try {
          final msgRes = await AppApis.relation.msgUser(emHint);
          final brief = msgRes.data;
          final id = brief?.id.trim() ?? '';
          if (id.isNotEmpty) appUid = id;
          final resolvedEm = brief?.emUsername.trim() ?? '';
          if (resolvedEm.isNotEmpty) emHint = resolvedEm;
          blockedByPeer = brief?.isYourInBlackList ?? false;
        } catch (_) {}
      }
      if (appUid.isEmpty && RegExp(r'^\d+$').hasMatch(rawId)) {
        appUid = rawId;
      }
      // 该后端 user/info 接受数字 id 或 emUsername。
      final infoKey = appUid.isNotEmpty
          ? appUid
          : (emHint.isNotEmpty ? emHint : rawId);

      final peerFuture = infoKey.isNotEmpty
          ? AppApis.user.profileByUidOrNull(infoKey)
          : Future.value(ApiResult<ChatUserProfile?>.ok(null));
      final selfFuture = AppApis.user.profileOrNull();
      final peerRes = await peerFuture;
      final selfRes = await selfFuture;
      await ImService.connectFromServer();
      if (!mounted) return;

      final peer = peerRes.data;
      final self = selfRes.data;
      if (peer != null && peer.userId.isNotEmpty) {
        appUid = peer.userId;
      }
      var blocked = false;
      if (appUid.isNotEmpty) {
        final blackRes = await AppApis.relation.isBlocked(appUid);
        blocked = blackRes.data ?? false;
      }

      if (peer != null) {
        final em = peer.emUsername.isNotEmpty
            ? peer.emUsername
            : (_conversation.emUserName.isNotEmpty
                ? _conversation.emUserName
                : emHint);
        final updated = _conversation.copyWith(
          title: peer.nickname.isEmpty ? _conversation.title : peer.nickname,
          avatarUrl: peer.avatarUrl ?? _conversation.avatarUrl,
          isMale: peer.isMale,
          signature: peer.bio,
          zodiac: peer.zodiac,
          heightInches: peer.heightInches,
          weightLb: peer.weightLb,
          isFollowing: peer.isFollowing,
          isOnline: peer.isOnline,
          momentUrls: peer.momentUrls,
          momentAssets:
              peer.momentUrls.isEmpty ? _conversation.momentAssets : const [],
          emUserName: em,
        );
        setState(() {
          _peerProfile = peer;
          _conversation = updated;
          _following = peer.isFollowing;
          _blocked = blocked;
          _blockedByPeer = blockedByPeer;
          _selfAvatarUrl = self?.avatarUrl;
          _peerEmUser = em;
          _peerAppUid = appUid;
          _loadingPeer = false;
        });
        widget.chatsController?.setActiveConversation(em);
        widget.chatsController?.upsertPrivateChat(updated);
        if (em.isNotEmpty) unawaited(_loadImHistory(em));
      } else {
        setState(() {
          _peerAppUid = appUid;
          _blocked = blocked;
          _blockedByPeer = blockedByPeer;
          _selfAvatarUrl = self?.avatarUrl;
          if (emHint.isNotEmpty) _peerEmUser = emHint;
          _loadingPeer = false;
        });
        if (emHint.isNotEmpty) {
          widget.chatsController?.setActiveConversation(emHint);
          unawaited(_loadImHistory(emHint));
        }
      }
    } catch (error) {
      debugPrint('load chat profile failed: $error');
      if (!mounted) return;
      setState(() => _loadingPeer = false);
      final em = _imConversationId;
      if (em.isNotEmpty) unawaited(_loadImHistory(em));
    }
  }

  Future<void> _loadImHistory(String peerEm, {bool loadMore = false}) async {
    if (_historyLoading) return;
    if (loadMore && !_historyHasMore) return;

    final cursor = loadMore ? _historyCursor : '';
    setState(() => _historyLoading = true);
    try {
      final page = await ImService.loadHistory(
        peerEm,
        startMsgId: cursor,
        count: 20,
      );
      if (!mounted) return;

      final beforePixels =
          loadMore && _messagesScroll.hasClients ? _messagesScroll.position.pixels : 0.0;
      final beforeMax = loadMore && _messagesScroll.hasClients
          ? _messagesScroll.position.maxScrollExtent
          : 0.0;

      final added = <_ChatLine>[];
      for (final m in page.messages) {
        if (m.msgType == 'follow' || m.msgType == 'ignored') continue;
        if (m.isSdkRecall) continue;
        if (m.msgType == 'txt' && m.text.trim().isEmpty) continue;
        if (m.id.isNotEmpty && !_seenMsgIds.add(m.id)) continue;
        added.add(_lineFromIm(m));
      }

      setState(() {
        if (loadMore) {
          _messages.insertAll(0, added);
        } else {
          _messages.addAll(added);
        }
        if (loadMore && added.isEmpty) {
          _historyHasMore = false;
        } else {
          _historyHasMore = page.hasMore;
        }
        _historyLoading = false;
        if (_messages.isNotEmpty) {
          final oldest = _messages.first.msgId;
          if (oldest.isNotEmpty) _historyCursor = oldest;
        }
      });

      if (!loadMore) {
        _scrollToBottom(force: true);
        return;
      }
      if (added.isEmpty) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_messagesScroll.hasClients) return;
        final afterMax = _messagesScroll.position.maxScrollExtent;
        final delta = afterMax - beforeMax;
        _messagesScroll.jumpTo(beforePixels + delta);
      });
    } catch (error) {
      debugPrint('loadImHistory failed: $error');
      if (!mounted) return;
      setState(() => _historyLoading = false);
    }
  }

  void _onMessagesScroll() {
    if (!_allowHistoryLoadMore) return;
    if (!_messagesScroll.hasClients) return;
    if (_historyLoading || !_historyHasMore) return;
    final peerEm = _imConversationId;
    if (peerEm.isEmpty) return;
    // 接近顶部 → 加载更早消息。
    if (_messagesScroll.position.pixels <= 64) {
      unawaited(_loadImHistory(peerEm, loadMore: true));
    }
  }

  void _backfillSelfLineFromIm(ImChatMessage m) {
    if (!m.isSelf || m.id.isEmpty) return;
    final next = _lineFromIm(m);
    for (var i = _messages.length - 1; i >= 0; i--) {
      final e = _messages[i];
      if (e.side != _ChatSide.self || e.msgId.isNotEmpty || e.kind != next.kind) {
        continue;
      }
      switch (next.kind) {
        case _ChatLineKind.text:
          if (e.text != next.text) continue;
        case _ChatLineKind.voice:
          if (e.voiceSeconds != next.voiceSeconds) continue;
        case _ChatLineKind.image:
        case _ChatLineKind.emote:
          break;
        default:
          continue;
      }
      final effectiveMs = m.serverTimeMs > 0
          ? m.serverTimeMs
          : (e.serverTimeMs > 0
              ? e.serverTimeMs
              : DateTime.now().millisecondsSinceEpoch);
      _messages[i] = e.copyWith(
        msgId: m.id,
        serverTimeMs: effectiveMs,
        mediaSource: next.mediaSource.isNotEmpty ? next.mediaSource : e.mediaSource,
      );
      return;
    }
  }

  void _onImMessage(ImChatMessage m) {
    final convId = _imConversationId;
    if (convId.isEmpty) return;
    final match = m.conversationId == convId ||
        m.from == convId ||
        m.to == convId;
    if (!match) return;
    // 关注提示不在私聊消息流中展示。
    if (m.msgType == 'follow' || m.msgType == 'ignored') return;

    // SDK 撤回：只删掉原气泡。提示文案来自 forya 的 `im_recall_message`。
    if (m.isSdkRecall) {
      final recalledId = m.id.trim();
      if (recalledId.isEmpty || !mounted) return;
      setState(() {
        _messages.removeWhere((e) => e.msgId == recalledId);
        _seenMsgIds.remove(recalledId);
      });
      return;
    }

    if (m.msgType == 'recall') {
      if (m.id.isNotEmpty && !_seenMsgIds.add(m.id)) return;
      if (!mounted) return;
      setState(() => _messages.add(_lineFromIm(m)));
      _scrollToBottom();
      return;
    }

    if (m.id.isNotEmpty && _seenMsgIds.contains(m.id)) {
      if (!mounted) return;
      setState(() {
        final idx = _messages.indexWhere((e) => e.msgId == m.id);
        if (idx >= 0 &&
            m.serverTimeMs > 0 &&
            _messages[idx].serverTimeMs == 0) {
          _messages[idx] =
              _messages[idx].copyWith(serverTimeMs: m.serverTimeMs);
          return;
        }
        _backfillSelfLineFromIm(m);
      });
      return;
    }

    if (m.id.isNotEmpty && !_seenMsgIds.add(m.id)) return;
    if (!mounted) return;
    final nextLine = _lineFromIm(m);
    setState(() {
      // EaseMob 可能会发生 msgId 回填/替换（临时 id -> server id）。
      if (nextLine.side == _ChatSide.self) {
        final idx = _messages.lastIndexWhere((e) {
          if (e.side != _ChatSide.self || e.kind != nextLine.kind) return false;
          if (e.msgId.isNotEmpty && e.msgId == nextLine.msgId) return false;
          switch (nextLine.kind) {
            case _ChatLineKind.text:
              return e.text == nextLine.text;
            case _ChatLineKind.voice:
              return e.voiceSeconds == nextLine.voiceSeconds &&
                  e.msgId.isEmpty;
            case _ChatLineKind.image:
            case _ChatLineKind.emote:
              return e.msgId.isEmpty;
            default:
              return false;
          }
        });
        if (idx >= 0) {
          final oldId = _messages[idx].msgId;
          if (oldId.isNotEmpty) _seenMsgIds.remove(oldId);
          if (nextLine.msgId.isNotEmpty) _seenMsgIds.add(nextLine.msgId);
          final prev = _messages[idx];
          final effectiveMs = nextLine.serverTimeMs > 0
              ? nextLine.serverTimeMs
              : (prev.serverTimeMs > 0
                  ? prev.serverTimeMs
                  : DateTime.now().millisecondsSinceEpoch);
          final keepLocalMedia = nextLine.kind == _ChatLineKind.image ||
              nextLine.kind == _ChatLineKind.emote;
          _messages[idx] = nextLine.copyWith(
            serverTimeMs: effectiveMs,
            mediaSource: keepLocalMedia && prev.mediaSource.trim().isNotEmpty
                ? prev.mediaSource
                : nextLine.mediaSource,
            imageAssets: keepLocalMedia && prev.imageAssets.isNotEmpty
                ? prev.imageAssets
                : nextLine.imageAssets,
          );
          _scrollToBottom();
          return;
        }
      }
      _messages.add(nextLine);
    });
    // 列表预览 / 未读：ChatsListController 监听 ImService.messages。
    _scrollToBottom();
  }

  _ChatLine _lineFromIm(ImChatMessage m) {
    final side = m.isSelf ? _ChatSide.self : _ChatSide.peer;
    final media = m.playableOrDisplayUrl;
    switch (m.msgType) {
      case 'image':
        return _ChatLine(
          side: side,
          kind: _ChatLineKind.image,
          mediaSource: media,
          imageAssets: media.isEmpty ? const [] : [media],
          text: m.text,
          serverTimeMs: m.serverTimeMs,
          msgId: m.id,
          failed: m.failed,
        );
      case 'voice':
        return _ChatLine(
          side: side,
          kind: _ChatLineKind.voice,
          voiceSeconds: m.durationSecs > 0 ? m.durationSecs : 1,
          mediaSource: media,
          text: m.text,
          serverTimeMs: m.serverTimeMs,
          msgId: m.id,
          failed: m.failed,
        );
      case 'gift':
        return _ChatLine(
          side: side,
          kind: _ChatLineKind.gift,
          giftId: m.giftId,
          giftQty: m.giftQty,
          giftName: m.giftName,
          giftIconUrl: m.giftIconUrl,
          text: m.text,
          serverTimeMs: m.serverTimeMs,
          msgId: m.id,
          failed: m.failed,
        );
      case 'emote':
        return _ChatLine(
          side: side,
          kind: _ChatLineKind.emote,
          emoteUrl: m.emoteUrl.isNotEmpty ? m.emoteUrl : media,
          emoteName: m.emoteName,
          mediaSource: m.emoteUrl.isNotEmpty ? m.emoteUrl : media,
          text: m.text,
          serverTimeMs: m.serverTimeMs,
          msgId: m.id,
          failed: m.failed,
        );
      case 'recall':
        return _ChatLine(
          side: side,
          kind: _ChatLineKind.tip,
          text: m.text.trim().isNotEmpty
              ? m.text
              : (m.isSelf
                  ? 'You recalled a message.'
                  : 'The sender recalled a message.'),
          serverTimeMs: m.serverTimeMs,
          msgId: m.id,
        );
      default:
        return _ChatLine(
          side: side,
          text: m.text,
          serverTimeMs: m.serverTimeMs,
          msgId: m.id,
          failed: m.failed,
          quoteMsgId: m.quoteMsgId,
          quoteShowText: m.quoteShowText,
          quoteSendName: m.quoteSendName,
        );
    }
  }

  @override
  void dispose() {
    widget.chatsController?.setActiveConversation(null);
    unawaited(_imSub?.cancel() ?? Future<void>.value());
    _introCollapse.dispose();
    _inputController.dispose();
    _messagesScroll.removeListener(_onMessagesScroll);
    _messagesScroll.dispose();
    super.dispose();
  }

  void _onIntroDragUpdate(DragUpdateDetails details) {
    final next = (_introCollapse.value - details.delta.dy / _introDragRange)
        .clamp(0.0, 1.0);
    _introCollapse.value = next;
  }

  void _onIntroDragEnd(DragEndDetails details) {
    final v = details.primaryVelocity ?? 0;
    if (v < -280) {
      _introCollapse.animateTo(1, curve: Curves.easeOutCubic);
    } else if (v > 280) {
      _introCollapse.animateTo(0, curve: Curves.easeOutCubic);
    } else {
      _introCollapse.animateTo(
        _introCollapse.value >= 0.5 ? 1 : 0,
        curve: Curves.easeOutCubic,
      );
    }
  }

  /// 环信拉黑错误码 210，或描述含 block/blacklist。
  bool _isPeerBlockSendError(Object error) {
    if (error is EMError && error.code == 210) return true;
    final s = '$error'.toLowerCase();
    return s.contains('blacklist') ||
        s.contains('in block') ||
        s.contains('been blocked') ||
        s.contains('code: 210') ||
        s.contains('code=210');
  }

  void _toastBlockedByPeer() {
    showCenterToast(context, message: 'You have been blocked.');
  }

  void _toastYouBlockedPeer() {
    showCenterToast(context, message: 'The user has been blocked by you.');
  }

  /// 发送前关系检查。返回 false 表示不应继续发 IM。
  /// 被对方拉黑时会插入一条失败气泡、写入本地环信库并 toast。
  bool _guardRelationBeforeSend({_ChatLine? failedLine}) {
    if (_blocked) {
      _toastYouBlockedPeer();
      return false;
    }
    if (_blockedByPeer) {
      _toastBlockedByPeer();
      if (failedLine != null) {
        setState(() {
          _messages.add(failedLine.copyWith(failed: true));
        });
        _afterSend(failedLine.listPreview);
        unawaited(_persistFailedLine(failedLine));
      }
      return false;
    }
    return true;
  }

  Future<void> _persistFailedLine(_ChatLine line) async {
    final peer = _imConversationId;
    if (peer.isEmpty) return;
    try {
      ImChatMessage? saved;
      switch (line.kind) {
        case _ChatLineKind.image:
          saved = await ImService.appendFailedImage(
            peerEmUsername: peer,
            filePath: line.displayMedia,
            peer: _dmPeerAttrs,
          );
        case _ChatLineKind.voice:
          saved = await ImService.appendFailedVoice(
            peerEmUsername: peer,
            filePath: line.mediaSource,
            durationSecs: line.voiceSeconds,
            peer: _dmPeerAttrs,
          );
        case _ChatLineKind.emote:
          saved = await ImService.appendFailedText(
            peerEmUsername: peer,
            content: line.text.isEmpty ? '[Sticker]' : line.text,
            peer: _dmPeerAttrs,
            extra: {
              'type': 'emote',
              'emote': {
                'desc': line.emoteName,
                'url': line.emoteUrl.isNotEmpty ? line.emoteUrl : line.mediaSource,
              },
            },
          );
        case _ChatLineKind.text:
        case _ChatLineKind.gift:
        case _ChatLineKind.tip:
          saved = await ImService.appendFailedText(
            peerEmUsername: peer,
            content: line.text,
            peer: _dmPeerAttrs,
          );
      }
      final id = saved?.id ?? '';
      if (id.isEmpty || !mounted) return;
      _seenMsgIds.add(id);
      setState(() {
        for (var i = _messages.length - 1; i >= 0; i--) {
          final m = _messages[i];
          if (m.side != _ChatSide.self || !m.failed || m.msgId.isNotEmpty) {
            continue;
          }
          if (m.kind == line.kind && m.listPreview == line.listPreview) {
            _messages[i] = m.copyWith(msgId: id);
            break;
          }
        }
      });
    } catch (error) {
      debugPrint('persist failed line: $error');
    }
  }

  Future<bool> _refreshBlockedByPeer() async {
    final em = _imConversationId;
    if (em.isEmpty) return _blockedByPeer;
    try {
      final msgRes = await AppApis.relation.msgUser(em);
      final blocked = msgRes.data?.isYourInBlackList ?? _blockedByPeer;
      if (mounted) setState(() => _blockedByPeer = blocked);
      return blocked;
    } catch (_) {
      return _blockedByPeer;
    }
  }

  Future<void> _onFailedTap(int index) async {
    if (index < 0 || index >= _messages.length) return;
    final line = _messages[index];
    if (!line.failed || line.side != _ChatSide.self) return;

    if (_blocked) {
      if (!mounted) return;
      await AppTipDialog.alert(
        context,
        message: 'The user has been blocked by you.',
      );
      return;
    }

    final stillBlocked = await _refreshBlockedByPeer();
    if (!mounted) return;
    if (stillBlocked) {
      await AppTipDialog.alert(
        context,
        message: 'You have been blocked.',
      );
      return;
    }

    await _resendFailedAt(index);
  }

  Future<void> _onMessageLongPress(_ChatLine line, Rect anchor) async {
    if (line.kind == _ChatLineKind.gift || line.kind == _ChatLineKind.tip) {
      return;
    }

    final isGroup = widget.conversation.badge == ChatBadgeType.group;
    // 对齐原版 forya：
    //   Copy：仅文本；replay / recall / delete：文本、图片、语音
    //   Recall：自己发的 + 距 serverTime < 60 秒 + 有 msgId
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final withinRecallWindow =
        line.serverTimeMs > 0 && nowMs - line.serverTimeMs < 60 * 1000;
    final canCopy =
        line.kind == _ChatLineKind.text && line.text.trim().isNotEmpty;
    final canReplay = canCopy ||
        line.kind == _ChatLineKind.voice ||
        line.kind == _ChatLineKind.image ||
        line.kind == _ChatLineKind.emote;
    final actions = <ChatMessageAction>[
      if (canCopy) ChatMessageAction.copy,
      if (canReplay) ChatMessageAction.replay,
      if (line.side == _ChatSide.self &&
          line.msgId.isNotEmpty &&
          withinRecallWindow)
        ChatMessageAction.recall,
      ChatMessageAction.delete,
    ];
    if (actions.isEmpty) return;

    final action = await ChatMessageActionPopup.show(
      context: context,
      anchor: anchor,
      actions: actions,
    );
    if (!mounted || action == null) return;

    switch (action) {
      case ChatMessageAction.copy:
        await Clipboard.setData(ClipboardData(text: line.text));
        showCenterToast(context, message: 'Saved to the clipboard');
        return;
      case ChatMessageAction.replay:
        final sendName = line.side == _ChatSide.self
            ? 'You'
            : widget.conversation.title.trim();
        _inputBarKey.currentState?.setQuote(
          ImQuoteMsg(
            msgId: line.msgId,
            showText: line.listPreview,
            sendName: sendName.isEmpty ? 'User' : sendName,
          ),
        );
        return;
      case ChatMessageAction.recall:
        final recallId = line.msgId.trim();
        if (recallId.isEmpty) {
          showCenterToast(context, message: 'Cannot recall: missing msgId');
          return;
        }
        final ok = await ImService.recallMessage(recallId);
        if (!mounted) return;
        if (!ok) {
          showCenterToast(context, message: 'Recall failed');
          return;
        }
        setState(() {
          _messages.removeWhere((m) => m.msgId == recallId);
          _seenMsgIds.remove(recallId);
        });
        unawaited(
          ImService.sendRecallNotice(
            conversationId: _imConversationId,
            isGroup: isGroup,
          ),
        );
        return;
      case ChatMessageAction.delete:
        final deleteId = line.msgId.trim();
        if (deleteId.isEmpty) {
          // 本地消息（尚无 msgId）直接从列表移除。
          final idx = _messages.indexOf(line);
          if (idx >= 0) setState(() => _messages.removeAt(idx));
          return;
        }
        await ImService.deleteMessage(
          conversationId: _imConversationId,
          isGroup: isGroup,
          messageId: deleteId,
        );
        if (!mounted) return;
        setState(() {
          _messages.removeWhere((m) => m.msgId == deleteId);
          _seenMsgIds.remove(deleteId);
        });
        return;
    }
  }

  Future<void> _resendFailedAt(int index) async {
    if (index < 0 || index >= _messages.length) return;
    final line = _messages[index];
    final peer = _imConversationId;
    if (peer.isEmpty) {
      showCenterToast(context, message: 'Cannot resend: peer IM account missing');
      return;
    }

    // 从原位置移除；成功后追加到底部（不是仅去掉感叹号）。
    setState(() {
      _messages.removeAt(index);
    });

    try {
      ImChatMessage? sent;
      if (line.msgId.isNotEmpty) {
        try {
          sent = await ImService.resendFailed(
            peerEmUsername: peer,
            msgId: line.msgId,
          );
        } catch (_) {
          sent = null;
        }
      }
      sent ??= switch (line.kind) {
        _ChatLineKind.image => await ImService.sendImage(
            peerEmUsername: peer,
            filePath: line.displayMedia,
            sendOriginalImage: true,
            peer: _dmPeerAttrs,
          ),
        _ChatLineKind.voice => await ImService.sendVoice(
            peerEmUsername: peer,
            filePath: line.mediaSource,
            durationSecs: line.voiceSeconds > 0 ? line.voiceSeconds : 1,
            peer: _dmPeerAttrs,
          ),
        _ChatLineKind.emote => await ImService.sendText(
            peerEmUsername: peer,
            content: line.text.isEmpty ? '[Sticker]' : line.text,
            peer: _dmPeerAttrs,
            extra: {
              'type': 'emote',
              'emote': {
                'desc': line.emoteName,
                'url':
                    line.emoteUrl.isNotEmpty ? line.emoteUrl : line.mediaSource,
              },
            },
          ),
        _ChatLineKind.text ||
        _ChatLineKind.gift ||
        _ChatLineKind.tip =>
          await ImService.sendText(
            peerEmUsername: peer,
            content: line.text,
            peer: _dmPeerAttrs,
          ),
      };

      if (!mounted) return;
      if (sent != null && sent.id.isNotEmpty) {
        _seenMsgIds.add(sent.id);
        setState(() {
          _messages.add(_lineFromIm(sent!).copyWith(failed: false));
        });
        _afterSend(line.listPreview);
      } else {
        setState(() {
          _messages.add(line.copyWith(failed: true));
        });
        _scrollToBottom();
        showCenterToast(
          context,
          message: 'Message failed to send',
        );
      }
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _messages.add(line.copyWith(failed: true));
      });
      _scrollToBottom();
      if (_isPeerBlockSendError(error)) {
        _blockedByPeer = true;
        await AppTipDialog.alert(
          context,
          message: 'You have been blocked.',
        );
      } else {
        showCenterToast(
          context,
          message: 'Message failed to send',
        );
      }
    }
  }

  void _markLastSelfFailed({int count = 1}) {
    var left = count;
    setState(() {
      for (var i = _messages.length - 1; i >= 0 && left > 0; i--) {
        if (_messages[i].side != _ChatSide.self) continue;
        _messages[i] = _messages[i].copyWith(failed: true);
        left--;
      }
    });
  }

  void _onSendError(Object error, {int failedCount = 1}) {
    if (!mounted) return;
    if (_isPeerBlockSendError(error)) {
      _blockedByPeer = true;
      _toastBlockedByPeer();
      _markLastSelfFailed(count: failedCount);
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Send failed: $error'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _sendMessage([String? raw]) async {
    final text = (raw ?? _inputController.text).trim();
    if (text.isEmpty) {
      if (!mounted) return;
      showCenterToast(context, message: 'The message cannot be empty!');
      return;
    }

    final failedLine = _ChatLine(side: _ChatSide.self, text: text);
    if (!_guardRelationBeforeSend(failedLine: failedLine)) {
      _inputController.clear();
      return;
    }
    _inputController.clear();
    final quote = _inputBarKey.currentState?.takeQuote();

    final peerEm = _imConversationId;
    if (peerEm.isNotEmpty) {
      try {
        final sent = await ImService.sendText(
          peerEmUsername: peerEm,
          content: text,
          quote: quote,
          peer: _dmPeerAttrs,
        );
        final sentId = sent?.id ?? '';
        final sentAtMs = sent?.serverTimeMs ?? 0;
        final effectiveAtMs =
            sentAtMs > 0 ? sentAtMs : DateTime.now().millisecondsSinceEpoch;
        if (sentId.isNotEmpty) _seenMsgIds.add(sentId);
        if (!mounted) return;
        setState(() {
          final existingIdx = sentId.isNotEmpty
              ? _messages.indexWhere((e) => e.msgId == sentId)
              : -1;
          if (existingIdx >= 0) {
            if (_messages[existingIdx].serverTimeMs == 0) {
              _messages[existingIdx] = _messages[existingIdx].copyWith(
                serverTimeMs: effectiveAtMs,
              );
            }
            return;
          }
          _messages.add(
            _ChatLine(
              side: _ChatSide.self,
              text: text,
              msgId: sentId,
              serverTimeMs: effectiveAtMs,
              quoteMsgId: quote?.msgId ?? '',
              quoteShowText: quote?.showText ?? '',
              quoteSendName: quote?.sendName ?? '',
            ),
          );
        });
        _afterSend(text);
        return;
      } catch (error) {
        if (!mounted) return;
        setState(() {
          _messages.add(
            _ChatLine(side: _ChatSide.self, text: text, failed: true),
          );
        });
        _afterSend(text);
        if (_isPeerBlockSendError(error)) {
          _blockedByPeer = true;
          _toastBlockedByPeer();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Send failed: $error'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
        return;
      }
    }

    // 尚无 emUserName — 仅本地回退。
    setState(() {
      _messages.add(_ChatLine(side: _ChatSide.self, text: text));
    });
    _afterSend(text);
  }

  Future<void> _sendEmote(EmotePack pack, EmoteSticker sticker) async {
    final url = sticker.url.trim().isNotEmpty
        ? sticker.url.trim()
        : sticker.showUrl.trim();
    if (url.isEmpty) return;
    final name = sticker.name.trim();
    final preview = name.isEmpty ? '[Sticker]' : '[$name]';
    final line = _ChatLine(
      side: _ChatSide.self,
      kind: _ChatLineKind.emote,
      emoteUrl: url,
      emoteName: name,
      mediaSource: url,
      text: preview,
    );
    if (!_guardRelationBeforeSend(failedLine: line)) return;

    setState(() {
      _messages.add(line);
    });
    _afterSend(preview);

    final peerEm = _imConversationId;
    if (peerEm.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cannot send sticker: peer IM account missing'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    try {
      final sent = await ImService.sendEmote(
        peerEmUsername: peerEm,
        packId: pack.id,
        stickerId: sticker.id,
        name: name,
        url: url,
        peer: _dmPeerAttrs,
      );
      if (sent != null && sent.id.isNotEmpty) {
        _seenMsgIds.add(sent.id);
      }
    } catch (error) {
      _onSendError(error);
    }
  }

  Future<void> _sendVoice(String path, int seconds) async {
    if (seconds <= 0) return;
    final peerEm = _imConversationId;
    final localPath = path.trim();
    final line = _ChatLine(
      side: _ChatSide.self,
      kind: _ChatLineKind.voice,
      voiceSeconds: seconds,
      mediaSource: localPath,
    );
    if (!_guardRelationBeforeSend(failedLine: line)) return;

    // 立即乐观更新 UI。
    setState(() {
      _messages.add(line);
    });
    _afterSend('[Voice] $seconds"');

    if (peerEm.isEmpty || localPath.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            peerEm.isEmpty
                ? 'Cannot send voice: peer IM account missing'
                : 'Cannot send voice: recording file missing',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    try {
      final sent = await ImService.sendVoice(
        peerEmUsername: peerEm,
        filePath: localPath,
        durationSecs: seconds,
        peer: _dmPeerAttrs,
      );
      if (sent != null && sent.id.isNotEmpty) {
        _seenMsgIds.add(sent.id);
        final playable = sent.playableOrDisplayUrl;
        if (!mounted) return;
        setState(() {
          for (var i = _messages.length - 1; i >= 0; i--) {
            final m = _messages[i];
            if (m.kind != _ChatLineKind.voice ||
                m.side != _ChatSide.self ||
                m.msgId.isNotEmpty) {
              continue;
            }
            _messages[i] = m.copyWith(
              msgId: sent.id,
              mediaSource: playable.isNotEmpty ? playable : localPath,
            );
            break;
          }
        });
      }
    } catch (error) {
      _onSendError(error);
    }
  }

  void _applyImageSendAck(ImChatMessage sent, {required String localPath}) {
    if (sent.id.isEmpty) return;
    _seenMsgIds.add(sent.id);
    final effectiveAtMs = sent.serverTimeMs > 0
        ? sent.serverTimeMs
        : DateTime.now().millisecondsSinceEpoch;
    final remote = sent.playableOrDisplayUrl.trim();

    setState(() {
      final existingIdx = _messages.indexWhere((e) => e.msgId == sent.id);
      if (existingIdx >= 0) {
        if (_messages[existingIdx].serverTimeMs == 0) {
          _messages[existingIdx] = _messages[existingIdx].copyWith(
            serverTimeMs: effectiveAtMs,
          );
        }
        return;
      }

      var targetIdx = -1;
      for (var i = _messages.length - 1; i >= 0; i--) {
        final m = _messages[i];
        if (m.kind != _ChatLineKind.image ||
            m.side != _ChatSide.self ||
            m.msgId.isNotEmpty) {
          continue;
        }
        final src = m.mediaSource.trim();
        final asset =
            m.imageAssets.isNotEmpty ? m.imageAssets.first.trim() : '';
        if (src == localPath || asset == localPath) {
          targetIdx = i;
          break;
        }
      }
      if (targetIdx < 0) {
        targetIdx = _messages.lastIndexWhere(
          (m) =>
              m.kind == _ChatLineKind.image &&
              m.side == _ChatSide.self &&
              m.msgId.isEmpty,
        );
      }
      if (targetIdx < 0) return;
      final m = _messages[targetIdx];
      _messages[targetIdx] = m.copyWith(
        msgId: sent.id,
        serverTimeMs: effectiveAtMs,
        mediaSource: remote.isNotEmpty ? remote : m.mediaSource,
      );
    });
  }

  Future<void> _sendImages(List<String> paths) async {
    if (paths.isEmpty) return;
    final peerEm = _imConversationId;
    final files = paths.map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    if (files.isEmpty) return;

    final lines = [
      for (final path in files)
        _ChatLine(
          side: _ChatSide.self,
          kind: _ChatLineKind.image,
          mediaSource: path,
          imageAssets: [path],
        ),
    ];
    if (!_guardRelationBeforeSend(failedLine: lines.first)) {
      // 多图时把其余也标为失败气泡。
      if (_blockedByPeer && lines.length > 1) {
        setState(() {
          for (var i = 1; i < lines.length; i++) {
            _messages.add(lines[i].copyWith(failed: true));
          }
        });
      }
      return;
    }

    // 对每个路径做乐观 UI（文件或临时资源导出）。
    setState(() {
      _messages.addAll(lines);
    });
    final n = files.length;
    _afterSend(n <= 1 ? '[Image]' : '[Image ×$n]');

    if (peerEm.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cannot send image: peer IM account missing'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    var failIndex = 0;
    for (final path in files) {
      try {
        final sent = await ImService.sendImage(
          peerEmUsername: peerEm,
          filePath: path,
          sendOriginalImage: true,
          peer: _dmPeerAttrs,
        );
        if (sent != null && sent.id.isNotEmpty) {
          if (!mounted) return;
          _applyImageSendAck(sent, localPath: path);
        }
        failIndex++;
      } catch (error) {
        if (!mounted) return;
        // 从当前失败图起，把剩余乐观气泡标失败。
        final remaining = files.length - failIndex;
        _onSendError(error, failedCount: remaining);
        return;
      }
    }
  }

  void _sendGift(_GiftSendResult gift) {
    setState(() {
      _messages.add(
        _ChatLine(
          side: _ChatSide.self,
          kind: _ChatLineKind.gift,
          giftId: gift.id,
          giftQty: gift.qty,
          giftEmoji: gift.emoji,
          giftName: gift.name,
          giftIconUrl: gift.iconUrl,
        ),
      );
    });
    _afterSend(
      gift.name.isEmpty
          ? '[Gift] ${gift.id} x${gift.qty}'
          : '[Gift] ${gift.name} x${gift.qty}',
    );
  }

  void _afterSend(String lastMessage) {
    widget.chatsController?.onNewMessage(
      id: _conversation.id,
      title: _conversation.title,
      avatarAsset: _conversation.avatarAsset,
      avatarUrl: _conversation.avatarUrl,
      lastMessage: lastMessage,
      badge: _conversation.badge == ChatBadgeType.group
          ? ChatBadgeType.none
          : _conversation.badge,
      isMale: _conversation.isMale,
      signature: _conversation.signature,
      zodiac: _conversation.zodiac,
      isFollowing: _following,
    );
    _scrollToBottom();
  }

  GlobalKey _messageKeyFor(String msgId) {
    return _messageItemKeys.putIfAbsent(msgId, GlobalKey.new);
  }

  /// 对齐 forya `chatController.scrollToMsg`：点击引用条定位原消息。
  void _scrollToQuotedMessage(String msgId) {
    final id = msgId.trim();
    if (id.isEmpty) return;
    final index = _messages.indexWhere((e) => e.msgId == id);
    if (index < 0) return;

    bool ensureVisible() {
      final key = _messageItemKeys[id];
      final ctx = key?.currentContext;
      if (ctx == null || !ctx.mounted) return false;
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: 0.35,
      );
      return true;
    }

    if (ensureVisible()) return;
    if (!_messagesScroll.hasClients) return;

    final pos = _messagesScroll.position;
    final ratio = (index + 1) / _messages.length;
    _messagesScroll.jumpTo(
      (ratio * pos.maxScrollExtent).clamp(0.0, pos.maxScrollExtent),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (ensureVisible()) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) ensureVisible();
      });
    });
  }

  void _scrollToBottom({bool force = false, bool animated = false}) {
    void jump({required bool animate}) {
      if (!mounted || !_messagesScroll.hasClients) return;
      final max = _messagesScroll.position.maxScrollExtent;
      // 内容短于视口：停在 0，使消息落在把手下方。
      if (max <= 0) return;
      if (animate) {
        _messagesScroll.animateTo(
          max,
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOut,
        );
      } else {
        _messagesScroll.jumpTo(max);
      }
    }

    if (force) {
      _allowHistoryLoadMore = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        jump(animate: false);
        var left = 8;
        void retry() {
          Future<void>.delayed(const Duration(milliseconds: 50), () {
            if (!mounted) return;
            jump(animate: false);
            left -= 1;
            if (left > 0) {
              retry();
            } else {
              _allowHistoryLoadMore = true;
            }
          });
        }
        retry();
      });
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      jump(animate: animated);
    });
  }

  Future<void> _toggleFollow() async {
    final uid = _relationUid;
    if (uid.isEmpty) {
      showCenterToast(
        context,
        message: 'Follow failed: user id not ready',
      );
      return;
    }
    final prev = _following;
    setState(() => _following = !prev);
    try {
      final res = prev
          ? await AppApis.relation.unfollow(uid)
          : await AppApis.relation.follow(uid);
      if (!mounted) return;
      if (!res.ok) {
        setState(() => _following = prev);
        showCenterToast(
          context,
          message: res.message.isEmpty ? 'Follow failed' : res.message,
        );
        return;
      }
      setState(() {
        _conversation = _conversation.copyWith(isFollowing: _following);
      });
      widget.chatsController?.upsertPrivateChat(_conversation);
      if (_following) {
        showCenterToast(context, message: 'Followed');
      }
    } catch (error) {
      if (!mounted) return;
      setState(() => _following = prev);
      showCenterToast(context, message: 'Follow failed: $error');
    }
  }

  Future<void> _openMoreMenu() async {
    final action = await AppActionBottomSheet.show<_DmMoreAction>(
      context: context,
      buildItems: (sheetContext) => [
        AppActionSheetItem(
          label: 'Search',
          onTap: () => Navigator.of(sheetContext).pop(_DmMoreAction.search),
        ),
        AppActionSheetItem(
          label: _following ? 'Unfollow' : 'Follow',
          onTap: () => Navigator.of(sheetContext).pop(_DmMoreAction.follow),
        ),
        AppActionSheetItem(
          label: _blocked ? 'Unblock' : 'Block',
          destructive: !_blocked,
          onTap: () => Navigator.of(sheetContext).pop(_DmMoreAction.block),
        ),
        AppActionSheetItem(
          label: 'Report',
          destructive: true,
          onTap: () => Navigator.of(sheetContext).pop(_DmMoreAction.report),
        ),
      ],
    );
    if (!mounted || action == null) return;
    switch (action) {
      case _DmMoreAction.search:
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => ImSearchPage(
              chatsController: widget.chatsController,
              scopeConversation: _conversation,
            ),
          ),
        );
      case _DmMoreAction.follow:
        await _toggleFollow();
      case _DmMoreAction.block:
        await _toggleBlock();
      case _DmMoreAction.report:
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => ReportPage(
              reportedId: _relationUid,
              targetKind: ReportTargetKind.user,
            ),
          ),
        );
      case _DmMoreAction.cancel:
        break;
    }
  }

  Future<void> _toggleBlock() async {
    final uid = _relationUid;
    if (uid.isEmpty) {
      showCenterToast(
        context,
        message: 'Block failed: user id not ready',
      );
      return;
    }

    if (_blocked) {
      try {
        final res = await AppApis.relation.setBlackList(
          userId: uid,
          isCancel: true,
        );
        if (!mounted) return;
        if (!res.ok) {
          showCenterToast(
            context,
            message: res.message.isEmpty ? 'Unblock failed' : res.message,
          );
          return;
        }
        setState(() => _blocked = false);
        showCenterToast(
          context,
          message: 'The user is removed from the block list.',
        );
      } catch (error) {
        if (!mounted) return;
        showCenterToast(context, message: 'Unblock failed: $error');
      }
      return;
    }

    final confirmed = await AppTipDialog.confirmBlockUser(context);
    if (!mounted || !confirmed) return;
    try {
      final res = await AppApis.relation.setBlackList(
        userId: uid,
        isCancel: false,
      );
      if (!mounted) return;
      if (!res.ok) {
        showCenterToast(
          context,
          message: res.message.isEmpty ? 'Block failed' : res.message,
        );
        return;
      }
      setState(() => _blocked = true);
      showCenterToast(context, message: 'The other user has been blocked.');
    } catch (error) {
      if (!mounted) return;
      showCenterToast(context, message: 'Block failed: $error');
    }
  }

  void _openPeerProfile() {
    final base = _peerProfile;
    final uid = _relationUid.isNotEmpty ? _relationUid : _peerUid;
    final profile = (base ??
            ChatUserProfile(
              id: uid,
              nickname: _conversation.title,
              userId: uid,
              avatarAsset: _conversation.avatarAsset,
              avatarUrl: _conversation.avatarUrl,
              isMale: _conversation.isMale,
              age: 0,
              zodiac: _conversation.zodiac,
              level: 1,
              bio: _conversation.signature,
              isFollowing: _following,
              momentUrls: _conversation.momentUrls,
              momentAssets: _conversation.momentAssets,
              emUsername: _peerEmUser.isNotEmpty
                  ? _peerEmUser
                  : _conversation.emUserName,
            ))
        .copyWith(
          isFollowing: _following,
          emUsername: _peerEmUser.isNotEmpty
              ? _peerEmUser
              : (_conversation.emUserName.isNotEmpty
                  ? _conversation.emUserName
                  : null),
        );
    unawaited(() async {
      await Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => ChatUserProfilePage(
            profile: profile,
            chatsController: widget.chatsController,
          ),
        ),
      );
      if (!mounted) return;
      final appUid = _relationUid;
      if (appUid.isEmpty || !RegExp(r'^\d+$').hasMatch(appUid)) return;
      try {
        final blackRes = await AppApis.relation.isBlocked(appUid);
        if (!mounted) return;
        setState(() => _blocked = blackRes.data ?? _blocked);
      } catch (_) {}
    }());
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A14),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: topPadding),
          AnimatedBuilder(
            animation: _introCollapse,
            builder: (context, _) {
              return _DmAppBar(
                conversation: _conversation,
                following: _following,
                collapse: _introCollapse.value,
                loading: _loadingPeer,
                onFollowTap: () => unawaited(_toggleFollow()),
                onAvatarTap: _openPeerProfile,
                onMoreTap: () => unawaited(_openMoreMenu()),
              );
            },
          ),
          Expanded(
            child: _DmChatBody(
              messages: _messages,
              peerAvatar: _conversation.avatarAsset,
              peerAvatarUrl: _conversation.avatarUrl,
              selfAvatarUrl: _selfAvatarUrl,
              messagesScroll: _messagesScroll,
              historyLoading: _historyLoading,
              historyHasMore: _historyHasMore && _allowHistoryLoadMore,
              onHandleDragUpdate: _onIntroDragUpdate,
              onHandleDragEnd: _onIntroDragEnd,
              onBlankTap: () => _inputBarKey.currentState?.dismissComposer(),
              onFailedTap: (index) => unawaited(_onFailedTap(index)),
              onMessageLongPress: (line, anchor) =>
                  unawaited(_onMessageLongPress(line, anchor)),
              onQuoteTap: _scrollToQuotedMessage,
              messageKeyFor: _messageKeyFor,
            ),
          ),
          _DmInputBar(
            key: _inputBarKey,
            bottomInset: bottomPadding,
            controller: _inputController,
            onSend: _sendMessage,
            onSendVoice: _sendVoice,
            onSendImages: _sendImages,
            onSendGift: _sendGift,
            onSendEmote: _sendEmote,
            receiverUid: _relationUid.isNotEmpty ? _relationUid : _peerUid,
          ),
        ],
      ),
    );
  }
}

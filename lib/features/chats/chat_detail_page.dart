import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:record/record.dart';

import '../../core/constants/app_assets.dart';
import '../../core/im/im_service.dart';
import '../../core/network/api_client.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/zodiac.dart';
import '../../core/widgets/app_asset_image.dart';
import '../../core/widgets/app_tip_dialog.dart';
import '../../core/widgets/center_toast.dart';
import '../../core/widgets/network_or_asset_avatar.dart';
import '../home/chat_user_profile_page.dart';
import '../home/home_search_page.dart';
import '../home/models/chat_user_profile.dart';
import '../me/data/user_dto.dart';
import '../report/report_page.dart';
import '../wallet/wallet_page.dart';
import 'data/cash_gift_dto.dart';
import 'data/chats_list_controller.dart';
import 'data/emote_dto.dart';
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

  /// Sync list when sending (including re-show after swipe-delete).
  final ChatsListController? chatsController;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _messagesScroll = ScrollController();
  final GlobalKey<_DmInputBarState> _inputBarKey = GlobalKey<_DmInputBarState>();

  /// 0 = intro expanded, 1 = intro collapsed (app bar row only).
  late final AnimationController _introCollapse;

  /// Intro is taller with Moments thumbs; increase drag range for handle.
  static const double _introDragRange = 120;

  /// Local + EaseMob 1v1 history.
  final List<_ChatLine> _messages = [];
  final Set<String> _seenMsgIds = {};
  StreamSubscription<ImChatMessage>? _imSub;
  bool _historyHasMore = true;
  bool _historyLoading = false;
  String _historyCursor = '';
  /// After first open, only then allow pull-up history (avoids racing scroll-to-bottom).
  bool _allowHistoryLoadMore = false;

  late ChatConversation _conversation = widget.conversation;
  ChatUserProfile? _peerProfile;
  String? _selfAvatarUrl;
  bool _following = false;
  bool _blocked = false;
  bool _loadingPeer = true;
  String _peerEmUser = '';
  /// Backend numeric user id (for follow / block / gifts). Distinct from EM id.
  String _peerAppUid = '';

  String get _peerUid {
    final id = _conversation.id;
    if (id.startsWith('dm_')) return id.substring(3);
    return id;
  }

  /// Prefer resolved app uid; fall back to conversation id only if numeric.
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
    // Clear list badge + EaseMob unread when opening the thread.
    widget.chatsController?.markRead(widget.conversation.id);
    final em = _imConversationId;
    if (em.isNotEmpty) {
      unawaited(ImService.markConversationRead(em));
    }
    unawaited(_loadFromApi());
  }

  Future<void> _loadFromApi() async {
    final rawId = _peerUid.trim();
    final emHint = _peerEmUser.isNotEmpty
        ? _peerEmUser
        : (rawId.startsWith('yqdf-') || rawId.contains('yqdf')
            ? rawId
            : '');
    if (rawId.isEmpty && emHint.isEmpty) {
      if (mounted) setState(() => _loadingPeer = false);
      return;
    }

    try {
      final api = NetworkBootstrap.api;
      // Resolve numeric app uid when conversation key is an EM username.
      var appUid = RegExp(r'^\d+$').hasMatch(rawId) ? rawId : '';
      if (appUid.isEmpty && emHint.isNotEmpty) {
        try {
          final msgRes = await api.msgUser(emHint);
          final data = msgRes.data;
          if (data is Map) {
            final user = data['user'];
            final map = user is Map ? user : data;
            appUid = '${map['id'] ?? map['userId'] ?? ''}'.trim();
          }
        } catch (_) {}
      }
      if (appUid.isEmpty && RegExp(r'^\d+$').hasMatch(rawId)) {
        appUid = rawId;
      }
      // user/info accepts either numeric id or emUsername on this backend.
      final infoKey = appUid.isNotEmpty
          ? appUid
          : (rawId.isNotEmpty ? rawId : emHint);

      final peerFuture = infoKey.isNotEmpty
          ? api.userInfoByUid(infoKey)
          : Future<ApiResponse>.value(
              const ApiResponse(
                success: false,
                code: null,
                message: '',
                raw: {},
              ),
            );
      final results = await Future.wait([
        peerFuture,
        api.userInfo(),
        api.getBlackList(),
      ]);
      await ImService.connectFromServer();
      if (!mounted) return;

      final peerRes = results[0];
      final selfRes = results[1];
      final blackRes = results[2];

      final peer =
          infoKey.isNotEmpty ? UserDto.parseChatProfile(peerRes) : null;
      final self = UserDto.parseProfile(selfRes);
      if (peer != null && peer.userId.isNotEmpty) {
        appUid = peer.userId;
      }
      final blocked = appUid.isEmpty
          ? false
          : _isOnBlackList(blackRes.data, appUid);

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
          _selfAvatarUrl = self?.avatarUrl;
          _peerEmUser = em;
          _peerAppUid = appUid;
          _loadingPeer = false;
        });
        widget.chatsController?.upsertPrivateChat(updated);
        if (em.isNotEmpty) unawaited(_loadImHistory(em));
      } else {
        setState(() {
          _peerAppUid = appUid;
          _blocked = blocked;
          _selfAvatarUrl = self?.avatarUrl;
          _loadingPeer = false;
        });
        if (_peerEmUser.isNotEmpty) {
          unawaited(_loadImHistory(_peerEmUser));
        }
      }
    } catch (error) {
      if (!mounted) return;
      setState(() => _loadingPeer = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load chat profile: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
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
        if (m.msgType == 'follow') continue;
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
    // Near the top → load older messages.
    if (_messagesScroll.position.pixels <= 64) {
      unawaited(_loadImHistory(peerEm, loadMore: true));
    }
  }

  void _onImMessage(ImChatMessage m) {
    final convId = _imConversationId;
    if (convId.isEmpty) return;
    final match = m.conversationId == convId ||
        m.from == convId ||
        m.to == convId;
    if (!match) return;
    // Follow tips are not shown in the DM stream.
    if (m.msgType == 'follow') return;
    if (m.id.isNotEmpty && !_seenMsgIds.add(m.id)) return;
    if (!mounted) return;
    setState(() {
      _messages.add(_lineFromIm(m));
    });
    if (m.isSelf) {
      widget.chatsController?.onNewMessage(
        id: _conversation.id,
        title: _conversation.title,
        avatarAsset: _conversation.avatarAsset,
        avatarUrl: _conversation.avatarUrl,
        lastMessage: m.text,
        isMale: _conversation.isMale,
        signature: _conversation.signature,
        zodiac: _conversation.zodiac,
        isFollowing: _following,
        unreadDelta: 0,
      );
    } else {
      widget.chatsController?.onNewMessage(
        id: _conversation.id,
        title: _conversation.title,
        avatarAsset: _conversation.avatarAsset,
        avatarUrl: _conversation.avatarUrl,
        lastMessage: m.text,
        isMale: _conversation.isMale,
        signature: _conversation.signature,
        zodiac: _conversation.zodiac,
        isFollowing: _following,
        unreadDelta: 1,
      );
    }
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
        );
      default:
        return _ChatLine(
          side: side,
          text: m.text,
          serverTimeMs: m.serverTimeMs,
          msgId: m.id,
        );
    }
  }

  bool _isOnBlackList(Object? data, String uid) {
    if (data is! Map) return false;
    final list = data['userList'] ?? data['list'] ?? data['blackList'];
    if (list is! List) return false;
    for (final item in list) {
      if (item is Map) {
        final id = '${item['id'] ?? item['userId'] ?? ''}';
        if (id == uid) return true;
      } else if ('$item' == uid) {
        return true;
      }
    }
    return false;
  }

  @override
  void dispose() {
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

  Future<void> _sendMessage([String? raw]) async {
    final text = (raw ?? _inputController.text).trim();
    if (text.isEmpty) {
      if (!mounted) return;
      showCenterToast(context, message: 'The message cannot be empty!');
      return;
    }
    _inputController.clear();

    final peerEm = _imConversationId;
    if (peerEm.isNotEmpty) {
      try {
        final sent = await ImService.sendText(
          peerEmUsername: peerEm,
          content: text,
        );
        if (sent != null && sent.id.isNotEmpty) {
          _seenMsgIds.add(sent.id);
        }
        // Stream may also deliver; add immediately for snappy UI.
        if (!mounted) return;
        setState(() {
          _messages.add(_ChatLine(side: _ChatSide.self, text: text));
        });
        _afterSend(text);
        return;
      } catch (error) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Send failed: $error'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
    }

    // No emUserName yet — local-only fallback.
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

    setState(() {
      _messages.add(
        _ChatLine(
          side: _ChatSide.self,
          kind: _ChatLineKind.emote,
          emoteUrl: url,
          emoteName: name,
          mediaSource: url,
          text: preview,
        ),
      );
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
      );
      if (sent != null && sent.id.isNotEmpty) {
        _seenMsgIds.add(sent.id);
      }
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sticker send failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _sendVoice(String path, int seconds) async {
    if (seconds <= 0) return;
    final peerEm = _imConversationId;
    final localPath = path.trim();

    // Optimistic UI immediately.
    setState(() {
      _messages.add(
        _ChatLine(
          side: _ChatSide.self,
          kind: _ChatLineKind.voice,
          voiceSeconds: seconds,
          mediaSource: localPath,
        ),
      );
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
      );
      if (sent != null && sent.id.isNotEmpty) {
        _seenMsgIds.add(sent.id);
      }
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Voice send failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _sendImages(List<String> paths) async {
    if (paths.isEmpty) return;
    final peerEm = _imConversationId;
    final files = paths.map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    if (files.isEmpty) return;

    // Optimistic UI for each path (file or temporary asset export).
    setState(() {
      for (final path in files) {
        _messages.add(
          _ChatLine(
            side: _ChatSide.self,
            kind: _ChatLineKind.image,
            mediaSource: path,
            imageAssets: [path],
          ),
        );
      }
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

    for (final path in files) {
      try {
        final sent = await ImService.sendImage(
          peerEmUsername: peerEm,
          filePath: path,
          sendOriginalImage: true,
        );
        if (sent != null && sent.id.isNotEmpty) {
          _seenMsgIds.add(sent.id);
        }
      } catch (error) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image send failed: $error'),
            behavior: SnackBarBehavior.floating,
          ),
        );
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

  void _scrollToBottom({bool force = false, bool animated = false}) {
    void jump({required bool animate}) {
      if (!mounted || !_messagesScroll.hasClients) return;
      final max = _messagesScroll.position.maxScrollExtent;
      // Content shorter than viewport: stay at 0 so messages sit under the handle.
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
          ? await NetworkBootstrap.api.unfollowUser(uid)
          : await NetworkBootstrap.api.followUser(uid);
      if (!mounted) return;
      if (!res.success) {
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
    final action = await showModalBottomSheet<_DmMoreAction>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (context) =>
          _DmMoreSheet(following: _following, blocked: _blocked),
    );
    if (!mounted || action == null) return;
    switch (action) {
      case _DmMoreAction.search:
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) =>
                HomeSearchPage(chatsController: widget.chatsController),
          ),
        );
      case _DmMoreAction.follow:
        await _toggleFollow();
      case _DmMoreAction.block:
        await _toggleBlock();
      case _DmMoreAction.report:
        Navigator.of(
          context,
        ).push(MaterialPageRoute<void>(builder: (_) => const ReportPage()));
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
        final res = await NetworkBootstrap.api.setBlackList(
          userId: uid,
          isCancel: true,
        );
        if (!mounted) return;
        if (!res.success) {
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
      final res = await NetworkBootstrap.api.setBlackList(
        userId: uid,
        isCancel: false,
      );
      if (!mounted) return;
      if (!res.success) {
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
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChatUserProfilePage(
          profile: profile,
          chatsController: widget.chatsController,
        ),
      ),
    );
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

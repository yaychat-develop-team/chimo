import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/audio/app_audio_playback.dart';
import '../../core/auth/auth_session.dart';
import '../../core/constants/app_assets.dart';
import '../../core/im/im_service.dart';
import '../../core/network/app_apis.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_emoji.dart';
import '../../core/widgets/app_action_bottom_sheet.dart';
import '../../core/widgets/app_network_image.dart';
import '../../core/widgets/app_tip_dialog.dart';
import '../../core/widgets/center_toast.dart';
import '../../core/widgets/network_or_asset_avatar.dart';
import '../chats/data/chats_list_controller.dart';
import '../chats/models/chat_conversation.dart';
import '../profile/album_photo_viewer_page.dart';
import '../report/report_page.dart';
import 'chat_user_profile_page.dart';
import 'models/chat_user_profile.dart';
import 'models/group_item.dart';
import 'widgets/chat_user_profile_sheet.dart';
import 'widgets/group_chat_input_bar.dart';
import 'widgets/group_level_badge.dart';
import 'widgets/group_members_sheet.dart';

/// 群聊页：未加入 = 有限浏览 + 加入；已加入 = 消息 + 输入。
class GroupDetailsPage extends StatefulWidget {
  const GroupDetailsPage({
    super.key,
    required this.group,
    this.chatsController,
    this.onMembershipChanged,
  });

  final PopularGroupItem group;

  /// 加入时添加聊天会话；离开时仅更新成员身份，保留会话。
  final ChatsListController? chatsController;

  /// 加入状态回调（同步首页「我的群组」）。
  final ValueChanged<bool>? onMembershipChanged;

  @override
  State<GroupDetailsPage> createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> {
  late bool _isJoined = widget.group.isJoined;
  bool _descExpanded = true;
  int _tabIndex = 0;
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _messagesScroll = ScrollController();
  final List<_OutgoingMessage> _sentMessages = [];
  final Set<String> _seenMsgIds = {};
  StreamSubscription<ImChatMessage>? _imSub;
  List<GroupPhotoSection> _photoSections = const [];
  final GlobalKey<GroupChatInputBarState> _inputBarKey =
      GlobalKey<GroupChatInputBarState>();
  String _selfAvatarUrl = '';

  /// 防止短时间连点头像叠多层资料弹窗。
  bool _openingSenderProfile = false;

  /// uid → 头像 URL（消息 attributes 缺 avatar 时用资料接口补全）。
  final Map<String, String> _senderAvatarByUid = {};

  /// uid → `male` / `female`（消息 attributes 缺 gender 时用资料接口补全）。
  final Map<String, String> _senderGenderByUid = {};

  /// 已查过资料的 uid（含未设置性别），避免重复请求。
  final Set<String> _senderProfileLookupDone = {};
  final Set<String> _profileFetchInFlight = {};

  PopularGroupItem get _group => widget.group;

  String get _emGroupId => _group.id.trim();

  /// 群聊发出消息的对端公共 attributes（群名 / 头像 / 群 id）。
  ImPeerAttrs get _groupPeerAttrs => ImPeerAttrs(
    name: _group.name.trim(),
    avatar: (_group.avatarUrl ?? '').trim(),
    userid: _group.id.trim(),
  );

  List<String> get _flatPhotos => [for (final s in _photoSections) ...s.urls];

  @override
  void initState() {
    super.initState();
    unawaited(_loadSelfAvatar());
    unawaited(_loadPhotos());
    _imSub = ImService.messages.listen(_onImMessage);
    widget.chatsController?.setActiveConversation(_emGroupId);
    // 未加入也拉最近 10 条预览（对齐 forya）；图片加锁模糊。
    unawaited(_loadImHistory());
  }

  Future<void> _loadSelfAvatar() async {
    final url = (await AuthSession.avatarUrl())?.trim() ?? '';
    if (!mounted || url.isEmpty) return;
    setState(() => _selfAvatarUrl = url);
  }

  Future<void> _loadImHistory() async {
    final gid = _emGroupId;
    if (gid.isEmpty) return;
    final previewLimit = _isJoined ? 40 : 10;
    try {
      if (!ImService.isConnected) {
        await ImService.connectFromServer();
      }
      final page = await ImService.loadHistory(
        gid,
        count: previewLimit,
        isGroup: true,
      );
      if (!mounted) return;
      final added = <_OutgoingMessage>[];
      for (final m in page.messages) {
        if (m.id.isNotEmpty && _seenMsgIds.contains(m.id)) continue;
        final line = _lineFromIm(m);
        if (line == null) continue;
        if (m.id.isNotEmpty) _seenMsgIds.add(m.id);
        added.add(line);
      }
      if (added.isEmpty) return;
      setState(() {
        // 历史到达后丢弃无环信 id 的临时入群提示。
        _sentMessages.removeWhere(
          (m) => m.kind == _OutgoingKind.join && m.msgId.isEmpty,
        );
        _sentMessages.insertAll(0, added);
        _sentMessages.sort((a, b) => a.sentAt.compareTo(b.sentAt));
        if (!_isJoined && _sentMessages.length > 10) {
          final drop = _sentMessages.length - 10;
          for (final m in _sentMessages.take(drop)) {
            if (m.msgId.isNotEmpty) _seenMsgIds.remove(m.msgId);
          }
          _sentMessages.removeRange(0, drop);
        }
      });
      _scrollToBottom(force: true);
      if (_isJoined) {
        unawaited(ImService.markConversationRead(gid, isGroup: true));
      }
      unawaited(_hydrateMissingSenderProfiles());
    } catch (error) {
      debugPrint('GroupDetails loadImHistory: $error');
    }
  }

  void _rememberSenderAvatar(String uid, String avatar) {
    final id = uid.trim();
    final url = avatar.trim();
    if (id.isEmpty || url.isEmpty) return;
    if (url == 'null' || url == 'undefined') return;
    _senderAvatarByUid[id] = url;
  }

  void _rememberSenderGender(String uid, String gender) {
    final id = uid.trim();
    if (id.isEmpty) return;
    final normalized = _OutgoingMessage.normalizeGender(gender);
    if (normalized == null) return;
    _senderGenderByUid[id] = normalized;
  }

  void _rememberSenderProfile(ChatUserProfile profile) {
    final uid = profile.userId.trim().isEmpty
        ? profile.id.trim()
        : profile.userId.trim();
    if (uid.isEmpty) return;
    final url = (profile.avatarUrl ?? '').trim();
    if (url.isNotEmpty) _rememberSenderAvatar(uid, url);
    if (profile.hasGender) {
      _rememberSenderGender(uid, profile.isMale ? 'male' : 'female');
    }
    _senderProfileLookupDone.add(uid);
  }

  String _resolvedSenderAvatar({
    required String uid,
    required String avatar,
    required bool isSelf,
  }) {
    final fromMsg = avatar.trim();
    if (fromMsg.isNotEmpty && fromMsg != 'null' && fromMsg != 'undefined') {
      _rememberSenderAvatar(uid, fromMsg);
      return fromMsg;
    }
    if (isSelf && _selfAvatarUrl.trim().isNotEmpty) {
      return _selfAvatarUrl.trim();
    }
    final cached = _senderAvatarByUid[uid.trim()];
    if (cached != null && cached.isNotEmpty) return cached;
    return '';
  }

  String _resolvedSenderGender({
    required String uid,
    required String gender,
  }) {
    final fromMsg = _OutgoingMessage.normalizeGender(gender);
    if (fromMsg != null) {
      _rememberSenderGender(uid, fromMsg);
      return fromMsg;
    }
    return _senderGenderByUid[uid.trim()] ?? '';
  }

  /// 历史/实时消息若 attributes 缺 avatar / gender，按 userid 拉资料补全。
  Future<void> _hydrateMissingSenderProfiles() async {
    final need = <String>{};
    for (final m in _sentMessages) {
      if (m.isSelf) continue;
      final uid = m.senderUid.trim();
      if (uid.isEmpty) continue;
      if (m.senderAvatar.trim().isNotEmpty) {
        _rememberSenderAvatar(uid, m.senderAvatar);
      }
      if (m.hasSenderGender) {
        _rememberSenderGender(uid, m.senderGender);
      }
      final needAvatar = m.senderAvatar.trim().isEmpty &&
          !_senderAvatarByUid.containsKey(uid);
      final needGender = !m.hasSenderGender &&
          !_senderGenderByUid.containsKey(uid) &&
          !_senderProfileLookupDone.contains(uid);
      if (!needAvatar && !needGender) continue;
      if (_profileFetchInFlight.contains(uid)) continue;
      need.add(uid);
    }
    if (need.isEmpty) return;

    for (final uid in need) {
      _profileFetchInFlight.add(uid);
      try {
        final res = await AppApis.user.profileByUidOrNull(uid);
        if (res.ok && res.data != null) {
          _rememberSenderProfile(res.data!);
        } else {
          _senderProfileLookupDone.add(uid);
        }
      } catch (_) {
        _senderProfileLookupDone.add(uid);
      } finally {
        _profileFetchInFlight.remove(uid);
      }
    }
    if (!mounted) return;
    var changed = false;
    for (var i = 0; i < _sentMessages.length; i++) {
      final m = _sentMessages[i];
      final uid = m.senderUid.trim();
      if (uid.isEmpty) continue;
      var next = m;
      final cachedAvatar = _senderAvatarByUid[uid];
      if (cachedAvatar != null &&
          cachedAvatar.isNotEmpty &&
          m.senderAvatar.trim() != cachedAvatar) {
        next = next.copyWith(senderAvatar: cachedAvatar);
      }
      final cachedGender = _senderGenderByUid[uid];
      if (cachedGender != null &&
          cachedGender.isNotEmpty &&
          !m.hasSenderGender) {
        next = next.copyWith(senderGender: cachedGender);
      }
      if (!identical(next, m) &&
          (next.senderAvatar != m.senderAvatar ||
              next.senderGender != m.senderGender)) {
        _sentMessages[i] = next;
        changed = true;
      }
    }
    if (changed) setState(() {});
  }

  void _onImMessage(ImChatMessage m) {
    final gid = _emGroupId;
    if (gid.isEmpty) return;
    if (m.conversationId != gid && m.to != gid) return;
    if (m.id.isNotEmpty && _seenMsgIds.contains(m.id)) return;
    final line = _lineFromIm(m);
    if (line == null) return;
    if (m.id.isNotEmpty) _seenMsgIds.add(m.id);
    if (!mounted) return;
    setState(() {
      _sentMessages.add(line);
      if (!_isJoined && _sentMessages.length > 10) {
        final removed = _sentMessages.removeAt(0);
        if (removed.msgId.isNotEmpty) _seenMsgIds.remove(removed.msgId);
      }
    });
    // 列表预览 / 未读由 ChatsListController 的 IM 订阅处理。
    _scrollToBottom();
    final needProfile = line.senderUid.trim().isNotEmpty &&
        (line.senderAvatar.trim().isEmpty || !line.hasSenderGender);
    if (needProfile) {
      unawaited(_hydrateMissingSenderProfiles());
    }
  }

  _OutgoingMessage? _lineFromIm(ImChatMessage m) {
    final at = m.serverTimeMs > 0
        ? DateTime.fromMillisecondsSinceEpoch(m.serverTimeMs)
        : DateTime.now();
    final name = m.senderName;
    final uid = m.senderUid;
    final gender = _resolvedSenderGender(
      uid: uid,
      gender: m.senderGender,
    );
    final avatar = _resolvedSenderAvatar(
      uid: uid,
      avatar: m.senderAvatar,
      isSelf: m.isSelf,
    );
    switch (m.msgType) {
      case 'join':
        return _OutgoingMessage.join(
          m.joinName.isEmpty ? 'Someone' : m.joinName,
          uid: m.joinUid,
          at: at,
          msgId: m.id,
          senderAvatar: avatar,
          senderGender: gender,
        );
      case 'txt':
        return _OutgoingMessage.text(
          m.text,
          at: at,
          msgId: m.id,
          isSelf: m.isSelf,
          senderAvatar: avatar,
          senderName: name,
          senderUid: uid,
          senderGender: gender,
        );
      case 'image':
        // 预览优先用可下载的 http(s) 远程 / 缩略图，避免裸路径被当成本地文件。
        final remote = m.mediaRemoteUrl.trim();
        final thumb = m.thumbnailUrl.trim();
        final src = () {
          if (remote.startsWith('http://') || remote.startsWith('https://')) {
            return remote;
          }
          if (thumb.startsWith('http://') || thumb.startsWith('https://')) {
            return thumb;
          }
          return m.playableOrDisplayUrl;
        }();
        if (src.isEmpty) return null;
        return _OutgoingMessage.image(
          src,
          at: at,
          msgId: m.id,
          isSelf: m.isSelf,
          senderAvatar: avatar,
          senderName: name,
          senderUid: uid,
          senderGender: gender,
        );
      case 'voice':
        return _OutgoingMessage.voice(
          m.durationSecs > 0 ? m.durationSecs : 1,
          at: at,
          msgId: m.id,
          isSelf: m.isSelf,
          mediaSource: m.playableOrDisplayUrl,
          senderAvatar: avatar,
          senderName: name,
          senderUid: uid,
          senderGender: gender,
        );
      case 'emote':
        final src = m.emoteUrl.isNotEmpty ? m.emoteUrl : m.playableOrDisplayUrl;
        if (src.isEmpty) return null;
        return _OutgoingMessage.image(
          src,
          at: at,
          msgId: m.id,
          isSelf: m.isSelf,
          senderAvatar: avatar,
          senderName: name,
          senderUid: uid,
          senderGender: gender,
        );
      default:
        return null;
    }
  }

  Future<void> _loadPhotos() async {
    try {
      final res = await AppApis.group.photos(_group.id);
      if (!mounted || !res.ok) return;
      final sections = res.data ?? const [];
      if (sections.isEmpty) return;
      setState(() => _photoSections = sections);
    } catch (_) {}
  }

  @override
  void dispose() {
    widget.chatsController?.setActiveConversation(null);
    unawaited(_imSub?.cancel() ?? Future<void>.value());
    _inputController.dispose();
    _messagesScroll.dispose();
    super.dispose();
  }

  Future<void> _join() async {
    if (_isJoined) return;
    setState(() => _isJoined = true);
    final joined = _group.copyWith(isJoined: true);
    widget.chatsController?.joinGroup(joined);
    widget.onMembershipChanged?.call(true);
    try {
      final res = await AppApis.group.join([_group.id]);
      if (!mounted) return;
      if (!res.ok) {
        setState(() => _isJoined = false);
        widget.chatsController?.leaveGroup(_group.id);
        widget.onMembershipChanged?.call(false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.message.isEmpty ? 'Join failed' : res.message),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      // 服务端会推送 JoinGroupMessage；同时立即展示本地提示。
      final nick = (await AuthSession.nickname())?.trim();
      final name = (nick == null || nick.isEmpty) ? 'You' : nick;
      if (!mounted) return;
      setState(() {
        _sentMessages.add(_OutgoingMessage.join(name));
      });
      _notifyNewMessage('$name joined the community');
      _scrollToBottom();
      unawaited(_loadImHistory());
    } catch (error) {
      if (!mounted) return;
      setState(() => _isJoined = false);
      widget.chatsController?.leaveGroup(_group.id);
      widget.onMembershipChanged?.call(false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Join failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _leave() async {
    if (!_isJoined) return;
    setState(() => _isJoined = false);
    widget.chatsController?.leaveGroup(_group.id);
    widget.onMembershipChanged?.call(false);
    try {
      final res = await AppApis.group.leave(_group.id);
      if (!mounted) return;
      if (!res.ok) {
        setState(() => _isJoined = true);
        widget.chatsController?.joinGroup(_group.copyWith(isJoined: true));
        widget.onMembershipChanged?.call(true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(res.message.isEmpty ? 'Leave failed' : res.message),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      Navigator.of(context).pop();
    } catch (error) {
      if (!mounted) return;
      setState(() => _isJoined = true);
      widget.chatsController?.joinGroup(_group.copyWith(isJoined: true));
      widget.onMembershipChanged?.call(true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Leave failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _scrollToBottom({bool force = false}) {
    void jump({required bool animate}) {
      if (!mounted || !_messagesScroll.hasClients) return;
      final max = _messagesScroll.position.maxScrollExtent;
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

    // 进入 / 加载历史：反复跳转直到布局稳定到最后一条消息。
    if (force) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        jump(animate: false);
        var left = 8;
        void retry() {
          Future<void>.delayed(const Duration(milliseconds: 50), () {
            if (!mounted) return;
            jump(animate: false);
            left -= 1;
            if (left > 0) retry();
          });
        }

        retry();
      });
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      jump(animate: true);
    });
  }

  void _notifyNewMessage(String preview) {
    widget.chatsController?.onNewMessage(
      id: _group.id,
      title: _group.name,
      avatarAsset: _group.avatarAsset,
      lastMessage: preview,
      badge: ChatBadgeType.group,
    );
  }

  Future<void> _sendMessage([String? raw]) async {
    final text = (raw ?? _inputController.text).trim();
    if (!_isJoined) return;
    if (text.isEmpty) {
      if (!mounted) return;
      showCenterToast(context, message: 'The message cannot be empty!');
      return;
    }
    _inputController.clear();
    setState(() {
      _sentMessages.add(
        _OutgoingMessage.text(text, senderAvatar: _selfAvatarUrl),
      );
      _tabIndex = 0;
    });
    _notifyNewMessage(text);
    _scrollToBottom();

    final gid = _emGroupId;
    if (gid.isEmpty) return;
    try {
      final sent = await ImService.sendText(
        peerEmUsername: gid,
        content: text,
        isGroup: true,
        peer: _groupPeerAttrs,
      );
      if (sent != null && sent.id.isNotEmpty) {
        _seenMsgIds.add(sent.id);
      }
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Send failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _sendVoice(String path, int seconds) async {
    if (!_isJoined || seconds <= 0) return;
    final local = path.trim();
    if (local.isEmpty) return;
    setState(() {
      _sentMessages.add(
        _OutgoingMessage.voice(
          seconds,
          mediaSource: local,
          senderAvatar: _selfAvatarUrl,
        ),
      );
      _tabIndex = 0;
    });
    _notifyNewMessage('[Voice] ${seconds}s');
    _scrollToBottom();

    final gid = _emGroupId;
    if (gid.isEmpty) return;
    try {
      final sent = await ImService.sendVoice(
        peerEmUsername: gid,
        filePath: local,
        durationSecs: seconds,
        isGroup: true,
        peer: _groupPeerAttrs,
      );
      if (sent != null && sent.id.isNotEmpty) {
        _seenMsgIds.add(sent.id);
        final playable = sent.playableOrDisplayUrl;
        if (!mounted) return;
        setState(() {
          for (var i = _sentMessages.length - 1; i >= 0; i--) {
            final m = _sentMessages[i];
            if (m.kind != _OutgoingKind.voice ||
                !m.isSelf ||
                m.msgId.isNotEmpty) {
              continue;
            }
            _sentMessages[i] = m.copyWith(
              msgId: sent.id,
              mediaSource: playable.isNotEmpty ? playable : local,
            );
            break;
          }
        });
      }
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Send voice failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _sendImages(List<String> paths) async {
    if (!_isJoined || paths.isEmpty) return;
    final files = paths
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    if (files.isEmpty) return;

    final now = DateTime.now();
    setState(() {
      for (final path in files) {
        _sentMessages.add(
          _OutgoingMessage.image(path, at: now, senderAvatar: _selfAvatarUrl),
        );
      }
      _tabIndex = 0;
    });
    _notifyNewMessage(
      files.length == 1 ? '[Image]' : '[Image] x${files.length}',
    );
    _scrollToBottom();

    final gid = _emGroupId;
    if (gid.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cannot send image: group IM id missing'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    for (final path in files) {
      try {
        final sent = await ImService.sendImage(
          peerEmUsername: gid,
          filePath: path,
          isGroup: true,
          peer: _groupPeerAttrs,
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

  Future<void> _openMoreMenu() async {
    final action = await AppActionBottomSheet.show<_GroupMoreAction>(
      context: context,
      buildItems: (sheetContext) => [
        AppActionSheetItem(
          label: 'Report',
          destructive: true,
          onTap: () => Navigator.of(sheetContext).pop(_GroupMoreAction.report),
        ),
        if (_isJoined)
          AppActionSheetItem(
            label: 'Leave Group',
            onTap: () async {
              final confirmed = await AppTipDialog.confirmLeaveGroup(
                sheetContext,
              );
              if (!sheetContext.mounted) return;
              if (confirmed) {
                Navigator.of(sheetContext).pop(_GroupMoreAction.leave);
              }
            },
          ),
      ],
    );
    if (!mounted || action == null) return;

    switch (action) {
      case _GroupMoreAction.report:
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => ReportPage(
              reportedId: _group.id,
              targetKind: ReportTargetKind.group,
            ),
          ),
        );
      case _GroupMoreAction.leave:
        _leave();
    }
  }

  void _openMembersSheet() {
    GroupMembersSheet.show(
      context,
      groupId: _group.id,
      onMemberTap: (member) {
        Navigator.of(context).pop();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => ChatUserProfilePage(
                profile: ChatUserProfile.fromMember(member),
                chatsController: widget.chatsController,
              ),
            ),
          );
        });
      },
    );
  }

  void _openPhotoViewer(int initialIndex) {
    final photos = _flatPhotos;
    if (!_isJoined || photos.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) =>
            _GroupPhotoViewerPage(photos: photos, initialIndex: initialIndex),
      ),
    );
  }

  /// 点击对方头像：底部资料弹层（对齐 forya PersonalUnit.showBottom）。
  Future<void> _openSenderProfile(_OutgoingMessage message) async {
    if (message.isSelf) return;
    if (_openingSenderProfile) return;
    _openingSenderProfile = true;
    try {
      final uid = message.senderUid.trim();
      final name = message.senderName.trim();
      var profile = ChatUserProfile.placeholder(
        id: uid,
        nickname: name.isEmpty ? 'User' : name,
        avatarUrl: message.senderAvatar.trim().isEmpty
            ? null
            : message.senderAvatar.trim(),
      );
      if (uid.isNotEmpty) {
        try {
          final res = await AppApis.user.profileByUidOrNull(uid);
          if (res.ok && res.data != null) {
            profile = res.data!;
            _rememberSenderProfile(profile);
            final apiAvatar = (profile.avatarUrl ?? '').trim();
            final msgAvatar = message.senderAvatar.trim();
            if (apiAvatar.isEmpty && msgAvatar.isNotEmpty) {
              profile = profile.copyWith(avatarUrl: msgAvatar);
            }
            if (profile.nickname.trim().isEmpty && name.isNotEmpty) {
              profile = profile.copyWith(nickname: name);
            }
            // 打开资料时同步补全列表里该用户的性别 / 头像。
            if (profile.hasGender || apiAvatar.isNotEmpty) {
              final g = profile.hasGender
                  ? (profile.isMale ? 'male' : 'female')
                  : null;
              var patched = false;
              for (var i = 0; i < _sentMessages.length; i++) {
                final m = _sentMessages[i];
                if (m.senderUid.trim() != uid) continue;
                final next = m.copyWith(
                  senderAvatar: apiAvatar.isNotEmpty ? apiAvatar : null,
                  senderGender: g,
                );
                if (next.senderAvatar != m.senderAvatar ||
                    next.senderGender != m.senderGender) {
                  _sentMessages[i] = next;
                  patched = true;
                }
              }
              if (patched && mounted) setState(() {});
            }
          }
        } catch (_) {}
      }
      if (!mounted) return;
      await ChatUserProfileSheet.show(
        context,
        profile: profile,
        chatsController: widget.chatsController,
      );
    } finally {
      _openingSenderProfile = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: AppColors.background,
      // 对齐私聊：输入栏自行处理键盘 / 面板 inset（避免双重收缩）。
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 260 + topPadding,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: NetworkOrAssetAvatar(
                asset: _group.avatarAsset,
                url: _group.avatarUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 260 + topPadding,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.45),
                    AppColors.background,
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: topPadding),
              _DetailsAppBar(
                group: _group,
                isJoined: _isJoined,
                descExpanded: _descExpanded,
                onMoreTap: _openMoreMenu,
                onToggleDesc: () =>
                    setState(() => _descExpanded = !_descExpanded),
              ),
              // forya：`if (!_foldInfo) _groupInfoWidget` — 折叠整个头部，不是展开正文。
              if (_descExpanded)
                _ProfileHeader(
                  group: _group,
                  isJoined: _isJoined,
                  onCollapse: () => setState(() => _descExpanded = false),
                  onMembersTap: _openMembersSheet,
                ),
              // forya：提示 + 聊天共用一个圆角外壳；非成员外壳为
              // 半透明 lime `0x1FC0F600`，从白色面板上方露出。
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: _isJoined ? Colors.white : const Color(0x1FC0F600),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(22),
                    ),
                  ),
                  child: Column(
                    children: [
                      if (!_isJoined)
                        const SizedBox(
                          height: 43,
                          child: Center(
                            child: Text(
                              'Not a member? Viewing is limited to 10 messages',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFC7EF4C),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      Expanded(
                        child: _ChatBody(
                          tabIndex: _tabIndex,
                          isJoined: _isJoined,
                          sentMessages: _sentMessages,
                          photos: _photoSections,
                          messagesScroll: _messagesScroll,
                          onTabChanged: (i) => setState(() => _tabIndex = i),
                          onPhotoTap: _openPhotoViewer,
                          onSenderAvatarTap: _openSenderProfile,
                          onBlankTap: () =>
                              _inputBarKey.currentState?.dismissComposer(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_isJoined)
                GroupChatInputBar(
                  key: _inputBarKey,
                  bottomInset: bottomPadding,
                  controller: _inputController,
                  onSendText: _sendMessage,
                  onSendVoice: _sendVoice,
                  onSendImages: _sendImages,
                  onPanelChanged: (open) {
                    // 语音/相册/表情面板打开时腾出纵向空间。
                    if (open && _descExpanded) {
                      setState(() => _descExpanded = false);
                    }
                  },
                )
              else
                _JoinCommunityBar(bottomInset: bottomPadding, onTap: _join),
            ],
          ),
        ],
      ),
    );
  }
}

enum _GroupMoreAction { report, leave }

class _DetailsAppBar extends StatelessWidget {
  const _DetailsAppBar({
    required this.group,
    required this.isJoined,
    required this.descExpanded,
    required this.onMoreTap,
    required this.onToggleDesc,
  });

  final PopularGroupItem group;
  final bool isJoined;
  final bool descExpanded;
  final VoidCallback onMoreTap;
  final VoidCallback onToggleDesc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: SvgPicture.asset(AppAssets.chatBack, width: 17, height: 7),
          ),
          if (!descExpanded) ...[
            Flexible(
              child: Text(
                group.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 6),
            GroupLevelBadge(level: group.level),
            const SizedBox(width: 8),
            _DescToggleChip(
              expanded: false,
              joinedStyle: isJoined,
              onTap: onToggleDesc,
            ),
          ],
          const Spacer(),
          IconButton(
            onPressed: onMoreTap,
            icon: SvgPicture.asset(
              AppAssets.msgMore,
              width: 22,
              height: 22,
              colorFilter: const ColorFilter.mode(
                AppColors.textPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 简介展开/折叠芯片；已加入样式为深绿底 + 亮绿字。
class _DescToggleChip extends StatelessWidget {
  const _DescToggleChip({
    required this.expanded,
    required this.joinedStyle,
    required this.onTap,
  });

  final bool expanded;
  final bool joinedStyle;
  final VoidCallback onTap;

  static const Color _joinedBg = Color(0xFF1A3A28);
  static const Color _joinedFg = Color(0xFFB8FF6A);

  @override
  Widget build(BuildContext context) {
    final bg = joinedStyle ? _joinedBg : Colors.white.withValues(alpha: 0.12);
    final fg = joinedStyle ? _joinedFg : AppColors.textPrimary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 5, 8, 5),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              // forya 始终将该芯片标为 "See More"（上 = 折叠，下 = 展开）。
              'See More',
              style: TextStyle(
                color: fg,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(
              expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: fg,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({
    required this.group,
    required this.isJoined,
    required this.onCollapse,
    required this.onMembersTap,
  });

  final PopularGroupItem group;
  final bool isJoined;
  final VoidCallback onCollapse;
  final VoidCallback onMembersTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: NetworkOrAssetAvatar(
                  asset: group.avatarAsset,
                  url: group.avatarUrl,
                  width: 72,
                  height: 72,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            group.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        GroupLevelBadge(level: group.level),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.tagBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        group.category,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: onMembersTap,
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                AppAssets.homePerson,
                                width: 11,
                                height: 11,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                '${group.memberCount}',
                                style: const TextStyle(
                                  color: AppColors.textTertiary,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Image.asset(AppAssets.homeImg, width: 11, height: 11),
                        const SizedBox(width: 3),
                        Text(
                          '${group.postCount}',
                          style: const TextStyle(
                            color: AppColors.textTertiary,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // forya chat_group_page：简介始终 maxLines: 3；芯片折叠整个头部。
          Text(
            group.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: _DescToggleChip(
              expanded: true,
              joinedStyle: isJoined,
              onTap: onCollapse,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBody extends StatelessWidget {
  const _ChatBody({
    required this.tabIndex,
    required this.isJoined,
    required this.sentMessages,
    required this.photos,
    required this.messagesScroll,
    required this.onTabChanged,
    required this.onPhotoTap,
    this.onSenderAvatarTap,
    this.onBlankTap,
  });

  final int tabIndex;
  final bool isJoined;
  final List<_OutgoingMessage> sentMessages;
  final List<GroupPhotoSection> photos;
  final ScrollController messagesScroll;
  final ValueChanged<int> onTabChanged;
  final ValueChanged<int> onPhotoTap;
  final ValueChanged<_OutgoingMessage>? onSenderAvatarTap;
  final VoidCallback? onBlankTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TabLabel(
                  label: 'Messages',
                  selected: tabIndex == 0,
                  onTap: () => onTabChanged(0),
                ),
                const SizedBox(width: 28),
                _TabLabel(
                  label: 'Photos',
                  selected: tabIndex == 1,
                  onTap: () => onTabChanged(1),
                ),
              ],
            ),
          ),
          Expanded(
            child: tabIndex == 0
                ? _MessagesFeed(
                    isJoined: isJoined,
                    sentMessages: sentMessages,
                    scrollController: messagesScroll,
                    onBlankTap: onBlankTap,
                    onSenderAvatarTap: onSenderAvatarTap,
                  )
                : _PhotosGrid(
                    isJoined: isJoined,
                    sections: photos,
                    onPhotoTap: onPhotoTap,
                  ),
          ),
        ],
      ),
    );
  }
}

class _TabLabel extends StatelessWidget {
  const _TabLabel({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: selected
                  ? const Color(0xFF111111)
                  : AppColors.textTertiary,
              fontSize: 16,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            height: 3,
            width: selected ? 28 : 0,
            decoration: BoxDecoration(
              color: const Color(0xFF1CFF8A),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessagesFeed extends StatelessWidget {
  const _MessagesFeed({
    required this.isJoined,
    required this.sentMessages,
    required this.scrollController,
    this.onBlankTap,
    this.onSenderAvatarTap,
  });

  final bool isJoined;
  final List<_OutgoingMessage> sentMessages;
  final ScrollController scrollController;
  final VoidCallback? onBlankTap;
  final ValueChanged<_OutgoingMessage>? onSenderAvatarTap;

  bool _sameSender(_OutgoingMessage a, _OutgoingMessage b) {
    if (a.isSelf != b.isSelf) return false;
    final au = a.senderUid.trim();
    final bu = b.senderUid.trim();
    if (au.isNotEmpty && bu.isNotEmpty) return au == bu;
    final an = a.senderName.trim();
    final bn = b.senderName.trim();
    if (an.isNotEmpty && bn.isNotEmpty) return an == bn;
    return a.isSelf && b.isSelf;
  }

  @override
  Widget build(BuildContext context) {
    // 群历史走 IM（环信），不是 REST。在 SDK 接通前，仅展示
    // 本会话内发出的消息，避免信息流出现假布局数据。
    if (sentMessages.isEmpty) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onBlankTap,
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(16, 48, 16, 20),
          children: [
            Text(
              'No messages yet',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFAEAEAE),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onBlankTap,
      child: ListView(
        controller: scrollController,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
        children: [
          for (var i = 0; i < sentMessages.length; i++) ...[
            if (_shouldShowOutgoingTimestamp(sentMessages, i)) ...[
              SizedBox(height: i == 0 ? 0 : 14),
              _TimestampLabel(_formatChatTimestamp(sentMessages[i].sentAt)),
              const SizedBox(height: 10),
            ] else
              SizedBox(height: i == 0 ? 0 : 10),
            if (sentMessages[i].kind == _OutgoingKind.join)
              _JoinCommunityTip(name: sentMessages[i].joinName ?? 'Someone')
            else
              _GroupChatBubble(
                message: sentMessages[i],
                isLocked: !isJoined,
                showAvatar:
                    i == 0 ||
                    sentMessages[i - 1].kind == _OutgoingKind.join ||
                    !_sameSender(sentMessages[i], sentMessages[i - 1]) ||
                    sentMessages[i].kind != sentMessages[i - 1].kind,
                onAvatarTap: sentMessages[i].isSelf || onSenderAvatarTap == null
                    ? null
                    : () => onSenderAvatarTap!(sentMessages[i]),
                onImageTap:
                    !isJoined || sentMessages[i].kind != _OutgoingKind.image
                    ? null
                    : () {
                        final paths = [
                          for (final m in sentMessages)
                            if (m.kind == _OutgoingKind.image &&
                                (m.imagePath ?? '').trim().isNotEmpty)
                              m.imagePath!.trim(),
                        ];
                        final src = sentMessages[i].imagePath?.trim() ?? '';
                        final initial = paths.indexOf(src);
                        AlbumPhotoViewerPage.open(
                          context,
                          paths: paths,
                          initialIndex: initial < 0 ? 0 : initial,
                          showPageIndicator: false,
                        );
                      },
              ),
          ],
        ],
      ),
    );
  }
}

class _TimestampLabel extends StatelessWidget {
  const _TimestampLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFFAEAEAE),
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.2,
        ),
      ),
    );
  }
}

class _OutgoingKind {
  static const text = 0;
  static const voice = 1;
  static const image = 2;
  static const join = 3;
}

/// 首条消息或间隔 ≥ 5 分钟时显示时间分隔。
bool _shouldShowOutgoingTimestamp(List<_OutgoingMessage> list, int index) {
  if (index <= 0) return true;
  final prev = list[index - 1].sentAt;
  final curr = list[index].sentAt;
  return curr.difference(prev).abs() >= const Duration(minutes: 5);
}

String _formatChatTimestamp(DateTime time) {
  const months = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  final now = DateTime.now();
  final local = time.toLocal();
  final hour24 = local.hour;
  final period = hour24 >= 12 ? 'PM' : 'AM';
  final hour12 = hour24 % 12 == 0 ? 12 : hour24 % 12;
  final minute = local.minute.toString().padLeft(2, '0');
  final clock = '$hour12:$minute $period';

  final today = DateTime(now.year, now.month, now.day);
  final day = DateTime(local.year, local.month, local.day);
  final diffDays = today.difference(day).inDays;

  if (diffDays == 0) return clock;
  if (diffDays == 1) return 'Yesterday $clock';
  return '${months[local.month - 1]} ${local.day} $clock';
}

class _OutgoingMessage {
  const _OutgoingMessage._({
    required this.kind,
    required this.sentAt,
    this.text,
    this.voiceSeconds,
    this.imagePath,
    this.mediaSource,
    this.joinName,
    this.joinUid,
    this.msgId = '',
    this.isSelf = true,
    this.senderAvatar = '',
    this.senderName = '',
    this.senderUid = '',
    this.senderGender = '',
  });

  factory _OutgoingMessage.text(
    String text, {
    DateTime? at,
    String msgId = '',
    bool isSelf = true,
    String senderAvatar = '',
    String senderName = '',
    String senderUid = '',
    String senderGender = '',
  }) => _OutgoingMessage._(
    kind: _OutgoingKind.text,
    text: text,
    sentAt: at ?? DateTime.now(),
    msgId: msgId,
    isSelf: isSelf,
    senderAvatar: senderAvatar,
    senderName: senderName,
    senderUid: senderUid,
    senderGender: senderGender,
  );

  factory _OutgoingMessage.voice(
    int seconds, {
    DateTime? at,
    String msgId = '',
    bool isSelf = true,
    String mediaSource = '',
    String senderAvatar = '',
    String senderName = '',
    String senderUid = '',
    String senderGender = '',
  }) => _OutgoingMessage._(
    kind: _OutgoingKind.voice,
    voiceSeconds: seconds,
    mediaSource: mediaSource,
    sentAt: at ?? DateTime.now(),
    msgId: msgId,
    isSelf: isSelf,
    senderAvatar: senderAvatar,
    senderName: senderName,
    senderUid: senderUid,
    senderGender: senderGender,
  );

  factory _OutgoingMessage.image(
    String path, {
    DateTime? at,
    String msgId = '',
    bool isSelf = true,
    String senderAvatar = '',
    String senderName = '',
    String senderUid = '',
    String senderGender = '',
  }) => _OutgoingMessage._(
    kind: _OutgoingKind.image,
    imagePath: path,
    sentAt: at ?? DateTime.now(),
    msgId: msgId,
    isSelf: isSelf,
    senderAvatar: senderAvatar,
    senderName: senderName,
    senderUid: senderUid,
    senderGender: senderGender,
  );

  factory _OutgoingMessage.join(
    String name, {
    String uid = '',
    DateTime? at,
    String msgId = '',
    String senderAvatar = '',
    String senderGender = '',
  }) => _OutgoingMessage._(
    kind: _OutgoingKind.join,
    joinName: name,
    joinUid: uid,
    sentAt: at ?? DateTime.now(),
    msgId: msgId,
    isSelf: false,
    senderName: name,
    senderUid: uid,
    senderAvatar: senderAvatar,
    senderGender: senderGender,
  );

  final int kind;
  final DateTime sentAt;
  final String? text;
  final int? voiceSeconds;
  final String? imagePath;

  /// 语音本地 / 远程播放源（对齐私聊 mediaSource）。
  final String? mediaSource;
  final String? joinName;
  final String? joinUid;
  final String msgId;
  final bool isSelf;
  final String senderAvatar;
  final String senderName;
  final String senderUid;
  final String senderGender;

  bool get hasSenderGender => normalizeGender(senderGender) != null;

  /// 归一化为 `male` / `female`；未设置返回 null。
  static String? normalizeGender(String? raw) {
    final g = (raw ?? '').trim().toLowerCase();
    if (g == 'male' || g == 'm' || g == '1') return 'male';
    if (g == 'female' || g == 'f' || g == '2') return 'female';
    return null;
  }

  _OutgoingMessage copyWith({
    String? senderAvatar,
    String? senderName,
    String? senderUid,
    String? senderGender,
    String? msgId,
    String? mediaSource,
  }) {
    return _OutgoingMessage._(
      kind: kind,
      sentAt: sentAt,
      text: text,
      voiceSeconds: voiceSeconds,
      imagePath: imagePath,
      mediaSource: mediaSource ?? this.mediaSource,
      joinName: joinName,
      joinUid: joinUid,
      msgId: msgId ?? this.msgId,
      isSelf: isSelf,
      senderAvatar: senderAvatar ?? this.senderAvatar,
      senderName: senderName ?? this.senderName,
      senderUid: senderUid ?? this.senderUid,
      senderGender: senderGender ?? this.senderGender,
    );
  }

  bool get senderIsMale => normalizeGender(senderGender) == 'male';
}

/// Forya CustomGroupJoinItem：青绿昵称 + 灰色 "joined the community"。
class _JoinCommunityTip extends StatelessWidget {
  const _JoinCommunityTip({required this.name});

  final String name;

  static const _nameColor = Color(0xFF00D68F);
  static const _restColor = Color(0xFFBCBCBC);

  @override
  Widget build(BuildContext context) {
    final display = name.trim().isEmpty ? 'Someone' : name.trim();
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: display,
                style: const TextStyle(
                  color: _nameColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
              const TextSpan(
                text: '  joined the community',
                style: TextStyle(
                  color: _restColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _GroupChatBubble extends StatelessWidget {
  const _GroupChatBubble({
    required this.message,
    this.showAvatar = true,
    this.isLocked = false,
    this.onImageTap,
    this.onAvatarTap,
  });

  final _OutgoingMessage message;
  final bool showAvatar;
  final bool isLocked;
  final VoidCallback? onImageTap;
  final VoidCallback? onAvatarTap;

  static const double _avatar = 40;
  static const double _avatarGap = 10;
  static const double _bubbleMax = 260;

  @override
  Widget build(BuildContext context) {
    final isSelf = message.isSelf;
    Widget avatar = showAvatar
        ? ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: NetworkOrAssetAvatar(
              asset: AppAssets.avatarPlace,
              url: message.senderAvatar,
              width: _avatar,
              height: _avatar,
            ),
          )
        : const SizedBox(width: _avatar);
    if (showAvatar && onAvatarTap != null) {
      avatar = GestureDetector(
        onTap: onAvatarTap,
        behavior: HitTestBehavior.opaque,
        child: avatar,
      );
    }

    Widget imageBubble() {
      final path = (message.imagePath ?? '').trim();
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isSelf ? 18 : 4),
          topRight: Radius.circular(isSelf ? 4 : 18),
          bottomLeft: const Radius.circular(18),
          bottomRight: const Radius.circular(18),
        ),
        child: _OutgoingImage(path: path, locked: isLocked),
      );
    }

    final bubble = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: _bubbleMax),
      child: switch (message.kind) {
        _OutgoingKind.voice => _GroupVoiceBubble(
          seconds: message.voiceSeconds ?? 0,
          isSelf: isSelf,
          locked: isLocked,
          mediaSource: message.mediaSource ?? '',
          msgId: message.msgId,
        ),
        _OutgoingKind.image =>
          onImageTap == null
              ? imageBubble()
              : GestureDetector(
                  onTap: onImageTap,
                  behavior: HitTestBehavior.opaque,
                  child: imageBubble(),
                ),
        _ => _GroupTextBubble(text: message.text ?? '', isSelf: isSelf),
      },
    );

    // 群聊对方：头像旁显示昵称 + 性别（未设置性别则只显示昵称）。
    final peerBody = !isSelf
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showAvatar) ...[
                _GroupSenderNameRow(message: message),
                const SizedBox(height: 6),
              ],
              bubble,
            ],
          )
        : bubble;

    if (isSelf) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bubble,
          const SizedBox(width: _avatarGap),
          avatar,
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avatar,
        const SizedBox(width: _avatarGap),
        Flexible(child: peerBody),
      ],
    );
  }
}

/// 群聊对方昵称 + 性别图标（对齐 forya SexAgeLabel isOnlySex）。
class _GroupSenderNameRow extends StatelessWidget {
  const _GroupSenderNameRow({required this.message});

  final _OutgoingMessage message;

  @override
  Widget build(BuildContext context) {
    final name = message.senderName.trim().isEmpty
        ? 'User'
        : message.senderName.trim();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFFAEAEAE),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ),
        if (message.hasSenderGender) ...[
          const SizedBox(width: 2),
          Image.asset(
            message.senderIsMale ? AppAssets.genderMan : AppAssets.genderWoman,
            width: 16,
            height: 16,
          ),
        ],
      ],
    );
  }
}

/// 文本 / forya 自定义表情（PUA）。纯表情时放大且不套灰气泡，对齐 forya。
class _GroupTextBubble extends StatelessWidget {
  const _GroupTextBubble({required this.text, required this.isSelf});

  final String text;
  final bool isSelf;

  @override
  Widget build(BuildContext context) {
    final pureEmoji = AppEmoji.isCustomEmojiOnly(text);
    final style =
        (pureEmoji
                ? const TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                    letterSpacing: 1.5,
                  )
                : const TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 20 / 15,
                  ));

    final child = AppEmojiText(text, style: style);
    if (pureEmoji) return child;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: isSelf ? const Color(0xFFB8FF6A) : const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isSelf ? 18 : 4),
          topRight: Radius.circular(isSelf ? 4 : 18),
          bottomLeft: const Radius.circular(18),
          bottomRight: const Radius.circular(18),
        ),
      ),
      child: child,
    );
  }
}

class _OutgoingImage extends StatelessWidget {
  const _OutgoingImage({required this.path, this.locked = false});

  final String path;
  final bool locked;

  /// 对齐私聊 / forya 媒体气泡：约 3:4 竖图，非正方形。
  static const double _w = 132;
  static const double _h = 176;

  Widget _placeholder({required String label}) {
    return Container(
      width: _w,
      height: _h,
      color: const Color(0xFF262624),
      alignment: Alignment.center,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF666666),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _rawImage() {
    final src = path.trim();
    if (src.isEmpty) {
      return _placeholder(label: 'Picture expired');
    }
    if (src.startsWith('http://') || src.startsWith('https://')) {
      return AppNetworkImage(
        src,
        width: _w,
        height: _h,
        fit: BoxFit.cover,
        placeholder: (_, _) => ColoredBox(
          color: locked ? const Color(0xFF3A3A3A) : const Color(0xFFF3F3F3),
          child: const Center(
            child: SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
        errorWidget: (_, _, _) => _placeholder(label: 'Picture expired'),
      );
    }
    if (src.startsWith('assets/')) {
      return Image.asset(
        src,
        width: _w,
        height: _h,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _placeholder(label: 'Picture expired'),
      );
    }
    final file = File(src);
    if (file.existsSync()) {
      return Image.file(
        file,
        width: _w,
        height: _h,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _placeholder(label: 'Picture expired'),
      );
    }
    return _placeholder(label: 'Picture expired');
  }

  @override
  Widget build(BuildContext context) {
    final image = SizedBox(width: _w, height: _h, child: _rawImage());
    if (!locked) return image;

    return SizedBox(
      width: _w,
      height: _h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: image,
          ),
          const ColoredBox(color: Color(0x33000000)),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 32,
              color: Colors.black.withValues(alpha: 0.28),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.lockIcon,
                    width: 14,
                    height: 14,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Join to view',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GroupVoiceBubble extends StatefulWidget {
  const _GroupVoiceBubble({
    required this.seconds,
    required this.isSelf,
    this.mediaSource = '',
    this.msgId = '',
    this.locked = false,
  });

  final int seconds;
  final bool isSelf;
  final String mediaSource;
  final String msgId;
  final bool locked;

  @override
  State<_GroupVoiceBubble> createState() => _GroupVoiceBubbleState();
}

class _GroupVoiceBubbleState extends State<_GroupVoiceBubble>
    with SingleTickerProviderStateMixin {
  static final AudioPlayer _player = AudioPlayer();

  bool _playing = false;
  int _remaining = 0;
  Timer? _playTimer;
  StreamSubscription<void>? _completeSub;
  late final AnimationController _waveController;

  String get _source => widget.mediaSource.trim();

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
  }

  @override
  void dispose() {
    AppVoiceExclusive.release(_stopPlay);
    if (_playing) {
      unawaited(_player.stop());
    }
    unawaited(_completeSub?.cancel() ?? Future<void>.value());
    _playTimer?.cancel();
    _waveController.dispose();
    super.dispose();
  }

  void _stopPlay() {
    _playTimer?.cancel();
    _playTimer = null;
    unawaited(_completeSub?.cancel() ?? Future<void>.value());
    _completeSub = null;
    unawaited(_player.stop());
    _waveController.stop();
    _waveController.reset();
    AppVoiceExclusive.release(_stopPlay);
    if (!mounted) {
      _playing = false;
      _remaining = 0;
      return;
    }
    setState(() {
      _playing = false;
      _remaining = 0;
    });
  }

  Future<void> _togglePlay() async {
    if (widget.locked) return;
    if (widget.seconds <= 0 && _source.isEmpty) return;
    if (_playing) {
      _stopPlay();
      return;
    }
    AppVoiceExclusive.claim(_stopPlay);
    setState(() {
      _playing = true;
      _remaining = widget.seconds > 0 ? widget.seconds : 1;
    });
    _waveController.repeat();

    final src = _source;
    try {
      final playable = await ImService.resolvePlayableMedia(
        mediaSource: src,
        msgId: widget.msgId,
      );
      if (!mounted || !_playing) return;
      if (playable == null || playable.isEmpty) {
        debugPrint('Group voice play failed: no local file');
        _stopPlay();
        return;
      }
      await AppAudioPlayback.play(_player, playable);
      await _completeSub?.cancel();
      _completeSub = _player.onPlayerComplete.listen((_) {
        if (mounted) _stopPlay();
      });
    } catch (error) {
      debugPrint('Group voice play failed: $error');
      if (mounted) _stopPlay();
      return;
    }

    _playTimer?.cancel();
    if (widget.seconds > 0) {
      _playTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }
        if (_remaining <= 1) {
          timer.cancel();
          _playTimer = null;
          _stopPlay();
          return;
        }
        setState(() => _remaining -= 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSelf = widget.isSelf;
    final displaySeconds = _playing ? _remaining : widget.seconds;
    final expired = _source.isEmpty && widget.seconds <= 0;
    final secs = widget.seconds.clamp(1, 60);

    return GestureDetector(
      onTap: (expired || widget.locked) ? null : _togglePlay,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: expired ? 140 : (80 + secs * (200 - 80) / 60).clamp(80.0, 200.0),
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelf ? const Color(0xFFB8FF6A) : const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSelf ? 16 : 4),
            topRight: Radius.circular(isSelf ? 4 : 16),
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (expired)
              const Expanded(
                child: Text(
                  'Voice expired',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            else ...[
              _GroupVoiceBarsIcon(
                playing: _playing,
                animation: _waveController,
              ),
              Text(
                '${displaySeconds > 0 ? displaySeconds : widget.seconds}s',
                style: const TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _GroupVoiceBarsIcon extends StatelessWidget {
  const _GroupVoiceBarsIcon({this.playing = false, this.animation});

  final bool playing;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    if (!playing || animation == null) {
      return const SizedBox(
        width: 16,
        height: 16,
        child: CustomPaint(painter: _GroupVoiceBarsPainter()),
      );
    }
    return AnimatedBuilder(
      animation: animation!,
      builder: (context, _) {
        return SizedBox(
          width: 16,
          height: 16,
          child: CustomPaint(
            painter: _GroupVoiceBarsPainter(
              phase: animation!.value * 2 * math.pi,
              playing: true,
            ),
          ),
        );
      },
    );
  }
}

class _GroupVoiceBarsPainter extends CustomPainter {
  const _GroupVoiceBarsPainter({this.phase = 0, this.playing = false});

  final double phase;
  final bool playing;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF111111)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    const widths = 2.4;
    final base = [size.height * 0.45, size.height, size.height * 0.62];
    final gap = (size.width - widths * 3) / 2;
    for (var i = 0; i < 3; i++) {
      var h = base[i];
      if (playing) {
        final pulse = 0.55 + 0.45 * ((math.sin(phase + i * 1.7) + 1) / 2);
        h = size.height * (0.28 + 0.72 * pulse * (base[i] / size.height));
      }
      final x = i * (widths + gap);
      final y = (size.height - h) / 2;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, widths, h),
          const Radius.circular(1.2),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _GroupVoiceBarsPainter oldDelegate) {
    return oldDelegate.phase != phase || oldDelegate.playing != playing;
  }
}

class _PhotosGrid extends StatelessWidget {
  const _PhotosGrid({
    required this.isJoined,
    required this.sections,
    required this.onPhotoTap,
  });

  final bool isJoined;
  final List<GroupPhotoSection> sections;
  final ValueChanged<int> onPhotoTap;

  @override
  Widget build(BuildContext context) {
    if (!isJoined) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppAssets.groupUnjoinedLock,
                width: 140,
                height: 140,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const Text(
                'Want to see everything?\nJoin the group!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF9A9A9A),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  height: 1.45,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (sections.isEmpty) {
      return const Center(
        child: Text(
          'No photos yet',
          style: TextStyle(
            color: Color(0xFFAEAEAE),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    // 对齐 forya ChatGroupPhotosPage：periodName 标题 + 4 列网格。
    var globalIndex = 0;
    final slivers = <Widget>[];
    for (final section in sections) {
      final label = section.periodName.trim();
      if (label.isNotEmpty) {
        slivers.add(
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 12),
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFFBCBCBC),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        slivers.add(const SliverToBoxAdapter(child: SizedBox(height: 12)));
      }

      final startIndex = globalIndex;
      final count = section.urls.length;
      globalIndex += count;
      slivers.add(
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final flatIndex = startIndex + index;
              return GestureDetector(
                onTap: () => onPhotoTap(flatIndex),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: _GroupPhotoImage(src: section.urls[index]),
                ),
              );
            }, childCount: count),
          ),
        ),
      );
    }
    slivers.add(const SliverToBoxAdapter(child: SizedBox(height: 20)));

    return CustomScrollView(slivers: slivers);
  }
}

class _GroupPhotoViewerPage extends StatefulWidget {
  const _GroupPhotoViewerPage({
    required this.photos,
    required this.initialIndex,
  });

  final List<String> photos;
  final int initialIndex;

  @override
  State<_GroupPhotoViewerPage> createState() => _GroupPhotoViewerPageState();
}

class _GroupPhotoViewerPageState extends State<_GroupPhotoViewerPage> {
  late final PageController _pageController = PageController(
    initialPage: widget.initialIndex,
  );
  late int _currentIndex = widget.initialIndex;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    final total = widget.photos.length;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: total,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              return InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Center(
                  child: _GroupPhotoImage(
                    src: widget.photos[index],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: top + 4,
            left: 8,
            right: 8,
            child: SizedBox(
              height: 44,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: SvgPicture.asset(
                        AppAssets.chatBack,
                        width: 17,
                        height: 7,
                      ),
                    ),
                  ),
                  Text(
                    '${_currentIndex + 1}/$total',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _JoinCommunityBar extends StatelessWidget {
  const _JoinCommunityBar({required this.bottomInset, required this.onTap});

  final double bottomInset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 10 + bottomInset),
        child: Material(
          color: const Color(0xFF1CFF8A),
          borderRadius: BorderRadius.circular(28),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(28),
            child: const SizedBox(
              height: 52,
              child: Center(
                child: Text(
                  'Join Community',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GroupPhotoImage extends StatelessWidget {
  const _GroupPhotoImage({required this.src, this.fit = BoxFit.cover});

  final String src;
  final BoxFit fit;

  bool get _isNetwork =>
      src.startsWith('http://') || src.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    if (_isNetwork) {
      return AppNetworkImage(
        src,
        fit: fit,
        width: double.infinity,
        height: double.infinity,
        memCacheWidth: 1080,
        errorWidget: (_, _, _) => const ColoredBox(color: Color(0xFF2C2C2E)),
      );
    }
    return Image.asset(
      src,
      fit: fit,
      errorBuilder: (_, _, _) => const SizedBox.shrink(),
    );
  }
}

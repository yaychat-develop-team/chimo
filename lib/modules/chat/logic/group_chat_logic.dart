import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/storage/user_store.dart';
import '../../../app/service/im_service.dart';
import '../../../app/chimo_api.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/group/group.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/utils/app_log.dart';
import '../../../common/utils/app_toast.dart';
import '../model/chat_conversation.dart';
import '../model/chat_line.dart';
import 'chat_base_logic.dart';

/// 群聊页的数据与动作。
///
/// 和 [DmChatLogic] 共用 [ChatBaseLogic] 的消息流、去重集合与那几个
/// 纯操作；群聊自己多出来的是**成员身份**（[isJoined]）、群相册、以及
/// 「发送者头像 / 性别按 uid 补全」那套缓存 —— 私聊只有一个对端，不需要。
///
/// 边界和私聊一致：滚动位置、`GlobalKey`、面板相位、资料弹层留在 View，
/// Controller 不 import material）。
class GroupChatLogic extends ChatBaseLogic {
  GroupChatLogic({required this.group});

  /// 群资料（名称 / 头像 / 简介 / 成员数）。路由参数带进来后全程只读 ——
  /// 会变的只有 [isJoined]。
  final GroupInfo group;

  /// 是否已加入。乐观翻转 + 失败回滚（见 [join] / [leave]）。
  late final RxBool isJoined = group.isJoin.obs;

  /// 头部简介是否展开。输入栏的面板打开时会被收起（要纵向空间）。
  final RxBool descExpanded = true.obs;

  /// 0 = 聊天，1 = 相册。发消息时会拨回 0。
  final RxInt tabIndex = 0.obs;

  /// 群相册分组。**整体替换**而不是增删，所以用 `Rx<List>` 而非 `RxList`：
  /// 传给子 widget 时读 `.value` 就登记上依赖了（`RxList` 直接传下去不登记，
  /// 见 [ChatBaseLogic.messages] 那条注释）。
  final Rx<List<GroupPhoto>> photoSections = Rx<List<GroupPhoto>>(const []);

  /// uid → 头像 URL（消息 attributes 缺 avatar 时用资料接口补全）。
  final Map<String, String> _senderAvatarByUid = {};

  /// uid → `male` / `female`（消息 attributes 缺 gender 时用资料接口补全）。
  final Map<String, String> _senderGenderByUid = {};

  /// 已查过资料的 uid（含未设置性别），避免重复请求。
  final Set<String> _senderProfileLookupDone = {};
  final Set<String> _profileFetchInFlight = {};

  /// 滚到底：`ScrollController` 在 View 里，这里只发号令。
  /// `force` = 反复跳到布局稳定（进页面 / 加载历史）。
  void Function({bool force})? onScrollToBottom;

  /// View 在 `initState` 里转接过来。
  void Function(bool joined)? onMembershipChanged;

  String get emGroupId => group.gid;

  /// 群聊的环信会话 id 就是群 id —— 基类的撤回 / 删除靠这两个值分流。
  @override
  String get imConversationId => emGroupId;

  @override
  bool get isGroupConversation => true;

  /// 群聊发出消息的对端公共 attributes（群名 / 头像 / 群 id）。
  ImPeerAttrs get groupPeerAttrs =>
      ImPeerAttrs(name: group.name.trim(), avatar: group.avatar.trim(), userid: group.gid);

  List<String> get flatPhotos => [for (final s in photoSections.value) ...s.photoList];

  String get _selfAvatar => selfAvatarUrl.value ?? '';

  @override
  void onInit() {
    super.onInit();
    unawaited(loadSelfAvatar());
    unawaited(loadPhotos());
    listenIm(onImMessage);
    chats.setActiveConversation(emGroupId);
    // 未加入也拉最近 10 条预览（对齐 forya）；图片加锁模糊。
    unawaited(loadImHistory());
  }

  @override
  void onClose() {
    chats.setActiveConversation(null);
    super.onClose();
  }

  /// 群聊这边预览是实打实要写的（私聊那边由 `afterSend` 负责）。
  @override
  void syncListPreview(String conversationId, String preview) {
    chats.onNewMessage(
      id: conversationId,
      title: group.name,
      avatarAsset: AppAssets.avatarPlace,
      lastMessage: preview,
      badge: ChatBadgeType.group,
    );
  }

  void notifyNewMessage(String preview) => syncListPreview(group.gid, preview);

  Future<void> loadSelfAvatar() async {
    final url = UserStore.currentUser.avatarUrl?.trim() ?? '';
    if (isClosed || url.isEmpty) return;
    selfAvatarUrl.value = url;
  }

  Future<void> loadImHistory() async {
    final gid = emGroupId;
    if (gid.isEmpty) return;
    final previewLimit = isJoined.value ? 40 : 10;
    try {
      if (!ImService.isConnected) {
        await ImService.connectFromServer();
      }
      final page = await ImService.loadHistory(gid, count: previewLimit, isGroup: true);
      if (isClosed) return;
      final added = <ChatLine>[];
      for (final m in page.messages) {
        if (m.msgType == 'ignored' || m.isSdkRecall) continue;
        if (m.id.isNotEmpty && seenMsgIds.contains(m.id)) continue;
        final line = lineFromIm(m);
        if (line == null) continue;
        if (m.id.isNotEmpty) seenMsgIds.add(m.id);
        added.add(line);
      }
      if (added.isEmpty) return;
      // 历史到达后丢弃无环信 id 的临时入群提示。
      messages.removeWhere((m) => m.kind == ChatLineKind.join && m.msgId.isEmpty);
      messages.insertAll(0, added);
      messages.sort((a, b) => a.sentAt.compareTo(b.sentAt));
      if (!isJoined.value && messages.length > 10) {
        final drop = messages.length - 10;
        for (final m in messages.take(drop)) {
          if (m.msgId.isNotEmpty) seenMsgIds.remove(m.msgId);
        }
        messages.removeRange(0, drop);
      }
      onScrollToBottom?.call(force: true);
      if (isJoined.value) {
        unawaited(ImService.markConversationRead(gid, isGroup: true));
      }
      unawaited(hydrateMissingSenderProfiles());
    } catch (error) {
      AppLog.w('GroupDetails loadImHistory', error: error);
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
    final normalized = ChatLine.normalizeGender(gender);
    if (normalized == null) return;
    _senderGenderByUid[id] = normalized;
  }

  void _rememberSenderProfile(User profile) {
    if (profile.id <= Int64.ZERO) return;
    final uid = profile.uid;
    final url = profile.avatar.trim();
    if (url.isNotEmpty) _rememberSenderAvatar(uid, url);
    if (profile.genderKnown) {
      _rememberSenderGender(uid, profile.male ? 'male' : 'female');
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
    if (isSelf && _selfAvatar.trim().isNotEmpty) {
      return _selfAvatar.trim();
    }
    final cached = _senderAvatarByUid[uid.trim()];
    if (cached != null && cached.isNotEmpty) return cached;
    return '';
  }

  String _resolvedSenderGender({required String uid, required String gender}) {
    final fromMsg = ChatLine.normalizeGender(gender);
    if (fromMsg != null) {
      _rememberSenderGender(uid, fromMsg);
      return fromMsg;
    }
    return _senderGenderByUid[uid.trim()] ?? '';
  }

  /// 历史/实时消息若 attributes 缺 avatar / gender，按 userid 拉资料补全。
  Future<void> hydrateMissingSenderProfiles() async {
    final need = <String>{};
    for (final m in messages) {
      if (m.isSelf) continue;
      final uid = m.senderUid.trim();
      if (uid.isEmpty) continue;
      if (m.senderAvatar.trim().isNotEmpty) {
        _rememberSenderAvatar(uid, m.senderAvatar);
      }
      if (m.hasSenderGender) {
        _rememberSenderGender(uid, m.senderGender);
      }
      final needAvatar = m.senderAvatar.trim().isEmpty && !_senderAvatarByUid.containsKey(uid);
      final needGender =
          !m.hasSenderGender &&
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
        final res = await ChimoApis.user.profileByUidOrNull(uid);
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
    if (isClosed) return;
    // 自己会通知，标记就没用了。
    for (var i = 0; i < messages.length; i++) {
      final m = messages[i];
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
      if (cachedGender != null && cachedGender.isNotEmpty && !m.hasSenderGender) {
        next = next.copyWith(senderGender: cachedGender);
      }
      if (!identical(next, m) &&
          (next.senderAvatar != m.senderAvatar || next.senderGender != m.senderGender)) {
        messages[i] = next;
      }
    }
  }

  void onImMessage(ImChatMessage m) {
    final gid = emGroupId;
    if (gid.isEmpty) return;
    if (m.conversationId != gid && m.to != gid) return;
    if (m.msgType == 'ignored') return;
    if (m.isSdkRecall) {
      final id = m.id.trim();
      if (id.isEmpty || isClosed) return;
      removeByMsgId(id);
      return;
    }
    if (m.msgType == 'recall') {
      applyRecall(m);
      return;
    }
    if (m.id.isNotEmpty && seenMsgIds.contains(m.id)) {
      if (isClosed) return;
      backfillOutgoingFromIm(m);
      return;
    }
    final line = lineFromIm(m);
    if (line == null) {
      if (m.isSelf && m.id.isNotEmpty) {
        if (isClosed) return;
        backfillOutgoingFromIm(m);
      }
      return;
    }
    if (m.id.isNotEmpty) seenMsgIds.add(m.id);
    if (isClosed) return;
    // 合并成功就不再追加；两条路都要给非成员的 10 条上限让位。
    if (!mergeOutgoingFromIm(line)) messages.add(line);
    if (!isJoined.value && messages.length > 10) {
      final removed = messages.removeAt(0);
      if (removed.msgId.isNotEmpty) seenMsgIds.remove(removed.msgId);
    }
    // 列表预览 / 未读由 ChatsListLogic 的 IM 订阅处理。
    onScrollToBottom?.call();
    final needProfile =
        line.senderUid.trim().isNotEmpty &&
        (line.senderAvatar.trim().isEmpty || !line.hasSenderGender);
    if (needProfile) {
      unawaited(hydrateMissingSenderProfiles());
    }
  }

  bool outgoingContentMatches(ChatLine local, ChatLine incoming) {
    if (!local.isSelf || !incoming.isSelf || local.kind != incoming.kind) {
      return false;
    }
    switch (incoming.kind) {
      case ChatLineKind.text:
        return local.text == incoming.text;
      case ChatLineKind.voice:
        return local.voiceSeconds == incoming.voiceSeconds;
      case ChatLineKind.image:
      case ChatLineKind.emote:
        // 乐观消息用本地路径，IM 回调用远程 URL，按「最后一条无 id 的自发送图」合并。
        return local.msgId.isEmpty;
      default:
        return false;
    }
  }

  /// IM 流先到达时，把服务端 msgId 回填到本地乐观消息。
  bool mergeOutgoingFromIm(ChatLine incoming) {
    final idx = messages.lastIndexWhere(
      (e) => e.msgId.isEmpty && outgoingContentMatches(e, incoming),
    );
    if (idx < 0) return false;
    final prev = messages[idx];
    final keepLocalImage =
        incoming.kind == ChatLineKind.image || incoming.kind == ChatLineKind.emote;
    messages[idx] = incoming.copyWith(
      mediaSource: keepLocalImage && prev.mediaSource.trim().isNotEmpty
          ? prev.mediaSource
          : incoming.mediaSource,
      sentAt: incoming.sentAt.millisecondsSinceEpoch > 0 ? incoming.sentAt : prev.sentAt,
    );
    return true;
  }

  ChatLineKind? outgoingKindFromMsgType(String msgType) {
    switch (msgType) {
      case 'txt':
        return ChatLineKind.text;
      case 'voice':
        return ChatLineKind.voice;
      case 'image':
        return ChatLineKind.image;
      case 'emote':
        return ChatLineKind.emote;
      default:
        return null;
    }
  }

  void backfillOutgoingFromIm(ImChatMessage m) {
    final incoming = lineFromIm(m);
    if (incoming == null) {
      if (!m.isSelf || m.id.isEmpty) return;
      final kind = outgoingKindFromMsgType(m.msgType);
      if (kind == null) return;
      for (var i = messages.length - 1; i >= 0; i--) {
        final e = messages[i];
        if (!e.isSelf || e.msgId.isNotEmpty || e.kind != kind) continue;
        final sentAt = m.serverTimeMs > 0
            ? DateTime.fromMillisecondsSinceEpoch(m.serverTimeMs)
            : e.sentAt;
        messages[i] = e.copyWith(msgId: m.id, sentAt: sentAt);
        return;
      }
      return;
    }
    final idx = messages.indexWhere((e) => e.msgId == m.id);
    if (idx >= 0) {
      if (m.serverTimeMs > 0 && messages[idx].sentAt.millisecondsSinceEpoch == 0) {
        messages[idx] = messages[idx].copyWith(
          sentAt: DateTime.fromMillisecondsSinceEpoch(m.serverTimeMs),
        );
      }
      return;
    }
    if (mergeOutgoingFromIm(incoming)) return;
    if (!m.isSelf || m.id.isEmpty) return;
    for (var i = messages.length - 1; i >= 0; i--) {
      final e = messages[i];
      if (!e.isSelf || e.msgId.isNotEmpty || e.kind != incoming.kind) continue;
      switch (incoming.kind) {
        case ChatLineKind.text:
          if (e.text != incoming.text) continue;
        case ChatLineKind.voice:
          if (e.voiceSeconds != incoming.voiceSeconds) continue;
        case ChatLineKind.image:
        case ChatLineKind.emote:
          messages[i] = incoming.copyWith(
            mediaSource: e.mediaSource.trim().isNotEmpty ? e.mediaSource : incoming.mediaSource,
            sentAt: incoming.sentAt.millisecondsSinceEpoch > 0 ? incoming.sentAt : e.sentAt,
          );
          return;
        default:
          continue;
      }
    }
  }

  ChatLine? lineFromIm(ImChatMessage m) {
    final at = m.serverTimeMs > 0
        ? DateTime.fromMillisecondsSinceEpoch(m.serverTimeMs)
        : DateTime.now();
    final name = m.senderName;
    final uid = m.senderUid;
    final gender = _resolvedSenderGender(uid: uid, gender: m.senderGender);
    final avatar = _resolvedSenderAvatar(uid: uid, avatar: m.senderAvatar, isSelf: m.isSelf);
    switch (m.msgType) {
      case 'recall':
        return ChatLine.recall(at: at, msgId: m.id, isSelf: m.isSelf, senderName: name);
      case 'join':
        return ChatLine.join(
          m.joinName.isEmpty ? 'Someone' : m.joinName,
          uid: m.joinUid,
          at: at,
          msgId: m.id,
          senderAvatar: avatar,
          senderGender: gender,
        );
      case 'txt':
        return ChatLine.text(
          m.text,
          at: at,
          msgId: m.id,
          isSelf: m.isSelf,
          senderAvatar: avatar,
          senderName: name,
          senderUid: uid,
          senderGender: gender,
          quoteMsgId: m.quoteMsgId,
          quoteShowText: m.quoteShowText,
          quoteSendName: m.quoteSendName,
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
        final local = ImService.stripFileUri(m.mediaLocalPath.trim());
        final display = src.isNotEmpty ? src : (m.isSelf && local.isNotEmpty ? local : '');
        if (display.isEmpty) return null;
        return ChatLine.image(
          display,
          at: at,
          msgId: m.id,
          isSelf: m.isSelf,
          senderAvatar: avatar,
          senderName: name,
          senderUid: uid,
          senderGender: gender,
        );
      case 'voice':
        return ChatLine.voice(
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
        return ChatLine.emote(
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

  Future<void> loadPhotos() async {
    try {
      final res = await ChimoApis.group.photos(group.gid);
      if (isClosed || !res.ok) return;
      final sections = res.data ?? const <GroupPhoto>[];
      if (sections.isEmpty) return;
      photoSections.value = sections;
    } catch (error) {
      // 群相册拉不到时页面是空白的，用户会以为「没照片」—— 留痕以便区分。
      AppLog.w('GroupDetails load photos failed', error: error);
    }
  }

  Future<void> join() async {
    if (isJoined.value) return;
    isJoined.value = true;
    final joined = group.withJoined(true);
    chats.joinGroup(joined);
    onMembershipChanged?.call(true);
    try {
      final res = await ChimoApis.group.join([group.gid]);
      if (isClosed) return;
      if (!res.ok) {
        isJoined.value = false;
        chats.leaveGroup(group.gid);
        onMembershipChanged?.call(false);
        AppToast.error(res.message.isEmpty ? 'Join failed' : res.message);
        return;
      }
      // 服务端会推送 JoinGroupMessage；同时立即展示本地提示。
      final nick = UserStore.currentUser.nickname?.trim();
      final name = (nick == null || nick.isEmpty) ? 'You' : nick;
      if (isClosed) return;
      messages.add(ChatLine.join(name));
      notifyNewMessage('$name joined the community');
      onScrollToBottom?.call();
      unawaited(loadImHistory());
    } catch (error) {
      if (isClosed) return;
      isJoined.value = false;
      chats.leaveGroup(group.gid);
      onMembershipChanged?.call(false);
      AppToast.error('Join failed: $error');
    }
  }

  Future<void> leave() async {
    if (!isJoined.value) return;
    isJoined.value = false;
    chats.leaveGroup(group.gid);
    onMembershipChanged?.call(false);
    try {
      final res = await ChimoApis.group.leave(group.gid);
      if (isClosed) return;
      if (!res.ok) {
        isJoined.value = true;
        chats.joinGroup(group.withJoined(true));
        onMembershipChanged?.call(true);
        AppToast.error(res.message.isEmpty ? 'Leave failed' : res.message);
        return;
      }
      AppJumper.back();
    } catch (error) {
      if (isClosed) return;
      isJoined.value = true;
      chats.joinGroup(group.withJoined(true));
      onMembershipChanged?.call(true);
      AppToast.error('Leave failed: $error');
    }
  }

  void applyRecall(ImChatMessage m) {
    if (isClosed) return;
    final id = m.id.trim();
    if (id.isEmpty) return;
    final at = m.serverTimeMs > 0
        ? DateTime.fromMillisecondsSinceEpoch(m.serverTimeMs)
        : DateTime.now();
    final index = messages.indexWhere((e) => e.msgId == id);
    final recalled = ChatLine.recall(at: at, msgId: id, isSelf: m.isSelf, senderName: m.senderName);
    if (index >= 0) {
      messages[index] = recalled;
    } else {
      seenMsgIds.add(id);
      messages.add(recalled);
      messages.sort((a, b) => a.sentAt.compareTo(b.sentAt));
    }
    // 会话列表的预览就是这条提示本身，文案跟着 ChatLine.recallTextFor 走。
    notifyNewMessage(recalled.text);
  }

  /// 发文本。空串校验 / 清输入框 / 摘引用条都在 View（那三样挂在 widget 上）。
  Future<void> sendText(String text) async {
    if (!isJoined.value) return;
    // 摘引用放在「已加群」之后 —— 非成员点发送什么都不该发生，引用也不该丢。
    final quote = takeQuote();
    final now = DateTime.now();
    messages.add(
      ChatLine.text(
        text,
        at: now,
        senderAvatar: _selfAvatar,
        quoteMsgId: quote?.msgId ?? '',
        quoteShowText: quote?.showText ?? '',
        quoteSendName: quote?.sendName ?? '',
      ),
    );
    tabIndex.value = 0;
    notifyNewMessage(text);
    onScrollToBottom?.call();

    final gid = emGroupId;
    if (gid.isEmpty) return;
    try {
      final sent = await ImService.sendText(
        peerEmUsername: gid,
        content: text,
        quote: quote,
        isGroup: true,
        peer: groupPeerAttrs,
      );
      if (sent != null && sent.id.isNotEmpty) {
        seenMsgIds.add(sent.id);
        final sentAt = sent.serverTimeMs > 0
            ? DateTime.fromMillisecondsSinceEpoch(sent.serverTimeMs)
            : now;
        if (isClosed) return;
        for (var i = messages.length - 1; i >= 0; i--) {
          final m = messages[i];
          if (m.kind != ChatLineKind.text || !m.isSelf || m.msgId.isNotEmpty || m.text != text) {
            continue;
          }
          messages[i] = m.copyWith(msgId: sent.id, sentAt: sentAt);
          break;
        }
      }
    } catch (error) {
      if (isClosed) return;
      AppToast.error('Send failed: $error');
    }
  }

  Future<void> sendVoice(String path, int seconds) async {
    if (!isJoined.value || seconds <= 0) return;
    final local = path.trim();
    if (local.isEmpty) return;
    messages.add(ChatLine.voice(seconds, mediaSource: local, senderAvatar: _selfAvatar));
    tabIndex.value = 0;
    notifyNewMessage('[Voice] ${seconds}s');
    onScrollToBottom?.call();

    final gid = emGroupId;
    if (gid.isEmpty) return;
    try {
      final sent = await ImService.sendVoice(
        peerEmUsername: gid,
        filePath: local,
        durationSecs: seconds,
        isGroup: true,
        peer: groupPeerAttrs,
      );
      if (sent != null && sent.id.isNotEmpty) {
        seenMsgIds.add(sent.id);
        final playable = sent.playableOrDisplayUrl;
        if (isClosed) return;
        for (var i = messages.length - 1; i >= 0; i--) {
          final m = messages[i];
          if (m.kind != ChatLineKind.voice || !m.isSelf || m.msgId.isNotEmpty) {
            continue;
          }
          messages[i] = m.copyWith(
            msgId: sent.id,
            mediaSource: playable.isNotEmpty ? playable : local,
          );
          break;
        }
      }
    } catch (error) {
      if (isClosed) return;
      AppToast.error('Send voice failed: $error');
    }
  }

  void applyImageSendAck(ImChatMessage sent, {required String localPath}) {
    if (sent.id.isEmpty) return;
    seenMsgIds.add(sent.id);
    final sentAt = sent.serverTimeMs > 0
        ? DateTime.fromMillisecondsSinceEpoch(sent.serverTimeMs)
        : DateTime.now();
    final remote = sent.playableOrDisplayUrl.trim();

    final existingIdx = messages.indexWhere((e) => e.msgId == sent.id);
    if (existingIdx >= 0) {
      if (messages[existingIdx].sentAt.millisecondsSinceEpoch == 0) {
        messages[existingIdx] = messages[existingIdx].copyWith(sentAt: sentAt);
      }
      return;
    }

    var targetIdx = -1;
    for (var i = messages.length - 1; i >= 0; i--) {
      final m = messages[i];
      if (m.kind != ChatLineKind.image || !m.isSelf || m.msgId.isNotEmpty) {
        continue;
      }
      if (m.mediaSource.trim() == localPath) {
        targetIdx = i;
        break;
      }
    }
    if (targetIdx < 0) {
      targetIdx = messages.lastIndexWhere(
        (m) => m.kind == ChatLineKind.image && m.isSelf && m.msgId.isEmpty,
      );
    }
    if (targetIdx < 0) return;
    final m = messages[targetIdx];
    messages[targetIdx] = m.copyWith(
      msgId: sent.id,
      sentAt: sentAt,
      mediaSource: remote.isNotEmpty ? remote : m.mediaSource,
    );
  }

  Future<void> sendImages(List<String> paths) async {
    if (!isJoined.value || paths.isEmpty) return;
    final files = paths.map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    if (files.isEmpty) return;

    final now = DateTime.now();
    for (final path in files) {
      messages.add(ChatLine.image(path, at: now, senderAvatar: _selfAvatar));
    }
    tabIndex.value = 0;
    notifyNewMessage(files.length == 1 ? '[Image]' : '[Image] x${files.length}');
    onScrollToBottom?.call();

    final gid = emGroupId;
    if (gid.isEmpty) {
      if (isClosed) return;
      AppToast.error('Cannot send image: group IM id missing');
      return;
    }

    for (final path in files) {
      try {
        final sent = await ImService.sendImage(
          peerEmUsername: gid,
          filePath: path,
          isGroup: true,
          peer: groupPeerAttrs,
        );
        if (sent != null && sent.id.isNotEmpty) {
          if (isClosed) return;
          applyImageSendAck(sent, localPath: path);
        }
      } catch (error) {
        if (isClosed) return;
        AppToast.error('Image send failed: $error');
      }
    }
  }

  /// 点头像要展示的资料：先用消息里的名字 / 头像拼占位，再按 uid 拉真资料，
  /// 顺手把列表里该用户的头像 / 性别补齐。弹层本身归 View（要 `context`），
  /// 防连点的那个开关也留在 View —— 它要盖住整段「弹层打开到关闭」。
  Future<User> resolveSenderProfile(ChatLine message) async {
    final uid = message.senderUid.trim();
    final name = message.senderName.trim();
    var profile = User()
      ..id = Int64(int.tryParse(uid) ?? 0)
      ..nickname = name.isEmpty ? 'User' : name
      ..avatar = message.senderAvatar.trim();
    if (uid.isEmpty) return profile;
    try {
      final res = await ChimoApis.user.profileByUidOrNull(uid);
      if (res.ok && res.data != null) {
        profile = res.data!;
        _rememberSenderProfile(profile);
        final apiAvatar = profile.avatar.trim();
        final msgAvatar = message.senderAvatar.trim();
        if (apiAvatar.isEmpty && msgAvatar.isNotEmpty) {
          profile = profile.deepCopy()..avatar = msgAvatar;
        }
        if (profile.nickname.trim().isEmpty && name.isNotEmpty) {
          profile = profile.deepCopy()..nickname = name;
        }
        // 打开资料时同步补全列表里该用户的性别 / 头像。
        if (profile.genderKnown || apiAvatar.isNotEmpty) {
          final g = profile.genderKnown ? (profile.male ? 'male' : 'female') : null;
          for (var i = 0; i < messages.length; i++) {
            final m = messages[i];
            if (m.senderUid.trim() != uid) continue;
            final next = m.copyWith(
              senderAvatar: apiAvatar.isNotEmpty ? apiAvatar : null,
              senderGender: g,
            );
            if (next.senderAvatar != m.senderAvatar || next.senderGender != m.senderGender) {
              messages[i] = next;
            }
          }
        }
      }
    } catch (error) {
      // 补发送者头像 / 性别失败：气泡照常显示，只是头像是占位图。
      AppLog.d('GroupDetails patch sender profile failed', error: error);
    }
    return profile;
  }
}

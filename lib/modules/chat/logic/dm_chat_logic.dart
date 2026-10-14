import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:get/get.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';

import '../../../app/service/im_service.dart';
import '../../../app/chimo_api.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/base.pbenum.dart';
import '../../../common/models/server_client/emote.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/theme/app_dialog.dart';
import '../../../common/utils/app_log.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/zodiac.dart';
import '../model/chat_conversation.dart';
import '../model/chat_line.dart';
import 'chat_base_logic.dart';

/// 私聊会话的状态与动作。
///
/// **两刀都已落地**：第一刀搬数据（消息流、去重集合、历史游标、对端资料），
/// 第二刀搬动作（取资料、拉历史、收发、重试、关注、拉黑）。
///
/// 留在 View 里的只有 widget 自己的东西，判据是「需要 `BuildContext` 或
/// widget 句柄」：滚动位置、`GlobalKey`、输入框 `TextEditingController`、
/// 长按气泡的 `Rect` 锚点、面板相位与动画。
///
/// 这些东西 Controller 碰不到，所以走**钩子**：View 在 `initState` 里注册
/// [onScrollToBottom] / [onHistoryAnchorSave] / [onHistoryAnchorRestore]，
/// Controller 只在该滚的时候喊一声，不认识 `ScrollController`
class DmChatLogic extends ChatBaseLogic {
  DmChatLogic({required this.seed});

  /// `ChatDetailPage` 构造参数传进来的首帧会话（可能只是个空骨架）。
  final ChatConversation seed;

  late final Rx<ChatConversation> conversation = seed.obs;
  final Rxn<User> peerProfile = Rxn<User>();
  final RxBool following = false.obs;
  final RxBool blocked = false.obs;

  /// 对方是否已将你拉黑。
  final RxBool blockedByPeer = false.obs;
  final RxBool loadingPeer = true.obs;
  final RxString peerEmUser = ''.obs;

  /// 后端数字用户 id（关注 / 拉黑 / 礼物）。与环信 id 不同。
  final RxString peerAppUid = ''.obs;

  /// 滚到底部。`force` 走「首帧连续多次 jump」那条路径（见 View 里的实现）。
  void Function({bool force, bool animated})? onScrollToBottom;

  /// 上拉加载历史的滚动锚点，也是 widget 的事：
  /// [onHistoryAnchorSave] 在插入前记下 `pixels` / `maxScrollExtent`，
  /// [onHistoryAnchorRestore] 在插入后把视觉位置顶回原处，否则列表会跳。
  void Function()? onHistoryAnchorSave;
  void Function()? onHistoryAnchorRestore;

  @override
  void onInit() {
    super.onInit();
    following.value = seed.isFollowing;
    peerEmUser.value = seed.emUserName;
    listenIm(onImMessage);
    // 打开会话时清除列表角标 + 环信未读。
    chats.markRead(seed.id);
    final em = imConversationId;
    chats.setActiveConversation(em.isNotEmpty ? em : seed.id);
    if (em.isNotEmpty) {
      unawaited(ImService.markConversationRead(em));
    }
    unawaited(loadFromApi());
  }

  @override
  void onClose() {
    chats.setActiveConversation(null);
    super.onClose();
  }

  String get peerUid {
    final id = conversation.value.id;
    if (id.startsWith('dm_')) return id.substring(3);
    if (id.startsWith('sys_')) return id.substring(4);
    return id;
  }

  /// 优先已解析的应用 uid；仅当会话 id 为数字时才回退。
  String get relationUid {
    final peer = peerProfile.value;
    final fromProfile = peer != null && peer.id > Int64.ZERO ? peer.uid : '';
    if (fromProfile.isNotEmpty) return fromProfile;
    final cached = peerAppUid.value.trim();
    if (cached.isNotEmpty) return cached;
    final id = peerUid.trim();
    return RegExp(r'^\d+$').hasMatch(id) ? id : '';
  }

  /// 送礼收款方 / 打开资料页用的 uid：优先解析出来的应用 uid，退回环信那个。
  String get profileUid => relationUid.isNotEmpty ? relationUid : peerUid;

  /// 会话列表里的群会话也会落到私聊详情页，撤回 / 删除得按它原本的类型走
  /// （基类 [ChatBaseLogic.isGroupConversation] 的说明）。
  @override
  bool get isGroupConversation => conversation.value.badge == ChatBadgeType.group;

  /// 环信会话 id（环信用户名，不是业务 uid）。
  @override
  String get imConversationId {
    final em = peerEmUser.value.trim();
    if (em.isNotEmpty) return em;
    final fromConv = conversation.value.emUserName.trim();
    if (fromConv.isNotEmpty) return fromConv;
    final id = peerUid.trim();
    return RegExp(r'^\d+$').hasMatch(id) ? '' : id;
  }

  /// 发消息时带给对端的公共 attributes（对齐 forya toName / toAvatar / …）。
  ImPeerAttrs get dmPeerAttrs {
    final peer = peerProfile.value;
    final name = (peer?.nickname.trim().isNotEmpty ?? false)
        ? peer!.nickname.trim()
        : conversation.value.title.trim();
    final avatar =
        (peer != null && peer.avatar.trim().isNotEmpty
                ? peer.avatar
                : (conversation.value.avatarUrl ?? ''))
            .trim();
    var gender = '';
    if (peer != null && peer.genderKnown) {
      gender = peer.male ? 'male' : 'female';
    }
    return ImPeerAttrs(name: name, avatar: avatar, userid: relationUid, gender: gender);
  }

  @override
  void syncListPreview(String conversationId, String preview) {
    chats.markRead(conversationId);
  }

  /// 进页面第一件事：解析对端 uid / 环信号、拉对端与自己的资料、
  /// 顺手把「对方是否拉黑了你」查出来，最后接上环信历史。
  Future<void> loadFromApi() async {
    final rawId = peerUid.trim();
    final rawEm = peerEmUser.value.trim().isNotEmpty
        ? peerEmUser.value.trim()
        : conversation.value.emUserName.trim();
    var emHint = rawEm;
    if (emHint.isEmpty && rawId.isNotEmpty && !RegExp(r'^\d+$').hasMatch(rawId)) {
      emHint = rawId;
    }
    if (rawId.isEmpty && emHint.isEmpty) {
      if (!isClosed) loadingPeer.value = false;
      return;
    }

    try {
      // 会话 key 为环信用户名时解析数字应用 uid，并检测对方是否拉黑你。
      var appUid = RegExp(r'^\d+$').hasMatch(rawId) ? rawId : '';
      var peerBlockedYou = false;
      if (emHint.isNotEmpty) {
        try {
          final msgRes = await ChimoApis.relation.msgUser(emHint);
          final brief = msgRes.data;
          final id = brief == null || brief.id <= Int64.ZERO ? '' : brief.id.toString();
          if (id.isNotEmpty) appUid = id;
          final resolvedEm = brief?.emUsername.trim() ?? '';
          if (resolvedEm.isNotEmpty) emHint = resolvedEm;
          peerBlockedYou = brief?.isYourInBlackList ?? false;
        } catch (_) {
          // 简介接口挂了就用会话里已有的 hint，不阻塞进入聊天。
        }
      }
      if (appUid.isEmpty && RegExp(r'^\d+$').hasMatch(rawId)) {
        appUid = rawId;
      }
      // 该后端 user/info 接受数字 id 或 emUsername。
      final infoKey = appUid.isNotEmpty ? appUid : (emHint.isNotEmpty ? emHint : rawId);

      final peerFuture = infoKey.isNotEmpty
          ? ChimoApis.user.profileByUid(infoKey)
          : Future.value(ApiResult<UserInfoRsp?>.ok(null));
      final selfFuture = ChimoApis.user.profile();
      final peerRes = await peerFuture;
      final selfRes = await selfFuture;
      await ImService.connectFromServer();
      if (isClosed) return;

      final peer = peerRes.data?.user;
      final self = selfRes.data?.user;
      if (peer != null && peer.id > Int64.ZERO) {
        appUid = peer.uid;
      }
      var isBlocked = false;
      if (appUid.isNotEmpty) {
        final blackRes = await ChimoApis.relation.isBlocked(appUid);
        isBlocked = blackRes.data ?? false;
      }

      if (peer != null) {
        final em = peer.emUsername.isNotEmpty
            ? peer.emUsername
            : (conversation.value.emUserName.isNotEmpty ? conversation.value.emUserName : emHint);
        final updated = conversation.value.copyWith(
          title: peer.nickname.isEmpty ? conversation.value.title : peer.nickname,
          avatarUrl: peer.avatar.trim().isNotEmpty ? peer.avatar : conversation.value.avatarUrl,
          isMale: peer.male,
          signature: peer.personalSignature,
          zodiac: peer.birthday.trim().isEmpty
              ? conversation.value.zodiac
              : Zodiac.fromBirthday(peer.birthday),
          heightInches: peer.height,
          weightLb: peer.weight,
          isFollowing: peer.following,
          isOnline: peer.online,
          momentUrls: peer.approvedPics,
          momentAssets: peer.approvedPics.isEmpty ? conversation.value.momentAssets : const [],
          emUserName: em,
        );
        peerProfile.value = peer;
        conversation.value = updated;
        following.value = peer.following;
        blocked.value = isBlocked;
        blockedByPeer.value = peerBlockedYou;
        selfAvatarUrl.value = _avatarOrNull(self);
        peerEmUser.value = em;
        peerAppUid.value = appUid;
        loadingPeer.value = false;
        chats.setActiveConversation(em);
        chats.upsertPrivateChat(updated);
        if (em.isNotEmpty) unawaited(loadImHistory(em));
      } else {
        peerAppUid.value = appUid;
        blocked.value = isBlocked;
        blockedByPeer.value = peerBlockedYou;
        selfAvatarUrl.value = _avatarOrNull(self);
        if (emHint.isNotEmpty) peerEmUser.value = emHint;
        loadingPeer.value = false;
        if (emHint.isNotEmpty) {
          chats.setActiveConversation(emHint);
          unawaited(loadImHistory(emHint));
        }
      }
    } catch (error) {
      AppLog.w('load chat profile failed', error: error);
      if (isClosed) return;
      loadingPeer.value = false;
      final em = imConversationId;
      if (em.isNotEmpty) unawaited(loadImHistory(em));
    }
  }

  /// 拉一页环信历史。**分页锚点留在 View**：要读 `pixels` / `maxScrollExtent`
  /// 再 `jumpTo`，那是 widget 的事，走 [onHistoryAnchorSave] /
  /// [onHistoryAnchorRestore] 两个钩子。
  Future<void> loadImHistory(String peerEm, {bool loadMore = false}) async {
    if (historyLoading.value) return;
    if (loadMore && !historyHasMore.value) return;

    final cursor = loadMore ? historyCursor : '';
    historyLoading.value = true;
    try {
      final page = await ImService.loadHistory(peerEm, startMsgId: cursor, count: 20);
      if (isClosed) return;

      // 提前到请求之前记会把加载这段时间里的滚动一起算进去。
      if (loadMore) onHistoryAnchorSave?.call();

      final added = <ChatLine>[];
      for (final m in page.messages) {
        if (m.msgType == 'follow' || m.msgType == 'ignored') continue;
        if (m.isSdkRecall) continue;
        if (m.msgType == 'txt' && m.text.trim().isEmpty) continue;
        if (m.id.isNotEmpty && !seenMsgIds.add(m.id)) continue;
        added.add(lineFromIm(m));
      }

      if (loadMore) {
        messages.insertAll(0, added);
      } else {
        messages.addAll(added);
      }
      if (loadMore && added.isEmpty) {
        historyHasMore.value = false;
      } else {
        historyHasMore.value = page.hasMore;
      }
      historyLoading.value = false;
      if (messages.isNotEmpty) {
        final oldest = messages.first.msgId;
        if (oldest.isNotEmpty) historyCursor = oldest;
      }

      if (!loadMore) {
        onScrollToBottom?.call(force: true);
        return;
      }
      if (added.isEmpty) return;
      onHistoryAnchorRestore?.call();
    } catch (error) {
      AppLog.w('loadImHistory failed', error: error);
      if (isClosed) return;
      historyLoading.value = false;
    }
  }

  void backfillSelfLineFromIm(ImChatMessage m) {
    if (!m.isSelf || m.id.isEmpty) return;
    final next = lineFromIm(m);
    for (var i = messages.length - 1; i >= 0; i--) {
      final e = messages[i];
      if (e.side != ChatSide.self || e.msgId.isNotEmpty || e.kind != next.kind) {
        continue;
      }
      switch (next.kind) {
        case ChatLineKind.text:
          if (e.text != next.text) continue;
        case ChatLineKind.voice:
          if (e.voiceSeconds != next.voiceSeconds) continue;
        case ChatLineKind.image:
        case ChatLineKind.emote:
          break;
        default:
          continue;
      }
      final effectiveMs = m.serverTimeMs > 0
          ? m.serverTimeMs
          : (e.serverTimeMs > 0 ? e.serverTimeMs : DateTime.now().millisecondsSinceEpoch);
      messages[i] = e.copyWith(
        msgId: m.id,
        serverTimeMs: effectiveMs,
        mediaSource: next.mediaSource.isNotEmpty ? next.mediaSource : e.mediaSource,
      );
      return;
    }
  }

  void onImMessage(ImChatMessage m) {
    final convId = imConversationId;
    if (convId.isEmpty) return;
    final match = m.conversationId == convId || m.from == convId || m.to == convId;
    if (!match) return;
    // 关注提示不在私聊消息流中展示。
    if (m.msgType == 'follow' || m.msgType == 'ignored') return;

    // SDK 撤回：只删掉原气泡。提示文案来自 forya 的 `im_recall_message`。
    if (m.isSdkRecall) {
      final recalledId = m.id.trim();
      if (recalledId.isEmpty || isClosed) return;
      messages.removeWhere((e) => e.msgId == recalledId);
      seenMsgIds.remove(recalledId);
      return;
    }

    if (m.msgType == 'recall') {
      if (m.id.isNotEmpty && !seenMsgIds.add(m.id)) return;
      if (isClosed) return;
      messages.add(lineFromIm(m));
      onScrollToBottom?.call();
      return;
    }

    if (m.id.isNotEmpty && seenMsgIds.contains(m.id)) {
      if (isClosed) return;
      final idx = messages.indexWhere((e) => e.msgId == m.id);
      if (idx >= 0 && m.serverTimeMs > 0 && messages[idx].serverTimeMs == 0) {
        messages[idx] = messages[idx].copyWith(serverTimeMs: m.serverTimeMs);
        return;
      }
      backfillSelfLineFromIm(m);
      return;
    }

    if (m.id.isNotEmpty && !seenMsgIds.add(m.id)) return;
    if (isClosed) return;
    final nextLine = lineFromIm(m);
    // EaseMob 可能会发生 msgId 回填/替换（临时 id -> server id）。
    if (nextLine.side == ChatSide.self) {
      final idx = messages.lastIndexWhere((e) {
        if (e.side != ChatSide.self || e.kind != nextLine.kind) return false;
        if (e.msgId.isNotEmpty && e.msgId == nextLine.msgId) return false;
        switch (nextLine.kind) {
          case ChatLineKind.text:
            return e.text == nextLine.text;
          case ChatLineKind.voice:
            return e.voiceSeconds == nextLine.voiceSeconds && e.msgId.isEmpty;
          case ChatLineKind.image:
          case ChatLineKind.emote:
            return e.msgId.isEmpty;
          default:
            return false;
        }
      });
      if (idx >= 0) {
        final oldId = messages[idx].msgId;
        if (oldId.isNotEmpty) seenMsgIds.remove(oldId);
        if (nextLine.msgId.isNotEmpty) seenMsgIds.add(nextLine.msgId);
        final prev = messages[idx];
        final effectiveMs = nextLine.serverTimeMs > 0
            ? nextLine.serverTimeMs
            : (prev.serverTimeMs > 0 ? prev.serverTimeMs : DateTime.now().millisecondsSinceEpoch);
        final keepLocalMedia =
            nextLine.kind == ChatLineKind.image || nextLine.kind == ChatLineKind.emote;
        messages[idx] = nextLine.copyWith(
          serverTimeMs: effectiveMs,
          mediaSource: keepLocalMedia && prev.mediaSource.trim().isNotEmpty
              ? prev.mediaSource
              : nextLine.mediaSource,
          imageAssets: keepLocalMedia && prev.imageAssets.isNotEmpty
              ? prev.imageAssets
              : nextLine.imageAssets,
        );
        onScrollToBottom?.call();
        return;
      }
    }
    messages.add(nextLine);
    // 列表预览 / 未读：ChatsListLogic 监听 ImService.messages。
    onScrollToBottom?.call();
  }

  ChatLine lineFromIm(ImChatMessage m) {
    final side = m.isSelf ? ChatSide.self : ChatSide.peer;
    final media = m.playableOrDisplayUrl;
    switch (m.msgType) {
      case 'image':
        return ChatLine(
          side: side,
          kind: ChatLineKind.image,
          mediaSource: media,
          imageAssets: media.isEmpty ? const [] : [media],
          text: m.text,
          serverTimeMs: m.serverTimeMs,
          msgId: m.id,
          failed: m.failed,
        );
      case 'voice':
        return ChatLine(
          side: side,
          kind: ChatLineKind.voice,
          voiceSeconds: m.durationSecs > 0 ? m.durationSecs : 1,
          mediaSource: media,
          text: m.text,
          serverTimeMs: m.serverTimeMs,
          msgId: m.id,
          failed: m.failed,
        );
      case 'gift':
        return ChatLine(
          side: side,
          kind: ChatLineKind.gift,
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
        return ChatLine(
          side: side,
          kind: ChatLineKind.emote,
          emoteUrl: m.emoteUrl.isNotEmpty ? m.emoteUrl : media,
          emoteName: m.emoteName,
          mediaSource: m.emoteUrl.isNotEmpty ? m.emoteUrl : media,
          text: m.text,
          serverTimeMs: m.serverTimeMs,
          msgId: m.id,
          failed: m.failed,
        );
      case 'recall':
        return ChatLine(
          side: side,
          kind: ChatLineKind.tip,
          // 文案只有 ChatLine.recallTextFor 一份；对方 SDK
          // 带了文案就用它的。
          text: m.text.trim().isNotEmpty ? m.text : ChatLine.recallTextFor(isSelf: m.isSelf),
          serverTimeMs: m.serverTimeMs,
          msgId: m.id,
        );
      default:
        return ChatLine(
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

  bool isPeerBlockSendError(Object error) {
    if (error is EMError && error.code == 210) return true;
    final s = '$error'.toLowerCase();
    return s.contains('blacklist') ||
        s.contains('in block') ||
        s.contains('been blocked') ||
        s.contains('code: 210') ||
        s.contains('code=210');
  }

  bool guardRelationBeforeSend({ChatLine? failedLine}) {
    if (blocked.value) {
      toastYouBlockedPeer();
      return false;
    }
    if (blockedByPeer.value) {
      toastBlockedByPeer();
      if (failedLine != null) {
        messages.add(failedLine.copyWith(failed: true));
        afterSend(failedLine.listPreview);
        unawaited(persistFailedLine(failedLine));
      }
      return false;
    }
    return true;
  }

  Future<void> persistFailedLine(ChatLine line) async {
    final peer = imConversationId;
    if (peer.isEmpty) return;
    try {
      ImChatMessage? saved;
      switch (line.kind) {
        case ChatLineKind.image:
          saved = await ImService.appendFailedImage(
            peerEmUsername: peer,
            filePath: line.displayMedia,
            peer: dmPeerAttrs,
          );
        case ChatLineKind.voice:
          saved = await ImService.appendFailedVoice(
            peerEmUsername: peer,
            filePath: line.mediaSource,
            durationSecs: line.voiceSeconds,
            peer: dmPeerAttrs,
          );
        case ChatLineKind.emote:
          saved = await ImService.appendFailedText(
            peerEmUsername: peer,
            content: line.text.isEmpty ? '[Sticker]' : line.text,
            peer: dmPeerAttrs,
            extra: {
              'type': 'emote',
              'emote': {
                'desc': line.emoteName,
                'url': line.emoteUrl.isNotEmpty ? line.emoteUrl : line.mediaSource,
              },
            },
          );
        // join / recall 是群聊侧的 kind，私聊消息流里不会出现。
        case ChatLineKind.text:
        case ChatLineKind.gift:
        case ChatLineKind.tip:
        case ChatLineKind.join:
        case ChatLineKind.recall:
          saved = await ImService.appendFailedText(
            peerEmUsername: peer,
            content: line.text,
            peer: dmPeerAttrs,
          );
      }
      final id = saved?.id ?? '';
      if (id.isEmpty || isClosed) return;
      seenMsgIds.add(id);
      for (var i = messages.length - 1; i >= 0; i--) {
        final m = messages[i];
        if (m.side != ChatSide.self || !m.failed || m.msgId.isNotEmpty) {
          continue;
        }
        if (m.kind == line.kind && m.listPreview == line.listPreview) {
          messages[i] = m.copyWith(msgId: id);
          break;
        }
      }
    } catch (error) {
      AppLog.e('persist failed line', error: error);
    }
  }

  Future<bool> refreshBlockedByPeer() async {
    final em = imConversationId;
    if (em.isEmpty) return blockedByPeer.value;
    try {
      final msgRes = await ChimoApis.relation.msgUser(em);
      final isBlocked = msgRes.data?.isYourInBlackList ?? blockedByPeer.value;
      if (!isClosed) blockedByPeer.value = isBlocked;
      return isBlocked;
    } catch (_) {
      return blockedByPeer.value;
    }
  }

  /// 打开对方资料页时的预填资料。
  ///
  /// 资料还没回来就用会话行里那点信息现搭一份 —— 资料页自己会再拉一次，
  /// 这里只为了让首帧不空白。关注状态与环信账号始终覆盖成本地最新值。
  String? _avatarOrNull(User? user) {
    final avatar = user?.avatar.trim() ?? '';
    return avatar.isEmpty ? null : avatar;
  }

  User previewProfile() {
    final conv = conversation.value;
    final base = peerProfile.value;
    final uid = profileUid;
    final em = peerEmUser.value.isNotEmpty ? peerEmUser.value : conv.emUserName;
    if (base != null) {
      final next = base.deepCopy();
      if (em.isNotEmpty) next.emUsername = em;
      next.relationType = following.value
          ? (next.relationType == RelationType.FRIEND ? RelationType.FRIEND : RelationType.FOLLOW)
          : RelationType.NONE;
      return next;
    }
    return User()
      ..id = Int64(int.tryParse(uid) ?? 0)
      ..nickname = conv.title
      ..avatar = conv.avatarUrl ?? ''
      ..gender = conv.isMale ? 'male' : 'female'
      ..personalSignature = conv.signature
      ..height = conv.heightInches
      ..weight = conv.weightLb
      ..emUsername = em
      ..relationType = following.value ? RelationType.FOLLOW : RelationType.NONE;
  }

  /// 从资料页回来后重新问一次拉黑状态（在那边可能刚拉黑 / 解除）。
  ///
  /// 查不到就保持当前值 —— 这里只是同步，失败不该让页面上的开关跳回去。
  Future<void> refreshBlocked() async {
    final uid = relationUid;
    if (uid.isEmpty || !RegExp(r'^\d+$').hasMatch(uid)) return;
    try {
      final res = await ChimoApis.relation.isBlocked(uid);
      if (isClosed) return;
      blocked.value = res.data ?? blocked.value;
    } catch (_) {
      // 同上：拉黑状态查不到就保持当前值。
    }
  }

  void onSendError(Object error, {int failedCount = 1}) {
    if (isClosed) return;
    if (isPeerBlockSendError(error)) {
      blockedByPeer.value = true;
      toastBlockedByPeer();
      markLastSelfFailed(count: failedCount);
      return;
    }
    AppToast.error('Send failed: $error');
  }

  Future<void> toggleFollow() async {
    final uid = relationUid;
    if (uid.isEmpty) {
      AppToast.info('Follow failed: user id not ready');
      return;
    }
    final prev = following.value;
    following.value = !prev;
    try {
      final res = prev
          ? await ChimoApis.relation.unfollow(uid)
          : await ChimoApis.relation.follow(uid);
      if (isClosed) return;
      if (!res.ok) {
        following.value = prev;
        AppToast.info(res.message.isEmpty ? 'Follow failed' : res.message);
        return;
      }
      conversation.value = conversation.value.copyWith(isFollowing: following.value);
      chats.upsertPrivateChat(conversation.value);
      if (following.value) {
        AppToast.info('Followed');
      }
    } catch (error) {
      if (isClosed) return;
      following.value = prev;
      AppToast.info('Follow failed: $error');
    }
  }

  Future<void> toggleBlock() async {
    final uid = relationUid;
    if (uid.isEmpty) {
      AppToast.info('Block failed: user id not ready');
      return;
    }

    if (blocked.value) {
      try {
        final res = await ChimoApis.relation.setBlackList(userId: uid, isCancel: true);
        if (isClosed) return;
        if (!res.ok) {
          AppToast.info(res.message.isEmpty ? 'Unblock failed' : res.message);
          return;
        }
        blocked.value = false;
        AppToast.info('The user is removed from the block list.');
      } catch (error) {
        if (isClosed) return;
        AppToast.info('Unblock failed: $error');
      }
      return;
    }

    final confirmed =
        await AppDialog.show(
          title: 'Block this user?',
          content: "You won't get any more messages from this user.",
          confirmLabel: 'Block',
          buttons: DialogLoyoutStyle.horizontal,
        ) ??
        false;
    if (isClosed || !confirmed) return;
    try {
      final res = await ChimoApis.relation.setBlackList(userId: uid, isCancel: false);
      if (isClosed) return;
      if (!res.ok) {
        AppToast.info(res.message.isEmpty ? 'Block failed' : res.message);
        return;
      }
      blocked.value = true;
      AppToast.info('The other user has been blocked.');
    } catch (error) {
      if (isClosed) return;
      AppToast.info('Block failed: $error');
    }
  }

  void applyImageSendAck(ImChatMessage sent, {required String localPath}) {
    if (sent.id.isEmpty) return;
    seenMsgIds.add(sent.id);
    final effectiveAtMs = sent.serverTimeMs > 0
        ? sent.serverTimeMs
        : DateTime.now().millisecondsSinceEpoch;
    final remote = sent.playableOrDisplayUrl.trim();

    final existingIdx = messages.indexWhere((e) => e.msgId == sent.id);
    if (existingIdx >= 0) {
      if (messages[existingIdx].serverTimeMs == 0) {
        messages[existingIdx] = messages[existingIdx].copyWith(serverTimeMs: effectiveAtMs);
      }
      return;
    }

    var targetIdx = -1;
    for (var i = messages.length - 1; i >= 0; i--) {
      final m = messages[i];
      if (m.kind != ChatLineKind.image || m.side != ChatSide.self || m.msgId.isNotEmpty) {
        continue;
      }
      final src = m.mediaSource.trim();
      final asset = m.imageAssets.isNotEmpty ? m.imageAssets.first.trim() : '';
      if (src == localPath || asset == localPath) {
        targetIdx = i;
        break;
      }
    }
    if (targetIdx < 0) {
      targetIdx = messages.lastIndexWhere(
        (m) => m.kind == ChatLineKind.image && m.side == ChatSide.self && m.msgId.isEmpty,
      );
    }
    if (targetIdx < 0) return;
    final m = messages[targetIdx];
    messages[targetIdx] = m.copyWith(
      msgId: sent.id,
      serverTimeMs: effectiveAtMs,
      mediaSource: remote.isNotEmpty ? remote : m.mediaSource,
    );
  }

  void afterSend(String lastMessage) {
    chats.onNewMessage(
      id: conversation.value.id,
      title: conversation.value.title,
      avatarAsset: conversation.value.avatarAsset,
      avatarUrl: conversation.value.avatarUrl,
      lastMessage: lastMessage,
      badge: conversation.value.badge == ChatBadgeType.group
          ? ChatBadgeType.none
          : conversation.value.badge,
      isMale: conversation.value.isMale,
      signature: conversation.value.signature,
      zodiac: conversation.value.zodiac,
      isFollowing: following.value,
    );
    onScrollToBottom?.call();
  }

  void toastBlockedByPeer() {
    AppToast.info('You have been blocked.');
  }

  void toastYouBlockedPeer() {
    AppToast.info('The user has been blocked by you.');
  }

  // ------------------------------------------------------------ 六个发送入口
  //
  // 六条路径长得像但不一样，差异都在**乐观气泡什么时候加**：
  // 文本等 IM 回执回来才加（要拿 msgId 和服务器时间），其余五条先加后发
  // （图片 / 语音上传慢，等回执再显示会像卡住）。别「顺手统一」。

  /// 文本。[takeQuote] 由 View 传入（引用条挂在输入栏的 `GlobalKey` 上，
  /// 那是 widget 的事）—— **只在关系校验通过后才调**，否则守卫失败时引用条
  /// 会被清掉，用户重发时引用就丢了。
  Future<void> sendText(String text) async {
    final failedLine = ChatLine(side: ChatSide.self, text: text);
    if (!guardRelationBeforeSend(failedLine: failedLine)) return;
    // ⚠️ 摘引用必须在 `guardRelationBeforeSend` **之后**：被拉黑时这条发不出去，
    // 引用条要留在输入框上供重发。（ 前这是页面传进来的一个 `takeQuote`
    // 回调，就为了拖到这一行才执行。）
    final quote = takeQuote();

    final peerEm = imConversationId;
    if (peerEm.isNotEmpty) {
      try {
        final sent = await ImService.sendText(
          peerEmUsername: peerEm,
          content: text,
          quote: quote,
          peer: dmPeerAttrs,
        );
        final sentId = sent?.id ?? '';
        final sentAtMs = sent?.serverTimeMs ?? 0;
        final effectiveAtMs = sentAtMs > 0 ? sentAtMs : DateTime.now().millisecondsSinceEpoch;
        if (sentId.isNotEmpty) seenMsgIds.add(sentId);
        if (isClosed) return;
        // IM 推送可能比回执先到：那条已经在列表里了，只补服务器时间。
        final existingIdx = sentId.isNotEmpty ? messages.indexWhere((e) => e.msgId == sentId) : -1;
        if (existingIdx >= 0) {
          if (messages[existingIdx].serverTimeMs == 0) {
            messages[existingIdx] = messages[existingIdx].copyWith(serverTimeMs: effectiveAtMs);
          }
          return;
        }
        messages.add(
          ChatLine(
            side: ChatSide.self,
            text: text,
            msgId: sentId,
            serverTimeMs: effectiveAtMs,
            quoteMsgId: quote?.msgId ?? '',
            quoteShowText: quote?.showText ?? '',
            quoteSendName: quote?.sendName ?? '',
          ),
        );
        afterSend(text);
        return;
      } catch (error) {
        if (isClosed) return;
        messages.add(ChatLine(side: ChatSide.self, text: text, failed: true));
        afterSend(text);
        if (isPeerBlockSendError(error)) {
          blockedByPeer.value = true;
          toastBlockedByPeer();
        } else {
          AppToast.error('Send failed: $error');
        }
        return;
      }
    }

    // 尚无 emUserName — 仅本地回退。
    messages.add(ChatLine(side: ChatSide.self, text: text));
    afterSend(text);
  }

  /// 表情面板里贴纸包的两趟取数。
  ///
  /// （`ci/layer_allowlist.txt` 上属于 `chat_detail_input.dart` 的那 2 处直连）。
  Future<ApiResult<List<Emoticons>>> loadEmotePacks() => ChimoApis.emote.packs(scene: 'CHAT');

  Future<ApiResult<List<EmoteItem>>> loadEmoteStickers(String packId) =>
      ChimoApis.emote.stickers(packId);

  /// 表情包贴纸。先加乐观气泡，再发 IM。
  Future<void> sendEmote(Emoticons pack, EmoteItem sticker) async {
    final url = sticker.url.trim().isNotEmpty ? sticker.url.trim() : sticker.showUrl.trim();
    if (url.isEmpty) return;
    final name = sticker.name.trim();
    final preview = name.isEmpty ? '[Sticker]' : '[$name]';
    final line = ChatLine(
      side: ChatSide.self,
      kind: ChatLineKind.emote,
      emoteUrl: url,
      emoteName: name,
      mediaSource: url,
      text: preview,
    );
    if (!guardRelationBeforeSend(failedLine: line)) return;

    messages.add(line);
    afterSend(preview);

    final peerEm = imConversationId;
    if (peerEm.isEmpty) {
      if (isClosed) return;
      AppToast.error('Cannot send sticker: peer IM account missing');
      return;
    }

    try {
      final sent = await ImService.sendEmote(
        peerEmUsername: peerEm,
        packId: pack.id,
        stickerId: sticker.id,
        name: name,
        url: url,
        peer: dmPeerAttrs,
      );
      if (sent != null && sent.id.isNotEmpty) {
        seenMsgIds.add(sent.id);
      }
    } catch (error) {
      onSendError(error);
    }
  }

  /// 语音。录音文件是本地路径，回执回来后把 [ChatLine.mediaSource]
  /// 换成可播放的远端地址（否则换设备后播不出来）。
  Future<void> sendVoice(String path, int seconds) async {
    if (seconds <= 0) return;
    final peerEm = imConversationId;
    final localPath = path.trim();
    final line = ChatLine(
      side: ChatSide.self,
      kind: ChatLineKind.voice,
      voiceSeconds: seconds,
      mediaSource: localPath,
    );
    if (!guardRelationBeforeSend(failedLine: line)) return;

    // 立即乐观更新 UI。
    messages.add(line);
    afterSend('[Voice] $seconds"');

    if (peerEm.isEmpty || localPath.isEmpty) {
      if (isClosed) return;
      AppToast.error(
        peerEm.isEmpty
            ? 'Cannot send voice: peer IM account missing'
            : 'Cannot send voice: recording file missing',
      );
      return;
    }

    try {
      final sent = await ImService.sendVoice(
        peerEmUsername: peerEm,
        filePath: localPath,
        durationSecs: seconds,
        peer: dmPeerAttrs,
      );
      if (sent != null && sent.id.isNotEmpty) {
        seenMsgIds.add(sent.id);
        final playable = sent.playableOrDisplayUrl;
        if (isClosed) return;
        for (var i = messages.length - 1; i >= 0; i--) {
          final m = messages[i];
          if (m.kind != ChatLineKind.voice || m.side != ChatSide.self || m.msgId.isNotEmpty) {
            continue;
          }
          messages[i] = m.copyWith(
            msgId: sent.id,
            mediaSource: playable.isNotEmpty ? playable : localPath,
          );
          break;
        }
      }
    } catch (error) {
      onSendError(error);
    }
  }

  /// 多图。逐张发，**中途失败就把剩下的全标失败**（含当前这张）——
  /// 不然前几张成功、后几张停在「发送中」，用户看不出发生了什么。
  Future<void> sendImages(List<String> paths) async {
    if (paths.isEmpty) return;
    final peerEm = imConversationId;
    final files = paths.map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    if (files.isEmpty) return;

    final lines = [
      for (final path in files)
        ChatLine(
          side: ChatSide.self,
          kind: ChatLineKind.image,
          mediaSource: path,
          imageAssets: [path],
        ),
    ];
    if (!guardRelationBeforeSend(failedLine: lines.first)) {
      // 多图时把其余也标为失败气泡（守卫只插了第一张）。
      if (blockedByPeer.value && lines.length > 1) {
        for (var i = 1; i < lines.length; i++) {
          messages.add(lines[i].copyWith(failed: true));
        }
      }
      return;
    }

    // 对每个路径做乐观 UI（文件或临时资源导出）。
    messages.addAll(lines);
    final n = files.length;
    afterSend(n <= 1 ? '[Image]' : '[Image ×$n]');

    if (peerEm.isEmpty) {
      if (isClosed) return;
      AppToast.error('Cannot send image: peer IM account missing');
      return;
    }

    var failIndex = 0;
    for (final path in files) {
      try {
        final sent = await ImService.sendImage(
          peerEmUsername: peerEm,
          filePath: path,
          sendOriginalImage: true,
          peer: dmPeerAttrs,
        );
        if (sent != null && sent.id.isNotEmpty) {
          if (isClosed) return;
          applyImageSendAck(sent, localPath: path);
        }
        failIndex++;
      } catch (error) {
        if (isClosed) return;
        // 从当前失败图起，把剩余乐观气泡标失败。
        final remaining = files.length - failIndex;
        onSendError(error, failedCount: remaining);
        return;
      }
    }
  }

  /// 礼物。**只收基本类型**：礼物面板的返回值 `_GiftSendResult` 是
  /// 私聊详情页那个编译单元里的私有类，跨不到 Controller 来
  /// 所以由 View 拆包后再调这里。
  ///
  /// 礼物气泡不走 IM 发送 —— 送礼接口在面板里已经调完了，这里只补气泡。
  void sendGift({
    required int id,
    required int qty,
    required String emoji,
    required String name,
    required String iconUrl,
  }) {
    messages.add(
      ChatLine(
        side: ChatSide.self,
        kind: ChatLineKind.gift,
        giftId: id,
        giftQty: qty,
        giftEmoji: emoji,
        giftName: name,
        giftIconUrl: iconUrl,
      ),
    );
    afterSend(name.isEmpty ? '[Gift] $id x$qty' : '[Gift] $name x$qty');
  }

  // ---------------------------------------------------------------- 失败重发

  /// 点红叉。**先查关系再重发**：拉黑期间重发只会再失败一次，
  /// 不如直接告诉用户为什么。
  Future<void> onFailedTap(int index) async {
    if (index < 0 || index >= messages.length) return;
    final line = messages[index];
    if (!line.failed || line.side != ChatSide.self) return;

    if (blocked.value) {
      if (isClosed) return;
      await AppDialog.show(
        title: 'Tip',
        content: 'The user has been blocked by you.',
        confirmLabel: 'OK',
      );
      return;
    }

    final stillBlocked = await refreshBlockedByPeer();
    if (isClosed) return;
    if (stillBlocked) {
      await AppDialog.show(title: 'Tip', content: 'You have been blocked.', confirmLabel: 'OK');
      return;
    }

    await resendFailedAt(index);
  }

  /// 重发第 [index] 条。
  ///
  /// **从原位置移除、成功后追加到底部**（不是就地去掉感叹号）——
  /// 重发成功的消息在对方那儿是新消息，时间戳也是新的，留在原位会乱序。
  Future<void> resendFailedAt(int index) async {
    if (index < 0 || index >= messages.length) return;
    final line = messages[index];
    final peer = imConversationId;
    if (peer.isEmpty) {
      AppToast.info('Cannot resend: peer IM account missing');
      return;
    }

    messages.removeAt(index);

    try {
      ImChatMessage? sent;
      // 有 msgId 的先走环信原生重发（保留原消息 id）；失败再当新消息发。
      if (line.msgId.isNotEmpty) {
        try {
          sent = await ImService.resendFailed(peerEmUsername: peer, msgId: line.msgId);
        } catch (_) {
          sent = null;
        }
      }
      sent ??= switch (line.kind) {
        ChatLineKind.image => await ImService.sendImage(
          peerEmUsername: peer,
          filePath: line.displayMedia,
          sendOriginalImage: true,
          peer: dmPeerAttrs,
        ),
        ChatLineKind.voice => await ImService.sendVoice(
          peerEmUsername: peer,
          filePath: line.mediaSource,
          durationSecs: line.voiceSeconds > 0 ? line.voiceSeconds : 1,
          peer: dmPeerAttrs,
        ),
        ChatLineKind.emote => await ImService.sendText(
          peerEmUsername: peer,
          content: line.text.isEmpty ? '[Sticker]' : line.text,
          peer: dmPeerAttrs,
          extra: {
            'type': 'emote',
            'emote': {
              'desc': line.emoteName,
              'url': line.emoteUrl.isNotEmpty ? line.emoteUrl : line.mediaSource,
            },
          },
        ),
        // 同上：join / recall 私聊侧不会走到，按文本发。
        ChatLineKind.text ||
        ChatLineKind.gift ||
        ChatLineKind.tip ||
        ChatLineKind.join ||
        ChatLineKind.recall => await ImService.sendText(
          peerEmUsername: peer,
          content: line.text,
          peer: dmPeerAttrs,
        ),
      };

      if (isClosed) return;
      final ack = sent;
      if (ack != null && ack.id.isNotEmpty) {
        seenMsgIds.add(ack.id);
        messages.add(lineFromIm(ack).copyWith(failed: false));
        afterSend(line.listPreview);
      } else {
        messages.add(line.copyWith(failed: true));
        onScrollToBottom?.call();
        AppToast.info('Message failed to send');
      }
    } catch (error) {
      if (isClosed) return;
      messages.add(line.copyWith(failed: true));
      onScrollToBottom?.call();
      if (isPeerBlockSendError(error)) {
        blockedByPeer.value = true;
        await AppDialog.show(title: 'Tip', content: 'You have been blocked.', confirmLabel: 'OK');
      } else {
        AppToast.info('Message failed to send');
      }
    }
  }
}

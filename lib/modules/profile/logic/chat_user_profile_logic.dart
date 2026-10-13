import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/storage/user_store.dart';
import '../../../app/chimo_api.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/theme/app_dialog.dart';
import '../../../common/utils/app_toast.dart';
import '../../../app/storage/effect_store.dart';
import '../../../common/utils/zodiac.dart';
import '../../chat/logic/chats_list_logic.dart';
import '../../chat/model/chat_conversation.dart';
import 'flavor_label_store.dart';

/// 他人（也可能是自己）资料页的取数与关系动作。
///
/// **留在 View 的**：`ProfileFlavorTag` 之类的展示映射、礼物面板、更多菜单的条目
/// 拼装、PAG 特效浮层 —— 都要 `BuildContext` 或 widget 类型。
///
/// 种子资料（列表点进来的那份）由 Binding 从路由 `arguments` 取，构造时喂进来；
/// [bootstrap] 再按 uid 拉全。取数失败一律静默（保留种子资料），同原版。
class ChatUserProfileLogic extends GetxController {
  ChatUserProfileLogic({required User seed}) : profile = seed.obs, following = seed.following.obs;

  /// 会话列表：Chat 按钮要先把会话补进列表再跳。
  final ChatsListLogic chats = Get.find<ChatsListLogic>();

  final Rx<User> profile;
  final RxBool following;
  final RxBool blocked = false.obs;
  final RxBool loading = true.obs;
  final RxBool isSelf = false.obs;
  final RxBool showCardEffect = false.obs;

  User get p => profile.value;

  String get targetUid => p.id > Int64.ZERO ? p.uid : '';

  String get emHint {
    final em = p.emUsername.trim();
    if (em.isNotEmpty) return em;
    final id = targetUid;
    if (id.startsWith('yqdf-') || id.contains('yqdf')) return id;
    return '';
  }

  String get bioText {
    if (p.personalSignature.trim().isNotEmpty) return p.personalSignature;
    if (!p.genderKnown) return 'No personal signature yet.';
    return p.male
        ? 'He has not set up his personal signature yet.'
        : 'She has not set up her personal signature yet.';
  }

  List<String> get momentUrls => p.approvedPics;

  /// 原版是 `initState` + `addPostFrameCallback`，`onReady` 就是那个时机。
  @override
  void onReady() {
    super.onReady();
    unawaited(bootstrap());
  }

  Future<void> bootstrap() async {
    final seedUid = targetUid;
    final self =
        seedUid.isNotEmpty &&
        (UserStore.currentUser.isCurrentUser(seedUid) ||
            UserStore.currentUser.isCurrentUser(emHint));
    if (isClosed) return;
    isSelf.value = self;
    await loadProfile();
    if (isClosed) return;
    await maybeShowCardEffect();
  }

  /// 对齐 forya `showEffectIfNeed`：有 `cardDynamicResource` 且未在冷却内则播放。
  Future<void> maybeShowCardEffect() async {
    final url = p.cardDynamicResource.trim();
    if (url.isEmpty) return;
    final uid = await resolveAppUid();
    if (uid.isEmpty) return;
    if (!EffectStore.requestShow(uid)) return;
    if (isClosed) return;
    showCardEffect.value = true;
  }

  void dismissCardEffect() {
    if (isClosed) return;
    showCardEffect.value = false;
  }

  /// 优先数字应用 uid；EaseMob 用户名经 `/user/msg-user` 解析。
  Future<String> resolveAppUid() async {
    final raw = targetUid;
    if (RegExp(r'^\d+$').hasMatch(raw) && raw != '0') return raw;
    final em = emHint.isNotEmpty ? emHint : raw;
    if (em.isEmpty) return raw;
    try {
      final msgRes = await ChimoApis.relation.msgUser(em);
      final id = msgRes.data?.id;
      if (id != null && id > Int64.ZERO) return id.toString();
    } catch (_) {
      // 查不到业务 uid 就退回环信 id，页面仍能显示。
    }
    return raw;
  }

  Future<void> loadProfile() async {
    final seed = targetUid;
    if (seed.isEmpty && emHint.isEmpty) {
      loading.value = false;
      return;
    }
    try {
      if (isSelf.value) {
        final infoRes = await ChimoApis.user.profileOrNull();
        if (isClosed) return;
        final me = infoRes.data;
        if (me != null) {
          await FlavorLabelStore.ensureLoaded();
          if (isClosed) return;
          final avatar = me.avatar.trim();
          await UserStore.update(
            (cache) => cache.patch(
              userId: me.uid,
              nickname: me.nickname,
              avatarUrl: avatar.isEmpty ? null : avatar,
            ),
          );
          final em = p.emUsername;
          profile.value = me.emUsername.isNotEmpty ? me : (me.deepCopy()..emUsername = em);
        }
      } else {
        final appUid = await resolveAppUid();
        if (isClosed) return;
        final infoRes = await ChimoApis.user.profileByUidOrNull(appUid);
        if (isClosed) return;
        final parsed = infoRes.data;
        var isBlocked = false;
        final blockUid = (parsed != null && parsed.id > Int64.ZERO) ? parsed.uid : appUid;
        if (blockUid.isNotEmpty && RegExp(r'^\d+$').hasMatch(blockUid) && blockUid != '0') {
          try {
            final blackRes = await ChimoApis.relation.isBlocked(blockUid);
            isBlocked = blackRes.data ?? false;
          } catch (_) {
            // 拉黑状态查不到按「未拉黑」渲染；真发消息时服务端还会拦。
          }
        }
        if (isClosed) return;
        if (parsed != null) {
          await FlavorLabelStore.ensureLoaded();
          if (isClosed) return;
          final self =
              UserStore.currentUser.isCurrentUser(parsed.uid) ||
              UserStore.currentUser.isCurrentUser(parsed.emUsername);
          final em = parsed.emUsername.isNotEmpty
              ? parsed.emUsername
              : (emHint.isNotEmpty ? emHint : p.emUsername);
          final next = parsed.deepCopy();
          if (em.isNotEmpty) next.emUsername = em;
          if (next.picList.isEmpty) next.picList.addAll(p.picList);
          if (next.makeFriendsLabel.isEmpty) {
            next.makeFriendsLabel.addAll(p.makeFriendsLabel);
          }
          profile.value = next;
          following.value = next.following;
          blocked.value = isBlocked;
          isSelf.value = self;
        } else {
          blocked.value = isBlocked;
        }
      }
    } catch (_) {
      // 刷新失败时保留列表带来的种子资料。
    } finally {
      if (!isClosed) loading.value = false;
    }
  }

  void openReport() {
    AppJumper.toReport(reportedId: targetUid.isNotEmpty ? targetUid : p.emUsername);
  }

  void openChat() {
    final em = p.emUsername.trim();
    final conversation = ChatConversation(
      id: em.isNotEmpty ? 'dm_$em' : 'dm_${p.uid}',
      title: p.nickname,
      avatarAsset: AppAssets.avatarPlace,
      lastMessage: '',
      timeLabel: 'Just',
      isMale: p.male,
      signature: p.personalSignature,
      zodiac: p.birthday.trim().isEmpty ? '' : Zodiac.fromBirthday(p.birthday),
      isFollowing: following.value,
      momentAssets: p.approvedPics,
      avatarUrl: p.avatar.trim().isEmpty ? null : p.avatar,
      emUserName: em,
    );
    chats.upsertPrivateChat(conversation);
    AppJumper.toChat(conversation.id, preview: conversation);
  }

  Future<void> openEditProfile() async {
    try {
      final res = await ChimoApis.user.profileOrNull();
      final me = res.data;
      if (isClosed) return;
      final seed = me ?? p;
      final updated = await AppJumper.toEditProfile(profile: seed);
      if (isClosed) return;
      if (updated != null) {
        profile.value = updated;
      } else {
        unawaited(loadProfile());
      }
    } catch (error) {
      if (isClosed) return;
      AppToast.error('Open edit profile failed: $error');
    }
  }

  Future<void> toggleFollow() async {
    final uid = targetUid;
    try {
      final res = following.value
          ? await ChimoApis.relation.unfollow(uid)
          : await ChimoApis.relation.follow(uid);
      if (isClosed) return;
      if (!res.ok) {
        AppToast.error(res.message.isEmpty ? 'Action failed' : res.message);
        return;
      }
      following.value = !following.value;
    } catch (error) {
      if (isClosed) return;
      AppToast.error('Action failed: $error');
    }
  }

  Future<void> toggleBlock() async {
    final uid = targetUid;
    if (uid.isEmpty || !RegExp(r'^\d+$').hasMatch(uid)) {
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
      following.value = false;
      AppToast.info('The other user has been blocked.');
    } catch (error) {
      if (isClosed) return;
      AppToast.info('Block failed: $error');
    }
  }
}

import 'package:chimo/app/session_info.dart';
import 'package:fixnum/fixnum.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/gift_wall.pb.dart';
import '../../../common/models/server_client/heart_link.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/models/server_client/user_realtion.pb.dart';
import '../../../common/theme/app_dialog.dart';
import '../../../common/utils/app_log.dart';
import '../../../common/utils/app_toast.dart';
import '../../../app/storage/effect_store.dart';
import '../../../common/utils/zodiac.dart';
import '../../chat/logic/chats_list_logic.dart';
import '../../chat/model/conversation_model.dart';
import 'flavor_label_store.dart';

/// 资料页逻辑（自己 / 他人共用）。对齐 joyride `PersonalCtrl`。
///
/// 种子资料构造时喂入；[bootstrap] 再拉全量。失败保留种子。
class UserProfileLogic extends GetxController {
  UserProfileLogic({required User seed}) : profile = seed.obs, following = seed.following.obs;

  /// 会话列表：Chat 按钮要先把会话补进列表再跳。
  final ConversationListLogic chats = Get.find<ConversationListLogic>();

  final Rx<User> profile;
  final RxBool following;
  final RxBool blocked = false.obs;
  final RxBool loading = true.obs;
  final RxBool isSelf = false.obs;
  final RxBool showCardEffect = false.obs;

  /// 是否展示 Reveal Card 入口。对齐 joyride `hasUnlockCard`。
  final RxBool hasUnlockRevealCard = false.obs;
  final giftWall = Rxn<GiftWallListRsp>();
  final relations = <Relation>[].obs;
  final hearties = Rxn<HeartiesQueryRsp>();

  User get p => profile.value;

  String get targetUid => p.id > Int64.ZERO ? p.uid : '';

  /// 优先资料 id；自己页种子缺 id 时回退 [SessionInfo.uid]。
  int get numericUid {
    final id = p.id.toInt();
    if (id > 0) return id;
    if (isSelf.value || targetUid == SessionInfo.uid.toString()) {
      return SessionInfo.uid;
    }
    return 0;
  }

  bool get inParty => p.hasCurrentChannel() && p.currentChannel.channelId.toInt() > 0;

  String get partyTitle {
    final name = p.channelName.trim();
    if (name.isNotEmpty) return name;
    return p.currentChannel.title.trim();
  }

  int get partyRid => p.currentChannel.channelId.toInt();

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
    bootstrap();
  }

  Future<void> bootstrap() async {
    final seedUid = targetUid;
    final self = seedUid.isNotEmpty && seedUid == SessionInfo.uid.toString();
    if (isClosed) return;
    isSelf.value = self;
    // 对齐 joyride PersonalCtrl.initData：资料与礼物墙 / 关系并行。
    await Future.wait([
      loadProfile(),
      loadGiftWall(),
      loadRelations(),
      loadHearties(),
      checkHasUnlockRevealCard(),
    ]);
    if (isClosed) return;
    await maybeShowCardEffect();
  }

  /// 下拉刷新：资料 + 礼物墙 + 关系。
  Future<void> refreshAll() async {
    await Future.wait([
      loadProfile(),
      loadGiftWall(),
      loadRelations(),
      loadHearties(),
      checkHasUnlockRevealCard(),
    ]);
  }

  /// 对齐 joyride `checkHasUnlock` → `/heart_link/hasUnlock`。
  Future<void> checkHasUnlockRevealCard() async {
    var id = numericUid;
    if (id <= 0) {
      final resolved = int.tryParse(await resolveAppUid()) ?? 0;
      id = resolved;
    }
    if (id <= 0) return;
    try {
      final res = await ChimoApis.heartLink.hasUnlock(id);
      if (isClosed) return;
      if (!res.ok || res.data == null) {
        AppLog.w('hasUnlock failed uid=$id msg=${res.message}');
        return;
      }
      hasUnlockRevealCard.value = res.data!.result;
    } catch (e) {
      AppLog.w('hasUnlock error uid=$id', error: e);
    }
  }

  Future<void> loadHearties() async {
    var id = numericUid;
    if (id <= 0) {
      final resolved = int.tryParse(await resolveAppUid()) ?? 0;
      id = resolved;
    }
    if (id <= 0) return;
    try {
      final res = await ChimoApis.heartLink.getHearties(id);
      if (!res.ok) {
        AppLog.w('getHearties failed uid=$id msg=${res.message}');
        return;
      }
      if (isClosed) return;
      hearties.value = res.data;
    } catch (e) {
      AppLog.w('getHearties error uid=$id', error: e);
    }
  }

  /// 对齐 joyride `GiftWallApi.giftWallList(userId)`。
  Future<void> loadGiftWall() async {
    var id = numericUid;
    if (id <= 0) {
      final resolved = int.tryParse(await resolveAppUid()) ?? 0;
      id = resolved;
    }
    if (id <= 0) {
      AppLog.w('gift-wall/list skipped: uid=$id');
      return;
    }
    try {
      final res = await ChimoApis.giftWall.list(id);
      if (!res.ok) {
        AppLog.w('gift-wall/list failed uid=$id msg=${res.message}');
        return;
      }
      if (isClosed) return;
      giftWall.value = res.data ?? GiftWallListRsp();
    } catch (e) {
      AppLog.w('gift-wall/list error uid=$id', error: e);
    }
  }

  /// 对齐 joyride `UserApi.getRelations(userId)`。
  Future<void> loadRelations() async {
    var id = numericUid;
    if (id <= 0) {
      final resolved = int.tryParse(await resolveAppUid()) ?? 0;
      id = resolved;
    }
    if (id <= 0) return;
    try {
      final res = await ChimoApis.relation.relations(id);
      if (!res.ok || res.data == null) {
        AppLog.w('relations failed uid=$id msg=${res.message}');
        return;
      }
      if (isClosed) return;
      final list = <Relation>[];
      for (final group in res.data!.relationGroups) {
        list.addAll(group.relations);
      }
      relations.assignAll(list);
    } catch (e) {
      AppLog.w('relations error uid=$id', error: e);
    }
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
        await SessionInfo.refreshUserInfo();
        if (isClosed) return;
        if (SessionInfo.currentUser != null) {
          await FlavorLabelStore.ensureLoaded();
          if (isClosed) return;
          profile.value = SessionInfo.currentUser!;
        }
      } else {
        final appUid = await resolveAppUid();
        if (isClosed) return;
        final infoRes = await ChimoApis.user.profileByUid(appUid);
        if (isClosed) return;
        final parsed = infoRes.data?.user;
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
          final self = SessionInfo.uid.toString() == parsed.uid;
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
    final conversation = ConversationModel(
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
      final updated = await AppJumper.toEditProfile();
      if (isClosed) return;
      if (updated != null) {
        profile.value = updated;
      } else {
        loadProfile();
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

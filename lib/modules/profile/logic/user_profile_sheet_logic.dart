import 'package:fixnum/fixnum.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../app/session_info.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/couple.pb.dart';
import '../../../common/models/server_client/gift_wall.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/utils/app_toast.dart';
import '../../room/service/room_service.dart';

/// 资料底栏逻辑。先展示种子资料，再按需拉 `/user/info`；
/// 礼物墙对齐 joyride `GiftWallApi.giftWallList`；
/// 关注对齐 `UserApi.followUser` / `unfollowUser`。
class UserProfileSheetLogic extends GetxController {
  UserProfileSheetLogic(
    User seed, {
    this.fetchProfile = true,
    this.seedName = '',
    this.seedAvatar = '',
  }) : profile = seed.obs;

  /// 无完整 [preview] 时为 true，sheet 内再请求 `/user/info`。
  final bool fetchProfile;

  final String seedName;
  final String seedAvatar;

  final Rx<User> profile;
  final following = false.obs;
  final giftWall = Rxn<GiftWallListRsp>();
  final followingBusy = false.obs;
  final loadingProfile = false.obs;

  /// Romance 房活动礼物条。对齐 joyride `RoomPersonalDataModel.coupleInfo`。
  final Rxn<CoupleInfo> romanceCouple = Rxn<CoupleInfo>();

  bool get isSelf {
    final id = profile.value.id.toInt();
    return id > 0 && id == SessionInfo.uid;
  }

  bool get showRomanceGift {
    final room = RoomService.findOrNull();
    return room != null &&
        room.isRomanceRoom &&
        romanceCouple.value != null;
  }

  @override
  void onInit() {
    following.value = profile.value.following;
    super.onInit();
    if (fetchProfile) {
      loadProfile();
    }
    loadGiftWall();
    loadRomanceGift();
  }

  /// 对齐 AppJumper 原拉取逻辑：成功后用接口资料刷新，并回填空头像/昵称。
  Future<void> loadProfile() async {
    final id = profile.value.uid.trim().isNotEmpty
        ? profile.value.uid.trim()
        : '${profile.value.id.toInt()}';
    if (id.isEmpty || id == '0') return;
    loadingProfile.value = true;
    try {
      final res = await ChimoApis.user.profileByUid(id);
      if (!res.ok || res.data == null) return;
      var next = res.data!.user;
      final apiAvatar = next.avatar.trim();
      final fallbackAvatar = seedAvatar.trim();
      if (apiAvatar.isEmpty && fallbackAvatar.isNotEmpty) {
        next = next.deepCopy()..avatar = fallbackAvatar;
      }
      final fallbackName = seedName.trim();
      if (next.nickname.trim().isEmpty && fallbackName.isNotEmpty) {
        next = next.deepCopy()..nickname = fallbackName;
      }
      profile.value = next;
      following.value = next.following;
    } catch (_) {
      // 种子资料已展示，失败不打断底栏。
    } finally {
      loadingProfile.value = false;
    }
  }

  /// 对齐 joyride `RoomPersonalDataModel._getGiftPool` / `PersonalCtrl.getGiftPool`。
  Future<void> loadGiftWall() async {
    final uid = profile.value.id.toInt();
    if (uid <= 0) return;
    try {
      final res = await ChimoApis.giftWall.list(uid);
      if (res.ok) giftWall.value = res.data;
    } catch (_) {
      // 礼物墙是底栏附加信息，失败不打断资料卡。
    }
  }

  /// Romance 房：是否展示活动礼物快捷条。
  Future<void> loadRomanceGift() async {
    final room = RoomService.findOrNull();
    if (room == null || !room.isRomanceRoom) {
      romanceCouple.value = null;
      return;
    }
    final uid = profile.value.id.toInt();
    if (uid <= 0 || isSelf) {
      romanceCouple.value = null;
      return;
    }
    try {
      final res = await ChimoApis.romance.hasSendActiveGift(uid);
      if (!res.ok || res.data == null || !res.data!.hasCoupleInfo()) {
        romanceCouple.value = null;
        return;
      }
      romanceCouple.value = res.data!.coupleInfo;
    } catch (_) {
      romanceCouple.value = null;
    }
  }

  /// 对齐 joyride follow / unfollow。
  Future<void> toggleFollow() async {
    if (isSelf || followingBusy.value) return;
    final uid = profile.value.uid;
    if (uid.isEmpty || uid == '0') return;
    followingBusy.value = true;
    try {
      final res = following.value
          ? await ChimoApis.relation.unfollow(uid)
          : await ChimoApis.relation.follow(uid);
      if (!res.ok) {
        AppToast.error(res.message.isEmpty ? 'Action failed' : res.message);
        return;
      }
      following.value = !following.value;
    } catch (error) {
      AppToast.error('Action failed: $error');
    } finally {
      followingBusy.value = false;
    }
  }

  /// 对齐 joyride `_giftWallAction`：关底栏再进礼物墙；自己先进编辑（本期同详情页）。
  Future<void> openGiftWall() async {
    final uid = profile.value.id.toInt();
    if (uid <= 0) return;
    AppJumper.back();
    await AppJumper.toGiftWall(uid);
  }

  /// 构造立刻可展示的种子 [User]。
  static User seedUser({
    required String uid,
    String name = '',
    String avatar = '',
  }) {
    return User()
      ..id = Int64(int.tryParse(uid.trim()) ?? 0)
      ..nickname = name.trim().isEmpty ? 'User' : name.trim()
      ..avatar = avatar.trim();
  }
}

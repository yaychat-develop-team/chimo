import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../app/session_info.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/gift_wall.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/utils/app_toast.dart';

/// 资料底栏逻辑。礼物墙对齐 joyride `GiftWallApi.giftWallList`；
/// 关注对齐 `UserApi.followUser` / `unfollowUser`。
class ChatUserProfileSheetLogic extends GetxController {
  ChatUserProfileSheetLogic(this.profile);

  final User profile;

  final following = false.obs;
  final giftWall = Rxn<GiftWallListRsp>();
  final followingBusy = false.obs;

  bool get isSelf => profile.id.toInt() > 0 && profile.id.toInt() == SessionInfo.uid;

  @override
  void onInit() {
    following.value = profile.following;
    super.onInit();
    loadGiftWall();
  }

  /// 对齐 joyride `RoomPersonalDataModel._getGiftPool` / `PersonalCtrl.getGiftPool`。
  Future<void> loadGiftWall() async {
    final uid = profile.id.toInt();
    if (uid <= 0) return;
    try {
      final res = await ChimoApis.giftWall.list(uid);
      if (isClosed) return;
      if (res.ok) giftWall.value = res.data;
    } catch (_) {}
  }

  /// 对齐 joyride follow / unfollow。
  Future<void> toggleFollow() async {
    if (isSelf || followingBusy.value) return;
    final uid = profile.uid;
    if (uid.isEmpty || uid == '0') return;
    followingBusy.value = true;
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
    } finally {
      if (!isClosed) followingBusy.value = false;
    }
  }

  /// 对齐 joyride `_giftWallAction`：关底栏再进礼物墙；自己先进编辑（本期同详情页）。
  Future<void> openGiftWall() async {
    final uid = profile.id.toInt();
    if (uid <= 0) return;
    AppJumper.back();
    await AppJumper.toGiftWall(uid);
  }
}

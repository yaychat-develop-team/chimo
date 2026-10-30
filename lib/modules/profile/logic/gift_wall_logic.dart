import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../app/session_info.dart';
import '../../../common/models/server_client/gift_wall.pb.dart';
import '../../../common/models/server_client/user.pb.dart';

/// 礼物墙详情。对齐 joyride `GiftWallCtrl`：`/gift-wall/detail`。
class GiftWallLogic extends GetxController {
  GiftWallLogic(this.targetUid);

  final int targetUid;

  final loading = true.obs;
  final error = ''.obs;
  final detail = Rxn<GiftWallDetailRsp>();
  final targetUser = Rxn<User>();

  bool get isMe => targetUid > 0 && targetUid == SessionInfo.uid;

  GiftWallLevel? get currentLevel {
    final levels = detail.value?.levelInfo;
    if (levels == null || levels.isEmpty) return null;
    final active = levels.indexWhere((e) => e.status == 1);
    if (active >= 0) return levels[active];
    return levels.first;
  }

  static GiftWallLogic put(int uid) {
    final tag = '$uid';
    if (Get.isRegistered<GiftWallLogic>(tag: tag)) {
      return Get.find<GiftWallLogic>(tag: tag);
    }
    return Get.put(GiftWallLogic(uid), tag: tag);
  }

  static void delete(int uid) {
    final tag = '$uid';
    if (Get.isRegistered<GiftWallLogic>(tag: tag)) {
      Get.delete<GiftWallLogic>(tag: tag, force: true);
    }
  }

  @override
  void onInit() {
    super.onInit();
    load();
    _loadUser();
  }

  Future<void> load() async {
    loading.value = true;
    error.value = '';
    try {
      final res = await ChimoApis.giftWall.detail(targetUid);
      if (isClosed) return;
      if (!res.ok || res.data == null) {
        error.value = res.message.isEmpty ? 'Failed to load' : res.message;
        detail.value = null;
      } else {
        detail.value = res.data;
      }
    } catch (e) {
      if (!isClosed) error.value = '$e';
    } finally {
      if (!isClosed) loading.value = false;
    }
  }

  Future<void> _loadUser() async {
    try {
      final res = await ChimoApis.user.profileByUid('$targetUid');
      if (isClosed) return;
      if (res.ok && res.data != null) targetUser.value = res.data!.user;
    } catch (_) {}
  }
}

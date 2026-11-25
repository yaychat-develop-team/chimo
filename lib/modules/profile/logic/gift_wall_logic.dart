import 'dart:math' as math;

import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../app/session_info.dart';
import '../../../common/models/server_client/gift_wall.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/utils/app_toast.dart';
import '../page/widgets/gift_wall_cells.dart';

/// 礼物墙详情。对齐 joyride `GiftWallCtrl`。
class GiftWallLogic extends GetxController {
  GiftWallLogic(this.targetUid);

  final int targetUid;

  final loading = true.obs;
  final sending = false.obs;
  final error = ''.obs;
  final detail = Rxn<GiftWallDetailRsp>();
  final targetUser = Rxn<User>();
  final tabIndex = 0.obs;

  bool get isMe => targetUid > 0 && targetUid == SessionInfo.uid;

  bool get loaded => detail.value != null;

  int get levelIndex {
    final levels = detail.value?.levelInfo;
    if (levels == null || levels.isEmpty) return 0;
    final active = levels.indexWhere((e) => e.status == 1);
    return math.max(active, 0);
  }

  GiftWallLevel? get currentLevel {
    final levels = detail.value?.levelInfo;
    if (levels == null || levels.isEmpty) return null;
    final i = levelIndex.clamp(0, levels.length - 1);
    return levels[i];
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
      if (!res.ok || res.data == null) {
        error.value = res.message.isEmpty ? 'Failed to load' : res.message;
        detail.value = null;
        return;
      }
      detail.value = res.data;
      _showUnlockIfNeed();
    } catch (e) {
      error.value = '$e';
    } finally {
      loading.value = false;
    }
  }

  Future<void> _loadUser() async {
    try {
      final res = await ChimoApis.user.profileByUid('$targetUid');
      if (res.ok && res.data != null) targetUser.value = res.data!.user;
    } catch (_) {}
  }

  void _showUnlockIfNeed() {
    final cards = detail.value?.cardList;
    if (cards == null || cards.isEmpty || !isMe) return;
    for (final item in cards) {
      if (!item.canActive) continue;
      if (!giftWallCardEffectShouldShow(item.id.toInt())) continue;
      showGiftWallCardUnlockDialog(
        item,
        onActive: () => activeCard(item),
      );
      return;
    }
  }

  Future<void> sendGift({required int giftPrice, required int giftId}) async {
    if (sending.value || isMe || giftId <= 0) return;
    sending.value = true;
    try {
      final cash = await ChimoApis.cash.balance();
      if (!cash.ok || cash.data == null) {
        AppToast.error(cash.message.isEmpty ? 'Failed' : cash.message);
        return;
      }
      final coin = cash.data!.coin.toInt();
      if (coin < giftPrice) {
        await AppJumper.showRechargeSheet(price: giftPrice, diffCoin: giftPrice - coin);
        return;
      }
      final result = await ChimoApis.cash.sendGift(
        receiverIds: ['$targetUid'],
        itemId: '$giftId',
        count: 1,
      );
      if (!result.ok) {
        AppToast.error(result.message.isEmpty ? 'Send failed' : result.message);
        return;
      }
      AppToast.success('Sent.');
      await load();
    } finally {
      sending.value = false;
    }
  }

  Future<void> activeCard(CardInfo item) async {
    final knapsackId = item.commodityKnapsackId.toInt();
    final id = knapsackId > 0 ? knapsackId : item.id.toInt();
    if (id <= 0) return;
    final result = await ChimoApis.giftWall.active(id);
    if (!result.ok) {
      AppToast.error(result.message.isEmpty ? 'Failed' : result.message);
      return;
    }
    AppToast.success('Activated');
    await load();
  }
}

import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/cash.pb.dart';
import '../../../common/utils/app_log.dart';

/// 送礼结果。成功时 [balance] 是刷新后的余额。
class GiftDispatch {
  const GiftDispatch._({this.error, required this.balance});

  const GiftDispatch.fail(String message) : this._(error: message, balance: 0);

  final String? error;
  final int balance;

  bool get ok => error == null;
}

/// 礼物目录、余额、选中项和数量。数量菜单的定位留在弹层。
class GiftSheetLogic extends GetxController {
  static const qtyOptions = [1, 3, 10, 40, 100, 999];

  final RxList<ItemInfo> gifts = <ItemInfo>[].obs;
  final RxInt balance = 0.obs;
  final RxBool loading = true.obs;
  final RxBool sending = false.obs;
  final RxnString loadError = RxnString();
  final RxInt selected = 0.obs;
  final RxInt qty = 1.obs;

  @override
  void onReady() {
    super.onReady();
    load();
  }

  /// 抛异常时不替换已有目录和余额，只记下错误。
  Future<void> load() async {
    loading.value = true;
    loadError.value = null;
    try {
      final itemsFuture = ChimoApis.cash.giftItems();
      final balanceFuture = ChimoApis.cash.balance();
      final itemsRes = await itemsFuture;
      final balanceRes = await balanceFuture;
      if (isClosed) return;
      final items = itemsRes.data ?? const <ItemInfo>[];
      gifts.assignAll(items);
      balance.value = balanceRes.data == null ? 0 : cashCoins(balanceRes.data!);
      selected.value = 0;
      loadError.value = items.isEmpty && !itemsRes.ok
          ? (itemsRes.message.isEmpty ? 'Failed to load gifts' : itemsRes.message)
          : null;
    } catch (error) {
      if (!isClosed) loadError.value = '$error';
    } finally {
      if (!isClosed) loading.value = false;
    }
  }

  void select(int index) => selected.value = index;

  void setQty(int value) => qty.value = value;

  /// 成功时 [sending] 保持 true，弹层马上关闭。
  Future<GiftDispatch> send(String receiverUid) async {
    if (sending.value || gifts.isEmpty) {
      return const GiftDispatch.fail('Gift failed');
    }
    final index = selected.value.clamp(0, gifts.length - 1);
    final item = gifts[index];
    final count = qty.value;
    sending.value = true;
    try {
      final res = await ChimoApis.cash.sendGift(
        receiverIds: [receiverUid],
        itemId: item.id.toString(),
        count: count,
      );
      if (!res.ok) {
        idle();
        return GiftDispatch.fail(res.message.isEmpty ? 'Gift failed' : res.message);
      }
    } catch (error) {
      idle();
      return GiftDispatch.fail('Gift failed: $error');
    }

    var next = balance.value;
    try {
      final bal = await ChimoApis.cash.balance();
      next = bal.data == null ? balance.value : cashCoins(bal.data!);
    } catch (error) {
      AppLog.w('GiftSheet balance refresh failed', error: error);
    }
    if (!isClosed) balance.value = next;
    return GiftDispatch._(balance: next);
  }

  void idle() {
    if (!isClosed) sending.value = false;
  }
}

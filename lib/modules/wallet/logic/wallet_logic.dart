import 'dart:async';

import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../app/service/iap_service.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/cash.pb.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/text_fmt.dart';

/// 我的钱包：余额 + 充值套餐。
class WalletLogic extends GetxController {
  final balance = 0.obs;
  final options = <CashChargeProductListItem>[].obs;
  final selectedIndex = 0.obs;

  StreamSubscription<void>? _rechargeSub;

  CashChargeProductListItem? get selected => options.isEmpty ? null : options[selectedIndex.value];

  /// 余额千分位，如 `1,234`。
  String get balanceText => TextFmt.toCommaValue(balance.value);

  @override
  void onInit() {
    super.onInit();
    _rechargeSub = IapService.rechargeCompleted.listen((_) => loadBalance());
  }

  @override
  void onReady() {
    super.onReady();
    load();
  }

  @override
  void onClose() {
    _rechargeSub?.cancel();
    super.onClose();
  }

  /// 余额、套餐各自独立请求，谁先回谁先刷新。
  Future<void> load() => Future.wait([loadBalance(), loadOptions()]);

  Future<void> loadBalance() async {
    try {
      final res = await ChimoApis.cash.balance();
      if (res.ok && res.data != null) {
        balance.value = cashCoins(res.data!);
        return;
      }
      AppToast.error(res.message.isEmpty ? 'Failed to load balance' : res.message);
    } catch (e) {
      AppToast.error('Failed to load balance: $e');
    }
  }

  Future<void> loadOptions() async {
    try {
      final res = await ChimoApis.cash.rechargeOptions();
      final products = res.data;
      if (res.ok && products != null && products.isNotEmpty) {
        options.assignAll(await IapService.applyStorePrices(products));
        selectedIndex.value = 0;
        return;
      }
      if (!res.ok) {
        AppToast.error(res.message.isEmpty ? 'Failed to load packages' : res.message);
      }
    } catch (e) {
      AppToast.error('Failed to load packages: $e');
    }
  }

  void select(int index) => selectedIndex.value = index;

  Future<void> topUp() async {
    final product = selected;
    if (product == null) {
      AppToast.error('No recharge packages available');
      return;
    }
    await IapService.buy(product);
  }
}

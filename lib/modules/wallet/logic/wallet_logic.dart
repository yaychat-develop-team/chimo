import 'dart:async';

import 'package:get/get.dart';

import '../../../app/service/iap_service.dart';
import '../../../app/chimo_api.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/cash.pb.dart';

/// 我的钱包：余额 + 充值套餐（`/cash/balance` + `/cash/rechargeOptions`）。
///
/// 抽出来的理由：这里不是一次取数就完事 —— 两个接口并发、套餐价格还要过一遍
/// 商店（[IapService.applyStorePrices]），另外要监听「充值完成」重新拉余额。
/// 这几件事在 `State` 里测不了。
///
/// 不 import material：失败文案 `return` 给 View 提示（和
/// `PrivacySettingsLogic` 一个约定）。
class WalletLogic extends GetxController {
  final RxInt balance = 0.obs;
  final RxList<CashChargeProductListItem> options = <CashChargeProductListItem>[].obs;
  final RxInt selectedIndex = 0.obs;
  final RxBool loading = true.obs;

  StreamSubscription<void>? _rechargeSub;

  CashChargeProductListItem? get selected {
    if (options.isEmpty) return null;
    return options[selectedIndex.value.clamp(0, options.length - 1)];
  }

  /// 余额千分位，如 `1,234`。
  String get balanceText {
    final raw = balance.value.toString();
    final buffer = StringBuffer();
    for (var i = 0; i < raw.length; i++) {
      final fromEnd = raw.length - i;
      if (i > 0 && fromEnd % 3 == 0) buffer.write(',');
      buffer.write(raw[i]);
    }
    return buffer.toString();
  }

  @override
  void onInit() {
    super.onInit();
    // 充值成功后余额要跟着变（IAP 回调走这条流）。
    _rechargeSub = IapService.rechargeCompleted.listen((_) {
      unawaited(load());
    });
  }

  @override
  void onReady() {
    super.onReady();
    // onReady = 首帧之后，等价于原来页面里的 addPostFrameCallback。
    unawaited(load());
  }

  @override
  void onClose() {
    unawaited(_rechargeSub?.cancel() ?? Future<void>.value());
    _rechargeSub = null;
    super.onClose();
  }

  /// 拉余额 + 套餐。返回错误文案，`null` 表示成功。
  Future<String?> load() async {
    loading.value = true;
    try {
      // 两个接口并发发出去，再一起等 —— 别改成顺序 await。
      final balanceFuture = ChimoApis.cash.balance();
      final optionsFuture = ChimoApis.cash.rechargeOptions();
      final balanceRes = await balanceFuture;
      final optionsRes = await optionsFuture;
      if (isClosed) return null;

      final nextBalance = balanceRes.data == null ? 0 : cashCoins(balanceRes.data!);
      var products = optionsRes.data ?? const <CashChargeProductListItem>[];
      if (products.isNotEmpty) {
        products = await IapService.applyStorePrices(products);
      }
      if (isClosed) return null;

      balance.value = nextBalance;
      // 套餐拉空就保留上一次的（接口偶发空列表时页面不至于变成没得选）。
      if (products.isNotEmpty) {
        options.assignAll(products);
        selectedIndex.value = 0;
      }
      return null;
    } catch (error) {
      return isClosed ? null : 'Failed to load wallet: $error';
    } finally {
      if (!isClosed) loading.value = false;
    }
  }

  void select(int index) => selectedIndex.value = index;

  /// 发起内购。返回错误文案，`null` 表示已交给商店。
  Future<String?> topUp() async {
    final product = selected;
    if (product == null) return 'No recharge packages available';
    await IapService.buy(product);
    return null;
  }
}

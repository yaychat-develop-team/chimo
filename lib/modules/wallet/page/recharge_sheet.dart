import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../app/service/iap_service.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/cash.pb.dart';
import '../../../common/theme/app_bottom_sheet.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/chimo.dart';
import '../../../common/widgets/app_blur_backdrop.dart';

/// 金币不足充值半屏。对齐 oumi `RechargeDialog` / `OumiRechargeDialog`，UI 按设计稿。
Future<void> showRechargeSheet({int? price, int? diffCoin, VoidCallback? onSuccess}) {
  return AppBottomSheet.show(
    isScrollControlled: true,
    barrierColor: Colors.black.withValues(alpha: 0.8),
    child: _RechargeSheet(price: price, diffCoin: diffCoin, onSuccess: onSuccess),
  );
}

class _RechargeSheet extends StatefulWidget {
  const _RechargeSheet({this.price, this.diffCoin, this.onSuccess});

  /// 本次消费需要的金币。用于默认选中能覆盖差额的套餐。
  final int? price;
  final int? diffCoin;
  final VoidCallback? onSuccess;

  @override
  State<_RechargeSheet> createState() => _RechargeSheetState();
}

class _RechargeSheetState extends State<_RechargeSheet> {
  final _options = <CashChargeProductListItem>[];
  var _balance = 0;
  var _selected = 0;
  var _loading = true;
  StreamSubscription<void>? _rechargeSub;

  CashChargeProductListItem? get _selectedProduct {
    if (_options.isEmpty) return null;
    return _options[_selected.clamp(0, _options.length - 1)];
  }

  int get _shortOf {
    if (widget.diffCoin != null) return widget.diffCoin!.clamp(0, 1 << 30);
    final need = widget.price;
    if (need == null) return 0;
    final gap = need - _balance;
    return gap > 0 ? gap : 0;
  }

  @override
  void initState() {
    super.initState();
    _rechargeSub = IapService.rechargeCompleted.listen((_) {
      widget.onSuccess?.call();
      if (mounted) Get.back<void>();
    });
    _load();
  }

  @override
  void dispose() {
    _rechargeSub?.cancel() ?? Future<void>.value();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final balanceFuture = ChimoApis.cash.balance();
      final optionsFuture = ChimoApis.cash.rechargeOptions();
      final balanceRes = await balanceFuture;
      final optionsRes = await optionsFuture;
      if (!mounted) return;

      if (balanceRes.ok && balanceRes.data != null) {
        _balance = cashCoins(balanceRes.data!);
      }

      var products = optionsRes.ok
          ? (optionsRes.data ?? const <CashChargeProductListItem>[])
          : const <CashChargeProductListItem>[];
      if (products.isNotEmpty) {
        products = await IapService.applyStorePrices(products);
        if (!mounted) return;
        _options
          ..clear()
          ..addAll(products);
        _selected = _defaultIndex(products, _shortOf);
      }

      if (!balanceRes.ok || !optionsRes.ok) {
        final message = !balanceRes.ok ? balanceRes.message : optionsRes.message;
        AppToast.error(message.isEmpty ? 'Failed to load packages' : message);
      }
    } catch (error) {
      if (mounted) AppToast.error('Failed to load packages: $error');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  /// 选中第一个能覆盖差额的套餐。对齐 joyride `CashPageModel.refresh`。
  int _defaultIndex(List<CashChargeProductListItem> products, int shortOf) {
    if (products.isEmpty) return 0;
    if (shortOf <= 0) return 0;
    final index = products.indexWhere((item) => !item.isCustomPay && item.coin.toInt() >= shortOf);
    return index >= 0 ? index : 0;
  }

  Future<void> _topUp() async {
    final product = _selectedProduct;
    if (_selectedProduct == null) {
      AppToast.error('No recharge packages available');
      return;
    }
    await IapService.buy(product);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final selected = _selectedProduct;
    return AppBlurBackdrop(
      blur: 28,
      color: AppColors.black111DE5.withValues(alpha: 0.92),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 20.w, 16.w, 12.w + bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _header(),
            SizedBox(height: 16.w),
            if (_loading)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Center(
                  child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.green29EEAA),
                ),
              )
            else if (_options.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: GestureDetector(
                  onTap: () => _load(),
                  child: const Text(
                    'No packages. Tap to retry.',
                    style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 13),
                  ),
                ),
              )
            else
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.42),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: _options.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.w,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: 2.15,
                  ),
                  itemBuilder: (context, index) {
                    final item = _options[index];
                    return _ProductTile(
                      option: item,
                      selected: index == _selected,
                      onTap: () => setState(() => _selected = index),
                    );
                  },
                ),
              ),
            SizedBox(height: 20.w),
            Chimo.s.gradientButton(
              label: selected == null ? 'Top Up' : 'Top Up ${chargePriceLabel(selected)} Now',
              onTap: () => _topUp(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    final short = _shortOf;
    return Row(
      children: [
        Text(
          'My Coins',
          style: TextStyle(color: AppColors.white50, fontSize: 12.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(width: 4.w),
        Chimo.image(AppAssets.coin, width: 16.w, height: 16.w),
        SizedBox(width: 4.w),
        Text(
          '$_balance',
          style: TextStyle(color: AppColors.white, fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        if (short > 0) ...[
          SizedBox(width: 4.w),
          Text(
            '(Short of $short Coins)',
            style: TextStyle(
              color: AppColors.white.withValues(alpha: 0.54),
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
        const Spacer(),
        GestureDetector(
          onTap: AppJumper.toCoinsDetails,
          behavior: HitTestBehavior.opaque,
          child: Icon(
            Icons.info_outline_rounded,
            size: 18.w,
            color: AppColors.white.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile({required this.option, required this.selected, required this.onTap});

  final CashChargeProductListItem option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 74.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white10,
          border: Border.all(
            color: selected ? AppColors.green00FEA8 : Colors.transparent,
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chimo.image(AppAssets.coin, width: 28.w, height: 28.w),
              SizedBox(width: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${option.coin.toInt()}',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 2.w),
                  Text(
                    chargePriceLabel(option),
                    style: TextStyle(
                      color: AppColors.gray9A9A9A,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

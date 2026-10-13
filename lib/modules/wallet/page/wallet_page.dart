import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/cash.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/app_primary_button.dart';
import '../../../common/widgets/app_image.dart';
import '../../../app/app_jumper.dart';
import '../../../common/utils/app_toast.dart';
import '../logic/wallet_logic.dart';

/// 我的钱包：余额 + 来自 cash 接口的充值套餐。
class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  late final WalletLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(WalletLogic());
  }

  @override
  void dispose() {
    if (Get.isRegistered<WalletLogic>()) Get.delete<WalletLogic>();
    super.dispose();
  }

  Future<void> _refresh() async {
    final failure = await logic.load();
    if (failure != null) AppToast.error(failure);
  }

  Future<void> _onTopUp() async {
    final failure = await logic.topUp();
    if (failure != null) AppToast.error(failure);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Obx(() {
      final options = logic.options.toList();
      final selectedIndex = logic.selectedIndex.value;
      final selected = logic.selected;
      return ChimoScaffold(
        title: 'My Wallet',
        loading: logic.loading.value,
        backdrop: AppImage(
          AppAssets.walletBg,
          width: screenWidth,
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: RefreshIndicator(
                color: AppColors.primaryBright,
                onRefresh: _refresh,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                  children: [
                    _BalanceCard(
                      balanceText: logic.balanceText,
                      onDetails: AppJumper.toCoinsDetails,
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Recharge',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: options.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 2.15,
                      ),
                      itemBuilder: (context, index) {
                        return _RechargeTile(
                          option: options[index],
                          selected: index == selectedIndex,
                          onTap: () => logic.select(index),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: AppPrimaryButton(
                label: selected == null ? 'Top Up' : 'Top Up ${chargePriceLabel(selected)} Now',
                onTap: () => unawaited(_onTopUp()),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({required this.balanceText, required this.onDetails});

  final String balanceText;
  final VoidCallback onDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        color: AppColors.primaryBright,
        borderRadius: BorderRadius.circular(28),
        image: AppImage.decorationImage(
          AppAssets.walletTopBg,
          fit: BoxFit.cover,
          opacity: 0.34,
          alignment: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          AppImage(AppAssets.coin, width: 42, height: 42),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'My Coins',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  balanceText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            child: InkWell(
              onTap: onDetails,
              borderRadius: BorderRadius.circular(18),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  'Details',
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RechargeTile extends StatelessWidget {
  const _RechargeTile({required this.option, required this.selected, required this.onTap});

  final CashChargeProductListItem option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceSheet,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? AppColors.primaryBright : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                AppImage(AppAssets.coin, width: 28, height: 28),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${option.coin.toInt()}',
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      chargePriceLabel(option),
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

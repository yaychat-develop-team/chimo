import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/iap/iap_service.dart';
import '../../core/network/app_apis.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_nav_bar.dart';
import '../../core/widgets/app_primary_button.dart';
import '../../core/widgets/app_top_loading_bar.dart';
import 'coins_details_page.dart';

/// 我的钱包：余额 + 来自 cash 接口的充值套餐。
class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _balance = 0;
  List<CashChargeProduct> _options = const [];
  int _selectedIndex = 0;
  bool _loading = true;
  StreamSubscription<void>? _rechargeSub;

  CashChargeProduct? get _selected {
    if (_options.isEmpty) return null;
    return _options[_selectedIndex.clamp(0, _options.length - 1)];
  }

  String get _balanceText {
    final raw = _balance.toString();
    final buffer = StringBuffer();
    for (var i = 0; i < raw.length; i++) {
      final fromEnd = raw.length - i;
      if (i > 0 && fromEnd % 3 == 0) buffer.write(',');
      buffer.write(raw[i]);
    }
    return buffer.toString();
  }

  @override
  void initState() {
    super.initState();
    _rechargeSub = IapService.rechargeCompleted.listen((_) {
      unawaited(_load());
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_load());
    });
  }

  @override
  void dispose() {
    unawaited(_rechargeSub?.cancel() ?? Future<void>.value());
    super.dispose();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final balanceFuture = AppApis.cash.balance();
      final optionsFuture = AppApis.cash.rechargeOptions();
      final balanceRes = await balanceFuture;
      final optionsRes = await optionsFuture;
      if (!mounted) return;

      final balance = balanceRes.data ?? 0;
      var products = optionsRes.data ?? const <CashChargeProduct>[];
      if (products.isNotEmpty) {
        products = await IapService.applyStorePrices(products);
      }
      if (!mounted) return;

      setState(() {
        _balance = balance;
        if (products.isNotEmpty) {
          _options = products;
          _selectedIndex = 0;
        }
        _loading = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load wallet: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _onDetails() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const CoinsDetailsPage(),
      ),
    );
  }

  Future<void> _onTopUp() async {
    final selected = _selected;
    if (selected == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No recharge packages available'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    await IapService.buy(selected);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AppAssets.walletBg,
              width: screenWidth,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AppNavBar(title: 'My Wallet'),
                AppTopLoadingBar(visible: _loading),
                Expanded(
                  child: RefreshIndicator(
                    color: AppColors.primaryBright,
                    onRefresh: _load,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                      children: [
                        _BalanceCard(
                          balanceText: _balanceText,
                          onDetails: _onDetails,
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
                          itemCount: _options.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 2.15,
                          ),
                          itemBuilder: (context, index) {
                            final option = _options[index];
                            return _RechargeTile(
                              option: option,
                              selected: index == _selectedIndex,
                              onTap: () =>
                                  setState(() => _selectedIndex = index),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 16 + bottom),
                  child: AppPrimaryButton(
                    label: _options.isEmpty
                        ? 'Top Up'
                        : 'Top Up ${_selected!.priceLabel} Now',
                    onTap: _onTopUp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({
    required this.balanceText,
    required this.onDetails,
  });

  final String balanceText;
  final VoidCallback onDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      padding: const EdgeInsets.fromLTRB(18, 16, 16, 16),
      decoration: BoxDecoration(
        color: AppColors.primaryBright,
        borderRadius: BorderRadius.circular(28),
        image: const DecorationImage(
          image: AssetImage(AppAssets.walletTopBg),
          fit: BoxFit.cover,
          opacity: 0.34,
          alignment: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          Image.asset(AppAssets.coin, width: 42, height: 42),
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
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
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
  const _RechargeTile({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final CashChargeProduct option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF1C1C1E),
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
                Image.asset(AppAssets.coin, width: 28, height: 28),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${option.coins}',
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      option.priceLabel,
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

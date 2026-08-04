import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/network/api_client.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';
import '../chats/data/cash_gift_dto.dart';

/// Recharge tier option.
class _RechargeOption {
  const _RechargeOption({
    required this.coins,
    required this.price,
    this.goodsId = '',
    this.productId = '',
  });

  final int coins;
  final double price;
  final String goodsId;
  final String productId;

  String get priceLabel {
    if (price <= 0) return '—';
    return '\$${price.toStringAsFixed(2)}';
  }
}

/// My wallet: balance + recharge packages from cash APIs.
class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  static const _fallbackOptions = [
    _RechargeOption(coins: 50, price: 0.99),
    _RechargeOption(coins: 150, price: 2.99),
    _RechargeOption(coins: 250, price: 4.99),
    _RechargeOption(coins: 500, price: 9.99),
    _RechargeOption(coins: 1000, price: 19.99),
    _RechargeOption(coins: 2500, price: 49.99),
    _RechargeOption(coins: 5000, price: 99.99),
  ];

  int _balance = 0;
  List<_RechargeOption> _options = _fallbackOptions;
  int _selectedIndex = 0;
  bool _loading = true;

  _RechargeOption get _selected {
    if (_options.isEmpty) return _fallbackOptions.first;
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_load());
    });
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final api = NetworkBootstrap.api;
      final results = await Future.wait([
        api.cashCurrent(),
        api.cashChargeProducts(),
      ]);
      if (!mounted) return;

      final balance = CashGiftDto.parseBalance(results[0]);
      var products = _parseChargeProducts(results[1]);
      if (products.isEmpty) {
        final goods = await api.cashGoods();
        if (!mounted) return;
        products = _parseGoods(goods);
      }

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

  static List<_RechargeOption> _parseChargeProducts(ApiResponse response) {
    if (!response.success) return const [];
    final data = response.data;
    if (data is! Map) return const [];
    final product = data['product'] ?? data['products'] ?? data['list'];
    if (product is! List) return const [];
    final out = <_RechargeOption>[];
    for (final item in product) {
      if (item is! Map) continue;
      if (item['isCustomPay'] == true) continue;
      final coins = int.tryParse('${item['coin'] ?? 0}') ?? 0;
      if (coins <= 0) continue;
      out.add(
        _RechargeOption(
          coins: coins,
          price: _parsePrice(item),
          goodsId: '${item['goodsId'] ?? ''}',
          productId: '${item['id'] ?? ''}',
        ),
      );
    }
    return out;
  }

  static List<_RechargeOption> _parseGoods(ApiResponse response) {
    if (!response.success) return const [];
    final data = response.data;
    if (data is! Map) return const [];
    final list = data['item'] ?? data['items'] ?? data['list'] ?? data['goods'];
    if (list is! List) return const [];
    final out = <_RechargeOption>[];
    for (final item in list) {
      if (item is! Map) continue;
      final coins = int.tryParse(
            '${item['coin'] ?? item['amount'] ?? item['count'] ?? 0}',
          ) ??
          0;
      if (coins <= 0) continue;
      out.add(
        _RechargeOption(
          coins: coins,
          price: _parsePrice(item),
          goodsId: '${item['goodsId'] ?? item['id'] ?? ''}',
          productId: '${item['id'] ?? ''}',
        ),
      );
    }
    return out;
  }

  static double _parsePrice(Map item) {
    final local = '${item['localPrice'] ?? item['priceText'] ?? ''}';
    if (local.isNotEmpty) {
      final n = double.tryParse(local.replaceAll(RegExp(r'[^0-9.]'), ''));
      if (n != null && n > 0) return n;
    }
    final price = double.tryParse('${item['price'] ?? ''}');
    if (price != null && price > 0) return price;
    final cent = int.tryParse('${item['cent'] ?? 0}') ?? 0;
    if (cent > 0) return cent / 100.0;
    return 0;
  }

  void _onDetails() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Balance: $_balance coins'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _onTopUp() {
    final selected = _selected;
    final id = selected.goodsId.isNotEmpty
        ? selected.goodsId
        : selected.productId;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          id.isEmpty
              ? 'Top up ${selected.priceLabel} (${selected.coins} coins)'
              : 'Package $id · ${selected.coins} coins · ${selected.priceLabel} (IAP pending)',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
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
                const _WalletAppBar(),
                if (_loading)
                  const LinearProgressIndicator(
                    minHeight: 2,
                    color: AppColors.primaryBright,
                    backgroundColor: Colors.transparent,
                  ),
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
                  child: _TopUpButton(
                    label: _options.isEmpty
                        ? 'Top Up'
                        : 'Top Up ${_selected.priceLabel} Now',
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

class _WalletAppBar extends StatelessWidget {
  const _WalletAppBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: SvgPicture.asset(
                AppAssets.chatBack,
                width: 17,
                height: 7,
              ),
            ),
          ),
          const Text(
            'My Wallet',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
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

  final _RechargeOption option;
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

class _TopUpButton extends StatelessWidget {
  const _TopUpButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryBright,
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: SizedBox(
          height: 54,
          width: double.infinity,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

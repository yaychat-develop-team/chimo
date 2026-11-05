import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import 'package:chimo/common/utils/chimo.dart';

/// Wallet / Wealth Level / Peerage 三卡。底图自带右侧 3D 图标。
class MeActionCards extends StatelessWidget {
  const MeActionCards({
    super.key,
    required this.coinText,
    required this.wealthText,
    required this.peerageText,
    this.onWalletTap,
    this.onLevelTap,
    this.onPeerageTap,
  });

  final String coinText;
  final String wealthText;
  final String peerageText;
  final VoidCallback? onWalletTap;
  final VoidCallback? onLevelTap;
  final VoidCallback? onPeerageTap;

  static const double cardHeight = 72;
  static const _gold = Color(0xFFFFD54A);
  static const _peerageSub = Color(0xFFD7C4FF);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.w,
      child: Row(
        children: [
          Expanded(
            child: _Card(
              asset: AppAssets.mineCardWallet,
              onTap: onWalletTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Wallet',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Chimo.image(AppAssets.coin, width: 14, height: 14),
                      const SizedBox(width: 3),
                      Flexible(
                        child: Text(
                          coinText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: _gold,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            height: 1.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _Card(
              asset: AppAssets.mineCardWealth,
              onTap: onLevelTap,
              child: _TitleSub(title: 'Wealth Level', sub: wealthText, subColor: _gold),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _Card(
              asset: AppAssets.mineCardPeerage,
              onTap: onPeerageTap,
              child: _TitleSub(title: 'Peerage', sub: peerageText, subColor: _peerageSub),
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleSub extends StatelessWidget {
  const _TitleSub({required this.title, required this.sub, required this.subColor});

  final String title;
  final String sub;
  final Color subColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          sub,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: subColor, fontSize: 12, fontWeight: FontWeight.w700, height: 1.1),
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.asset, required this.child, this.onTap});

  final String asset;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          height: MeActionCards.cardHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Chimo.image(asset, fit: BoxFit.cover),
              Padding(padding: const EdgeInsets.fromLTRB(10, 8, 8, 8), child: child),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';

/// 钱包 / 等级卡片：铺满背景、标题、图标（高 60）。
class MeActionCards extends StatelessWidget {
  const MeActionCards({super.key, this.onWalletTap, this.onLevelTap});

  final VoidCallback? onWalletTap;
  final VoidCallback? onLevelTap;

  static const double cardHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionCard(
            title: 'Wallet',
            cardAsset: AppAssets.mineWalletCard,
            badgeLabel: 'Reward',
            onTap: onWalletTap,
          ),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: _ActionCard(title: 'Level', cardAsset: AppAssets.mineLevelCard, onTap: onLevelTap),
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({required this.title, required this.cardAsset, this.badgeLabel, this.onTap});

  final String title;
  final String cardAsset;
  final String? badgeLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(
            height: MeActionCards.cardHeight,
            child: Stack(
              fit: StackFit.expand,
              children: [
                AppImage(cardAsset, fit: BoxFit.cover, alignment: Alignment.centerRight),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
                if (badgeLabel != null)
                  Positioned(
                    top: 6,
                    right: 8,
                    child: Container(
                      width: 44,
                      height: 14,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.dangerPink,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        badgeLabel!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

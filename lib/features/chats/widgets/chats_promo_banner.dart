import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_asset_image.dart';

/// Promo banner above list (Figma 39:428 / Group 7463).
/// Gradient pill + hand/Hi art + copy + close.
class ChatsPromoBanner extends StatelessWidget {
  const ChatsPromoBanner({
    super.key,
    this.onTap,
    this.onClose,
  });

  final VoidCallback? onTap;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 60,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 6,
                child: Container(
                  height: 54,
                  decoration: BoxDecoration(
                    gradient: AppColors.promoBannerGradient,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.only(left: 82, right: 36),
                  alignment: Alignment.centerLeft,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Adventure Awaits',
                        style: TextStyle(
                          color: AppColors.promoText,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Complete your info, get more friends!',
                        style: TextStyle(
                          color: AppColors.promoText,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Hand poking through (48×42).
              const Positioned(
                left: 24,
                top: 12,
                child: AppAssetImage(
                  AppAssets.msgPromoHand,
                  width: 48,
                  height: 42,
                  fit: BoxFit.contain,
                ),
              ),
              // Hi bubble above hand.
              const Positioned(
                left: 52,
                top: 0,
                child: AppAssetImage(
                  AppAssets.msgPromoHi,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 12,
                top: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: onClose,
                  behavior: HitTestBehavior.opaque,
                  child: const SizedBox(
                    width: 32,
                    child: Center(
                      child: AppAssetImage(
                        AppAssets.msgPromoClose,
                        width: 8,
                        height: 8,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

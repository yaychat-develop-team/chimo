import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../models/group_item.dart';

/// My Groups card (design: width 100, base card height 70, avatar 54).
class MyGroupCard extends StatelessWidget {
  const MyGroupCard({super.key, required this.group, this.onTap});

  final MyGroupItem group;
  final VoidCallback? onTap;

  /// Card body width.
  static const double cardWidth = 100;

  /// Background card height (excluding avatar overlap).
  static const double cardHeight = 70;

  /// Circular avatar side length.
  static const double avatarSize = 54;

  /// Half of avatar height overlapping above the card top edge.
  static const double avatarOverlap = avatarSize / 2;

  /// Total card height (avatar overlap + base card).
  static const double totalHeight = cardHeight + avatarOverlap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: cardWidth,
        height: totalHeight,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            // Background card + group name
            Positioned(
              top: avatarOverlap,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage(AppAssets.homeMyGroupBg),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.fromLTRB(6, 0, 6, 10),
                child: Text(
                  group.name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 18 / 12,
                  ),
                ),
              ),
            ),
            // Circular avatar (overlapping card top)
            Positioned(
              top: 0,
              child: Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.background, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.35),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(group.avatarAsset, fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

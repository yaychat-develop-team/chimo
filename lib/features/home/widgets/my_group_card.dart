import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/network_or_asset_avatar.dart';
import '../models/group_item.dart';

/// My Groups 卡片（设计：宽 100，底卡高 70，头像 54）。
class MyGroupCard extends StatelessWidget {
  const MyGroupCard({super.key, required this.group, this.onTap});

  final MyGroupItem group;
  final VoidCallback? onTap;

  /// 卡片主体宽度。
  static const double cardWidth = 100;

  /// 背景卡高度（不含头像重叠）。
  static const double cardHeight = 70;

  /// 圆形头像边长。
  static const double avatarSize = 54;

  /// 头像高度的一半，重叠在卡片上边缘之上。
  static const double avatarOverlap = avatarSize / 2;

  /// 卡片总高度（头像重叠 + 底卡）。
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
            // 背景卡 + 群名称
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
            // 圆形头像（叠在卡片顶部）
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
                  child: NetworkOrAssetAvatar(
                    asset: group.avatarAsset,
                    url: group.avatarUrl,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/network_or_asset_avatar.dart';
import '../models/group_item.dart';
import 'group_level_badge.dart';

/// Popular group large card: fixed height, same visual style as design.
class PopularGroupCard extends StatelessWidget {
  const PopularGroupCard({
    super.key,
    required this.group,
    this.onJoinTap,
    this.onTap,
    this.onMembersTap,
    this.showJoinAction = true,
  });

  final PopularGroupItem group;

  /// Top-right Join / Joined button tap.
  final VoidCallback? onJoinTap;

  /// Whole card tap.
  final VoidCallback? onTap;

  /// Member count tap (opens member list).
  final VoidCallback? onMembersTap;

  /// Home Popular list shows join control; My Groups list hides it.
  final bool showJoinAction;

  /// Tall enough for title + tag + 2-line description + stats.
  static const double cardHeight = 172;
  static const double avatarSize = 72;
  static const double _joinIconSize = 32;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: cardHeight,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.fromLTRB(14, 14, 10, 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          image: const DecorationImage(
            image: AssetImage(AppAssets.homeRoomBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: NetworkOrAssetAvatar(
                asset: group.avatarAsset,
                url: group.avatarUrl,
                width: avatarSize,
                height: avatarSize,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title row: name + level + optional join button
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                group.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            GroupLevelBadge(level: group.level),
                          ],
                        ),
                      ),
                      if (showJoinAction) ...[
                        const SizedBox(width: 4),
                        // Joined = status only (not leave). Join = tappable +.
                        if (group.isJoined)
                          IgnorePointer(
                            child: Opacity(
                              opacity: 0.9,
                              child: _JoinIcon(asset: AppAssets.homeJoined),
                            ),
                          )
                        else
                          GestureDetector(
                            onTap: onJoinTap,
                            behavior: HitTestBehavior.opaque,
                            child: _JoinIcon(asset: AppAssets.homeJoin),
                          ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Category pill tag
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.tagBackground,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      group.category,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Description: fixed 2-line slot so it never gets half-clipped.
                  Text(
                    group.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      height: 18 / 13,
                    ),
                  ),
                  const Spacer(),
                  // Member count / post count
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onMembersTap,
                        behavior: HitTestBehavior.opaque,
                        child: _Stat(
                          iconAsset: AppAssets.homePerson,
                          value: '${group.memberCount}',
                        ),
                      ),
                      const SizedBox(width: 14),
                      _Stat(
                        iconAsset: AppAssets.homeImg,
                        value: '${group.postCount}',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _JoinIcon extends StatelessWidget {
  const _JoinIcon({required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: PopularGroupCard._joinIconSize + 8,
      height: PopularGroupCard._joinIconSize + 8,
      child: Center(
        child: Image.asset(
          asset,
          width: PopularGroupCard._joinIconSize,
          height: PopularGroupCard._joinIconSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

/// Bottom stat row: icon + number.
class _Stat extends StatelessWidget {
  const _Stat({required this.iconAsset, required this.value});

  final String iconAsset;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(iconAsset, width: 12, height: 12),
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textTertiary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

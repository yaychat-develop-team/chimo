import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../models/group_item.dart';
import 'group_level_badge.dart';

/// Popular group large card: fixed 343×148 per design, same visual style.
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

  static const double cardHeight = 148;
  static const double avatarSize = 72;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: cardHeight,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.fromLTRB(14, 14, 12, 14),
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
            // Left rounded avatar
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                group.avatarAsset,
                width: avatarSize,
                height: avatarSize,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title row: name + level + optional join button
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            GroupLevelBadge(level: group.level),
                          ],
                        ),
                      ),
                      if (showJoinAction) ...[
                        const SizedBox(width: 8),
                        // Stop propagation to card onTap so Join doesn't open details.
                        GestureDetector(
                          onTap: onJoinTap,
                          behavior: HitTestBehavior.opaque,
                          child: Image.asset(
                            group.isJoined
                                ? AppAssets.homeJoined
                                : AppAssets.homeJoin,
                            width: 36,
                            height: 36,
                            fit: BoxFit.contain,
                          ),
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
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Description
                  Expanded(
                    child: Text(
                      group.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        height: 1.35,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
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

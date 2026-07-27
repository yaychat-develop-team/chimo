import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../models/group_item.dart';
import 'group_level_badge.dart';

/// 「热门小组」大卡片：按设计稿 343×148 定尺寸，保持原有视觉样式。
class PopularGroupCard extends StatelessWidget {
  const PopularGroupCard({
    super.key,
    required this.group,
    this.onJoinTap,
    this.onTap,
  });

  final PopularGroupItem group;

  /// 右上角加入 / 已加入按钮点击。
  final VoidCallback? onJoinTap;

  /// 整卡点击。
  final VoidCallback? onTap;

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
            // 左侧圆角头像
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
                  // 标题行：名称 + 等级 + 加入按钮
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
                      const SizedBox(width: 8),
                      // 阻止冒泡到整卡 onTap，避免点加入也进详情。
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
                  ),
                  const SizedBox(height: 6),
                  // 分类胶囊标签
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
                  // 简介
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
                  // 成员数 / 帖子数
                  Row(
                    children: [
                      _Stat(
                        icon: Icons.person_outline_rounded,
                        value: '${group.memberCount}',
                      ),
                      const SizedBox(width: 14),
                      _Stat(
                        icon: Icons.image_outlined,
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

/// 底部统计项：图标 + 数字。
class _Stat extends StatelessWidget {
  const _Stat({required this.icon, required this.value});

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: AppColors.textTertiary),
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

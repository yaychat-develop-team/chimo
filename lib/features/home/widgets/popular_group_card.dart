import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/network_or_asset_avatar.dart';
import '../models/group_item.dart';
import 'group_level_badge.dart';

/// 热门群大卡片：固定高度，视觉风格与设计稿一致。
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

  /// 右上角 Join / Joined 按钮点击。
  final VoidCallback? onJoinTap;

  /// 整卡点击。
  final VoidCallback? onTap;

  /// 成员数点击（打开成员列表）。
  final VoidCallback? onMembersTap;

  /// 首页 Popular 列表显示加入控件；My Groups 列表隐藏。
  final bool showJoinAction;

  /// 高度足够容纳标题 + 标签 + 两行简介 + 统计。
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
                  // 标题行：名称 + 等级 + 可选加入按钮
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
                        // Joined = 仅状态展示（非退出）。Join = 可点的 +。
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
                        height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // 简介：固定两行槽位，避免半截裁切。
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
                  // 成员数 / 帖子数
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

/// 底部统计行：图标 + 数字。
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

import 'package:flutter/material.dart';

import '../../../../common/theme/app_colors.dart';
import '../../model/me_menu_data.dart';

/// 社交数据：数字在上、标签在下，未读红点贴在数字右上。
class MeStatsSection extends StatelessWidget {
  const MeStatsSection({super.key, required this.stats, this.onStatTap});

  final List<MeStatItem> stats;
  final ValueChanged<MeStatItem>? onStatTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: stats
          .map((item) => _StatItem(item: item, onTap: () => onStatTap?.call(item)))
          .toList(),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.item, this.onTap});

  final MeStatItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final badge = item.badge;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Text(
                  item.value,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
                if (badge > 0)
                  Positioned(
                    top: -8,
                    right: -10,
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.rgba(253, 75, 75, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        badge > 99 ? '99+' : '$badge',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.gray9A9A9A,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

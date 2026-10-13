import 'package:flutter/material.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_text.dart';
import '../../model/me_menu_data.dart';

/// 社交数据行：每项标签 + 数值，四等分列。
class MeStatsRow extends StatelessWidget {
  const MeStatsRow({super.key, required this.stats, this.onStatTap});

  final List<MeStatItem> stats;
  final ValueChanged<MeStatItem>? onStatTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: stats.map((item) {
        return Expanded(
          child: GestureDetector(
            onTap: onStatTap == null ? null : () => onStatTap!(item),
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.label,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                ),
                const SizedBox(width: 4),
                Text(item.value, style: AppText.title.copyWith(height: 1.2)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

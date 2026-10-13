import 'package:flutter/material.dart';

import '../../../../../common/theme/app_colors.dart';

/// 简介展开/折叠芯片；已加入样式为深绿底 + 亮绿字。
class GroupDescToggleChip extends StatelessWidget {
  const GroupDescToggleChip({
    super.key,
    required this.expanded,
    required this.joinedStyle,
    required this.onTap,
  });

  final bool expanded;
  final bool joinedStyle;
  final VoidCallback onTap;

  static const Color _joinedBg = AppColors.chipGreenDark;
  static const Color _joinedFg = AppColors.accentLimeSoft;

  @override
  Widget build(BuildContext context) {
    final bg = joinedStyle ? _joinedBg : Colors.white.withValues(alpha: 0.12);
    final fg = joinedStyle ? _joinedFg : AppColors.textPrimary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 5, 8, 5),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              // forya 始终将该芯片标为 "See More"（上 = 折叠，下 = 展开）。
              'See More',
              style: TextStyle(
                color: fg,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(
              expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: fg,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

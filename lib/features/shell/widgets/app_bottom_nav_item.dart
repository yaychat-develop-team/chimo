import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/app_bottom_nav_destination.dart';
import '../models/main_tab.dart';
import 'main_tab_icons.dart';

/// 底部导航单项：图标 30×30 + 下方文案约 15 高。
class AppBottomNavItem extends StatelessWidget {
  const AppBottomNavItem({
    super.key,
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final AppBottomNavDestination destination;
  final bool selected;
  final VoidCallback onTap;

  /// 设计稿选中绿（与 tab_*_select 资源一致）。
  static const Color _selectedGreen = Color(0xFF1CFF8A);

  @override
  Widget build(BuildContext context) {
    final color = selected ? _selectedGreen : AppColors.textSecondary;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  MainTabIcons.build(
                    destination.tab,
                    selected: selected,
                    size: 30,
                  ),
                  if (destination.hasBadge)
                    Positioned(
                      top: -4,
                      right: -6,
                      child: _NavBadge(label: destination.badgeLabel),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 15,
              child: Text(
                destination.label,
                style: TextStyle(
                  color: color,
                  fontSize: 11,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBadge extends StatelessWidget {
  const _NavBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 18, minHeight: 14),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.badge,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xFF121212), width: 1.5),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.w700,
          height: 1.1,
        ),
      ),
    );
  }
}

extension MainTabX on MainTab {
  AppBottomNavDestination toDestination({int badgeCount = 0}) {
    return AppBottomNavDestination(tab: this, badgeCount: badgeCount);
  }
}

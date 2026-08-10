import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/app_bottom_nav_destination.dart';
import '../models/main_tab.dart';
import 'main_tab_icons.dart';

/// 单个底部导航项：30×30 图标 + 下方约 15pt 文案。
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

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      color: selected ? Colors.white : const Color(0xB3FFFFFF),
      fontSize: 10,
      fontWeight: FontWeight.w400,
      height: 1.2,
    );

    Widget label = Text(destination.label, style: labelStyle);
    if (selected) {
      label = ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) =>
            AppColors.brandTextGradient.createShader(bounds),
        child: label,
      );
    }

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
            SizedBox(height: 15, child: label),
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
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
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

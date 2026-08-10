import 'package:flutter/material.dart';

import '../models/app_bottom_nav_destination.dart';
import '../models/main_tab.dart';
import 'app_bottom_nav_item.dart';

/// 底部导航栏（设计：30×30 图标，约 15pt 文案区）。
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentTab,
    required this.destinations,
    required this.onTabSelected,
  });

  final MainTab currentTab;
  final List<AppBottomNavDestination> destinations;
  final ValueChanged<MainTab> onTabSelected;

  /// 内容高度：图标 30 + 间距 4 + 文案 15 + 纵向内边距。
  static const double barHeight = 62;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return ColoredBox(
      color: const Color(0xFF1D1D1D),
      child: SizedBox(
        height: barHeight + bottomInset,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomInset),
          child: Row(
            children: [
              for (final destination in destinations)
                AppBottomNavItem(
                  destination: destination,
                  selected: destination.tab == currentTab,
                  onTap: () => onTabSelected(destination.tab),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

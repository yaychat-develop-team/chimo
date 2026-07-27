import 'package:flutter/material.dart';

import '../models/app_bottom_nav_destination.dart';
import '../models/main_tab.dart';
import 'app_bottom_nav_item.dart';

/// 封装的底部导航栏（对齐设计稿：图标 30×30，文案区约 15 高）。
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

  /// 内容区高度：图标 30 + 间距 4 + 文案 15 + 上下边距。
  static const double barHeight = 62;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return ColoredBox(
      color: const Color(0xFF121212),
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

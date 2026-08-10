import 'main_tab.dart';

/// 底部导航项配置：绑定 [MainTab] 与可选未读角标。
class AppBottomNavDestination {
  const AppBottomNavDestination({required this.tab, this.badgeCount = 0});

  /// 关联的主 Tab。
  final MainTab tab;

  /// 未读 / 通知数；为 `0` 时不显示角标。
  final int badgeCount;

  /// 展示文案，转发自 [MainTab.label]。
  String get label => tab.label;

  /// 是否绘制角标。
  bool get hasBadge => badgeCount > 0;

  /// 角标文案：超过 99 显示 `99+`。
  String get badgeLabel {
    if (badgeCount <= 0) return '';
    if (badgeCount > 99) return '99+';
    return '$badgeCount';
  }
}

import 'main_tab.dart';

/// Bottom nav item config: binds [MainTab] with optional unread badge.
class AppBottomNavDestination {
  const AppBottomNavDestination({required this.tab, this.badgeCount = 0});

  /// Associated main tab.
  final MainTab tab;

  /// Unread / notification count; no badge when `0`.
  final int badgeCount;

  /// Display label, forwarded from [MainTab.label].
  String get label => tab.label;

  /// Whether to draw a badge.
  bool get hasBadge => badgeCount > 0;

  /// Badge text: shows `99+` when count exceeds 99.
  String get badgeLabel {
    if (badgeCount <= 0) return '';
    if (badgeCount > 99) return '99+';
    return '$badgeCount';
  }
}

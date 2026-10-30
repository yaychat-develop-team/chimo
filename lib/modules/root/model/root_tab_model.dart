class RootTabModel {
  const RootTabModel({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    this.showsUnread = false,
  });

  final String label;
  final String icon;
  final String selectedIcon;
  final bool showsUnread;
}

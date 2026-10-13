import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// 标签胶囊。可点选的用 [selectable]，只展示的传入 [child]。
class AppTagChip extends StatelessWidget {
  const AppTagChip({
    super.key,
    required this.child,
    this.color = AppColors.tagBackground,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.radius = 14,
    this.borderColor,
  });

  factory AppTagChip.selectable({
    Key? key,
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return AppTagChip(
      key: key,
      onTap: onTap,
      color: AppColors.tagBackground,
      borderColor: selected ? AppColors.primary : AppColors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      radius: 20,
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.textGrayCF,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  final Widget child;
  final Color color;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(this.radius);
    if (onTap == null) {
      return Container(
        padding: padding,
        decoration: BoxDecoration(color: color, borderRadius: radius),
        child: child,
      );
    }
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: color,
          borderRadius: radius,
          border: borderColor == null ? null : Border.all(color: borderColor!, width: 1),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}

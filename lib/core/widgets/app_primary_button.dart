import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Solid primary pill CTA (wallet / phone login style).
class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.enabled = true,
    this.loading = false,
    this.height = 54,
    this.borderRadius = 28,
    this.color = AppColors.primaryBright,
    this.disabledColor = const Color(0xFFE8E8E8),
    this.labelColor = Colors.black,
    this.disabledLabelColor = const Color(0xFFB0B0B0),
    this.fontSize = 17,
  });

  final String label;
  final VoidCallback? onTap;
  final bool enabled;
  final bool loading;
  final double height;
  final double borderRadius;
  final Color color;
  final Color disabledColor;
  final Color labelColor;
  final Color disabledLabelColor;
  final double fontSize;

  bool get _interactive => enabled && !loading && onTap != null;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    return Material(
      color: enabled ? color : disabledColor,
      borderRadius: radius,
      child: InkWell(
        onTap: _interactive ? onTap : null,
        borderRadius: radius,
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: Center(
            child: loading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.2,
                      color: Colors.black54,
                    ),
                  )
                : Text(
                    label,
                    style: TextStyle(
                      color: enabled ? labelColor : disabledLabelColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

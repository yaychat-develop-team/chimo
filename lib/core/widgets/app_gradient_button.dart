import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Promo gradient pill CTA (`AppColors.promoBannerGradient`).
class AppGradientButton extends StatelessWidget {
  const AppGradientButton({
    super.key,
    required this.label,
    required this.onTap,
    this.height = 54,
    this.width,
    this.enabled = true,
    this.loading = false,
    this.borderRadius = 27,
    this.labelStyle,
  });

  final String label;
  final VoidCallback? onTap;
  final double height;
  final double? width;
  final bool enabled;
  final bool loading;
  final double borderRadius;
  final TextStyle? labelStyle;

  bool get _interactive => enabled && !loading && onTap != null;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _interactive ? onTap : null,
        borderRadius: radius,
        child: Ink(
          height: height,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: radius,
            gradient: enabled ? AppColors.promoBannerGradient : null,
            color: enabled ? null : const Color(0xFF3A3A3A),
          ),
          child: Center(
            child: loading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.2,
                      color: AppColors.promoText,
                    ),
                  )
                : Text(
                    label,
                    style: labelStyle ??
                        const TextStyle(
                          color: AppColors.promoText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
          ),
        ),
      ),
    );
  }
}

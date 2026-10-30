import 'package:chimo/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

mixin AppButton {
  /// 促销渐变胶囊按钮。
  Widget gradientButton({
    Key? key,
    required String label,
    required VoidCallback? onTap,
    double height = 54,
    double? width,
    bool enabled = true,
    bool loading = false,
    double borderRadius = 27,
    TextStyle? labelStyle,
  }) {
    final textStyle =
        labelStyle ??
        TextStyle(color: AppColors.black1C1C1E, fontSize: 14, fontWeight: FontWeight.w600);
    return GestureDetector(
      key: key,
      onTap: enabled && !loading ? onTap : null,
      child: Container(
        height: height,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: enabled ? AppColors.primaryGradient : null,
          color: enabled ? null : AppColors.gray333333,
        ),
        child: loading
            ? const SizedBox.square(
                dimension: 22,
                child: CircularProgressIndicator(strokeWidth: 2.2, color: AppColors.black1C1C1E),
              )
            : Text(label, style: textStyle),
      ),
    );
  }

  /// 实心主色胶囊按钮。
  Widget primaryButton({
    Key? key,
    required String label,
    required VoidCallback? onTap,
    bool enabled = true,
    bool loading = false,
    double height = 54,
    double borderRadius = 27,
    Color color = AppColors.green1BBA77,
    Color disabledColor = AppColors.grayE8E8E8,
    Color labelColor = Colors.black,
    Color disabledLabelColor = AppColors.grayB0B0B0,
    double fontSize = 17,
  }) {
    final interactive = enabled && !loading && onTap != null;
    final radius = BorderRadius.circular(borderRadius);
    return Material(
      key: key,
      color: enabled ? color : disabledColor,
      borderRadius: radius,
      child: InkWell(
        onTap: interactive ? onTap : null,
        borderRadius: radius,
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: Center(
            child: loading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(strokeWidth: 2.2, color: Colors.black54),
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

  /// 引导页右上角 Skip。
  Widget skipButton({Key? key, required VoidCallback? onPressed, bool enabled = true}) {
    return TextButton(
      key: key,
      onPressed: enabled ? onPressed : null,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.gray9A9A9A,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      child: const Text('Skip'),
    );
  }
}

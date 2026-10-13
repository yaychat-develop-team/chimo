import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'app_back_button.dart';

/// 标准二级页导航：高度 48，返回 + 居中标题 + 可选尾部。
///
/// 标题为空时只留返回和尾部。浅色页把 [foregroundColor] 设成深色。
class AppNavBar extends StatelessWidget {
  const AppNavBar({
    super.key,
    this.title = '',
    this.onBack,
    this.trailing,
    this.titleStyle,
    this.foregroundColor = AppColors.textPrimary,
    this.circled = false,
    this.backEnabled = true,
  });

  final String title;
  final VoidCallback? onBack;
  final Widget? trailing;
  final TextStyle? titleStyle;
  final Color foregroundColor;

  /// 圆形返回，引导页和盖在头图上时用。
  final bool circled;

  final bool backEnabled;

  @override
  Widget build(BuildContext context) {
    final back = circled
        ? AppBackButton.circle(onPressed: onBack, color: foregroundColor, enabled: backEnabled)
        : AppBackButton(onPressed: onBack, color: foregroundColor, enabled: backEnabled);
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(alignment: Alignment.centerLeft, child: back),
          if (title.isNotEmpty)
            Text(
              title,
              style:
                  titleStyle ??
                  TextStyle(color: foregroundColor, fontSize: 18, fontWeight: FontWeight.w700),
            ),
          if (trailing != null) Align(alignment: Alignment.centerRight, child: trailing),
        ],
      ),
    );
  }
}

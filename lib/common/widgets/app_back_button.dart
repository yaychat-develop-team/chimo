import 'package:flutter/material.dart';

import '../../app/app_jumper.dart';
import '../constants/app_assets.dart';
import '../theme/app_colors.dart';
import 'app_image.dart';

/// 统一返回按钮。
///
/// 无底样式占 48，导航栏里箭头位置一致。
/// [AppBackButton.circle] 是 36 的圆形底，用在引导页和盖在头图上的返回。
class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onPressed,
    this.color = AppColors.textPrimary,
    this.enabled = true,
  }) : circled = false;

  const AppBackButton.circle({
    super.key,
    this.onPressed,
    this.color = AppColors.textPrimary,
    this.enabled = true,
  }) : circled = true;

  final VoidCallback? onPressed;
  final Color color;

  /// 为 false 时不可点。省略 [onPressed] 时走 [AppJumper.maybeBack]。
  final bool enabled;
  final bool circled;

  static const double _plainExtent = 48;
  static const double _circleExtent = 36;

  @override
  Widget build(BuildContext context) {
    final icon = AppImage(AppAssets.chatBack, width: 17, height: 7, color: color);
    final onTap = enabled ? (onPressed ?? AppJumper.maybeBack) : null;
    if (!circled) {
      return Container(
        padding: EdgeInsets.only(left: 4),
        child: IconButton(
          onPressed: onTap,
          padding: const EdgeInsets.all(8),
          constraints: const BoxConstraints(minWidth: _plainExtent, minHeight: _plainExtent),
          icon: icon,
        ),
      );
    }
    return Material(
      color: Colors.black.withValues(alpha: 0.35),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: _circleExtent,
          height: _circleExtent,
          child: Center(child: icon),
        ),
      ),
    );
  }
}

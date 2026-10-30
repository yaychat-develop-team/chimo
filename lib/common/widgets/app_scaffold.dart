import 'package:chimo/app/app_jumper.dart';
import 'package:chimo/common/constants/app_assets.dart';
import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.appBar,
    this.extendBody = false,
    this.backdrop,
    required this.body,
    this.backgroundColor = AppColors.black,
    this.resizeToAvoidBottomInset,
  });
  final Widget? appBar;
  final bool extendBody;
  final Widget? backdrop;
  final Widget body;
  final Color backgroundColor;
  final bool? resizeToAvoidBottomInset;

  bool get _light => backgroundColor.computeLuminance() > 0.5;

  @override
  Widget build(BuildContext context) {
    final SystemUiOverlayStyle overlay = _light
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlay.copyWith(
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
      ),
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: Stack(
          children: [
            if (backdrop != null) Positioned(top: 0, left: 0, right: 0, child: backdrop!),
            Positioned.fill(
              child: Column(
                children: [
                  if (appBar != null && !extendBody) appBar!,
                  Expanded(child: body),
                ],
              ),
            ),
            if (appBar != null && extendBody) Positioned(top: 0, left: 0, right: 0, child: appBar!),
          ],
        ),
      ),
    );
  }
}

class AppNavBar extends StatelessWidget {
  const AppNavBar({
    super.key,
    this.title = '',
    this.onBack,
    this.trailing,
    this.titleStyle,
    this.foregroundColor = AppColors.white,
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
        ? AppBackButton.circle(onBack: onBack, color: foregroundColor, enabled: backEnabled)
        : AppBackButton(onBack: onBack, color: foregroundColor, enabled: backEnabled);
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 44.w,
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
      ),
    );
  }
}

/// [AppBackButton.circle] 是 36 的圆形底，用在引导页和盖在头图上的返回。
class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onBack, this.color = AppColors.white, this.enabled = true})
    : circled = false;

  const AppBackButton.circle({
    super.key,
    this.onBack,
    this.color = AppColors.white,
    this.enabled = true,
  }) : circled = true;

  final VoidCallback? onBack;
  final Color color;

  final bool enabled;
  final bool circled;

  static const double _plainExtent = 48;
  static const double _circleExtent = 36;

  @override
  Widget build(BuildContext context) {
    final icon = Chimo.image(AppAssets.chatBack, width: 17, height: 7, color: color);
    // Get.back 带可选命名参数，不能直接当 VoidCallback；包一层，点击时再返回。
    final VoidCallback? onTap = enabled ? (onBack ?? AppJumper.maybeBack) : null;
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

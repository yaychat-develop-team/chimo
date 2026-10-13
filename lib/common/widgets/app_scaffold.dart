import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import 'app_nav_bar.dart';
import 'app_top_loading_bar.dart';

/// 页面外壳：背景、安全区、状态栏、顶栏和加载条。
///
/// 顶图放 [backdrop]，可以是一张图，也可以是自己的 `Stack`（图 + 渐变）。
/// 它贴在屏幕最顶，导航栏仍在安全区内。
///
/// 整页自己排叠层时关掉 [safeArea]，把原来的 `Stack` 当作 [body]。
/// 顶栏不是「返回 + 标题」时，用 [navigation] 换上自己的顶栏；启动页、主 Tab 设 [showNav] 为 false。
class ChimoScaffold extends StatelessWidget {
  const ChimoScaffold({
    super.key,
    this.title = '',
    required this.body,
    this.trailing,
    this.loading = false,
    this.onBack,
    this.backgroundColor = AppColors.background,
    this.titleStyle,
    this.backdrop,
    this.navigation,
    this.showNav = true,
    this.circledBack = false,
    this.backEnabled = true,
    this.foregroundColor,
    this.safeArea = true,
    this.resizeToAvoidBottomInset = true,
    this.bottomNavigationBar,
  });

  final String title;
  final Widget body;
  final Widget? trailing;
  final bool loading;
  final VoidCallback? onBack;
  final Color backgroundColor;
  final TextStyle? titleStyle;

  /// 铺在导航栏后面的顶图或叠层。
  final Widget? backdrop;

  /// 替换标准顶栏。和 [showNav] 同时给时用这一份。
  final Widget? navigation;

  final bool showNav;
  final bool circledBack;
  final bool backEnabled;

  /// 省略时按 [backgroundColor] 亮度选择黑或白。
  final Color? foregroundColor;

  /// 为 false 时内容可以画进状态栏，适合整页叠层。
  final bool safeArea;

  final bool resizeToAvoidBottomInset;
  final Widget? bottomNavigationBar;

  bool get _light => backgroundColor.computeLuminance() > 0.5;

  @override
  Widget build(BuildContext context) {
    final foreground = foregroundColor ?? (_light ? Colors.black : AppColors.textPrimary);
    final navBar = _navBar(foreground);
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ?navBar,
        AppTopLoadingBar(visible: loading),
        Expanded(child: body),
      ],
    );
    final page = safeArea ? SafeArea(child: content) : content;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _light ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        bottomNavigationBar: bottomNavigationBar,
        body: Stack(
          fit: StackFit.expand,
          children: [
            if (backdrop != null) Positioned(top: 0, left: 0, right: 0, child: backdrop!),
            page,
          ],
        ),
      ),
    );
  }

  Widget? _navBar(Color foreground) {
    if (navigation != null) return navigation;
    if (!showNav) return null;
    return AppNavBar(
      title: title,
      onBack: onBack,
      trailing: trailing,
      titleStyle: titleStyle,
      foregroundColor: foreground,
      circled: circledBack,
      backEnabled: backEnabled,
    );
  }
}

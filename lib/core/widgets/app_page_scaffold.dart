import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'app_nav_bar.dart';
import 'app_top_loading_bar.dart';

/// Standard dark push-page shell: Scaffold + SafeArea + AppNavBar + body.
class AppPageScaffold extends StatelessWidget {
  const AppPageScaffold({
    super.key,
    required this.title,
    required this.body,
    this.trailing,
    this.loading = false,
    this.onBack,
    this.backIcon = AppNavBackIcon.chatBack,
    this.backgroundColor = AppColors.background,
    this.titleStyle,
  });

  final String title;
  final Widget body;
  final Widget? trailing;
  final bool loading;
  final VoidCallback? onBack;
  final AppNavBackIcon backIcon;
  final Color backgroundColor;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppNavBar(
              title: title,
              onBack: onBack,
              trailing: trailing,
              backIcon: backIcon,
              titleStyle: titleStyle,
            ),
            AppTopLoadingBar(visible: loading),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}

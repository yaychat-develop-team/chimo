import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../auth/login_page.dart';

/// 应用启动页：`launch_bg` + 底部 slogan，随后进入登录页。
class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    this.displayDuration = const Duration(milliseconds: 1800),
  });

  /// 展示时长（结束后跳转登录）。
  final Duration displayDuration;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.displayDuration, _goLogin);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _goLogin() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder<void>(
        pageBuilder: (_, _, _) => const LoginPage(),
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 420),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 背景图底部自带 “Chimo” 字标；向上对齐，给 slogan 留出底部空间。
          Image.asset(
            AppAssets.launchBg,
            fit: BoxFit.cover,
            alignment: const Alignment(0, -0.45),
          ),
          // 底部渐变遮罩，避免背景字标与 slogan 抢同一行。
          const Align(
            alignment: Alignment.bottomCenter,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00000000),
                    Color(0xCC000000),
                    Color(0xFF000000),
                  ],
                  stops: [0.0, 0.45, 1.0],
                ),
              ),
              child: SizedBox(height: 140, width: double.infinity),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppAssets.splashTitle,
                      height: 34,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 12),
                    Image.asset(
                      AppAssets.splashSlogan,
                      height: 15,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/auth/auth_session.dart';
import '../../core/constants/app_assets.dart';

/// 启动页：上方 launch_bg + 底部 slogan，随后进入登录或主页。
class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    this.displayDuration = const Duration(milliseconds: 1800),
  });

  /// 展示时长（结束后跳转）。
  final Duration displayDuration;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.displayDuration, _goNext);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _goNext() async {
    if (!mounted) return;
    final loggedIn = await AuthSession.isLoggedIn();
    if (!mounted) return;
    context.go(loggedIn ? AppRoutes.shell : AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final screenW = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Column(
        children: [
          // Logo 与字标已在资源内；按宽度适配以保持在屏幕上方。
          Image.asset(
            AppAssets.launchBg,
            width: screenW,
            fit: BoxFit.fitWidth,
          ),
          const Spacer(),
          Image.asset(
            AppAssets.splashSlogan,
            height: 15,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 54 + bottom),
        ],
      ),
    );
  }
}

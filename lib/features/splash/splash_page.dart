import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/auth/auth_session.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';

/// App launch screen: launch_bg + bottom slogan, then login or main.
class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    this.displayDuration = const Duration(milliseconds: 1800),
  });

  /// Display duration (navigates when elapsed).
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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background includes "Chimo" wordmark at bottom; align upward to leave room for slogan.
          Image.asset(
            AppAssets.launchBg,
            fit: BoxFit.cover,
            alignment: const Alignment(0, -0.45),
          ),
          // Bottom gradient mask so wordmark and slogan don't clash.
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

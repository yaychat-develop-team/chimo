import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../shell/main_tab_shell.dart';

/// 注册完成后的品牌欢迎页，短暂展示后进入主页。
class WelcomeBrandPage extends StatefulWidget {
  const WelcomeBrandPage({
    super.key,
    this.displayDuration = const Duration(milliseconds: 2200),
  });

  final Duration displayDuration;

  @override
  State<WelcomeBrandPage> createState() => _WelcomeBrandPageState();
}

class _WelcomeBrandPageState extends State<WelcomeBrandPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.displayDuration, _goMain);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _goMain() {
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder<void>(
        pageBuilder: (_, _, _) => const MainTabShell(),
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 420),
      ),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // 顶部微弱绿色光晕。
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, -1.05),
                  radius: 1.15,
                  colors: [
                    const Color(0xFF1A3A28).withValues(alpha: 0.85),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppAssets.brandTitleLogo,
                      height: 56,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Unvoiced workplace secrets. A\n'
                      'shared experience connects us\n'
                      'instantly!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

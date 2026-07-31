import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../features/splash/splash_page.dart';

/// Chimo root widget: configures [MaterialApp] theme; shows Splash first.
class ChimoApp extends StatelessWidget {
  const ChimoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chimo',
      debugShowCheckedModeBanner: false,
      // App-wide dark theme aligned with the home design.
      theme: AppTheme.dark,
      home: const SplashPage(),
    );
  }
}

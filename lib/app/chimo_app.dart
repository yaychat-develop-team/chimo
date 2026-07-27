import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../features/splash/splash_page.dart';

/// Chimo 根组件：配置 [MaterialApp] 主题；启动时先显示 Splash。
class ChimoApp extends StatelessWidget {
  const ChimoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chimo',
      debugShowCheckedModeBanner: false,
      // 全局使用暗色主题，与首页设计稿一致。
      theme: AppTheme.dark,
      home: const SplashPage(),
    );
  }
}

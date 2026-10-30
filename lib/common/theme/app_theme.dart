import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

/// 应用主题配置。
abstract final class AppTheme {
  /// 深色主题：黑底、绿色主色、浅色状态栏图标。
  static ThemeData get dark {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      // 不要全局挂 Emoji 字体：其字距/行高会把普通文字撑出大间隔。
      // 自定义表情仅在聊天气泡/输入框用 TextStyle.withAppEmoji。
      colorScheme: const ColorScheme.dark(
        primary: AppColors.green1BBA77,
        surface: AppColors.black111111,
        onPrimary: Colors.black,
        onSurface: AppColors.white,
      ),
    );

    return base.copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        elevation: 0,
        scrolledUnderElevation: 0,
        // 深色背景上使用浅色系统状态栏。
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      textTheme: base.textTheme.apply(
        bodyColor: AppColors.white,
        displayColor: AppColors.white,
      ),
    );
  }
}

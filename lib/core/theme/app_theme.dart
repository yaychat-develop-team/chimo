import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_emoji.dart';

/// 应用主题配置。
abstract final class AppTheme {
  /// 深色主题：黑底、绿色主色、浅色状态栏图标。
  static ThemeData get dark {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      // 群聊/私聊里 forya 自定义表情（PUA）依赖 Emoji 字体回落。
      fontFamilyFallback: const [AppEmoji.fontFamily],
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        surface: AppColors.surface,
        onPrimary: Colors.black,
        onSurface: AppColors.textPrimary,
      ),
    );

    return base.copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        // 深色背景上使用浅色系统状态栏。
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      textTheme: base.textTheme.apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),
    );
  }
}

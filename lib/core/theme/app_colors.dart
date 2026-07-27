import 'package:flutter/material.dart';

/// 设计色板：色值从首页设计稿取样，统一全应用视觉。
abstract final class AppColors {
  // ---------- 背景 / 表面 ----------
  /// 页面主背景（纯黑）。
  static const Color background = Color(0xFF000000);

  /// 次级表面色。
  static const Color surface = Color(0xFF0F0F0F);

  /// 卡片底色。
  static const Color card = Color(0xFF151815);

  /// 卡片描边 / 边缘色。
  static const Color cardEdge = Color(0xFF1C2420);

  // ---------- 品牌强调色 ----------
  /// 主色：选中 Tab、强调元素。
  static const Color primary = Color(0xFF24B572);

  /// 更亮的主色：加入按钮等。
  static const Color primaryBright = Color(0xFF1BBA77);

  // ---------- 文字 ----------
  /// 主文字（白）。
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// 次要文字（灰）。
  static const Color textSecondary = Color(0xFF9A9A9A);

  /// 辅助文字 / 统计数字。
  static const Color textTertiary = Color(0xFF6E6E6E);

  // ---------- 功能色 ----------
  /// 未读角标红。
  static const Color badge = Color(0xFFE44E50);

  /// 搜索按钮底色。
  static const Color searchButton = Color(0xFF1A1A1A);

  /// 分类标签底色。
  static const Color tagBackground = Color(0xFF2A2A2A);

  /// 已加入按钮底色。
  static const Color joinedButton = Color(0xFF2C2C2C);

  /// 等级徽章渐变起点 / 终点。
  static const Color levelBadgeStart = Color(0xFF9B6BFF);
  static const Color levelBadgeEnd = Color(0xFF6B4EFF);

  /// 「我的小组」卡片背景渐变（上绿下黑）。
  static const LinearGradient myGroupCardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1A2A22), Color(0xFF0A0C0B)],
  );

  /// 「热门小组」卡片背景渐变。
  static const LinearGradient popularCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A221C), Color(0xFF101210)],
  );
}

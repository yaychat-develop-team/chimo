import 'package:flutter/material.dart';

/// 从首页设计稿取样的调色板；全应用共用。
abstract final class AppColors {
  // ---------- 背景 / 表面 ----------
  /// 页面背景（纯黑）。
  static const Color background = Color(0xFF000000);

  /// 次级表面。
  static const Color surface = Color(0xFF0F0F0F);

  /// 卡片填充。
  static const Color card = Color(0xFF151815);

  /// 卡片描边 / 边缘。
  static const Color cardEdge = Color(0xFF1C2420);

  // ---------- 品牌强调色 ----------
  /// 主色：选中 Tab、强调色。
  static const Color primary = Color(0xFF24B572);

  /// 更亮的主色：加入按钮等。
  static const Color primaryBright = Color(0xFF1BBA77);

  /// 会话 / 品牌渐变起点（Figma #00FEA8）。
  static const Color accentMint = Color(0xFF00FEA8);

  /// 会话 / 品牌渐变终点（Figma #00F875）。
  static const Color accentLime = Color(0xFF00F875);

  /// 官方名称 / 选中 Tab 文案渐变（UI 中从左到右）。
  static const LinearGradient brandTextGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [accentLime, accentMint],
  );

  /// 推广 Banner 填充（Figma：左 lime → 右 mint）。
  static const LinearGradient promoBannerGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [accentLime, accentMint],
  );

  // ---------- 文字 ----------
  /// 主文字（白）。
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// 次要文字（灰）。
  static const Color textSecondary = Color(0xFF9A9A9A);

  /// 三级文字 / 统计。
  static const Color textTertiary = Color(0xFF6E6E6E);

  /// 会话预览文案（Figma 白色 70%）。
  static const Color textPreview = Color(0xB3FFFFFF);

  /// 会话时间戳（Figma 白色 36%）。
  static const Color textTime = Color(0x5CFFFFFF);

  /// 推广 Banner 正文。
  static const Color promoText = Color(0xFF232518);

  // ---------- 功能色 ----------
  /// 未读角标红（Figma #FD4B4B）。
  static const Color badge = Color(0xFFFD4B4B);

  /// 搜索按钮填充。
  static const Color searchButton = Color(0xFF1A1A1A);

  /// 会话页顶栏图标 / 会话行填充（白色 8%）。
  static const Color chatsRowFill = Color(0x14FFFFFF);

  /// 在线状态圆点（与品牌 lime 一致）。
  static const Color onlineDot = accentLime;

  /// 分类标签填充。
  static const Color tagBackground = Color(0xFF2A2A2A);

  /// 已加入按钮填充。
  static const Color joinedButton = Color(0xFF2C2C2C);

  /// 等级徽章渐变起点 / 终点。
  static const Color levelBadgeStart = Color(0xFF9B6BFF);
  static const Color levelBadgeEnd = Color(0xFF6B4EFF);

  /// 「我的群组」卡片背景渐变（绿到黑）。
  static const LinearGradient myGroupCardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1A2A22), Color(0xFF0A0C0B)],
  );

  /// 「热门群组」卡片背景渐变。
  static const LinearGradient popularCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A221C), Color(0xFF101210)],
  );
}

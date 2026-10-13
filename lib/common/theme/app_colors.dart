import 'package:flutter/material.dart';

/// 全局颜色配置：App 内所有颜色的唯一来源。
///
/// 约定
/// 页面与组件里不再写 `Color(0x...)` 字面量，一律引用这里的 token；
/// 新增颜色也先加到本文件，再在页面引用。
/// 命名分组：品牌 / 背景与容器 / 描边 / 文本灰阶 / 功能色 / 等级 / 半透明 / 渐变。
/// 中性灰阶用 `xxxGrayNN` 命名，`NN` 是十六进制亮度分量，越大越亮。
/// 这样相近取值会并排出现（例如 `textGray99` 与 `textSecondary` 的 9A），
/// 一眼能看出哪些是历史抄写漂移。
/// 若要统一视觉（把近白的 F0/F2/F3/F5/F7 收成一个），只改本文件即可，
/// 不必再回到各个页面。
/// 注释里的「用量」是集中时各取值在 lib/ 下的出现次数，便于判断哪个是主色。
abstract final class AppColors {
  // ===========================================================================
  // 品牌与强调色
  // ===========================================================================

  /// 主品牌绿（按钮、选中态）。
  static const Color primary = Color(0xFF24B572);

  /// 主品牌绿的高亮版本，用量最大的绿色。
  static const Color primaryBright = Color(0xFF1BBA77);

  /// 渐变端点：薄荷绿。
  static const Color accentMint = Color(0xFF00FEA8);

  /// 渐变端点：亮柠檬绿。
  static const Color accentLime = Color(0xFF00F875);

  /// 霓虹绿：礼物面板、调试页、好友筛选选中态。用量 18。
  static const Color accentNeon = Color(0xFF1CFF8A);

  /// 青绿：群成员昵称。
  static const Color accentTeal = Color(0xFF00D68F);

  /// 亮黄绿：部落推荐页强调文案。用量 4。
  static const Color accentLimeBright = Color(0xFFB6FF2E);

  /// 柔和黄绿：聊天里"自己"的标识色。用量 4。
  static const Color accentLimeSoft = Color(0xFFB8FF6A);

  /// 暗调黄绿。
  static const Color accentLimeDim = Color(0xFFC7EF4C);

  /// 在线状态圆点。
  static const Color onlineDot = accentLime;

  // ===========================================================================
  // 背景与容器（深色，由深到浅）
  // ===========================================================================

  /// 全局页面底色。
  static const Color background = Color(0xFF000000);

  /// 偏蓝的深夜底色：引导流程页面背景。用量 10。
  static const Color backgroundDeep = Color(0xFF0A0A14);

  /// 一级容器底色。
  static const Color surface = Color(0xFF0F0F0F);

  /// 二级容器底色：聊天气泡、输入面板。用量 17。
  static const Color surfaceDark = Color(0xFF111111);

  /// 群组卡片底色。
  static const Color card = Color(0xFF151815);

  /// 输入框 / 搜索框底色。用量 5。
  static const Color surfaceInput = Color(0xFF1A1A1A);

  /// 兼容旧名，等同 [surfaceInput]。
  static const Color searchButton = surfaceInput;

  /// 浮起容器底色。
  static const Color surfaceElevated = Color(0xFF1A1A1D);

  /// 底部弹窗底色（iOS 系统深灰）。用量 16。
  static const Color surfaceSheet = Color(0xFF1C1C1E);

  /// 卡片描边（偏绿的深色）。
  static const Color cardEdge = Color(0xFF1C2420);

  /// 弱化容器底色。
  static const Color surfaceMuted = Color(0xFF1D1D1D);

  /// 橄榄调容器底色：聊天里的引用块。用量 4。
  static const Color surfaceOlive = Color(0xFF262624);

  /// 标签 / 胶囊底色。用量 17。
  static const Color tagBackground = Color(0xFF2A2A2A);

  /// 弹窗内分区底色。用量 4。
  static const Color surfaceSection = Color(0xFF2A2A2D);

  /// 已加入按钮底色。
  static const Color joinedButton = Color(0xFF2C2C2C);

  /// 表单字段底色。用量 10。
  static const Color surfaceField = Color(0xFF2C2C2E);

  /// 橄榄调选中态底色。
  static const Color surfaceOliveActive = Color(0xFF2E2E16);

  /// 中灰容器底色。
  static const Color surfaceGray = Color(0xFF4A4A4A);

  /// 绿调面板底色：个人资料浮层。用量 3。
  static const Color panelGreen = Color(0xFF1A1F1C);

  /// 绿调面板渐变上端。
  static const Color panelGreenTop = Color(0xFF24352A);

  /// 深绿胶囊底色。用量 4。
  static const Color chipGreenDark = Color(0xFF1A3A28);

  /// 弱化绿胶囊底色。
  static const Color chipGreenMuted = Color(0xFF2A3A2A);

  /// 亮色促销条上的深色文字。用量 5。
  static const Color promoText = Color(0xFF232518);

  // ===========================================================================
  // 描边与分割线
  // ===========================================================================

  /// 列表分割线。用量 10。
  static const Color divider = Color(0xFF2A2A2C);

  /// 常规描边。用量 7。
  static const Color outline = Color(0xFF333333);

  /// 高亮描边。用量 7。
  static const Color outlineBright = Color(0xFF3A3A3A);

  /// 表单描边（iOS 系统灰）。用量 6。
  static const Color outlineField = Color(0xFF3A3A3C);

  /// [outlineField] 的全透明版本，仅作渐变端点。
  static const Color outlineFieldClear = Color(0x003A3A3C);

  // ===========================================================================
  // 文本与图标（中性灰阶，由暗到亮；后缀为十六进制亮度分量）
  // ===========================================================================

  /// 最弱的辅助文字。
  static const Color textGray5A = Color(0xFF5A5A5E);

  /// 禁用态文字。用量 13。
  static const Color textGray66 = Color(0xFF666666);

  /// 三级文字。
  static const Color textTertiary = Color(0xFF6E6E6E);

  /// 弱化文字。用量 4。
  static const Color textGray88 = Color(0xFF888888);

  /// 弱化文字（主用）。用量 17。
  static const Color textGray8A = Color(0xFF8A8A8A);

  /// iOS 系统灰。
  static const Color textGray8E = Color(0xFF8E8E93);

  /// 次要文字 / 占位图标，全项目用量最大的灰。用量 23。
  static const Color textGray99 = Color(0xFF999999);

  /// 二级文字。
  static const Color textSecondary = Color(0xFF9A9A9A);

  /// 二级文字（偏亮）。
  static const Color textGrayA3 = Color(0xFFA3A3A3);

  /// 二级文字（偏亮）。用量 9。
  static const Color textGrayAE = Color(0xFFAEAEAE);

  /// 输入框占位文字 / 禁用按钮文字。用量 18。
  static const Color textGrayB0 = Color(0xFFB0B0B0);

  /// 浅灰文字。
  static const Color textGrayBC = Color(0xFFBCBCBC);

  /// 浅灰文字。
  static const Color textGrayC0 = Color(0xFFC0C0C0);

  /// 浅灰文字。
  static const Color textGrayC8 = Color(0xFFC8C8C8);

  /// 浅灰文字。
  static const Color textGrayC9 = Color(0xFFC9C9C9);

  /// 近白文字。
  static const Color textGrayCF = Color(0xFFCFCFCF);

  /// 近白文字。
  static const Color textGrayD5 = Color(0xFFD5D5D5);

  /// 近白文字。用量 5。
  static const Color textGrayD8 = Color(0xFFD8D8D8);

  /// 近白文字。
  static const Color textGrayE0 = Color(0xFFE0E0E0);

  /// 近白文字（偏蓝）。
  static const Color textGrayE4 = Color(0xFFE4E5E6);

  /// 近白文字。
  static const Color textGrayE5 = Color(0xFFE5E5E5);

  /// 近白文字。用量 7。
  static const Color textGrayE8 = Color(0xFFE8E8E8);

  /// 近白文字。
  static const Color textGrayEA = Color(0xFFEAEAEA);

  /// 近白文字（主用）。用量 18。
  static const Color textGrayF0 = Color(0xFFF0F0F0);

  /// 近白文字。
  static const Color textGrayF2 = Color(0xFFF2F2F2);

  /// 近白文字。
  static const Color textGrayF3 = Color(0xFFF3F3F3);

  /// 近白文字。用量 8。
  static const Color textGrayF5 = Color(0xFFF5F5F5);

  /// 近白文字。
  static const Color textGrayF7 = Color(0xFFF7F7F7);

  /// 一级文字。
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// 会话列表的消息预览（白 70%）。
  static const Color textPreview = Color(0xB3FFFFFF);

  /// 会话列表的时间戳（白 36%）。
  static const Color textTime = Color(0x5CFFFFFF);

  // ===========================================================================
  // 功能色
  // ===========================================================================

  /// 未读红点。
  static const Color badge = Color(0xFFFD4B4B);

  /// 错误提示文字。用量 3。
  static const Color danger = Color(0xFFE44E50);

  /// [danger] 的 40% 透明版本。
  static const Color dangerSoft = Color(0x66E44E50);

  /// 危险操作（iOS 系统红）。
  static const Color dangerBright = Color(0xFFFF3B30);

  /// 偏粉的危险色。
  static const Color dangerPink = Color(0xFFE53955);

  /// 信息蓝。
  static const Color infoBlue = Color(0xFF4F8BFF);

  /// 信息蓝（偏深）。
  static const Color infoBlueBright = Color(0xFF3B82F6);

  /// 链接蓝。
  static const Color linkBlue = Color(0xFF0091FF);

  /// 性别标识：女。用量 3。
  static const Color genderFemale = Color(0xFFFF5BA8);

  /// 性别标识：女（另一处取值）。
  static const Color genderFemaleAlt = Color(0xFFFF4D94);

  /// 警示黄。
  static const Color warningYellow = Color(0xFFFFD400);

  /// 警示黄（琥珀）。
  static const Color warningAmber = Color(0xFFFFD54F);

  /// 警示黄（琥珀，偏亮）。
  static const Color warningAmberSoft = Color(0xFFFFD56A);

  /// 警示黄（金）。
  static const Color warningGold = Color(0xFFFFD84D);

  /// 礼物数量黄。用量 3。
  static const Color giftYellow = Color(0xFFFDF652);

  /// [giftYellow] 的 12% 透明版本。
  static const Color giftYellowSoft = Color(0x1FFDF652);

  /// 金币黄。用量 4。
  static const Color coinYellow = Color(0xFFFFE74F);

  /// 带绿调的白：登录页渐变端点。
  static const Color tintGreenWhite = Color(0xFFE8FFE8);

  // ===========================================================================
  // 等级体系
  // ===========================================================================

  /// 等级徽章渐变起点。
  static const Color levelBadgeStart = Color(0xFF9B6BFF);

  /// 等级徽章渐变终点。
  static const Color levelBadgeEnd = Color(0xFF6B4EFF);

  /// 等级页背景（紫黑）。
  static const Color levelBackground = Color(0xFF0C052A);

  /// 等级页卡片底色。
  static const Color levelPanel = Color(0xFF272048);

  /// 等级页卡片底色（偏亮）。
  static const Color levelPanelLight = Color(0xFF504970);

  /// 等级档位主色 1（最低档）。
  static const Color levelTier1 = Color(0xFF4E566B);

  /// 等级档位主色 2。
  static const Color levelTier2 = Color(0xFF1587F2);

  /// 等级档位主色 3。
  static const Color levelTier3 = Color(0xFF6A39F5);

  /// 等级档位主色 4。
  static const Color levelTier4 = Color(0xFFE97B15);

  /// 等级档位主色 5。
  static const Color levelTier5 = Color(0xFFE7425F);

  /// 等级档位主色 6（最高档）。
  static const Color levelTier6 = Color(0xFFAE1817);

  // ===========================================================================
  // 半透明蒙层与微光
  // ===========================================================================

  /// 全透明，仅作渐变端点。
  static const Color transparent = Color(0x00000000);

  /// 会话行填充（白 8%）。
  static const Color chatsRowFill = Color(0x14FFFFFF);

  /// 白 12% 填充。
  static const Color overlayWhite12 = Color(0x1FFFFFFF);

  /// 黑 20% 蒙层。
  static const Color scrimBlack20 = Color(0x33000000);

  /// 黑 40% 蒙层。用量 2。
  static const Color scrimBlack40 = Color(0x66000000);

  /// 黑 50% 蒙层。
  static const Color scrimBlack50 = Color(0x80000000);

  /// 黑 60% 蒙层。
  static const Color scrimBlack60 = Color(0x99000000);

  /// 黑 80% 蒙层。
  static const Color scrimBlack80 = Color(0xCC000000);

  /// 深灰 50% 蒙层。
  static const Color scrimGray50 = Color(0x80333333);

  /// 居中 Toast 底色（深灰 90%）。用量 4。
  static const Color toastBackground = Color(0xE62A2A2A);

  /// 群详情页的柠檬绿微光。
  static const Color glowLime = Color(0x1FC0F600);

  /// 选中态的绿色微光。用量 2。
  static const Color glowAccentLime = Color(0x3300F875);

  /// 主品牌绿微光。
  static const Color glowPrimary = Color(0x6624B572);

  /// 登录页的蓝色微光。
  static const Color glowLoginBlue = Color(0x55203A8C);

  /// 礼物特效橙色微光。用量 2。
  static const Color glowGiftOrange = Color(0x33FE8F19);

  /// 礼物特效粉色微光。用量 2。
  static const Color glowGiftPink = Color(0x33FC1192);

  // ===========================================================================
  // 渐变
  // ===========================================================================

  /// 品牌文字渐变。
  static const LinearGradient brandTextGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [accentLime, accentMint],
  );

  /// 促销条渐变。
  static const LinearGradient promoBannerGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [accentLime, accentMint],
  );

  /// "我的群组"卡片渐变。
  static const LinearGradient myGroupCardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1A2A22), Color(0xFF0A0C0B)],
  );

  /// 热门群组卡片渐变。
  static const LinearGradient popularCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A221C), Color(0xFF101210)],
  );
}

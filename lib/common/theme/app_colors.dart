import 'package:flutter/material.dart';

/// 全局颜色配置：App 内所有颜色的唯一来源。
///
/// 约定
/// - 页面与组件里不再写 `Color(0x...)` 字面量，一律引用这里的 token。
/// - 不透明色：`{色相}{HEX}`，如 `black2A2A2A`、`green29EEAA`、`gray9A9A9A`。
/// - 纯色 + 透明度：`{色相}{不透明度%}`，如 `black20`、`black50`、`white70`。
/// - 非纯色半透明仍用完整 8 位 ARGB，如 `blackE62A2A2A`、`green3300F875`。
/// - 新增颜色先看同组里有没有肉眼分不出的一档，有就复用，不要再抄一个近值。
abstract final class AppColors {
  static Color rgba(int r, int g, int b, double opacity) {
    return Color.fromRGBO(r, g, b, opacity);
  }
  // ===========================================================================
  // 黑 / 深色底
  // ===========================================================================

  /// 全局页面底色。
  static const Color black = Color(0xFF000000);
  static const Color black0F0F0F = Color(0xFF0F0F0F);

  /// 卡片、气泡、引导页底。
  static const Color black111111 = Color(0xFF111111);

  /// 底部弹窗、输入条、亮底上的深色字。
  static const Color black1C1C1E = Color(0xFF1C1C1E);

  static const Color black111DE5 = Color.fromRGBO(17, 17, 29, 1);

  /// 标签、胶囊、表单字段、分割线。
  static const Color black2A2A2A = Color(0xFF2A2A2A);

  /// 黑 20% 蒙层。
  static const Color black20 = Color(0x33000000);

  /// 顶栏 / 公告半透明底。
  static const Color black30 = Color(0x4D000000);

  /// 底部输入条胶囊。
  static const Color black35 = Color(0x59000000);

  /// 黑 40% 蒙层。
  static const Color black40 = Color(0x66000000);

  /// 公屏文字气泡。
  static const Color black45 = Color(0x73000000);

  /// 黑 50% 蒙层。
  static const Color black50 = Color(0x80000000);

  /// 黑 60% 蒙层。
  static const Color black60 = Color(0x99000000);

  /// 黑 80% 蒙层。
  static const Color black80 = Color(0xCC000000);

  /// 居中 Toast 底色（深灰 90%）。
  static const Color blackE62A2A2A = Color(0xE62A2A2A);

  /// 黑 1F2518。房间文字颜色。
  static const Color black1F2518 = Color(0xff1F2518);

  // ===========================================================================
  // 灰
  // ===========================================================================

  /// 描边、公告正文、中灰边。
  static const Color gray333333 = Color(0xFF333333);

  /// [gray333333] 的全透明版本，仅作渐变端点。
  static const Color gray00333333 = Color(0x00333333);

  /// 等级档位主色 1（最低档）。
  static const Color gray4E566B = Color(0xFF4E566B);

  /// 最弱的辅助文字、细描边。
  static const Color gray5A5A5E = Color(0xFF5A5A5E);

  /// 三级文字、禁用态。
  static const Color gray6E6E6E = Color(0xFF6E6E6E);

  /// 深灰 50% 蒙层。
  static const Color gray80333333 = Color(0x80333333);

  /// 弱化文字、房间输入提示。
  static const Color gray8A8A8A = Color(0xFF8A8A8A);

  /// 二级文字、占位图标。
  static const Color gray9A9A9A = Color(0xFF9A9A9A);

  /// 输入框占位、禁用按钮文字。
  static const Color grayB0B0B0 = Color(0xFFB0B0B0);

  /// 浅灰文字。
  static const Color grayC8C8C8 = Color(0xFFC8C8C8);

  /// 更浅的灰字。
  static const Color grayD5D5D5 = Color(0xFFD5D5D5);

  /// 近白文字、禁用按钮底。
  static const Color grayE8E8E8 = Color(0xFFE8E8E8);

  /// 近白文字、浅底输入区。
  static const Color grayF0F0F0 = Color(0xFFF0F0F0);

  // ===========================================================================
  // 白
  // ===========================================================================

  /// 一级文字。
  static const Color white = Color(0xFFFFFFFF);

  /// 会话行填充（白 8%）。
  static const Color white8 = Color(0x14FFFFFF);

  /// 白 10%。
  static const Color white10 = Color(0x1AFFFFFF);

  /// 白 12% 填充。
  static const Color white12 = Color(0x1FFFFFFF);

  /// 空麦位圆底。
  static const Color white18 = Color(0x2EFFFFFF);

  /// 文字身份标底。
  static const Color white20 = Color(0x33FFFFFF);

  /// 白 30%。空麦位座号等。
  static const Color white30 = Color(0x4DFFFFFF);

  /// 会话列表的时间戳（白 36%）。
  static const Color white36 = Color(0x5CFFFFFF);

  /// 歌词当前行以外的字（白 50%）。
  static const Color white50 = Color(0x80FFFFFF);

  /// 房间 ID、次要字。
  static const Color white60 = Color(0x99FFFFFF);

  /// 会话列表的消息预览（白 70%）。
  static const Color white70 = Color(0xB3FFFFFF);

  // ===========================================================================
  // 绿
  // ===========================================================================

  /// 渐变端点：薄荷绿。
  static const Color green00FEA8 = Color(0xFF00FEA8);

  /// 渐变端点：亮柠檬绿。
  static const Color green00F875 = Color(0xFF00F875);

  /// 青绿：群成员昵称。
  static const Color green00D68F = Color(0xFF00D68F);

  /// 深绿胶囊、资料卡绿色上沿。
  static const Color green1A3A28 = Color(0xFF1A3A28);

  /// 主品牌绿。按钮、选中态、强调。
  static const Color green1BBA77 = Color(0xFF1BBA77);

  /// 霓虹绿：礼物面板、调试页、好友筛选选中态。
  static const Color green1CFF8A = Color(0xFF1CFF8A);

  /// 群详情页的柠檬绿微光。
  static const Color green1FC0F600 = Color(0x1FC0F600);

  /// 主题绿。进房安全提示、房间主强调。
  static const Color green29EEAA = Color(0xFF29EEAA);

  /// 橄榄调选中态底色。
  static const Color green2E2E16 = Color(0xFF2E2E16);

  /// 选中态的绿色微光。
  static const Color green3300F875 = Color(0x3300F875);

  /// 主品牌绿微光。
  static const Color green6624B572 = Color(0x6624B572);

  /// 亮黄绿：部落推荐页强调文案。
  static const Color greenB6FF2E = Color(0xFFB6FF2E);

  /// 柔和黄绿：聊天里"自己"的标识色。
  static const Color greenB8FF6A = Color(0xFFB8FF6A);

  /// 暗调黄绿。
  static const Color greenC7EF4C = Color(0xFFC7EF4C);

  /// 进房提示底。
  static const Color greenCC12382C = Color(0xCC12382C);

  /// 带绿调的白：登录页渐变端点。
  static const Color greenE8FFE8 = Color(0xFFE8FFE8);

  // ===========================================================================
  // 红 / 粉
  // ===========================================================================

  /// 等级档位主色 6（最高档）。
  static const Color redAE1817 = Color(0xFFAE1817);

  /// 错误提示文字。
  static const Color redE44E50 = Color(0xFFE44E50);

  /// 偏粉的危险色。
  static const Color redE53955 = Color(0xFFE53955);

  /// 等级档位主色 5。
  static const Color redE7425F = Color(0xFFE7425F);

  /// 未读红点。
  static const Color redFD4B4B = Color(0xFFFD4B4B);

  /// 麦位热度爱心。
  static const Color redFF4B8B = Color(0xFFFF4B8B);

  /// 危险操作（iOS 系统红）。
  static const Color redFF3B30 = Color(0xFFFF3B30);

  /// [redE44E50] 的 40% 透明版本。
  static const Color red66E44E50 = Color(0x66E44E50);

  /// 性别标识：女。
  static const Color pinkFF5BA8 = Color(0xFFFF5BA8);

  /// 开麦说话时头像背后的波纹。
  static const Color pinkFC5CC6 = Color(0xFFFC5CC6);

  /// 礼物特效粉色微光。
  static const Color pink33FC1192 = Color(0x33FC1192);

  // ===========================================================================
  // 蓝
  // ===========================================================================

  /// 链接蓝。
  static const Color blue0091FF = Color(0xFF0091FF);

  /// 资料卡 Gift Wall 渐变起点。
  static const Color blue0056FF = Color(0xFF0056FF);

  /// 等级档位主色 2。
  static const Color blue1587F2 = Color(0xFF1587F2);

  /// 信息蓝。
  static const Color blue4F8BFF = Color(0xFF4F8BFF);

  /// 登录页的蓝色微光。
  static const Color blue55203A8C = Color(0x55203A8C);

  /// giftRank 第 2 名王冠 / 描边。
  static const Color cyan67D6F6 = Color(0xFF67D6F6);

  // ===========================================================================
  // 黄 / 金
  // ===========================================================================

  /// [yellowFDF652] 的 12% 透明版本。
  static const Color yellow1FFDF652 = Color(0x1FFDF652);

  /// 宠物标签底（黄 16%）。
  static const Color yellow29FDF652 = Color(0x29FDF652);

  /// 冠名头像描边。
  static const Color yellowD9CE7C = Color(0xFFD9CE7C);

  /// 进房公屏昵称。
  static const Color yellowFDE42B = Color(0xFFFDE42B);

  /// 礼物数量黄、冠名昵称。
  static const Color yellowFDF652 = Color(0xFFFDF652);

  /// 警示黄。礼物名、收礼人、排行高亮。
  static const Color yellowFFD400 = Color(0xFFFFD400);

  /// 警示琥珀。
  static const Color yellowFFD54F = Color(0xFFFFD54F);

  /// 金币黄、心动锁定字。
  static const Color yellowFFE74F = Color(0xFFFFE74F);

  /// 老板位金圈。
  static const Color yellowFFC83D = Color(0xFFFFC83D);

  /// 冠名公屏昵称（Oumi NamedRoomBanner）。
  static const Color yellowFFFC52 = Color(0xFFFFFC52);

  /// 礼物数量强调色。
  static const Color yellowFFFC80 = Color(0xFFFFFC80);

  /// 聊天房间邀请卡片底色（Cosmic Lounge）。
  static const Color yellowFFF9C4 = Color(0xFFFFF9C4);

  /// 聊天房间邀请卡片描边。
  static const Color yellowFDE08D = Color(0xFFFDE08D);

  // ===========================================================================
  // 橙
  // ===========================================================================

  /// 礼物特效橙色微光。
  static const Color orange33FE8F19 = Color(0x33FE8F19);

  /// 等级档位主色 4。
  static const Color orangeE97B15 = Color(0xFFE97B15);

  /// giftRank 第 3 名王冠 / 描边。
  static const Color orangeDC9260 = Color(0xFFDC9260);

  // ===========================================================================
  // 紫
  // ===========================================================================

  /// 等级页背景（紫黑）。
  static const Color purple0C052A = Color(0xFF0C052A);

  /// 房间页底色。没有背景图时用。
  static const Color purple14081F = Color(0xFF14081F);

  /// 活动分享图标底终点。
  static const Color purple27115C = Color(0xFF27115C);

  /// 等级页卡片底色。
  static const Color purple272048 = Color(0xFF272048);

  /// 活动分享气泡终点。
  static const Color purple2E6922FF = Color(0x2E6922FF);

  /// 活动分享气泡。
  static const Color purple2EFF41FF = Color(0x2EFF41FF);

  /// 等级页卡片底色（偏亮）。
  static const Color purple504970 = Color(0xFF504970);

  /// 活动分享图标底。
  static const Color purple5128AE = Color(0xFF5128AE);

  /// 等级徽章渐变终点。
  static const Color purple6B4EFF = Color(0xFF6B4EFF);

  /// 等级档位主色 3。
  static const Color purple6A39F5 = Color(0xFF6A39F5);

  /// 心动卡片角标终点。
  static const Color purple7713FC = Color(0xFF7713FC);

  static const Color purple8905D2 = Color(0xFF8905D2);

  /// 歌词卡片下沿。
  static const Color purple994724A5 = Color(0x994724A5);

  /// 歌词卡片上沿。
  static const Color purple995B30D3 = Color(0x995B30D3);

  /// 等级徽章渐变起点。
  static const Color purple9B6BFF = Color(0xFF9B6BFF);

  /// 房间顶栏胶囊。
  static const Color purpleA61C1C38 = Color(0xA61C1C38);

  /// 资料卡 Gift Wall 渐变终点。
  static const Color purpleA510FF = Color(0xFFA510FF);

  /// 心动卡片角标。
  static const Color purpleBF3AFC = Color(0xFFBF3AFC);

  /// Oumi 进房条渐变起点。
  static const Color purpleDF27FE = Color(0xFFDF27FE);

  /// Oumi 进房条渐变终点。
  static const Color purpleE6880EFF = Color(0xE6880EFF);

  // ===========================================================================
  // 其它（无法归入单色相的）
  // ===========================================================================

  /// 全透明，仅作渐变端点。
  static const Color transparent = Color(0x00000000);

  /// 礼物航道底。
  static const Color roomBubble = Color.fromRGBO(223, 214, 255, 0.09);

  // ===========================================================================
  // 渐变
  // ===========================================================================

  /// 品牌文字渐变。
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [green00F875, green00FEA8],
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

  /// 推荐房间卡片。
  static const LinearGradient roomCardBanner = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF537BFE), Color(0xFF666FF4), Color(0xFF9A4BE6)],
  );

  /// 心动卡片角标渐变。
  static const LinearGradient roomHeartBadge = LinearGradient(colors: [purpleBF3AFC, purple7713FC]);

  /// 拍卖「Place Bid」按钮。
  static const LinearGradient auctionBidGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [pinkFC5CC6, purpleBF3AFC, purple9B6BFF],
  );

  /// 拍卖开拍价 / Host 角标。
  static const LinearGradient auctionTagGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [pinkFF5BA8, purpleBF3AFC],
  );

  static const LinearGradient cpGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xff5912EF), Color(0xffF911F9)],
  );

  /// 拍卖台座光晕。
  static const Color auctionStageGlow = Color(0x664B2ADB);

  /// 拍卖出价榜描边：金 / 银 / 铜。
  static const Color auctionRankGold = Color(0xFFFFE35A);
  static const Color auctionRankSilver = Color(0xFFB9BFD4);
  static const Color auctionRankBronze = Color(0xFFEEC0A4);

  /// 拍卖艺人贡献 pill。
  static const LinearGradient auctionActorScore = LinearGradient(
    colors: [Color(0xFFFC5CC6), Color(0xFFFC475F)],
  );

  /// 拍卖 Boss 贡献 pill。
  static const LinearGradient auctionBossScore = LinearGradient(
    colors: [Color(0xFF00ECFC), Color(0xFF0047FD)],
  );

  /// 拍卖出价金额 pill。
  static const LinearGradient auctionBidAmount = LinearGradient(
    colors: [Color(0xFF97087F), Color(0xFF3203CA)],
  );

  /// 活动分享气泡渐变。
  static const LinearGradient roomActivityFill = LinearGradient(
    colors: [purple2EFF41FF, purple2E6922FF],
  );

  /// 活动分享图标底渐变。
  static const LinearGradient roomActivityIcon = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [purple5128AE, purple27115C],
  );

  /// 冠名标题渐变。
  static const LinearGradient roomNamedTitle = LinearGradient(
    colors: [
      Color(0xFFE050F2),
      Color(0xFFEC1CDD),
      Color(0xFFF62BC1),
      Color(0xFFFC8A90),
      Color(0xFFFDBB83),
      Color(0xFFD9F578),
      Color(0xFF7CFD86),
      Color(0xFF4AFCBC),
    ],
  );

  /// Oumi 进房条渐变。
  static const LinearGradient roomJoinBanner = LinearGradient(
    colors: [purpleDF27FE, purpleE6880EFF],
  );

  /// 盖在房间背景上，保证顶栏和底栏能读清。
  static const LinearGradient roomBackdropScrim = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x6614081F), Color(0x0014081F), Color(0xCC14081F)],
    stops: [0, 0.35, 1],
  );

  /// 歌词卡片渐变。
  static const LinearGradient roomLyricGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [purple995B30D3, purple994724A5],
  );

  /// 座驾进场横幅。等级未知时用 B 档。
  static LinearGradient roomCarGradient(String level) {
    switch (level) {
      case 'SSS':
        return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF6B4E16), Color(0xFFD4AF37)],
        );
      case 'SS':
        return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF3A2060), Color(0xFF7A4CC2)],
        );
      case 'S':
        return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF163A6B), Color(0xFF3D8BFF)],
        );
      case 'A':
        return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF0E4A45), Color(0xFF2ED3C6)],
        );
      default:
        return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF2A3140), Color(0xFF66758A)],
        );
    }
  }
}

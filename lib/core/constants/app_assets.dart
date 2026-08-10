/// 本地图片路径集中管理。请勿硬编码 `assets/images/...`，统一使用这些常量。
abstract final class AppAssets {
  static const String _forya = 'assets/images/forya';

  // ---------- 品牌 / 共用 ----------
  static const String logo = '$_forya/logo.webp';
  static const String iconLogo = '$_forya/logo_title.webp';
  static const String oumiTitle = '$_forya/title_logo.webp';
  static const String oumiIcon = logo;
  static const String avatarPlace = '$_forya/man_img.webp';
  static const String emptyAvatar = '$_forya/woman_img.webp';
  static const String defaultAvatar = avatarPlace;
  static const String cameraIcon = '$_forya/input_img.webp';
  static const String backArrow = '$_forya/back_arrow.svg';
  static const String closeCircle = '$_forya/lock.svg';
  static const String lockIcon = '$_forya/lock.svg';
  static const String halfRightArrow = '$_forya/half_right_arrow.svg';
  static const String triangleUp = '$_forya/triangle_up.svg';
  static const String triangleDown = '$_forya/triangle_down.svg';
  static const String triangleRight = '$_forya/triangle_right.svg';

  // 录音
  static const String recordBg = '$_forya/bottom_bg.webp';

  /// 录音按钮：空闲 / 录音中麦克风。
  static const String audioRecordIcon = '$_forya/yuyin.png';

  /// 录音按钮：预览播放波形。
  static const String audioPlayingIcon = '$_forya/Group 145.png';

  /// 录音预览：重试 / 确认。
  static const String audioRefreshIcon = '$_forya/Retry.png';
  static const String audioFinishIcon = '$_forya/Affirm.png';
  static const String audioPlayIcon = audioPlayingIcon;
  static const String audioWaveLine = '$_forya/Vector 272.png';
  static const String audioWaveAnim = '$_forya/Group 145.png';

  /// 资料页语音条：静态波形。
  static const String voiceWaveLine = '$_forya/ic_voice_line.svg';
  /// 资料页语音条：播放中的动态波形（原始 webp）。
  static const String voiceWaveAnim = '$_forya/anim_line_voice.webp';
  static const String voicePlayIcon = '$_forya/ic_play.svg';
  static const String voicePauseIcon = '$_forya/ic_pause.svg';
  static const String voiceDeleteIcon = '$_forya/delete_icon.webp';

  /// 启动页：角色 Logo / 白色 Chimo 标题 / 底部 Slogan。
  static const String splashLogo = logo;
  static const String splashTitle = '$_forya/title_logo.webp';
  static const String splashSlogan = '$_forya/launch_title.webp';

  /// 注册后欢迎页：绿色 Chimo 字标。
  static const String brandTitleLogo = iconLogo;

  /// 启动页 / 登录背景与登录按钮图标。
  static const String launchBg = '$_forya/launch_bg.webp';
  static const String loginBg = '$_forya/login_bg.webp';
  static const String appleIcon = '$_forya/apple_icon.webp';
  static const String emailIcon = '$_forya/email_icon.webp';
  static const String agreeChecked = '$_forya/item_select.webp';
  static const String agreeUnchecked = '$_forya/item_unselect.webp';
  static const String agreeCheckedBlack = '$_forya/item_select_black.webp';
  static const String agreeUncheckedBlack = '$_forya/item_unselect_black.webp';

  // ---------- 首页 ----------
  /// 首页顶栏光晕背景。
  static const String homeTopBg = '$_forya/home_top_img.webp';

  /// 首页 Chimo 标题 Logo（约 91×28）。
  static const String homeTitle = '$_forya/home_title.webp';

  /// 首页搜索按钮（圆角底，36×36）。
  static const String homeSearchBtn = '$_forya/home_search.webp';

  /// 首页群组卡片背景（Popular Groups 等）。
  static const String homeRoomBg = '$_forya/home_room_bg.webp';

  /// 「我的群组」横向卡片背景。
  static const String homeMyGroupBg = '$_forya/home_item_bg.webp';

  /// 群组成员数图标。
  static const String homePerson = '$_forya/home_person.webp';

  /// 群组照片/帖子数图标。
  static const String homeImg = '$_forya/home_img.webp';

  /// 首页群组列表：未加入（绿色 +）/ 已加入（灰色勾）。
  static const String homeJoin = '$_forya/home_plus.webp';
  static const String homeJoined = '$_forya/home_select.webp';

  /// 未加入群组：Photos 锁定空态插图。
  static const String groupUnjoinedLock = '$_forya/unjoin.webp';

  /// 会话列表：群组名旁的标签。
  static const String chatGroupTag = '$_forya/group_tag.webp';

  /// 群组贵族等级徽章（V1–V6）。
  static String groupLevel(int level) {
    final clamped = level.clamp(1, 6);
    return '$_forya/group_level_$clamped.webp';
  }

  static const String homeSearch = homeSearchBtn;
  static const String homeHot = homeJoined;

  /// 首页 Banner 轮播（设计稿 343×100）。
  static const List<String> homeBanners = [homeRoomBg, launchBg];

  /// 部落 / 群组条目背景。
  static const String tribesItemBg = '$_forya/tribes_item_bg.webp';

  // ---------- 我的 ----------
  static const String mineBg = '$_forya/mine_bg.webp';

  /// 气泡角色顶部背景（已去掉深色填充；弧线在代码中绘制）。
  static const String mineBgTop = '$_forya/mine_bg_top.webp';

  /// 钱包 / 等级完整卡片（背景 + 3D 图标）。
  static const String mineWalletCard = '$_forya/mine_wallet.webp';
  static const String mineLevelCard = '$_forya/mine_level.webp';

  /// 仅钱包 / 等级图标（无卡片底）。
  static const String mineWalletIcon = '$_forya/mine_wallet_icon.webp';
  static const String mineLevelIconAsset = '$_forya/mine_level_icon.webp';

  /// 金币图标 / 钱包页背景。
  static const String coin = '$_forya/coin.webp';
  static const String walletBg = '$_forya/wallet_bg.webp';
  static const String walletTopBg = '$_forya/wallet_top_bg.webp';

  static const String mineWalletBg = mineWalletCard;
  static const String mineWalletCoin = coin;
  static const String mineBalance = coin;
  static const String mineLevelIcon = mineLevelIconAsset;
  static const String mineItemBg = homeMyGroupBg;
  static const String mineCopy = '$_forya/copy.svg';
  static const String mineArrow = '$_forya/arrow_right.svg';
  static const String mineInfo = '$_forya/mine_info.webp';
  static const String mineBind = '$_forya/mine_bind.webp';
  static const String mineHelp = '$_forya/mine_help.webp';
  static const String mineSetting = '$_forya/mine_setting.webp';
  static const String mineAbout = '$_forya/mine_about.webp';

  /// 「关于我们」页 Logo。
  static const String aboutLogo = '$_forya/about_logo.webp';

  /// 个人资料页顶部背景。
  static const String personalBg = '$_forya/personal_bg.webp';
  static const String infoBg = '$_forya/info_bg.webp';
  static const String protocolBg = '$_forya/protocol_bg.webp';

  /// 等级页（forya MineLevelPage 远程资源）。
  static const String levelBg = '$_forya/level_page_bg.webp';
  static const String levelPrivilegeAccent = '$_forya/level_page_tag.webp';
  static const String levelPrivilegeBadge = '$_forya/level_page_icon_1.webp';
  static const String levelPrivilegeAssist = '$_forya/level_page_icon_2.webp';
  /// 按 forya `levelIndex` 取卡片 / 主徽章（0–5 → 文件 1–6）。
  static String levelCardBg(int levelIndex) =>
      '$_forya/level_bg_${levelIndex.clamp(0, 5) + 1}.webp';
  static String levelBadgeHero(int levelIndex) =>
      '$_forya/level_bg_icon_${levelIndex.clamp(0, 5) + 1}.webp';

  // ---------- 消息 / 聊天 ----------
  static const String msgBg = homeTopBg;
  static const String msgEmpty = '$_forya/empty_no_msg.webp';
  static const String msgContacts = '$_forya/chats_contacts.svg';
  static const String msgSearch = '$_forya/chats_search.svg';

  /// 好友 / 关注空态插图。
  static const String friendsEmpty = '$_forya/empty_no_data.webp';
  static const String emptyNoSearch = '$_forya/empty_no_search.webp';
  static const String emptyNoWifi = '$_forya/empty_no_wifi.webp';

  /// 会话 / 群组导航栏「更多」（⋯）。
  static const String msgMore = '$_forya/chat_dm_more.svg';

  /// 性别徽章图标。
  static const String genderMan = '$_forya/man.webp';
  static const String genderWoman = '$_forya/woman.webp';

  /// 聊天资料卡标签（身高 / 体重）。
  static const String tagHeight = '$_forya/ic_height.svg';
  static const String tagWeight = '$_forya/ic_weight.svg';

  /// 资料设置：性别卡片（未选 / 已选）。
  static const String genderMaleImg = '$_forya/man_img.webp';
  static const String genderFemaleImg = '$_forya/woman_img.webp';
  static const String genderMaleSelected = '$_forya/man_select.webp';
  static const String genderFemaleSelected = '$_forya/woman_select.webp';

  /// 旧版全幅推广图（保留作回退）。
  static const String msgPromo = '$_forya/home_tips.webp';
  static const String msgPromoAlt = launchBg;

  /// 会话页推广 Banner 插图（Figma 39:428）。
  static const String msgPromoHand = '$_forya/chats_promo_hand.png';
  static const String msgPromoHi = '$_forya/chats_promo_hi.png';
  static const String msgPromoClose = '$_forya/chats_promo_close.svg';

  /// 会话标题下的曲线装饰。
  static const String chatTitleTips = '$_forya/chats_title_underline.svg';

  /// 标题旁的官方认证勾。
  static const String chatVerified = '$_forya/chats_verified.svg';

  /// 标题旁的 Soulmate 手写徽章。
  static const String chatSoulmate = '$_forya/chats_soulmate.svg';

  /// 会话列表左滑「置顶」/「取消置顶」/「删除」（36 圆形资源）。
  static const String msgPin = '$_forya/chats_swipe_pin.svg';
  static const String msgUnpin = '$_forya/unpin.webp';
  static const String msgSwipeDelete = '$_forya/chats_swipe_delete.svg';

  /// 通用删除图标（位图；用于左滑操作以外的场景）。
  static const String msgDelete = '$_forya/delete_icon.webp';

  /// 聊天详情 / 全局返回图标。
  static const String chatBack = '$_forya/half_back.svg';

  /// 私聊详情返回（Figma 55:274）。
  static const String chatDmBack = '$_forya/chat_dm_back.svg';

  /// 导航栏私聊更多（⋯）。
  static const String chatDmMore = '$_forya/chat_dm_more.svg';

  /// 聊天输入栏：语音 / 图片 / 表情 / 礼物 / Wish（私聊 Figma）。
  static const String inputVoice = '$_forya/input_voice.webp';
  static const String inputImage = '$_forya/input_img.webp';

  /// 旧版表情（群聊 / 非私聊）；私聊使用 [chatDmEmoji]。
  static const String inputEmoji = '$_forya/input_emoji.webp';
  static const String chatDmEmoji = '$_forya/chat_dm_emoji.svg';
  static const String chatVoice = '$_forya/chat_dm_tool_voice.svg';
  static const String chatImg = '$_forya/chat_dm_tool_img.svg';
  static const String chatGift = '$_forya/chat_dm_tool_gift.png';
  static const String chatWish = '$_forya/chat_dm_tool_wish.svg';

  /// 资料页礼物按钮（优先使用专用资源）。
  static const String giftIcon = '$_forya/chat_gift.webp';

  /// 举报 / 系统消息图标。
  static const String reportIcon = '$_forya/report_icon.webp';
  static const String sysIcon = '$_forya/sys_icon.webp';

  // ---------- 底部 Tab ----------
  static const String tabHome = '$_forya/tab_room.webp';
  static const String tabHomeSelected = '$_forya/tab_room_select.webp';
  static const String tabChats = '$_forya/tab_msg.webp';
  static const String tabChatsSelected = '$_forya/tab_msg_select.webp';
  static const String tabMe = '$_forya/tab_mine.webp';
  static const String tabMeSelected = '$_forya/tab_mine_select.webp';

  /// 资源是否为 SVG。
  static bool isSvg(String asset) => asset.toLowerCase().endsWith('.svg');
}

/// 统一本地图片路径。业务侧禁止硬编码 `assets/images/...`，一律走本类常量。
abstract final class AppAssets {
  static const String _forya = 'assets/images/forya';

  // ---------- 品牌 / 通用 ----------
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

  // 录音相关
  static const String recordBg = '$_forya/bottom_bg.webp';
  /// 录音主按钮：空闲/录制中麦克风。
  static const String audioRecordIcon = '$_forya/yuyin.png';
  /// 录音主按钮：预览播放波形。
  static const String audioPlayingIcon = '$_forya/Group 145.png';
  /// 录音预览：重试 / 确定。
  static const String audioRefreshIcon = '$_forya/Retry.png';
  static const String audioFinishIcon = '$_forya/Affirm.png';
  static const String audioPlayIcon = audioPlayingIcon;
  static const String audioWaveLine = '$_forya/Vector 272.png';
  static const String audioWaveAnim = '$_forya/Group 145.png';
  /// 个人主页语音条：静态波形。
  static const String voiceWaveLine = '$_forya/ic_voice_line.svg';
  static const String voiceDeleteIcon = '$_forya/delete_icon.webp';

  /// 启动页：角色 Logo / 白色 Chimo 标题 / 底部 slogan。
  static const String splashLogo = logo;
  static const String splashTitle = '$_forya/title_logo.webp';
  static const String splashSlogan = '$_forya/launch_title.webp';

  /// 注册完成欢迎页：绿色 Chimo 字标。
  static const String brandTitleLogo = iconLogo;

  /// 启动 / 登录页背景与登录按钮图标。
  static const String launchBg = '$_forya/launch_bg.webp';
  static const String loginBg = '$_forya/login_bg.webp';
  static const String appleIcon = '$_forya/apple_icon.webp';
  static const String emailIcon = '$_forya/email_icon.webp';
  static const String agreeChecked = '$_forya/item_select.webp';
  static const String agreeUnchecked = '$_forya/item_unselect.webp';
  static const String agreeCheckedBlack = '$_forya/item_select_black.webp';
  static const String agreeUncheckedBlack = '$_forya/item_unselect_black.webp';

  // ---------- 首页 ----------
  /// 首页顶栏背景光效。
  static const String homeTopBg = '$_forya/home_top_img.webp';

  /// 首页 Chimo 标题 Logo（约 91×28）。
  static const String homeTitle = '$_forya/home_title.webp';

  /// 首页搜索按钮（含圆角底，36×36）。
  static const String homeSearchBtn = '$_forya/home_search.webp';

  /// 首页小组卡片背景（Popular Groups 等）。
  static const String homeRoomBg = '$_forya/home_room_bg.webp';

  /// 「我的小组」横向卡片背景。
  static const String homeMyGroupBg = '$_forya/home_item_bg.webp';

  /// 小组成员数图标。
  static const String homePerson = '$_forya/home_person.webp';

  /// 小组图片/帖子数图标。
  static const String homeImg = '$_forya/home_img.webp';

  /// 首页小组列表：未加入（绿色 +）/ 已加入（灰色勾）。
  static const String homeJoin = '$_forya/home_plus.webp';
  static const String homeJoined = '$_forya/home_select.webp';

  /// 群组未加入：Photos 锁定空态插画。
  static const String groupUnjoinedLock = '$_forya/unjoin.webp';

  /// 消息列表：Group 名称旁标签。
  static const String chatGroupTag = '$_forya/group_tag.webp';

  /// 小组贵族等级标识（V1–V6）。
  static String groupLevel(int level) {
    final clamped = level.clamp(1, 6);
    return '$_forya/group_level_$clamped.webp';
  }

  static const String homeSearch = homeSearchBtn;
  static const String homeHot = homeJoined;

  /// 首页 Banner 轮播图（设计稿 343×100）。
  static const List<String> homeBanners = [homeRoomBg, launchBg];

  /// 部落/小组项背景。
  static const String tribesItemBg = '$_forya/tribes_item_bg.webp';

  // ---------- 个人中心 ----------
  static const String mineBg = '$_forya/mine_bg.webp';

  /// 仅气泡角色的顶部背景（去掉资源自带深色底，弧线改由代码绘制）。
  static const String mineBgTop = '$_forya/mine_bg_top.webp';

  /// Wallet / Level 整卡（背景与 3D 图标一体）。
  static const String mineWalletCard = '$_forya/mine_wallet.webp';
  static const String mineLevelCard = '$_forya/mine_level.webp';

  /// Wallet / Level 仅图标（无卡片底色）。
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

  /// About Us 页 Logo。
  static const String aboutLogo = '$_forya/about_logo.webp';

  /// 个人主页顶部背景。
  static const String personalBg = '$_forya/personal_bg.webp';
  static const String infoBg = '$_forya/info_bg.webp';
  static const String protocolBg = '$_forya/protocol_bg.webp';

  /// 等级页：背景 / 当前等级卡底 / 等级徽章 / 特权图标。
  static const String levelBg = '$_forya/Level_bg.webp';
  static const String levelCardBg = '$_forya/Group 5642.png';
  static const String levelBadgeHero = '$_forya/Mask group.png';
  static const String levelPrivilegeAccent = '$_forya/Mask group-2.png';
  static const String levelPrivilegeBadge = mineLevelIconAsset;
  static const String levelPrivilegeAssist = '$_forya/Mask group-2.png';
  static const String levelPrivilegeCar = '$_forya/Mask group-5.png';
  static const String levelMask1 = '$_forya/Mask group-1.png';
  static const String levelMask3 = '$_forya/Mask group-3.png';
  static const String levelMask4 = '$_forya/Mask group-4.png';
  static const String levelGroup5643 = '$_forya/Group 5643.png';
  static const String levelGroup5644 = '$_forya/Group 5644.png';
  static const String levelGroup5645 = '$_forya/Group 5645.png';
  static const String levelGroup5646 = '$_forya/Group 5646.png';
  static const String levelGroup5647 = '$_forya/Group 5647.png';

  // ---------- 消息 / 聊天 ----------
  static const String msgBg = homeTopBg;
  static const String msgEmpty = '$_forya/empty_no_msg.webp';
  static const String msgContacts = '$_forya/home_address.webp';
  static const String msgSearch = homeSearchBtn;

  /// 好友 / 关注空状态插画。
  static const String friendsEmpty = '$_forya/empty_no_data.webp';
  static const String emptyNoSearch = '$_forya/empty_no_search.webp';
  static const String emptyNoWifi = '$_forya/empty_no_wifi.webp';

  /// 消息顶栏更多。
  static const String msgMore = homeSearchBtn;

  /// 性别角标。
  static const String genderMan = '$_forya/man.webp';
  static const String genderWoman = '$_forya/woman.webp';

  /// 完善资料页：性别卡片（未选 / 已选）。
  static const String genderMaleImg = '$_forya/man_img.webp';
  static const String genderFemaleImg = '$_forya/woman_img.webp';
  static const String genderMaleSelected = '$_forya/man_select.webp';
  static const String genderFemaleSelected = '$_forya/woman_select.webp';

  /// 消息列表顶部引导图（含关闭按钮视觉）。
  static const String msgPromo = '$_forya/home_tips.webp';
  static const String msgPromoAlt = launchBg;

  /// 消息页顶栏标题「Chats」下方曲线装饰。
  static const String chatTitleTips = '$_forya/chat_tips.webp';

  /// 消息列表左滑「置顶」图标。
  static const String msgPin = '$_forya/pin.webp';

  /// 消息列表左滑「取消置顶」图标。
  static const String msgUnpin = '$_forya/unpin.webp';

  /// 消息列表左滑「删除」图标。
  static const String msgDelete = '$_forya/delete_icon.webp';

  /// 聊天详情页返回图标。
  static const String chatBack = '$_forya/half_back.svg';

  /// 聊天输入栏：语音 / 图片 / 表情 / 礼物 / Wish。
  static const String inputVoice = '$_forya/input_voice.webp';
  static const String inputImage = '$_forya/input_img.webp';
  static const String inputEmoji = '$_forya/input_emoji.webp';
  static const String chatVoice = '$_forya/chat_voice.webp';
  static const String chatImg = '$_forya/chat_img.webp';
  static const String chatGift = '$_forya/chat_gift.webp';
  static const String chatWish = '$_forya/chat_wish.webp';

  /// 资料页 Gift 按钮（与聊天礼物同资源）。
  static const String giftIcon = chatGift;

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

  /// 是否为 SVG 资源。
  static bool isSvg(String asset) => asset.toLowerCase().endsWith('.svg');
}

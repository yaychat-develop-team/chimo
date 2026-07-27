/// 统一资源路径：对接 `assets/images/oumi/` 设计资源包。
abstract final class AppAssets {
  // ---------- 品牌 / 通用 ----------
  static const String logo = 'assets/images/oumi/logo.webp';
  static const String iconLogo = 'assets/images/oumi/icon_logo.webp';
  static const String oumiTitle = 'assets/images/oumi/home/oumi_title.webp';
  static const String oumiIcon = 'assets/images/oumi/home/oumi_icon.webp';
  static const String avatarPlace = 'assets/images/oumi/avatar_place.webp';
  static const String emptyAvatar = 'assets/images/oumi/mine/empty_avatar.webp';
  static const String defaultAvatar =
      'assets/images/oumi/contact_avatar_default.webp';
  static const String cameraIcon = 'assets/images/oumi/camera.webp';
  static const String backArrow = 'assets/images/forya/back_arrow.svg';
  static const String closeCircle = 'assets/images/oumi/close_circle.svg';
  static const String recordBg = 'assets/images/oumi/record_bg.webp';
  static const String audioRecordIcon = 'assets/images/oumi/ic_audio_record.svg';
  static const String audioPlayingIcon = 'assets/images/oumi/ic_audio_playing.svg';
  static const String audioRefreshIcon = 'assets/images/oumi/ic_audio_refresh.svg';
  static const String audioFinishIcon = 'assets/images/oumi/ic_audio_finish.svg';
  static const String audioPlayIcon = 'assets/images/oumi/ic_play.svg';
  static const String audioWaveLine = 'assets/images/oumi/ic_voice_line.svg';
  static const String audioWaveAnim = 'assets/images/oumi/anim_line_voice.webp';
  static const String voiceDeleteIcon = 'assets/images/forya/delete_icon.webp';

  /// 启动页：角色 Logo / 白色 Chimo 标题 / 底部 slogan。
  static const String splashLogo = 'assets/images/forya/logo.webp';
  static const String splashTitle = 'assets/images/forya/title_logo.webp';
  static const String splashSlogan = 'assets/images/forya/launch_title.webp';

  /// 注册完成欢迎页：绿色 Chimo 字标。
  static const String brandTitleLogo = 'assets/images/forya/logo_title.webp';

  /// 启动 / 登录页背景与登录按钮图标。
  static const String launchBg = 'assets/images/forya/launch_bg.webp';
  static const String loginBg = 'assets/images/forya/login_bg.webp';
  static const String appleIcon = 'assets/images/forya/apple_icon.webp';
  static const String emailIcon = 'assets/images/forya/email_icon.webp';
  static const String agreeChecked = 'assets/images/forya/item_select.webp';
  static const String agreeUnchecked = 'assets/images/forya/item_unselect.webp';

  // ---------- 首页 ----------
  /// 首页顶栏背景光效。
  static const String homeTopBg = 'assets/images/forya/home_top_img.webp';

  /// 首页 Chimo 标题 Logo（约 91×28）。
  static const String homeTitle = 'assets/images/forya/home_title.webp';

  /// 首页搜索按钮（含圆角底，36×36）。
  static const String homeSearchBtn = 'assets/images/forya/home_search.webp';

  /// 首页小组卡片背景（Popular Groups 等）。
  static const String homeRoomBg = 'assets/images/forya/home_room_bg.webp';

  /// 「我的小组」横向卡片背景。
  static const String homeMyGroupBg = 'assets/images/forya/home_item_bg.webp';

  /// 首页小组列表：未加入（绿色 +）/ 已加入（灰色勾）。
  static const String homeJoin = 'assets/images/forya/home_plus.webp';
  static const String homeJoined = 'assets/images/forya/home_select.webp';

  /// 群组未加入：Photos 锁定空态插画。
  static const String groupUnjoinedLock = 'assets/images/forya/unjoin.webp';

  /// 消息列表：Group 名称旁标签。
  static const String chatGroupTag = 'assets/images/forya/group_tag.webp';

  /// 小组贵族等级标识（V1–V6）。
  static String groupLevel(int level) {
    final clamped = level.clamp(1, 6);
    return 'assets/images/forya/group_level_$clamped.webp';
  }

  static const String homeSearch = 'assets/images/oumi/msg/ic_search.webp';
  static const String homeHot = 'assets/images/oumi/home/hot_icon.webp';

  /// 首页 Banner 轮播图（设计稿 343×100）。
  static const List<String> homeBanners = [
    'assets/images/oumi/home/home_room_bg.webp',
    'assets/images/oumi/charge/banner.webp',
  ];

  // ---------- 个人中心 ----------
  static const String mineBg = 'assets/images/forya/mine_bg.webp';

  /// 仅气泡角色的顶部背景（去掉资源自带深色底，弧线改由代码绘制）。
  static const String mineBgTop = 'assets/images/forya/mine_bg_top.webp';

  /// Wallet / Level 整卡（背景与 3D 图标一体）。
  static const String mineWalletCard = 'assets/images/forya/mine_wallet.webp';
  static const String mineLevelCard = 'assets/images/forya/mine_level.webp';

  /// Wallet / Level 仅图标（无卡片底色）。
  static const String mineWalletIcon = 'assets/images/forya/mine_wallet_icon.webp';
  static const String mineLevelIconAsset =
      'assets/images/forya/mine_level_icon.webp';

  /// 金币图标 / 钱包页背景。
  static const String coin = 'assets/images/forya/coin.webp';
  static const String walletBg = 'assets/images/forya/wallet_bg.webp';
  static const String walletTopBg = 'assets/images/forya/wallet_top_bg.webp';

  static const String mineWalletBg = 'assets/images/oumi/bg_wallet.webp';
  static const String mineWalletCoin = 'assets/images/oumi/bg_wallet_coin.webp';
  static const String mineBalance = 'assets/images/oumi/mine/mine_balance.webp';
  static const String mineLevelIcon = 'assets/images/oumi/mine/mine_honor.webp';
  static const String mineItemBg = 'assets/images/oumi/mine/mine_item_bg.webp';
  static const String mineCopy = 'assets/images/forya/copy.svg';
  static const String mineArrow = 'assets/images/oumi/mine/right_arrow.webp';
  static const String mineInfo = 'assets/images/forya/mine_info.webp';
  static const String mineBind = 'assets/images/forya/mine_bind.webp';
  static const String mineHelp = 'assets/images/forya/mine_help.webp';
  static const String mineSetting = 'assets/images/forya/mine_setting.webp';
  static const String mineAbout = 'assets/images/forya/mine_about.webp';

  /// About Us 页 Logo。
  static const String aboutLogo = 'assets/images/forya/about_logo.webp';

  /// 个人主页顶部背景。
  static const String personalBg = 'assets/images/forya/personal_bg.webp';

  /// 等级页背景 / 特权图标。
  static const String levelBg = 'assets/images/oumi/mine/honor_bg.webp';
  static const String levelBadgeHero = 'assets/images/oumi/mine/mine_honor.webp';
  static const String levelPrivilegeBadge =
      'assets/images/forya/mine_level_icon.webp';
  static const String levelPrivilegeAssist =
      'assets/images/oumi/mine/mine_echo.webp';

  // ---------- 消息 ----------
  static const String msgBg = 'assets/images/oumi/msg/msg_bg.webp';
  static const String msgEmpty = 'assets/images/oumi/empty_no_msg.webp';
  static const String msgContacts = 'assets/images/oumi/msg/friend.webp';
  static const String msgSearch = 'assets/images/oumi/msg/ic_search.webp';

  /// 好友 / 关注空状态插画。
  static const String friendsEmpty = 'assets/images/forya/empty_no_data.webp';

  /// 消息顶栏更多。
  static const String msgMore = 'assets/images/oumi/msg/more.webp';

  /// 性别角标。
  static const String genderMan = 'assets/images/forya/man.webp';
  static const String genderWoman = 'assets/images/forya/woman.webp';

  /// 完善资料页：性别卡片（未选 / 已选）。
  static const String genderMaleImg = 'assets/images/forya/man_img.webp';
  static const String genderFemaleImg = 'assets/images/forya/woman_img.webp';
  static const String genderMaleSelected = 'assets/images/forya/man_select.webp';
  static const String genderFemaleSelected = 'assets/images/forya/woman_select.webp';
  /// 消息列表顶部引导图（含关闭按钮视觉）。
  static const String msgPromo = 'assets/images/forya/home_tips.webp';
  static const String msgPromoAlt = 'assets/images/oumi/charge/banner.webp';

  /// 消息列表左滑「置顶」图标。
  static const String msgPin = 'assets/images/forya/pin.webp';

  /// 消息列表左滑「取消置顶」图标。
  static const String msgUnpin = 'assets/images/forya/unpin.webp';

  /// 消息列表左滑「删除」图标。
  static const String msgDelete = 'assets/images/forya/delete_icon.webp';

  /// 聊天详情页返回图标。
  static const String chatBack = 'assets/images/forya/half_back.svg';

  /// 聊天输入栏：语音 / 图片 / 表情。
  static const String inputVoice = 'assets/images/forya/input_voice.webp';
  static const String inputImage = 'assets/images/forya/input_img.webp';
  static const String inputEmoji = 'assets/images/forya/input_emoji.webp';

  // ---------- 底部 Tab ----------
  static const String tabHome = 'assets/images/forya/tab_room.webp';
  static const String tabHomeSelected =
      'assets/images/forya/tab_room_select.webp';
  static const String tabChats = 'assets/images/forya/tab_msg.webp';
  static const String tabChatsSelected =
      'assets/images/forya/tab_msg_select.webp';
  static const String tabMe = 'assets/images/forya/tab_mine.webp';
  static const String tabMeSelected = 'assets/images/forya/tab_mine_select.webp';
}

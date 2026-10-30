/// 本地图片路径集中管理。请勿硬编码 `assets/images/...`，统一使用这些常量。
abstract final class AppAssets {
  static const String _common = 'assets/images/common';
  static const String _auth = 'assets/images/auth';
  static const String _home = 'assets/images/home';
  static const String _me = 'assets/images/me';
  static const String _wallet = 'assets/images/wallet';
  static const String _level = 'assets/images/level';
  static const String _profile = 'assets/images/profile';
  static const String _chat = 'assets/images/chat';
  static const String _msg = 'assets/images/msg';
  static const String _tab = 'assets/images/tab';
  static const String _honor = 'assets/images/honor';

  // ---------- 品牌 / 共用 ----------
  static const String logo = '$_common/logo.webp';
  static const String iconLogo = '$_common/logo_title.webp';
  static const String titleLogo = '$_common/title_logo.webp';
  static const String brandIcon = logo;

  /// 用户头像为空或加载失败时的占位，对齐 Oumi `contact_avatar_default`。
  static const String avatarPlace = '$_common/avatar_default.webp';
  static const String emptyAvatar = avatarPlace;
  static const String defaultAvatar = avatarPlace;
  static const String cameraIcon = '$_chat/input_img.webp';
  static const String backArrow = '$_common/back_arrow.svg';
  static const String closeCircle = '$_common/lock.svg';
  static const String lockIcon = '$_common/lock.svg';
  static const String halfRightArrow = '$_common/half_right_arrow.svg';
  static const String triangleUp = '$_common/triangle_up.svg';
  static const String triangleDown = '$_common/triangle_down.svg';
  static const String triangleRight = '$_common/triangle_right.svg';

  // 录音
  static const String recordBg = '$_profile/bottom_bg.webp';

  /// 录音按钮：空闲 / 录音中麦克风。
  static const String audioRecordIcon = '$_profile/yuyin.png';

  /// 录音按钮：预览播放波形。
  static const String audioPlayingIcon = '$_profile/Group 145.png';

  /// 录音预览：重试 / 确认。
  static const String audioRefreshIcon = '$_profile/Retry.png';
  static const String audioFinishIcon = '$_profile/Affirm.png';
  static const String audioPlayIcon = audioPlayingIcon;
  static const String audioWaveLine = '$_profile/Vector 272.png';
  static const String audioWaveAnim = '$_profile/Group 145.png';

  /// 资料页语音条：静态波形。
  static const String voiceWaveLine = '$_profile/ic_voice_line.svg';

  /// 资料页语音条：播放中的动态波形（原始 webp）。
  static const String voiceWaveAnim = '$_profile/anim_line_voice.webp';
  static const String voicePlayIcon = '$_profile/ic_play.svg';
  static const String voicePauseIcon = '$_profile/ic_pause.svg';
  static const String voiceDeleteIcon = '$_common/delete_icon.webp';

  /// 启动页：角色 Logo / 白色 Chimo 标题 / 底部 Slogan。
  static const String splashLogo = logo;
  static const String splashTitle = '$_common/title_logo.webp';
  static const String splashSlogan = '$_auth/launch_title.webp';

  /// 注册后欢迎页：绿色 Chimo 字标。
  static const String brandTitleLogo = iconLogo;

  /// 启动页 / 登录背景与登录按钮图标。
  static const String launchBg = '$_auth/launch_bg.webp';
  static const String loginBg = '$_auth/login_bg.webp';
  static const String appleIcon = '$_auth/apple_icon.webp';
  static const String emailIcon = '$_auth/email_icon.webp';
  static const String agreeChecked = '$_auth/item_select.webp';
  static const String agreeUnchecked = '$_auth/item_unselect.webp';
  static const String agreeCheckedBlack = '$_auth/item_select_black.webp';
  static const String agreeUncheckedBlack = '$_auth/item_unselect_black.webp';

  // ---------- 首页 ----------
  /// 首页顶栏光晕背景。
  static const String homeTopBg = '$_home/home_top_img.webp';

  /// 首页 Chimo 标题 Logo（约 91×28）。
  static const String homeTitle = '$_home/home_title.webp';

  /// 首页搜索按钮（圆角底，36×36）。
  static const String homeSearchBtn = '$_home/home_search.webp';

  /// 首页群组卡片背景（Popular Groups 等）。
  static const String homeRoomBg = '$_home/home_room_bg.webp';

  /// 「我的群组」横向卡片背景。
  static const String homeMyGroupBg = '$_home/home_item_bg.webp';

  /// 群组成员数图标。
  static const String homePerson = '$_home/home_person.webp';

  /// 群组照片/帖子数图标。
  static const String homeImg = '$_home/home_img.webp';

  /// 首页群组列表：未加入（绿色 +）/ 已加入（灰色勾）。
  static const String homeJoin = '$_home/home_plus.webp';
  static const String homeJoined = '$_home/home_select.webp';

  /// 未加入群组：Photos 锁定空态插图。
  static const String groupUnjoinedLock = '$_home/unjoin.webp';

  /// 会话列表：群组名旁的标签。
  static const String chatGroupTag = '$_home/group_tag.webp';

  /// 群组贵族等级徽章（V1–V6）。
  static String groupLevel(int level) {
    final clamped = level.clamp(1, 6);
    return '$_home/group_level_$clamped.webp';
  }

  static const String homeSearch = homeSearchBtn;
  static const String homeHot = homeJoined;

  /// 首页 Banner 轮播（设计稿 343×100）。
  static const List<String> homeBanners = [homeRoomBg, launchBg];

  /// 部落 / 群组条目背景。
  static const String tribesItemBg = '$_home/tribes_item_bg.webp';

  // ---------- 我的 ----------
  static const String mineBg = '$_me/mine_bg.webp';

  /// 气泡角色顶部背景（已去掉深色填充；弧线在代码中绘制）。
  static const String mineBgTop = '$_me/mine_bg_top.webp';

  /// 钱包 / 等级完整卡片（背景 + 3D 图标）。
  static const String mineWalletCard = '$_me/mine_wallet.webp';
  static const String mineLevelCard = '$_me/mine_level.webp';

  /// 仅钱包 / 等级图标（无卡片底）。
  static const String mineWalletIcon = '$_me/mine_wallet_icon.webp';
  static const String mineLevelIconAsset = '$_me/mine_level_icon.webp';

  /// 金币图标 / 钱包页背景。
  static const String coin = '$_wallet/coin.webp';
  static const String walletBg = '$_wallet/wallet_bg.webp';
  static const String walletTopBg = '$_wallet/wallet_top_bg.webp';

  static const String mineWalletBg = mineWalletCard;
  static const String mineWalletCoin = coin;
  static const String mineBalance = coin;
  static const String mineLevelIcon = mineLevelIconAsset;
  static const String mineItemBg = homeMyGroupBg;
  static const String mineCopy = '$_me/copy.svg';
  static const String mineArrow = '$_common/arrow_right.svg';
  static const String mineInfo = '$_me/mine_info.webp';
  static const String mineBind = '$_me/mine_bind.webp';
  static const String mineHelp = '$_me/mine_help.webp';
  static const String mineSetting = '$_me/mine_setting.webp';
  static const String mineAbout = '$_me/mine_about.webp';
  static const String mineHonor = '$_honor/mine_honor.webp';

  /// 荣誉页顶部光晕背景。
  static const String honorHomeBg = '$_honor/honor_home_bg.webp';

  /// 资料卡 Earned 月桂底图。
  static const String honorEarnedBg = '$_honor/honor_earned_bg.webp';

  /// 荣誉页顶部资料卡背景。
  static const String honorHeaderCardBg = '$_honor/honor_header_card_bg.webp';

  /// 荣誉详情弹窗 / 卡片备用背景（聚光灯光效）。
  static const String honorDetailBg = '$_honor/honor_detail_bg.webp';

  /// 「关于我们」页 Logo。
  static const String aboutLogo = '$_me/about_logo.webp';

  /// 个人资料页顶部背景。
  static const String personalBg = '$_profile/personal_bg.webp';
  static const String infoBg = '$_profile/info_bg.webp';
  static const String protocolBg = '$_profile/protocol_bg.webp';

  /// 等级页（forya MineLevelPage 远程资源）。
  static const String levelBg = '$_level/level_page_bg.webp';
  static const String levelPrivilegeAccent = '$_level/level_page_tag.webp';
  static const String levelPrivilegeBadge = '$_level/level_page_icon_1.webp';
  static const String levelPrivilegeAssist = '$_level/level_page_icon_2.webp';

  /// 按 forya `levelIndex` 取卡片 / 主徽章（0–5 → 文件 1–6）。
  static String levelCardBg(int levelIndex) =>
      '$_level/level_bg_${levelIndex.clamp(0, 5) + 1}.webp';
  static String levelBadgeHero(int levelIndex) =>
      '$_level/level_bg_icon_${levelIndex.clamp(0, 5) + 1}.webp';

  // ---------- 消息 / 聊天 ----------
  /// 消息列表顶部光晕背景。
  static const String msgBg = '$_msg/msg_bg.webp';
  static const String msgEmpty = '$_chat/empty_no_msg.webp';
  static const String msgContacts = '$_chat/chats_contacts.svg';
  static const String msgSearch = '$_chat/chats_search.svg';

  /// 好友 / 关注空态插图。
  static const String friendsEmpty = '$_common/empty_no_data.webp';
  static const String emptyNoSearch = '$_common/empty_no_search.webp';
  static const String emptyNoWifi = '$_common/empty_no_wifi.webp';

  /// 会话 / 群组导航栏「更多」（⋯）。
  static const String msgMore = '$_chat/chat_dm_more.svg';

  /// 性别徽章图标。
  static const String genderMan = '$_profile/man.webp';
  static const String genderWoman = '$_profile/woman.webp';

  /// 聊天资料卡标签（身高 / 体重）。
  static const String tagHeight = '$_profile/ic_height.svg';
  static const String tagWeight = '$_profile/ic_weight.svg';

  /// 资料设置：性别卡片（未选 / 已选）。
  static const String genderMaleImg = '$_profile/man_img.webp';
  static const String genderFemaleImg = '$_profile/woman_img.webp';
  static const String genderMaleSelected = '$_profile/man_select.webp';
  static const String genderFemaleSelected = '$_profile/woman_select.webp';

  /// 旧版全幅推广图（保留作回退）。
  static const String msgPromo = '$_home/home_tips.webp';
  static const String msgPromoAlt = launchBg;

  /// 会话页推广 Banner 插图（Figma 39:428）。
  static const String msgPromoHand = '$_chat/chats_promo_hand.png';
  static const String msgPromoHi = '$_chat/chats_promo_hi.png';
  static const String msgPromoClose = '$_chat/chats_promo_close.svg';

  /// 会话标题下的曲线装饰。
  static const String chatTitleTips = '$_chat/chats_title_underline.svg';

  /// 标题旁的官方认证勾。
  static const String chatVerified = '$_chat/chats_verified.svg';

  /// 标题旁的 Soulmate 手写徽章。
  static const String chatSoulmate = '$_chat/chats_soulmate.svg';

  /// 会话列表左滑「置顶」/「取消置顶」/「删除」（36 圆形资源）。
  static const String msgPin = '$_chat/chats_swipe_pin.svg';
  static const String msgUnpin = '$_chat/unpin.webp';
  static const String msgSwipeDelete = '$_chat/chats_swipe_delete.svg';

  /// 通用删除图标（位图；用于左滑操作以外的场景）。
  static const String msgDelete = '$_common/delete_icon.webp';

  /// 聊天详情 / 全局返回图标。
  static const String chatBack = '$_chat/half_back.svg';

  /// 私聊详情返回（Figma 55:274）。
  static const String chatDmBack = '$_chat/chat_dm_back.svg';

  /// 导航栏私聊更多（⋯）。
  static const String chatDmMore = '$_chat/chat_dm_more.svg';

  /// 聊天输入栏：语音 / 图片 / 表情 / 礼物 / Wish（私聊 Figma）。
  static const String inputVoice = '$_chat/input_voice.webp';
  static const String inputImage = '$_chat/input_img.webp';

  /// 旧版表情（群聊 / 非私聊）；私聊使用 [chatDmEmoji]。
  static const String inputEmoji = '$_chat/input_emoji.webp';
  static const String chatDmEmoji = '$_chat/chat_dm_emoji.svg';
  static const String chatVoice = '$_chat/chat_dm_tool_voice.svg';
  static const String chatImg = '$_chat/chat_dm_tool_img.svg';
  static const String chatGift = '$_chat/chat_dm_tool_gift.png';
  static const String chatWish = '$_chat/chat_dm_tool_wish.svg';

  /// 资料页礼物按钮（优先使用专用资源）。
  static const String giftIcon = '$_chat/chat_gift.webp';

  /// 举报 / 系统消息图标。
  static const String reportIcon = '$_chat/report_icon.webp';
  static const String sysIcon = '$_chat/sys_icon.webp';

  /// 用户资料底部弹层背景（右上绿光）。
  static const String userSheetCover = '$_profile/user_sheet_cover.webp';

  // ---------- 底部 Tab（对齐 yaychat_dev：Find/Home、Live/Room、Chat、Me）----------
  static const String tabHome = '$_tab/tab_home.webp';
  static const String tabHomeSelected = '$_tab/tab_home_select.webp';
  static const String tabRoom = '$_tab/tab_room.webp';
  static const String tabRoomSelected = '$_tab/tab_room_select.webp';
  static const String tabChats = '$_tab/tab_msg.webp';
  static const String tabChatsSelected = '$_tab/tab_msg_select.webp';
  static const String tabMe = '$_tab/tab_mine.webp';
  static const String tabMeSelected = '$_tab/tab_mine_select.webp';

  /// 资源是否为 SVG。
  static bool isSvg(String asset) => asset.toLowerCase().endsWith('.svg');

  // ---------- 语音房底部栏 ----------
  static const String _room = 'assets/images/room/common';

  /// 输入框内表情。
  static const String roomEmojiMenu = '$_room/emoji_menu.webp';

  /// 礼物。
  static const String roomGiftMenu = '$_room/gift_menu.webp';

  /// 房间消息铃铛。
  static const String roomMsgMenu = '$_room/msg_menu.webp';

  /// 更多功能。
  static const String roomFuncMenu = '$_room/func_menu.webp';

  /// 更多房间箭头。
  static const String roomArrowRight = '$_room/icon_arrow_right.webp';

  /// 房间公告。
  static const String roomBulletin = '$_room/icon_bulletin.webp';

  /// 房间热度。
  static const String roomFire = '$_room/icon_fire.webp';

  /// 房间游戏入口。
  static const String roomGames = '$_room/icon_games.webp';

  /// 公屏性别标：男。
  static const String roomMale = '$_room/icon_male.webp';

  /// 公屏性别标：女。
  static const String roomFemale = '$_room/icon_female.webp';

  /// giftRank 前三名头像王冠（着色区分名次）。
  static const String roomKing = '$_room/icon_king.webp';

  /// 排行榜头像框：第 1 名。
  static const String roomRankNo1 = '$_room/rank_no1.webp';

  /// 排行榜头像框：第 2 名。
  static const String roomRankNo2 = '$_room/rank_no2.webp';

  /// 排行榜头像框：第 3 名。
  static const String roomRankNo3 = '$_room/rank_no3.webp';

  /// 排行榜头像框（1/2/3），越界返回空。
  static String roomRankNo(int rank) {
    switch (rank) {
      case 1:
        return roomRankNo1;
      case 2:
        return roomRankNo2;
      case 3:
        return roomRankNo3;
      default:
        return '';
    }
  }

  /// 排行榜前三卡片底：第 1 名。
  static const String roomRank1CardBg = '$_room/rank1_card_bg.webp';

  /// 排行榜前三卡片底：第 2 名。
  static const String roomRank2CardBg = '$_room/rank2_card_bg.webp';

  /// 排行榜前三卡片底：第 3 名。
  static const String roomRank3CardBg = '$_room/rank3_card_bg.webp';

  /// 排行榜前三卡片底（1/2/3），越界返回空。
  static String roomRankCardBg(int rank) {
    switch (rank) {
      case 1:
        return roomRank1CardBg;
      case 2:
        return roomRank2CardBg;
      case 3:
        return roomRank3CardBg;
      default:
        return '';
    }
  }

  /// 排行榜背景：送礼榜（Top Giver）。
  static const String roomTopGiverBg = '$_room/top_giver_bg.webp';

  /// 排行榜背景：收礼榜（Top Receiver）。
  static const String roomTopReceiverBg = '$_room/top_receiver_bg.webp';

  /// 麦位贡献。
  static const String roomLove = '$_room/icon_love.webp';

  /// 底栏开麦。
  static const String roomMicOn = '$_room/icon_mic_on.webp';

  /// 麦位闭麦。
  static const String roomMicOff = '$_room/icon_mic_off.webp';

  /// 缩小房间。
  static const String roomScale = '$_room/icon_scale.webp';

  /// 老板空位。
  static const String roomSeatBoss = '$_room/seat_boss.webp';

  /// 普通空位。
  static const String roomSeatEmpty = '$_room/seat_empty.webp';

  /// 最小化浮窗上的音浪。
  static const String roomFloatWave = '$_room/anim_in_room.webp';

  /// 最小化浮窗关闭。
  static const String roomFloatClose = '$_room/icon_float_close.webp';

  /// 麦上剩余时长提示图标。
  static const String roomMicRemain = '$_room/mic_remain_icon.webp';

  /// 「Insufficient On-mic Time」弹窗配图。
  static const String roomMicRemainDialog = '$_room/mic_remain_dialog.webp';

  /// 麦上时长弹窗主图（麦克风 + 闹钟）。
  static const String roomOnMicClock = '$_room/on_mic_clock.webp';

  /// 麦上时长弹窗背景。
  static const String roomOnMicDialogBg = '$_room/on_mic_dialog_bg.webp';

  /// 送礼面板选中人勾选标。
  static const String roomGiftSelected = '$_room/icon_selected.webp';

  /// 冠名公屏条背景。
  static const String roomNamedBg = '$_room/named_room_msg_bg.webp';

  /// 冠名公屏条王冠。
  static const String roomNamedCrown = '$_room/king_hat.webp';

  /// 房间工具：分享。
  static const String roomToolShare = '$_room/icon_share.webp';

  /// 房间工具：举报。
  static const String roomToolReport = '$_room/icon_report.webp';

  /// 房间工具：收藏（未收藏）。
  static const String roomToolSave = '$_room/icon_save.webp';

  /// 房间工具：已收藏。
  static const String roomToolSaved = '$_room/icon_saved.webp';

  /// 房间工具：警告（设计稿与已收藏同图）。
  static const String roomToolWarn = roomToolSaved;

  /// 房间工具：关闭房间。
  static const String roomToolClose = '$_room/icon_exit.webp';
}

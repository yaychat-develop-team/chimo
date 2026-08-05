/// Central local image paths. Do not hardcode `assets/images/...`; use these constants.
abstract final class AppAssets {
  static const String _forya = 'assets/images/forya';

  // ---------- Brand / shared ----------
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

  // Recording
  static const String recordBg = '$_forya/bottom_bg.webp';

  /// Record button: idle / recording mic.
  static const String audioRecordIcon = '$_forya/yuyin.png';

  /// Record button: preview playback waveform.
  static const String audioPlayingIcon = '$_forya/Group 145.png';

  /// Record preview: retry / confirm.
  static const String audioRefreshIcon = '$_forya/Retry.png';
  static const String audioFinishIcon = '$_forya/Affirm.png';
  static const String audioPlayIcon = audioPlayingIcon;
  static const String audioWaveLine = '$_forya/Vector 272.png';
  static const String audioWaveAnim = '$_forya/Group 145.png';

  /// Profile voice bar: static waveform.
  static const String voiceWaveLine = '$_forya/ic_voice_line.svg';
  /// Profile voice bar: animated waveform while playing (original webp).
  static const String voiceWaveAnim = '$_forya/anim_line_voice.webp';
  static const String voicePlayIcon = '$_forya/ic_play.svg';
  static const String voicePauseIcon = '$_forya/ic_pause.svg';
  static const String voiceDeleteIcon = '$_forya/delete_icon.webp';

  /// Splash: character logo / white Chimo title / bottom slogan.
  static const String splashLogo = logo;
  static const String splashTitle = '$_forya/title_logo.webp';
  static const String splashSlogan = '$_forya/launch_title.webp';

  /// Post-registration welcome: green Chimo wordmark.
  static const String brandTitleLogo = iconLogo;

  /// Splash / login backgrounds and login button icons.
  static const String launchBg = '$_forya/launch_bg.webp';
  static const String loginBg = '$_forya/login_bg.webp';
  static const String appleIcon = '$_forya/apple_icon.webp';
  static const String emailIcon = '$_forya/email_icon.webp';
  static const String agreeChecked = '$_forya/item_select.webp';
  static const String agreeUnchecked = '$_forya/item_unselect.webp';
  static const String agreeCheckedBlack = '$_forya/item_select_black.webp';
  static const String agreeUncheckedBlack = '$_forya/item_unselect_black.webp';

  // ---------- Home ----------
  /// Home top bar glow background.
  static const String homeTopBg = '$_forya/home_top_img.webp';

  /// Home Chimo title logo (~91×28).
  static const String homeTitle = '$_forya/home_title.webp';

  /// Home search button (rounded base, 36×36).
  static const String homeSearchBtn = '$_forya/home_search.webp';

  /// Home group card background (Popular Groups, etc.).
  static const String homeRoomBg = '$_forya/home_room_bg.webp';

  /// My Groups horizontal card background.
  static const String homeMyGroupBg = '$_forya/home_item_bg.webp';

  /// Group member-count icon.
  static const String homePerson = '$_forya/home_person.webp';

  /// Group photo/post-count icon.
  static const String homeImg = '$_forya/home_img.webp';

  /// Home group list: not joined (green +) / joined (grey check).
  static const String homeJoin = '$_forya/home_plus.webp';
  static const String homeJoined = '$_forya/home_select.webp';

  /// Group not joined: Photos locked empty illustration.
  static const String groupUnjoinedLock = '$_forya/unjoin.webp';

  /// Chats list: tag next to Group name.
  static const String chatGroupTag = '$_forya/group_tag.webp';

  /// Group nobility level badge (V1–V6).
  static String groupLevel(int level) {
    final clamped = level.clamp(1, 6);
    return '$_forya/group_level_$clamped.webp';
  }

  static const String homeSearch = homeSearchBtn;
  static const String homeHot = homeJoined;

  /// Home banner carousel (design 343×100).
  static const List<String> homeBanners = [homeRoomBg, launchBg];

  /// Tribe / group item background.
  static const String tribesItemBg = '$_forya/tribes_item_bg.webp';

  // ---------- Me ----------
  static const String mineBg = '$_forya/mine_bg.webp';

  /// Bubble character top background (dark fill removed; arc drawn in code).
  static const String mineBgTop = '$_forya/mine_bg_top.webp';

  /// Wallet / Level full cards (background + 3D icon).
  static const String mineWalletCard = '$_forya/mine_wallet.webp';
  static const String mineLevelCard = '$_forya/mine_level.webp';

  /// Wallet / Level icons only (no card fill).
  static const String mineWalletIcon = '$_forya/mine_wallet_icon.webp';
  static const String mineLevelIconAsset = '$_forya/mine_level_icon.webp';

  /// Coin icon / wallet page backgrounds.
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

  /// About Us page logo.
  static const String aboutLogo = '$_forya/about_logo.webp';

  /// Personal profile top background.
  static const String personalBg = '$_forya/personal_bg.webp';
  static const String infoBg = '$_forya/info_bg.webp';
  static const String protocolBg = '$_forya/protocol_bg.webp';

  /// Level page: background / current level card / badge / privilege icons.
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

  // ---------- Messages / chat ----------
  static const String msgBg = homeTopBg;
  static const String msgEmpty = '$_forya/empty_no_msg.webp';
  static const String msgContacts = '$_forya/chats_contacts.svg';
  static const String msgSearch = '$_forya/chats_search.svg';

  /// Friends / follow empty-state illustration.
  static const String friendsEmpty = '$_forya/empty_no_data.webp';
  static const String emptyNoSearch = '$_forya/empty_no_search.webp';
  static const String emptyNoWifi = '$_forya/empty_no_wifi.webp';

  /// Chats / group app bar more (⋯).
  static const String msgMore = '$_forya/chat_dm_more.svg';

  /// Gender badge icons.
  static const String genderMan = '$_forya/man.webp';
  static const String genderWoman = '$_forya/woman.webp';

  /// Chat profile card tags (height / weight).
  static const String tagHeight = '$_forya/ic_height.svg';
  static const String tagWeight = '$_forya/ic_weight.svg';

  /// Profile setup: gender cards (unselected / selected).
  static const String genderMaleImg = '$_forya/man_img.webp';
  static const String genderFemaleImg = '$_forya/woman_img.webp';
  static const String genderMaleSelected = '$_forya/man_select.webp';
  static const String genderFemaleSelected = '$_forya/woman_select.webp';

  /// Legacy full-bleed promo image (kept for fallbacks).
  static const String msgPromo = '$_forya/home_tips.webp';
  static const String msgPromoAlt = launchBg;

  /// Chats promo banner illustrations (Figma 39:428).
  static const String msgPromoHand = '$_forya/chats_promo_hand.png';
  static const String msgPromoHi = '$_forya/chats_promo_hi.png';
  static const String msgPromoClose = '$_forya/chats_promo_close.svg';

  /// Curve decoration under the Chats title.
  static const String chatTitleTips = '$_forya/chats_title_underline.svg';

  /// Official verified check beside title.
  static const String chatVerified = '$_forya/chats_verified.svg';

  /// Soulmate script badge beside title.
  static const String chatSoulmate = '$_forya/chats_soulmate.svg';

  /// Chats list swipe "Pin" / "Unpin" / "Delete" (36 circle assets).
  static const String msgPin = '$_forya/chats_swipe_pin.svg';
  static const String msgUnpin = '$_forya/unpin.webp';
  static const String msgSwipeDelete = '$_forya/chats_swipe_delete.svg';

  /// Generic delete icon (raster; used outside swipe actions).
  static const String msgDelete = '$_forya/delete_icon.webp';

  /// Chat detail / global back icon.
  static const String chatBack = '$_forya/half_back.svg';

  /// DM detail back (Figma 55:274).
  static const String chatDmBack = '$_forya/chat_dm_back.svg';

  /// DM more (⋯) in app bar.
  static const String chatDmMore = '$_forya/chat_dm_more.svg';

  /// Chat input bar: voice / image / emoji / gift / Wish (DM Figma).
  static const String inputVoice = '$_forya/input_voice.webp';
  static const String inputImage = '$_forya/input_img.webp';

  /// Legacy emoji (group / non-DM); DM uses [chatDmEmoji].
  static const String inputEmoji = '$_forya/input_emoji.webp';
  static const String chatDmEmoji = '$_forya/chat_dm_emoji.svg';
  static const String chatVoice = '$_forya/chat_dm_tool_voice.svg';
  static const String chatImg = '$_forya/chat_dm_tool_img.svg';
  static const String chatGift = '$_forya/chat_dm_tool_gift.png';
  static const String chatWish = '$_forya/chat_dm_tool_wish.svg';

  /// Profile Gift button (prefer dedicated asset if available).
  static const String giftIcon = '$_forya/chat_gift.webp';

  /// Report / system message icons.
  static const String reportIcon = '$_forya/report_icon.webp';
  static const String sysIcon = '$_forya/sys_icon.webp';

  // ---------- Bottom tabs ----------
  static const String tabHome = '$_forya/tab_room.webp';
  static const String tabHomeSelected = '$_forya/tab_room_select.webp';
  static const String tabChats = '$_forya/tab_msg.webp';
  static const String tabChatsSelected = '$_forya/tab_msg_select.webp';
  static const String tabMe = '$_forya/tab_mine.webp';
  static const String tabMeSelected = '$_forya/tab_mine_select.webp';

  /// Whether the asset is SVG.
  static bool isSvg(String asset) => asset.toLowerCase().endsWith('.svg');
}

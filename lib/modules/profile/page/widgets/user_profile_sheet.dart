import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_gift.dart';
import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/extensions/wire_view.dart';
import '../../../../common/models/server_client/couple.pb.dart';
import '../../../../common/models/server_client/gift_wall.pb.dart';
import '../../../../common/models/server_client/user.pb.dart';
import '../../../../common/widgets/app_image.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../../common/utils/zodiac.dart';
import '../../../../common/widgets/tag_chip.dart';
import '../../../chat/logic/dm_entry.dart';
import '../../../chat/model/conversation_model.dart';
import '../../../room/logic/mic_logic.dart';
import '../../../room/page/widgets/room_user_more_sheet.dart';
import '../../../room/service/room_service.dart';
import '../../logic/user_profile_sheet_logic.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 群聊 / 房间等场景点击对方头像时的底部资料弹层。
class UserProfileSheet extends StatefulWidget {
  const UserProfileSheet({super.key, required this.profile});

  final User profile;

  /// 已有 [User] 时直接弹。按 uid 拉资料请走 [AppJumper.showUserProfileSheet]。
  static Future<void> show({required User profile}) {
    return AppBottomSheet.show<void>(
      isScrollControlled: true,
      barrierColor: const Color(0x73000000),
      child: UserProfileSheet(profile: profile),
    );
  }

  @override
  State<UserProfileSheet> createState() => _UserProfileSheetState();
}

class _UserProfileSheetState extends State<UserProfileSheet> {
  UserProfileSheetLogic get _logic {
    if (Get.isRegistered<UserProfileSheetLogic>()) {
      return Get.find<UserProfileSheetLogic>();
    }
    return Get.put(UserProfileSheetLogic(widget.profile));
  }

  User get _profile => _logic.profile.value;

  String _zodiacTextOf(User user) =>
      user.birthday.trim().isEmpty ? '' : Zodiac.fromBirthday(user.birthday);

  String _zodiacLabelOf(User user) => Zodiac.chipLabel(_zodiacTextOf(user));

  int _ageOf(User user) => Zodiac.age(user.birthday, fallback: user.age);

  String _bioDisplayOf(User user) {
    final bio = user.personalSignature.trim();
    if (bio.isNotEmpty) return bio;
    if (!user.genderKnown) {
      return 'They have not set up their personal signature yet.';
    }
    return user.male
        ? 'He has not set up his personal signature yet.'
        : 'She has not set up her personal signature yet.';
  }

  Future<void> _copyId() async {
    await Clipboard.setData(ClipboardData(text: _profile.uid));
    if (!mounted) return;
    AppToast.info('Saved to the clipboard');
  }

  void _openReport() {
    AppJumper.back();
    AppJumper.toReport(reportedId: _profile.uid);
  }

  /// 房间内对齐 oumi `ic_more` → `RoomUserMoreBtns`；站外仍直接举报。
  bool get _inRoom {
    final service = RoomService.findOrNull();
    return service != null && service.inRoom.value;
  }

  Future<void> _openMore() async {
    if (!_inRoom) {
      _openReport();
      return;
    }
    await showRoomUserMoreSheet(profile: _profile);
  }

  void _openChat() {
    final user = _profile;
    final em = user.emUsername.trim();
    final conversation = ConversationModel(
      id: em.isNotEmpty ? 'dm_$em' : 'dm_${user.uid}',
      title: user.nickname,
      avatarAsset: AppAssets.avatarPlace,
      lastMessage: '',
      timeLabel: 'Just',
      isMale: user.male,
      signature: user.personalSignature,
      zodiac: _zodiacTextOf(user),
      isFollowing: _logic.following.value,
      momentAssets: user.approvedPics,
      avatarUrl: user.avatar.trim().isEmpty ? null : user.avatar,
      emUserName: em,
    );
    DmEntry.open(conversation, closeCurrent: true);
  }

  void _openProfilePage() {
    AppJumper.back();
    AppJumper.toProfile(_profile.uid, preview: _profile);
  }

  /// 房间内看自己：走上下麦；站外仍进个人页。
  bool get _selfInRoom {
    if (!_logic.isSelf) return false;
    final service = RoomService.findOrNull();
    return service != null && service.inRoom.value;
  }

  bool get _selfOnMic => Get.isRegistered<MicLogic>() && Get.find<MicLogic>().onMic;

  Future<void> _toggleSelfMic() async {
    AppJumper.back();
    final service = RoomService.findOrNull();
    if (service == null) return;
    final failure = await service.toggleMic();
    if (failure != null) AppToast.error(failure);
  }

  /// 送礼：在房内对齐 joyride 房间资料卡 — 先关资料卡，再开房间礼物面板（带特效）。
  /// 不在房则开通用资料送礼面板。
  void _openGift({int preferredGiftId = 0}) {
    final user = _profile;
    final room = AppGift.inRoom;
    AppGift.show(
      context,
      scene: room ? AppGiftScene.room : AppGiftScene.profile,
      receiverUid: user.uid,
      receiverName: user.nickname,
      receiverAvatar: user.avatar,
      preferredGiftId: preferredGiftId,
      popCurrent: room,
    );
  }

  void _openRomanceGift() {
    final couple = _logic.romanceCouple.value;
    final giftId = couple?.itemId.toInt() ?? 0;
    _openGift(preferredGiftId: giftId > 0 ? giftId : 0);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final logic = _logic;

    // 设计图：头像 72 + 白边 2.5，约一半探出顶边；背景用 user_sheet_cover。
    final avatarSize = 72.w;
    final avatarBorder = 2.5.w;
    final avatarOuter = avatarSize + avatarBorder * 2;
    final sheetOverlap = 14.w;
    final hPad = 20.w;

    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: Obx(() {
        final user = logic.profile.value;
        final following = logic.following.value;
        final wall = logic.giftWall.value;
        final zodiacLabel = _zodiacLabelOf(user);
        final age = _ageOf(user);
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.only(top: sheetOverlap),
              padding: EdgeInsets.fromLTRB(hPad, 12, hPad, 20),
              decoration: BoxDecoration(
                color: AppColors.black,
                image: DecorationImage(
                  image: AssetImage(AppAssets.userSheetCover),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: avatarOuter + 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.nickname,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: _copyId,
                              behavior: HitTestBehavior.opaque,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'ID: ${user.uid}',
                                    style: const TextStyle(
                                      color: AppColors.gray9A9A9A,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Chimo.image(
                                    AppAssets.mineCopy,
                                    width: 12,
                                    height: 12,
                                    color: AppColors.gray9A9A9A,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!logic.isSelf)
                        GestureDetector(
                          onTap: _openMore,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: _inRoom ? 8 : 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white10,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: _inRoom
                                ? Chimo.image(
                                    AppAssets.roomUserMore,
                                    width: 16,
                                    height: 16,
                                    color: AppColors.white70,
                                  )
                                : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Chimo.image(
                                        AppAssets.reportIcon,
                                        width: 12,
                                        height: 12,
                                        color: AppColors.white70,
                                      ),
                                      const SizedBox(width: 4),
                                      const Text(
                                        'Report',
                                        style: TextStyle(
                                          color: AppColors.white70,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 20.w),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      if (zodiacLabel.isNotEmpty)
                        TagChip(
                          color: AppColors.purple5128AE,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          radius: 12,
                          child: Text(
                            zodiacLabel,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                          ),
                        ),
                      if (user.genderKnown)
                        TagChip(
                          color: user.male ? AppColors.blue4F8BFF : AppColors.pinkFF5BA8,
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          radius: 12,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Chimo.image(
                                user.male ? AppAssets.genderMan : AppAssets.genderWoman,
                                width: 12,
                                height: 12,
                              ),
                              if (age > 0) ...[
                                const SizedBox(width: 3),
                                Text(
                                  '$age',
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      if ((user.vipSmallIcon ?? '').trim().isNotEmpty)
                        Chimo.image(
                          user.vipSmallIcon!.trim(),
                          height: 20,
                          fit: BoxFit.fitHeight,
                          error: const SizedBox.shrink(),
                        ),
                    ],
                  ),
                  SizedBox(height: 12.w),
                  Text(
                    _bioDisplayOf(user),
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                  if (logic.showRomanceGift) ...[
                    SizedBox(height: 16.w),
                    _RomanceGiftBar(
                      couple: logic.romanceCouple.value!,
                      onGift: _openRomanceGift,
                    ),
                  ] else if (wall != null && wall.itemList.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    _GiftWallCard(wall: wall, onTap: logic.openGiftWall),
                  ],
                  const SizedBox(height: 20),
                  if (logic.isSelf)
                    _PillButton(
                      label: _selfInRoom ? (_selfOnMic ? 'Leave mic' : 'Join mic') : 'Profile',
                      filled: true,
                      onTap: _selfInRoom ? _toggleSelfMic : _openProfilePage,
                    )
                  else if (following)
                    Row(
                      children: [
                        Expanded(
                          child: _PillButton(label: 'Chat', filled: true, onTap: _openChat),
                        ),
                        const SizedBox(width: 10),
                        _GiftButton(onTap: _openGift),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: Chimo.s.primaryButton(
                            label: 'Follow',
                            height: 48,
                            onTap: logic.toggleFollow,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _PillButton(label: 'Chat', filled: false, onTap: _openChat),
                        ),
                        const SizedBox(width: 10),
                        _GiftButton(onTap: _openGift),
                      ],
                    ),
                ],
              ),
            ),
            Positioned(
              left: hPad,
              top: 0,
              child: GestureDetector(
                onTap: _openProfilePage,
                child: Container(
                  width: avatarOuter,
                  height: avatarOuter,
                  padding: EdgeInsets.all(avatarBorder),
                  decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
                  child: ClipOval(
                    child: Chimo.image(
                      user.avatar,
                      fallbackAsset: AppAssets.avatarPlace,
                      width: avatarSize,
                      height: avatarSize,
                      fit: BoxFit.cover,
                      fadeIn: Duration.zero,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _PillButton extends StatelessWidget {
  const _PillButton({required this.label, required this.filled, required this.onTap});

  final String label;
  final bool filled;
  final VoidCallback onTap;

  static const _green = AppColors.green00F875;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: filled ? _green : AppColors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: filled ? null : Border.all(color: _green, width: 1.5),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: filled ? AppColors.black1C1C1E : _green,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class _GiftButton extends StatelessWidget {
  const _GiftButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.black2A2A2A,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: Chimo.image(AppAssets.giftIcon, width: 26, height: 26, fit: BoxFit.contain),
      ),
    );
  }
}

/// Cosmic Lounge 资料卡 Gift Wall 条。数据对齐 joyride `/gift-wall/list`。
class _GiftWallCard extends StatelessWidget {
  const _GiftWallCard({required this.wall, required this.onTap});

  final GiftWallListRsp wall;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // 对齐 joyride GiftWallPage 进度：receiveGift / totalGift。
    final level = wall.hasLevelInfo() ? wall.levelInfo : null;
    final unlocked = level?.receiveGift.toInt() ?? 0;
    final total = level?.totalGift.toInt() ?? 0;
    final icons = wall.itemList
        .map((item) => item.icon.trim())
        .where((icon) => icon.isNotEmpty)
        .take(4)
        .toList();

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 64,
        padding: const EdgeInsets.fromLTRB(16, 0, 12, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColors.blue0056FF, AppColors.purpleA510FF],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Gift Wall',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Unlocked: $unlocked/$total',
                    style: TextStyle(
                      color: AppColors.white.withValues(alpha: 0.85),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            if (icons.isNotEmpty) ...[
              ...List.generate(icons.length, (i) {
                return Padding(
                  padding: EdgeInsets.only(left: i == 0 ? 0 : 6),
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.black30,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Chimo.image(icons[i], width: 32, height: 32, fit: BoxFit.contain),
                  ),
                );
              }),
              const SizedBox(width: 6),
            ],
            Chimo.image(AppAssets.roomArrowRight, width: 6, height: 12, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}

/// Romance 房活动礼物快捷条。对齐 joyride「21 days to romance」。
class _RomanceGiftBar extends StatelessWidget {
  const _RomanceGiftBar({required this.couple, required this.onGift});

  final CoupleInfo couple;
  final VoidCallback onGift;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27.w),
        gradient: LinearGradient(
          colors: [
            AppColors.purple7956FF.withValues(alpha: 0.25),
            AppColors.pinkFF5BA8.withValues(alpha: 0.25),
          ],
        ),
      ),
      child: Row(
        children: [
          Text(
            '21 days to romance',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          if (couple.itemIcon.trim().isNotEmpty)
            AppImage.image(
              couple.itemIcon,
              width: 42.w,
              height: 42.w,
              fit: BoxFit.contain,
            )
          else
            Icon(Icons.card_giftcard, color: AppColors.pinkFF5BA8, size: 32.w),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: onGift,
            child: Container(
              width: 60.w,
              height: 30.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.pinkFF5BA8,
                borderRadius: BorderRadius.circular(15.w),
              ),
              child: Text(
                'Gift',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

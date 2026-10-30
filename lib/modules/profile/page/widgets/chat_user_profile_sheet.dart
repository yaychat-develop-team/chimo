import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_gift.dart';
import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/extensions/wire_view.dart';
import '../../../../common/models/server_client/gift_wall.pb.dart';
import '../../../../common/models/server_client/user.pb.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../../common/utils/zodiac.dart';
import '../../../../common/widgets/tag_chip.dart';
import '../../../chat/logic/dm_entry.dart';
import '../../../chat/model/chat_conversation.dart';
import '../../../room/logic/mic_logic.dart';
import '../../../room/service/room_service.dart';
import '../../logic/chat_user_profile_sheet_logic.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 群聊 / 房间等场景点击对方头像时的底部资料弹层。
class ChatUserProfileSheet extends StatefulWidget {
  const ChatUserProfileSheet({super.key, required this.profile});

  final User profile;

  /// 已有 [User] 时直接弹。按 uid 拉资料请走 [AppJumper.showUserProfileSheet]。
  static Future<void> show({required User profile}) {
    return AppBottomSheet.show<void>(
      isScrollControlled: true,
      barrierColor: const Color(0x73000000),
      child: ChatUserProfileSheet(profile: profile),
    );
  }

  @override
  State<ChatUserProfileSheet> createState() => _ChatUserProfileSheetState();
}

class _ChatUserProfileSheetState extends State<ChatUserProfileSheet> {
  ChatUserProfileSheetLogic get _logic {
    if (Get.isRegistered<ChatUserProfileSheetLogic>()) {
      return Get.find<ChatUserProfileSheetLogic>();
    }
    return Get.put(ChatUserProfileSheetLogic(widget.profile));
  }

  User get _profile => widget.profile;

  String get _zodiacText =>
      _profile.birthday.trim().isEmpty ? '' : Zodiac.fromBirthday(_profile.birthday);

  String get _zodiacLabel => Zodiac.chipLabel(_zodiacText);

  int get _age {
    final birth = Zodiac.parseBirthday(_profile.birthday);
    if (birth != null) {
      final now = DateTime.now();
      var age = now.year - birth.year;
      if (now.month < birth.month || (now.month == birth.month && now.day < birth.day)) {
        age -= 1;
      }
      return age.clamp(0, 120);
    }
    return _profile.age;
  }

  String get _bioDisplay {
    final bio = _profile.personalSignature.trim();
    if (bio.isNotEmpty) return bio;
    if (!_profile.genderKnown) {
      return 'They have not set up their personal signature yet.';
    }
    return _profile.male
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

  void _openChat() {
    final em = _profile.emUsername.trim();
    final conversation = ChatConversation(
      id: em.isNotEmpty ? 'dm_$em' : 'dm_${_profile.uid}',
      title: _profile.nickname,
      avatarAsset: AppAssets.avatarPlace,
      lastMessage: '',
      timeLabel: 'Just',
      isMale: _profile.male,
      signature: _profile.personalSignature,
      zodiac: _zodiacText,
      isFollowing: _logic.following.value,
      momentAssets: _profile.approvedPics,
      avatarUrl: _profile.avatar.trim().isEmpty ? null : _profile.avatar,
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
  void _openGift() {
    final room = AppGift.inRoom;
    AppGift.show(
      context,
      scene: room ? AppGiftScene.room : AppGiftScene.profile,
      receiverUid: _profile.uid,
      receiverName: _profile.nickname,
      receiverAvatar: _profile.avatar,
      popCurrent: room,
    );
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
      child: Stack(
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
            child: Obx(() {
              final following = logic.following.value;
              final wall = logic.giftWall.value;
              return Column(
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
                              _profile.nickname,
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
                                    'ID: ${_profile.uid}',
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
                          onTap: _openReport,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.white10,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Chimo.image(
                                  AppAssets.reportIcon,
                                  width: 12,
                                  height: 12,
                                  color: AppColors.white70,
                                ),
                                SizedBox(width: 4),
                                Text(
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
                      if (_zodiacLabel.isNotEmpty)
                        TagChip(
                          color: AppColors.purple5128AE,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          radius: 12,
                          child: Text(
                            _zodiacLabel,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                          ),
                        ),
                      if (_profile.genderKnown)
                        TagChip(
                          color: _profile.male ? AppColors.blue4F8BFF : AppColors.pinkFF5BA8,
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          radius: 12,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Chimo.image(
                                _profile.male ? AppAssets.genderMan : AppAssets.genderWoman,
                                width: 12,
                                height: 12,
                              ),
                              if (_age > 0) ...[
                                const SizedBox(width: 3),
                                Text(
                                  '$_age',
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
                      if ((_profile.vipSmallIcon ?? '').trim().isNotEmpty)
                        Chimo.image(
                          _profile.vipSmallIcon!.trim(),
                          height: 20,
                          fit: BoxFit.fitHeight,
                          error: const SizedBox.shrink(),
                        ),
                    ],
                  ),
                  SizedBox(height: 12.w),
                  Text(
                    _bioDisplay,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                  if (wall != null && wall.itemList.isNotEmpty) ...[
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
                          child: Chimo.s.primaryButton(label: 'Follow', onTap: logic.toggleFollow),
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
              );
            }),
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
                    _profile.avatar,
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
      ),
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

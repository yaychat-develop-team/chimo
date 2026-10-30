import 'package:chimo/common/widgets/app_blur_backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/rtc.pb.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';
import '../../../../common/widgets/app_pull_refresh.dart';
import '../../logic/room_rank_logic.dart';
import '../../model/room_format.dart';
import '../../service/room_service.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 房间排行榜。UI 对齐 Cosmic Lounge；数据对齐 joyride `getChannelUserList`。
///
/// 入口：顶栏 giftRank 头像 → Top Givers；在线人数 → Room Members。
class RoomRankSheet extends StatelessWidget {
  const RoomRankSheet({super.key});

  static Future<void> show({RoomRankTab initial = RoomRankTab.members}) {
    final rid = RoomService.findOrNull()?.rid ?? 0;
    if (rid <= 0) return Future.value();
    if (Get.isRegistered<RoomRankLogic>()) {
      Get.delete<RoomRankLogic>(force: true);
    }
    Get.put(RoomRankLogic(rid: rid, initial: initial));
    return AppBottomSheet.show<void>(
      isScrollControlled: true,
      child: const RoomRankSheet(),
    ).whenComplete(() {
      if (Get.isRegistered<RoomRankLogic>()) {
        Get.delete<RoomRankLogic>(force: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.78;
    final bottom = MediaQuery.paddingOf(context).bottom;
    return SizedBox(
      height: height,
      child: Obx(() {
        final logic = Get.find<RoomRankLogic>();
        // 订阅 tab / period / 列表，保证切换与刷新都走 Obx。
        final bg = logic.backgroundAsset;
        logic.tab.value;
        logic.period.value;
        logic.loading.value;
        logic.users.length;
        logic.error.value;
        logic.myself.value;
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              AppBlurBackdrop(blur: 28, color: AppColors.rgba(17, 17, 29, 0.9), child: Container()),
              if (bg.isNotEmpty)
                Positioned.fill(
                  child: Chimo.image(bg, fit: BoxFit.cover, alignment: Alignment.topCenter),
                ),
              Column(
                children: [
                  SizedBox(height: 24.w),
                  _Tabs(logic: logic),
                  if (logic.showPeriod) ...[
                    const SizedBox(height: 12),
                    _PeriodSwitch(logic: logic),
                  ],
                  const SizedBox(height: 8),
                  Expanded(
                    child: _Body(logic: logic, bottomInset: bottom),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({required this.logic});

  final RoomRankLogic logic;

  static const _items = <(RoomRankTab, String)>[
    (RoomRankTab.members, 'Room Members'),
    (RoomRankTab.givers, 'Top Givers'),
    (RoomRankTab.receivers, 'Top Receivers'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: _items.map((item) {
          final selected = logic.tab.value == item.$1;
          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => logic.selectTab(item.$1),
              child: Column(
                children: [
                  Text(
                    item.$2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: selected ? AppColors.white : AppColors.white60,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    height: 3,
                    width: selected ? 28 : 0,
                    decoration: BoxDecoration(
                      color: AppColors.green29EEAA,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _PeriodSwitch extends StatelessWidget {
  const _PeriodSwitch({required this.logic});

  final RoomRankLogic logic;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 168,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColors.rgba(255, 255, 255, 0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [_chip('Daily', RoomRankPeriod.daily), _chip('Weekly', RoomRankPeriod.weekly)],
      ),
    );
  }

  Widget _chip(String label, RoomRankPeriod period) {
    final on = logic.period.value == period;
    return Expanded(
      child: GestureDetector(
        onTap: () => logic.selectPeriod(period),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: on ? AppColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: on ? AppColors.black1F2518 : AppColors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.logic, required this.bottomInset});

  final RoomRankLogic logic;
  final double bottomInset;

  @override
  Widget build(BuildContext context) {
    if (logic.loading.value && logic.users.isEmpty) {
      return const Center(child: CircularProgressIndicator(color: AppColors.green29EEAA));
    }
    if (logic.error.value.isNotEmpty && logic.users.isEmpty) {
      return Center(
        child: GestureDetector(
          onTap: logic.load,
          child: Text(
            logic.error.value,
            style: const TextStyle(color: AppColors.white60, fontSize: 13),
          ),
        ),
      );
    }
    if (logic.users.isEmpty) {
      return const Center(
        child: Text('No data yet', style: TextStyle(color: AppColors.white60)),
      );
    }

    final self = logic.myself.value;
    final showSelf = logic.showValue && self != null && self.hasId();
    final bottomPad = (showSelf ? 78.0 : 16.0) + bottomInset;
    final rows = logic.listUsers;

    return Stack(
      children: [
        AppPullRefresh(
          accentColor: AppColors.green29EEAA,
          onRefresh: logic.load,
          padding: EdgeInsets.fromLTRB(12, 4, 12, bottomPad),
          slivers: [
            if (logic.showPodium)
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _Podium(users: logic.topThree),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final user = rows[index];
                return _RankRow(
                  user: user,
                  index: logic.showPodium ? index + 3 : index,
                  showValue: logic.showValue,
                  seatNo: logic.showValue ? null : logic.seatNo(user.id.toInt()),
                );
              }, childCount: rows.length),
            ),
          ],
        ),
        if (showSelf)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _SelfBar(user: self, bottomInset: bottomInset),
          ),
      ],
    );
  }
}

class _Podium extends StatelessWidget {
  const _Podium({required this.users});

  final List<SimpleChannelUser> users;

  SimpleChannelUser? _at(int rank) {
    // rank 1/2/3 → list index 0/1/2
    final i = rank - 1;
    if (i < 0 || i >= users.length) return null;
    return users[i];
  }

  @override
  Widget build(BuildContext context) {
    final first = _at(1);
    final second = _at(2);
    final third = _at(3);
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _PodiumSlot(user: second, rank: 2),
          SizedBox(width: 12.w),
          _PodiumSlot(user: first, rank: 1, elevate: true),
          SizedBox(width: 12.w),
          _PodiumSlot(user: third, rank: 3),
        ],
      ),
    );
  }
}

class _PodiumSlot extends StatelessWidget {
  const _PodiumSlot({required this.user, required this.rank, this.elevate = false});

  final SimpleChannelUser? user;
  final int rank;
  final bool elevate;

  @override
  Widget build(BuildContext context) {
    if (user == null) return const SizedBox.shrink();
    final cardBg = AppAssets.roomRankCardBg(rank);
    final frame = AppAssets.roomRankNo(rank);
    final cardW = 102.w;
    final cardH = 126.w;
    final frameSize = elevate ? 86.w : 73.w;
    final avatarSize = elevate ? 54.w : 48.w;
    final avatarOverlap = frameSize * 0.54;
    return Padding(
      padding: EdgeInsets.only(bottom: elevate ? 16.w : 0),
      child: GestureDetector(
        onTap: () => _openUser(user!),
        child: SizedBox(
          width: cardW,
          height: cardH + avatarOverlap,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: avatarOverlap,
                left: 0,
                right: 0,
                bottom: 0,
                child: cardBg.isEmpty
                    ? const SizedBox.shrink()
                    : Chimo.image(cardBg, width: cardW, height: cardH, fit: BoxFit.fill),
              ),
              Positioned(
                top: 0,
                child: SizedBox(
                  width: frameSize,
                  height: frameSize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AppImage.avatar(user!.avatar, size: avatarSize),
                      if (frame.isNotEmpty) Chimo.image(frame, width: frameSize, height: frameSize),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 6,
                right: 6,
                bottom: elevate ? 24.w : 22.w,
                height: 66.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      user!.nickname,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    _UserTags(user: user!),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Chimo.image(AppAssets.coin, width: 12, height: 12),
                        const SizedBox(width: 2),
                        Text(
                          roomCount(user!.contributionValue),
                          style: const TextStyle(
                            color: AppColors.yellowFFD400,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RankRow extends StatelessWidget {
  const _RankRow({required this.user, required this.index, required this.showValue, this.seatNo});

  final SimpleChannelUser user;
  final int index;
  final bool showValue;
  final int? seatNo;

  @override
  Widget build(BuildContext context) {
    final rankText = (user.rank > 0 ? user.rank : index + 1).toString().padLeft(2, '0');
    return GestureDetector(
      onTap: () => _openUser(user),
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 64,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.rgba(255, 255, 255, 0.04),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 28,
              child: Text(
                rankText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.white60,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 6),
            AppImage.avatar(user.avatar, size: 40.w),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.nickname,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  _UserTags(user: user),
                ],
              ),
            ),
            if (showValue)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Chimo.image(AppAssets.coin, width: 14, height: 14),
                  const SizedBox(width: 3),
                  Text(
                    roomCount(user.contributionValue),
                    style: const TextStyle(
                      color: AppColors.yellowFFD400,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
            else if (seatNo != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.white12,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Seat $seatNo',
                  style: const TextStyle(
                    color: AppColors.white70,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SelfBar extends StatelessWidget {
  const _SelfBar({required this.user, required this.bottomInset});

  final SimpleChannelUser user;
  final double bottomInset;

  @override
  Widget build(BuildContext context) {
    final rank = user.rank > 0 ? '${user.rank}'.padLeft(2, '0') : '-';
    return Container(
      height: 90.w,
      padding: EdgeInsets.fromLTRB(16, 10, 16, 10 + bottomInset),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: AppColors.rgba(35, 39, 96, 1),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      child: GestureDetector(
        onTap: () => _openUser(user),
        behavior: HitTestBehavior.opaque,
        child: Row(
          children: [
            SizedBox(
              width: 28,
              child: Text(
                rank,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 6),
            AppImage.avatar(user.avatar, size: 40.w),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.nickname,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  _UserTags(user: user),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Chimo.image(AppAssets.coin, width: 14, height: 14),
                const SizedBox(width: 3),
                Text(
                  roomCount(user.contributionValue),
                  style: const TextStyle(
                    color: AppColors.yellowFFD400,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class _AvatarBadge extends StatelessWidget {
//   const _AvatarBadge({required this.user, required this.size});

//   final SimpleChannelUser user;
//   final double size;

//   @override
//   Widget build(BuildContext context) {
//     final male = RoomRankLogic.isMale(user);
//     return SizedBox(
//       width: size,
//       height: size,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [AppImage.avatar(user.avatar, size: size)],
//       ),
//     );
//   }
// }

class _UserTags extends StatelessWidget {
  const _UserTags({required this.user});

  final SimpleChannelUser user;

  @override
  Widget build(BuildContext context) {
    final male = RoomRankLogic.isMale(user);
    final vipIcon = user.hasVipIcons() ? user.vipIcons.smallIcon.trim() : '';
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Chimo.image(male ? AppAssets.roomMale : AppAssets.roomFemale, width: 14, height: 14),
        const SizedBox(width: 4),
        if (vipIcon.isNotEmpty)
          Chimo.image(vipIcon, height: 16, fit: BoxFit.fitHeight)
        else if (user.vipLevel > 0)
          Container(
            height: 16,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white20,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${user.vipLevel}',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
    );
  }
}

void _openUser(SimpleChannelUser user) {
  AppJumper.showUserProfileSheet(
    uid: '${user.id.toInt()}',
    name: user.nickname,
    avatar: user.avatar,
  );
}

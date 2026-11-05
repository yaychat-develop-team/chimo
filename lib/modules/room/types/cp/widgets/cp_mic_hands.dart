import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forya_pag/pag.dart';
import 'package:get/get.dart';

import '../../../../../app/app_gift.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/room_cp.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../../../common/widgets/app_image.dart';
import '../../../logic/mic_logic.dart';
import '../../../model/mic_seat.dart';
import '../logic/cp_logic.dart';
import 'cp_mic_seat.dart';

/// 牵手阶段：双人位 + Bless + 进度条。对齐 joyride `CPMicHands`。
class CpMicHands extends StatelessWidget {
  const CpMicHands({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CpLogic>() || !Get.isRegistered<MicLogic>()) {
      return const SizedBox.shrink();
    }
    final logic = Get.find<CpLogic>();
    final mic = Get.find<MicLogic>();
    return Obx(() {
      logic.info.value;
      final seats = List<MicSeat>.from(mic.seats);
      final emotes = Map<int, String>.from(mic.micEmotes);
      final hands = logic.info.value.hasHandsInfo() ? logic.info.value.handsInfo : CPHandsInfo();
      final pair = _resolvePair(logic, seats, hands);
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _HandsTitle(title: hands.currentTitle),
          SizedBox(
            width: 292.w,
            height: 202.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Chimo.image(AppAssets.cpHandsTop, width: 292, height: 202),
                if ((hands.uid1.toInt()) > 0 && (hands.uid2.toInt()) > 0)
                  Positioned(
                    top: 57.w,
                    child: _PairMics(user1: pair.$1, user2: pair.$2, mic: mic, emotes: emotes),
                  ),
                Positioned(
                  bottom: 22.w,
                  child: GestureDetector(
                    onTap: () => AppGift.show(context, scene: AppGiftScene.room),
                    child: Container(
                      width: 80.w,
                      height: 28.w,
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        color: Color(0xFFFF5780),
                      ),
                      child: Text(
                        'Bless them',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 3.w),
          if (hands.progressItems.isNotEmpty) _ProgressBar(hands: hands),
          if (hands.progressDesc.isNotEmpty) ...[
            SizedBox(height: 3.w),
            _ProgressDesc(text: hands.progressDesc),
          ],
        ],
      );
    });
  }

  (MicSeat, MicSeat) _resolvePair(CpLogic logic, List<MicSeat> seats, CPHandsInfo hands) {
    MicSeat? byUid(int uid) {
      if (uid <= 0) return null;
      for (final seat in seats) {
        if (seat.uid == uid) return seat;
      }
      return null;
    }

    MicSeat at(int index) {
      if (index < 0 || index >= seats.length) return logic.seatAt(index);
      return seats[index];
    }

    var u1 = byUid(hands.uid1.toInt());
    var u2 = byUid(hands.uid2.toInt());
    final used = <int>{0, u1?.index ?? -1, u2?.index ?? -1};
    u1 ??= at(List.generate(8, (i) => i).firstWhere((i) => !used.contains(i), orElse: () => 1));
    used.add(u1.index);
    u2 ??= at(List.generate(8, (i) => i).firstWhere((i) => !used.contains(i), orElse: () => 2));
    return (u1, u2);
  }
}

class _HandsTitle extends StatelessWidget {
  const _HandsTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.w,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Chimo.image(AppAssets.cpHandsTitle, width: 61, height: 39),
          if (title.isNotEmpty) ...[
            Positioned(
              top: 51.w,
              child: Chimo.image(AppAssets.cpHandsTitleArrow, width: 8, height: 3.5),
            ),
            Container(
              height: 23.w,
              margin: EdgeInsets.only(top: 28.w),
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              alignment: Alignment.center,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                gradient: LinearGradient(colors: [Color(0xFFEE99D4), Color(0xFFEB5577)]),
              ),
              child: Text(
                title,
                style: TextStyle(color: AppColors.white, fontSize: 14.sp),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PairMics extends StatelessWidget {
  const _PairMics({
    required this.user1,
    required this.user2,
    required this.mic,
    required this.emotes,
  });

  final MicSeat user1;
  final MicSeat user2;
  final MicLogic mic;
  final Map<int, String> emotes;

  String _emote(int? uid) {
    if (uid == null || uid <= 0) return '';
    return emotes[uid]?.trim() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 107.w,
      height: 76.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 64.w,
            left: 0,
            right: 0,
            child: Container(
              height: 15.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColors.black.withValues(alpha: 0.46),
                    Colors.transparent,
                  ],
                  stops: const [0, 0.5, 1],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: CpMicSeat(
              seat: user1,
              position: user1.index,
              size: 58,
              nickWidth: 48,
              borderColor: const Color(0xFFDE57F7),
              anchor: mic.anchorFor(user1),
              emoteUrl: _emote(user1.uid),
              showHot: false,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CpMicSeat(
              seat: user2,
              position: user2.index,
              size: 58,
              nickWidth: 48,
              borderColor: const Color(0xFFDE57F7),
              anchor: mic.anchorFor(user2),
              emoteUrl: _emote(user2.uid),
              showHot: false,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.hands});

  final CPHandsInfo hands;

  @override
  Widget build(BuildContext context) {
    final width = 300.w;
    final icon = 24.w;
    final total = math.max(1, hands.totalProgress.toInt());
    final ratio = math.min(1.0, hands.currentProgress.toInt() / total);
    final children = <Widget>[
      Container(
        height: 6.w,
        width: width,
        decoration: ShapeDecoration(
          color: AppColors.rgba(83, 17, 148, 0.7),
          shape: StadiumBorder(),
        ),
      ),
      Container(
        height: 6.w,
        width: ratio * width,
        decoration: const ShapeDecoration(
          // 设计图霓虹紫粉，对齐 heartbeat 氛围（非橙红）。
          gradient: LinearGradient(
            colors: [Color(0xFFC26BFF), Color(0xFFFF5AC8), Color(0xFFFF5780)],
          ),
          shape: StadiumBorder(),
        ),
      ),
    ];
    for (final item in hands.progressItems) {
      children.add(
        Positioned(
          left: (item.progress / total) * width - icon / 2,
          child: _ProgressIcon(
            item: item,
            gray: item.progress > hands.currentProgress.toInt(),
            size: icon,
          ),
        ),
      );
    }
    return SizedBox(
      width: width,
      height: icon,
      child: Stack(alignment: Alignment.centerLeft, clipBehavior: Clip.none, children: children),
    );
  }
}

class _ProgressIcon extends StatelessWidget {
  const _ProgressIcon({required this.item, required this.gray, required this.size});

  final CPProgressItem item;
  final bool gray;
  final double size;

  @override
  Widget build(BuildContext context) {
    final child = item.dynamicStyle.isNotEmpty && !gray
        ? PAGView.network(item.dynamicStyle, width: size, height: size, autoPlay: true)
        : AppImage.image(item.icon, width: size, height: size);
    if (!gray) return child;
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
      ]),
      child: child,
    );
  }
}

class _ProgressDesc extends StatelessWidget {
  const _ProgressDesc({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26.w,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: 18.w,
            margin: EdgeInsets.only(right: 10.w),
            padding: EdgeInsets.only(left: 8.w, right: 12.w),
            alignment: Alignment.center,
            decoration: const ShapeDecoration(color: Color(0xFFEB5577), shape: StadiumBorder()),
            child: Text(
              text,
              style: TextStyle(fontSize: 11.sp, color: AppColors.white),
            ),
          ),
          Chimo.image(AppAssets.cpProgressEnd, width: 24, height: 26),
        ],
      ),
    );
  }
}

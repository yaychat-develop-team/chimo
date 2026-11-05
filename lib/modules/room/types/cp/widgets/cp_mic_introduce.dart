import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forya_pag/pag.dart';
import 'package:get/get.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/room_cp.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../logic/mic_logic.dart';
import '../../../model/mic_seat.dart';
import '../../../service/room_service.dart';
import '../logic/cp_logic.dart';
import 'cp_mic_seat.dart';

/// 自我介绍阶段：6 嘉宾环形麦 + 热度心形。对齐 joyride `CPMicIntroduce`。
class CpMicIntroduce extends StatelessWidget {
  const CpMicIntroduce({super.key});

  static double get _w => 290.w;
  static double get _h => 256.w;
  static double get _avatar => 52.w;

  /// index → [left, top]，嘉宾位 1–6。
  /// 左右对称：1↔6、2↔5、3↔4，left_right = width - left_left - avatar。
  Map<int, List<double>> get _offsets => {
        0: [57.w, 0], // 1
        1: [0, 91.w], // 2
        2: [57.w, _h - 73.w], // 3
        3: [_w - 57.w - _avatar, _h - 73.w], // 4 = mirror 3
        4: [_w - _avatar, 91.w], // 5 = mirror 2
        5: [_w - 57.w - _avatar, 0], // 6 = mirror 1
      };

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CpLogic>() || !Get.isRegistered<MicLogic>()) {
      return const SizedBox.shrink();
    }
    final logic = Get.find<CpLogic>();
    final mic = Get.find<MicLogic>();
    return Obx(() {
      logic.info.value;
      final showHot = RoomService.findOrNull()?.giftValueCountSwitch.value ?? false;
      final seats = List<MicSeat>.from(mic.seats);
      final emotes = Map<int, String>.from(mic.micEmotes);
      final List<CPNewHotItem> hotItems = logic.info.value.hasHotInfo()
          ? logic.info.value.hotInfo.newItems.toList()
          : const <CPNewHotItem>[];
      final children = <Widget>[
        Chimo.image(AppAssets.cpMainBg, width: 280, height: 246),
        PAGView.asset(
          AppAssets.cpHeartBg,
          width: 280.w,
          height: 246.w,
          autoPlay: true,
          repeatCount: PAGView.REPEAT_COUNT_LOOP,
        ),
      ];
      for (var i = 0; i < hotItems.length; i++) {
        children.add(_heart(i, hotItems[i].heart.toInt()));
      }
      for (var i = 0; i < 6; i++) {
        final seat = i + 1 < seats.length ? seats[i + 1] : logic.seatAt(i + 1);
        children.add(
          AnimatedPositioned(
            key: ValueKey('cp_intro_${i}_${seat.uid ?? 0}'),
            duration: const Duration(seconds: 1),
            left: _offsets[i]![0],
            top: _offsets[i]![1],
            child: CpMicSeat(
              seat: seat,
              position: i + 1,
              size: 52,
              anchor: mic.anchorFor(seat),
              emoteUrl: _emoteOf(emotes, seat.uid),
              showHot: showHot,
            ),
          ),
        );
      }
      return SizedBox(
        width: _w,
        height: _h,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: children,
        ),
      );
    });
  }

  static String _emoteOf(Map<int, String> emotes, int? uid) {
    if (uid == null || uid <= 0) return '';
    return emotes[uid]?.trim() ?? '';
  }

  Widget _heart(int index, int value) {
    if (value <= 0) return const SizedBox.shrink();
    if (index == 0) {
      return Positioned(
        top: 96.w,
        child: Container(
          width: 204.w,
          height: 62.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: Chimo.decorationImage(AppAssets.cpMicHeart1, fit: BoxFit.cover),
          ),
          child: Text(
            '$value',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }
    return Positioned(
      top: index == 1 ? 10.w : null,
      bottom: index == 2 ? 26.w : null,
      child: Container(
        width: 85.w,
        height: 30.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: Chimo.decorationImage(AppAssets.cpMicHeart2, fit: BoxFit.cover),
        ),
        child: Text(
          '$value',
          style: TextStyle(color: AppColors.white, fontSize: 10.sp),
        ),
      ),
    );
  }
}

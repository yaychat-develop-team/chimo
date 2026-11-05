import 'dart:async';

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
import 'cp_action_bottom.dart';
import 'cp_mic_choose.dart';
import 'cp_mic_hands.dart';
import 'cp_mic_introduce.dart';
import 'cp_stage_header.dart';

/// CP 主舞台。对齐 joyride `CPRoomMain`。
class CpMicArea extends StatelessWidget {
  const CpMicArea({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CpLogic>() || !Get.isRegistered<MicLogic>()) {
      return const SizedBox.shrink();
    }
    final logic = Get.find<CpLogic>();
    final mic = Get.find<MicLogic>();
    return Obx(() {
      logic.info.value;
      logic.stageAnim.value;
      // 订阅整表，避免只读 length 时麦位内容变更不刷新。
      final seats = List<MicSeat>.from(mic.seats);
      seats.length;
      final stage = logic.stage;
      final anim = logic.stageAnim.value;
      return Padding(
        padding: EdgeInsets.only(top: 8.w),
        child: SizedBox(
          width: 1.sw,
          height: 400.w,
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 68.w,
                child: PAGView.asset(
                  AppAssets.cpStarBg,
                  width: 1.sw,
                  autoPlay: true,
                  repeatCount: PAGView.REPEAT_COUNT_LOOP,
                ),
              ),
              const CpStageHeader(),
              Positioned(
                top: stage == CPStage.hand ? 49.w : 68.w,
                child: _stageBody(stage),
              ),
              if (anim.isNotEmpty)
                Positioned(
                  top: 38.w,
                  child: PAGView.asset(
                    _stagePag(anim),
                    width: 1.sw,
                    autoPlay: true,
                    onAnimationEnd: logic.clearStageAnim,
                  ),
                ),
              const Positioned(
                bottom: 0,
                child: CpActionBottom(),
              ),
              const Positioned(
                right: 0,
                bottom: 0,
                child: _RoomCountDown(),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _stageBody(CPStage stage) {
    switch (stage) {
      case CPStage.choose:
        return const CpMicChoose();
      case CPStage.hand:
        return const CpMicHands();
      case CPStage.end:
        return const SizedBox.shrink();
      case CPStage.none:
      case CPStage.introduce:
      default:
        return const CpMicIntroduce();
    }
  }

  String _stagePag(String key) {
    switch (key) {
      case 'choose':
        return AppAssets.cpStageChoose;
      case 'hand':
        return AppAssets.cpStageHands;
      case 'introduce':
      default:
        return AppAssets.cpStageIntroduce;
    }
  }
}

class _RoomCountDown extends StatefulWidget {
  const _RoomCountDown();

  @override
  State<_RoomCountDown> createState() => _RoomCountDownState();
}

class _RoomCountDownState extends State<_RoomCountDown> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _fmt(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final room = RoomService.findOrNull();
    if (room == null) return const SizedBox.shrink();
    return Obx(() {
      final at = room.countDownAt.value;
      if (at <= 0) return const SizedBox.shrink();
      final left = at - DateTime.now().millisecondsSinceEpoch ~/ 1000;
      if (left <= 0) return const SizedBox.shrink();
      return Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: 59.w,
            height: 20.w,
            margin: EdgeInsets.only(left: 6.w),
            padding: EdgeInsets.only(left: 19.w),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.horizontal(left: Radius.circular(10.r)),
              border: Border.all(color: AppColors.white.withValues(alpha: 0.3)),
            ),
            child: Text(
              _fmt(left),
              style: TextStyle(color: AppColors.white, fontSize: 11.sp),
            ),
          ),
          Chimo.image(AppAssets.cpCountDown, width: 28, height: 28),
        ],
      );
    });
  }
}


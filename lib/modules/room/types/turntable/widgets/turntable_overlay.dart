import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../service/room_service.dart';
import '../logic/turntable_logic.dart';
import 'turntable_wheel.dart';

/// 转盘全屏蒙层。对齐 joyride `RoomTurntableWidget`。
class TurntableOverlay extends StatelessWidget {
  const TurntableOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<TurntableLogic>()) return const SizedBox.shrink();
    final logic = Get.find<TurntableLogic>();
    return Obx(() {
      // tick：_info 非 obs，靠 tick 驱动展示刷新。
      logic.tick.value;
      if (!logic.show) return const SizedBox.shrink();
      final info = logic.info;
      if (info == null) return const SizedBox.shrink();
      final status = logic.status.value;
      final room = RoomService.findOrNull();
      return ColoredBox(
        color: Colors.black.withValues(alpha: 0.8),
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  TurntableWheel(
                    info: info,
                    status: status,
                    stopId: logic.stopId,
                    onBtnTap: () {
                      if (logic.isRotating) return;
                      logic.start();
                    },
                    onRotateStop: logic.onRotateStop,
                  ),
                  PositionedDirectional(
                    top: 18.w,
                    end: 20.w,
                    child: GestureDetector(
                      onTap: logic.hide,
                      child: Chimo.image(AppAssets.turntableHide, width: 28, height: 28),
                    ),
                  ),
                ],
              ),
              if (room?.isStaff ?? false)
                GestureDetector(
                  onTap: () async {
                    await logic.disable();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.w),
                    decoration: BoxDecoration(
                      color: const Color(0x80270140),
                      borderRadius: BorderRadius.circular(24.w),
                      border: Border.all(color: Colors.white38),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Chimo.image(AppAssets.turntableClose, width: 20, height: 20),
                        SizedBox(width: 4.w),
                        Text(
                          'End Game',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}

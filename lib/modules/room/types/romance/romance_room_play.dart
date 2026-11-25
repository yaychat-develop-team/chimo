import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/chimo_api.dart';
import '../../../../common/models/server_client/rtc.pb.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/app_toast.dart';
import '../../logic/mic_logic.dart';
import '../../play/room_play.dart';
import '../../service/room_service.dart';
import '../../socket/room_msg_handler.dart';

/// Romance / NEWBIE 派单房。对齐 joyride `RomancePlugin` + `RomanceRoomPageBuilder`。
class RomanceRoomPlay implements RoomPlay {
  const RomanceRoomPlay();

  @override
  String get id => 'romance';

  @override
  bool get isTemplate => true;

  @override
  bool supports(Channel channel) {
    if (!channel.hasRoomTypeObj()) return false;
    return channel.roomTypeObj.type == RoomType.NEWBIE;
  }

  @override
  Future<void> onJoined(RoomService room) async {
    // 进房约 10s 自动搭讪（在房）。
    unawaited(
      Future<void>.delayed(const Duration(seconds: 10)).then((_) {
        if (!room.inRoom.value) return;
        ChimoApis.romance.autoStrike(1);
      }),
    );
  }

  @override
  Future<void> onLeave() async {}

  @override
  List<RoomMsgHandler> msgHandlers(RoomService room) => const [];

  @override
  Widget buildSlot() => const RomanceInviteHostSlot();

  @override
  Widget? buildMicArea(BuildContext context) => null;

  @override
  Widget? buildBackdrop(BuildContext context) => null;

  @override
  Widget? buildOverlay(BuildContext context) => null;

  @override
  List<Widget> buildTopPills(BuildContext context) => const [];
}

/// 本人在 0 号麦时显示「Invite the Host」。
class RomanceInviteHostSlot extends StatelessWidget {
  const RomanceInviteHostSlot({super.key});

  Future<void> _invite(RoomService room) async {
    final res = await ChimoApis.romance.dispatchRoom('${room.rid}');
    if (res.ok) {
      AppToast.info('Invite the Host Success');
    } else {
      AppToast.info(res.message.isEmpty ? 'Invite failed' : res.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final room = RoomService.findOrNull();
    if (room == null || !Get.isRegistered<MicLogic>()) {
      return const SizedBox.shrink();
    }
    return Obx(() {
      final mic = Get.find<MicLogic>();
      // 触发 seats 依赖。
      final _ = mic.seats.length;
      final onHost = mic.onMic && room.userMicPosition(mic.myUid) == 0;
      if (!onHost) return const SizedBox.shrink();
      return Padding(
        padding: EdgeInsets.only(top: 8.w, bottom: 4.w),
        child: Center(
          child: GestureDetector(
            onTap: () => _invite(room),
            child: Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppColors.white10,
                borderRadius: BorderRadius.circular(18.w),
              ),
              child: Container(
                width: 136.w,
                height: 32.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.w),
                  gradient: const LinearGradient(
                    colors: [AppColors.pinkFC5CC6, AppColors.pinkFC475F],
                  ),
                ),
                child: Text(
                  'Invite the Host',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common/models/server_client/rtc.pb.dart';
import '../../play/room_play.dart';
import '../../service/room_service.dart';
import '../../socket/room_msg_handler.dart';
import 'logic/turntable_logic.dart';
import 'socket/turntable_msg_handler.dart';
import 'widgets/turntable_entry.dart';
import 'widgets/turntable_overlay.dart';

/// 房间转盘。跨房型叠加能力。对齐 joyride `room_turntable` 插件。
class TurntableRoomPlay implements RoomPlay {
  const TurntableRoomPlay();

  @override
  String get id => 'turntable';

  @override
  bool get isTemplate => false;

  /// 与 joyride 一致：始终挂载，由 [TurntableLogic.enabled] 控制 UI。
  @override
  bool supports(Channel channel) => true;

  @override
  Future<void> onJoined(RoomService room) async {
    final logic = Get.isRegistered<TurntableLogic>()
        ? Get.find<TurntableLogic>()
        : Get.put(TurntableLogic(), permanent: true);
    await logic.loadExt();
  }

  @override
  Future<void> onLeave() async {
    if (Get.isRegistered<TurntableLogic>()) {
      await Get.delete<TurntableLogic>(force: true);
    }
  }

  @override
  List<RoomMsgHandler> msgHandlers(RoomService room) {
    if (!Get.isRegistered<TurntableLogic>()) return const [];
    return [TurntableMsgHandler(Get.find<TurntableLogic>())];
  }

  @override
  Widget buildSlot() => const Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Padding(
          padding: EdgeInsetsDirectional.only(end: 8),
          child: TurntableEntry(),
        ),
      );

  @override
  Widget? buildMicArea(BuildContext context) => null;

  @override
  Widget? buildBackdrop(BuildContext context) => null;

  @override
  Widget? buildOverlay(BuildContext context) => const TurntableOverlay();

  @override
  List<Widget> buildTopPills(BuildContext context) => const [];
}

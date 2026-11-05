import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common/models/server_client/rtc.pb.dart';
import '../../play/room_play.dart';
import '../../service/room_service.dart';
import '../../socket/room_msg_handler.dart';
import 'logic/cp_logic.dart';
import 'socket/cp_msg_handler.dart';
import 'widgets/cp_heart_list_pill.dart';
import 'widgets/cp_mic_area.dart';
import 'widgets/cp_overlay.dart';

/// CP 房模板。对照 joyride `CPRoomPlugin` / `CPRoomPageBuilder`。
class CpRoomPlay implements RoomPlay {
  const CpRoomPlay();

  @override
  String get id => 'cp';

  @override
  bool get isTemplate => true;

  @override
  bool supports(Channel channel) {
    if (!channel.hasRoomTypeObj()) return false;
    return channel.roomTypeObj.type == RoomType.CP;
  }

  @override
  Future<void> onJoined(RoomService room) async {
    final logic = Get.isRegistered<CpLogic>()
        ? Get.find<CpLogic>()
        : Get.put(CpLogic(), permanent: true);
    await logic.loadExt();
  }

  @override
  Future<void> onLeave() async {
    if (Get.isRegistered<CpLogic>()) {
      await Get.delete<CpLogic>(force: true);
    }
  }

  @override
  List<RoomMsgHandler> msgHandlers(RoomService room) {
    if (!Get.isRegistered<CpLogic>()) return const [];
    return [CpMsgHandler(Get.find<CpLogic>())];
  }

  @override
  Widget buildSlot() => const SizedBox.shrink();

  @override
  Widget? buildMicArea(BuildContext context) => const CpMicArea();

  @override
  Widget? buildBackdrop(BuildContext context) => null;

  @override
  Widget? buildOverlay(BuildContext context) => const CpOverlay();

  @override
  List<Widget> buildTopPills(BuildContext context) => const [CpHeartListPill()];
}

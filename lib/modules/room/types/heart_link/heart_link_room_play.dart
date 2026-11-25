import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common/models/server_client/rtc.pb.dart';
import '../../play/room_play.dart';
import '../../service/room_service.dart';
import '../../socket/room_msg_handler.dart';
import 'logic/heart_link_logic.dart';
import 'socket/heart_link_msg_handler.dart';
import 'widgets/heart_link_mic_area.dart';
import 'widgets/heart_link_overlay.dart';

/// Heart Link 三人房模板。对照 joyride `HeartLinkPlugin`。
class HeartLinkRoomPlay implements RoomPlay {
  const HeartLinkRoomPlay();

  @override
  String get id => 'heart_link';

  @override
  bool get isTemplate => true;

  @override
  bool supports(Channel channel) {
    if (!channel.hasRoomTypeObj()) return false;
    return channel.roomTypeObj.type == RoomType.HEART_LINK;
  }

  @override
  Future<void> onJoined(RoomService room) async {
    final logic = Get.isRegistered<HeartLinkLogic>()
        ? Get.find<HeartLinkLogic>()
        : Get.put(HeartLinkLogic(), permanent: true);
    await logic.loadExt();
  }

  @override
  Future<void> onLeave() async {
    if (Get.isRegistered<HeartLinkLogic>()) {
      await Get.delete<HeartLinkLogic>(force: true);
    }
  }

  @override
  List<RoomMsgHandler> msgHandlers(RoomService room) {
    if (!Get.isRegistered<HeartLinkLogic>()) return const [];
    return [HeartLinkMsgHandler(Get.find<HeartLinkLogic>())];
  }

  @override
  Widget buildSlot() => const SizedBox.shrink();

  @override
  Widget? buildMicArea(BuildContext context) => const HeartLinkMicArea();

  @override
  Widget? buildBackdrop(BuildContext context) => null;

  @override
  Widget? buildOverlay(BuildContext context) => const HeartLinkOverlay();

  @override
  List<Widget> buildTopPills(BuildContext context) => const [];
}

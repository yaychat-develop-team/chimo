import 'package:flutter/widgets.dart';

import '../../../../common/models/server_client/rtc.pb.dart';
import '../../play/room_play.dart';
import '../../service/room_service.dart';
import '../../socket/room_msg_handler.dart';
import 'widgets/joy_ride_mic_area.dart';

/// 兜风房：双麦布局（对照 m_chatroom `DoufengMicSeatWidget`）。
class JoyRideRoomPlay implements RoomPlay {
  const JoyRideRoomPlay();

  @override
  String get id => 'joy_ride';

  @override
  bool get isTemplate => true;

  @override
  bool supports(Channel channel) {
    if (!channel.hasRoomTypeObj()) return false;
    return channel.roomTypeObj.type == RoomType.JOY_RIDE;
  }

  @override
  Future<void> onJoined(RoomService room) async {}

  @override
  Future<void> onLeave() async {}

  @override
  List<RoomMsgHandler> msgHandlers(RoomService room) => const [];

  @override
  Widget buildSlot() => const SizedBox.shrink();

  @override
  Widget? buildMicArea(BuildContext context) => const JoyRideMicArea();

  @override
  Widget? buildBackdrop(BuildContext context) => null;

  @override
  Widget? buildOverlay(BuildContext context) => null;

  @override
  List<Widget> buildTopPills(BuildContext context) => const [];
}

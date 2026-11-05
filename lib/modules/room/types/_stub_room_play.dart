import 'package:flutter/widgets.dart';

import '../../../common/models/server_client/rtc.pb.dart';
import '../play/room_play.dart';
import '../service/room_service.dart';
import '../socket/room_msg_handler.dart';

/// 未实现房型的占位。命中条件先关掉，避免抢普通房。
abstract class StubRoomPlay implements RoomPlay {
  const StubRoomPlay();

  @override
  bool get isTemplate => true;

  @override
  bool supports(Channel channel) => false;

  @override
  Future<void> onJoined(RoomService room) async {}

  @override
  Future<void> onLeave() async {}

  @override
  List<RoomMsgHandler> msgHandlers(RoomService room) => const [];

  @override
  Widget buildSlot() => const SizedBox.shrink();

  @override
  Widget? buildMicArea(BuildContext context) => null;

  @override
  Widget? buildBackdrop(BuildContext context) => null;

  @override
  Widget? buildOverlay(BuildContext context) => null;

  @override
  List<Widget> buildTopPills(BuildContext context) => const [];
}

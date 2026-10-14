import 'package:flutter/widgets.dart';

import '../../../common/models/server_client/rtc.pb.dart';
import '../service/room_service.dart';
import '../socket/room_msg_handler.dart';
import 'room_play.dart';

/// 普通语音房。本期不画玩法区，也不注册额外消息。
class VoiceRoomPlay implements RoomPlay {
  @override
  String get id => 'voice';

  @override
  bool supports(Channel channel) {
    if (!channel.hasRoomTypeObj()) return true;
    switch (channel.roomTypeObj.type) {
      case RoomType.MAKE_FRIENDS:
      case RoomType.NEWBIE:
      case RoomType.HOT_HALL:
        return true;
      default:
        return false;
    }
  }

  @override
  Future<void> onJoined(RoomService room) async {}

  @override
  Future<void> onLeave() async {}

  @override
  List<RoomMsgHandler> msgHandlers(RoomService room) => const [];

  @override
  Widget buildSlot() => const SizedBox.shrink();
}

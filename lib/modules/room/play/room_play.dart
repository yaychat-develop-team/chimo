import 'package:flutter/widgets.dart';

import '../../../common/models/server_client/rtc.pb.dart';
import '../service/room_service.dart';
import '../socket/room_msg_handler.dart';
import 'voice_room_play.dart';

/// 一种房间玩法。进房后由 [RoomPlays.resolve] 挂上，退房时逆序卸下。
abstract class RoomPlay {
  String get id;

  bool supports(Channel channel);

  Future<void> onJoined(RoomService room);

  Future<void> onLeave();

  List<RoomMsgHandler> msgHandlers(RoomService room);

  /// 画在麦位和公屏之间。没有界面时返回空组件。
  Widget buildSlot();
}

/// 玩法登记点。新增玩法只加一个类，再放进这里。
abstract final class RoomPlays {
  static List<RoomPlay> resolve(Channel channel) {
    return [
      for (final play in [VoiceRoomPlay()])
        if (play.supports(channel)) play,
    ];
  }
}

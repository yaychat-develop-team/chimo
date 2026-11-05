import 'package:flutter/widgets.dart';

import '../../../../common/models/server_client/rtc.pb.dart';
import '../../play/room_play.dart';
import '../../service/room_service.dart';
import '../../socket/room_msg_handler.dart';

/// 普通语音房。不画玩法区，也不注册额外消息。
///
/// 短期仍兼容 [RoomType.HOT_HALL]；[RoomType.NEWBIE] 交给浪漫房。
class VoiceRoomPlay implements RoomPlay {
  @override
  String get id => 'voice';

  @override
  bool get isTemplate => false;

  @override
  bool supports(Channel channel) {
    if (!channel.hasRoomTypeObj()) return true;
    switch (channel.roomTypeObj.type) {
      case RoomType.MAKE_FRIENDS:
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

  @override
  Widget? buildMicArea(BuildContext context) => null;

  @override
  Widget? buildBackdrop(BuildContext context) => null;

  @override
  Widget? buildOverlay(BuildContext context) => null;

  @override
  List<Widget> buildTopPills(BuildContext context) => const [];
}

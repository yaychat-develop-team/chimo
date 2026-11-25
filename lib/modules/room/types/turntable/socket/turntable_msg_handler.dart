import '../../../../../common/models/server_client/message.pb.dart';
import '../../../../../common/models/server_client/room_turntable.pb.dart';
import '../../../../../common/utils/app_log.dart';
import '../../../socket/room_msg_handler.dart';
import '../logic/turntable_logic.dart';

/// 转盘专属 Scene。对齐 joyride `TurntableMsgHandler`。
class TurntableMsgHandler implements RoomMsgHandler {
  TurntableMsgHandler(this.logic);

  final TurntableLogic logic;

  @override
  bool supports(Message message) => message.data.scene == Scene.ROOM_TURNTABLE;

  @override
  void handle(Message message) {
    try {
      final info = message.data.content.unpackInto(TurntableInfo());
      AppLog.d('TurntableInfo stopId=${info.stopId}');
      logic.onTurntableMsg(info);
    } catch (error) {
      AppLog.w('TurntableMsgHandler failed', error: error);
    }
  }
}

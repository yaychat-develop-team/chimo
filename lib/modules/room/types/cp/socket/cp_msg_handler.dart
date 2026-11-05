import '../../../../../common/models/server_client/message.pb.dart';
import '../../../../../common/models/server_client/room_cp.pb.dart';
import '../../../../../common/utils/app_log.dart';
import '../../../socket/room_msg_handler.dart';
import '../logic/cp_logic.dart';

/// CP 专属 Scene。对齐 joyride `CPMsgHandler`。
class CpMsgHandler implements RoomMsgHandler {
  CpMsgHandler(this.logic);

  final CpLogic logic;

  @override
  bool supports(Message message) {
    final scene = message.data.scene;
    return scene == Scene.CP_ROOM_STATE ||
        scene == Scene.CP_ROOM_HANDS_HEART_VALUE ||
        scene == Scene.CP_ROOM_PAIR_EFFECT;
  }

  @override
  void handle(Message message) {
    final scene = message.data.scene;
    try {
      if (scene == Scene.CP_ROOM_HANDS_HEART_VALUE) {
        final change = message.data.content.unpackInto(CPHandsHeartChangeInfo());
        logic.applyHandsHeart(change);
        return;
      }
      if (scene == Scene.CP_ROOM_PAIR_EFFECT) {
        final change = message.data.content.unpackInto(CpPairChange());
        logic.applyPairEffect(change);
        return;
      }
      final next = message.data.content.unpackInto(CPInfo());
      logic.apply(next);
    } catch (error) {
      AppLog.w('CpMsgHandler failed scene=$scene', error: error);
    }
  }
}

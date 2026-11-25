import '../../../../../app/app_jumper.dart';
import '../../../../../common/models/server_client/heart_link.pb.dart';
import '../../../../../common/models/server_client/message.pb.dart';
import '../../../../../common/utils/app_log.dart';
import '../../../socket/room_msg_handler.dart';
import '../logic/heart_link_logic.dart';

/// Heart Link 专属 Scene。对齐 joyride `HtMsgHandler`。
class HeartLinkMsgHandler implements RoomMsgHandler {
  HeartLinkMsgHandler(this.logic);

  final HeartLinkLogic logic;

  @override
  bool supports(Message message) {
    final scene = message.data.scene;
    return scene == Scene.USER_JOIN ||
        scene == Scene.HEART_LINK_SUCCESS ||
        scene == Scene.UNLOCK_HEART_LINK_CARD ||
        scene == Scene.GRANT_UP_TO_MIC ||
        scene == Scene.USER_VIEW_HEART_LINK_CARD ||
        scene == Scene.NEW_USER_JOIN_ROOM ||
        scene == Scene.JOIN_PRIVATE_ROOM;
  }

  @override
  void handle(Message message) {
    final scene = message.data.scene;
    try {
      switch (scene) {
        case Scene.USER_JOIN:
          logic.onUserJoin();
        case Scene.HEART_LINK_SUCCESS:
          logic.onHeartLinkSuccess(message.data.content.unpackInto(HeartLinkInfo()));
        case Scene.UNLOCK_HEART_LINK_CARD:
          logic.onUnlockCard(message.data.content.unpackInto(HeartLinkInfo()));
        case Scene.GRANT_UP_TO_MIC:
          logic.onGrantUpToMic();
        case Scene.USER_VIEW_HEART_LINK_CARD:
          logic.onViewCardNotice(message.data.content.unpackInto(HeartLinkInfo()));
        case Scene.NEW_USER_JOIN_ROOM:
          logic.onNewUserJoin(message.data.content.unpackInto(HeartLinkInfo()));
        case Scene.JOIN_PRIVATE_ROOM:
          final rid = message.data.content.unpackInto(HeartLinkInfo()).rid.toInt();
          if (rid > 0) {
            Future.microtask(() => AppJumper.toRoom(rid));
          }
        default:
          break;
      }
    } catch (error) {
      AppLog.w('HeartLinkMsgHandler failed scene=$scene', error: error);
    }
  }
}

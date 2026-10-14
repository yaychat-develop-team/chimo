import '../../../common/models/server_client/message.pb.dart';

/// 房间 socket 上的一种消息处理。玩法和公屏、麦位都实现它，由 [RoomSocket] 分发。
abstract class RoomMsgHandler {
  bool supports(Message message);

  void handle(Message message);
}

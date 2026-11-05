import '../../../../../common/models/server_client/auction.pb.dart';
import '../../../../../common/models/server_client/message.pb.dart';
import '../../../../../common/utils/app_log.dart';
import '../../../socket/room_msg_handler.dart';
import '../logic/auction_logic.dart';
import '../widgets/auction_result_dialogs.dart';

/// 拍卖专属 Scene。对齐 joyride `AuctionMsgHandler`。
class AuctionMsgHandler implements RoomMsgHandler {
  AuctionMsgHandler(this.logic);

  final AuctionLogic logic;

  @override
  bool supports(Message message) {
    final scene = message.data.scene;
    return scene == Scene.AUCTION_ROOM_CHANGE || scene == Scene.ARTIST_AUCTION_RESULT;
  }

  @override
  void handle(Message message) {
    final scene = message.data.scene;
    try {
      if (scene == Scene.AUCTION_ROOM_CHANGE) {
        final next = message.data.content.unpackInto(Auction.create());
        logic.apply(next);
        return;
      }
      if (scene == Scene.ARTIST_AUCTION_RESULT) {
        final result = message.data.content.unpackInto(AuctionResult.create());
        if (result.success) {
          AuctionResultDialogs.showSuccess(result);
        } else {
          AuctionResultDialogs.showFail();
        }
      }
    } catch (error) {
      AppLog.w('AuctionMsgHandler failed scene=$scene', error: error);
    }
  }
}

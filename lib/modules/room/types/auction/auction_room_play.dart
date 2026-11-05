import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common/models/server_client/rtc.pb.dart';
import '../../play/room_play.dart';
import '../../service/room_service.dart';
import '../../socket/room_msg_handler.dart';
import 'logic/auction_logic.dart';
import 'socket/auction_msg_handler.dart';
import 'widgets/auction_backdrop.dart';
import 'widgets/auction_mic_area.dart';
import 'widgets/auction_overlay.dart';

/// 拍卖房模板。对照 m_chatroom `AuctionPlugin`。
class AuctionRoomPlay implements RoomPlay {
  const AuctionRoomPlay();

  @override
  String get id => 'auction';

  @override
  bool get isTemplate => true;

  @override
  bool supports(Channel channel) {
    if (!channel.hasRoomTypeObj()) return false;
    return channel.roomTypeObj.type == RoomType.AUCTION;
  }

  @override
  Future<void> onJoined(RoomService room) async {
    final logic = Get.isRegistered<AuctionLogic>()
        ? Get.find<AuctionLogic>()
        : Get.put(AuctionLogic(), permanent: true);
    await logic.loadExt();
  }

  @override
  Future<void> onLeave() async {
    if (Get.isRegistered<AuctionLogic>()) {
      await Get.delete<AuctionLogic>(force: true);
    }
  }

  @override
  List<RoomMsgHandler> msgHandlers(RoomService room) {
    if (!Get.isRegistered<AuctionLogic>()) return const [];
    return [AuctionMsgHandler(Get.find<AuctionLogic>())];
  }

  @override
  Widget buildSlot() => const SizedBox.shrink();

  @override
  Widget? buildMicArea(BuildContext context) => const AuctionMicArea();

  @override
  Widget? buildBackdrop(BuildContext context) => const AuctionBackdrop();

  @override
  Widget? buildOverlay(BuildContext context) => const AuctionOverlay();

  @override
  List<Widget> buildTopPills(BuildContext context) => const [];
}

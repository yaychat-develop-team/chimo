import 'package:flutter/widgets.dart';

import '../../../common/models/server_client/rtc.pb.dart';
import '../../../common/utils/app_log.dart';
import '../addons/box/box_room_play.dart';
import '../addons/turntable/turntable_room_play.dart';
import '../service/room_service.dart';
import '../socket/room_msg_handler.dart';
import '../types/auction/auction_room_play.dart';
import '../types/cp/cp_room_play.dart';
import '../types/game/game_room_play.dart';
import '../types/heart_link/heart_link_room_play.dart';
import '../types/hot_hall/hot_hall_room_play.dart';
import '../types/joy_ride/joy_ride_room_play.dart';
import '../types/lucky_game/lucky_game_room_play.dart';
import '../types/million_club/million_club_room_play.dart';
import '../types/order_sing/order_sing_room_play.dart';
import '../types/romance/romance_room_play.dart';
import '../types/story/story_room_play.dart';
import '../types/voice/voice_room_play.dart';

/// 一种房间玩法。进房后由 [RoomPlays.resolve] 挂上，退房时逆序卸下。
abstract class RoomPlay {
  String get id;

  bool supports(Channel channel);

  /// 模板房型同一时刻只保留一个；转盘 / 宝箱等叠加能力为 false。
  bool get isTemplate => false;

  Future<void> onJoined(RoomService room);

  Future<void> onLeave();

  List<RoomMsgHandler> msgHandlers(RoomService room);

  /// 画在麦位和公屏之间。没有界面时返回空组件。
  Widget buildSlot();

  /// 替换默认麦位网格。`null` 表示继续用共用 [RoomMicGrid]。
  Widget? buildMicArea(BuildContext context) => null;

  /// 叠在房间静态/动态背景之上的专属背景层（如拍卖 PAG）。`null` 表示无。
  Widget? buildBackdrop(BuildContext context) => null;

  /// 盖在房间主体上的专属层。`null` 表示无。
  Widget? buildOverlay(BuildContext context) => null;

  /// 顶栏「Room Bulletin」与热度之间的额外胶囊（如 CP Heart List）。
  List<Widget> buildTopPills(BuildContext context) => const [];
}

/// 玩法登记点。新增玩法只加一个类，再放进这里。
abstract final class RoomPlays {
  static final List<RoomPlay> _registered = [
    VoiceRoomPlay(),
    const HotHallRoomPlay(),
    const MillionClubRoomPlay(),
    const OrderSingRoomPlay(),
    const JoyRideRoomPlay(),
    const GameRoomPlay(),
    const CpRoomPlay(),
    const HeartLinkRoomPlay(),
    const AuctionRoomPlay(),
    const StoryRoomPlay(),
    const RomanceRoomPlay(),
    const LuckyGameRoomPlay(),
    const TurntableRoomPlay(),
    const BoxRoomPlay(),
  ];

  /// 命中 [RoomPlay.supports] 的玩法。多个模板时只留登记顺序最靠前的一个。
  static List<RoomPlay> resolve(Channel channel) {
    final matched = [
      for (final play in _registered)
        if (play.supports(channel)) play,
    ];
    RoomPlay? template;
    final resolved = <RoomPlay>[];
    for (final play in matched) {
      if (play.isTemplate) {
        if (template != null) {
          AppLog.w('RoomPlays drop template ${play.id}, keep ${template.id}');
          continue;
        }
        template = play;
      }
      resolved.add(play);
    }
    return resolved;
  }
}

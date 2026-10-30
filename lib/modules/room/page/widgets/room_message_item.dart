import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/room_message.dart';
import 'barrage/room_barrage_activity.dart';
import 'barrage/room_barrage_card.dart';
import 'barrage/room_barrage_gift.dart';
import 'barrage/room_barrage_heart.dart';
import 'barrage/room_barrage_host.dart';
import 'barrage/room_barrage_join.dart';
import 'barrage/room_barrage_named.dart';
import 'barrage/room_barrage_pet.dart';
import 'barrage/room_barrage_qa.dart';
import 'barrage/room_barrage_text.dart';
import 'room_sender_tags.dart';

/// 公屏一行。按 [RoomMessageType] 分发到 `barrage/` 下各 body，样式对齐 Oumi。
class RoomMessageItem extends StatelessWidget {
  const RoomMessageItem({super.key, required this.message, this.onProfile, this.onLink});

  final RoomMessage message;

  /// 点头像 / 昵称打开资料卡。`uid` 为空时不回调。
  final void Function({required String uid, String name, String avatar})? onProfile;
  final void Function(String link)? onLink;

  @override
  Widget build(BuildContext context) {
    final host = RoomBarrageHost(message: message, onProfile: onProfile, onLink: onLink);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.showSender) ...[
            host.avatar(onTap: host.openSender),
            const SizedBox(width: 6),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (message.showSender) ...[
                  // 对齐 yaychat：顶栏昵称不可点，仅头像可开资料卡。
                  RoomSenderTagsView(
                    tags: message.tags,
                    name: message.sender,
                    carIcon: message.carIcon,
                  ),
                  const SizedBox(height: 4),
                ],
                _body(host),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(RoomBarrageHost host) {
    switch (message.type) {
      case RoomMessageType.gift:
        return RoomBarrageGiftBody(host: host);
      case RoomMessageType.join:
        return RoomBarrageJoinBody(host: host);
      case RoomMessageType.qa:
        return RoomBarrageQaBody(host: host);
      case RoomMessageType.pet:
        return RoomBarragePetBody(host: host);
      case RoomMessageType.activity:
        return RoomBarrageActivityBody(host: host);
      case RoomMessageType.card:
        return RoomBarrageCardBody(host: host);
      case RoomMessageType.heart:
        return RoomBarrageHeartBody(host: host);
      case RoomMessageType.named:
        return RoomBarrageNamedBody(host: host);
      case RoomMessageType.text:
        return RoomBarrageTextBody(host: host);
      default:
        return const SizedBox.shrink();
    }
  }
}

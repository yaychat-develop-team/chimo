import 'package:flutter/material.dart';

/// 对齐 joyride [DisplayItemGiftStatus]。
enum RoomGiftPlayStatus {
  wait,
  inAni,
  willAni,
  ani,
  outAni,
  micAni,
}

/// 麦位坐标。对齐 joyride [PositionOffset]。
class RoomMicPoint {
  const RoomMicPoint(
    this.offset, {
    this.size = const Size(50, 50),
    this.inPosition = true,
  });

  final Offset offset;
  final Size size;
  final bool inPosition;
}

/// 全屏礼物播放配置。对齐 joyride [DisplayGiftConfig] / GiftItemDisplay。
class RoomGiftDisplay {
  RoomGiftDisplay({
    required this.id,
    this.giftUrl = '',
    this.iconUrl = '',
    this.senderUid = 0,
    this.receiverUids = const [],
    this.count = 1,
    this.giftId = 0,
    this.micRes = '',
    this.showAnimation = false,
    this.showPrice = false,
    this.price = 0,
    this.imgList = const [],
    this.textList = const [],
    this.fromName = '',
    this.toName = '',
    this.giftName = '',
  });

  final String id;
  final String giftUrl;
  final String iconUrl;
  final int senderUid;
  final List<int> receiverUids;
  final int count;
  final int giftId;
  final String micRes;
  final bool showAnimation;
  final bool showPrice;
  final int price;
  final List<String> imgList;
  final List<String> textList;
  final String fromName;
  final String toName;
  final String giftName;

  final GlobalKey key = GlobalKey();
}

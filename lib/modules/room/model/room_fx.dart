/// 正在播的一条礼物。有 [pagUrl] 时走全屏，否则走左侧礼物条。
class RoomGiftFx {
  const RoomGiftFx({
    required this.id,
    this.fromName = '',
    this.toName = '',
    this.giftName = '',
    this.icon = '',
    this.count = 0,
    this.pagUrl = '',
  });

  final String id;
  final String fromName;
  final String toName;
  final String giftName;
  final String icon;
  final int count;
  final String pagUrl;
}

/// 一条座驾进场。
class RoomJoinFx {
  const RoomJoinFx({
    required this.id,
    required this.name,
    this.avatar = '',
    this.carName = '',
    this.carImage = '',
    this.level = '',
  });

  final String id;
  final String name;
  final String avatar;
  final String carName;
  final String carImage;
  final String level;
}

/// 实时打赏榜上的一个人。
class RoomRankUser {
  const RoomRankUser({required this.name, required this.avatar, required this.value});

  final String name;
  final String avatar;
  final int value;
}

/// 特效地址是 PAG 才全屏播。
bool roomIsPag(String url) {
  final clean = url.trim().toLowerCase().split('?').first.split('#').first;
  return clean.endsWith('.pag');
}

/// 公屏上一行的种类，对应 Oumi 的几种消息 builder。
enum RoomMessageKind { text, gift, join, qa, pet, activity, card, heart, named }

/// 富文本里的一段。
enum RoomPieceKind { text, icon, emote }

class RoomShowPiece {
  const RoomShowPiece({
    this.kind = RoomPieceKind.text,
    this.text = '',
    this.color = '',
    this.size = 0,
    this.weight = 0,
    this.url = '',
    this.accent = false,
    this.gradient = false,
    this.giftCount = false,
    this.emoji = false,
  });

  final RoomPieceKind kind;
  final String text;
  final String color;
  final int size;
  final int weight;
  final String url;
  final bool accent;
  final bool gradient;
  final bool giftCount;
  final bool emoji;
}

/// 昵称前的身份标。地址为空的项不画。
class RoomSenderTags {
  const RoomSenderTags({
    this.secret = false,
    this.gender = '',
    this.novaIcon = '',
    this.vipIcon = '',
    this.carLevel = '',
    this.knightIcon = '',
    this.jobLabel = '',
    this.robot = false,
    this.newer = '',
    this.tagIcons = const [],
    this.relationIcon = '',
    this.relationName = '',
    this.relationInset = 0,
    this.nameColors = const [],
  });

  /// 神秘人只留昵称。
  final bool secret;
  final String gender;
  final String novaIcon;
  final String vipIcon;
  final String carLevel;
  final String knightIcon;
  final String jobLabel;
  final bool robot;
  final String newer;
  final List<String> tagIcons;
  final String relationIcon;
  final String relationName;
  final int relationInset;
  final List<String> nameColors;
}

class RoomQaBody {
  const RoomQaBody({this.question = '', this.answer = ''});

  final String question;
  final String answer;
}

class RoomPetBody {
  const RoomPetBody({this.icon = '', this.name = '', this.tag = '', this.text = ''});

  final String icon;
  final String name;
  final String tag;
  final String text;
}

class RoomCardBody {
  const RoomCardBody({
    this.title = '',
    this.content = '',
    this.label = '',
    this.count = 0,
    this.cover = '',
    this.link = '',
  });

  final String title;
  final String content;
  final String label;
  final int count;
  final String cover;
  final String link;
}

class RoomHeartBody {
  const RoomHeartBody({this.photo = '', this.name = '', this.gender = '', this.age = 0});

  final String photo;
  final String name;
  final String gender;
  final int age;
}

/// 公屏上的一行。
class RoomMessage {
  const RoomMessage({
    required this.id,
    required this.text,
    this.sender = '',
    this.senderUid = '',
    this.kind = RoomMessageKind.text,
    this.showSender = true,
    this.avatar = '',
    this.avatarFrame = '',
    this.carIcon = '',
    this.tags = const RoomSenderTags(),
    this.pieces = const [],
    this.bubbleUrl = '',
    this.bubbleColors = '',
    this.quote = '',
    this.giftName = '',
    this.giftIcon = '',
    this.giftCount = 0,
    this.giftTo = '',
    this.boxIcon = '',
    this.qa,
    this.pet,
    this.card,
    this.heart,
    this.cover = '',
    this.link = '',
  });

  final String id;
  final String sender;
  final String senderUid;
  final String text;
  final RoomMessageKind kind;
  final bool showSender;
  final String avatar;
  final String avatarFrame;
  final String carIcon;
  final RoomSenderTags tags;
  final List<RoomShowPiece> pieces;
  final String bubbleUrl;
  final String bubbleColors;
  final String quote;
  final String giftName;
  final String giftIcon;
  final int giftCount;
  final String giftTo;
  final String boxIcon;
  final RoomQaBody? qa;
  final RoomPetBody? pet;
  final RoomCardBody? card;
  final RoomHeartBody? heart;
  final String cover;
  final String link;
}

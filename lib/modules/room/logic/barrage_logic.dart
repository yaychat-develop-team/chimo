import 'dart:convert';

import 'package:get/get.dart';

import '../../../common/models/server_client/base.pbenum.dart';
import '../../../common/models/server_client/common/car.pbenum.dart';
import '../../../common/models/server_client/heart_link.pb.dart';
import '../../../common/models/server_client/message.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/models/server_client/user_realtion.pb.dart';
import '../model/room_message.dart';
import '../service/room_service.dart';
import '../socket/room_msg_handler.dart';

/// 公屏。历史和实时消息都进 [messages]，发送走 [RoomService]。
class BarrageLogic extends GetxController {
  final messages = <RoomMessage>[].obs;
  int _seq = 0;

  void addAll(Iterable<Message> batch) {
    for (final message in batch) {
      final line = _line(message);
      if (line != null) messages.add(line);
    }
  }

  void addLocal(
    String text, {
    required String sender,
    String avatar = '',
    String gender = '',
  }) {
    messages.add(RoomMessage(
      id: 'local-${_seq++}',
      sender: sender,
      text: text,
      avatar: avatar,
      tags: RoomSenderTags(gender: gender),
    ));
  }

  RoomMsgHandler handler() => _BarrageMsgHandler(this);

  RoomMessage? _line(Message message) {
    final scene = message.data.scene;
    if (scene == Scene.USER_JOIN) {
      _syncOnline(message);
      return null;
    }
    if (scene == Scene.USER_NAMED_ROOM) return _named(message);
    if (message.type != MessageTypeEnum.chat) return null;
    if (scene == Scene.ROOM_CARD_CHAT) return _card(message);
    if (scene == Scene.INVITE_VIEW_HEART_LINK_CARD) return _heart(message);
    if (scene == Scene.HONEST_OPINION) return _common(message);
    final chat = message.data.content.unpackInto(ChatContent());
    final sender = chat.hasSender() ? chat.sender : null;
    final badge = chat.hasRelationBadge() ? chat.relationBadge : null;
    final profile = sender == null ? _emptyProfile : _profile(sender, badge);
    final id = '${message.id.toInt()}-${_seq++}';
    final quote = chat.hasQuoteMsg() ? _quote(chat.quoteMsg) : '';
    if (chat.hasGiftMsgShow()) {
      final gift = chat.giftMsgShow;
      return RoomMessage(
        id: id,
        sender: sender?.nickname ?? '',
        senderUid: '${sender?.id.toInt() ?? 0}',
        text: '',
        kind: RoomMessageKind.gift,
        showSender: _visible(sender),
        avatar: profile.avatar,
        avatarFrame: profile.frame,
        carIcon: profile.carIcon,
        tags: profile.tags,
        giftName: gift.giftName,
        giftIcon: gift.giftIcon,
        giftCount: gift.count,
        giftTo: gift.nickName,
        boxIcon: chat.hasBoxItem() ? chat.boxItem.icon : '',
      );
    }
    final pieces = chat.showItem.map(_piece).toList();
    if (pieces.isEmpty) return null;
    return RoomMessage(
      id: id,
      sender: sender?.nickname ?? '',
      senderUid: '${sender?.id.toInt() ?? 0}',
      text: pieces.map((item) => item.text).join(),
      showSender: _visible(sender),
      pieces: pieces,
      bubbleUrl: chat.hasBubbleItem() ? chat.bubbleItem.url : '',
      bubbleColors: chat.hasBubbleItem() ? chat.bubbleItem.colors : '',
      quote: quote,
      avatar: profile.avatar,
      avatarFrame: profile.frame,
      carIcon: profile.carIcon,
      tags: profile.tags,
    );
  }

  RoomMessage? _common(Message message) {
    final chat = message.data.content.unpackInto(CommonChatContent());
    if (chat.style == ChatStyle.NONE || !ChatStyle.values.contains(chat.style)) return null;
    final sender = chat.hasSender() ? chat.sender : null;
    final badge = chat.hasRelationBadge() ? chat.relationBadge : null;
    final profile = sender == null ? _emptyProfile : _profile(sender, badge);
    final id = '${message.id.toInt()}-${_seq++}';
    final base = RoomMessage(
      id: id,
      sender: sender?.nickname ?? '',
      senderUid: '${sender?.id.toInt() ?? 0}',
      text: '',
      showSender: _visible(sender) && chat.style != ChatStyle.JoinRoom,
      avatar: profile.avatar,
      avatarFrame: profile.frame,
      carIcon: profile.carIcon,
      tags: profile.tags,
    );
    switch (chat.style) {
      case ChatStyle.JoinRoom:
        return RoomMessage(
          id: base.id,
          sender: _clip(base.sender, 16),
          senderUid: base.senderUid,
          text: '',
          kind: RoomMessageKind.join,
          showSender: false,
          avatar: base.avatar,
        );
      case ChatStyle.QA:
        return RoomMessage(
          id: base.id,
          sender: base.sender,
          senderUid: base.senderUid,
          text: '',
          kind: RoomMessageKind.qa,
          showSender: base.showSender,
          avatar: base.avatar,
          avatarFrame: base.avatarFrame,
          carIcon: base.carIcon,
          tags: base.tags,
          qa: RoomQaBody(question: chat.questionAndAnswer.question, answer: chat.questionAndAnswer.answer),
        );
      case ChatStyle.PET_CHAT:
        final pet = chat.petChatMsgInfo;
        return RoomMessage(
          id: base.id,
          sender: base.sender,
          senderUid: base.senderUid,
          text: '',
          kind: RoomMessageKind.pet,
          showSender: base.showSender,
          avatar: base.avatar,
          avatarFrame: base.avatarFrame,
          carIcon: base.carIcon,
          tags: base.tags,
          pet: RoomPetBody(icon: pet.icon, name: pet.petName, tag: pet.tag, text: pet.copyWriting),
        );
      case ChatStyle.ACTIVITY_SHARE_CHAT:
        final card = chat.activityShareCard;
        return RoomMessage(
          id: base.id,
          sender: base.sender,
          senderUid: base.senderUid,
          text: '',
          kind: RoomMessageKind.activity,
          showSender: base.showSender,
          avatar: base.avatar,
          avatarFrame: base.avatarFrame,
          carIcon: base.carIcon,
          tags: base.tags,
          cover: card.cardImageUrl,
          link: card.jumpLink,
        );
      case ChatStyle.NONE:
        return null;
    }
    return null;
  }

  RoomMessage _card(Message message) {
    final card = message.data.content.unpackInto(CardChatContent());
    final sender = card.hasSender() ? card.sender : null;
    final badge = card.hasRelationBadge() ? card.relationBadge : null;
    final profile = sender == null ? _emptyProfile : _profile(sender, badge);
    return RoomMessage(
      id: '${message.id.toInt()}-${_seq++}',
      sender: sender?.nickname ?? '',
      senderUid: '${sender?.id.toInt() ?? 0}',
      text: '',
      kind: RoomMessageKind.card,
      showSender: _visible(sender),
      avatar: profile.avatar,
      avatarFrame: profile.frame,
      carIcon: profile.carIcon,
      tags: profile.tags,
      card: RoomCardBody(
        title: card.title,
        content: card.content,
        label: card.label,
        count: card.count,
        cover: card.cover.isEmpty ? '' : card.cover.first,
        link: card.url,
      ),
    );
  }

  RoomMessage? _heart(Message message) {
    final chat = message.data.content.unpackInto(HeartLinkChatContent());
    if (!chat.hasCardInfo()) return null;
    final info = chat.cardInfo;
    final sender = chat.hasSender() ? chat.sender : null;
    final badge = chat.hasRelationBadge() ? chat.relationBadge : null;
    final profile = sender == null ? _emptyProfile : _profile(sender, badge);
    final photo = info.photo.isNotEmpty ? info.photo.first.url : (info.hasUser() ? info.user.avatar : '');
    final user = info.hasUser() ? info.user : null;
    return RoomMessage(
      id: '${message.id.toInt()}-${_seq++}',
      sender: sender?.nickname ?? '',
      senderUid: '${sender?.id.toInt() ?? 0}',
      text: '',
      kind: RoomMessageKind.heart,
      showSender: _visible(sender),
      avatar: profile.avatar,
      avatarFrame: profile.frame,
      carIcon: profile.carIcon,
      tags: profile.tags,
      heart: RoomHeartBody(
        photo: photo,
        name: _clip(user?.nickname ?? '', 10),
        gender: user?.gender ?? '',
        age: user?.age ?? 0,
      ),
    );
  }

  RoomMessage _named(Message message) {
    final named = message.data.content.unpackInto(UserNamedRoomMsgCmd());
    return RoomMessage(
      id: '${message.id.toInt()}-${_seq++}',
      sender: named.uname,
      senderUid: '${named.uid.toInt()}',
      text: 'Room Naming',
      kind: RoomMessageKind.named,
      showSender: false,
      avatar: named.uavatar,
    );
  }
}

class _Profile {
  const _Profile({
    this.avatar = '',
    this.frame = '',
    this.carIcon = '',
    this.tags = const RoomSenderTags(),
  });

  final String avatar;
  final String frame;
  final String carIcon;
  final RoomSenderTags tags;
}

const _emptyProfile = _Profile();

bool _visible(SimpleUser? user) => (user?.id.toInt() ?? 0) > 0;

String _clip(String value, int max) {
  final runes = value.runes;
  if (runes.length <= max) return value;
  return String.fromCharCodes(runes.take(max));
}

void _syncOnline(Message message) {
  final join = message.data.content.unpackInto(RoomUserJoin());
  if (!Get.isRegistered<RoomService>() || join.count <= 0) return;
  Get.find<RoomService>().online.value = join.count;
}

RoomShowPiece _piece(ShowItem item) {
  final emote = _emoteUrl(item);
  if (item.style == ItemStyle.icon) {
    return RoomShowPiece(kind: RoomPieceKind.icon, url: item.url, size: item.size);
  }
  if (item.style == ItemStyle.emote || emote.isNotEmpty) {
    return RoomShowPiece(kind: RoomPieceKind.emote, url: emote, text: item.text);
  }
  return RoomShowPiece(
    text: item.text,
    color: item.color,
    size: item.size,
    weight: item.weight,
    accent: item.style == ItemStyle.at || item.style == ItemStyle.link || item.style == ItemStyle.gradient,
    gradient: item.style == ItemStyle.gradient,
    giftCount: _isGiftCount(item),
    emoji: RegExp(r'^[\ue601-\ue62e]+$').hasMatch(item.text),
  );
}

String _emoteUrl(ShowItem item) {
  if (item.extra.isEmpty) return '';
  try {
    final extra = jsonDecode(item.extra);
    if (extra is! Map) return '';
    final emote = extra['emote'];
    if (emote is Map && emote['url'] is String) return emote['url'] as String;
  } catch (_) {}
  return '';
}

bool _isGiftCount(ShowItem item) {
  if (item.extra.isEmpty) return false;
  try {
    final extra = jsonDecode(item.extra);
    return extra is Map && extra['is_gift_count'] == 1;
  } catch (_) {}
  return false;
}

String _quote(Message quote) {
  SimpleUser? sender;
  var body = '';
  if (quote.data.scene == Scene.ROOM_CARD_CHAT) {
    final card = quote.data.content.unpackInto(CardChatContent());
    sender = card.hasSender() ? card.sender : null;
    body = card.title;
  } else {
    final chat = quote.data.content.unpackInto(ChatContent());
    sender = chat.hasSender() ? chat.sender : null;
    body = chat.showItem.map(_quotePiece).join();
  }
  final name = sender?.nickname ?? '';
  return '${name.isEmpty ? '[User]' : name}: $body';
}

String _quotePiece(ShowItem item) {
  switch (item.style) {
    case ItemStyle.icon:
      return ' [Icon] ';
    case ItemStyle.link:
      return item.text.isEmpty ? ' [Link] ' : item.text;
    case ItemStyle.emote:
      return item.text.isEmpty ? ' [Emote] ' : item.text;
    default:
      return item.text;
  }
}

_Profile _profile(SimpleUser user, RelationBadge? badge) {
  final colors = user.nicknameColor.map((item) => item.trim()).where((item) => item.isNotEmpty).toList();
  if (user.secretUser == 1) {
    return _Profile(
      avatar: user.avatar,
      frame: user.avatarFrame,
      tags: RoomSenderTags(secret: true, nameColors: colors),
    );
  }
  final occupation = user.job != Job.BOSS && user.gsGroupId.toInt() > 0;
  return _Profile(
    avatar: user.avatar,
    frame: user.avatarFrame,
    carIcon: _carIcon(user),
    tags: RoomSenderTags(
      gender: user.gender.trim(),
      novaIcon: user.novaIcon.trim(),
      vipIcon: user.vipLevelIcon.trim(),
      carLevel: _carLevel(user),
      knightIcon: user.knightIcon.trim(),
      jobLabel: occupation ? 'GS' : '',
      robot: user.robot,
      tagIcons: user.tags.map((item) => item.trim()).where((item) => item.isNotEmpty).toList(),
      relationIcon: badge?.resource.trim() ?? '',
      relationName: badge?.targetUserName.trim() ?? '',
      relationInset: badge?.leftDistance ?? 0,
      nameColors: colors,
    ),
  );
}

String _carIcon(SimpleUser user) {
  if (user.hasCar() && user.car.hasCarMetaInfo()) {
    final link = user.car.carMetaInfo.rightImgLink.trim();
    if (link.isNotEmpty) return link;
  }
  return user.carIcon.trim();
}

String _carLevel(SimpleUser user) {
  if (user.job != Job.BOSS) return '';
  if (!user.hasCar() || !user.car.hasCarMetaInfo()) return '';
  return switch (user.car.carMetaInfo.level) {
    CarLevel.SSS => 'SSS',
    CarLevel.SS => 'SS',
    CarLevel.S => 'S',
    CarLevel.A => 'A',
    CarLevel.B => 'B',
    _ => '',
  };
}

class _BarrageMsgHandler implements RoomMsgHandler {
  _BarrageMsgHandler(this.logic);

  final BarrageLogic logic;

  @override
  bool supports(Message message) {
    final scene = message.data.scene;
    return message.type == MessageTypeEnum.chat ||
        scene == Scene.USER_JOIN ||
        scene == Scene.USER_NAMED_ROOM;
  }

  @override
  void handle(Message message) {
    try {
      final line = logic._line(message);
      if (line != null) logic.messages.add(line);
    } catch (_) {}
  }
}

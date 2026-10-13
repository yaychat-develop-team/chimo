// This is a generated file - do not edit.
//
// Generated from server_client/message.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 消息类型
class MessageTypeEnum extends $pb.ProtobufEnum {
  static const MessageTypeEnum chat =
      MessageTypeEnum._(0, _omitEnumNames ? '' : 'chat');
  static const MessageTypeEnum cmd =
      MessageTypeEnum._(1, _omitEnumNames ? '' : 'cmd');
  static const MessageTypeEnum req =
      MessageTypeEnum._(2, _omitEnumNames ? '' : 'req');
  static const MessageTypeEnum ping =
      MessageTypeEnum._(3, _omitEnumNames ? '' : 'ping');

  static const $core.List<MessageTypeEnum> values = <MessageTypeEnum>[
    chat,
    cmd,
    req,
    ping,
  ];

  static final $core.List<MessageTypeEnum?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static MessageTypeEnum? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MessageTypeEnum._(super.value, super.name);
}

/// 消息场景
class Scene extends $pb.ProtobufEnum {
  static const Scene SEND_GIFT = Scene._(0, _omitEnumNames ? '' : 'SEND_GIFT');
  static const Scene MANAGER_OPERATION =
      Scene._(1, _omitEnumNames ? '' : 'MANAGER_OPERATION');
  static const Scene MIC_CHANGE =
      Scene._(2, _omitEnumNames ? '' : 'MIC_CHANGE');
  static const Scene ROOM_META_DATA_CHANGE =
      Scene._(3, _omitEnumNames ? '' : 'ROOM_META_DATA_CHANGE');
  static const Scene REAL_TIME_RANK_CHANGE =
      Scene._(4, _omitEnumNames ? '' : 'REAL_TIME_RANK_CHANGE');
  static const Scene GIFT_VALUE_CHANGE =
      Scene._(5, _omitEnumNames ? '' : 'GIFT_VALUE_CHANGE');
  static const Scene MIC_QUEUE_CHANGE =
      Scene._(6, _omitEnumNames ? '' : 'MIC_QUEUE_CHANGE');
  static const Scene VIP_PARK_CHANGE =
      Scene._(7, _omitEnumNames ? '' : 'VIP_PARK_CHANGE');
  static const Scene ROLE_CHANGE =
      Scene._(8, _omitEnumNames ? '' : 'ROLE_CHANGE');
  static const Scene PROGRAM_CHANGE =
      Scene._(9, _omitEnumNames ? '' : 'PROGRAM_CHANGE');
  static const Scene FLYING_SCREEN =
      Scene._(10, _omitEnumNames ? '' : 'FLYING_SCREEN');
  static const Scene ROOM_TEXT_CHAT =
      Scene._(11, _omitEnumNames ? '' : 'ROOM_TEXT_CHAT');
  static const Scene ROOM_CARD_CHAT =
      Scene._(12, _omitEnumNames ? '' : 'ROOM_CARD_CHAT');
  static const Scene USER_JOIN = Scene._(13, _omitEnumNames ? '' : 'USER_JOIN');
  static const Scene TACIT_ABORT =
      Scene._(14, _omitEnumNames ? '' : 'TACIT_ABORT');
  static const Scene TACIT_INVITE =
      Scene._(15, _omitEnumNames ? '' : 'TACIT_INVITE');
  static const Scene TACIT_QUEST =
      Scene._(16, _omitEnumNames ? '' : 'TACIT_QUEST');
  static const Scene TACIT_END = Scene._(17, _omitEnumNames ? '' : 'TACIT_END');
  static const Scene RIDE_ROOM_PUSH =
      Scene._(18, _omitEnumNames ? '' : 'RIDE_ROOM_PUSH');
  static const Scene OFF_MIC_CHANGE =
      Scene._(19, _omitEnumNames ? '' : 'OFF_MIC_CHANGE');
  static const Scene ROOM_MIC_SHOW_IMG =
      Scene._(20, _omitEnumNames ? '' : 'ROOM_MIC_SHOW_IMG');
  static const Scene ROOM_SUD_GAME_CHANGE =
      Scene._(21, _omitEnumNames ? '' : 'ROOM_SUD_GAME_CHANGE');
  static const Scene CP_ROOM_STATE =
      Scene._(22, _omitEnumNames ? '' : 'CP_ROOM_STATE');
  static const Scene CP_ROOM_PAIR_EFFECT =
      Scene._(23, _omitEnumNames ? '' : 'CP_ROOM_PAIR_EFFECT');
  static const Scene CP_ROOM_HANDS_HEART_VALUE =
      Scene._(24, _omitEnumNames ? '' : 'CP_ROOM_HANDS_HEART_VALUE');
  static const Scene ROOM_EFFECT =
      Scene._(25, _omitEnumNames ? '' : 'ROOM_EFFECT');
  static const Scene ROOM_TURNTABLE =
      Scene._(26, _omitEnumNames ? '' : 'ROOM_TURNTABLE');
  static const Scene ROOM_LUCKY_POINTS =
      Scene._(27, _omitEnumNames ? '' : 'ROOM_LUCKY_POINTS');
  static const Scene BOX_BIG_WIN =
      Scene._(28, _omitEnumNames ? '' : 'BOX_BIG_WIN');
  static const Scene FLEET_INFO =
      Scene._(29, _omitEnumNames ? '' : 'FLEET_INFO');
  static const Scene SUD_GAME_RESULT =
      Scene._(30, _omitEnumNames ? '' : 'SUD_GAME_RESULT');
  static const Scene HEART_LINK_SUCCESS =
      Scene._(31, _omitEnumNames ? '' : 'HEART_LINK_SUCCESS');
  static const Scene SYNC_INVITE_ENTER_ROOM_RESULT =
      Scene._(32, _omitEnumNames ? '' : 'SYNC_INVITE_ENTER_ROOM_RESULT');
  static const Scene GRANT_UP_TO_MIC =
      Scene._(33, _omitEnumNames ? '' : 'GRANT_UP_TO_MIC');
  static const Scene UNLOCK_HEART_LINK_CARD =
      Scene._(34, _omitEnumNames ? '' : 'UNLOCK_HEART_LINK_CARD');
  static const Scene JOIN_PRIVATE_ROOM =
      Scene._(35, _omitEnumNames ? '' : 'JOIN_PRIVATE_ROOM');
  static const Scene INVITE_VIEW_HEART_LINK_CARD =
      Scene._(36, _omitEnumNames ? '' : 'INVITE_VIEW_HEART_LINK_CARD');
  static const Scene NEW_USER_JOIN_ROOM =
      Scene._(37, _omitEnumNames ? '' : 'NEW_USER_JOIN_ROOM');
  static const Scene USER_VIEW_HEART_LINK_CARD =
      Scene._(38, _omitEnumNames ? '' : 'USER_VIEW_HEART_LINK_CARD');
  static const Scene HONEST_OPINION =
      Scene._(39, _omitEnumNames ? '' : 'HONEST_OPINION');
  static const Scene ENTRANCE_BANNER =
      Scene._(40, _omitEnumNames ? '' : 'ENTRANCE_BANNER');
  static const Scene MIC_LINK = Scene._(41, _omitEnumNames ? '' : 'MIC_LINK');
  static const Scene AUCTION_ROOM_CHANGE =
      Scene._(42, _omitEnumNames ? '' : 'AUCTION_ROOM_CHANGE');
  static const Scene ARTIST_AUCTION_RESULT =
      Scene._(43, _omitEnumNames ? '' : 'ARTIST_AUCTION_RESULT');
  static const Scene STORY_THEME_CHANGE =
      Scene._(44, _omitEnumNames ? '' : 'STORY_THEME_CHANGE');
  static const Scene PET_HANG_OUT_IN_ROOM =
      Scene._(45, _omitEnumNames ? '' : 'PET_HANG_OUT_IN_ROOM');
  static const Scene INVITE_USER_UP_MIC =
      Scene._(46, _omitEnumNames ? '' : 'INVITE_USER_UP_MIC');
  static const Scene NEWBIE_USER_JOIN_ROOM =
      Scene._(47, _omitEnumNames ? '' : 'NEWBIE_USER_JOIN_ROOM');
  static const Scene ROOM_FLOAT_MSG =
      Scene._(48, _omitEnumNames ? '' : 'ROOM_FLOAT_MSG');
  static const Scene OBTAIN_QUIZ_CHIPS =
      Scene._(49, _omitEnumNames ? '' : 'OBTAIN_QUIZ_CHIPS');
  static const Scene USER_NAMED_ROOM =
      Scene._(50, _omitEnumNames ? '' : 'USER_NAMED_ROOM');

  static const $core.List<Scene> values = <Scene>[
    SEND_GIFT,
    MANAGER_OPERATION,
    MIC_CHANGE,
    ROOM_META_DATA_CHANGE,
    REAL_TIME_RANK_CHANGE,
    GIFT_VALUE_CHANGE,
    MIC_QUEUE_CHANGE,
    VIP_PARK_CHANGE,
    ROLE_CHANGE,
    PROGRAM_CHANGE,
    FLYING_SCREEN,
    ROOM_TEXT_CHAT,
    ROOM_CARD_CHAT,
    USER_JOIN,
    TACIT_ABORT,
    TACIT_INVITE,
    TACIT_QUEST,
    TACIT_END,
    RIDE_ROOM_PUSH,
    OFF_MIC_CHANGE,
    ROOM_MIC_SHOW_IMG,
    ROOM_SUD_GAME_CHANGE,
    CP_ROOM_STATE,
    CP_ROOM_PAIR_EFFECT,
    CP_ROOM_HANDS_HEART_VALUE,
    ROOM_EFFECT,
    ROOM_TURNTABLE,
    ROOM_LUCKY_POINTS,
    BOX_BIG_WIN,
    FLEET_INFO,
    SUD_GAME_RESULT,
    HEART_LINK_SUCCESS,
    SYNC_INVITE_ENTER_ROOM_RESULT,
    GRANT_UP_TO_MIC,
    UNLOCK_HEART_LINK_CARD,
    JOIN_PRIVATE_ROOM,
    INVITE_VIEW_HEART_LINK_CARD,
    NEW_USER_JOIN_ROOM,
    USER_VIEW_HEART_LINK_CARD,
    HONEST_OPINION,
    ENTRANCE_BANNER,
    MIC_LINK,
    AUCTION_ROOM_CHANGE,
    ARTIST_AUCTION_RESULT,
    STORY_THEME_CHANGE,
    PET_HANG_OUT_IN_ROOM,
    INVITE_USER_UP_MIC,
    NEWBIE_USER_JOIN_ROOM,
    ROOM_FLOAT_MSG,
    OBTAIN_QUIZ_CHIPS,
    USER_NAMED_ROOM,
  ];

  static final $core.List<Scene?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 50);
  static Scene? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Scene._(super.value, super.name);
}

class ChatStyle extends $pb.ProtobufEnum {
  static const ChatStyle NONE = ChatStyle._(0, _omitEnumNames ? '' : 'NONE');
  static const ChatStyle QA = ChatStyle._(1, _omitEnumNames ? '' : 'QA');
  static const ChatStyle JoinRoom =
      ChatStyle._(2, _omitEnumNames ? '' : 'JoinRoom');
  static const ChatStyle PET_CHAT =
      ChatStyle._(3, _omitEnumNames ? '' : 'PET_CHAT');
  static const ChatStyle ACTIVITY_SHARE_CHAT =
      ChatStyle._(4, _omitEnumNames ? '' : 'ACTIVITY_SHARE_CHAT');

  static const $core.List<ChatStyle> values = <ChatStyle>[
    NONE,
    QA,
    JoinRoom,
    PET_CHAT,
    ACTIVITY_SHARE_CHAT,
  ];

  static final $core.List<ChatStyle?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ChatStyle? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChatStyle._(super.value, super.name);
}

/// *
///  聊天消息展示项样式
class ItemStyle extends $pb.ProtobufEnum {
  static const ItemStyle text = ItemStyle._(0, _omitEnumNames ? '' : 'text');
  static const ItemStyle icon = ItemStyle._(1, _omitEnumNames ? '' : 'icon');
  static const ItemStyle link = ItemStyle._(2, _omitEnumNames ? '' : 'link');
  static const ItemStyle emote = ItemStyle._(3, _omitEnumNames ? '' : 'emote');
  static const ItemStyle gradient =
      ItemStyle._(4, _omitEnumNames ? '' : 'gradient');
  static const ItemStyle at = ItemStyle._(5, _omitEnumNames ? '' : 'at');

  static const $core.List<ItemStyle> values = <ItemStyle>[
    text,
    icon,
    link,
    emote,
    gradient,
    at,
  ];

  static final $core.List<ItemStyle?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static ItemStyle? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ItemStyle._(super.value, super.name);
}

/// *
///  飘屏消息
class FlyingScreenType extends $pb.ProtobufEnum {
  static const FlyingScreenType UN_KNOWN =
      FlyingScreenType._(0, _omitEnumNames ? '' : 'UN_KNOWN');
  static const FlyingScreenType CAR =
      FlyingScreenType._(1, _omitEnumNames ? '' : 'CAR');
  static const FlyingScreenType FLEET =
      FlyingScreenType._(2, _omitEnumNames ? '' : 'FLEET');
  static const FlyingScreenType WORLD_MEGAPHONE =
      FlyingScreenType._(3, _omitEnumNames ? '' : 'WORLD_MEGAPHONE');
  static const FlyingScreenType CRATE_RUSH =
      FlyingScreenType._(4, _omitEnumNames ? '' : 'CRATE_RUSH');
  static const FlyingScreenType GIFT =
      FlyingScreenType._(5, _omitEnumNames ? '' : 'GIFT');

  static const $core.List<FlyingScreenType> values = <FlyingScreenType>[
    UN_KNOWN,
    CAR,
    FLEET,
    WORLD_MEGAPHONE,
    CRATE_RUSH,
    GIFT,
  ];

  static final $core.List<FlyingScreenType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static FlyingScreenType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FlyingScreenType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

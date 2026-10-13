// This is a generated file - do not edit.
//
// Generated from server_client/cmd.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class EaseCmdPushType extends $pb.ProtobufEnum {
  static const EaseCmdPushType ACCOUNT_BAN =
      EaseCmdPushType._(0, _omitEnumNames ? '' : 'ACCOUNT_BAN');
  static const EaseCmdPushType PRIVATE_CHAT =
      EaseCmdPushType._(1, _omitEnumNames ? '' : 'PRIVATE_CHAT');
  static const EaseCmdPushType COMPANION_DISTRIBUTE_PUSH =
      EaseCmdPushType._(2, _omitEnumNames ? '' : 'COMPANION_DISTRIBUTE_PUSH');
  static const EaseCmdPushType OWNER_COMPANION_PUSH =
      EaseCmdPushType._(3, _omitEnumNames ? '' : 'OWNER_COMPANION_PUSH');
  static const EaseCmdPushType ROOM_TOOL_DISTRIBUTE_PUSH =
      EaseCmdPushType._(4, _omitEnumNames ? '' : 'ROOM_TOOL_DISTRIBUTE_PUSH');
  static const EaseCmdPushType MENTOR_PUSH =
      EaseCmdPushType._(5, _omitEnumNames ? '' : 'MENTOR_PUSH');
  static const EaseCmdPushType RIDE_PUSH =
      EaseCmdPushType._(6, _omitEnumNames ? '' : 'RIDE_PUSH');
  static const EaseCmdPushType CAR_FLYING_SCREEN =
      EaseCmdPushType._(7, _omitEnumNames ? '' : 'CAR_FLYING_SCREEN');
  static const EaseCmdPushType COMPANION_OWNER_RIDE_PUSH =
      EaseCmdPushType._(8, _omitEnumNames ? '' : 'COMPANION_OWNER_RIDE_PUSH');
  static const EaseCmdPushType SYSTEM_NOTIFY =
      EaseCmdPushType._(9, _omitEnumNames ? '' : 'SYSTEM_NOTIFY');
  static const EaseCmdPushType RELATION_CHANGE =
      EaseCmdPushType._(10, _omitEnumNames ? '' : 'RELATION_CHANGE');
  static const EaseCmdPushType POP_WINDOW =
      EaseCmdPushType._(11, _omitEnumNames ? '' : 'POP_WINDOW');
  static const EaseCmdPushType INTIMACY_UPGRADE =
      EaseCmdPushType._(12, _omitEnumNames ? '' : 'INTIMACY_UPGRADE');
  static const EaseCmdPushType GIFT_WISH_CARD =
      EaseCmdPushType._(13, _omitEnumNames ? '' : 'GIFT_WISH_CARD');
  static const EaseCmdPushType COMMON_CMD =
      EaseCmdPushType._(14, _omitEnumNames ? '' : 'COMMON_CMD');
  static const EaseCmdPushType NEW_USER_DISPATCH =
      EaseCmdPushType._(15, _omitEnumNames ? '' : 'NEW_USER_DISPATCH');
  static const EaseCmdPushType CRYSTAL_DROP =
      EaseCmdPushType._(16, _omitEnumNames ? '' : 'CRYSTAL_DROP');
  static const EaseCmdPushType NEW_USER_DISPATCH_SECOND =
      EaseCmdPushType._(17, _omitEnumNames ? '' : 'NEW_USER_DISPATCH_SECOND');
  static const EaseCmdPushType USER_JOIN_ROOM_TIPS =
      EaseCmdPushType._(18, _omitEnumNames ? '' : 'USER_JOIN_ROOM_TIPS');
  static const EaseCmdPushType KICK_OUT =
      EaseCmdPushType._(19, _omitEnumNames ? '' : 'KICK_OUT');
  static const EaseCmdPushType RECALL_USER_BACK =
      EaseCmdPushType._(20, _omitEnumNames ? '' : 'RECALL_USER_BACK');
  static const EaseCmdPushType RECEIVE_HONOR =
      EaseCmdPushType._(21, _omitEnumNames ? '' : 'RECEIVE_HONOR');
  static const EaseCmdPushType AGENT_CALL =
      EaseCmdPushType._(22, _omitEnumNames ? '' : 'AGENT_CALL');
  static const EaseCmdPushType ROOM_INVITE =
      EaseCmdPushType._(23, _omitEnumNames ? '' : 'ROOM_INVITE');
  static const EaseCmdPushType HEART_LINK_INVITE =
      EaseCmdPushType._(24, _omitEnumNames ? '' : 'HEART_LINK_INVITE');
  static const EaseCmdPushType TIMER_USER_DISPATCH =
      EaseCmdPushType._(25, _omitEnumNames ? '' : 'TIMER_USER_DISPATCH');
  static const EaseCmdPushType HEARTIES_LOGIN =
      EaseCmdPushType._(26, _omitEnumNames ? '' : 'HEARTIES_LOGIN');
  static const EaseCmdPushType HEART_LINK_INVITE_GS =
      EaseCmdPushType._(27, _omitEnumNames ? '' : 'HEART_LINK_INVITE_GS');
  static const EaseCmdPushType DROP_GAME_ITEM =
      EaseCmdPushType._(28, _omitEnumNames ? '' : 'DROP_GAME_ITEM');
  static const EaseCmdPushType PRIVATE_CHAT_NEW_USER_PKG =
      EaseCmdPushType._(29, _omitEnumNames ? '' : 'PRIVATE_CHAT_NEW_USER_PKG');
  static const EaseCmdPushType PRIVATE_CHAT_UNLOCK_UNLIMITED =
      EaseCmdPushType._(
          30, _omitEnumNames ? '' : 'PRIVATE_CHAT_UNLOCK_UNLIMITED');
  static const EaseCmdPushType PRIVATE_CHAT_BUY_VALUE_PKG =
      EaseCmdPushType._(31, _omitEnumNames ? '' : 'PRIVATE_CHAT_BUY_VALUE_PKG');
  static const EaseCmdPushType FIRST_RECHARGE_REWARD =
      EaseCmdPushType._(32, _omitEnumNames ? '' : 'FIRST_RECHARGE_REWARD');
  static const EaseCmdPushType JOIN_GROUP_MESSAGE =
      EaseCmdPushType._(33, _omitEnumNames ? '' : 'JOIN_GROUP_MESSAGE');
  static const EaseCmdPushType UNLOCK_COUPLE_ACTIVITY =
      EaseCmdPushType._(34, _omitEnumNames ? '' : 'UNLOCK_COUPLE_ACTIVITY');
  static const EaseCmdPushType MESS_ROOM_INVITE_USER =
      EaseCmdPushType._(35, _omitEnumNames ? '' : 'MESS_ROOM_INVITE_USER');
  static const EaseCmdPushType MESS_ROOM_INVITE_GS =
      EaseCmdPushType._(36, _omitEnumNames ? '' : 'MESS_ROOM_INVITE_GS');
  static const EaseCmdPushType STOP_AUTO_CHAT_REMIND =
      EaseCmdPushType._(37, _omitEnumNames ? '' : 'STOP_AUTO_CHAT_REMIND');
  static const EaseCmdPushType START_AUTO_CHAT_REMIND =
      EaseCmdPushType._(38, _omitEnumNames ? '' : 'START_AUTO_CHAT_REMIND');
  static const EaseCmdPushType GS_CHAT_PROMPT_MSG =
      EaseCmdPushType._(39, _omitEnumNames ? '' : 'GS_CHAT_PROMPT_MSG');
  static const EaseCmdPushType STOP_CHAT_PROMPT =
      EaseCmdPushType._(40, _omitEnumNames ? '' : 'STOP_CHAT_PROMPT');
  static const EaseCmdPushType PICK_GS_CARD =
      EaseCmdPushType._(41, _omitEnumNames ? '' : 'PICK_GS_CARD');
  static const EaseCmdPushType CHARM_LEVEL_UP =
      EaseCmdPushType._(42, _omitEnumNames ? '' : 'CHARM_LEVEL_UP');
  static const EaseCmdPushType REFRESH_SETTING =
      EaseCmdPushType._(43, _omitEnumNames ? '' : 'REFRESH_SETTING');
  static const EaseCmdPushType OBTAIN_QUIZ_CHIPS =
      EaseCmdPushType._(44, _omitEnumNames ? '' : 'OBTAIN_QUIZ_CHIPS');
  static const EaseCmdPushType STRANGER_GREET_QUOTA =
      EaseCmdPushType._(45, _omitEnumNames ? '' : 'STRANGER_GREET_QUOTA');
  static const EaseCmdPushType BLIND_BOX_POPUP =
      EaseCmdPushType._(46, _omitEnumNames ? '' : 'BLIND_BOX_POPUP');

  static const $core.List<EaseCmdPushType> values = <EaseCmdPushType>[
    ACCOUNT_BAN,
    PRIVATE_CHAT,
    COMPANION_DISTRIBUTE_PUSH,
    OWNER_COMPANION_PUSH,
    ROOM_TOOL_DISTRIBUTE_PUSH,
    MENTOR_PUSH,
    RIDE_PUSH,
    CAR_FLYING_SCREEN,
    COMPANION_OWNER_RIDE_PUSH,
    SYSTEM_NOTIFY,
    RELATION_CHANGE,
    POP_WINDOW,
    INTIMACY_UPGRADE,
    GIFT_WISH_CARD,
    COMMON_CMD,
    NEW_USER_DISPATCH,
    CRYSTAL_DROP,
    NEW_USER_DISPATCH_SECOND,
    USER_JOIN_ROOM_TIPS,
    KICK_OUT,
    RECALL_USER_BACK,
    RECEIVE_HONOR,
    AGENT_CALL,
    ROOM_INVITE,
    HEART_LINK_INVITE,
    TIMER_USER_DISPATCH,
    HEARTIES_LOGIN,
    HEART_LINK_INVITE_GS,
    DROP_GAME_ITEM,
    PRIVATE_CHAT_NEW_USER_PKG,
    PRIVATE_CHAT_UNLOCK_UNLIMITED,
    PRIVATE_CHAT_BUY_VALUE_PKG,
    FIRST_RECHARGE_REWARD,
    JOIN_GROUP_MESSAGE,
    UNLOCK_COUPLE_ACTIVITY,
    MESS_ROOM_INVITE_USER,
    MESS_ROOM_INVITE_GS,
    STOP_AUTO_CHAT_REMIND,
    START_AUTO_CHAT_REMIND,
    GS_CHAT_PROMPT_MSG,
    STOP_CHAT_PROMPT,
    PICK_GS_CARD,
    CHARM_LEVEL_UP,
    REFRESH_SETTING,
    OBTAIN_QUIZ_CHIPS,
    STRANGER_GREET_QUOTA,
    BLIND_BOX_POPUP,
  ];

  static final $core.List<EaseCmdPushType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 46);
  static EaseCmdPushType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const EaseCmdPushType._(super.value, super.name);
}

class PopWindowType extends $pb.ProtobufEnum {
  static const PopWindowType VIP_LEVEL_UPGRADE =
      PopWindowType._(0, _omitEnumNames ? '' : 'VIP_LEVEL_UPGRADE');
  static const PopWindowType GAME_CURRENCY_AUTO_SWITCH =
      PopWindowType._(1, _omitEnumNames ? '' : 'GAME_CURRENCY_AUTO_SWITCH');

  static const $core.List<PopWindowType> values = <PopWindowType>[
    VIP_LEVEL_UPGRADE,
    GAME_CURRENCY_AUTO_SWITCH,
  ];

  static final $core.List<PopWindowType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static PopWindowType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PopWindowType._(super.value, super.name);
}

class AgentCallMsg_Status extends $pb.ProtobufEnum {
  static const AgentCallMsg_Status UNKNOWN =
      AgentCallMsg_Status._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const AgentCallMsg_Status WAITING =
      AgentCallMsg_Status._(1, _omitEnumNames ? '' : 'WAITING');
  static const AgentCallMsg_Status GS_APPROVE =
      AgentCallMsg_Status._(3, _omitEnumNames ? '' : 'GS_APPROVE');
  static const AgentCallMsg_Status AGENT_APPROVE =
      AgentCallMsg_Status._(4, _omitEnumNames ? '' : 'AGENT_APPROVE');
  static const AgentCallMsg_Status BOTH_APPROVE =
      AgentCallMsg_Status._(5, _omitEnumNames ? '' : 'BOTH_APPROVE');

  static const $core.List<AgentCallMsg_Status> values = <AgentCallMsg_Status>[
    UNKNOWN,
    WAITING,
    GS_APPROVE,
    AGENT_APPROVE,
    BOTH_APPROVE,
  ];

  static final $core.List<AgentCallMsg_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static AgentCallMsg_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AgentCallMsg_Status._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

// This is a generated file - do not edit.
//
// Generated from server_client/rtc.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MicResourceType extends $pb.ProtobufEnum {
  static const MicResourceType MIC_FRAME =
      MicResourceType._(0, _omitEnumNames ? '' : 'MIC_FRAME');

  static const $core.List<MicResourceType> values = <MicResourceType>[
    MIC_FRAME,
  ];

  static final $core.List<MicResourceType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 0);
  static MicResourceType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MicResourceType._(super.value, super.name);
}

class ProgramStatus extends $pb.ProtobufEnum {
  static const ProgramStatus NOT_BEGUN =
      ProgramStatus._(0, _omitEnumNames ? '' : 'NOT_BEGUN');
  static const ProgramStatus PROCESS_ING =
      ProgramStatus._(1, _omitEnumNames ? '' : 'PROCESS_ING');
  static const ProgramStatus CANCELLED =
      ProgramStatus._(2, _omitEnumNames ? '' : 'CANCELLED');
  static const ProgramStatus FINISHED =
      ProgramStatus._(3, _omitEnumNames ? '' : 'FINISHED');

  static const $core.List<ProgramStatus> values = <ProgramStatus>[
    NOT_BEGUN,
    PROCESS_ING,
    CANCELLED,
    FINISHED,
  ];

  static final $core.List<ProgramStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ProgramStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ProgramStatus._(super.value, super.name);
}

class RtcUserRole extends $pb.ProtobufEnum {
  static const RtcUserRole Guest =
      RtcUserRole._(0, _omitEnumNames ? '' : 'Guest');
  static const RtcUserRole Manager =
      RtcUserRole._(1, _omitEnumNames ? '' : 'Manager');
  static const RtcUserRole Receptionist =
      RtcUserRole._(2, _omitEnumNames ? '' : 'Receptionist');
  static const RtcUserRole Owner =
      RtcUserRole._(3, _omitEnumNames ? '' : 'Owner');

  static const $core.List<RtcUserRole> values = <RtcUserRole>[
    Guest,
    Manager,
    Receptionist,
    Owner,
  ];

  static final $core.List<RtcUserRole?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static RtcUserRole? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RtcUserRole._(super.value, super.name);
}

class MicTypeEnum extends $pb.ProtobufEnum {
  static const MicTypeEnum HOST_MIC =
      MicTypeEnum._(0, _omitEnumNames ? '' : 'HOST_MIC');
  static const MicTypeEnum CAR_OWNER_MIC =
      MicTypeEnum._(1, _omitEnumNames ? '' : 'CAR_OWNER_MIC');
  static const MicTypeEnum COMMON_MIC =
      MicTypeEnum._(2, _omitEnumNames ? '' : 'COMMON_MIC');

  static const $core.List<MicTypeEnum> values = <MicTypeEnum>[
    HOST_MIC,
    CAR_OWNER_MIC,
    COMMON_MIC,
  ];

  static final $core.List<MicTypeEnum?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static MicTypeEnum? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MicTypeEnum._(super.value, super.name);
}

class MicLayoutEnum extends $pb.ProtobufEnum {
  static const MicLayoutEnum ROUND_TABLE_6 =
      MicLayoutEnum._(0, _omitEnumNames ? '' : 'ROUND_TABLE_6');
  static const MicLayoutEnum TILED_4_4 =
      MicLayoutEnum._(1, _omitEnumNames ? '' : 'TILED_4_4');
  static const MicLayoutEnum TILED_3_5 =
      MicLayoutEnum._(2, _omitEnumNames ? '' : 'TILED_3_5');
  static const MicLayoutEnum TILED_3_3_3 =
      MicLayoutEnum._(3, _omitEnumNames ? '' : 'TILED_3_3_3');
  static const MicLayoutEnum TILED_2 =
      MicLayoutEnum._(4, _omitEnumNames ? '' : 'TILED_2');
  static const MicLayoutEnum TILED_1_4_4 =
      MicLayoutEnum._(5, _omitEnumNames ? '' : 'TILED_1_4_4');
  static const MicLayoutEnum ROUND_TABLE_7 =
      MicLayoutEnum._(6, _omitEnumNames ? '' : 'ROUND_TABLE_7');
  static const MicLayoutEnum TILED_1_1_3_3 =
      MicLayoutEnum._(7, _omitEnumNames ? '' : 'TILED_1_1_3_3');
  static const MicLayoutEnum TILED_3_3 =
      MicLayoutEnum._(8, _omitEnumNames ? '' : 'TILED_3_3');

  static const $core.List<MicLayoutEnum> values = <MicLayoutEnum>[
    ROUND_TABLE_6,
    TILED_4_4,
    TILED_3_5,
    TILED_3_3_3,
    TILED_2,
    TILED_1_4_4,
    ROUND_TABLE_7,
    TILED_1_1_3_3,
    TILED_3_3,
  ];

  static final $core.List<MicLayoutEnum?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 8);
  static MicLayoutEnum? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MicLayoutEnum._(super.value, super.name);
}

class ManagerOperation extends $pb.ProtobufEnum {
  static const ManagerOperation SET_RECEPTION_MANAGER =
      ManagerOperation._(0, _omitEnumNames ? '' : 'SET_RECEPTION_MANAGER');
  static const ManagerOperation SET_MANAGER =
      ManagerOperation._(1, _omitEnumNames ? '' : 'SET_MANAGER');
  static const ManagerOperation BAN_WHEAT =
      ManagerOperation._(2, _omitEnumNames ? '' : 'BAN_WHEAT');
  static const ManagerOperation KICK_OUT =
      ManagerOperation._(3, _omitEnumNames ? '' : 'KICK_OUT');
  static const ManagerOperation REPORT =
      ManagerOperation._(4, _omitEnumNames ? '' : 'REPORT');
  static const ManagerOperation WARN =
      ManagerOperation._(5, _omitEnumNames ? '' : 'WARN');
  static const ManagerOperation WARN_ALL =
      ManagerOperation._(6, _omitEnumNames ? '' : 'WARN_ALL');
  static const ManagerOperation CLOSE_ROOM =
      ManagerOperation._(7, _omitEnumNames ? '' : 'CLOSE_ROOM');
  static const ManagerOperation DESTROY_ROOM =
      ManagerOperation._(8, _omitEnumNames ? '' : 'DESTROY_ROOM');
  static const ManagerOperation VIOLATION_CLOSE_ROOM =
      ManagerOperation._(9, _omitEnumNames ? '' : 'VIOLATION_CLOSE_ROOM');

  static const $core.List<ManagerOperation> values = <ManagerOperation>[
    SET_RECEPTION_MANAGER,
    SET_MANAGER,
    BAN_WHEAT,
    KICK_OUT,
    REPORT,
    WARN,
    WARN_ALL,
    CLOSE_ROOM,
    DESTROY_ROOM,
    VIOLATION_CLOSE_ROOM,
  ];

  static final $core.List<ManagerOperation?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 9);
  static ManagerOperation? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ManagerOperation._(super.value, super.name);
}

class ChannelLabel extends $pb.ProtobufEnum {
  static const ChannelLabel MAKE_FRIENDS_LABEL =
      ChannelLabel._(0, _omitEnumNames ? '' : 'MAKE_FRIENDS_LABEL');
  static const ChannelLabel ORDER_SING_LABEL =
      ChannelLabel._(1, _omitEnumNames ? '' : 'ORDER_SING_LABEL');
  static const ChannelLabel MILLION_CLUB_LABEL =
      ChannelLabel._(2, _omitEnumNames ? '' : 'MILLION_CLUB_LABEL');
  static const ChannelLabel WELCOME_PARTY_LABEL =
      ChannelLabel._(3, _omitEnumNames ? '' : 'WELCOME_PARTY_LABEL');
  static const ChannelLabel JOY_RIDE_LABEL =
      ChannelLabel._(4, _omitEnumNames ? '' : 'JOY_RIDE_LABEL');
  static const ChannelLabel GAME_LABEL =
      ChannelLabel._(5, _omitEnumNames ? '' : 'GAME_LABEL');

  static const $core.List<ChannelLabel> values = <ChannelLabel>[
    MAKE_FRIENDS_LABEL,
    ORDER_SING_LABEL,
    MILLION_CLUB_LABEL,
    WELCOME_PARTY_LABEL,
    JOY_RIDE_LABEL,
    GAME_LABEL,
  ];

  static final $core.List<ChannelLabel?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static ChannelLabel? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChannelLabel._(super.value, super.name);
}

class MicStatus extends $pb.ProtobufEnum {
  static const MicStatus OPEN = MicStatus._(0, _omitEnumNames ? '' : 'OPEN');
  static const MicStatus CLOSE = MicStatus._(1, _omitEnumNames ? '' : 'CLOSE');

  static const $core.List<MicStatus> values = <MicStatus>[
    OPEN,
    CLOSE,
  ];

  static final $core.List<MicStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static MicStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MicStatus._(super.value, super.name);
}

class QueueType extends $pb.ProtobufEnum {
  static const QueueType CAR_OWNER_QUEUE =
      QueueType._(0, _omitEnumNames ? '' : 'CAR_OWNER_QUEUE');
  static const QueueType COMMON_QUEUE =
      QueueType._(1, _omitEnumNames ? '' : 'COMMON_QUEUE');

  static const $core.List<QueueType> values = <QueueType>[
    CAR_OWNER_QUEUE,
    COMMON_QUEUE,
  ];

  static final $core.List<QueueType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static QueueType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const QueueType._(super.value, super.name);
}

class UpMicMode extends $pb.ProtobufEnum {
  static const UpMicMode AUTO_MIC =
      UpMicMode._(0, _omitEnumNames ? '' : 'AUTO_MIC');
  static const UpMicMode QUEUE_MIC =
      UpMicMode._(1, _omitEnumNames ? '' : 'QUEUE_MIC');
  static const UpMicMode FIX_POSITION_MIC =
      UpMicMode._(2, _omitEnumNames ? '' : 'FIX_POSITION_MIC');

  static const $core.List<UpMicMode> values = <UpMicMode>[
    AUTO_MIC,
    QUEUE_MIC,
    FIX_POSITION_MIC,
  ];

  static final $core.List<UpMicMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static UpMicMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpMicMode._(super.value, super.name);
}

class KtvState extends $pb.ProtobufEnum {
  static const KtvState IDLE = KtvState._(0, _omitEnumNames ? '' : 'IDLE');
  static const KtvState WAIT = KtvState._(1, _omitEnumNames ? '' : 'WAIT');
  static const KtvState SING = KtvState._(2, _omitEnumNames ? '' : 'SING');

  static const $core.List<KtvState> values = <KtvState>[
    IDLE,
    WAIT,
    SING,
  ];

  static final $core.List<KtvState?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static KtvState? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const KtvState._(super.value, super.name);
}

class RoomStatusEnum extends $pb.ProtobufEnum {
  static const RoomStatusEnum NORMAL =
      RoomStatusEnum._(0, _omitEnumNames ? '' : 'NORMAL');
  static const RoomStatusEnum CLOSED =
      RoomStatusEnum._(1, _omitEnumNames ? '' : 'CLOSED');
  static const RoomStatusEnum DESTROYED =
      RoomStatusEnum._(2, _omitEnumNames ? '' : 'DESTROYED');

  static const $core.List<RoomStatusEnum> values = <RoomStatusEnum>[
    NORMAL,
    CLOSED,
    DESTROYED,
  ];

  static final $core.List<RoomStatusEnum?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static RoomStatusEnum? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RoomStatusEnum._(super.value, super.name);
}

class JoinSource extends $pb.ProtobufEnum {
  static const JoinSource ROOM_LIST =
      JoinSource._(0, _omitEnumNames ? '' : 'ROOM_LIST');
  static const JoinSource FOLLOW_ROOM =
      JoinSource._(1, _omitEnumNames ? '' : 'FOLLOW_ROOM');
  static const JoinSource ROOM_RELATION_LIST =
      JoinSource._(2, _omitEnumNames ? '' : 'ROOM_RELATION_LIST');
  static const JoinSource SINGLE_CHAT_RIDE_INVITE =
      JoinSource._(3, _omitEnumNames ? '' : 'SINGLE_CHAT_RIDE_INVITE');
  static const JoinSource WISH_RIDE_INVITE =
      JoinSource._(4, _omitEnumNames ? '' : 'WISH_RIDE_INVITE');
  static const JoinSource SINGLE_CHAT_FOLLOW_ROOM =
      JoinSource._(5, _omitEnumNames ? '' : 'SINGLE_CHAT_FOLLOW_ROOM');
  static const JoinSource HALL_DISPATCH_ORDER =
      JoinSource._(6, _omitEnumNames ? '' : 'HALL_DISPATCH_ORDER');
  static const JoinSource WELCOME_PARTY_DISPATCH_ORDER =
      JoinSource._(7, _omitEnumNames ? '' : 'WELCOME_PARTY_DISPATCH_ORDER');
  static const JoinSource ROOM_SHARE =
      JoinSource._(8, _omitEnumNames ? '' : 'ROOM_SHARE');
  static const JoinSource ROBOT_JOIN =
      JoinSource._(9, _omitEnumNames ? '' : 'ROBOT_JOIN');
  static const JoinSource AGENT_CALL_MSG =
      JoinSource._(10, _omitEnumNames ? '' : 'AGENT_CALL_MSG');
  static const JoinSource CREATE_GAME_ROOM =
      JoinSource._(11, _omitEnumNames ? '' : 'CREATE_GAME_ROOM');
  static const JoinSource INVITE_NOTICE =
      JoinSource._(12, _omitEnumNames ? '' : 'INVITE_NOTICE');
  static const JoinSource HEART_LINK_INVITE =
      JoinSource._(13, _omitEnumNames ? '' : 'HEART_LINK_INVITE');

  static const $core.List<JoinSource> values = <JoinSource>[
    ROOM_LIST,
    FOLLOW_ROOM,
    ROOM_RELATION_LIST,
    SINGLE_CHAT_RIDE_INVITE,
    WISH_RIDE_INVITE,
    SINGLE_CHAT_FOLLOW_ROOM,
    HALL_DISPATCH_ORDER,
    WELCOME_PARTY_DISPATCH_ORDER,
    ROOM_SHARE,
    ROBOT_JOIN,
    AGENT_CALL_MSG,
    CREATE_GAME_ROOM,
    INVITE_NOTICE,
    HEART_LINK_INVITE,
  ];

  static final $core.List<JoinSource?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 13);
  static JoinSource? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const JoinSource._(super.value, super.name);
}

class RoomType extends $pb.ProtobufEnum {
  static const RoomType HOT_HALL =
      RoomType._(0, _omitEnumNames ? '' : 'HOT_HALL');
  static const RoomType MILLION_CLUB =
      RoomType._(1, _omitEnumNames ? '' : 'MILLION_CLUB');
  static const RoomType MAKE_FRIENDS =
      RoomType._(2, _omitEnumNames ? '' : 'MAKE_FRIENDS');
  static const RoomType ORDER_SING =
      RoomType._(3, _omitEnumNames ? '' : 'ORDER_SING');
  static const RoomType JOY_RIDE =
      RoomType._(4, _omitEnumNames ? '' : 'JOY_RIDE');
  static const RoomType GAME = RoomType._(5, _omitEnumNames ? '' : 'GAME');
  static const RoomType CP = RoomType._(6, _omitEnumNames ? '' : 'CP');
  static const RoomType HEART_LINK =
      RoomType._(7, _omitEnumNames ? '' : 'HEART_LINK');
  static const RoomType AUCTION =
      RoomType._(8, _omitEnumNames ? '' : 'AUCTION');
  static const RoomType STORY = RoomType._(9, _omitEnumNames ? '' : 'STORY');
  static const RoomType NEWBIE = RoomType._(10, _omitEnumNames ? '' : 'NEWBIE');

  static const $core.List<RoomType> values = <RoomType>[
    HOT_HALL,
    MILLION_CLUB,
    MAKE_FRIENDS,
    ORDER_SING,
    JOY_RIDE,
    GAME,
    CP,
    HEART_LINK,
    AUCTION,
    STORY,
    NEWBIE,
  ];

  static final $core.List<RoomType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static RoomType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RoomType._(super.value, super.name);
}

class BackgroundType extends $pb.ProtobufEnum {
  static const BackgroundType STATIC =
      BackgroundType._(0, _omitEnumNames ? '' : 'STATIC');
  static const BackgroundType DYNAMIC =
      BackgroundType._(1, _omitEnumNames ? '' : 'DYNAMIC');

  static const $core.List<BackgroundType> values = <BackgroundType>[
    STATIC,
    DYNAMIC,
  ];

  static final $core.List<BackgroundType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static BackgroundType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BackgroundType._(super.value, super.name);
}

/// 房间用途
class RoomUsage extends $pb.ProtobufEnum {
  static const RoomUsage UNKNOWN =
      RoomUsage._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const RoomUsage TEMPORARY =
      RoomUsage._(1, _omitEnumNames ? '' : 'TEMPORARY');
  static const RoomUsage COMMON =
      RoomUsage._(2, _omitEnumNames ? '' : 'COMMON');
  static const RoomUsage BUSINESS =
      RoomUsage._(3, _omitEnumNames ? '' : 'BUSINESS');
  static const RoomUsage GS_TRAIN =
      RoomUsage._(4, _omitEnumNames ? '' : 'GS_TRAIN');

  static const $core.List<RoomUsage> values = <RoomUsage>[
    UNKNOWN,
    TEMPORARY,
    COMMON,
    BUSINESS,
    GS_TRAIN,
  ];

  static final $core.List<RoomUsage?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static RoomUsage? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RoomUsage._(super.value, super.name);
}

class RtcConfig_Type extends $pb.ProtobufEnum {
  static const RtcConfig_Type unknown =
      RtcConfig_Type._(0, _omitEnumNames ? '' : 'unknown');
  static const RtcConfig_Type agora =
      RtcConfig_Type._(1, _omitEnumNames ? '' : 'agora');
  static const RtcConfig_Type tencent =
      RtcConfig_Type._(2, _omitEnumNames ? '' : 'tencent');

  static const $core.List<RtcConfig_Type> values = <RtcConfig_Type>[
    unknown,
    agora,
    tencent,
  ];

  static final $core.List<RtcConfig_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static RtcConfig_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RtcConfig_Type._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

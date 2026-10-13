// This is a generated file - do not edit.
//
// Generated from server_client/knight.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class KnightPrivilegeType extends $pb.ProtobufEnum {
  static const KnightPrivilegeType UnKnowKnightPrivilegeType =
      KnightPrivilegeType._(
          0, _omitEnumNames ? '' : 'UnKnowKnightPrivilegeType');
  static const KnightPrivilegeType KnightMedal =
      KnightPrivilegeType._(1, _omitEnumNames ? '' : 'KnightMedal');
  static const KnightPrivilegeType ExclusiveGift =
      KnightPrivilegeType._(2, _omitEnumNames ? '' : 'ExclusiveGift');
  static const KnightPrivilegeType ExpSpeedUp =
      KnightPrivilegeType._(3, _omitEnumNames ? '' : 'ExpSpeedUp');
  static const KnightPrivilegeType ExclusiveMakeUp =
      KnightPrivilegeType._(4, _omitEnumNames ? '' : 'ExclusiveMakeUp');
  static const KnightPrivilegeType ExclusiveRoomMakeUp =
      KnightPrivilegeType._(5, _omitEnumNames ? '' : 'ExclusiveRoomMakeUp');
  static const KnightPrivilegeType GiftFloatScreen =
      KnightPrivilegeType._(6, _omitEnumNames ? '' : 'GiftFloatScreen');
  static const KnightPrivilegeType InvisibleRank =
      KnightPrivilegeType._(7, _omitEnumNames ? '' : 'InvisibleRank');
  static const KnightPrivilegeType ForbidBeKicked =
      KnightPrivilegeType._(8, _omitEnumNames ? '' : 'ForbidBeKicked');
  static const KnightPrivilegeType RoomAddHeat =
      KnightPrivilegeType._(9, _omitEnumNames ? '' : 'RoomAddHeat');
  static const KnightPrivilegeType InvisibleVisit =
      KnightPrivilegeType._(10, _omitEnumNames ? '' : 'InvisibleVisit');
  static const KnightPrivilegeType ForbidWord =
      KnightPrivilegeType._(11, _omitEnumNames ? '' : 'ForbidWord');
  static const KnightPrivilegeType KickUser =
      KnightPrivilegeType._(12, _omitEnumNames ? '' : 'KickUser');
  static const KnightPrivilegeType InvisibleEnterRoom =
      KnightPrivilegeType._(13, _omitEnumNames ? '' : 'InvisibleEnterRoom');
  static const KnightPrivilegeType AnonymousUpMic =
      KnightPrivilegeType._(14, _omitEnumNames ? '' : 'AnonymousUpMic');

  static const $core.List<KnightPrivilegeType> values = <KnightPrivilegeType>[
    UnKnowKnightPrivilegeType,
    KnightMedal,
    ExclusiveGift,
    ExpSpeedUp,
    ExclusiveMakeUp,
    ExclusiveRoomMakeUp,
    GiftFloatScreen,
    InvisibleRank,
    ForbidBeKicked,
    RoomAddHeat,
    InvisibleVisit,
    ForbidWord,
    KickUser,
    InvisibleEnterRoom,
    AnonymousUpMic,
  ];

  static final $core.List<KnightPrivilegeType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 14);
  static KnightPrivilegeType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const KnightPrivilegeType._(super.value, super.name);
}

class KnightSetType extends $pb.ProtobufEnum {
  static const KnightSetType UnKnowKnightSetType =
      KnightSetType._(0, _omitEnumNames ? '' : 'UnKnowKnightSetType');
  static const KnightSetType EnterRoom =
      KnightSetType._(1, _omitEnumNames ? '' : 'EnterRoom');
  static const KnightSetType Visit =
      KnightSetType._(2, _omitEnumNames ? '' : 'Visit');
  static const KnightSetType Rank =
      KnightSetType._(3, _omitEnumNames ? '' : 'Rank');
  static const KnightSetType UpMic =
      KnightSetType._(4, _omitEnumNames ? '' : 'UpMic');

  static const $core.List<KnightSetType> values = <KnightSetType>[
    UnKnowKnightSetType,
    EnterRoom,
    Visit,
    Rank,
    UpMic,
  ];

  static final $core.List<KnightSetType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static KnightSetType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const KnightSetType._(super.value, super.name);
}

class KnightOpeationType extends $pb.ProtobufEnum {
  static const KnightOpeationType UnKnowKnightOpeationType =
      KnightOpeationType._(0, _omitEnumNames ? '' : 'UnKnowKnightOpeationType');
  static const KnightOpeationType KnightOpeationForbidWord =
      KnightOpeationType._(1, _omitEnumNames ? '' : 'KnightOpeationForbidWord');
  static const KnightOpeationType KnightOpeationVisit =
      KnightOpeationType._(2, _omitEnumNames ? '' : 'KnightOpeationVisit');
  static const KnightOpeationType KnightOpeationRank =
      KnightOpeationType._(3, _omitEnumNames ? '' : 'KnightOpeationRank');

  static const $core.List<KnightOpeationType> values = <KnightOpeationType>[
    UnKnowKnightOpeationType,
    KnightOpeationForbidWord,
    KnightOpeationVisit,
    KnightOpeationRank,
  ];

  static final $core.List<KnightOpeationType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static KnightOpeationType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const KnightOpeationType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

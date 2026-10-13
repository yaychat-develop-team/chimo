// This is a generated file - do not edit.
//
// Generated from server_client/ban.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BanScene extends $pb.ProtobufEnum {
  static const BanScene AUTH = BanScene._(0, _omitEnumNames ? '' : 'AUTH');
  static const BanScene WALLET = BanScene._(1, _omitEnumNames ? '' : 'WALLET');
  static const BanScene INTERACTIVE =
      BanScene._(2, _omitEnumNames ? '' : 'INTERACTIVE');
  static const BanScene ROOM = BanScene._(3, _omitEnumNames ? '' : 'ROOM');

  static const $core.List<BanScene> values = <BanScene>[
    AUTH,
    WALLET,
    INTERACTIVE,
    ROOM,
  ];

  static final $core.List<BanScene?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static BanScene? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BanScene._(super.value, super.name);
}

class BanType extends $pb.ProtobufEnum {
  static const BanType ACCOUNT = BanType._(0, _omitEnumNames ? '' : 'ACCOUNT');
  static const BanType ACCOUNT_AND_DEVICE =
      BanType._(1, _omitEnumNames ? '' : 'ACCOUNT_AND_DEVICE');
  static const BanType WITHDRAW =
      BanType._(2, _omitEnumNames ? '' : 'WITHDRAW');
  static const BanType GIVE = BanType._(3, _omitEnumNames ? '' : 'GIVE');
  static const BanType WITHDRAW_AND_GIVE =
      BanType._(4, _omitEnumNames ? '' : 'WITHDRAW_AND_GIVE');
  static const BanType UP_MIC = BanType._(5, _omitEnumNames ? '' : 'UP_MIC');
  static const BanType PRIVATE_CHAT =
      BanType._(6, _omitEnumNames ? '' : 'PRIVATE_CHAT');
  static const BanType UP_MIC_AND_PRIVATE_CHAT =
      BanType._(7, _omitEnumNames ? '' : 'UP_MIC_AND_PRIVATE_CHAT');
  static const BanType ROOM_BAN =
      BanType._(8, _omitEnumNames ? '' : 'ROOM_BAN');
  static const BanType IP = BanType._(9, _omitEnumNames ? '' : 'IP');

  static const $core.List<BanType> values = <BanType>[
    ACCOUNT,
    ACCOUNT_AND_DEVICE,
    WITHDRAW,
    GIVE,
    WITHDRAW_AND_GIVE,
    UP_MIC,
    PRIVATE_CHAT,
    UP_MIC_AND_PRIVATE_CHAT,
    ROOM_BAN,
    IP,
  ];

  static final $core.List<BanType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 9);
  static BanType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BanType._(super.value, super.name);
}

class BanLevel extends $pb.ProtobufEnum {
  static const BanLevel S = BanLevel._(0, _omitEnumNames ? '' : 'S');
  static const BanLevel A = BanLevel._(1, _omitEnumNames ? '' : 'A');
  static const BanLevel B = BanLevel._(2, _omitEnumNames ? '' : 'B');
  static const BanLevel C = BanLevel._(3, _omitEnumNames ? '' : 'C');

  static const $core.List<BanLevel> values = <BanLevel>[
    S,
    A,
    B,
    C,
  ];

  static final $core.List<BanLevel?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static BanLevel? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BanLevel._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

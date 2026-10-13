// This is a generated file - do not edit.
//
// Generated from server_client/common/app.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 游戏货币类型
class GameCurrency extends $pb.ProtobufEnum {
  static const GameCurrency COINS =
      GameCurrency._(0, _omitEnumNames ? '' : 'COINS');
  static const GameCurrency GEMS =
      GameCurrency._(1, _omitEnumNames ? '' : 'GEMS');

  static const $core.List<GameCurrency> values = <GameCurrency>[
    COINS,
    GEMS,
  ];

  static final $core.List<GameCurrency?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static GameCurrency? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GameCurrency._(super.value, super.name);
}

class UpdateMode extends $pb.ProtobufEnum {
  static const UpdateMode FORCE_UPDATE =
      UpdateMode._(0, _omitEnumNames ? '' : 'FORCE_UPDATE');
  static const UpdateMode REMIND =
      UpdateMode._(1, _omitEnumNames ? '' : 'REMIND');
  static const UpdateMode NOT_REMIND =
      UpdateMode._(2, _omitEnumNames ? '' : 'NOT_REMIND');

  static const $core.List<UpdateMode> values = <UpdateMode>[
    FORCE_UPDATE,
    REMIND,
    NOT_REMIND,
  ];

  static final $core.List<UpdateMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static UpdateMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UpdateMode._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

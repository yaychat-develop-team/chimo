// This is a generated file - do not edit.
//
// Generated from server_client/yy_game.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class StartGameRsp_MoneyType extends $pb.ProtobufEnum {
  static const StartGameRsp_MoneyType UNSPECIFIED =
      StartGameRsp_MoneyType._(0, _omitEnumNames ? '' : 'UNSPECIFIED');
  static const StartGameRsp_MoneyType COIN =
      StartGameRsp_MoneyType._(1, _omitEnumNames ? '' : 'COIN');
  static const StartGameRsp_MoneyType GEM =
      StartGameRsp_MoneyType._(2, _omitEnumNames ? '' : 'GEM');

  static const $core.List<StartGameRsp_MoneyType> values =
      <StartGameRsp_MoneyType>[
    UNSPECIFIED,
    COIN,
    GEM,
  ];

  static final $core.List<StartGameRsp_MoneyType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static StartGameRsp_MoneyType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StartGameRsp_MoneyType._(super.value, super.name);
}

class ExchangeReq_Type extends $pb.ProtobufEnum {
  static const ExchangeReq_Type UNSPECIFIED =
      ExchangeReq_Type._(0, _omitEnumNames ? '' : 'UNSPECIFIED');
  static const ExchangeReq_Type COIN_TO_GAME =
      ExchangeReq_Type._(1, _omitEnumNames ? '' : 'COIN_TO_GAME');
  static const ExchangeReq_Type GAME_TO_COIN =
      ExchangeReq_Type._(2, _omitEnumNames ? '' : 'GAME_TO_COIN');

  static const $core.List<ExchangeReq_Type> values = <ExchangeReq_Type>[
    UNSPECIFIED,
    COIN_TO_GAME,
    GAME_TO_COIN,
  ];

  static final $core.List<ExchangeReq_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ExchangeReq_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ExchangeReq_Type._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

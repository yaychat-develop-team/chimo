// This is a generated file - do not edit.
//
// Generated from server_client/fleet/info.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class FleetRankType extends $pb.ProtobufEnum {
  static const FleetRankType Unknown =
      FleetRankType._(0, _omitEnumNames ? '' : 'Unknown');
  static const FleetRankType Exp =
      FleetRankType._(1, _omitEnumNames ? '' : 'Exp');
  static const FleetRankType Star =
      FleetRankType._(2, _omitEnumNames ? '' : 'Star');
  static const FleetRankType Coin =
      FleetRankType._(3, _omitEnumNames ? '' : 'Coin');

  static const $core.List<FleetRankType> values = <FleetRankType>[
    Unknown,
    Exp,
    Star,
    Coin,
  ];

  static final $core.List<FleetRankType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static FleetRankType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FleetRankType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

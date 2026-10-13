// This is a generated file - do not edit.
//
// Generated from server_client/fleet/treasure.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 舰队福利4个版本枚举
class FleetRewardVer extends $pb.ProtobufEnum {
  static const FleetRewardVer UNKNOWN =
      FleetRewardVer._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const FleetRewardVer BASIC =
      FleetRewardVer._(1, _omitEnumNames ? '' : 'BASIC');
  static const FleetRewardVer ENHANCED =
      FleetRewardVer._(2, _omitEnumNames ? '' : 'ENHANCED');
  static const FleetRewardVer ADVANCED =
      FleetRewardVer._(3, _omitEnumNames ? '' : 'ADVANCED');
  static const FleetRewardVer ELITE =
      FleetRewardVer._(4, _omitEnumNames ? '' : 'ELITE');

  static const $core.List<FleetRewardVer> values = <FleetRewardVer>[
    UNKNOWN,
    BASIC,
    ENHANCED,
    ADVANCED,
    ELITE,
  ];

  static final $core.List<FleetRewardVer?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static FleetRewardVer? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FleetRewardVer._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

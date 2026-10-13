// This is a generated file - do not edit.
//
// Generated from server_client/fleet/base.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 恶龙的状态
class FleetDragonStatus extends $pb.ProtobufEnum {
  static const FleetDragonStatus Unknown =
      FleetDragonStatus._(0, _omitEnumNames ? '' : 'Unknown');
  static const FleetDragonStatus Healthy =
      FleetDragonStatus._(1, _omitEnumNames ? '' : 'Healthy');
  static const FleetDragonStatus Injured =
      FleetDragonStatus._(2, _omitEnumNames ? '' : 'Injured');
  static const FleetDragonStatus Hunger =
      FleetDragonStatus._(3, _omitEnumNames ? '' : 'Hunger');

  static const $core.List<FleetDragonStatus> values = <FleetDragonStatus>[
    Unknown,
    Healthy,
    Injured,
    Hunger,
  ];

  static final $core.List<FleetDragonStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static FleetDragonStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FleetDragonStatus._(super.value, super.name);
}

/// PK 奖励类型
class PkRewardType extends $pb.ProtobufEnum {
  static const PkRewardType STARTS =
      PkRewardType._(0, _omitEnumNames ? '' : 'STARTS');
  static const PkRewardType COLOURS =
      PkRewardType._(1, _omitEnumNames ? '' : 'COLOURS');

  static const $core.List<PkRewardType> values = <PkRewardType>[
    STARTS,
    COLOURS,
  ];

  static final $core.List<PkRewardType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static PkRewardType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PkRewardType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

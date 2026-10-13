// This is a generated file - do not edit.
//
// Generated from server_client/common/car.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 座驾等级
class CarLevel extends $pb.ProtobufEnum {
  static const CarLevel CarLevel_UNKNOWN =
      CarLevel._(0, _omitEnumNames ? '' : 'CarLevel_UNKNOWN');
  static const CarLevel SSS = CarLevel._(1, _omitEnumNames ? '' : 'SSS');
  static const CarLevel SS = CarLevel._(2, _omitEnumNames ? '' : 'SS');
  static const CarLevel S = CarLevel._(3, _omitEnumNames ? '' : 'S');
  static const CarLevel A = CarLevel._(4, _omitEnumNames ? '' : 'A');
  static const CarLevel B = CarLevel._(5, _omitEnumNames ? '' : 'B');

  static const $core.List<CarLevel> values = <CarLevel>[
    CarLevel_UNKNOWN,
    SSS,
    SS,
    S,
    A,
    B,
  ];

  static final $core.List<CarLevel?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static CarLevel? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CarLevel._(super.value, super.name);
}

/// 座驾状态
class CarStatus extends $pb.ProtobufEnum {
  static const CarStatus CarStatus_UNKNOWN =
      CarStatus._(0, _omitEnumNames ? '' : 'CarStatus_UNKNOWN');
  static const CarStatus OFF_SHELF =
      CarStatus._(1, _omitEnumNames ? '' : 'OFF_SHELF');
  static const CarStatus ON_SHELF =
      CarStatus._(2, _omitEnumNames ? '' : 'ON_SHELF');

  static const $core.List<CarStatus> values = <CarStatus>[
    CarStatus_UNKNOWN,
    OFF_SHELF,
    ON_SHELF,
  ];

  static final $core.List<CarStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static CarStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CarStatus._(super.value, super.name);
}

/// 座驾特权类型
class CarPrivilegeType extends $pb.ProtobufEnum {
  static const CarPrivilegeType CarPrivilegeType_UNKNOWN =
      CarPrivilegeType._(0, _omitEnumNames ? '' : 'CarPrivilegeType_UNKNOWN');
  static const CarPrivilegeType TALENT_SHOW =
      CarPrivilegeType._(1, _omitEnumNames ? '' : 'TALENT_SHOW');
  static const CarPrivilegeType BIG_ADVENTURE =
      CarPrivilegeType._(2, _omitEnumNames ? '' : 'BIG_ADVENTURE');
  static const CarPrivilegeType TRUTH =
      CarPrivilegeType._(3, _omitEnumNames ? '' : 'TRUTH');

  static const $core.List<CarPrivilegeType> values = <CarPrivilegeType>[
    CarPrivilegeType_UNKNOWN,
    TALENT_SHOW,
    BIG_ADVENTURE,
    TRUTH,
  ];

  static final $core.List<CarPrivilegeType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static CarPrivilegeType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CarPrivilegeType._(super.value, super.name);
}

/// 座驾盲盒等级
class CarBlindBoxLevel extends $pb.ProtobufEnum {
  static const CarBlindBoxLevel CarBlindBoxLevel_UNKNOWN =
      CarBlindBoxLevel._(0, _omitEnumNames ? '' : 'CarBlindBoxLevel_UNKNOWN');
  static const CarBlindBoxLevel GREAT_VALUE =
      CarBlindBoxLevel._(1, _omitEnumNames ? '' : 'GREAT_VALUE');
  static const CarBlindBoxLevel ADVANCE =
      CarBlindBoxLevel._(2, _omitEnumNames ? '' : 'ADVANCE');
  static const CarBlindBoxLevel LUXURY =
      CarBlindBoxLevel._(3, _omitEnumNames ? '' : 'LUXURY');

  static const $core.List<CarBlindBoxLevel> values = <CarBlindBoxLevel>[
    CarBlindBoxLevel_UNKNOWN,
    GREAT_VALUE,
    ADVANCE,
    LUXURY,
  ];

  static final $core.List<CarBlindBoxLevel?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static CarBlindBoxLevel? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CarBlindBoxLevel._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

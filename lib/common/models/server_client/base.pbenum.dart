// This is a generated file - do not edit.
//
// Generated from server_client/base.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Gender extends $pb.ProtobufEnum {
  static const Gender UNKNOWN = Gender._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const Gender MALE = Gender._(1, _omitEnumNames ? '' : 'MALE');
  static const Gender FEMALE = Gender._(2, _omitEnumNames ? '' : 'FEMALE');

  static const $core.List<Gender> values = <Gender>[
    UNKNOWN,
    MALE,
    FEMALE,
  ];

  static final $core.List<Gender?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static Gender? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Gender._(super.value, super.name);
}

class RelationType extends $pb.ProtobufEnum {
  static const RelationType NONE =
      RelationType._(0, _omitEnumNames ? '' : 'NONE');
  static const RelationType FOLLOW =
      RelationType._(1, _omitEnumNames ? '' : 'FOLLOW');
  static const RelationType FAN =
      RelationType._(2, _omitEnumNames ? '' : 'FAN');
  static const RelationType FRIEND =
      RelationType._(3, _omitEnumNames ? '' : 'FRIEND');
  static const RelationType ME = RelationType._(4, _omitEnumNames ? '' : 'ME');

  static const $core.List<RelationType> values = <RelationType>[
    NONE,
    FOLLOW,
    FAN,
    FRIEND,
    ME,
  ];

  static final $core.List<RelationType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static RelationType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RelationType._(super.value, super.name);
}

class Job extends $pb.ProtobufEnum {
  static const Job GS = Job._(0, _omitEnumNames ? '' : 'GS');

  /// FEMALE_GS = 1; // 废弃，女嘉宾
  static const Job BOSS = Job._(2, _omitEnumNames ? '' : 'BOSS');

  static const $core.List<Job> values = <Job>[
    GS,
    BOSS,
  ];

  static final $core.Map<$core.int, Job> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Job? valueOf($core.int value) => _byValue[value];

  const Job._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

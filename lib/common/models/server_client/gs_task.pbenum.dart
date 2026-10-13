// This is a generated file - do not edit.
//
// Generated from server_client/gs_task.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Cycle extends $pb.ProtobufEnum {
  static const Cycle LAST_WEEK = Cycle._(0, _omitEnumNames ? '' : 'LAST_WEEK');
  static const Cycle THIS_WEEK = Cycle._(1, _omitEnumNames ? '' : 'THIS_WEEK');
  static const Cycle NEXT_WEEK = Cycle._(2, _omitEnumNames ? '' : 'NEXT_WEEK');

  static const $core.List<Cycle> values = <Cycle>[
    LAST_WEEK,
    THIS_WEEK,
    NEXT_WEEK,
  ];

  static final $core.List<Cycle?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static Cycle? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Cycle._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

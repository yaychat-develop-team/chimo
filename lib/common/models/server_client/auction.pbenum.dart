// This is a generated file - do not edit.
//
// Generated from server_client/auction.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Stage extends $pb.ProtobufEnum {
  static const Stage NONE = Stage._(0, _omitEnumNames ? '' : 'NONE');
  static const Stage PREPARATION =
      Stage._(1, _omitEnumNames ? '' : 'PREPARATION');
  static const Stage PERFORMANCE =
      Stage._(2, _omitEnumNames ? '' : 'PERFORMANCE');
  static const Stage AUCTION = Stage._(3, _omitEnumNames ? '' : 'AUCTION');
  static const Stage SIGNING = Stage._(4, _omitEnumNames ? '' : 'SIGNING');
  static const Stage END = Stage._(5, _omitEnumNames ? '' : 'END');

  static const $core.List<Stage> values = <Stage>[
    NONE,
    PREPARATION,
    PERFORMANCE,
    AUCTION,
    SIGNING,
    END,
  ];

  static final $core.List<Stage?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static Stage? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Stage._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

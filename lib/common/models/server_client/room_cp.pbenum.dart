// This is a generated file - do not edit.
//
// Generated from server_client/room_cp.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CPStage extends $pb.ProtobufEnum {
  static const CPStage none = CPStage._(0, _omitEnumNames ? '' : 'none');
  static const CPStage introduce =
      CPStage._(1, _omitEnumNames ? '' : 'introduce');
  static const CPStage choose = CPStage._(2, _omitEnumNames ? '' : 'choose');
  static const CPStage hand = CPStage._(3, _omitEnumNames ? '' : 'hand');
  static const CPStage end = CPStage._(4, _omitEnumNames ? '' : 'end');

  static const $core.List<CPStage> values = <CPStage>[
    none,
    introduce,
    choose,
    hand,
    end,
  ];

  static final $core.List<CPStage?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static CPStage? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CPStage._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

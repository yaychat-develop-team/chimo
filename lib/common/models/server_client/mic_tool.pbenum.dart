// This is a generated file - do not edit.
//
// Generated from server_client/mic_tool.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 举报类型
class OpType extends $pb.ProtobufEnum {
  static const OpType OP_OPEN = OpType._(0, _omitEnumNames ? '' : 'OP_OPEN');
  static const OpType OP_CLOSE = OpType._(1, _omitEnumNames ? '' : 'OP_CLOSE');

  static const $core.List<OpType> values = <OpType>[
    OP_OPEN,
    OP_CLOSE,
  ];

  static final $core.List<OpType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static OpType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const OpType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

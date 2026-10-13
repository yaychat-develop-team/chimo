// This is a generated file - do not edit.
//
// Generated from server_client/quick_msg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class QuickMsgFormat extends $pb.ProtobufEnum {
  static const QuickMsgFormat TEXT =
      QuickMsgFormat._(0, _omitEnumNames ? '' : 'TEXT');
  static const QuickMsgFormat IMAGE =
      QuickMsgFormat._(1, _omitEnumNames ? '' : 'IMAGE');
  static const QuickMsgFormat AUDIO =
      QuickMsgFormat._(2, _omitEnumNames ? '' : 'AUDIO');
  static const QuickMsgFormat VIDEO =
      QuickMsgFormat._(3, _omitEnumNames ? '' : 'VIDEO');

  static const $core.List<QuickMsgFormat> values = <QuickMsgFormat>[
    TEXT,
    IMAGE,
    AUDIO,
    VIDEO,
  ];

  static final $core.List<QuickMsgFormat?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static QuickMsgFormat? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const QuickMsgFormat._(super.value, super.name);
}

class QuickMsgOp extends $pb.ProtobufEnum {
  static const QuickMsgOp IDLE = QuickMsgOp._(0, _omitEnumNames ? '' : 'IDLE');
  static const QuickMsgOp INSERT =
      QuickMsgOp._(1, _omitEnumNames ? '' : 'INSERT');
  static const QuickMsgOp UPDATE =
      QuickMsgOp._(2, _omitEnumNames ? '' : 'UPDATE');
  static const QuickMsgOp DEL = QuickMsgOp._(3, _omitEnumNames ? '' : 'DEL');

  static const $core.List<QuickMsgOp> values = <QuickMsgOp>[
    IDLE,
    INSERT,
    UPDATE,
    DEL,
  ];

  static final $core.List<QuickMsgOp?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static QuickMsgOp? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const QuickMsgOp._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

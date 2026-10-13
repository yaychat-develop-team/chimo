// This is a generated file - do not edit.
//
// Generated from server_client/system_msg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Format extends $pb.ProtobufEnum {
  static const Format TEXT = Format._(0, _omitEnumNames ? '' : 'TEXT');
  static const Format TEXT_LINK =
      Format._(1, _omitEnumNames ? '' : 'TEXT_LINK');
  static const Format IMAGE = Format._(2, _omitEnumNames ? '' : 'IMAGE');
  static const Format IMAGE_LINK =
      Format._(3, _omitEnumNames ? '' : 'IMAGE_LINK');
  static const Format IMAGE_TEXT =
      Format._(4, _omitEnumNames ? '' : 'IMAGE_TEXT');
  static const Format IMAGE_TEXT_LINK =
      Format._(5, _omitEnumNames ? '' : 'IMAGE_TEXT_LINK');

  static const $core.List<Format> values = <Format>[
    TEXT,
    TEXT_LINK,
    IMAGE,
    IMAGE_LINK,
    IMAGE_TEXT,
    IMAGE_TEXT_LINK,
  ];

  static final $core.List<Format?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static Format? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Format._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

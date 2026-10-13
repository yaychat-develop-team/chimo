// This is a generated file - do not edit.
//
// Generated from server_client/heart_link.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MediaTypeEnum extends $pb.ProtobufEnum {
  static const MediaTypeEnum UNKNOWN =
      MediaTypeEnum._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const MediaTypeEnum IMAGE =
      MediaTypeEnum._(1, _omitEnumNames ? '' : 'IMAGE');
  static const MediaTypeEnum VIDEO =
      MediaTypeEnum._(2, _omitEnumNames ? '' : 'VIDEO');
  static const MediaTypeEnum AUDIO =
      MediaTypeEnum._(3, _omitEnumNames ? '' : 'AUDIO');

  static const $core.List<MediaTypeEnum> values = <MediaTypeEnum>[
    UNKNOWN,
    IMAGE,
    VIDEO,
    AUDIO,
  ];

  static final $core.List<MediaTypeEnum?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static MediaTypeEnum? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MediaTypeEnum._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

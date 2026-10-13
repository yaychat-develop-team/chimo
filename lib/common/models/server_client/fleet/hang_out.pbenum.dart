// This is a generated file - do not edit.
//
// Generated from server_client/fleet/hang_out.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class HangOutScene extends $pb.ProtobufEnum {
  static const HangOutScene ENTER =
      HangOutScene._(0, _omitEnumNames ? '' : 'ENTER');
  static const HangOutScene GO_OUT =
      HangOutScene._(1, _omitEnumNames ? '' : 'GO_OUT');
  static const HangOutScene CHAT =
      HangOutScene._(2, _omitEnumNames ? '' : 'CHAT');
  static const HangOutScene RECEIVE_GIFT =
      HangOutScene._(3, _omitEnumNames ? '' : 'RECEIVE_GIFT');
  static const HangOutScene STROLL =
      HangOutScene._(4, _omitEnumNames ? '' : 'STROLL');

  static const $core.List<HangOutScene> values = <HangOutScene>[
    ENTER,
    GO_OUT,
    CHAT,
    RECEIVE_GIFT,
    STROLL,
  ];

  static final $core.List<HangOutScene?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static HangOutScene? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const HangOutScene._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

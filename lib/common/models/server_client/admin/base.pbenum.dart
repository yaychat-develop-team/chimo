// This is a generated file - do not edit.
//
// Generated from server_client/admin/base.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class LabelType extends $pb.ProtobufEnum {
  static const LabelType FUNCTION =
      LabelType._(0, _omitEnumNames ? '' : 'FUNCTION');
  static const LabelType USER = LabelType._(1, _omitEnumNames ? '' : 'USER');
  static const LabelType GS = LabelType._(2, _omitEnumNames ? '' : 'GS');

  static const $core.List<LabelType> values = <LabelType>[
    FUNCTION,
    USER,
    GS,
  ];

  static final $core.List<LabelType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static LabelType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const LabelType._(super.value, super.name);
}

class BlockLoginStatus extends $pb.ProtobufEnum {
  static const BlockLoginStatus BLOCK_ACCOUNT =
      BlockLoginStatus._(0, _omitEnumNames ? '' : 'BLOCK_ACCOUNT');
  static const BlockLoginStatus BLOCK_IDENTIFY =
      BlockLoginStatus._(1, _omitEnumNames ? '' : 'BLOCK_IDENTIFY');
  static const BlockLoginStatus BLOCK_IDENTIFY_IP =
      BlockLoginStatus._(2, _omitEnumNames ? '' : 'BLOCK_IDENTIFY_IP');
  static const BlockLoginStatus BLOCK_IDENTIFY_IP_DEVICE =
      BlockLoginStatus._(3, _omitEnumNames ? '' : 'BLOCK_IDENTIFY_IP_DEVICE');

  static const $core.List<BlockLoginStatus> values = <BlockLoginStatus>[
    BLOCK_ACCOUNT,
    BLOCK_IDENTIFY,
    BLOCK_IDENTIFY_IP,
    BLOCK_IDENTIFY_IP_DEVICE,
  ];

  static final $core.List<BlockLoginStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static BlockLoginStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BlockLoginStatus._(super.value, super.name);
}

class BlockInteractiveStatus extends $pb.ProtobufEnum {
  static const BlockInteractiveStatus BLOCK_CHANNEL_PUBLISH =
      BlockInteractiveStatus._(
          0, _omitEnumNames ? '' : 'BLOCK_CHANNEL_PUBLISH');
  static const BlockInteractiveStatus BLOCK_CHAT =
      BlockInteractiveStatus._(1, _omitEnumNames ? '' : 'BLOCK_CHAT');
  static const BlockInteractiveStatus BLOCK_CHANNEL_PUBLISH_AND_CHAT =
      BlockInteractiveStatus._(
          2, _omitEnumNames ? '' : 'BLOCK_CHANNEL_PUBLISH_AND_CHAT');

  static const $core.List<BlockInteractiveStatus> values =
      <BlockInteractiveStatus>[
    BLOCK_CHANNEL_PUBLISH,
    BLOCK_CHAT,
    BLOCK_CHANNEL_PUBLISH_AND_CHAT,
  ];

  static final $core.List<BlockInteractiveStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static BlockInteractiveStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BlockInteractiveStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

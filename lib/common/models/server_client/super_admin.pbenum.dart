// This is a generated file - do not edit.
//
// Generated from server_client/super_admin.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class WarnType extends $pb.ProtobufEnum {
  static const WarnType SPECIFIC_USER =
      WarnType._(0, _omitEnumNames ? '' : 'SPECIFIC_USER');
  static const WarnType ALL_USER =
      WarnType._(1, _omitEnumNames ? '' : 'ALL_USER');

  static const $core.List<WarnType> values = <WarnType>[
    SPECIFIC_USER,
    ALL_USER,
  ];

  static final $core.List<WarnType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static WarnType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const WarnType._(super.value, super.name);
}

class OperationType extends $pb.ProtobufEnum {
  static const OperationType BAN_ACCOUNT =
      OperationType._(0, _omitEnumNames ? '' : 'BAN_ACCOUNT');
  static const OperationType BAN_PRIVATE_CHAT =
      OperationType._(1, _omitEnumNames ? '' : 'BAN_PRIVATE_CHAT');

  static const $core.List<OperationType> values = <OperationType>[
    BAN_ACCOUNT,
    BAN_PRIVATE_CHAT,
  ];

  static final $core.List<OperationType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static OperationType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const OperationType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

// This is a generated file - do not edit.
//
// Generated from server_client/invite_code.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class UserStatus extends $pb.ProtobufEnum {
  static const UserStatus WAIT_FOR_VALIDATE =
      UserStatus._(0, _omitEnumNames ? '' : 'WAIT_FOR_VALIDATE');
  static const UserStatus VALID =
      UserStatus._(1, _omitEnumNames ? '' : 'VALID');

  static const $core.List<UserStatus> values = <UserStatus>[
    WAIT_FOR_VALIDATE,
    VALID,
  ];

  static final $core.List<UserStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static UserStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UserStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

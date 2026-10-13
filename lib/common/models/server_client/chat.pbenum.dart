// This is a generated file - do not edit.
//
// Generated from server_client/chat.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CheckResult extends $pb.ProtobufEnum {
  static const CheckResult NONE =
      CheckResult._(0, _omitEnumNames ? '' : 'NONE');
  static const CheckResult SEND_COST_FREE =
      CheckResult._(1, _omitEnumNames ? '' : 'SEND_COST_FREE');
  static const CheckResult SEND_COST_COIN =
      CheckResult._(2, _omitEnumNames ? '' : 'SEND_COST_COIN');
  static const CheckResult BALANCE_INSUFFICIENT =
      CheckResult._(3, _omitEnumNames ? '' : 'BALANCE_INSUFFICIENT');

  static const $core.List<CheckResult> values = <CheckResult>[
    NONE,
    SEND_COST_FREE,
    SEND_COST_COIN,
    BALANCE_INSUFFICIENT,
  ];

  static final $core.List<CheckResult?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static CheckResult? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CheckResult._(super.value, super.name);
}

class MsgPackageType extends $pb.ProtobufEnum {
  static const MsgPackageType VALUE =
      MsgPackageType._(0, _omitEnumNames ? '' : 'VALUE');
  static const MsgPackageType UNLIMITED =
      MsgPackageType._(1, _omitEnumNames ? '' : 'UNLIMITED');

  static const $core.List<MsgPackageType> values = <MsgPackageType>[
    VALUE,
    UNLIMITED,
  ];

  static final $core.List<MsgPackageType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static MsgPackageType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MsgPackageType._(super.value, super.name);
}

class ChatRoleType extends $pb.ProtobufEnum {
  static const ChatRoleType COMMON =
      ChatRoleType._(0, _omitEnumNames ? '' : 'COMMON');
  static const ChatRoleType PRIVATE_USER =
      ChatRoleType._(1, _omitEnumNames ? '' : 'PRIVATE_USER');
  static const ChatRoleType PRIVATE_GS =
      ChatRoleType._(2, _omitEnumNames ? '' : 'PRIVATE_GS');

  static const $core.List<ChatRoleType> values = <ChatRoleType>[
    COMMON,
    PRIVATE_USER,
    PRIVATE_GS,
  ];

  static final $core.List<ChatRoleType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ChatRoleType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChatRoleType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

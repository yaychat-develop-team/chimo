// This is a generated file - do not edit.
//
// Generated from server_client/account_bind.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AccountBindingType extends $pb.ProtobufEnum {
  static const AccountBindingType UNKNOWN =
      AccountBindingType._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const AccountBindingType APPLE =
      AccountBindingType._(1, _omitEnumNames ? '' : 'APPLE');
  static const AccountBindingType GOOGLE =
      AccountBindingType._(2, _omitEnumNames ? '' : 'GOOGLE');
  static const AccountBindingType EMAIL =
      AccountBindingType._(3, _omitEnumNames ? '' : 'EMAIL');
  static const AccountBindingType PHONE =
      AccountBindingType._(4, _omitEnumNames ? '' : 'PHONE');
  static const AccountBindingType FACEBOOK =
      AccountBindingType._(5, _omitEnumNames ? '' : 'FACEBOOK');

  static const $core.List<AccountBindingType> values = <AccountBindingType>[
    UNKNOWN,
    APPLE,
    GOOGLE,
    EMAIL,
    PHONE,
    FACEBOOK,
  ];

  static final $core.List<AccountBindingType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static AccountBindingType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AccountBindingType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

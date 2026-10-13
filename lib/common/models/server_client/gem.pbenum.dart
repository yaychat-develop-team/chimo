// This is a generated file - do not edit.
//
// Generated from server_client/gem.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GemWithdrawType extends $pb.ProtobufEnum {
  static const GemWithdrawType UNSPECIFIED =
      GemWithdrawType._(0, _omitEnumNames ? '' : 'UNSPECIFIED');
  static const GemWithdrawType USDT =
      GemWithdrawType._(1, _omitEnumNames ? '' : 'USDT');
  static const GemWithdrawType PAYPAL =
      GemWithdrawType._(2, _omitEnumNames ? '' : 'PAYPAL');
  static const GemWithdrawType GCASH =
      GemWithdrawType._(3, _omitEnumNames ? '' : 'GCASH');

  static const $core.List<GemWithdrawType> values = <GemWithdrawType>[
    UNSPECIFIED,
    USDT,
    PAYPAL,
    GCASH,
  ];

  static final $core.List<GemWithdrawType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static GemWithdrawType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GemWithdrawType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

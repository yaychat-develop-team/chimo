// This is a generated file - do not edit.
//
// Generated from server_client/merch/merch.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MerchStatus extends $pb.ProtobufEnum {
  static const MerchStatus UNKNOWN =
      MerchStatus._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const MerchStatus ON_SALE =
      MerchStatus._(1, _omitEnumNames ? '' : 'ON_SALE');
  static const MerchStatus SOLD_OUT =
      MerchStatus._(2, _omitEnumNames ? '' : 'SOLD_OUT');
  static const MerchStatus EXPIRED =
      MerchStatus._(3, _omitEnumNames ? '' : 'EXPIRED');
  static const MerchStatus OFF_SALE =
      MerchStatus._(4, _omitEnumNames ? '' : 'OFF_SALE');

  static const $core.List<MerchStatus> values = <MerchStatus>[
    UNKNOWN,
    ON_SALE,
    SOLD_OUT,
    EXPIRED,
    OFF_SALE,
  ];

  static final $core.List<MerchStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static MerchStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MerchStatus._(super.value, super.name);
}

class MerchFlag extends $pb.ProtobufEnum {
  static const MerchFlag COMMON =
      MerchFlag._(0, _omitEnumNames ? '' : 'COMMON');
  static const MerchFlag NEW = MerchFlag._(1, _omitEnumNames ? '' : 'NEW');
  static const MerchFlag HOT = MerchFlag._(2, _omitEnumNames ? '' : 'HOT');

  static const $core.List<MerchFlag> values = <MerchFlag>[
    COMMON,
    NEW,
    HOT,
  ];

  static final $core.List<MerchFlag?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static MerchFlag? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MerchFlag._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

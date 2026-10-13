// This is a generated file - do not edit.
//
// Generated from server_client/report.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 举报类型
class ReportType extends $pb.ProtobufEnum {
  static const ReportType CHANNEL =
      ReportType._(0, _omitEnumNames ? '' : 'CHANNEL');
  static const ReportType USER = ReportType._(1, _omitEnumNames ? '' : 'USER');

  static const $core.List<ReportType> values = <ReportType>[
    CHANNEL,
    USER,
  ];

  static final $core.List<ReportType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ReportType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReportType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

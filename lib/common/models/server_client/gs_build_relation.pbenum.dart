// This is a generated file - do not edit.
//
// Generated from server_client/gs_build_relation.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ListType extends $pb.ProtobufEnum {
  static const ListType CORE_CROWD =
      ListType._(0, _omitEnumNames ? '' : 'CORE_CROWD');
  static const ListType NEW_FRIEND =
      ListType._(1, _omitEnumNames ? '' : 'NEW_FRIEND');
  static const ListType DEEP_REL =
      ListType._(2, _omitEnumNames ? '' : 'DEEP_REL');
  static const ListType STABLE_REL =
      ListType._(3, _omitEnumNames ? '' : 'STABLE_REL');
  static const ListType EFFECTIVE_REL =
      ListType._(4, _omitEnumNames ? '' : 'EFFECTIVE_REL');

  static const $core.List<ListType> values = <ListType>[
    CORE_CROWD,
    NEW_FRIEND,
    DEEP_REL,
    STABLE_REL,
    EFFECTIVE_REL,
  ];

  static final $core.List<ListType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ListType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ListType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

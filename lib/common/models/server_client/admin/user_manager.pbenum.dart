// This is a generated file - do not edit.
//
// Generated from server_client/admin/user_manager.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SearchScope extends $pb.ProtobufEnum {
  static const SearchScope ALL = SearchScope._(0, _omitEnumNames ? '' : 'ALL');
  static const SearchScope BASE =
      SearchScope._(1, _omitEnumNames ? '' : 'BASE');
  static const SearchScope STATUS =
      SearchScope._(2, _omitEnumNames ? '' : 'STATUS');
  static const SearchScope GS = SearchScope._(3, _omitEnumNames ? '' : 'GS');
  static const SearchScope PRIVACY =
      SearchScope._(4, _omitEnumNames ? '' : 'PRIVACY');
  static const SearchScope LABEL =
      SearchScope._(5, _omitEnumNames ? '' : 'LABEL');

  static const $core.List<SearchScope> values = <SearchScope>[
    ALL,
    BASE,
    STATUS,
    GS,
    PRIVACY,
    LABEL,
  ];

  static final $core.List<SearchScope?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static SearchScope? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SearchScope._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

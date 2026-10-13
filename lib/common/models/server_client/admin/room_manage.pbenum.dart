// This is a generated file - do not edit.
//
// Generated from server_client/admin/room_manage.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ShowListType extends $pb.ProtobufEnum {
  static const ShowListType STATUS =
      ShowListType._(0, _omitEnumNames ? '' : 'STATUS');
  static const ShowListType ROOM_TYPE =
      ShowListType._(1, _omitEnumNames ? '' : 'ROOM_TYPE');
  static const ShowListType BIZ_TYPE =
      ShowListType._(2, _omitEnumNames ? '' : 'BIZ_TYPE');
  static const ShowListType PUBLIC_ATTR =
      ShowListType._(3, _omitEnumNames ? '' : 'PUBLIC_ATTR');

  static const $core.List<ShowListType> values = <ShowListType>[
    STATUS,
    ROOM_TYPE,
    BIZ_TYPE,
    PUBLIC_ATTR,
  ];

  static final $core.List<ShowListType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ShowListType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ShowListType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

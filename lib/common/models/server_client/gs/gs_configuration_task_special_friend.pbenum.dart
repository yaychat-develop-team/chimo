// This is a generated file - do not edit.
//
// Generated from server_client/gs/gs_configuration_task_special_friend.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SpecialFriendUserStatus extends $pb.ProtobufEnum {
  static const SpecialFriendUserStatus OFFLINE =
      SpecialFriendUserStatus._(0, _omitEnumNames ? '' : 'OFFLINE');
  static const SpecialFriendUserStatus ONLINE =
      SpecialFriendUserStatus._(1, _omitEnumNames ? '' : 'ONLINE');
  static const SpecialFriendUserStatus IN_ROOM =
      SpecialFriendUserStatus._(2, _omitEnumNames ? '' : 'IN_ROOM');

  static const $core.List<SpecialFriendUserStatus> values =
      <SpecialFriendUserStatus>[
    OFFLINE,
    ONLINE,
    IN_ROOM,
  ];

  static final $core.List<SpecialFriendUserStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SpecialFriendUserStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SpecialFriendUserStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

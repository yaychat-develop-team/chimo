// This is a generated file - do not edit.
//
// Generated from server_client/util.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResourceType extends $pb.ProtobufEnum {
  static const ResourceType RIDE_HOUSE_KEEPER =
      ResourceType._(0, _omitEnumNames ? '' : 'RIDE_HOUSE_KEEPER');
  static const ResourceType TEENAGER_MODE =
      ResourceType._(1, _omitEnumNames ? '' : 'TEENAGER_MODE');
  static const ResourceType COLD_MV =
      ResourceType._(2, _omitEnumNames ? '' : 'COLD_MV');
  static const ResourceType NORMAL_MV =
      ResourceType._(3, _omitEnumNames ? '' : 'NORMAL_MV');
  static const ResourceType LUXURY_CAR =
      ResourceType._(4, _omitEnumNames ? '' : 'LUXURY_CAR');
  static const ResourceType BOSS_BANNER =
      ResourceType._(5, _omitEnumNames ? '' : 'BOSS_BANNER');
  static const ResourceType GS_BANNER =
      ResourceType._(6, _omitEnumNames ? '' : 'GS_BANNER');
  static const ResourceType BOSS_BANNER_MANAGER =
      ResourceType._(7, _omitEnumNames ? '' : 'BOSS_BANNER_MANAGER');
  static const ResourceType GS_BANNER_MANAGER =
      ResourceType._(8, _omitEnumNames ? '' : 'GS_BANNER_MANAGER');
  static const ResourceType REGISTER_BOSS_MANAGER =
      ResourceType._(9, _omitEnumNames ? '' : 'REGISTER_BOSS_MANAGER');
  static const ResourceType REGISTER_GS_MANAGER =
      ResourceType._(10, _omitEnumNames ? '' : 'REGISTER_GS_MANAGER');
  static const ResourceType REGISTER_GS_WECHAT_LINK =
      ResourceType._(11, _omitEnumNames ? '' : 'REGISTER_GS_WECHAT_LINK');

  static const $core.List<ResourceType> values = <ResourceType>[
    RIDE_HOUSE_KEEPER,
    TEENAGER_MODE,
    COLD_MV,
    NORMAL_MV,
    LUXURY_CAR,
    BOSS_BANNER,
    GS_BANNER,
    BOSS_BANNER_MANAGER,
    GS_BANNER_MANAGER,
    REGISTER_BOSS_MANAGER,
    REGISTER_GS_MANAGER,
    REGISTER_GS_WECHAT_LINK,
  ];

  static final $core.List<ResourceType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 11);
  static ResourceType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ResourceType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

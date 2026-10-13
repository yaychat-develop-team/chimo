// This is a generated file - do not edit.
//
// Generated from server_client/commodity.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 物品类型
class CommodityType extends $pb.ProtobufEnum {
  static const CommodityType AVATAR_FRAME =
      CommodityType._(0, _omitEnumNames ? '' : 'AVATAR_FRAME');
  static const CommodityType MIC_EFFECT =
      CommodityType._(1, _omitEnumNames ? '' : 'MIC_EFFECT');
  static const CommodityType GIFT =
      CommodityType._(2, _omitEnumNames ? '' : 'GIFT');
  static const CommodityType CAR =
      CommodityType._(3, _omitEnumNames ? '' : 'CAR');
  static const CommodityType INFO_CARD =
      CommodityType._(5, _omitEnumNames ? '' : 'INFO_CARD');
  static const CommodityType BUBBLE =
      CommodityType._(6, _omitEnumNames ? '' : 'BUBBLE');
  static const CommodityType AURA =
      CommodityType._(7, _omitEnumNames ? '' : 'AURA');
  static const CommodityType PET =
      CommodityType._(8, _omitEnumNames ? '' : 'PET');
  static const CommodityType NONE =
      CommodityType._(9, _omitEnumNames ? '' : 'NONE');
  static const CommodityType RESOURCE =
      CommodityType._(10, _omitEnumNames ? '' : 'RESOURCE');
  static const CommodityType BENEFIT_CARD =
      CommodityType._(20, _omitEnumNames ? '' : 'BENEFIT_CARD');
  static const CommodityType BLIND_BOX =
      CommodityType._(21, _omitEnumNames ? '' : 'BLIND_BOX');

  static const $core.List<CommodityType> values = <CommodityType>[
    AVATAR_FRAME,
    MIC_EFFECT,
    GIFT,
    CAR,
    INFO_CARD,
    BUBBLE,
    AURA,
    PET,
    NONE,
    RESOURCE,
    BENEFIT_CARD,
    BLIND_BOX,
  ];

  static final $core.Map<$core.int, CommodityType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static CommodityType? valueOf($core.int value) => _byValue[value];

  const CommodityType._(super.value, super.name);
}

/// 物品状态
class CommodityState extends $pb.ProtobufEnum {
  static const CommodityState IDLE =
      CommodityState._(0, _omitEnumNames ? '' : 'IDLE');
  static const CommodityState ACTIVE =
      CommodityState._(1, _omitEnumNames ? '' : 'ACTIVE');
  static const CommodityState USING =
      CommodityState._(2, _omitEnumNames ? '' : 'USING');
  static const CommodityState EXPIRED =
      CommodityState._(3, _omitEnumNames ? '' : 'EXPIRED');

  static const $core.List<CommodityState> values = <CommodityState>[
    IDLE,
    ACTIVE,
    USING,
    EXPIRED,
  ];

  static final $core.List<CommodityState?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static CommodityState? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CommodityState._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

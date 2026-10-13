// This is a generated file - do not edit.
//
// Generated from server_client/common/car.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'car.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'car.pbenum.dart';

/// 座驾元数据信息（仅包括座驾本身的属性）
class CarMetaInfo extends $pb.GeneratedMessage {
  factory CarMetaInfo({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? leftImgLink,
    $core.String? leftImgLinkS,
    $core.String? leftImgLinkForHomePage,
    $core.String? rightImgLink,
    $core.String? rightImgLinkS,
    $core.String? rightImgLinkForHomePage,
    CarLevel? level,
    $core.String? power,
    $core.String? animationLink,
    CarPrivilegeType? privilegeType,
    $core.String? privilegeDesc,
    $core.String? privilegeExtDesc,
    $core.bool? theNew,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (leftImgLink != null) result.leftImgLink = leftImgLink;
    if (leftImgLinkS != null) result.leftImgLinkS = leftImgLinkS;
    if (leftImgLinkForHomePage != null)
      result.leftImgLinkForHomePage = leftImgLinkForHomePage;
    if (rightImgLink != null) result.rightImgLink = rightImgLink;
    if (rightImgLinkS != null) result.rightImgLinkS = rightImgLinkS;
    if (rightImgLinkForHomePage != null)
      result.rightImgLinkForHomePage = rightImgLinkForHomePage;
    if (level != null) result.level = level;
    if (power != null) result.power = power;
    if (animationLink != null) result.animationLink = animationLink;
    if (privilegeType != null) result.privilegeType = privilegeType;
    if (privilegeDesc != null) result.privilegeDesc = privilegeDesc;
    if (privilegeExtDesc != null) result.privilegeExtDesc = privilegeExtDesc;
    if (theNew != null) result.theNew = theNew;
    return result;
  }

  CarMetaInfo._();

  factory CarMetaInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarMetaInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarMetaInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonCar'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'leftImgLink', protoName: 'leftImgLink')
    ..aOS(4, _omitFieldNames ? '' : 'leftImgLinkS', protoName: 'leftImgLinkS')
    ..aOS(5, _omitFieldNames ? '' : 'leftImgLinkForHomePage',
        protoName: 'leftImgLinkForHomePage')
    ..aOS(6, _omitFieldNames ? '' : 'rightImgLink', protoName: 'rightImgLink')
    ..aOS(7, _omitFieldNames ? '' : 'rightImgLinkS', protoName: 'rightImgLinkS')
    ..aOS(8, _omitFieldNames ? '' : 'rightImgLinkForHomePage',
        protoName: 'rightImgLinkForHomePage')
    ..aE<CarLevel>(9, _omitFieldNames ? '' : 'level',
        enumValues: CarLevel.values)
    ..aOS(10, _omitFieldNames ? '' : 'power')
    ..aOS(11, _omitFieldNames ? '' : 'animationLink',
        protoName: 'animationLink')
    ..aE<CarPrivilegeType>(12, _omitFieldNames ? '' : 'privilegeType',
        protoName: 'privilegeType', enumValues: CarPrivilegeType.values)
    ..aOS(13, _omitFieldNames ? '' : 'privilegeDesc',
        protoName: 'privilegeDesc')
    ..aOS(14, _omitFieldNames ? '' : 'privilegeExtDesc',
        protoName: 'privilegeExtDesc')
    ..aOB(15, _omitFieldNames ? '' : 'theNew', protoName: 'theNew')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarMetaInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarMetaInfo copyWith(void Function(CarMetaInfo) updates) =>
      super.copyWith((message) => updates(message as CarMetaInfo))
          as CarMetaInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarMetaInfo create() => CarMetaInfo._();
  @$core.override
  CarMetaInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarMetaInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarMetaInfo>(create);
  static CarMetaInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get leftImgLink => $_getSZ(2);
  @$pb.TagNumber(3)
  set leftImgLink($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLeftImgLink() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeftImgLink() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get leftImgLinkS => $_getSZ(3);
  @$pb.TagNumber(4)
  set leftImgLinkS($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLeftImgLinkS() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeftImgLinkS() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get leftImgLinkForHomePage => $_getSZ(4);
  @$pb.TagNumber(5)
  set leftImgLinkForHomePage($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLeftImgLinkForHomePage() => $_has(4);
  @$pb.TagNumber(5)
  void clearLeftImgLinkForHomePage() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get rightImgLink => $_getSZ(5);
  @$pb.TagNumber(6)
  set rightImgLink($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRightImgLink() => $_has(5);
  @$pb.TagNumber(6)
  void clearRightImgLink() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get rightImgLinkS => $_getSZ(6);
  @$pb.TagNumber(7)
  set rightImgLinkS($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRightImgLinkS() => $_has(6);
  @$pb.TagNumber(7)
  void clearRightImgLinkS() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get rightImgLinkForHomePage => $_getSZ(7);
  @$pb.TagNumber(8)
  set rightImgLinkForHomePage($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRightImgLinkForHomePage() => $_has(7);
  @$pb.TagNumber(8)
  void clearRightImgLinkForHomePage() => $_clearField(8);

  @$pb.TagNumber(9)
  CarLevel get level => $_getN(8);
  @$pb.TagNumber(9)
  set level(CarLevel value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasLevel() => $_has(8);
  @$pb.TagNumber(9)
  void clearLevel() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get power => $_getSZ(9);
  @$pb.TagNumber(10)
  set power($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPower() => $_has(9);
  @$pb.TagNumber(10)
  void clearPower() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get animationLink => $_getSZ(10);
  @$pb.TagNumber(11)
  set animationLink($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasAnimationLink() => $_has(10);
  @$pb.TagNumber(11)
  void clearAnimationLink() => $_clearField(11);

  @$pb.TagNumber(12)
  CarPrivilegeType get privilegeType => $_getN(11);
  @$pb.TagNumber(12)
  set privilegeType(CarPrivilegeType value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasPrivilegeType() => $_has(11);
  @$pb.TagNumber(12)
  void clearPrivilegeType() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get privilegeDesc => $_getSZ(12);
  @$pb.TagNumber(13)
  set privilegeDesc($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasPrivilegeDesc() => $_has(12);
  @$pb.TagNumber(13)
  void clearPrivilegeDesc() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get privilegeExtDesc => $_getSZ(13);
  @$pb.TagNumber(14)
  set privilegeExtDesc($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasPrivilegeExtDesc() => $_has(13);
  @$pb.TagNumber(14)
  void clearPrivilegeExtDesc() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.bool get theNew => $_getBF(14);
  @$pb.TagNumber(15)
  set theNew($core.bool value) => $_setBool(14, value);
  @$pb.TagNumber(15)
  $core.bool hasTheNew() => $_has(14);
  @$pb.TagNumber(15)
  void clearTheNew() => $_clearField(15);
}

/// 用户座驾卡
class UserCarCard extends $pb.GeneratedMessage {
  factory UserCarCard({
    $fixnum.Int64? id,
    CarMetaInfo? carMetaInfo,
    $core.int? days,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (carMetaInfo != null) result.carMetaInfo = carMetaInfo;
    if (days != null) result.days = days;
    return result;
  }

  UserCarCard._();

  factory UserCarCard.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserCarCard.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserCarCard',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonCar'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<CarMetaInfo>(2, _omitFieldNames ? '' : 'carMetaInfo',
        protoName: 'carMetaInfo', subBuilder: CarMetaInfo.create)
    ..aI(3, _omitFieldNames ? '' : 'days', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCarCard clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCarCard copyWith(void Function(UserCarCard) updates) =>
      super.copyWith((message) => updates(message as UserCarCard))
          as UserCarCard;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserCarCard create() => UserCarCard._();
  @$core.override
  UserCarCard createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserCarCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserCarCard>(create);
  static UserCarCard? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  CarMetaInfo get carMetaInfo => $_getN(1);
  @$pb.TagNumber(2)
  set carMetaInfo(CarMetaInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCarMetaInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearCarMetaInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  CarMetaInfo ensureCarMetaInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get days => $_getIZ(2);
  @$pb.TagNumber(3)
  set days($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDays() => $_has(2);
  @$pb.TagNumber(3)
  void clearDays() => $_clearField(3);
}

/// 用户座驾
class UserCar extends $pb.GeneratedMessage {
  factory UserCar({
    $fixnum.Int64? id,
    CarMetaInfo? carMetaInfo,
    $fixnum.Int64? expireTime,
    $core.bool? expired,
    $core.bool? driving,
    $core.bool? isHideRenewButton,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (carMetaInfo != null) result.carMetaInfo = carMetaInfo;
    if (expireTime != null) result.expireTime = expireTime;
    if (expired != null) result.expired = expired;
    if (driving != null) result.driving = driving;
    if (isHideRenewButton != null) result.isHideRenewButton = isHideRenewButton;
    return result;
  }

  UserCar._();

  factory UserCar.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserCar.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserCar',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonCar'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<CarMetaInfo>(2, _omitFieldNames ? '' : 'carMetaInfo',
        protoName: 'carMetaInfo', subBuilder: CarMetaInfo.create)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'expireTime', $pb.PbFieldType.OU6,
        protoName: 'expireTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(4, _omitFieldNames ? '' : 'expired')
    ..aOB(5, _omitFieldNames ? '' : 'driving')
    ..aOB(6, _omitFieldNames ? '' : 'isHideRenewButton',
        protoName: 'isHideRenewButton')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCar clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCar copyWith(void Function(UserCar) updates) =>
      super.copyWith((message) => updates(message as UserCar)) as UserCar;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserCar create() => UserCar._();
  @$core.override
  UserCar createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserCar getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserCar>(create);
  static UserCar? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  CarMetaInfo get carMetaInfo => $_getN(1);
  @$pb.TagNumber(2)
  set carMetaInfo(CarMetaInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCarMetaInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearCarMetaInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  CarMetaInfo ensureCarMetaInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get expireTime => $_getI64(2);
  @$pb.TagNumber(3)
  set expireTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpireTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpireTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get expired => $_getBF(3);
  @$pb.TagNumber(4)
  set expired($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpired() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpired() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get driving => $_getBF(4);
  @$pb.TagNumber(5)
  set driving($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDriving() => $_has(4);
  @$pb.TagNumber(5)
  void clearDriving() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isHideRenewButton => $_getBF(5);
  @$pb.TagNumber(6)
  set isHideRenewButton($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsHideRenewButton() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsHideRenewButton() => $_clearField(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

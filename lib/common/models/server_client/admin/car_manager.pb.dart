// This is a generated file - do not edit.
//
// Generated from server_client/admin/car_manager.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../base.pb.dart' as $0;
import '../common/car.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// *
/// 获取座驾分页列表
/// post /get-page-list
/// body CarPageListGetReq
/// return BaseRsp(data is CarPageListGetRspData)
class CarPageListGetReq extends $pb.GeneratedMessage {
  factory CarPageListGetReq({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  CarPageListGetReq._();

  factory CarPageListGetReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarPageListGetReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarPageListGetReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminCar'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarPageListGetReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarPageListGetReq copyWith(void Function(CarPageListGetReq) updates) =>
      super.copyWith((message) => updates(message as CarPageListGetReq))
          as CarPageListGetReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarPageListGetReq create() => CarPageListGetReq._();
  @$core.override
  CarPageListGetReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarPageListGetReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarPageListGetReq>(create);
  static CarPageListGetReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

class CarPageListGetRspData extends $pb.GeneratedMessage {
  factory CarPageListGetRspData({
    $0.Page? page,
    $core.Iterable<Car>? carList,
  }) {
    final result = create();
    if (page != null) result.page = page;
    if (carList != null) result.carList.addAll(carList);
    return result;
  }

  CarPageListGetRspData._();

  factory CarPageListGetRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarPageListGetRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarPageListGetRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminCar'),
      createEmptyInstance: create)
    ..aOM<$0.Page>(1, _omitFieldNames ? '' : 'page', subBuilder: $0.Page.create)
    ..pPM<Car>(2, _omitFieldNames ? '' : 'carList',
        protoName: 'carList', subBuilder: Car.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarPageListGetRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarPageListGetRspData copyWith(
          void Function(CarPageListGetRspData) updates) =>
      super.copyWith((message) => updates(message as CarPageListGetRspData))
          as CarPageListGetRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarPageListGetRspData create() => CarPageListGetRspData._();
  @$core.override
  CarPageListGetRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarPageListGetRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarPageListGetRspData>(create);
  static CarPageListGetRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Page get page => $_getN(0);
  @$pb.TagNumber(1)
  set page($0.Page value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Page ensurePage() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<Car> get carList => $_getList(1);
}

class Car extends $pb.GeneratedMessage {
  factory Car({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? leftImgLink,
    $core.String? leftImgLinkS,
    $core.String? leftImgLinkForHomePage,
    $core.String? rightImgLink,
    $core.String? rightImgLinkS,
    $core.String? rightImgLinkForHomePage,
    $1.CarLevel? level,
    $core.String? power,
    $core.String? animationLink,
    $1.CarPrivilegeType? privilegeType,
    $core.String? privilegeDesc,
    $core.String? privilegeExtDesc,
    $1.CarStatus? status,
    $fixnum.Int64? onShelfTime,
    $fixnum.Int64? createTime,
    $fixnum.Int64? updateTime,
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
    if (status != null) result.status = status;
    if (onShelfTime != null) result.onShelfTime = onShelfTime;
    if (createTime != null) result.createTime = createTime;
    if (updateTime != null) result.updateTime = updateTime;
    return result;
  }

  Car._();

  factory Car.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Car.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Car',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminCar'),
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
    ..aE<$1.CarLevel>(9, _omitFieldNames ? '' : 'level',
        enumValues: $1.CarLevel.values)
    ..aOS(10, _omitFieldNames ? '' : 'power')
    ..aOS(11, _omitFieldNames ? '' : 'animationLink',
        protoName: 'animationLink')
    ..aE<$1.CarPrivilegeType>(12, _omitFieldNames ? '' : 'privilegeType',
        protoName: 'privilegeType', enumValues: $1.CarPrivilegeType.values)
    ..aOS(13, _omitFieldNames ? '' : 'privilegeDesc',
        protoName: 'privilegeDesc')
    ..aOS(14, _omitFieldNames ? '' : 'privilegeExtDesc',
        protoName: 'privilegeExtDesc')
    ..aE<$1.CarStatus>(15, _omitFieldNames ? '' : 'status',
        enumValues: $1.CarStatus.values)
    ..a<$fixnum.Int64>(
        16, _omitFieldNames ? '' : 'onShelfTime', $pb.PbFieldType.OU6,
        protoName: 'onShelfTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        17, _omitFieldNames ? '' : 'createTime', $pb.PbFieldType.OU6,
        protoName: 'createTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        18, _omitFieldNames ? '' : 'updateTime', $pb.PbFieldType.OU6,
        protoName: 'updateTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Car clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Car copyWith(void Function(Car) updates) =>
      super.copyWith((message) => updates(message as Car)) as Car;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Car create() => Car._();
  @$core.override
  Car createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Car getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Car>(create);
  static Car? _defaultInstance;

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
  $1.CarLevel get level => $_getN(8);
  @$pb.TagNumber(9)
  set level($1.CarLevel value) => $_setField(9, value);
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
  $1.CarPrivilegeType get privilegeType => $_getN(11);
  @$pb.TagNumber(12)
  set privilegeType($1.CarPrivilegeType value) => $_setField(12, value);
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
  $1.CarStatus get status => $_getN(14);
  @$pb.TagNumber(15)
  set status($1.CarStatus value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasStatus() => $_has(14);
  @$pb.TagNumber(15)
  void clearStatus() => $_clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get onShelfTime => $_getI64(15);
  @$pb.TagNumber(16)
  set onShelfTime($fixnum.Int64 value) => $_setInt64(15, value);
  @$pb.TagNumber(16)
  $core.bool hasOnShelfTime() => $_has(15);
  @$pb.TagNumber(16)
  void clearOnShelfTime() => $_clearField(16);

  @$pb.TagNumber(17)
  $fixnum.Int64 get createTime => $_getI64(16);
  @$pb.TagNumber(17)
  set createTime($fixnum.Int64 value) => $_setInt64(16, value);
  @$pb.TagNumber(17)
  $core.bool hasCreateTime() => $_has(16);
  @$pb.TagNumber(17)
  void clearCreateTime() => $_clearField(17);

  @$pb.TagNumber(18)
  $fixnum.Int64 get updateTime => $_getI64(17);
  @$pb.TagNumber(18)
  set updateTime($fixnum.Int64 value) => $_setInt64(17, value);
  @$pb.TagNumber(18)
  $core.bool hasUpdateTime() => $_has(17);
  @$pb.TagNumber(18)
  void clearUpdateTime() => $_clearField(18);
}

/// *
/// 新增座驾
/// post /add
/// body CarAddReq
/// return BaseRsp(data is null)
class CarAddReq extends $pb.GeneratedMessage {
  factory CarAddReq({
    $core.String? name,
    $core.String? leftImgLink,
    $core.String? leftImgLinkS,
    $core.String? leftImgLinkForHomePage,
    $core.String? rightImgLink,
    $core.String? rightImgLinkS,
    $core.String? rightImgLinkForHomePage,
    $1.CarLevel? level,
    $core.String? power,
    $core.String? animationLink,
    $1.CarPrivilegeType? privilegeType,
    $core.String? privilegeDesc,
    $core.String? privilegeExtDesc,
    $1.CarStatus? status,
  }) {
    final result = create();
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
    if (status != null) result.status = status;
    return result;
  }

  CarAddReq._();

  factory CarAddReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarAddReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarAddReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminCar'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'leftImgLink', protoName: 'leftImgLink')
    ..aOS(4, _omitFieldNames ? '' : 'leftImgLinkS', protoName: 'leftImgLinkS')
    ..aOS(5, _omitFieldNames ? '' : 'leftImgLinkForHomePage',
        protoName: 'leftImgLinkForHomePage')
    ..aOS(6, _omitFieldNames ? '' : 'rightImgLink', protoName: 'rightImgLink')
    ..aOS(7, _omitFieldNames ? '' : 'rightImgLinkS', protoName: 'rightImgLinkS')
    ..aOS(8, _omitFieldNames ? '' : 'rightImgLinkForHomePage',
        protoName: 'rightImgLinkForHomePage')
    ..aE<$1.CarLevel>(9, _omitFieldNames ? '' : 'level',
        enumValues: $1.CarLevel.values)
    ..aOS(10, _omitFieldNames ? '' : 'power')
    ..aOS(11, _omitFieldNames ? '' : 'animationLink',
        protoName: 'animationLink')
    ..aE<$1.CarPrivilegeType>(12, _omitFieldNames ? '' : 'privilegeType',
        protoName: 'privilegeType', enumValues: $1.CarPrivilegeType.values)
    ..aOS(13, _omitFieldNames ? '' : 'privilegeDesc',
        protoName: 'privilegeDesc')
    ..aOS(14, _omitFieldNames ? '' : 'privilegeExtDesc',
        protoName: 'privilegeExtDesc')
    ..aE<$1.CarStatus>(15, _omitFieldNames ? '' : 'status',
        enumValues: $1.CarStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarAddReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarAddReq copyWith(void Function(CarAddReq) updates) =>
      super.copyWith((message) => updates(message as CarAddReq)) as CarAddReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarAddReq create() => CarAddReq._();
  @$core.override
  CarAddReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarAddReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CarAddReq>(create);
  static CarAddReq? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get leftImgLink => $_getSZ(1);
  @$pb.TagNumber(3)
  set leftImgLink($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasLeftImgLink() => $_has(1);
  @$pb.TagNumber(3)
  void clearLeftImgLink() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get leftImgLinkS => $_getSZ(2);
  @$pb.TagNumber(4)
  set leftImgLinkS($core.String value) => $_setString(2, value);
  @$pb.TagNumber(4)
  $core.bool hasLeftImgLinkS() => $_has(2);
  @$pb.TagNumber(4)
  void clearLeftImgLinkS() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get leftImgLinkForHomePage => $_getSZ(3);
  @$pb.TagNumber(5)
  set leftImgLinkForHomePage($core.String value) => $_setString(3, value);
  @$pb.TagNumber(5)
  $core.bool hasLeftImgLinkForHomePage() => $_has(3);
  @$pb.TagNumber(5)
  void clearLeftImgLinkForHomePage() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get rightImgLink => $_getSZ(4);
  @$pb.TagNumber(6)
  set rightImgLink($core.String value) => $_setString(4, value);
  @$pb.TagNumber(6)
  $core.bool hasRightImgLink() => $_has(4);
  @$pb.TagNumber(6)
  void clearRightImgLink() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get rightImgLinkS => $_getSZ(5);
  @$pb.TagNumber(7)
  set rightImgLinkS($core.String value) => $_setString(5, value);
  @$pb.TagNumber(7)
  $core.bool hasRightImgLinkS() => $_has(5);
  @$pb.TagNumber(7)
  void clearRightImgLinkS() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get rightImgLinkForHomePage => $_getSZ(6);
  @$pb.TagNumber(8)
  set rightImgLinkForHomePage($core.String value) => $_setString(6, value);
  @$pb.TagNumber(8)
  $core.bool hasRightImgLinkForHomePage() => $_has(6);
  @$pb.TagNumber(8)
  void clearRightImgLinkForHomePage() => $_clearField(8);

  @$pb.TagNumber(9)
  $1.CarLevel get level => $_getN(7);
  @$pb.TagNumber(9)
  set level($1.CarLevel value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasLevel() => $_has(7);
  @$pb.TagNumber(9)
  void clearLevel() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get power => $_getSZ(8);
  @$pb.TagNumber(10)
  set power($core.String value) => $_setString(8, value);
  @$pb.TagNumber(10)
  $core.bool hasPower() => $_has(8);
  @$pb.TagNumber(10)
  void clearPower() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get animationLink => $_getSZ(9);
  @$pb.TagNumber(11)
  set animationLink($core.String value) => $_setString(9, value);
  @$pb.TagNumber(11)
  $core.bool hasAnimationLink() => $_has(9);
  @$pb.TagNumber(11)
  void clearAnimationLink() => $_clearField(11);

  @$pb.TagNumber(12)
  $1.CarPrivilegeType get privilegeType => $_getN(10);
  @$pb.TagNumber(12)
  set privilegeType($1.CarPrivilegeType value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasPrivilegeType() => $_has(10);
  @$pb.TagNumber(12)
  void clearPrivilegeType() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get privilegeDesc => $_getSZ(11);
  @$pb.TagNumber(13)
  set privilegeDesc($core.String value) => $_setString(11, value);
  @$pb.TagNumber(13)
  $core.bool hasPrivilegeDesc() => $_has(11);
  @$pb.TagNumber(13)
  void clearPrivilegeDesc() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get privilegeExtDesc => $_getSZ(12);
  @$pb.TagNumber(14)
  set privilegeExtDesc($core.String value) => $_setString(12, value);
  @$pb.TagNumber(14)
  $core.bool hasPrivilegeExtDesc() => $_has(12);
  @$pb.TagNumber(14)
  void clearPrivilegeExtDesc() => $_clearField(14);

  @$pb.TagNumber(15)
  $1.CarStatus get status => $_getN(13);
  @$pb.TagNumber(15)
  set status($1.CarStatus value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasStatus() => $_has(13);
  @$pb.TagNumber(15)
  void clearStatus() => $_clearField(15);
}

/// *
/// 修改座驾
/// post /add
/// body CarAddReq
/// return BaseRsp(data is null)
class CarUpdateReq extends $pb.GeneratedMessage {
  factory CarUpdateReq({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? leftImgLink,
    $core.String? leftImgLinkS,
    $core.String? leftImgLinkForHomePage,
    $core.String? rightImgLink,
    $core.String? rightImgLinkS,
    $core.String? rightImgLinkForHomePage,
    $1.CarLevel? level,
    $core.String? power,
    $core.String? animationLink,
    $1.CarPrivilegeType? privilegeType,
    $core.String? privilegeDesc,
    $core.String? privilegeExtDesc,
    $1.CarStatus? status,
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
    if (status != null) result.status = status;
    return result;
  }

  CarUpdateReq._();

  factory CarUpdateReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarUpdateReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarUpdateReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminCar'),
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
    ..aE<$1.CarLevel>(9, _omitFieldNames ? '' : 'level',
        enumValues: $1.CarLevel.values)
    ..aOS(10, _omitFieldNames ? '' : 'power')
    ..aOS(11, _omitFieldNames ? '' : 'animationLink',
        protoName: 'animationLink')
    ..aE<$1.CarPrivilegeType>(12, _omitFieldNames ? '' : 'privilegeType',
        protoName: 'privilegeType', enumValues: $1.CarPrivilegeType.values)
    ..aOS(13, _omitFieldNames ? '' : 'privilegeDesc',
        protoName: 'privilegeDesc')
    ..aOS(14, _omitFieldNames ? '' : 'privilegeExtDesc',
        protoName: 'privilegeExtDesc')
    ..aE<$1.CarStatus>(15, _omitFieldNames ? '' : 'status',
        enumValues: $1.CarStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarUpdateReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarUpdateReq copyWith(void Function(CarUpdateReq) updates) =>
      super.copyWith((message) => updates(message as CarUpdateReq))
          as CarUpdateReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarUpdateReq create() => CarUpdateReq._();
  @$core.override
  CarUpdateReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarUpdateReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarUpdateReq>(create);
  static CarUpdateReq? _defaultInstance;

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
  $1.CarLevel get level => $_getN(8);
  @$pb.TagNumber(9)
  set level($1.CarLevel value) => $_setField(9, value);
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
  $1.CarPrivilegeType get privilegeType => $_getN(11);
  @$pb.TagNumber(12)
  set privilegeType($1.CarPrivilegeType value) => $_setField(12, value);
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
  $1.CarStatus get status => $_getN(14);
  @$pb.TagNumber(15)
  set status($1.CarStatus value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasStatus() => $_has(14);
  @$pb.TagNumber(15)
  void clearStatus() => $_clearField(15);
}

/// *
/// 获取用户座驾卡分页列表
/// post /user-car-card/get-page-list
/// body UserCarCardPageListGetReq
/// return BaseRsp(data is UserCarCardPageListGetRspData)
class UserCarCardPageListGetReq extends $pb.GeneratedMessage {
  factory UserCarCardPageListGetReq({
    $fixnum.Int64? uid,
    $fixnum.Int64? minEQCreateTime,
    $fixnum.Int64? maxEQCreateTime,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (minEQCreateTime != null) result.minEQCreateTime = minEQCreateTime;
    if (maxEQCreateTime != null) result.maxEQCreateTime = maxEQCreateTime;
    return result;
  }

  UserCarCardPageListGetReq._();

  factory UserCarCardPageListGetReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserCarCardPageListGetReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserCarCardPageListGetReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminCar'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'minEQCreateTime', $pb.PbFieldType.OU6,
        protoName: 'minEQCreateTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'maxEQCreateTime', $pb.PbFieldType.OU6,
        protoName: 'maxEQCreateTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCarCardPageListGetReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCarCardPageListGetReq copyWith(
          void Function(UserCarCardPageListGetReq) updates) =>
      super.copyWith((message) => updates(message as UserCarCardPageListGetReq))
          as UserCarCardPageListGetReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserCarCardPageListGetReq create() => UserCarCardPageListGetReq._();
  @$core.override
  UserCarCardPageListGetReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserCarCardPageListGetReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserCarCardPageListGetReq>(create);
  static UserCarCardPageListGetReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get minEQCreateTime => $_getI64(1);
  @$pb.TagNumber(2)
  set minEQCreateTime($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMinEQCreateTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinEQCreateTime() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get maxEQCreateTime => $_getI64(2);
  @$pb.TagNumber(3)
  set maxEQCreateTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMaxEQCreateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxEQCreateTime() => $_clearField(3);
}

class UserCarCardPageListGetRspData extends $pb.GeneratedMessage {
  factory UserCarCardPageListGetRspData({
    $0.Page? page,
    $core.Iterable<$1.UserCarCard>? userCarCardList,
  }) {
    final result = create();
    if (page != null) result.page = page;
    if (userCarCardList != null) result.userCarCardList.addAll(userCarCardList);
    return result;
  }

  UserCarCardPageListGetRspData._();

  factory UserCarCardPageListGetRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserCarCardPageListGetRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserCarCardPageListGetRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminCar'),
      createEmptyInstance: create)
    ..aOM<$0.Page>(1, _omitFieldNames ? '' : 'page', subBuilder: $0.Page.create)
    ..pPM<$1.UserCarCard>(2, _omitFieldNames ? '' : 'userCarCardList',
        protoName: 'userCarCardList', subBuilder: $1.UserCarCard.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCarCardPageListGetRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCarCardPageListGetRspData copyWith(
          void Function(UserCarCardPageListGetRspData) updates) =>
      super.copyWith(
              (message) => updates(message as UserCarCardPageListGetRspData))
          as UserCarCardPageListGetRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserCarCardPageListGetRspData create() =>
      UserCarCardPageListGetRspData._();
  @$core.override
  UserCarCardPageListGetRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserCarCardPageListGetRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserCarCardPageListGetRspData>(create);
  static UserCarCardPageListGetRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Page get page => $_getN(0);
  @$pb.TagNumber(1)
  set page($0.Page value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Page ensurePage() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<$1.UserCarCard> get userCarCardList => $_getList(1);
}

/// *
/// 获取用户座驾分页列表
/// post /user-car/get-page-list
/// body UserCarPageListGetReq
/// return BaseRsp(data is UserCarPageListGetRspData)
class UserCarPageListGetReq extends $pb.GeneratedMessage {
  factory UserCarPageListGetReq({
    $fixnum.Int64? uid,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    return result;
  }

  UserCarPageListGetReq._();

  factory UserCarPageListGetReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserCarPageListGetReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserCarPageListGetReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminCar'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCarPageListGetReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCarPageListGetReq copyWith(
          void Function(UserCarPageListGetReq) updates) =>
      super.copyWith((message) => updates(message as UserCarPageListGetReq))
          as UserCarPageListGetReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserCarPageListGetReq create() => UserCarPageListGetReq._();
  @$core.override
  UserCarPageListGetReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserCarPageListGetReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserCarPageListGetReq>(create);
  static UserCarPageListGetReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);
}

class UserCarPageListGetRspData extends $pb.GeneratedMessage {
  factory UserCarPageListGetRspData({
    $0.Page? page,
    $core.Iterable<$1.UserCar>? userCarList,
  }) {
    final result = create();
    if (page != null) result.page = page;
    if (userCarList != null) result.userCarList.addAll(userCarList);
    return result;
  }

  UserCarPageListGetRspData._();

  factory UserCarPageListGetRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserCarPageListGetRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserCarPageListGetRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminCar'),
      createEmptyInstance: create)
    ..aOM<$0.Page>(1, _omitFieldNames ? '' : 'page', subBuilder: $0.Page.create)
    ..pPM<$1.UserCar>(2, _omitFieldNames ? '' : 'userCarList',
        protoName: 'userCarList', subBuilder: $1.UserCar.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCarPageListGetRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCarPageListGetRspData copyWith(
          void Function(UserCarPageListGetRspData) updates) =>
      super.copyWith((message) => updates(message as UserCarPageListGetRspData))
          as UserCarPageListGetRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserCarPageListGetRspData create() => UserCarPageListGetRspData._();
  @$core.override
  UserCarPageListGetRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserCarPageListGetRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserCarPageListGetRspData>(create);
  static UserCarPageListGetRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Page get page => $_getN(0);
  @$pb.TagNumber(1)
  set page($0.Page value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Page ensurePage() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<$1.UserCar> get userCarList => $_getList(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

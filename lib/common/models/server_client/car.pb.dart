// This is a generated file - do not edit.
//
// Generated from server_client/car.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common/car.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 广告
class CarInGarageGetListRspData_Ad extends $pb.GeneratedMessage {
  factory CarInGarageGetListRspData_Ad({
    $core.String? imgLink,
    $core.String? jumpLink,
  }) {
    final result = create();
    if (imgLink != null) result.imgLink = imgLink;
    if (jumpLink != null) result.jumpLink = jumpLink;
    return result;
  }

  CarInGarageGetListRspData_Ad._();

  factory CarInGarageGetListRspData_Ad.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarInGarageGetListRspData_Ad.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarInGarageGetListRspData.Ad',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'imgLink', protoName: 'imgLink')
    ..aOS(2, _omitFieldNames ? '' : 'jumpLink', protoName: 'jumpLink')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarInGarageGetListRspData_Ad clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarInGarageGetListRspData_Ad copyWith(
          void Function(CarInGarageGetListRspData_Ad) updates) =>
      super.copyWith(
              (message) => updates(message as CarInGarageGetListRspData_Ad))
          as CarInGarageGetListRspData_Ad;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarInGarageGetListRspData_Ad create() =>
      CarInGarageGetListRspData_Ad._();
  @$core.override
  CarInGarageGetListRspData_Ad createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarInGarageGetListRspData_Ad getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarInGarageGetListRspData_Ad>(create);
  static CarInGarageGetListRspData_Ad? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get imgLink => $_getSZ(0);
  @$pb.TagNumber(1)
  set imgLink($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasImgLink() => $_has(0);
  @$pb.TagNumber(1)
  void clearImgLink() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get jumpLink => $_getSZ(1);
  @$pb.TagNumber(2)
  set jumpLink($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasJumpLink() => $_has(1);
  @$pb.TagNumber(2)
  void clearJumpLink() => $_clearField(2);
}

/// *
/// 获取车库里的座驾列表
/// post /car/in-garage/get-list
/// body void
/// return BaseRsp(data is CarInGarageGetListRspData)
class CarInGarageGetListRspData extends $pb.GeneratedMessage {
  factory CarInGarageGetListRspData({
    $core.Iterable<$0.UserCar>? carList,
    CarInGarageGetListRspData_Ad? ad,
    $core.int? cardNum,
  }) {
    final result = create();
    if (carList != null) result.carList.addAll(carList);
    if (ad != null) result.ad = ad;
    if (cardNum != null) result.cardNum = cardNum;
    return result;
  }

  CarInGarageGetListRspData._();

  factory CarInGarageGetListRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarInGarageGetListRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarInGarageGetListRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..pPM<$0.UserCar>(1, _omitFieldNames ? '' : 'carList',
        protoName: 'carList', subBuilder: $0.UserCar.create)
    ..aOM<CarInGarageGetListRspData_Ad>(2, _omitFieldNames ? '' : 'ad',
        subBuilder: CarInGarageGetListRspData_Ad.create)
    ..aI(3, _omitFieldNames ? '' : 'cardNum', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarInGarageGetListRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarInGarageGetListRspData copyWith(
          void Function(CarInGarageGetListRspData) updates) =>
      super.copyWith((message) => updates(message as CarInGarageGetListRspData))
          as CarInGarageGetListRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarInGarageGetListRspData create() => CarInGarageGetListRspData._();
  @$core.override
  CarInGarageGetListRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarInGarageGetListRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarInGarageGetListRspData>(create);
  static CarInGarageGetListRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.UserCar> get carList => $_getList(0);

  @$pb.TagNumber(2)
  CarInGarageGetListRspData_Ad get ad => $_getN(1);
  @$pb.TagNumber(2)
  set ad(CarInGarageGetListRspData_Ad value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAd() => $_has(1);
  @$pb.TagNumber(2)
  void clearAd() => $_clearField(2);
  @$pb.TagNumber(2)
  CarInGarageGetListRspData_Ad ensureAd() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get cardNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set cardNum($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCardNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearCardNum() => $_clearField(3);
}

/// *
/// 驾驶或更换座驾
/// post /car/drive
/// body CarDriveReq
/// return BaseRsp(data is null)
class CarDriveReq extends $pb.GeneratedMessage {
  factory CarDriveReq({
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  CarDriveReq._();

  factory CarDriveReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarDriveReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarDriveReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarDriveReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarDriveReq copyWith(void Function(CarDriveReq) updates) =>
      super.copyWith((message) => updates(message as CarDriveReq))
          as CarDriveReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarDriveReq create() => CarDriveReq._();
  @$core.override
  CarDriveReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarDriveReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarDriveReq>(create);
  static CarDriveReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

/// 座驾盲盒
class CarBlindBoxGetListRspData_CarBlindBox extends $pb.GeneratedMessage {
  factory CarBlindBoxGetListRspData_CarBlindBox({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? desc,
    $0.CarBlindBoxLevel? level,
    $core.Iterable<CarBlindBoxGetListRspData_CarouselCar>? carouselCarList,
    $fixnum.Int64? price,
    $core.int? numOfGSWaiting,
    $core.Iterable<CarBlindBoxGetListRspData_GSWaiting>? gsWaitingList,
    CarBlindBoxGetListRspData_Act? act,
    $fixnum.Int64? couponCount,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (desc != null) result.desc = desc;
    if (level != null) result.level = level;
    if (carouselCarList != null) result.carouselCarList.addAll(carouselCarList);
    if (price != null) result.price = price;
    if (numOfGSWaiting != null) result.numOfGSWaiting = numOfGSWaiting;
    if (gsWaitingList != null) result.gsWaitingList.addAll(gsWaitingList);
    if (act != null) result.act = act;
    if (couponCount != null) result.couponCount = couponCount;
    return result;
  }

  CarBlindBoxGetListRspData_CarBlindBox._();

  factory CarBlindBoxGetListRspData_CarBlindBox.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarBlindBoxGetListRspData_CarBlindBox.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarBlindBoxGetListRspData.CarBlindBox',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'desc')
    ..aE<$0.CarBlindBoxLevel>(4, _omitFieldNames ? '' : 'level',
        enumValues: $0.CarBlindBoxLevel.values)
    ..pPM<CarBlindBoxGetListRspData_CarouselCar>(
        5, _omitFieldNames ? '' : 'carouselCarList',
        protoName: 'carouselCarList',
        subBuilder: CarBlindBoxGetListRspData_CarouselCar.create)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'price', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(7, _omitFieldNames ? '' : 'numOfGSWaiting',
        protoName: 'numOfGSWaiting', fieldType: $pb.PbFieldType.OU3)
    ..pPM<CarBlindBoxGetListRspData_GSWaiting>(
        8, _omitFieldNames ? '' : 'gsWaitingList',
        protoName: 'gsWaitingList',
        subBuilder: CarBlindBoxGetListRspData_GSWaiting.create)
    ..aOM<CarBlindBoxGetListRspData_Act>(9, _omitFieldNames ? '' : 'act',
        subBuilder: CarBlindBoxGetListRspData_Act.create)
    ..a<$fixnum.Int64>(
        10, _omitFieldNames ? '' : 'couponCount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarBlindBoxGetListRspData_CarBlindBox clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarBlindBoxGetListRspData_CarBlindBox copyWith(
          void Function(CarBlindBoxGetListRspData_CarBlindBox) updates) =>
      super.copyWith((message) =>
              updates(message as CarBlindBoxGetListRspData_CarBlindBox))
          as CarBlindBoxGetListRspData_CarBlindBox;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarBlindBoxGetListRspData_CarBlindBox create() =>
      CarBlindBoxGetListRspData_CarBlindBox._();
  @$core.override
  CarBlindBoxGetListRspData_CarBlindBox createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarBlindBoxGetListRspData_CarBlindBox getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CarBlindBoxGetListRspData_CarBlindBox>(create);
  static CarBlindBoxGetListRspData_CarBlindBox? _defaultInstance;

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
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.CarBlindBoxLevel get level => $_getN(3);
  @$pb.TagNumber(4)
  set level($0.CarBlindBoxLevel value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<CarBlindBoxGetListRspData_CarouselCar> get carouselCarList =>
      $_getList(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get price => $_getI64(5);
  @$pb.TagNumber(6)
  set price($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrice() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get numOfGSWaiting => $_getIZ(6);
  @$pb.TagNumber(7)
  set numOfGSWaiting($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasNumOfGSWaiting() => $_has(6);
  @$pb.TagNumber(7)
  void clearNumOfGSWaiting() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<CarBlindBoxGetListRspData_GSWaiting> get gsWaitingList =>
      $_getList(7);

  @$pb.TagNumber(9)
  CarBlindBoxGetListRspData_Act get act => $_getN(8);
  @$pb.TagNumber(9)
  set act(CarBlindBoxGetListRspData_Act value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasAct() => $_has(8);
  @$pb.TagNumber(9)
  void clearAct() => $_clearField(9);
  @$pb.TagNumber(9)
  CarBlindBoxGetListRspData_Act ensureAct() => $_ensure(8);

  @$pb.TagNumber(10)
  $fixnum.Int64 get couponCount => $_getI64(9);
  @$pb.TagNumber(10)
  set couponCount($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCouponCount() => $_has(9);
  @$pb.TagNumber(10)
  void clearCouponCount() => $_clearField(10);
}

/// 轮播车辆
class CarBlindBoxGetListRspData_CarouselCar extends $pb.GeneratedMessage {
  factory CarBlindBoxGetListRspData_CarouselCar({
    $fixnum.Int64? id,
    $0.CarMetaInfo? carMetaInfo,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (carMetaInfo != null) result.carMetaInfo = carMetaInfo;
    return result;
  }

  CarBlindBoxGetListRspData_CarouselCar._();

  factory CarBlindBoxGetListRspData_CarouselCar.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarBlindBoxGetListRspData_CarouselCar.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarBlindBoxGetListRspData.CarouselCar',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.CarMetaInfo>(2, _omitFieldNames ? '' : 'carMetaInfo',
        protoName: 'carMetaInfo', subBuilder: $0.CarMetaInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarBlindBoxGetListRspData_CarouselCar clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarBlindBoxGetListRspData_CarouselCar copyWith(
          void Function(CarBlindBoxGetListRspData_CarouselCar) updates) =>
      super.copyWith((message) =>
              updates(message as CarBlindBoxGetListRspData_CarouselCar))
          as CarBlindBoxGetListRspData_CarouselCar;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarBlindBoxGetListRspData_CarouselCar create() =>
      CarBlindBoxGetListRspData_CarouselCar._();
  @$core.override
  CarBlindBoxGetListRspData_CarouselCar createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarBlindBoxGetListRspData_CarouselCar getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CarBlindBoxGetListRspData_CarouselCar>(create);
  static CarBlindBoxGetListRspData_CarouselCar? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.CarMetaInfo get carMetaInfo => $_getN(1);
  @$pb.TagNumber(2)
  set carMetaInfo($0.CarMetaInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCarMetaInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearCarMetaInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.CarMetaInfo ensureCarMetaInfo() => $_ensure(1);
}

/// 等待嘉宾
class CarBlindBoxGetListRspData_GSWaiting extends $pb.GeneratedMessage {
  factory CarBlindBoxGetListRspData_GSWaiting({
    $core.String? avatarLink,
    $core.String? voiceLink,
    $core.int? voiceDuration,
  }) {
    final result = create();
    if (avatarLink != null) result.avatarLink = avatarLink;
    if (voiceLink != null) result.voiceLink = voiceLink;
    if (voiceDuration != null) result.voiceDuration = voiceDuration;
    return result;
  }

  CarBlindBoxGetListRspData_GSWaiting._();

  factory CarBlindBoxGetListRspData_GSWaiting.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarBlindBoxGetListRspData_GSWaiting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarBlindBoxGetListRspData.GSWaiting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'avatarLink', protoName: 'avatarLink')
    ..aOS(2, _omitFieldNames ? '' : 'voiceLink', protoName: 'voiceLink')
    ..aI(3, _omitFieldNames ? '' : 'voiceDuration',
        protoName: 'voiceDuration', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarBlindBoxGetListRspData_GSWaiting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarBlindBoxGetListRspData_GSWaiting copyWith(
          void Function(CarBlindBoxGetListRspData_GSWaiting) updates) =>
      super.copyWith((message) =>
              updates(message as CarBlindBoxGetListRspData_GSWaiting))
          as CarBlindBoxGetListRspData_GSWaiting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarBlindBoxGetListRspData_GSWaiting create() =>
      CarBlindBoxGetListRspData_GSWaiting._();
  @$core.override
  CarBlindBoxGetListRspData_GSWaiting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarBlindBoxGetListRspData_GSWaiting getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CarBlindBoxGetListRspData_GSWaiting>(create);
  static CarBlindBoxGetListRspData_GSWaiting? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get avatarLink => $_getSZ(0);
  @$pb.TagNumber(1)
  set avatarLink($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAvatarLink() => $_has(0);
  @$pb.TagNumber(1)
  void clearAvatarLink() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get voiceLink => $_getSZ(1);
  @$pb.TagNumber(2)
  set voiceLink($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVoiceLink() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoiceLink() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get voiceDuration => $_getIZ(2);
  @$pb.TagNumber(3)
  set voiceDuration($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVoiceDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearVoiceDuration() => $_clearField(3);
}

/// 活动
class CarBlindBoxGetListRspData_Act extends $pb.GeneratedMessage {
  factory CarBlindBoxGetListRspData_Act({
    $fixnum.Int64? id,
    $fixnum.Int64? actPrice,
    $core.String? desc,
    $core.String? markingText,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (actPrice != null) result.actPrice = actPrice;
    if (desc != null) result.desc = desc;
    if (markingText != null) result.markingText = markingText;
    return result;
  }

  CarBlindBoxGetListRspData_Act._();

  factory CarBlindBoxGetListRspData_Act.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarBlindBoxGetListRspData_Act.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarBlindBoxGetListRspData.Act',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'actPrice', $pb.PbFieldType.OU6,
        protoName: 'actPrice', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'desc')
    ..aOS(4, _omitFieldNames ? '' : 'markingText', protoName: 'markingText')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarBlindBoxGetListRspData_Act clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarBlindBoxGetListRspData_Act copyWith(
          void Function(CarBlindBoxGetListRspData_Act) updates) =>
      super.copyWith(
              (message) => updates(message as CarBlindBoxGetListRspData_Act))
          as CarBlindBoxGetListRspData_Act;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarBlindBoxGetListRspData_Act create() =>
      CarBlindBoxGetListRspData_Act._();
  @$core.override
  CarBlindBoxGetListRspData_Act createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarBlindBoxGetListRspData_Act getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarBlindBoxGetListRspData_Act>(create);
  static CarBlindBoxGetListRspData_Act? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get actPrice => $_getI64(1);
  @$pb.TagNumber(2)
  set actPrice($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasActPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearActPrice() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get markingText => $_getSZ(3);
  @$pb.TagNumber(4)
  set markingText($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMarkingText() => $_has(3);
  @$pb.TagNumber(4)
  void clearMarkingText() => $_clearField(4);
}

/// *
/// 获取座驾盲盒列表
/// post /car/blind-box/get-list
/// body void
/// return BaseRsp(data is CarBlindBoxGetListRspData)
class CarBlindBoxGetListRspData extends $pb.GeneratedMessage {
  factory CarBlindBoxGetListRspData({
    $core.Iterable<CarBlindBoxGetListRspData_CarBlindBox>? carBlindBoxList,
  }) {
    final result = create();
    if (carBlindBoxList != null) result.carBlindBoxList.addAll(carBlindBoxList);
    return result;
  }

  CarBlindBoxGetListRspData._();

  factory CarBlindBoxGetListRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarBlindBoxGetListRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarBlindBoxGetListRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..pPM<CarBlindBoxGetListRspData_CarBlindBox>(
        1, _omitFieldNames ? '' : 'carBlindBoxList',
        protoName: 'carBlindBoxList',
        subBuilder: CarBlindBoxGetListRspData_CarBlindBox.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarBlindBoxGetListRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarBlindBoxGetListRspData copyWith(
          void Function(CarBlindBoxGetListRspData) updates) =>
      super.copyWith((message) => updates(message as CarBlindBoxGetListRspData))
          as CarBlindBoxGetListRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarBlindBoxGetListRspData create() => CarBlindBoxGetListRspData._();
  @$core.override
  CarBlindBoxGetListRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarBlindBoxGetListRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarBlindBoxGetListRspData>(create);
  static CarBlindBoxGetListRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CarBlindBoxGetListRspData_CarBlindBox> get carBlindBoxList =>
      $_getList(0);
}

/// *
/// 开启盲盒
/// post /car/blind-box/open
/// body CarBlindBoxOpenReq
/// return BaseRsp(data is CarBlindBoxOpenRspData)
class CarBlindBoxOpenReq extends $pb.GeneratedMessage {
  factory CarBlindBoxOpenReq({
    $fixnum.Int64? id,
    $fixnum.Int64? actId,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (actId != null) result.actId = actId;
    return result;
  }

  CarBlindBoxOpenReq._();

  factory CarBlindBoxOpenReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarBlindBoxOpenReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarBlindBoxOpenReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'actId', $pb.PbFieldType.OU6,
        protoName: 'actId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarBlindBoxOpenReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarBlindBoxOpenReq copyWith(void Function(CarBlindBoxOpenReq) updates) =>
      super.copyWith((message) => updates(message as CarBlindBoxOpenReq))
          as CarBlindBoxOpenReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarBlindBoxOpenReq create() => CarBlindBoxOpenReq._();
  @$core.override
  CarBlindBoxOpenReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarBlindBoxOpenReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarBlindBoxOpenReq>(create);
  static CarBlindBoxOpenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get actId => $_getI64(1);
  @$pb.TagNumber(2)
  set actId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasActId() => $_has(1);
  @$pb.TagNumber(2)
  void clearActId() => $_clearField(2);
}

class CarBlindBoxOpenRspData extends $pb.GeneratedMessage {
  factory CarBlindBoxOpenRspData({
    $0.UserCarCard? card,
  }) {
    final result = create();
    if (card != null) result.card = card;
    return result;
  }

  CarBlindBoxOpenRspData._();

  factory CarBlindBoxOpenRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarBlindBoxOpenRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarBlindBoxOpenRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..aOM<$0.UserCarCard>(1, _omitFieldNames ? '' : 'card',
        subBuilder: $0.UserCarCard.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarBlindBoxOpenRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarBlindBoxOpenRspData copyWith(
          void Function(CarBlindBoxOpenRspData) updates) =>
      super.copyWith((message) => updates(message as CarBlindBoxOpenRspData))
          as CarBlindBoxOpenRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarBlindBoxOpenRspData create() => CarBlindBoxOpenRspData._();
  @$core.override
  CarBlindBoxOpenRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarBlindBoxOpenRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarBlindBoxOpenRspData>(create);
  static CarBlindBoxOpenRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $0.UserCarCard get card => $_getN(0);
  @$pb.TagNumber(1)
  set card($0.UserCarCard value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCard() => $_has(0);
  @$pb.TagNumber(1)
  void clearCard() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.UserCarCard ensureCard() => $_ensure(0);
}

/// 座驾卡
class CarCardGetListRspData_UserCarCard extends $pb.GeneratedMessage {
  factory CarCardGetListRspData_UserCarCard({
    $fixnum.Int64? id,
    $fixnum.Int64? carId,
    $0.CarMetaInfo? carMetaInfo,
    $core.int? days,
    $core.int? num,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (carId != null) result.carId = carId;
    if (carMetaInfo != null) result.carMetaInfo = carMetaInfo;
    if (days != null) result.days = days;
    if (num != null) result.num = num;
    return result;
  }

  CarCardGetListRspData_UserCarCard._();

  factory CarCardGetListRspData_UserCarCard.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarCardGetListRspData_UserCarCard.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarCardGetListRspData.UserCarCard',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'carId', $pb.PbFieldType.OU6,
        protoName: 'carId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.CarMetaInfo>(3, _omitFieldNames ? '' : 'carMetaInfo',
        protoName: 'carMetaInfo', subBuilder: $0.CarMetaInfo.create)
    ..aI(4, _omitFieldNames ? '' : 'days', fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'num', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarCardGetListRspData_UserCarCard clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarCardGetListRspData_UserCarCard copyWith(
          void Function(CarCardGetListRspData_UserCarCard) updates) =>
      super.copyWith((message) =>
              updates(message as CarCardGetListRspData_UserCarCard))
          as CarCardGetListRspData_UserCarCard;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarCardGetListRspData_UserCarCard create() =>
      CarCardGetListRspData_UserCarCard._();
  @$core.override
  CarCardGetListRspData_UserCarCard createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarCardGetListRspData_UserCarCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarCardGetListRspData_UserCarCard>(
          create);
  static CarCardGetListRspData_UserCarCard? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get carId => $_getI64(1);
  @$pb.TagNumber(2)
  set carId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCarId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCarId() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.CarMetaInfo get carMetaInfo => $_getN(2);
  @$pb.TagNumber(3)
  set carMetaInfo($0.CarMetaInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCarMetaInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearCarMetaInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.CarMetaInfo ensureCarMetaInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get days => $_getIZ(3);
  @$pb.TagNumber(4)
  set days($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDays() => $_has(3);
  @$pb.TagNumber(4)
  void clearDays() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get num => $_getIZ(4);
  @$pb.TagNumber(5)
  set num($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearNum() => $_clearField(5);
}

/// *
/// 获取座驾卡列表
/// post /car/card/get-list
/// body void
/// return BaseRsp(data is CarCardGetListRspData)
class CarCardGetListRspData extends $pb.GeneratedMessage {
  factory CarCardGetListRspData({
    $core.Iterable<CarCardGetListRspData_UserCarCard>? carCardList,
    $fixnum.Int64? cardTotalCount,
  }) {
    final result = create();
    if (carCardList != null) result.carCardList.addAll(carCardList);
    if (cardTotalCount != null) result.cardTotalCount = cardTotalCount;
    return result;
  }

  CarCardGetListRspData._();

  factory CarCardGetListRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarCardGetListRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarCardGetListRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..pPM<CarCardGetListRspData_UserCarCard>(
        1, _omitFieldNames ? '' : 'carCardList',
        protoName: 'carCardList',
        subBuilder: CarCardGetListRspData_UserCarCard.create)
    ..aInt64(2, _omitFieldNames ? '' : 'cardTotalCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarCardGetListRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarCardGetListRspData copyWith(
          void Function(CarCardGetListRspData) updates) =>
      super.copyWith((message) => updates(message as CarCardGetListRspData))
          as CarCardGetListRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarCardGetListRspData create() => CarCardGetListRspData._();
  @$core.override
  CarCardGetListRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarCardGetListRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarCardGetListRspData>(create);
  static CarCardGetListRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CarCardGetListRspData_UserCarCard> get carCardList => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get cardTotalCount => $_getI64(1);
  @$pb.TagNumber(2)
  set cardTotalCount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCardTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCardTotalCount() => $_clearField(2);
}

/// *
/// 激活座驾卡
/// post /car/card/activate
/// body CarCardActivateReq
/// return CarCardActivateResp
class CarCardActivateReq extends $pb.GeneratedMessage {
  factory CarCardActivateReq({
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  CarCardActivateReq._();

  factory CarCardActivateReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarCardActivateReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarCardActivateReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarCardActivateReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarCardActivateReq copyWith(void Function(CarCardActivateReq) updates) =>
      super.copyWith((message) => updates(message as CarCardActivateReq))
          as CarCardActivateReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarCardActivateReq create() => CarCardActivateReq._();
  @$core.override
  CarCardActivateReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarCardActivateReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarCardActivateReq>(create);
  static CarCardActivateReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class CarCardActivateResp extends $pb.GeneratedMessage {
  factory CarCardActivateResp({
    $fixnum.Int64? carId,
    $fixnum.Int64? userCarId,
  }) {
    final result = create();
    if (carId != null) result.carId = carId;
    if (userCarId != null) result.userCarId = userCarId;
    return result;
  }

  CarCardActivateResp._();

  factory CarCardActivateResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarCardActivateResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarCardActivateResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'carId')
    ..aInt64(2, _omitFieldNames ? '' : 'userCarId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarCardActivateResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarCardActivateResp copyWith(void Function(CarCardActivateResp) updates) =>
      super.copyWith((message) => updates(message as CarCardActivateResp))
          as CarCardActivateResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarCardActivateResp create() => CarCardActivateResp._();
  @$core.override
  CarCardActivateResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarCardActivateResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarCardActivateResp>(create);
  static CarCardActivateResp? _defaultInstance;

  /// *
  /// 汽车本身id
  @$pb.TagNumber(1)
  $fixnum.Int64 get carId => $_getI64(0);
  @$pb.TagNumber(1)
  set carId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCarId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCarId() => $_clearField(1);

  /// *
  /// 用户汽车id
  @$pb.TagNumber(2)
  $fixnum.Int64 get userCarId => $_getI64(1);
  @$pb.TagNumber(2)
  set userCarId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserCarId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserCarId() => $_clearField(2);
}

/// *
/// 获取续航方案列表
/// post /car/renewal-plan/get-list
/// body CarRenewalPlanGetListReq
/// return BaseRsp(data is CarRenewalPlanGetListRspData)
class CarRenewalPlanGetListReq extends $pb.GeneratedMessage {
  factory CarRenewalPlanGetListReq({
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  CarRenewalPlanGetListReq._();

  factory CarRenewalPlanGetListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarRenewalPlanGetListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarRenewalPlanGetListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarRenewalPlanGetListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarRenewalPlanGetListReq copyWith(
          void Function(CarRenewalPlanGetListReq) updates) =>
      super.copyWith((message) => updates(message as CarRenewalPlanGetListReq))
          as CarRenewalPlanGetListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarRenewalPlanGetListReq create() => CarRenewalPlanGetListReq._();
  @$core.override
  CarRenewalPlanGetListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarRenewalPlanGetListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarRenewalPlanGetListReq>(create);
  static CarRenewalPlanGetListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

/// 座驾续费方案
class CarRenewalPlanGetListRspData_RenewalPlan extends $pb.GeneratedMessage {
  factory CarRenewalPlanGetListRspData_RenewalPlan({
    $fixnum.Int64? id,
    $core.int? days,
    $fixnum.Int64? price,
    CarRenewalPlanGetListRspData_Act? act,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (days != null) result.days = days;
    if (price != null) result.price = price;
    if (act != null) result.act = act;
    return result;
  }

  CarRenewalPlanGetListRspData_RenewalPlan._();

  factory CarRenewalPlanGetListRspData_RenewalPlan.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarRenewalPlanGetListRspData_RenewalPlan.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarRenewalPlanGetListRspData.RenewalPlan',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(2, _omitFieldNames ? '' : 'days', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'price', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<CarRenewalPlanGetListRspData_Act>(4, _omitFieldNames ? '' : 'act',
        subBuilder: CarRenewalPlanGetListRspData_Act.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarRenewalPlanGetListRspData_RenewalPlan clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarRenewalPlanGetListRspData_RenewalPlan copyWith(
          void Function(CarRenewalPlanGetListRspData_RenewalPlan) updates) =>
      super.copyWith((message) =>
              updates(message as CarRenewalPlanGetListRspData_RenewalPlan))
          as CarRenewalPlanGetListRspData_RenewalPlan;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarRenewalPlanGetListRspData_RenewalPlan create() =>
      CarRenewalPlanGetListRspData_RenewalPlan._();
  @$core.override
  CarRenewalPlanGetListRspData_RenewalPlan createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarRenewalPlanGetListRspData_RenewalPlan getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CarRenewalPlanGetListRspData_RenewalPlan>(create);
  static CarRenewalPlanGetListRspData_RenewalPlan? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get days => $_getIZ(1);
  @$pb.TagNumber(2)
  set days($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDays() => $_has(1);
  @$pb.TagNumber(2)
  void clearDays() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get price => $_getI64(2);
  @$pb.TagNumber(3)
  set price($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  CarRenewalPlanGetListRspData_Act get act => $_getN(3);
  @$pb.TagNumber(4)
  set act(CarRenewalPlanGetListRspData_Act value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAct() => $_has(3);
  @$pb.TagNumber(4)
  void clearAct() => $_clearField(4);
  @$pb.TagNumber(4)
  CarRenewalPlanGetListRspData_Act ensureAct() => $_ensure(3);
}

/// 活动
class CarRenewalPlanGetListRspData_Act extends $pb.GeneratedMessage {
  factory CarRenewalPlanGetListRspData_Act({
    $fixnum.Int64? id,
    $fixnum.Int64? actPrice,
    $core.String? desc,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (actPrice != null) result.actPrice = actPrice;
    if (desc != null) result.desc = desc;
    return result;
  }

  CarRenewalPlanGetListRspData_Act._();

  factory CarRenewalPlanGetListRspData_Act.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarRenewalPlanGetListRspData_Act.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarRenewalPlanGetListRspData.Act',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'actPrice', $pb.PbFieldType.OU6,
        protoName: 'actPrice', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'desc')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarRenewalPlanGetListRspData_Act clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarRenewalPlanGetListRspData_Act copyWith(
          void Function(CarRenewalPlanGetListRspData_Act) updates) =>
      super.copyWith(
              (message) => updates(message as CarRenewalPlanGetListRspData_Act))
          as CarRenewalPlanGetListRspData_Act;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarRenewalPlanGetListRspData_Act create() =>
      CarRenewalPlanGetListRspData_Act._();
  @$core.override
  CarRenewalPlanGetListRspData_Act createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarRenewalPlanGetListRspData_Act getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarRenewalPlanGetListRspData_Act>(
          create);
  static CarRenewalPlanGetListRspData_Act? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get actPrice => $_getI64(1);
  @$pb.TagNumber(2)
  set actPrice($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasActPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearActPrice() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => $_clearField(3);
}

class CarRenewalPlanGetListRspData extends $pb.GeneratedMessage {
  factory CarRenewalPlanGetListRspData({
    $core.Iterable<CarRenewalPlanGetListRspData_RenewalPlan>? renewalPlanList,
  }) {
    final result = create();
    if (renewalPlanList != null) result.renewalPlanList.addAll(renewalPlanList);
    return result;
  }

  CarRenewalPlanGetListRspData._();

  factory CarRenewalPlanGetListRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarRenewalPlanGetListRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarRenewalPlanGetListRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..pPM<CarRenewalPlanGetListRspData_RenewalPlan>(
        1, _omitFieldNames ? '' : 'renewalPlanList',
        protoName: 'renewalPlanList',
        subBuilder: CarRenewalPlanGetListRspData_RenewalPlan.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarRenewalPlanGetListRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarRenewalPlanGetListRspData copyWith(
          void Function(CarRenewalPlanGetListRspData) updates) =>
      super.copyWith(
              (message) => updates(message as CarRenewalPlanGetListRspData))
          as CarRenewalPlanGetListRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarRenewalPlanGetListRspData create() =>
      CarRenewalPlanGetListRspData._();
  @$core.override
  CarRenewalPlanGetListRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarRenewalPlanGetListRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarRenewalPlanGetListRspData>(create);
  static CarRenewalPlanGetListRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CarRenewalPlanGetListRspData_RenewalPlan> get renewalPlanList =>
      $_getList(0);
}

/// *
/// 续航座驾
/// post /car/renewal
/// body CarRenewalReq
/// return BaseRsp(data is CarRenewalRspData)
class CarRenewalReq extends $pb.GeneratedMessage {
  factory CarRenewalReq({
    $fixnum.Int64? carId,
    $fixnum.Int64? planId,
    $fixnum.Int64? actId,
  }) {
    final result = create();
    if (carId != null) result.carId = carId;
    if (planId != null) result.planId = planId;
    if (actId != null) result.actId = actId;
    return result;
  }

  CarRenewalReq._();

  factory CarRenewalReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarRenewalReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarRenewalReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'carId', $pb.PbFieldType.OU6,
        protoName: 'carId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'planId', $pb.PbFieldType.OU6,
        protoName: 'planId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'actId', $pb.PbFieldType.OU6,
        protoName: 'actId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarRenewalReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarRenewalReq copyWith(void Function(CarRenewalReq) updates) =>
      super.copyWith((message) => updates(message as CarRenewalReq))
          as CarRenewalReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarRenewalReq create() => CarRenewalReq._();
  @$core.override
  CarRenewalReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarRenewalReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarRenewalReq>(create);
  static CarRenewalReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get carId => $_getI64(0);
  @$pb.TagNumber(1)
  set carId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCarId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCarId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get planId => $_getI64(1);
  @$pb.TagNumber(2)
  set planId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPlanId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlanId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get actId => $_getI64(2);
  @$pb.TagNumber(3)
  set actId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasActId() => $_has(2);
  @$pb.TagNumber(3)
  void clearActId() => $_clearField(3);
}

class CarRenewalRspData extends $pb.GeneratedMessage {
  factory CarRenewalRspData() => create();

  CarRenewalRspData._();

  factory CarRenewalRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarRenewalRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarRenewalRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarRenewalRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarRenewalRspData copyWith(void Function(CarRenewalRspData) updates) =>
      super.copyWith((message) => updates(message as CarRenewalRspData))
          as CarRenewalRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarRenewalRspData create() => CarRenewalRspData._();
  @$core.override
  CarRenewalRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarRenewalRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarRenewalRspData>(create);
  static CarRenewalRspData? _defaultInstance;
}

/// 座驾
class CarInBookGetListRspData_Car extends $pb.GeneratedMessage {
  factory CarInBookGetListRspData_Car({
    $0.CarMetaInfo? carMetaInfo,
    $core.bool? light,
  }) {
    final result = create();
    if (carMetaInfo != null) result.carMetaInfo = carMetaInfo;
    if (light != null) result.light = light;
    return result;
  }

  CarInBookGetListRspData_Car._();

  factory CarInBookGetListRspData_Car.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarInBookGetListRspData_Car.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarInBookGetListRspData.Car',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..aOM<$0.CarMetaInfo>(1, _omitFieldNames ? '' : 'carMetaInfo',
        protoName: 'carMetaInfo', subBuilder: $0.CarMetaInfo.create)
    ..aOB(2, _omitFieldNames ? '' : 'light')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarInBookGetListRspData_Car clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarInBookGetListRspData_Car copyWith(
          void Function(CarInBookGetListRspData_Car) updates) =>
      super.copyWith(
              (message) => updates(message as CarInBookGetListRspData_Car))
          as CarInBookGetListRspData_Car;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarInBookGetListRspData_Car create() =>
      CarInBookGetListRspData_Car._();
  @$core.override
  CarInBookGetListRspData_Car createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarInBookGetListRspData_Car getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarInBookGetListRspData_Car>(create);
  static CarInBookGetListRspData_Car? _defaultInstance;

  @$pb.TagNumber(1)
  $0.CarMetaInfo get carMetaInfo => $_getN(0);
  @$pb.TagNumber(1)
  set carMetaInfo($0.CarMetaInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCarMetaInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearCarMetaInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.CarMetaInfo ensureCarMetaInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get light => $_getBF(1);
  @$pb.TagNumber(2)
  set light($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLight() => $_has(1);
  @$pb.TagNumber(2)
  void clearLight() => $_clearField(2);
}

/// *
/// 获取图鉴里的座驾列表
/// post /car/in-book/get-list
/// body void
/// return BaseRsp(data is CarInBookGetListRspData)
class CarInBookGetListRspData extends $pb.GeneratedMessage {
  factory CarInBookGetListRspData({
    $core.Iterable<CarInBookGetListRspData_Car>? carList,
  }) {
    final result = create();
    if (carList != null) result.carList.addAll(carList);
    return result;
  }

  CarInBookGetListRspData._();

  factory CarInBookGetListRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarInBookGetListRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarInBookGetListRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..pPM<CarInBookGetListRspData_Car>(1, _omitFieldNames ? '' : 'carList',
        protoName: 'carList', subBuilder: CarInBookGetListRspData_Car.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarInBookGetListRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarInBookGetListRspData copyWith(
          void Function(CarInBookGetListRspData) updates) =>
      super.copyWith((message) => updates(message as CarInBookGetListRspData))
          as CarInBookGetListRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarInBookGetListRspData create() => CarInBookGetListRspData._();
  @$core.override
  CarInBookGetListRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarInBookGetListRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarInBookGetListRspData>(create);
  static CarInBookGetListRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CarInBookGetListRspData_Car> get carList => $_getList(0);
}

/// *
/// 获取当前驾驶座驾
/// post /car/driving/get
/// body void
/// return BaseRsp(data is CarDrivingGetRspData)
/// return CarDrivingGetRsp
class CarDrivingGetRspData extends $pb.GeneratedMessage {
  factory CarDrivingGetRspData({
    $0.UserCar? car,
  }) {
    final result = create();
    if (car != null) result.car = car;
    return result;
  }

  CarDrivingGetRspData._();

  factory CarDrivingGetRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarDrivingGetRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarDrivingGetRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'car'),
      createEmptyInstance: create)
    ..aOM<$0.UserCar>(1, _omitFieldNames ? '' : 'car',
        subBuilder: $0.UserCar.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarDrivingGetRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarDrivingGetRspData copyWith(void Function(CarDrivingGetRspData) updates) =>
      super.copyWith((message) => updates(message as CarDrivingGetRspData))
          as CarDrivingGetRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarDrivingGetRspData create() => CarDrivingGetRspData._();
  @$core.override
  CarDrivingGetRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarDrivingGetRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarDrivingGetRspData>(create);
  static CarDrivingGetRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $0.UserCar get car => $_getN(0);
  @$pb.TagNumber(1)
  set car($0.UserCar value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCar() => $_has(0);
  @$pb.TagNumber(1)
  void clearCar() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.UserCar ensureCar() => $_ensure(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

// This is a generated file - do not edit.
//
// Generated from server_client/base.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'base.pbenum.dart';

/// *
/// 统一响应
/// 新接口统一使用该出参，只需要说明data的泛型具体是什么，方便pack和unpack即可
class BaseRsp extends $pb.GeneratedMessage {
  factory BaseRsp({
    $core.bool? success,
    $core.int? code,
    $core.String? message,
    $fixnum.Int64? sysTime,
    $0.Any? data,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (code != null) result.code = code;
    if (message != null) result.message = message;
    if (sysTime != null) result.sysTime = sysTime;
    if (data != null) result.data = data;
    return result;
  }

  BaseRsp._();

  factory BaseRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BaseRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BaseRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aI(2, _omitFieldNames ? '' : 'code', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'sysTime', $pb.PbFieldType.OU6,
        protoName: 'sysTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Any>(5, _omitFieldNames ? '' : 'data', subBuilder: $0.Any.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BaseRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BaseRsp copyWith(void Function(BaseRsp) updates) =>
      super.copyWith((message) => updates(message as BaseRsp)) as BaseRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BaseRsp create() => BaseRsp._();
  @$core.override
  BaseRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BaseRsp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BaseRsp>(create);
  static BaseRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get code => $_getIZ(1);
  @$pb.TagNumber(2)
  set code($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get sysTime => $_getI64(3);
  @$pb.TagNumber(4)
  set sysTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSysTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearSysTime() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.Any get data => $_getN(4);
  @$pb.TagNumber(5)
  set data($0.Any value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasData() => $_has(4);
  @$pb.TagNumber(5)
  void clearData() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.Any ensureData() => $_ensure(4);
}

/// *
/// 分页请求，url 参数添加
/// page：可选，页数，从0起，不传默认0，
/// size：可选，每页元素，默认20，
/// sort：可选，可多选，写法举例：createAt,desc
class Page extends $pb.GeneratedMessage {
  factory Page({
    $core.int? totalPages,
    $fixnum.Int64? totalElements,
    $core.int? number,
    $core.int? size,
    $core.bool? isFirst,
    $core.bool? isLast,
    $core.bool? hasNext,
    $core.bool? hasPrevious,
  }) {
    final result = create();
    if (totalPages != null) result.totalPages = totalPages;
    if (totalElements != null) result.totalElements = totalElements;
    if (number != null) result.number = number;
    if (size != null) result.size = size;
    if (isFirst != null) result.isFirst = isFirst;
    if (isLast != null) result.isLast = isLast;
    if (hasNext != null) result.hasNext = hasNext;
    if (hasPrevious != null) result.hasPrevious = hasPrevious;
    return result;
  }

  Page._();

  factory Page.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Page.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Page',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'totalPages', protoName: 'totalPages')
    ..aInt64(2, _omitFieldNames ? '' : 'totalElements',
        protoName: 'totalElements')
    ..aI(3, _omitFieldNames ? '' : 'number')
    ..aI(4, _omitFieldNames ? '' : 'size')
    ..aOB(5, _omitFieldNames ? '' : 'isFirst', protoName: 'isFirst')
    ..aOB(6, _omitFieldNames ? '' : 'isLast', protoName: 'isLast')
    ..aOB(7, _omitFieldNames ? '' : 'hasNext', protoName: 'hasNext')
    ..aOB(8, _omitFieldNames ? '' : 'hasPrevious', protoName: 'hasPrevious')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Page clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Page copyWith(void Function(Page) updates) =>
      super.copyWith((message) => updates(message as Page)) as Page;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Page create() => Page._();
  @$core.override
  Page createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Page getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Page>(create);
  static Page? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalPages => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalPages($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalPages() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalPages() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalElements => $_getI64(1);
  @$pb.TagNumber(2)
  set totalElements($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalElements() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalElements() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get number => $_getIZ(2);
  @$pb.TagNumber(3)
  set number($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearNumber() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get size => $_getIZ(3);
  @$pb.TagNumber(4)
  set size($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearSize() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isFirst => $_getBF(4);
  @$pb.TagNumber(5)
  set isFirst($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsFirst() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsFirst() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isLast => $_getBF(5);
  @$pb.TagNumber(6)
  set isLast($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsLast() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsLast() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get hasNext => $_getBF(6);
  @$pb.TagNumber(7)
  set hasNext($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasHasNext() => $_has(6);
  @$pb.TagNumber(7)
  void clearHasNext() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get hasPrevious => $_getBF(7);
  @$pb.TagNumber(8)
  set hasPrevious($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasHasPrevious() => $_has(7);
  @$pb.TagNumber(8)
  void clearHasPrevious() => $_clearField(8);
}

class Ids extends $pb.GeneratedMessage {
  factory Ids({
    $core.Iterable<$fixnum.Int64>? ids,
  }) {
    final result = create();
    if (ids != null) result.ids.addAll(ids);
    return result;
  }

  Ids._();

  factory Ids.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Ids.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Ids',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'ids', $pb.PbFieldType.K6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Ids clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Ids copyWith(void Function(Ids) updates) =>
      super.copyWith((message) => updates(message as Ids)) as Ids;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Ids create() => Ids._();
  @$core.override
  Ids createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Ids getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ids>(create);
  static Ids? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get ids => $_getList(0);
}

/// *
/// 设备信息，将其构建好后，序列化成Json字符串，通过Header参数传到后台，名称为：device-info
/// 例：device-info: {"device_type":"android","device_model":"xiaomi 6","mac":"aabb-ccdd-eeff","app_version":"1.0.0"}
class DeviceInfo extends $pb.GeneratedMessage {
  factory DeviceInfo({
    $core.String? channel,
    $core.String? deviceType,
    $core.String? deviceModel,
    $core.String? mac,
    $core.String? appVersion,
    $core.String? cpuType,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (deviceType != null) result.deviceType = deviceType;
    if (deviceModel != null) result.deviceModel = deviceModel;
    if (mac != null) result.mac = mac;
    if (appVersion != null) result.appVersion = appVersion;
    if (cpuType != null) result.cpuType = cpuType;
    return result;
  }

  DeviceInfo._();

  factory DeviceInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'channel')
    ..aOS(2, _omitFieldNames ? '' : 'deviceType')
    ..aOS(3, _omitFieldNames ? '' : 'deviceModel')
    ..aOS(4, _omitFieldNames ? '' : 'mac')
    ..aOS(5, _omitFieldNames ? '' : 'appVersion')
    ..aOS(6, _omitFieldNames ? '' : 'cpuType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceInfo copyWith(void Function(DeviceInfo) updates) =>
      super.copyWith((message) => updates(message as DeviceInfo)) as DeviceInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceInfo create() => DeviceInfo._();
  @$core.override
  DeviceInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceInfo>(create);
  static DeviceInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get channel => $_getSZ(0);
  @$pb.TagNumber(1)
  set channel($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceType => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeviceType() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceModel => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceModel($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDeviceModel() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceModel() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get mac => $_getSZ(3);
  @$pb.TagNumber(4)
  set mac($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMac() => $_has(3);
  @$pb.TagNumber(4)
  void clearMac() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get appVersion => $_getSZ(4);
  @$pb.TagNumber(5)
  set appVersion($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAppVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearAppVersion() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get cpuType => $_getSZ(5);
  @$pb.TagNumber(6)
  set cpuType($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCpuType() => $_has(5);
  @$pb.TagNumber(6)
  void clearCpuType() => $_clearField(6);
}

class CommonParam extends $pb.GeneratedMessage {
  factory CommonParam({
    $core.String? channel,
    $core.String? platform,
    $core.String? deviceModel,
    $core.String? mac,
    $core.String? appVersion,
    $core.String? cpuType,
    $core.String? deviceId,
    $core.String? distinctId,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (platform != null) result.platform = platform;
    if (deviceModel != null) result.deviceModel = deviceModel;
    if (mac != null) result.mac = mac;
    if (appVersion != null) result.appVersion = appVersion;
    if (cpuType != null) result.cpuType = cpuType;
    if (deviceId != null) result.deviceId = deviceId;
    if (distinctId != null) result.distinctId = distinctId;
    return result;
  }

  CommonParam._();

  factory CommonParam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommonParam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommonParam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'channel')
    ..aOS(2, _omitFieldNames ? '' : 'platform')
    ..aOS(3, _omitFieldNames ? '' : 'deviceModel')
    ..aOS(4, _omitFieldNames ? '' : 'mac')
    ..aOS(5, _omitFieldNames ? '' : 'appVersion')
    ..aOS(6, _omitFieldNames ? '' : 'cpuType')
    ..aOS(7, _omitFieldNames ? '' : 'deviceId')
    ..aOS(8, _omitFieldNames ? '' : 'distinctId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommonParam clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommonParam copyWith(void Function(CommonParam) updates) =>
      super.copyWith((message) => updates(message as CommonParam))
          as CommonParam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommonParam create() => CommonParam._();
  @$core.override
  CommonParam createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommonParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonParam>(create);
  static CommonParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get channel => $_getSZ(0);
  @$pb.TagNumber(1)
  set channel($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get platform => $_getSZ(1);
  @$pb.TagNumber(2)
  set platform($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPlatform() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlatform() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceModel => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceModel($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDeviceModel() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceModel() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get mac => $_getSZ(3);
  @$pb.TagNumber(4)
  set mac($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMac() => $_has(3);
  @$pb.TagNumber(4)
  void clearMac() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get appVersion => $_getSZ(4);
  @$pb.TagNumber(5)
  set appVersion($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAppVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearAppVersion() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get cpuType => $_getSZ(5);
  @$pb.TagNumber(6)
  set cpuType($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCpuType() => $_has(5);
  @$pb.TagNumber(6)
  void clearCpuType() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get deviceId => $_getSZ(6);
  @$pb.TagNumber(7)
  set deviceId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDeviceId() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeviceId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get distinctId => $_getSZ(7);
  @$pb.TagNumber(8)
  set distinctId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDistinctId() => $_has(7);
  @$pb.TagNumber(8)
  void clearDistinctId() => $_clearField(8);
}

class BaseReq extends $pb.GeneratedMessage {
  factory BaseReq({
    CommonParam? commonParam,
    $core.String? bizParam,
  }) {
    final result = create();
    if (commonParam != null) result.commonParam = commonParam;
    if (bizParam != null) result.bizParam = bizParam;
    return result;
  }

  BaseReq._();

  factory BaseReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BaseReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BaseReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOM<CommonParam>(1, _omitFieldNames ? '' : 'commonParam',
        subBuilder: CommonParam.create)
    ..aOS(2, _omitFieldNames ? '' : 'bizParam')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BaseReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BaseReq copyWith(void Function(BaseReq) updates) =>
      super.copyWith((message) => updates(message as BaseReq)) as BaseReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BaseReq create() => BaseReq._();
  @$core.override
  BaseReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BaseReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BaseReq>(create);
  static BaseReq? _defaultInstance;

  @$pb.TagNumber(1)
  CommonParam get commonParam => $_getN(0);
  @$pb.TagNumber(1)
  set commonParam(CommonParam value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCommonParam() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommonParam() => $_clearField(1);
  @$pb.TagNumber(1)
  CommonParam ensureCommonParam() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get bizParam => $_getSZ(1);
  @$pb.TagNumber(2)
  set bizParam($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBizParam() => $_has(1);
  @$pb.TagNumber(2)
  void clearBizParam() => $_clearField(2);
}

/// 用户特权等级icon
class UserVipLevelIcons extends $pb.GeneratedMessage {
  factory UserVipLevelIcons({
    $core.String? smallIcon,
    $core.String? middleIcon,
    $core.String? bigIcon,
    $core.String? startColor,
    $core.String? endColor,
  }) {
    final result = create();
    if (smallIcon != null) result.smallIcon = smallIcon;
    if (middleIcon != null) result.middleIcon = middleIcon;
    if (bigIcon != null) result.bigIcon = bigIcon;
    if (startColor != null) result.startColor = startColor;
    if (endColor != null) result.endColor = endColor;
    return result;
  }

  UserVipLevelIcons._();

  factory UserVipLevelIcons.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserVipLevelIcons.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserVipLevelIcons',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'smallIcon', protoName: 'smallIcon')
    ..aOS(2, _omitFieldNames ? '' : 'middleIcon', protoName: 'middleIcon')
    ..aOS(3, _omitFieldNames ? '' : 'bigIcon', protoName: 'bigIcon')
    ..aOS(4, _omitFieldNames ? '' : 'startColor', protoName: 'startColor')
    ..aOS(5, _omitFieldNames ? '' : 'endColor', protoName: 'endColor')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserVipLevelIcons clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserVipLevelIcons copyWith(void Function(UserVipLevelIcons) updates) =>
      super.copyWith((message) => updates(message as UserVipLevelIcons))
          as UserVipLevelIcons;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserVipLevelIcons create() => UserVipLevelIcons._();
  @$core.override
  UserVipLevelIcons createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserVipLevelIcons getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserVipLevelIcons>(create);
  static UserVipLevelIcons? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get smallIcon => $_getSZ(0);
  @$pb.TagNumber(1)
  set smallIcon($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSmallIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearSmallIcon() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get middleIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set middleIcon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMiddleIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearMiddleIcon() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get bigIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set bigIcon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBigIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearBigIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get startColor => $_getSZ(3);
  @$pb.TagNumber(4)
  set startColor($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStartColor() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartColor() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get endColor => $_getSZ(4);
  @$pb.TagNumber(5)
  set endColor($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEndColor() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndColor() => $_clearField(5);
}

class RemoteManifest extends $pb.GeneratedMessage {
  factory RemoteManifest({
    $core.Iterable<$core.String>? matches,
    $core.Iterable<$core.MapEntry<$core.String, $core.int>>? versions,
    $core.Iterable<$core.String>? resources,
  }) {
    final result = create();
    if (matches != null) result.matches.addAll(matches);
    if (versions != null) result.versions.addEntries(versions);
    if (resources != null) result.resources.addAll(resources);
    return result;
  }

  RemoteManifest._();

  factory RemoteManifest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteManifest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteManifest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'matches')
    ..m<$core.String, $core.int>(2, _omitFieldNames ? '' : 'versions',
        entryClassName: 'RemoteManifest.VersionsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O3,
        packageName: const $pb.PackageName('base'))
    ..pPS(3, _omitFieldNames ? '' : 'resources')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteManifest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteManifest copyWith(void Function(RemoteManifest) updates) =>
      super.copyWith((message) => updates(message as RemoteManifest))
          as RemoteManifest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteManifest create() => RemoteManifest._();
  @$core.override
  RemoteManifest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemoteManifest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteManifest>(create);
  static RemoteManifest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get matches => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.int> get versions => $_getMap(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get resources => $_getList(2);
}

/// 开屏信息
class SplashInfo extends $pb.GeneratedMessage {
  factory SplashInfo({
    $fixnum.Int64? id,
    $core.int? type,
    $core.int? showCount,
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
    $core.int? showDuration,
    $core.bool? enableSkip,
    $core.String? content,
    $core.String? schemeUrl,
    $core.bool? alwaysReplace,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (showCount != null) result.showCount = showCount;
    if (startTime != null) result.startTime = startTime;
    if (endTime != null) result.endTime = endTime;
    if (showDuration != null) result.showDuration = showDuration;
    if (enableSkip != null) result.enableSkip = enableSkip;
    if (content != null) result.content = content;
    if (schemeUrl != null) result.schemeUrl = schemeUrl;
    if (alwaysReplace != null) result.alwaysReplace = alwaysReplace;
    return result;
  }

  SplashInfo._();

  factory SplashInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SplashInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SplashInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(2, _omitFieldNames ? '' : 'type', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'showCount', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'startTime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'endTime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(6, _omitFieldNames ? '' : 'showDuration',
        fieldType: $pb.PbFieldType.OU3)
    ..aOB(7, _omitFieldNames ? '' : 'enableSkip')
    ..aOS(8, _omitFieldNames ? '' : 'content')
    ..aOS(9, _omitFieldNames ? '' : 'schemeUrl')
    ..aOB(10, _omitFieldNames ? '' : 'alwaysReplace')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SplashInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SplashInfo copyWith(void Function(SplashInfo) updates) =>
      super.copyWith((message) => updates(message as SplashInfo)) as SplashInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SplashInfo create() => SplashInfo._();
  @$core.override
  SplashInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SplashInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SplashInfo>(create);
  static SplashInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get showCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set showCount($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasShowCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearShowCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get startTime => $_getI64(3);
  @$pb.TagNumber(4)
  set startTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStartTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartTime() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get endTime => $_getI64(4);
  @$pb.TagNumber(5)
  set endTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEndTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndTime() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get showDuration => $_getIZ(5);
  @$pb.TagNumber(6)
  set showDuration($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasShowDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearShowDuration() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get enableSkip => $_getBF(6);
  @$pb.TagNumber(7)
  set enableSkip($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasEnableSkip() => $_has(6);
  @$pb.TagNumber(7)
  void clearEnableSkip() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get content => $_getSZ(7);
  @$pb.TagNumber(8)
  set content($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasContent() => $_has(7);
  @$pb.TagNumber(8)
  void clearContent() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get schemeUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set schemeUrl($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasSchemeUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearSchemeUrl() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get alwaysReplace => $_getBF(9);
  @$pb.TagNumber(10)
  set alwaysReplace($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasAlwaysReplace() => $_has(9);
  @$pb.TagNumber(10)
  void clearAlwaysReplace() => $_clearField(10);
}

class SplashInfoRsp extends $pb.GeneratedMessage {
  factory SplashInfoRsp({
    $core.Iterable<SplashInfo>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  SplashInfoRsp._();

  factory SplashInfoRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SplashInfoRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SplashInfoRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..pPM<SplashInfo>(1, _omitFieldNames ? '' : 'list',
        subBuilder: SplashInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SplashInfoRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SplashInfoRsp copyWith(void Function(SplashInfoRsp) updates) =>
      super.copyWith((message) => updates(message as SplashInfoRsp))
          as SplashInfoRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SplashInfoRsp create() => SplashInfoRsp._();
  @$core.override
  SplashInfoRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SplashInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SplashInfoRsp>(create);
  static SplashInfoRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SplashInfo> get list => $_getList(0);
}

/// https://psgps3pqy5kw.sg.larksuite.com/wiki/OkQPwdOzGiSNkPkBN4tl9g19gqg
class AdTrackConfig extends $pb.GeneratedMessage {
  factory AdTrackConfig({
    $core.int? stayRoomDuration,
    $core.int? micUpDuration,
    $core.int? chatReplyTimes,
    $core.int? chatDuration,
  }) {
    final result = create();
    if (stayRoomDuration != null) result.stayRoomDuration = stayRoomDuration;
    if (micUpDuration != null) result.micUpDuration = micUpDuration;
    if (chatReplyTimes != null) result.chatReplyTimes = chatReplyTimes;
    if (chatDuration != null) result.chatDuration = chatDuration;
    return result;
  }

  AdTrackConfig._();

  factory AdTrackConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AdTrackConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AdTrackConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'stayRoomDuration',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'micUpDuration',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'chatReplyTimes',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'chatDuration',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AdTrackConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AdTrackConfig copyWith(void Function(AdTrackConfig) updates) =>
      super.copyWith((message) => updates(message as AdTrackConfig))
          as AdTrackConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdTrackConfig create() => AdTrackConfig._();
  @$core.override
  AdTrackConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AdTrackConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AdTrackConfig>(create);
  static AdTrackConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get stayRoomDuration => $_getIZ(0);
  @$pb.TagNumber(1)
  set stayRoomDuration($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStayRoomDuration() => $_has(0);
  @$pb.TagNumber(1)
  void clearStayRoomDuration() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get micUpDuration => $_getIZ(1);
  @$pb.TagNumber(2)
  set micUpDuration($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMicUpDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearMicUpDuration() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get chatReplyTimes => $_getIZ(2);
  @$pb.TagNumber(3)
  set chatReplyTimes($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChatReplyTimes() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatReplyTimes() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get chatDuration => $_getIZ(3);
  @$pb.TagNumber(4)
  set chatDuration($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChatDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearChatDuration() => $_clearField(4);
}

/// 解决其他proto引用user.proto存在循环依赖问题
class CommonUser extends $pb.GeneratedMessage {
  factory CommonUser({
    $fixnum.Int64? id,
    $core.String? nickname,
    $core.String? avatar,
    $core.String? gender,
    $core.int? age,
    $core.String? emUsername,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    if (gender != null) result.gender = gender;
    if (age != null) result.age = age;
    if (emUsername != null) result.emUsername = emUsername;
    return result;
  }

  CommonUser._();

  factory CommonUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommonUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommonUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'gender')
    ..aI(5, _omitFieldNames ? '' : 'age')
    ..aOS(6, _omitFieldNames ? '' : 'emUsername')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommonUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommonUser copyWith(void Function(CommonUser) updates) =>
      super.copyWith((message) => updates(message as CommonUser)) as CommonUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommonUser create() => CommonUser._();
  @$core.override
  CommonUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommonUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonUser>(create);
  static CommonUser? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get gender => $_getSZ(3);
  @$pb.TagNumber(4)
  set gender($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get age => $_getIZ(4);
  @$pb.TagNumber(5)
  set age($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAge() => $_has(4);
  @$pb.TagNumber(5)
  void clearAge() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get emUsername => $_getSZ(5);
  @$pb.TagNumber(6)
  set emUsername($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEmUsername() => $_has(5);
  @$pb.TagNumber(6)
  void clearEmUsername() => $_clearField(6);
}

/// 数数配置
class TaConfig extends $pb.GeneratedMessage {
  factory TaConfig({
    $core.String? appId,
    $core.String? serverUrl,
  }) {
    final result = create();
    if (appId != null) result.appId = appId;
    if (serverUrl != null) result.serverUrl = serverUrl;
    return result;
  }

  TaConfig._();

  factory TaConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TaConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TaConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'appId')
    ..aOS(2, _omitFieldNames ? '' : 'serverUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaConfig copyWith(void Function(TaConfig) updates) =>
      super.copyWith((message) => updates(message as TaConfig)) as TaConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaConfig create() => TaConfig._();
  @$core.override
  TaConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TaConfig getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaConfig>(create);
  static TaConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get appId => $_getSZ(0);
  @$pb.TagNumber(1)
  set appId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAppId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get serverUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set serverUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasServerUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerUrl() => $_clearField(2);
}

/// IM配置
class ImConfig extends $pb.GeneratedMessage {
  factory ImConfig({
    $core.int? appId,
    $core.String? appKey,
    $core.String? apnsName,
    $core.String? fcmKey,
  }) {
    final result = create();
    if (appId != null) result.appId = appId;
    if (appKey != null) result.appKey = appKey;
    if (apnsName != null) result.apnsName = apnsName;
    if (fcmKey != null) result.fcmKey = fcmKey;
    return result;
  }

  ImConfig._();

  factory ImConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ImConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ImConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'appId')
    ..aOS(2, _omitFieldNames ? '' : 'appKey')
    ..aOS(3, _omitFieldNames ? '' : 'apnsName')
    ..aOS(4, _omitFieldNames ? '' : 'fcmKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImConfig copyWith(void Function(ImConfig) updates) =>
      super.copyWith((message) => updates(message as ImConfig)) as ImConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImConfig create() => ImConfig._();
  @$core.override
  ImConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ImConfig getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImConfig>(create);
  static ImConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get appId => $_getIZ(0);
  @$pb.TagNumber(1)
  set appId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAppId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get appKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set appKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAppKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearAppKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get apnsName => $_getSZ(2);
  @$pb.TagNumber(3)
  set apnsName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasApnsName() => $_has(2);
  @$pb.TagNumber(3)
  void clearApnsName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get fcmKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set fcmKey($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFcmKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearFcmKey() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

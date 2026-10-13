// This is a generated file - do not edit.
//
// Generated from server_client/fleet/play.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'base.pb.dart' as $0;
import 'treasure.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 造船厂首页响应
class FleetShipyardInfoResp extends $pb.GeneratedMessage {
  factory FleetShipyardInfoResp({
    $0.FleetBaseInfo? base,
    $0.FleetShipyardInfo? info,
    FleetPlayUserData? userData,
    $core.Iterable<$0.FleetEvent>? events,
  }) {
    final result = create();
    if (base != null) result.base = base;
    if (info != null) result.info = info;
    if (userData != null) result.userData = userData;
    if (events != null) result.events.addAll(events);
    return result;
  }

  FleetShipyardInfoResp._();

  factory FleetShipyardInfoResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetShipyardInfoResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetShipyardInfoResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.play'),
      createEmptyInstance: create)
    ..aOM<$0.FleetBaseInfo>(1, _omitFieldNames ? '' : 'base',
        subBuilder: $0.FleetBaseInfo.create)
    ..aOM<$0.FleetShipyardInfo>(2, _omitFieldNames ? '' : 'info',
        subBuilder: $0.FleetShipyardInfo.create)
    ..aOM<FleetPlayUserData>(3, _omitFieldNames ? '' : 'userData',
        subBuilder: FleetPlayUserData.create)
    ..pPM<$0.FleetEvent>(4, _omitFieldNames ? '' : 'events',
        subBuilder: $0.FleetEvent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetShipyardInfoResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetShipyardInfoResp copyWith(
          void Function(FleetShipyardInfoResp) updates) =>
      super.copyWith((message) => updates(message as FleetShipyardInfoResp))
          as FleetShipyardInfoResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetShipyardInfoResp create() => FleetShipyardInfoResp._();
  @$core.override
  FleetShipyardInfoResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetShipyardInfoResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetShipyardInfoResp>(create);
  static FleetShipyardInfoResp? _defaultInstance;

  @$pb.TagNumber(1)
  $0.FleetBaseInfo get base => $_getN(0);
  @$pb.TagNumber(1)
  set base($0.FleetBaseInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.FleetBaseInfo ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.FleetShipyardInfo get info => $_getN(1);
  @$pb.TagNumber(2)
  set info($0.FleetShipyardInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.FleetShipyardInfo ensureInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  FleetPlayUserData get userData => $_getN(2);
  @$pb.TagNumber(3)
  set userData(FleetPlayUserData value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUserData() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserData() => $_clearField(3);
  @$pb.TagNumber(3)
  FleetPlayUserData ensureUserData() => $_ensure(2);

  @$pb.TagNumber(4)
  $pb.PbList<$0.FleetEvent> get events => $_getList(3);
}

/// 用户数据
class FleetPlayUserData extends $pb.GeneratedMessage {
  factory FleetPlayUserData({
    $fixnum.Int64? times,
    $fixnum.Int64? numbers,
    $0.FleetUserTask? task,
  }) {
    final result = create();
    if (times != null) result.times = times;
    if (numbers != null) result.numbers = numbers;
    if (task != null) result.task = task;
    return result;
  }

  FleetPlayUserData._();

  factory FleetPlayUserData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetPlayUserData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetPlayUserData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.play'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'times')
    ..aInt64(2, _omitFieldNames ? '' : 'numbers')
    ..aOM<$0.FleetUserTask>(3, _omitFieldNames ? '' : 'task',
        subBuilder: $0.FleetUserTask.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetPlayUserData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetPlayUserData copyWith(void Function(FleetPlayUserData) updates) =>
      super.copyWith((message) => updates(message as FleetPlayUserData))
          as FleetPlayUserData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetPlayUserData create() => FleetPlayUserData._();
  @$core.override
  FleetPlayUserData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetPlayUserData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetPlayUserData>(create);
  static FleetPlayUserData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get times => $_getI64(0);
  @$pb.TagNumber(1)
  set times($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimes() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimes() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get numbers => $_getI64(1);
  @$pb.TagNumber(2)
  set numbers($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNumbers() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumbers() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.FleetUserTask get task => $_getN(2);
  @$pb.TagNumber(3)
  set task($0.FleetUserTask value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTask() => $_has(2);
  @$pb.TagNumber(3)
  void clearTask() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.FleetUserTask ensureTask() => $_ensure(2);
}

/// 投喂/治疗/加固 请求
class FleetPlayReq extends $pb.GeneratedMessage {
  factory FleetPlayReq({
    $fixnum.Int64? num,
    $fixnum.Int64? fleetId,
  }) {
    final result = create();
    if (num != null) result.num = num;
    if (fleetId != null) result.fleetId = fleetId;
    return result;
  }

  FleetPlayReq._();

  factory FleetPlayReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetPlayReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetPlayReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.play'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'num')
    ..aInt64(2, _omitFieldNames ? '' : 'fleetId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetPlayReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetPlayReq copyWith(void Function(FleetPlayReq) updates) =>
      super.copyWith((message) => updates(message as FleetPlayReq))
          as FleetPlayReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetPlayReq create() => FleetPlayReq._();
  @$core.override
  FleetPlayReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetPlayReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetPlayReq>(create);
  static FleetPlayReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get num => $_getI64(0);
  @$pb.TagNumber(1)
  set num($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearNum() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get fleetId => $_getI64(1);
  @$pb.TagNumber(2)
  set fleetId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFleetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFleetId() => $_clearField(2);
}

/// 恶龙谷首页
class FleetDragonInfoResp extends $pb.GeneratedMessage {
  factory FleetDragonInfoResp({
    $fixnum.Int64? fleetId,
    $0.FleetDragonInfo? info,
    FleetPlayUserData? userData,
    $core.Iterable<$0.FleetEvent>? events,
    $core.Iterable<$1.FleetRewardClaimItem>? obtained,
  }) {
    final result = create();
    if (fleetId != null) result.fleetId = fleetId;
    if (info != null) result.info = info;
    if (userData != null) result.userData = userData;
    if (events != null) result.events.addAll(events);
    if (obtained != null) result.obtained.addAll(obtained);
    return result;
  }

  FleetDragonInfoResp._();

  factory FleetDragonInfoResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetDragonInfoResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetDragonInfoResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.play'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'fleetId')
    ..aOM<$0.FleetDragonInfo>(2, _omitFieldNames ? '' : 'info',
        subBuilder: $0.FleetDragonInfo.create)
    ..aOM<FleetPlayUserData>(3, _omitFieldNames ? '' : 'userData',
        subBuilder: FleetPlayUserData.create)
    ..pPM<$0.FleetEvent>(4, _omitFieldNames ? '' : 'events',
        subBuilder: $0.FleetEvent.create)
    ..pPM<$1.FleetRewardClaimItem>(5, _omitFieldNames ? '' : 'obtained',
        subBuilder: $1.FleetRewardClaimItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetDragonInfoResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetDragonInfoResp copyWith(void Function(FleetDragonInfoResp) updates) =>
      super.copyWith((message) => updates(message as FleetDragonInfoResp))
          as FleetDragonInfoResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetDragonInfoResp create() => FleetDragonInfoResp._();
  @$core.override
  FleetDragonInfoResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetDragonInfoResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetDragonInfoResp>(create);
  static FleetDragonInfoResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fleetId => $_getI64(0);
  @$pb.TagNumber(1)
  set fleetId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFleetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFleetId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.FleetDragonInfo get info => $_getN(1);
  @$pb.TagNumber(2)
  set info($0.FleetDragonInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.FleetDragonInfo ensureInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  FleetPlayUserData get userData => $_getN(2);
  @$pb.TagNumber(3)
  set userData(FleetPlayUserData value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUserData() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserData() => $_clearField(3);
  @$pb.TagNumber(3)
  FleetPlayUserData ensureUserData() => $_ensure(2);

  @$pb.TagNumber(4)
  $pb.PbList<$0.FleetEvent> get events => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<$1.FleetRewardClaimItem> get obtained => $_getList(4);
}

class FleetColorsRewardReq extends $pb.GeneratedMessage {
  factory FleetColorsRewardReq({
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  FleetColorsRewardReq._();

  factory FleetColorsRewardReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetColorsRewardReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetColorsRewardReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.play'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetColorsRewardReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetColorsRewardReq copyWith(void Function(FleetColorsRewardReq) updates) =>
      super.copyWith((message) => updates(message as FleetColorsRewardReq))
          as FleetColorsRewardReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetColorsRewardReq create() => FleetColorsRewardReq._();
  @$core.override
  FleetColorsRewardReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetColorsRewardReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetColorsRewardReq>(create);
  static FleetColorsRewardReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

/// 玩法模块领取战旗 请求
class FleetPlayClaimReq extends $pb.GeneratedMessage {
  factory FleetPlayClaimReq({
    $fixnum.Int64? fleetId,
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (fleetId != null) result.fleetId = fleetId;
    if (id != null) result.id = id;
    return result;
  }

  FleetPlayClaimReq._();

  factory FleetPlayClaimReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetPlayClaimReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetPlayClaimReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.play'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'fleetId')
    ..aInt64(2, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetPlayClaimReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetPlayClaimReq copyWith(void Function(FleetPlayClaimReq) updates) =>
      super.copyWith((message) => updates(message as FleetPlayClaimReq))
          as FleetPlayClaimReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetPlayClaimReq create() => FleetPlayClaimReq._();
  @$core.override
  FleetPlayClaimReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetPlayClaimReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetPlayClaimReq>(create);
  static FleetPlayClaimReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fleetId => $_getI64(0);
  @$pb.TagNumber(1)
  set fleetId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFleetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFleetId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);
}

/// 玩法模块领取战旗 响应
class FleetPlayClaimResp extends $pb.GeneratedMessage {
  factory FleetPlayClaimResp({
    $0.FleetUserTask? task,
  }) {
    final result = create();
    if (task != null) result.task = task;
    return result;
  }

  FleetPlayClaimResp._();

  factory FleetPlayClaimResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetPlayClaimResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetPlayClaimResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.play'),
      createEmptyInstance: create)
    ..aOM<$0.FleetUserTask>(1, _omitFieldNames ? '' : 'task',
        subBuilder: $0.FleetUserTask.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetPlayClaimResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetPlayClaimResp copyWith(void Function(FleetPlayClaimResp) updates) =>
      super.copyWith((message) => updates(message as FleetPlayClaimResp))
          as FleetPlayClaimResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetPlayClaimResp create() => FleetPlayClaimResp._();
  @$core.override
  FleetPlayClaimResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetPlayClaimResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetPlayClaimResp>(create);
  static FleetPlayClaimResp? _defaultInstance;

  @$pb.TagNumber(1)
  $0.FleetUserTask get task => $_getN(0);
  @$pb.TagNumber(1)
  set task($0.FleetUserTask value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.FleetUserTask ensureTask() => $_ensure(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

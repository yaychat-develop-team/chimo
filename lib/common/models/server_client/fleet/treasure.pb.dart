// This is a generated file - do not edit.
//
// Generated from server_client/fleet/treasure.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'treasure.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'treasure.pbenum.dart';

/// 舰队福利首页响应
class FleetRewardInfoResp extends $pb.GeneratedMessage {
  factory FleetRewardInfoResp({
    FleetRewardTask? rewardTask,
    $core.Iterable<FleetRewardLevel>? rewardLevels,
    $core.Iterable<FleetReward>? fleetRewards,
  }) {
    final result = create();
    if (rewardTask != null) result.rewardTask = rewardTask;
    if (rewardLevels != null) result.rewardLevels.addAll(rewardLevels);
    if (fleetRewards != null) result.fleetRewards.addAll(fleetRewards);
    return result;
  }

  FleetRewardInfoResp._();

  factory FleetRewardInfoResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetRewardInfoResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetRewardInfoResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.treasure'),
      createEmptyInstance: create)
    ..aOM<FleetRewardTask>(1, _omitFieldNames ? '' : 'rewardTask',
        subBuilder: FleetRewardTask.create)
    ..pPM<FleetRewardLevel>(2, _omitFieldNames ? '' : 'rewardLevels',
        subBuilder: FleetRewardLevel.create)
    ..pPM<FleetReward>(3, _omitFieldNames ? '' : 'fleetRewards',
        subBuilder: FleetReward.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardInfoResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardInfoResp copyWith(void Function(FleetRewardInfoResp) updates) =>
      super.copyWith((message) => updates(message as FleetRewardInfoResp))
          as FleetRewardInfoResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetRewardInfoResp create() => FleetRewardInfoResp._();
  @$core.override
  FleetRewardInfoResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetRewardInfoResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetRewardInfoResp>(create);
  static FleetRewardInfoResp? _defaultInstance;

  @$pb.TagNumber(1)
  FleetRewardTask get rewardTask => $_getN(0);
  @$pb.TagNumber(1)
  set rewardTask(FleetRewardTask value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRewardTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearRewardTask() => $_clearField(1);
  @$pb.TagNumber(1)
  FleetRewardTask ensureRewardTask() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<FleetRewardLevel> get rewardLevels => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<FleetReward> get fleetRewards => $_getList(2);
}

/// 舰队福利--用户的战旗收集 待达成任务(顶部进度条)
class FleetRewardTask extends $pb.GeneratedMessage {
  factory FleetRewardTask({
    $core.int? level,
    $core.int? completed,
    $core.int? total,
    $core.int? done,
  }) {
    final result = create();
    if (level != null) result.level = level;
    if (completed != null) result.completed = completed;
    if (total != null) result.total = total;
    if (done != null) result.done = done;
    return result;
  }

  FleetRewardTask._();

  factory FleetRewardTask.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetRewardTask.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetRewardTask',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.treasure'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'level')
    ..aI(2, _omitFieldNames ? '' : 'completed')
    ..aI(3, _omitFieldNames ? '' : 'total')
    ..aI(4, _omitFieldNames ? '' : 'done')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardTask clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardTask copyWith(void Function(FleetRewardTask) updates) =>
      super.copyWith((message) => updates(message as FleetRewardTask))
          as FleetRewardTask;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetRewardTask create() => FleetRewardTask._();
  @$core.override
  FleetRewardTask createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetRewardTask getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetRewardTask>(create);
  static FleetRewardTask? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get completed => $_getIZ(1);
  @$pb.TagNumber(2)
  set completed($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCompleted() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompleted() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get total => $_getIZ(2);
  @$pb.TagNumber(3)
  set total($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotal() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get done => $_getIZ(3);
  @$pb.TagNumber(4)
  set done($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDone() => $_has(3);
  @$pb.TagNumber(4)
  void clearDone() => $_clearField(4);
}

/// 福利等级需要的战旗数
class FleetRewardLevel extends $pb.GeneratedMessage {
  factory FleetRewardLevel({
    $core.int? level,
    $core.int? colours,
  }) {
    final result = create();
    if (level != null) result.level = level;
    if (colours != null) result.colours = colours;
    return result;
  }

  FleetRewardLevel._();

  factory FleetRewardLevel.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetRewardLevel.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetRewardLevel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.treasure'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'level')
    ..aI(2, _omitFieldNames ? '' : 'colours')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardLevel clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardLevel copyWith(void Function(FleetRewardLevel) updates) =>
      super.copyWith((message) => updates(message as FleetRewardLevel))
          as FleetRewardLevel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetRewardLevel create() => FleetRewardLevel._();
  @$core.override
  FleetRewardLevel createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetRewardLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetRewardLevel>(create);
  static FleetRewardLevel? _defaultInstance;

  /// 所处福利等级(1~15)
  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => $_clearField(1);

  /// 所需战旗数
  @$pb.TagNumber(2)
  $core.int get colours => $_getIZ(1);
  @$pb.TagNumber(2)
  set colours($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasColours() => $_has(1);
  @$pb.TagNumber(2)
  void clearColours() => $_clearField(2);
}

/// 舰队福利4个版本(基础、进阶、高级、豪华)
class FleetReward extends $pb.GeneratedMessage {
  factory FleetReward({
    $core.int? fleetLevel,
    FleetRewardVer? version,
    $core.Iterable<FleetRewardVo>? rewards,
  }) {
    final result = create();
    if (fleetLevel != null) result.fleetLevel = fleetLevel;
    if (version != null) result.version = version;
    if (rewards != null) result.rewards.addAll(rewards);
    return result;
  }

  FleetReward._();

  factory FleetReward.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetReward.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetReward',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.treasure'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'fleetLevel')
    ..aE<FleetRewardVer>(2, _omitFieldNames ? '' : 'version',
        enumValues: FleetRewardVer.values)
    ..pPM<FleetRewardVo>(3, _omitFieldNames ? '' : 'rewards',
        subBuilder: FleetRewardVo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetReward clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetReward copyWith(void Function(FleetReward) updates) =>
      super.copyWith((message) => updates(message as FleetReward))
          as FleetReward;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetReward create() => FleetReward._();
  @$core.override
  FleetReward createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetReward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetReward>(create);
  static FleetReward? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fleetLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set fleetLevel($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFleetLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearFleetLevel() => $_clearField(1);

  @$pb.TagNumber(2)
  FleetRewardVer get version => $_getN(1);
  @$pb.TagNumber(2)
  set version(FleetRewardVer value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<FleetRewardVo> get rewards => $_getList(2);
}

/// 舰队福利领取请求
class FleetRewardClaimReq extends $pb.GeneratedMessage {
  factory FleetRewardClaimReq({
    $fixnum.Int64? fleetId,
    $core.Iterable<$core.int>? idxs,
  }) {
    final result = create();
    if (fleetId != null) result.fleetId = fleetId;
    if (idxs != null) result.idxs.addAll(idxs);
    return result;
  }

  FleetRewardClaimReq._();

  factory FleetRewardClaimReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetRewardClaimReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetRewardClaimReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.treasure'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'fleetId')
    ..p<$core.int>(2, _omitFieldNames ? '' : 'idxs', $pb.PbFieldType.K3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardClaimReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardClaimReq copyWith(void Function(FleetRewardClaimReq) updates) =>
      super.copyWith((message) => updates(message as FleetRewardClaimReq))
          as FleetRewardClaimReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetRewardClaimReq create() => FleetRewardClaimReq._();
  @$core.override
  FleetRewardClaimReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetRewardClaimReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetRewardClaimReq>(create);
  static FleetRewardClaimReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fleetId => $_getI64(0);
  @$pb.TagNumber(1)
  set fleetId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFleetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFleetId() => $_clearField(1);

  /// 奖项编号 (可选参数: 多个领取传多个FleetRewardItem.idx ； 全量领取 传空数组 或不传。)
  @$pb.TagNumber(2)
  $pb.PbList<$core.int> get idxs => $_getList(1);
}

/// 舰队福利领取响应
class FleetRewardClaimResp extends $pb.GeneratedMessage {
  factory FleetRewardClaimResp({
    $core.Iterable<FleetRewardClaimItem>? obtained,
  }) {
    final result = create();
    if (obtained != null) result.obtained.addAll(obtained);
    return result;
  }

  FleetRewardClaimResp._();

  factory FleetRewardClaimResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetRewardClaimResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetRewardClaimResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.treasure'),
      createEmptyInstance: create)
    ..pPM<FleetRewardClaimItem>(2, _omitFieldNames ? '' : 'obtained',
        subBuilder: FleetRewardClaimItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardClaimResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardClaimResp copyWith(void Function(FleetRewardClaimResp) updates) =>
      super.copyWith((message) => updates(message as FleetRewardClaimResp))
          as FleetRewardClaimResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetRewardClaimResp create() => FleetRewardClaimResp._();
  @$core.override
  FleetRewardClaimResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetRewardClaimResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetRewardClaimResp>(create);
  static FleetRewardClaimResp? _defaultInstance;

  /// 本地领取的奖励清单
  @$pb.TagNumber(2)
  $pb.PbList<FleetRewardClaimItem> get obtained => $_getList(0);
}

/// 舰队福利领取Item
class FleetRewardClaimItem extends $pb.GeneratedMessage {
  factory FleetRewardClaimItem({
    $core.int? idx,
    $core.String? name,
    $core.String? res,
    $core.String? amount,
    $core.String? bg,
  }) {
    final result = create();
    if (idx != null) result.idx = idx;
    if (name != null) result.name = name;
    if (res != null) result.res = res;
    if (amount != null) result.amount = amount;
    if (bg != null) result.bg = bg;
    return result;
  }

  FleetRewardClaimItem._();

  factory FleetRewardClaimItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetRewardClaimItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetRewardClaimItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.treasure'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'idx')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'res')
    ..aOS(4, _omitFieldNames ? '' : 'amount')
    ..aOS(5, _omitFieldNames ? '' : 'bg')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardClaimItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardClaimItem copyWith(void Function(FleetRewardClaimItem) updates) =>
      super.copyWith((message) => updates(message as FleetRewardClaimItem))
          as FleetRewardClaimItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetRewardClaimItem create() => FleetRewardClaimItem._();
  @$core.override
  FleetRewardClaimItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetRewardClaimItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetRewardClaimItem>(create);
  static FleetRewardClaimItem? _defaultInstance;

  /// 奖项编号
  @$pb.TagNumber(1)
  $core.int get idx => $_getIZ(0);
  @$pb.TagNumber(1)
  set idx($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdx() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdx() => $_clearField(1);

  /// 名称
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// 资源图标
  @$pb.TagNumber(3)
  $core.String get res => $_getSZ(2);
  @$pb.TagNumber(3)
  set res($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRes() => $_has(2);
  @$pb.TagNumber(3)
  void clearRes() => $_clearField(3);

  /// 本次领取数量信息，例如 x5 或  7 Days
  @$pb.TagNumber(4)
  $core.String get amount => $_getSZ(3);
  @$pb.TagNumber(4)
  set amount($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => $_clearField(4);

  /// 背景
  @$pb.TagNumber(5)
  $core.String get bg => $_getSZ(4);
  @$pb.TagNumber(5)
  set bg($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBg() => $_has(4);
  @$pb.TagNumber(5)
  void clearBg() => $_clearField(5);
}

class FleetRewardVo extends $pb.GeneratedMessage {
  factory FleetRewardVo({
    $core.int? rewardLevel,
    $core.Iterable<FleetRewardItem>? rewardItems,
  }) {
    final result = create();
    if (rewardLevel != null) result.rewardLevel = rewardLevel;
    if (rewardItems != null) result.rewardItems.addAll(rewardItems);
    return result;
  }

  FleetRewardVo._();

  factory FleetRewardVo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetRewardVo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetRewardVo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.treasure'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'rewardLevel')
    ..pPM<FleetRewardItem>(2, _omitFieldNames ? '' : 'rewardItems',
        subBuilder: FleetRewardItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardVo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardVo copyWith(void Function(FleetRewardVo) updates) =>
      super.copyWith((message) => updates(message as FleetRewardVo))
          as FleetRewardVo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetRewardVo create() => FleetRewardVo._();
  @$core.override
  FleetRewardVo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetRewardVo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetRewardVo>(create);
  static FleetRewardVo? _defaultInstance;

  /// 福利等级(1~15) 不连续
  @$pb.TagNumber(1)
  $core.int get rewardLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set rewardLevel($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRewardLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearRewardLevel() => $_clearField(1);

  /// 奖励清单
  @$pb.TagNumber(2)
  $pb.PbList<FleetRewardItem> get rewardItems => $_getList(1);
}

/// 福利信息
class FleetRewardItem extends $pb.GeneratedMessage {
  factory FleetRewardItem({
    $core.int? idx,
    $core.String? name,
    $core.String? res,
    $core.int? num,
    $core.int? claimed,
    $core.bool? locked,
    $fixnum.Int64? itemId,
    $core.int? provide,
  }) {
    final result = create();
    if (idx != null) result.idx = idx;
    if (name != null) result.name = name;
    if (res != null) result.res = res;
    if (num != null) result.num = num;
    if (claimed != null) result.claimed = claimed;
    if (locked != null) result.locked = locked;
    if (itemId != null) result.itemId = itemId;
    if (provide != null) result.provide = provide;
    return result;
  }

  FleetRewardItem._();

  factory FleetRewardItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetRewardItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetRewardItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.treasure'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'idx')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'res')
    ..aI(4, _omitFieldNames ? '' : 'num')
    ..aI(5, _omitFieldNames ? '' : 'claimed')
    ..aOB(6, _omitFieldNames ? '' : 'locked')
    ..aInt64(7, _omitFieldNames ? '' : 'itemId')
    ..aI(8, _omitFieldNames ? '' : 'provide')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRewardItem copyWith(void Function(FleetRewardItem) updates) =>
      super.copyWith((message) => updates(message as FleetRewardItem))
          as FleetRewardItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetRewardItem create() => FleetRewardItem._();
  @$core.override
  FleetRewardItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetRewardItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetRewardItem>(create);
  static FleetRewardItem? _defaultInstance;

  /// 奖项编号
  @$pb.TagNumber(1)
  $core.int get idx => $_getIZ(0);
  @$pb.TagNumber(1)
  set idx($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdx() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdx() => $_clearField(1);

  /// 名称
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// 资源图标
  @$pb.TagNumber(3)
  $core.String get res => $_getSZ(2);
  @$pb.TagNumber(3)
  set res($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRes() => $_has(2);
  @$pb.TagNumber(3)
  void clearRes() => $_clearField(3);

  /// 个数
  @$pb.TagNumber(4)
  $core.int get num => $_getIZ(3);
  @$pb.TagNumber(4)
  set num($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearNum() => $_clearField(4);

  /// 领取状态: 1已领取  2可领取  3不可领取
  @$pb.TagNumber(5)
  $core.int get claimed => $_getIZ(4);
  @$pb.TagNumber(5)
  set claimed($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasClaimed() => $_has(4);
  @$pb.TagNumber(5)
  void clearClaimed() => $_clearField(5);

  /// 是否展示小锁(仅判定舰队等级与福利版本要求的等级)
  @$pb.TagNumber(6)
  $core.bool get locked => $_getBF(5);
  @$pb.TagNumber(6)
  set locked($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLocked() => $_has(5);
  @$pb.TagNumber(6)
  void clearLocked() => $_clearField(6);

  /// 道具背包资源id(联盟的道具为0) 冗余字段
  @$pb.TagNumber(7)
  $fixnum.Int64 get itemId => $_getI64(6);
  @$pb.TagNumber(7)
  set itemId($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasItemId() => $_has(6);
  @$pb.TagNumber(7)
  void clearItemId() => $_clearField(7);

  /// 物品发放类型:参考 FleetTreasureConfig.fleetRewardVo.fleetRewardItem.provide
  @$pb.TagNumber(8)
  $core.int get provide => $_getIZ(7);
  @$pb.TagNumber(8)
  set provide($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasProvide() => $_has(7);
  @$pb.TagNumber(8)
  void clearProvide() => $_clearField(8);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

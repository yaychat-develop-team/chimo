// This is a generated file - do not edit.
//
// Generated from server_client/fleet/base.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../commodity.pbenum.dart' as $1;
import '../message.pb.dart' as $0;
import 'base.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'base.pbenum.dart';

/// 飘屏事件
class FleetEvent extends $pb.GeneratedMessage {
  factory FleetEvent({
    $core.String? icon,
    $fixnum.Int64? uid,
    $core.Iterable<$0.ShowItem>? showItems,
  }) {
    final result = create();
    if (icon != null) result.icon = icon;
    if (uid != null) result.uid = uid;
    if (showItems != null) result.showItems.addAll(showItems);
    return result;
  }

  FleetEvent._();

  factory FleetEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'icon')
    ..aInt64(2, _omitFieldNames ? '' : 'uid')
    ..pPM<$0.ShowItem>(3, _omitFieldNames ? '' : 'showItems',
        subBuilder: $0.ShowItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetEvent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetEvent copyWith(void Function(FleetEvent) updates) =>
      super.copyWith((message) => updates(message as FleetEvent)) as FleetEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetEvent create() => FleetEvent._();
  @$core.override
  FleetEvent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetEvent>(create);
  static FleetEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$0.ShowItem> get showItems => $_getList(2);
}

/// 玩法模块中的用户任务
class FleetUserTask extends $pb.GeneratedMessage {
  factory FleetUserTask({
    $core.int? level,
    $core.int? completed,
    $core.int? total,
    $core.int? colours,
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (level != null) result.level = level;
    if (completed != null) result.completed = completed;
    if (total != null) result.total = total;
    if (colours != null) result.colours = colours;
    if (id != null) result.id = id;
    return result;
  }

  FleetUserTask._();

  factory FleetUserTask.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetUserTask.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetUserTask',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'level')
    ..aI(2, _omitFieldNames ? '' : 'completed')
    ..aI(3, _omitFieldNames ? '' : 'total')
    ..aI(4, _omitFieldNames ? '' : 'colours')
    ..aInt64(5, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetUserTask clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetUserTask copyWith(void Function(FleetUserTask) updates) =>
      super.copyWith((message) => updates(message as FleetUserTask))
          as FleetUserTask;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetUserTask create() => FleetUserTask._();
  @$core.override
  FleetUserTask createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetUserTask getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetUserTask>(create);
  static FleetUserTask? _defaultInstance;

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
  $core.int get colours => $_getIZ(3);
  @$pb.TagNumber(4)
  set colours($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasColours() => $_has(3);
  @$pb.TagNumber(4)
  void clearColours() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get id => $_getI64(4);
  @$pb.TagNumber(5)
  set id($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasId() => $_has(4);
  @$pb.TagNumber(5)
  void clearId() => $_clearField(5);
}

/// *
///  道具信息
class CommodityInfo extends $pb.GeneratedMessage {
  factory CommodityInfo({
    $1.CommodityType? type,
    $core.String? name,
    $core.String? icon,
    $core.int? boostValue,
    $fixnum.Int64? id,
    $core.int? count,
    $core.int? coins,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (boostValue != null) result.boostValue = boostValue;
    if (id != null) result.id = id;
    if (count != null) result.count = count;
    if (coins != null) result.coins = coins;
    return result;
  }

  CommodityInfo._();

  factory CommodityInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommodityInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommodityInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet'),
      createEmptyInstance: create)
    ..aE<$1.CommodityType>(1, _omitFieldNames ? '' : 'type',
        enumValues: $1.CommodityType.values)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aI(4, _omitFieldNames ? '' : 'boostValue', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(5, _omitFieldNames ? '' : 'id')
    ..aI(6, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..aI(7, _omitFieldNames ? '' : 'coins', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommodityInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommodityInfo copyWith(void Function(CommodityInfo) updates) =>
      super.copyWith((message) => updates(message as CommodityInfo))
          as CommodityInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommodityInfo create() => CommodityInfo._();
  @$core.override
  CommodityInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommodityInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommodityInfo>(create);
  static CommodityInfo? _defaultInstance;

  /// 道具类型
  @$pb.TagNumber(1)
  $1.CommodityType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type($1.CommodityType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

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
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  /// 加成值
  @$pb.TagNumber(4)
  $core.int get boostValue => $_getIZ(3);
  @$pb.TagNumber(4)
  set boostValue($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBoostValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoostValue() => $_clearField(4);

  /// 道具ID
  @$pb.TagNumber(5)
  $fixnum.Int64 get id => $_getI64(4);
  @$pb.TagNumber(5)
  set id($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasId() => $_has(4);
  @$pb.TagNumber(5)
  void clearId() => $_clearField(5);

  /// 道具数量
  @$pb.TagNumber(6)
  $core.int get count => $_getIZ(5);
  @$pb.TagNumber(6)
  set count($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearCount() => $_clearField(6);

  /// 礼物价值
  @$pb.TagNumber(7)
  $core.int get coins => $_getIZ(6);
  @$pb.TagNumber(7)
  set coins($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCoins() => $_has(6);
  @$pb.TagNumber(7)
  void clearCoins() => $_clearField(7);
}

/// 战船信息
class FleetShipyardInfo extends $pb.GeneratedMessage {
  factory FleetShipyardInfo({
    $fixnum.Int64? tonnage,
  }) {
    final result = create();
    if (tonnage != null) result.tonnage = tonnage;
    return result;
  }

  FleetShipyardInfo._();

  factory FleetShipyardInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetShipyardInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetShipyardInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'tonnage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetShipyardInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetShipyardInfo copyWith(void Function(FleetShipyardInfo) updates) =>
      super.copyWith((message) => updates(message as FleetShipyardInfo))
          as FleetShipyardInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetShipyardInfo create() => FleetShipyardInfo._();
  @$core.override
  FleetShipyardInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetShipyardInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetShipyardInfo>(create);
  static FleetShipyardInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get tonnage => $_getI64(0);
  @$pb.TagNumber(1)
  set tonnage($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTonnage() => $_has(0);
  @$pb.TagNumber(1)
  void clearTonnage() => $_clearField(1);
}

/// 恶龙基础信息
class FleetDragonInfo extends $pb.GeneratedMessage {
  factory FleetDragonInfo({
    $fixnum.Int64? weight,
    FleetDragonStatus? status,
    $fixnum.Int64? dragonId,
  }) {
    final result = create();
    if (weight != null) result.weight = weight;
    if (status != null) result.status = status;
    if (dragonId != null) result.dragonId = dragonId;
    return result;
  }

  FleetDragonInfo._();

  factory FleetDragonInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetDragonInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetDragonInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'weight')
    ..aE<FleetDragonStatus>(2, _omitFieldNames ? '' : 'status',
        enumValues: FleetDragonStatus.values)
    ..aInt64(3, _omitFieldNames ? '' : 'dragonId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetDragonInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetDragonInfo copyWith(void Function(FleetDragonInfo) updates) =>
      super.copyWith((message) => updates(message as FleetDragonInfo))
          as FleetDragonInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetDragonInfo create() => FleetDragonInfo._();
  @$core.override
  FleetDragonInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetDragonInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetDragonInfo>(create);
  static FleetDragonInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get weight => $_getI64(0);
  @$pb.TagNumber(1)
  set weight($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearWeight() => $_clearField(1);

  @$pb.TagNumber(2)
  FleetDragonStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(FleetDragonStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get dragonId => $_getI64(2);
  @$pb.TagNumber(3)
  set dragonId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDragonId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDragonId() => $_clearField(3);
}

/// 藏宝洞信息
class TreasureCoveInfo extends $pb.GeneratedMessage {
  factory TreasureCoveInfo({
    $fixnum.Int64? goldCoins,
  }) {
    final result = create();
    if (goldCoins != null) result.goldCoins = goldCoins;
    return result;
  }

  TreasureCoveInfo._();

  factory TreasureCoveInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TreasureCoveInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TreasureCoveInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'goldCoins')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TreasureCoveInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TreasureCoveInfo copyWith(void Function(TreasureCoveInfo) updates) =>
      super.copyWith((message) => updates(message as TreasureCoveInfo))
          as TreasureCoveInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TreasureCoveInfo create() => TreasureCoveInfo._();
  @$core.override
  TreasureCoveInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TreasureCoveInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TreasureCoveInfo>(create);
  static TreasureCoveInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get goldCoins => $_getI64(0);
  @$pb.TagNumber(1)
  set goldCoins($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGoldCoins() => $_has(0);
  @$pb.TagNumber(1)
  void clearGoldCoins() => $_clearField(1);
}

/// 赛季基础信息
class FleetSeasonInfo extends $pb.GeneratedMessage {
  factory FleetSeasonInfo({
    $fixnum.Int64? seasonId,
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
    $fixnum.Int64? pkStartTime,
    $fixnum.Int64? pkEndTime,
    $fixnum.Int64? giftId,
  }) {
    final result = create();
    if (seasonId != null) result.seasonId = seasonId;
    if (startTime != null) result.startTime = startTime;
    if (endTime != null) result.endTime = endTime;
    if (pkStartTime != null) result.pkStartTime = pkStartTime;
    if (pkEndTime != null) result.pkEndTime = pkEndTime;
    if (giftId != null) result.giftId = giftId;
    return result;
  }

  FleetSeasonInfo._();

  factory FleetSeasonInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetSeasonInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetSeasonInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'seasonId')
    ..aInt64(2, _omitFieldNames ? '' : 'startTime')
    ..aInt64(3, _omitFieldNames ? '' : 'endTime')
    ..aInt64(4, _omitFieldNames ? '' : 'pkStartTime')
    ..aInt64(5, _omitFieldNames ? '' : 'pkEndTime')
    ..aInt64(6, _omitFieldNames ? '' : 'giftId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetSeasonInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetSeasonInfo copyWith(void Function(FleetSeasonInfo) updates) =>
      super.copyWith((message) => updates(message as FleetSeasonInfo))
          as FleetSeasonInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetSeasonInfo create() => FleetSeasonInfo._();
  @$core.override
  FleetSeasonInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetSeasonInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetSeasonInfo>(create);
  static FleetSeasonInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get seasonId => $_getI64(0);
  @$pb.TagNumber(1)
  set seasonId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSeasonId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeasonId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get startTime => $_getI64(1);
  @$pb.TagNumber(2)
  set startTime($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get endTime => $_getI64(2);
  @$pb.TagNumber(3)
  set endTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get pkStartTime => $_getI64(3);
  @$pb.TagNumber(4)
  set pkStartTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPkStartTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearPkStartTime() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get pkEndTime => $_getI64(4);
  @$pb.TagNumber(5)
  set pkEndTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPkEndTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearPkEndTime() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get giftId => $_getI64(5);
  @$pb.TagNumber(6)
  set giftId($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGiftId() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftId() => $_clearField(6);
}

class FleetBaseInfo extends $pb.GeneratedMessage {
  factory FleetBaseInfo({
    $fixnum.Int64? fleetId,
    $core.int? memberNum,
    $core.String? fleetName,
    $core.String? fleetIcon,
    $core.int? fleetLevel,
    $fixnum.Int64? captainUid,
    $core.String? captainName,
    $core.int? fleetScore,
    $fixnum.Int64? fleetRid,
    $core.String? fleeRoomName,
    $fixnum.Int64? levelStartScore,
    $fixnum.Int64? levelEndScore,
    $core.int? fleetRank,
    $core.int? roomPersons,
    $core.int? fleetStarNum,
    $core.int? fleetCoinNum,
  }) {
    final result = create();
    if (fleetId != null) result.fleetId = fleetId;
    if (memberNum != null) result.memberNum = memberNum;
    if (fleetName != null) result.fleetName = fleetName;
    if (fleetIcon != null) result.fleetIcon = fleetIcon;
    if (fleetLevel != null) result.fleetLevel = fleetLevel;
    if (captainUid != null) result.captainUid = captainUid;
    if (captainName != null) result.captainName = captainName;
    if (fleetScore != null) result.fleetScore = fleetScore;
    if (fleetRid != null) result.fleetRid = fleetRid;
    if (fleeRoomName != null) result.fleeRoomName = fleeRoomName;
    if (levelStartScore != null) result.levelStartScore = levelStartScore;
    if (levelEndScore != null) result.levelEndScore = levelEndScore;
    if (fleetRank != null) result.fleetRank = fleetRank;
    if (roomPersons != null) result.roomPersons = roomPersons;
    if (fleetStarNum != null) result.fleetStarNum = fleetStarNum;
    if (fleetCoinNum != null) result.fleetCoinNum = fleetCoinNum;
    return result;
  }

  FleetBaseInfo._();

  factory FleetBaseInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetBaseInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetBaseInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'fleetId')
    ..aI(2, _omitFieldNames ? '' : 'memberNum', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'fleetName')
    ..aOS(4, _omitFieldNames ? '' : 'fleetIcon')
    ..aI(5, _omitFieldNames ? '' : 'fleetLevel', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(6, _omitFieldNames ? '' : 'captainUid')
    ..aOS(7, _omitFieldNames ? '' : 'captainName')
    ..aI(8, _omitFieldNames ? '' : 'fleetScore', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(9, _omitFieldNames ? '' : 'fleetRid')
    ..aOS(10, _omitFieldNames ? '' : 'fleeRoomName')
    ..aInt64(11, _omitFieldNames ? '' : 'levelStartScore')
    ..aInt64(12, _omitFieldNames ? '' : 'levelEndScore')
    ..aI(13, _omitFieldNames ? '' : 'fleetRank', fieldType: $pb.PbFieldType.OU3)
    ..aI(14, _omitFieldNames ? '' : 'roomPersons',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(15, _omitFieldNames ? '' : 'fleetStarNum',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(16, _omitFieldNames ? '' : 'fleetCoinNum',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetBaseInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetBaseInfo copyWith(void Function(FleetBaseInfo) updates) =>
      super.copyWith((message) => updates(message as FleetBaseInfo))
          as FleetBaseInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetBaseInfo create() => FleetBaseInfo._();
  @$core.override
  FleetBaseInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetBaseInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetBaseInfo>(create);
  static FleetBaseInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fleetId => $_getI64(0);
  @$pb.TagNumber(1)
  set fleetId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFleetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFleetId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get memberNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set memberNum($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMemberNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearMemberNum() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fleetName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fleetName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFleetName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFleetName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get fleetIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set fleetIcon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFleetIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearFleetIcon() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get fleetLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set fleetLevel($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFleetLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearFleetLevel() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get captainUid => $_getI64(5);
  @$pb.TagNumber(6)
  set captainUid($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCaptainUid() => $_has(5);
  @$pb.TagNumber(6)
  void clearCaptainUid() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get captainName => $_getSZ(6);
  @$pb.TagNumber(7)
  set captainName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCaptainName() => $_has(6);
  @$pb.TagNumber(7)
  void clearCaptainName() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get fleetScore => $_getIZ(7);
  @$pb.TagNumber(8)
  set fleetScore($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasFleetScore() => $_has(7);
  @$pb.TagNumber(8)
  void clearFleetScore() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get fleetRid => $_getI64(8);
  @$pb.TagNumber(9)
  set fleetRid($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasFleetRid() => $_has(8);
  @$pb.TagNumber(9)
  void clearFleetRid() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get fleeRoomName => $_getSZ(9);
  @$pb.TagNumber(10)
  set fleeRoomName($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasFleeRoomName() => $_has(9);
  @$pb.TagNumber(10)
  void clearFleeRoomName() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get levelStartScore => $_getI64(10);
  @$pb.TagNumber(11)
  set levelStartScore($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasLevelStartScore() => $_has(10);
  @$pb.TagNumber(11)
  void clearLevelStartScore() => $_clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get levelEndScore => $_getI64(11);
  @$pb.TagNumber(12)
  set levelEndScore($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(12)
  $core.bool hasLevelEndScore() => $_has(11);
  @$pb.TagNumber(12)
  void clearLevelEndScore() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get fleetRank => $_getIZ(12);
  @$pb.TagNumber(13)
  set fleetRank($core.int value) => $_setUnsignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasFleetRank() => $_has(12);
  @$pb.TagNumber(13)
  void clearFleetRank() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.int get roomPersons => $_getIZ(13);
  @$pb.TagNumber(14)
  set roomPersons($core.int value) => $_setUnsignedInt32(13, value);
  @$pb.TagNumber(14)
  $core.bool hasRoomPersons() => $_has(13);
  @$pb.TagNumber(14)
  void clearRoomPersons() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.int get fleetStarNum => $_getIZ(14);
  @$pb.TagNumber(15)
  set fleetStarNum($core.int value) => $_setUnsignedInt32(14, value);
  @$pb.TagNumber(15)
  $core.bool hasFleetStarNum() => $_has(14);
  @$pb.TagNumber(15)
  void clearFleetStarNum() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.int get fleetCoinNum => $_getIZ(15);
  @$pb.TagNumber(16)
  set fleetCoinNum($core.int value) => $_setUnsignedInt32(15, value);
  @$pb.TagNumber(16)
  $core.bool hasFleetCoinNum() => $_has(15);
  @$pb.TagNumber(16)
  void clearFleetCoinNum() => $_clearField(16);
}

/// 联盟道具抽奖的item
class FleetLotteryItem extends $pb.GeneratedMessage {
  factory FleetLotteryItem({
    $core.String? propType,
    $core.int? propNum,
    $core.String? propIcon,
  }) {
    final result = create();
    if (propType != null) result.propType = propType;
    if (propNum != null) result.propNum = propNum;
    if (propIcon != null) result.propIcon = propIcon;
    return result;
  }

  FleetLotteryItem._();

  factory FleetLotteryItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetLotteryItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetLotteryItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'propType')
    ..aI(2, _omitFieldNames ? '' : 'propNum', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'propIcon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetLotteryItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetLotteryItem copyWith(void Function(FleetLotteryItem) updates) =>
      super.copyWith((message) => updates(message as FleetLotteryItem))
          as FleetLotteryItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetLotteryItem create() => FleetLotteryItem._();
  @$core.override
  FleetLotteryItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetLotteryItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetLotteryItem>(create);
  static FleetLotteryItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get propType => $_getSZ(0);
  @$pb.TagNumber(1)
  set propType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPropType() => $_has(0);
  @$pb.TagNumber(1)
  void clearPropType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get propNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set propNum($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPropNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearPropNum() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get propIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set propIcon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPropIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearPropIcon() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

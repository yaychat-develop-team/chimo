// This is a generated file - do not edit.
//
// Generated from server_client/merch/gacha.proto.

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
import '../user.pb.dart' as $0;
import 'gacha.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'gacha.pbenum.dart';

/// 用户Token余额响应
class TokenBalanceRsp extends $pb.GeneratedMessage {
  factory TokenBalanceRsp({
    $fixnum.Int64? balance,
  }) {
    final result = create();
    if (balance != null) result.balance = balance;
    return result;
  }

  TokenBalanceRsp._();

  factory TokenBalanceRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TokenBalanceRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TokenBalanceRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'balance')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenBalanceRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TokenBalanceRsp copyWith(void Function(TokenBalanceRsp) updates) =>
      super.copyWith((message) => updates(message as TokenBalanceRsp))
          as TokenBalanceRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenBalanceRsp create() => TokenBalanceRsp._();
  @$core.override
  TokenBalanceRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TokenBalanceRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TokenBalanceRsp>(create);
  static TokenBalanceRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get balance => $_getI64(0);
  @$pb.TagNumber(1)
  set balance($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalance() => $_clearField(1);
}

/// 扭蛋抽卡请求
class GachaDrawReq extends $pb.GeneratedMessage {
  factory GachaDrawReq({
    $core.int? count,
  }) {
    final result = create();
    if (count != null) result.count = count;
    return result;
  }

  GachaDrawReq._();

  factory GachaDrawReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GachaDrawReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GachaDrawReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GachaDrawReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GachaDrawReq copyWith(void Function(GachaDrawReq) updates) =>
      super.copyWith((message) => updates(message as GachaDrawReq))
          as GachaDrawReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GachaDrawReq create() => GachaDrawReq._();
  @$core.override
  GachaDrawReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GachaDrawReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GachaDrawReq>(create);
  static GachaDrawReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);
}

/// 扭蛋抽卡响应
class MultiDrawRsp extends $pb.GeneratedMessage {
  factory MultiDrawRsp({
    $core.Iterable<GachaPoolItem>? results,
    $fixnum.Int64? remainingBalance,
  }) {
    final result = create();
    if (results != null) result.results.addAll(results);
    if (remainingBalance != null) result.remainingBalance = remainingBalance;
    return result;
  }

  MultiDrawRsp._();

  factory MultiDrawRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MultiDrawRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MultiDrawRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..pPM<GachaPoolItem>(1, _omitFieldNames ? '' : 'results',
        subBuilder: GachaPoolItem.create)
    ..aInt64(2, _omitFieldNames ? '' : 'remainingBalance')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultiDrawRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultiDrawRsp copyWith(void Function(MultiDrawRsp) updates) =>
      super.copyWith((message) => updates(message as MultiDrawRsp))
          as MultiDrawRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MultiDrawRsp create() => MultiDrawRsp._();
  @$core.override
  MultiDrawRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MultiDrawRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MultiDrawRsp>(create);
  static MultiDrawRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GachaPoolItem> get results => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get remainingBalance => $_getI64(1);
  @$pb.TagNumber(2)
  set remainingBalance($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRemainingBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemainingBalance() => $_clearField(2);
}

/// 抽卡记录响应
class GachaRecord extends $pb.GeneratedMessage {
  factory GachaRecord({
    $core.String? id,
    $1.CommodityType? type,
    $core.String? name,
    $core.String? url,
    $core.int? period,
    $core.int? rarity,
    $fixnum.Int64? createTime,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (name != null) result.name = name;
    if (url != null) result.url = url;
    if (period != null) result.period = period;
    if (rarity != null) result.rarity = rarity;
    if (createTime != null) result.createTime = createTime;
    return result;
  }

  GachaRecord._();

  factory GachaRecord.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GachaRecord.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GachaRecord',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aE<$1.CommodityType>(2, _omitFieldNames ? '' : 'type',
        enumValues: $1.CommodityType.values)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..aI(5, _omitFieldNames ? '' : 'period')
    ..aI(6, _omitFieldNames ? '' : 'rarity')
    ..aInt64(7, _omitFieldNames ? '' : 'createTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GachaRecord clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GachaRecord copyWith(void Function(GachaRecord) updates) =>
      super.copyWith((message) => updates(message as GachaRecord))
          as GachaRecord;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GachaRecord create() => GachaRecord._();
  @$core.override
  GachaRecord createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GachaRecord getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GachaRecord>(create);
  static GachaRecord? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $1.CommodityType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type($1.CommodityType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get period => $_getIZ(4);
  @$pb.TagNumber(5)
  set period($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPeriod() => $_has(4);
  @$pb.TagNumber(5)
  void clearPeriod() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get rarity => $_getIZ(5);
  @$pb.TagNumber(6)
  set rarity($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRarity() => $_has(5);
  @$pb.TagNumber(6)
  void clearRarity() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get createTime => $_getI64(6);
  @$pb.TagNumber(7)
  set createTime($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCreateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreateTime() => $_clearField(7);
}

/// 抽卡记录列表响应
class GachaRecordsRsp extends $pb.GeneratedMessage {
  factory GachaRecordsRsp({
    $core.Iterable<GachaRecord>? records,
    $core.int? totalCount,
  }) {
    final result = create();
    if (records != null) result.records.addAll(records);
    if (totalCount != null) result.totalCount = totalCount;
    return result;
  }

  GachaRecordsRsp._();

  factory GachaRecordsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GachaRecordsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GachaRecordsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..pPM<GachaRecord>(1, _omitFieldNames ? '' : 'records',
        subBuilder: GachaRecord.create)
    ..aI(2, _omitFieldNames ? '' : 'totalCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GachaRecordsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GachaRecordsRsp copyWith(void Function(GachaRecordsRsp) updates) =>
      super.copyWith((message) => updates(message as GachaRecordsRsp))
          as GachaRecordsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GachaRecordsRsp create() => GachaRecordsRsp._();
  @$core.override
  GachaRecordsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GachaRecordsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GachaRecordsRsp>(create);
  static GachaRecordsRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GachaRecord> get records => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);
}

/// 扭蛋奖池响应
class GachaRewardPoolRsp extends $pb.GeneratedMessage {
  factory GachaRewardPoolRsp({
    $core.Iterable<GachaPoolItem>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  GachaRewardPoolRsp._();

  factory GachaRewardPoolRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GachaRewardPoolRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GachaRewardPoolRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..pPM<GachaPoolItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: GachaPoolItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GachaRewardPoolRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GachaRewardPoolRsp copyWith(void Function(GachaRewardPoolRsp) updates) =>
      super.copyWith((message) => updates(message as GachaRewardPoolRsp))
          as GachaRewardPoolRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GachaRewardPoolRsp create() => GachaRewardPoolRsp._();
  @$core.override
  GachaRewardPoolRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GachaRewardPoolRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GachaRewardPoolRsp>(create);
  static GachaRewardPoolRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GachaPoolItem> get list => $_getList(0);
}

/// 回收/分解请求
class RecycleReq extends $pb.GeneratedMessage {
  factory RecycleReq({
    $core.Iterable<RecycleItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  RecycleReq._();

  factory RecycleReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecycleReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecycleReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..pPM<RecycleItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: RecycleItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecycleReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecycleReq copyWith(void Function(RecycleReq) updates) =>
      super.copyWith((message) => updates(message as RecycleReq)) as RecycleReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecycleReq create() => RecycleReq._();
  @$core.override
  RecycleReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RecycleReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecycleReq>(create);
  static RecycleReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RecycleItem> get items => $_getList(0);
}

/// 回收项
class RecycleItem extends $pb.GeneratedMessage {
  factory RecycleItem({
    $core.String? id,
    $1.CommodityType? type,
    $core.int? period,
    $core.int? num,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (period != null) result.period = period;
    if (num != null) result.num = num;
    return result;
  }

  RecycleItem._();

  factory RecycleItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecycleItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecycleItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aE<$1.CommodityType>(2, _omitFieldNames ? '' : 'type',
        enumValues: $1.CommodityType.values)
    ..aI(3, _omitFieldNames ? '' : 'period')
    ..aI(4, _omitFieldNames ? '' : 'num', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecycleItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecycleItem copyWith(void Function(RecycleItem) updates) =>
      super.copyWith((message) => updates(message as RecycleItem))
          as RecycleItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecycleItem create() => RecycleItem._();
  @$core.override
  RecycleItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RecycleItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecycleItem>(create);
  static RecycleItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $1.CommodityType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type($1.CommodityType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get period => $_getIZ(2);
  @$pb.TagNumber(3)
  set period($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPeriod() => $_has(2);
  @$pb.TagNumber(3)
  void clearPeriod() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get num => $_getIZ(3);
  @$pb.TagNumber(4)
  set num($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearNum() => $_clearField(4);
}

/// 回收响应
class RecycleRsp extends $pb.GeneratedMessage {
  factory RecycleRsp({
    $fixnum.Int64? totalCoins,
  }) {
    final result = create();
    if (totalCoins != null) result.totalCoins = totalCoins;
    return result;
  }

  RecycleRsp._();

  factory RecycleRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecycleRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecycleRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'totalCoins')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecycleRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecycleRsp copyWith(void Function(RecycleRsp) updates) =>
      super.copyWith((message) => updates(message as RecycleRsp)) as RecycleRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecycleRsp create() => RecycleRsp._();
  @$core.override
  RecycleRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RecycleRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecycleRsp>(create);
  static RecycleRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalCoins => $_getI64(0);
  @$pb.TagNumber(1)
  set totalCoins($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalCoins() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalCoins() => $_clearField(1);
}

/// 扭蛋奖池物品
class GachaPoolItem extends $pb.GeneratedMessage {
  factory GachaPoolItem({
    $core.String? id,
    $1.CommodityType? type,
    $core.String? name,
    $core.String? url,
    $core.int? period,
    $core.int? rarity,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (name != null) result.name = name;
    if (url != null) result.url = url;
    if (period != null) result.period = period;
    if (rarity != null) result.rarity = rarity;
    return result;
  }

  GachaPoolItem._();

  factory GachaPoolItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GachaPoolItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GachaPoolItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aE<$1.CommodityType>(2, _omitFieldNames ? '' : 'type',
        enumValues: $1.CommodityType.values)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..aI(5, _omitFieldNames ? '' : 'period')
    ..aI(6, _omitFieldNames ? '' : 'rarity')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GachaPoolItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GachaPoolItem copyWith(void Function(GachaPoolItem) updates) =>
      super.copyWith((message) => updates(message as GachaPoolItem))
          as GachaPoolItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GachaPoolItem create() => GachaPoolItem._();
  @$core.override
  GachaPoolItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GachaPoolItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GachaPoolItem>(create);
  static GachaPoolItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $1.CommodityType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type($1.CommodityType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get period => $_getIZ(4);
  @$pb.TagNumber(5)
  set period($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPeriod() => $_has(4);
  @$pb.TagNumber(5)
  void clearPeriod() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get rarity => $_getIZ(5);
  @$pb.TagNumber(6)
  set rarity($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRarity() => $_has(5);
  @$pb.TagNumber(6)
  void clearRarity() => $_clearField(6);
}

/// 抽卡选项
class GachaOption extends $pb.GeneratedMessage {
  factory GachaOption({
    $core.int? count,
    $core.int? cost,
  }) {
    final result = create();
    if (count != null) result.count = count;
    if (cost != null) result.cost = cost;
    return result;
  }

  GachaOption._();

  factory GachaOption.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GachaOption.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GachaOption',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count')
    ..aI(2, _omitFieldNames ? '' : 'cost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GachaOption clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GachaOption copyWith(void Function(GachaOption) updates) =>
      super.copyWith((message) => updates(message as GachaOption))
          as GachaOption;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GachaOption create() => GachaOption._();
  @$core.override
  GachaOption createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GachaOption getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GachaOption>(create);
  static GachaOption? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get cost => $_getIZ(1);
  @$pb.TagNumber(2)
  set cost($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCost() => $_has(1);
  @$pb.TagNumber(2)
  void clearCost() => $_clearField(2);
}

/// 抽卡配置响应
class GachaOptionsRsp extends $pb.GeneratedMessage {
  factory GachaOptionsRsp({
    GachaOption? singleDraw,
    GachaOption? multiDraw,
  }) {
    final result = create();
    if (singleDraw != null) result.singleDraw = singleDraw;
    if (multiDraw != null) result.multiDraw = multiDraw;
    return result;
  }

  GachaOptionsRsp._();

  factory GachaOptionsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GachaOptionsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GachaOptionsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..aOM<GachaOption>(1, _omitFieldNames ? '' : 'singleDraw',
        subBuilder: GachaOption.create)
    ..aOM<GachaOption>(2, _omitFieldNames ? '' : 'multiDraw',
        subBuilder: GachaOption.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GachaOptionsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GachaOptionsRsp copyWith(void Function(GachaOptionsRsp) updates) =>
      super.copyWith((message) => updates(message as GachaOptionsRsp))
          as GachaOptionsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GachaOptionsRsp create() => GachaOptionsRsp._();
  @$core.override
  GachaOptionsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GachaOptionsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GachaOptionsRsp>(create);
  static GachaOptionsRsp? _defaultInstance;

  @$pb.TagNumber(1)
  GachaOption get singleDraw => $_getN(0);
  @$pb.TagNumber(1)
  set singleDraw(GachaOption value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSingleDraw() => $_has(0);
  @$pb.TagNumber(1)
  void clearSingleDraw() => $_clearField(1);
  @$pb.TagNumber(1)
  GachaOption ensureSingleDraw() => $_ensure(0);

  @$pb.TagNumber(2)
  GachaOption get multiDraw => $_getN(1);
  @$pb.TagNumber(2)
  set multiDraw(GachaOption value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMultiDraw() => $_has(1);
  @$pb.TagNumber(2)
  void clearMultiDraw() => $_clearField(2);
  @$pb.TagNumber(2)
  GachaOption ensureMultiDraw() => $_ensure(1);
}

class PublishWantListingReq extends $pb.GeneratedMessage {
  factory PublishWantListingReq({
    $core.String? content,
  }) {
    final result = create();
    if (content != null) result.content = content;
    return result;
  }

  PublishWantListingReq._();

  factory PublishWantListingReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PublishWantListingReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PublishWantListingReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublishWantListingReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublishWantListingReq copyWith(
          void Function(PublishWantListingReq) updates) =>
      super.copyWith((message) => updates(message as PublishWantListingReq))
          as PublishWantListingReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublishWantListingReq create() => PublishWantListingReq._();
  @$core.override
  PublishWantListingReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PublishWantListingReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PublishWantListingReq>(create);
  static PublishWantListingReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);
}

class WantListingItem extends $pb.GeneratedMessage {
  factory WantListingItem({
    $fixnum.Int64? id,
    $fixnum.Int64? uid,
    $core.String? content,
    $fixnum.Int64? createTime,
    $0.User? userInfo,
    WantListingStatus? status,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (uid != null) result.uid = uid;
    if (content != null) result.content = content;
    if (createTime != null) result.createTime = createTime;
    if (userInfo != null) result.userInfo = userInfo;
    if (status != null) result.status = status;
    return result;
  }

  WantListingItem._();

  factory WantListingItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WantListingItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WantListingItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'uid')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..aInt64(4, _omitFieldNames ? '' : 'createTime')
    ..aOM<$0.User>(5, _omitFieldNames ? '' : 'userInfo',
        subBuilder: $0.User.create)
    ..aE<WantListingStatus>(6, _omitFieldNames ? '' : 'status',
        enumValues: WantListingStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WantListingItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WantListingItem copyWith(void Function(WantListingItem) updates) =>
      super.copyWith((message) => updates(message as WantListingItem))
          as WantListingItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WantListingItem create() => WantListingItem._();
  @$core.override
  WantListingItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WantListingItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WantListingItem>(create);
  static WantListingItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get createTime => $_getI64(3);
  @$pb.TagNumber(4)
  set createTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreateTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreateTime() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.User get userInfo => $_getN(4);
  @$pb.TagNumber(5)
  set userInfo($0.User value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasUserInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserInfo() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.User ensureUserInfo() => $_ensure(4);

  @$pb.TagNumber(6)
  WantListingStatus get status => $_getN(5);
  @$pb.TagNumber(6)
  set status(WantListingStatus value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);
}

class WantListingListRsp extends $pb.GeneratedMessage {
  factory WantListingListRsp({
    $core.Iterable<WantListingItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  WantListingListRsp._();

  factory WantListingListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WantListingListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WantListingListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..pPM<WantListingItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: WantListingItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WantListingListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WantListingListRsp copyWith(void Function(WantListingListRsp) updates) =>
      super.copyWith((message) => updates(message as WantListingListRsp))
          as WantListingListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WantListingListRsp create() => WantListingListRsp._();
  @$core.override
  WantListingListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WantListingListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WantListingListRsp>(create);
  static WantListingListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WantListingItem> get items => $_getList(0);
}

/// 播报列表响应
class BroadcastListRsp extends $pb.GeneratedMessage {
  factory BroadcastListRsp({
    $core.Iterable<BroadcastItem>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  BroadcastListRsp._();

  factory BroadcastListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BroadcastListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BroadcastListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..pPM<BroadcastItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: BroadcastItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastListRsp copyWith(void Function(BroadcastListRsp) updates) =>
      super.copyWith((message) => updates(message as BroadcastListRsp))
          as BroadcastListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastListRsp create() => BroadcastListRsp._();
  @$core.override
  BroadcastListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BroadcastListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastListRsp>(create);
  static BroadcastListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BroadcastItem> get list => $_getList(0);
}

/// 播报项
class BroadcastItem extends $pb.GeneratedMessage {
  factory BroadcastItem({
    $fixnum.Int64? id,
    $1.CommodityType? type,
    $core.String? name,
    $core.String? url,
    $core.int? period,
    $0.SimpleUser? userInfo,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (name != null) result.name = name;
    if (url != null) result.url = url;
    if (period != null) result.period = period;
    if (userInfo != null) result.userInfo = userInfo;
    return result;
  }

  BroadcastItem._();

  factory BroadcastItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BroadcastItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BroadcastItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.gacha'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aE<$1.CommodityType>(2, _omitFieldNames ? '' : 'type',
        enumValues: $1.CommodityType.values)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..aI(5, _omitFieldNames ? '' : 'period')
    ..aOM<$0.SimpleUser>(6, _omitFieldNames ? '' : 'userInfo',
        subBuilder: $0.SimpleUser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastItem copyWith(void Function(BroadcastItem) updates) =>
      super.copyWith((message) => updates(message as BroadcastItem))
          as BroadcastItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastItem create() => BroadcastItem._();
  @$core.override
  BroadcastItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BroadcastItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastItem>(create);
  static BroadcastItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $1.CommodityType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type($1.CommodityType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get period => $_getIZ(4);
  @$pb.TagNumber(5)
  set period($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPeriod() => $_has(4);
  @$pb.TagNumber(5)
  void clearPeriod() => $_clearField(5);

  @$pb.TagNumber(6)
  $0.SimpleUser get userInfo => $_getN(5);
  @$pb.TagNumber(6)
  set userInfo($0.SimpleUser value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasUserInfo() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserInfo() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.SimpleUser ensureUserInfo() => $_ensure(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

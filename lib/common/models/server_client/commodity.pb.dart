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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'commodity.pbenum.dart';
import 'rtc.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'commodity.pbenum.dart';

/// / 赠送物品的请求参数
class SendCommodityReq extends $pb.GeneratedMessage {
  factory SendCommodityReq({
    $core.Iterable<$fixnum.Int64>? receiverId,
    $fixnum.Int64? knapsackId,
    $core.int? count,
    $fixnum.Int64? channel,
    CommodityType? type,
  }) {
    final result = create();
    if (receiverId != null) result.receiverId.addAll(receiverId);
    if (knapsackId != null) result.knapsackId = knapsackId;
    if (count != null) result.count = count;
    if (channel != null) result.channel = channel;
    if (type != null) result.type = type;
    return result;
  }

  SendCommodityReq._();

  factory SendCommodityReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendCommodityReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendCommodityReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commodity'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'receiverId', $pb.PbFieldType.K6)
    ..aInt64(2, _omitFieldNames ? '' : 'knapsackId')
    ..aI(3, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(4, _omitFieldNames ? '' : 'channel')
    ..aE<CommodityType>(5, _omitFieldNames ? '' : 'type',
        enumValues: CommodityType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendCommodityReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendCommodityReq copyWith(void Function(SendCommodityReq) updates) =>
      super.copyWith((message) => updates(message as SendCommodityReq))
          as SendCommodityReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendCommodityReq create() => SendCommodityReq._();
  @$core.override
  SendCommodityReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendCommodityReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendCommodityReq>(create);
  static SendCommodityReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get receiverId => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get knapsackId => $_getI64(1);
  @$pb.TagNumber(2)
  set knapsackId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasKnapsackId() => $_has(1);
  @$pb.TagNumber(2)
  void clearKnapsackId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get channel => $_getI64(3);
  @$pb.TagNumber(4)
  set channel($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChannel() => $_has(3);
  @$pb.TagNumber(4)
  void clearChannel() => $_clearField(4);

  @$pb.TagNumber(5)
  CommodityType get type => $_getN(4);
  @$pb.TagNumber(5)
  set type(CommodityType value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => $_clearField(5);
}

/// 物品列表
class CommodityListResp extends $pb.GeneratedMessage {
  factory CommodityListResp({
    $core.Iterable<CommodityItem>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  CommodityListResp._();

  factory CommodityListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommodityListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommodityListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commodity'),
      createEmptyInstance: create)
    ..pPM<CommodityItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: CommodityItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommodityListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommodityListResp copyWith(void Function(CommodityListResp) updates) =>
      super.copyWith((message) => updates(message as CommodityListResp))
          as CommodityListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommodityListResp create() => CommodityListResp._();
  @$core.override
  CommodityListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommodityListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommodityListResp>(create);
  static CommodityListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CommodityItem> get list => $_getList(0);
}

/// 物品item
class CommodityItem extends $pb.GeneratedMessage {
  factory CommodityItem({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? url,
    CommodityType? type,
    CommodityState? state,
    $core.int? num,
    $core.int? expiredTime,
    $core.int? validityPeriod,
    $core.bool? canSend,
    $core.String? actionName,
    $core.String? colors,
    $fixnum.Int64? price,
    $core.int? level,
    $core.int? subType,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (url != null) result.url = url;
    if (type != null) result.type = type;
    if (state != null) result.state = state;
    if (num != null) result.num = num;
    if (expiredTime != null) result.expiredTime = expiredTime;
    if (validityPeriod != null) result.validityPeriod = validityPeriod;
    if (canSend != null) result.canSend = canSend;
    if (actionName != null) result.actionName = actionName;
    if (colors != null) result.colors = colors;
    if (price != null) result.price = price;
    if (level != null) result.level = level;
    if (subType != null) result.subType = subType;
    return result;
  }

  CommodityItem._();

  factory CommodityItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommodityItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommodityItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commodity'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..aE<CommodityType>(4, _omitFieldNames ? '' : 'type',
        enumValues: CommodityType.values)
    ..aE<CommodityState>(5, _omitFieldNames ? '' : 'state',
        enumValues: CommodityState.values)
    ..aI(6, _omitFieldNames ? '' : 'num', fieldType: $pb.PbFieldType.OU3)
    ..aI(7, _omitFieldNames ? '' : 'expiredTime',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(8, _omitFieldNames ? '' : 'validityPeriod',
        fieldType: $pb.PbFieldType.OU3)
    ..aOB(9, _omitFieldNames ? '' : 'canSend')
    ..aOS(10, _omitFieldNames ? '' : 'actionName')
    ..aOS(11, _omitFieldNames ? '' : 'colors')
    ..aInt64(12, _omitFieldNames ? '' : 'price')
    ..aI(13, _omitFieldNames ? '' : 'level')
    ..aI(14, _omitFieldNames ? '' : 'subType', protoName: 'subType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommodityItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommodityItem copyWith(void Function(CommodityItem) updates) =>
      super.copyWith((message) => updates(message as CommodityItem))
          as CommodityItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommodityItem create() => CommodityItem._();
  @$core.override
  CommodityItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommodityItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommodityItem>(create);
  static CommodityItem? _defaultInstance;

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
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  CommodityType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(CommodityType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);

  @$pb.TagNumber(5)
  CommodityState get state => $_getN(4);
  @$pb.TagNumber(5)
  set state(CommodityState value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get num => $_getIZ(5);
  @$pb.TagNumber(6)
  set num($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearNum() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get expiredTime => $_getIZ(6);
  @$pb.TagNumber(7)
  set expiredTime($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasExpiredTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearExpiredTime() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get validityPeriod => $_getIZ(7);
  @$pb.TagNumber(8)
  set validityPeriod($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasValidityPeriod() => $_has(7);
  @$pb.TagNumber(8)
  void clearValidityPeriod() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get canSend => $_getBF(8);
  @$pb.TagNumber(9)
  set canSend($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCanSend() => $_has(8);
  @$pb.TagNumber(9)
  void clearCanSend() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get actionName => $_getSZ(9);
  @$pb.TagNumber(10)
  set actionName($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasActionName() => $_has(9);
  @$pb.TagNumber(10)
  void clearActionName() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get colors => $_getSZ(10);
  @$pb.TagNumber(11)
  set colors($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasColors() => $_has(10);
  @$pb.TagNumber(11)
  void clearColors() => $_clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get price => $_getI64(11);
  @$pb.TagNumber(12)
  set price($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(12)
  $core.bool hasPrice() => $_has(11);
  @$pb.TagNumber(12)
  void clearPrice() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get level => $_getIZ(12);
  @$pb.TagNumber(13)
  set level($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasLevel() => $_has(12);
  @$pb.TagNumber(13)
  void clearLevel() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.int get subType => $_getIZ(13);
  @$pb.TagNumber(14)
  set subType($core.int value) => $_setSignedInt32(13, value);
  @$pb.TagNumber(14)
  $core.bool hasSubType() => $_has(13);
  @$pb.TagNumber(14)
  void clearSubType() => $_clearField(14);
}

/// 物品tab列表
class CommodityTabListResp extends $pb.GeneratedMessage {
  factory CommodityTabListResp({
    CommodityTab? selected,
    $core.Iterable<CommodityTab>? list,
  }) {
    final result = create();
    if (selected != null) result.selected = selected;
    if (list != null) result.list.addAll(list);
    return result;
  }

  CommodityTabListResp._();

  factory CommodityTabListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommodityTabListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommodityTabListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commodity'),
      createEmptyInstance: create)
    ..aOM<CommodityTab>(1, _omitFieldNames ? '' : 'selected',
        subBuilder: CommodityTab.create)
    ..pPM<CommodityTab>(2, _omitFieldNames ? '' : 'list',
        subBuilder: CommodityTab.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommodityTabListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommodityTabListResp copyWith(void Function(CommodityTabListResp) updates) =>
      super.copyWith((message) => updates(message as CommodityTabListResp))
          as CommodityTabListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommodityTabListResp create() => CommodityTabListResp._();
  @$core.override
  CommodityTabListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommodityTabListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommodityTabListResp>(create);
  static CommodityTabListResp? _defaultInstance;

  @$pb.TagNumber(1)
  CommodityTab get selected => $_getN(0);
  @$pb.TagNumber(1)
  set selected(CommodityTab value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSelected() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelected() => $_clearField(1);
  @$pb.TagNumber(1)
  CommodityTab ensureSelected() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<CommodityTab> get list => $_getList(1);
}

/// 物品tab
class CommodityTab extends $pb.GeneratedMessage {
  factory CommodityTab({
    $core.int? id,
    $core.String? name,
    CommodityType? type,
    $core.Iterable<ForgeConfig>? levelConfig,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    if (levelConfig != null) result.levelConfig.addAll(levelConfig);
    return result;
  }

  CommodityTab._();

  factory CommodityTab.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommodityTab.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommodityTab',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commodity'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id', fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aE<CommodityType>(3, _omitFieldNames ? '' : 'type',
        enumValues: CommodityType.values)
    ..pPM<ForgeConfig>(4, _omitFieldNames ? '' : 'levelConfig',
        subBuilder: ForgeConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommodityTab clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommodityTab copyWith(void Function(CommodityTab) updates) =>
      super.copyWith((message) => updates(message as CommodityTab))
          as CommodityTab;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommodityTab create() => CommodityTab._();
  @$core.override
  CommodityTab createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommodityTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommodityTab>(create);
  static CommodityTab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
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
  CommodityType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(CommodityType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<ForgeConfig> get levelConfig => $_getList(3);
}

class ForgeConfig extends $pb.GeneratedMessage {
  factory ForgeConfig({
    $core.int? level,
    $core.Iterable<ForgeSuccessRate>? successRate,
    $core.int? cost,
  }) {
    final result = create();
    if (level != null) result.level = level;
    if (successRate != null) result.successRate.addAll(successRate);
    if (cost != null) result.cost = cost;
    return result;
  }

  ForgeConfig._();

  factory ForgeConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ForgeConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ForgeConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commodity'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'level')
    ..pPM<ForgeSuccessRate>(2, _omitFieldNames ? '' : 'successRate',
        subBuilder: ForgeSuccessRate.create)
    ..aI(3, _omitFieldNames ? '' : 'cost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeConfig copyWith(void Function(ForgeConfig) updates) =>
      super.copyWith((message) => updates(message as ForgeConfig))
          as ForgeConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForgeConfig create() => ForgeConfig._();
  @$core.override
  ForgeConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ForgeConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ForgeConfig>(create);
  static ForgeConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<ForgeSuccessRate> get successRate => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get cost => $_getIZ(2);
  @$pb.TagNumber(3)
  set cost($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCost() => $_has(2);
  @$pb.TagNumber(3)
  void clearCost() => $_clearField(3);
}

class ForgeSuccessRate extends $pb.GeneratedMessage {
  factory ForgeSuccessRate({
    $core.int? count,
    $core.int? successRate,
  }) {
    final result = create();
    if (count != null) result.count = count;
    if (successRate != null) result.successRate = successRate;
    return result;
  }

  ForgeSuccessRate._();

  factory ForgeSuccessRate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ForgeSuccessRate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ForgeSuccessRate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commodity'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count')
    ..aI(2, _omitFieldNames ? '' : 'successRate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeSuccessRate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeSuccessRate copyWith(void Function(ForgeSuccessRate) updates) =>
      super.copyWith((message) => updates(message as ForgeSuccessRate))
          as ForgeSuccessRate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForgeSuccessRate create() => ForgeSuccessRate._();
  @$core.override
  ForgeSuccessRate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ForgeSuccessRate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ForgeSuccessRate>(create);
  static ForgeSuccessRate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get successRate => $_getIZ(1);
  @$pb.TagNumber(2)
  set successRate($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSuccessRate() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessRate() => $_clearField(2);
}

/// 赠送物品的消息
class MsgGiveCommodity extends $pb.GeneratedMessage {
  factory MsgGiveCommodity({
    CommodityItem? item,
    $core.int? count,
    $fixnum.Int64? channelId,
    $0.SimpleChannelUser? sender,
    $core.Iterable<$0.SimpleChannelUser>? receivers,
  }) {
    final result = create();
    if (item != null) result.item = item;
    if (count != null) result.count = count;
    if (channelId != null) result.channelId = channelId;
    if (sender != null) result.sender = sender;
    if (receivers != null) result.receivers.addAll(receivers);
    return result;
  }

  MsgGiveCommodity._();

  factory MsgGiveCommodity.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MsgGiveCommodity.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MsgGiveCommodity',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commodity'),
      createEmptyInstance: create)
    ..aOM<CommodityItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: CommodityItem.create)
    ..aI(2, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.SimpleChannelUser>(4, _omitFieldNames ? '' : 'sender',
        subBuilder: $0.SimpleChannelUser.create)
    ..pPM<$0.SimpleChannelUser>(5, _omitFieldNames ? '' : 'receivers',
        subBuilder: $0.SimpleChannelUser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MsgGiveCommodity clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MsgGiveCommodity copyWith(void Function(MsgGiveCommodity) updates) =>
      super.copyWith((message) => updates(message as MsgGiveCommodity))
          as MsgGiveCommodity;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MsgGiveCommodity create() => MsgGiveCommodity._();
  @$core.override
  MsgGiveCommodity createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MsgGiveCommodity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MsgGiveCommodity>(create);
  static MsgGiveCommodity? _defaultInstance;

  @$pb.TagNumber(1)
  CommodityItem get item => $_getN(0);
  @$pb.TagNumber(1)
  set item(CommodityItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearItem() => $_clearField(1);
  @$pb.TagNumber(1)
  CommodityItem ensureItem() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get channelId => $_getI64(2);
  @$pb.TagNumber(3)
  set channelId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChannelId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannelId() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.SimpleChannelUser get sender => $_getN(3);
  @$pb.TagNumber(4)
  set sender($0.SimpleChannelUser value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasSender() => $_has(3);
  @$pb.TagNumber(4)
  void clearSender() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.SimpleChannelUser ensureSender() => $_ensure(3);

  @$pb.TagNumber(5)
  $pb.PbList<$0.SimpleChannelUser> get receivers => $_getList(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

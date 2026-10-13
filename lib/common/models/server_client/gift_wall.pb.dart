// This is a generated file - do not edit.
//
// Generated from server_client/gift_wall.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GiftWallListRsp extends $pb.GeneratedMessage {
  factory GiftWallListRsp({
    $core.Iterable<$0.GiftItem>? itemList,
    GiftWallLevel? levelInfo,
  }) {
    final result = create();
    if (itemList != null) result.itemList.addAll(itemList);
    if (levelInfo != null) result.levelInfo = levelInfo;
    return result;
  }

  GiftWallListRsp._();

  factory GiftWallListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GiftWallListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GiftWallListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gift_wall'),
      createEmptyInstance: create)
    ..pPM<$0.GiftItem>(1, _omitFieldNames ? '' : 'itemList',
        subBuilder: $0.GiftItem.create)
    ..aOM<GiftWallLevel>(2, _omitFieldNames ? '' : 'levelInfo',
        subBuilder: GiftWallLevel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftWallListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftWallListRsp copyWith(void Function(GiftWallListRsp) updates) =>
      super.copyWith((message) => updates(message as GiftWallListRsp))
          as GiftWallListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GiftWallListRsp create() => GiftWallListRsp._();
  @$core.override
  GiftWallListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GiftWallListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallListRsp>(create);
  static GiftWallListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.GiftItem> get itemList => $_getList(0);

  @$pb.TagNumber(2)
  GiftWallLevel get levelInfo => $_getN(1);
  @$pb.TagNumber(2)
  set levelInfo(GiftWallLevel value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLevelInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevelInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  GiftWallLevel ensureLevelInfo() => $_ensure(1);
}

class GiftWallLevel extends $pb.GeneratedMessage {
  factory GiftWallLevel({
    $core.int? level,
    $core.String? levelName,
    $core.int? status,
    $fixnum.Int64? totalGift,
    $fixnum.Int64? receiveGift,
    $fixnum.Int64? totalCard,
    $fixnum.Int64? unlockCard,
    $fixnum.Int64? totalEvent,
    $fixnum.Int64? finEvent,
    $fixnum.Int64? upgradeLevelExp,
    $fixnum.Int64? currentLevelTotal,
  }) {
    final result = create();
    if (level != null) result.level = level;
    if (levelName != null) result.levelName = levelName;
    if (status != null) result.status = status;
    if (totalGift != null) result.totalGift = totalGift;
    if (receiveGift != null) result.receiveGift = receiveGift;
    if (totalCard != null) result.totalCard = totalCard;
    if (unlockCard != null) result.unlockCard = unlockCard;
    if (totalEvent != null) result.totalEvent = totalEvent;
    if (finEvent != null) result.finEvent = finEvent;
    if (upgradeLevelExp != null) result.upgradeLevelExp = upgradeLevelExp;
    if (currentLevelTotal != null) result.currentLevelTotal = currentLevelTotal;
    return result;
  }

  GiftWallLevel._();

  factory GiftWallLevel.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GiftWallLevel.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GiftWallLevel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gift_wall'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'level')
    ..aOS(2, _omitFieldNames ? '' : 'levelName')
    ..aI(3, _omitFieldNames ? '' : 'status')
    ..aInt64(4, _omitFieldNames ? '' : 'totalGift')
    ..aInt64(5, _omitFieldNames ? '' : 'receiveGift')
    ..aInt64(6, _omitFieldNames ? '' : 'totalCard')
    ..aInt64(7, _omitFieldNames ? '' : 'unlockCard')
    ..aInt64(8, _omitFieldNames ? '' : 'totalEvent')
    ..aInt64(9, _omitFieldNames ? '' : 'finEvent')
    ..aInt64(10, _omitFieldNames ? '' : 'upgradeLevelExp')
    ..aInt64(11, _omitFieldNames ? '' : 'currentLevelTotal')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftWallLevel clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftWallLevel copyWith(void Function(GiftWallLevel) updates) =>
      super.copyWith((message) => updates(message as GiftWallLevel))
          as GiftWallLevel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GiftWallLevel create() => GiftWallLevel._();
  @$core.override
  GiftWallLevel createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GiftWallLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallLevel>(create);
  static GiftWallLevel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get levelName => $_getSZ(1);
  @$pb.TagNumber(2)
  set levelName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLevelName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevelName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get status => $_getIZ(2);
  @$pb.TagNumber(3)
  set status($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalGift => $_getI64(3);
  @$pb.TagNumber(4)
  set totalGift($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalGift() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalGift() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get receiveGift => $_getI64(4);
  @$pb.TagNumber(5)
  set receiveGift($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReceiveGift() => $_has(4);
  @$pb.TagNumber(5)
  void clearReceiveGift() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get totalCard => $_getI64(5);
  @$pb.TagNumber(6)
  set totalCard($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotalCard() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalCard() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get unlockCard => $_getI64(6);
  @$pb.TagNumber(7)
  set unlockCard($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUnlockCard() => $_has(6);
  @$pb.TagNumber(7)
  void clearUnlockCard() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get totalEvent => $_getI64(7);
  @$pb.TagNumber(8)
  set totalEvent($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTotalEvent() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalEvent() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get finEvent => $_getI64(8);
  @$pb.TagNumber(9)
  set finEvent($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasFinEvent() => $_has(8);
  @$pb.TagNumber(9)
  void clearFinEvent() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get upgradeLevelExp => $_getI64(9);
  @$pb.TagNumber(10)
  set upgradeLevelExp($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasUpgradeLevelExp() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpgradeLevelExp() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get currentLevelTotal => $_getI64(10);
  @$pb.TagNumber(11)
  set currentLevelTotal($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCurrentLevelTotal() => $_has(10);
  @$pb.TagNumber(11)
  void clearCurrentLevelTotal() => $_clearField(11);
}

class GiftWallDetailRsp extends $pb.GeneratedMessage {
  factory GiftWallDetailRsp({
    $core.Iterable<GiftWallLevel>? levelInfo,
    $core.Iterable<$0.GiftItem>? itemList,
    $core.Iterable<CardInfo>? cardList,
  }) {
    final result = create();
    if (levelInfo != null) result.levelInfo.addAll(levelInfo);
    if (itemList != null) result.itemList.addAll(itemList);
    if (cardList != null) result.cardList.addAll(cardList);
    return result;
  }

  GiftWallDetailRsp._();

  factory GiftWallDetailRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GiftWallDetailRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GiftWallDetailRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gift_wall'),
      createEmptyInstance: create)
    ..pPM<GiftWallLevel>(1, _omitFieldNames ? '' : 'levelInfo',
        subBuilder: GiftWallLevel.create)
    ..pPM<$0.GiftItem>(2, _omitFieldNames ? '' : 'itemList',
        subBuilder: $0.GiftItem.create)
    ..pPM<CardInfo>(3, _omitFieldNames ? '' : 'cardList',
        subBuilder: CardInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftWallDetailRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftWallDetailRsp copyWith(void Function(GiftWallDetailRsp) updates) =>
      super.copyWith((message) => updates(message as GiftWallDetailRsp))
          as GiftWallDetailRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GiftWallDetailRsp create() => GiftWallDetailRsp._();
  @$core.override
  GiftWallDetailRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GiftWallDetailRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallDetailRsp>(create);
  static GiftWallDetailRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GiftWallLevel> get levelInfo => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$0.GiftItem> get itemList => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<CardInfo> get cardList => $_getList(2);
}

class CardInfo extends $pb.GeneratedMessage {
  factory CardInfo({
    $fixnum.Int64? id,
    $core.String? name,
    $core.int? level,
    $core.String? icon,
    $core.bool? canActive,
    $fixnum.Int64? totalCollectionNum,
    $fixnum.Int64? gainedNum,
    $core.String? dynamicResource,
    $core.int? gainExp,
    $core.Iterable<$0.GiftItem>? giftList,
    $fixnum.Int64? commodityId,
    $fixnum.Int64? commodityKnapsackId,
    $core.bool? isUsed,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (level != null) result.level = level;
    if (icon != null) result.icon = icon;
    if (canActive != null) result.canActive = canActive;
    if (totalCollectionNum != null)
      result.totalCollectionNum = totalCollectionNum;
    if (gainedNum != null) result.gainedNum = gainedNum;
    if (dynamicResource != null) result.dynamicResource = dynamicResource;
    if (gainExp != null) result.gainExp = gainExp;
    if (giftList != null) result.giftList.addAll(giftList);
    if (commodityId != null) result.commodityId = commodityId;
    if (commodityKnapsackId != null)
      result.commodityKnapsackId = commodityKnapsackId;
    if (isUsed != null) result.isUsed = isUsed;
    return result;
  }

  CardInfo._();

  factory CardInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CardInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CardInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gift_wall'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aI(3, _omitFieldNames ? '' : 'level')
    ..aOS(4, _omitFieldNames ? '' : 'icon')
    ..aOB(5, _omitFieldNames ? '' : 'canActive')
    ..aInt64(6, _omitFieldNames ? '' : 'totalCollectionNum')
    ..aInt64(7, _omitFieldNames ? '' : 'gainedNum')
    ..aOS(8, _omitFieldNames ? '' : 'dynamicResource')
    ..aI(9, _omitFieldNames ? '' : 'gainExp')
    ..pPM<$0.GiftItem>(10, _omitFieldNames ? '' : 'giftList',
        subBuilder: $0.GiftItem.create)
    ..aInt64(11, _omitFieldNames ? '' : 'commodityId')
    ..aInt64(12, _omitFieldNames ? '' : 'commodityKnapsackId')
    ..aOB(13, _omitFieldNames ? '' : 'isUsed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CardInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CardInfo copyWith(void Function(CardInfo) updates) =>
      super.copyWith((message) => updates(message as CardInfo)) as CardInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CardInfo create() => CardInfo._();
  @$core.override
  CardInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CardInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CardInfo>(create);
  static CardInfo? _defaultInstance;

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
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get canActive => $_getBF(4);
  @$pb.TagNumber(5)
  set canActive($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCanActive() => $_has(4);
  @$pb.TagNumber(5)
  void clearCanActive() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get totalCollectionNum => $_getI64(5);
  @$pb.TagNumber(6)
  set totalCollectionNum($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotalCollectionNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalCollectionNum() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get gainedNum => $_getI64(6);
  @$pb.TagNumber(7)
  set gainedNum($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasGainedNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearGainedNum() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get dynamicResource => $_getSZ(7);
  @$pb.TagNumber(8)
  set dynamicResource($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDynamicResource() => $_has(7);
  @$pb.TagNumber(8)
  void clearDynamicResource() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get gainExp => $_getIZ(8);
  @$pb.TagNumber(9)
  set gainExp($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasGainExp() => $_has(8);
  @$pb.TagNumber(9)
  void clearGainExp() => $_clearField(9);

  @$pb.TagNumber(10)
  $pb.PbList<$0.GiftItem> get giftList => $_getList(9);

  @$pb.TagNumber(11)
  $fixnum.Int64 get commodityId => $_getI64(10);
  @$pb.TagNumber(11)
  set commodityId($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCommodityId() => $_has(10);
  @$pb.TagNumber(11)
  void clearCommodityId() => $_clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get commodityKnapsackId => $_getI64(11);
  @$pb.TagNumber(12)
  set commodityKnapsackId($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(12)
  $core.bool hasCommodityKnapsackId() => $_has(11);
  @$pb.TagNumber(12)
  void clearCommodityKnapsackId() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.bool get isUsed => $_getBF(12);
  @$pb.TagNumber(13)
  set isUsed($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(13)
  $core.bool hasIsUsed() => $_has(12);
  @$pb.TagNumber(13)
  void clearIsUsed() => $_clearField(13);
}

class GiftShowConfigRsp extends $pb.GeneratedMessage {
  factory GiftShowConfigRsp({
    $core.Iterable<$0.GiftItem>? showcaseList,
    $core.Iterable<$0.GiftItem>? vaultList,
  }) {
    final result = create();
    if (showcaseList != null) result.showcaseList.addAll(showcaseList);
    if (vaultList != null) result.vaultList.addAll(vaultList);
    return result;
  }

  GiftShowConfigRsp._();

  factory GiftShowConfigRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GiftShowConfigRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GiftShowConfigRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gift_wall'),
      createEmptyInstance: create)
    ..pPM<$0.GiftItem>(1, _omitFieldNames ? '' : 'showcaseList',
        subBuilder: $0.GiftItem.create)
    ..pPM<$0.GiftItem>(2, _omitFieldNames ? '' : 'vaultList',
        subBuilder: $0.GiftItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftShowConfigRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftShowConfigRsp copyWith(void Function(GiftShowConfigRsp) updates) =>
      super.copyWith((message) => updates(message as GiftShowConfigRsp))
          as GiftShowConfigRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GiftShowConfigRsp create() => GiftShowConfigRsp._();
  @$core.override
  GiftShowConfigRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GiftShowConfigRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftShowConfigRsp>(create);
  static GiftShowConfigRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.GiftItem> get showcaseList => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$0.GiftItem> get vaultList => $_getList(1);
}

class GiftShowConfigReq extends $pb.GeneratedMessage {
  factory GiftShowConfigReq({
    $core.Iterable<$fixnum.Int64>? itemId,
  }) {
    final result = create();
    if (itemId != null) result.itemId.addAll(itemId);
    return result;
  }

  GiftShowConfigReq._();

  factory GiftShowConfigReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GiftShowConfigReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GiftShowConfigReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gift_wall'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : 'itemId', $pb.PbFieldType.K6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftShowConfigReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftShowConfigReq copyWith(void Function(GiftShowConfigReq) updates) =>
      super.copyWith((message) => updates(message as GiftShowConfigReq))
          as GiftShowConfigReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GiftShowConfigReq create() => GiftShowConfigReq._();
  @$core.override
  GiftShowConfigReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GiftShowConfigReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftShowConfigReq>(create);
  static GiftShowConfigReq? _defaultInstance;

  @$pb.TagNumber(2)
  $pb.PbList<$fixnum.Int64> get itemId => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

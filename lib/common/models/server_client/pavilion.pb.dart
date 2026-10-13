// This is a generated file - do not edit.
//
// Generated from server_client/pavilion.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'commodity.pb.dart' as $1;
import 'user.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 展馆首页
class PavilionInfoData extends $pb.GeneratedMessage {
  factory PavilionInfoData({
    $0.User? owner,
    $core.bool? isOwner,
    $core.int? level,
    $core.String? levelName,
    $fixnum.Int64? exp,
    $fixnum.Int64? levelExp,
    $fixnum.Int64? points,
    $core.bool? rewardRedDot,
    $core.bool? needGuide,
    $core.String? backgroundResource,
    $core.String? expBackground,
    $core.String? slotBackground,
  }) {
    final result = create();
    if (owner != null) result.owner = owner;
    if (isOwner != null) result.isOwner = isOwner;
    if (level != null) result.level = level;
    if (levelName != null) result.levelName = levelName;
    if (exp != null) result.exp = exp;
    if (levelExp != null) result.levelExp = levelExp;
    if (points != null) result.points = points;
    if (rewardRedDot != null) result.rewardRedDot = rewardRedDot;
    if (needGuide != null) result.needGuide = needGuide;
    if (backgroundResource != null)
      result.backgroundResource = backgroundResource;
    if (expBackground != null) result.expBackground = expBackground;
    if (slotBackground != null) result.slotBackground = slotBackground;
    return result;
  }

  PavilionInfoData._();

  factory PavilionInfoData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionInfoData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionInfoData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aOM<$0.User>(1, _omitFieldNames ? '' : 'owner',
        subBuilder: $0.User.create)
    ..aOB(2, _omitFieldNames ? '' : 'isOwner')
    ..aI(3, _omitFieldNames ? '' : 'level')
    ..aOS(4, _omitFieldNames ? '' : 'levelName')
    ..aInt64(5, _omitFieldNames ? '' : 'exp')
    ..aInt64(6, _omitFieldNames ? '' : 'levelExp')
    ..aInt64(7, _omitFieldNames ? '' : 'points')
    ..aOB(8, _omitFieldNames ? '' : 'rewardRedDot')
    ..aOB(9, _omitFieldNames ? '' : 'needGuide')
    ..aOS(10, _omitFieldNames ? '' : 'backgroundResource')
    ..aOS(11, _omitFieldNames ? '' : 'expBackground')
    ..aOS(12, _omitFieldNames ? '' : 'slotBackground')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionInfoData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionInfoData copyWith(void Function(PavilionInfoData) updates) =>
      super.copyWith((message) => updates(message as PavilionInfoData))
          as PavilionInfoData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionInfoData create() => PavilionInfoData._();
  @$core.override
  PavilionInfoData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionInfoData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionInfoData>(create);
  static PavilionInfoData? _defaultInstance;

  @$pb.TagNumber(1)
  $0.User get owner => $_getN(0);
  @$pb.TagNumber(1)
  set owner($0.User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOwner() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwner() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.User ensureOwner() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get isOwner => $_getBF(1);
  @$pb.TagNumber(2)
  set isOwner($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsOwner() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsOwner() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get levelName => $_getSZ(3);
  @$pb.TagNumber(4)
  set levelName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLevelName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevelName() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get exp => $_getI64(4);
  @$pb.TagNumber(5)
  set exp($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExp() => $_has(4);
  @$pb.TagNumber(5)
  void clearExp() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get levelExp => $_getI64(5);
  @$pb.TagNumber(6)
  set levelExp($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLevelExp() => $_has(5);
  @$pb.TagNumber(6)
  void clearLevelExp() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get points => $_getI64(6);
  @$pb.TagNumber(7)
  set points($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPoints() => $_has(6);
  @$pb.TagNumber(7)
  void clearPoints() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get rewardRedDot => $_getBF(7);
  @$pb.TagNumber(8)
  set rewardRedDot($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRewardRedDot() => $_has(7);
  @$pb.TagNumber(8)
  void clearRewardRedDot() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get needGuide => $_getBF(8);
  @$pb.TagNumber(9)
  set needGuide($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasNeedGuide() => $_has(8);
  @$pb.TagNumber(9)
  void clearNeedGuide() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get backgroundResource => $_getSZ(9);
  @$pb.TagNumber(10)
  set backgroundResource($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasBackgroundResource() => $_has(9);
  @$pb.TagNumber(10)
  void clearBackgroundResource() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get expBackground => $_getSZ(10);
  @$pb.TagNumber(11)
  set expBackground($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasExpBackground() => $_has(10);
  @$pb.TagNumber(11)
  void clearExpBackground() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get slotBackground => $_getSZ(11);
  @$pb.TagNumber(12)
  set slotBackground($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasSlotBackground() => $_has(11);
  @$pb.TagNumber(12)
  void clearSlotBackground() => $_clearField(12);
}

/// 展位列表
class PavilionSlotListData extends $pb.GeneratedMessage {
  factory PavilionSlotListData({
    $core.String? type,
    $core.Iterable<PavilionSlotView>? slots,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (slots != null) result.slots.addAll(slots);
    return result;
  }

  PavilionSlotListData._();

  factory PavilionSlotListData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionSlotListData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionSlotListData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..pPM<PavilionSlotView>(2, _omitFieldNames ? '' : 'slots',
        subBuilder: PavilionSlotView.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSlotListData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSlotListData copyWith(void Function(PavilionSlotListData) updates) =>
      super.copyWith((message) => updates(message as PavilionSlotListData))
          as PavilionSlotListData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionSlotListData create() => PavilionSlotListData._();
  @$core.override
  PavilionSlotListData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionSlotListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionSlotListData>(create);
  static PavilionSlotListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<PavilionSlotView> get slots => $_getList(1);
}

class PavilionSlotView extends $pb.GeneratedMessage {
  factory PavilionSlotView({
    $fixnum.Int64? slotId,
    $core.bool? unlocked,
    $core.int? unlockLevel,
    $1.CommodityItem? item,
    $core.String? decorResource,
  }) {
    final result = create();
    if (slotId != null) result.slotId = slotId;
    if (unlocked != null) result.unlocked = unlocked;
    if (unlockLevel != null) result.unlockLevel = unlockLevel;
    if (item != null) result.item = item;
    if (decorResource != null) result.decorResource = decorResource;
    return result;
  }

  PavilionSlotView._();

  factory PavilionSlotView.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionSlotView.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionSlotView',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'slotId')
    ..aOB(2, _omitFieldNames ? '' : 'unlocked')
    ..aI(3, _omitFieldNames ? '' : 'unlockLevel')
    ..aOM<$1.CommodityItem>(4, _omitFieldNames ? '' : 'item',
        subBuilder: $1.CommodityItem.create)
    ..aOS(5, _omitFieldNames ? '' : 'decorResource')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSlotView clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSlotView copyWith(void Function(PavilionSlotView) updates) =>
      super.copyWith((message) => updates(message as PavilionSlotView))
          as PavilionSlotView;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionSlotView create() => PavilionSlotView._();
  @$core.override
  PavilionSlotView createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionSlotView getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionSlotView>(create);
  static PavilionSlotView? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get slotId => $_getI64(0);
  @$pb.TagNumber(1)
  set slotId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSlotId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlotId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get unlocked => $_getBF(1);
  @$pb.TagNumber(2)
  set unlocked($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUnlocked() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnlocked() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get unlockLevel => $_getIZ(2);
  @$pb.TagNumber(3)
  set unlockLevel($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUnlockLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnlockLevel() => $_clearField(3);

  @$pb.TagNumber(4)
  $1.CommodityItem get item => $_getN(3);
  @$pb.TagNumber(4)
  set item($1.CommodityItem value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasItem() => $_has(3);
  @$pb.TagNumber(4)
  void clearItem() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.CommodityItem ensureItem() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get decorResource => $_getSZ(4);
  @$pb.TagNumber(5)
  set decorResource($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDecorResource() => $_has(4);
  @$pb.TagNumber(5)
  void clearDecorResource() => $_clearField(5);
}

/// 对外展示：资料卡 / 麦位预览，固定车 1 + 普通 3
class PavilionSlotShowData extends $pb.GeneratedMessage {
  factory PavilionSlotShowData({
    $core.Iterable<PavilionSlotView>? carList,
    $core.Iterable<PavilionSlotView>? normalList,
  }) {
    final result = create();
    if (carList != null) result.carList.addAll(carList);
    if (normalList != null) result.normalList.addAll(normalList);
    return result;
  }

  PavilionSlotShowData._();

  factory PavilionSlotShowData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionSlotShowData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionSlotShowData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..pPM<PavilionSlotView>(1, _omitFieldNames ? '' : 'carList',
        subBuilder: PavilionSlotView.create)
    ..pPM<PavilionSlotView>(2, _omitFieldNames ? '' : 'normalList',
        subBuilder: PavilionSlotView.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSlotShowData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSlotShowData copyWith(void Function(PavilionSlotShowData) updates) =>
      super.copyWith((message) => updates(message as PavilionSlotShowData))
          as PavilionSlotShowData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionSlotShowData create() => PavilionSlotShowData._();
  @$core.override
  PavilionSlotShowData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionSlotShowData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionSlotShowData>(create);
  static PavilionSlotShowData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PavilionSlotView> get carList => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<PavilionSlotView> get normalList => $_getList(1);
}

/// 收藏页（Items / Sets 一次返回，页头统计从列表派生）
class PavilionCollectionInfo extends $pb.GeneratedMessage {
  factory PavilionCollectionInfo({
    $0.User? owner,
    $core.int? itemCount,
    $core.int? seriesCount,
    $core.int? progress,
    $core.int? readyToCollect,
    $core.Iterable<PavilionItem>? items,
    $core.Iterable<PavilionSeriesCard>? seriesCards,
  }) {
    final result = create();
    if (owner != null) result.owner = owner;
    if (itemCount != null) result.itemCount = itemCount;
    if (seriesCount != null) result.seriesCount = seriesCount;
    if (progress != null) result.progress = progress;
    if (readyToCollect != null) result.readyToCollect = readyToCollect;
    if (items != null) result.items.addAll(items);
    if (seriesCards != null) result.seriesCards.addAll(seriesCards);
    return result;
  }

  PavilionCollectionInfo._();

  factory PavilionCollectionInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionCollectionInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionCollectionInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aOM<$0.User>(1, _omitFieldNames ? '' : 'owner',
        subBuilder: $0.User.create)
    ..aI(2, _omitFieldNames ? '' : 'itemCount')
    ..aI(3, _omitFieldNames ? '' : 'seriesCount')
    ..aI(4, _omitFieldNames ? '' : 'progress')
    ..aI(5, _omitFieldNames ? '' : 'readyToCollect')
    ..pPM<PavilionItem>(6, _omitFieldNames ? '' : 'items',
        subBuilder: PavilionItem.create)
    ..pPM<PavilionSeriesCard>(7, _omitFieldNames ? '' : 'seriesCards',
        subBuilder: PavilionSeriesCard.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionCollectionInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionCollectionInfo copyWith(
          void Function(PavilionCollectionInfo) updates) =>
      super.copyWith((message) => updates(message as PavilionCollectionInfo))
          as PavilionCollectionInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionCollectionInfo create() => PavilionCollectionInfo._();
  @$core.override
  PavilionCollectionInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionCollectionInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionCollectionInfo>(create);
  static PavilionCollectionInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $0.User get owner => $_getN(0);
  @$pb.TagNumber(1)
  set owner($0.User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOwner() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwner() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.User ensureOwner() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get itemCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set itemCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasItemCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearItemCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get seriesCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set seriesCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSeriesCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeriesCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get progress => $_getIZ(3);
  @$pb.TagNumber(4)
  set progress($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasProgress() => $_has(3);
  @$pb.TagNumber(4)
  void clearProgress() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get readyToCollect => $_getIZ(4);
  @$pb.TagNumber(5)
  set readyToCollect($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReadyToCollect() => $_has(4);
  @$pb.TagNumber(5)
  void clearReadyToCollect() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<PavilionItem> get items => $_getList(5);

  @$pb.TagNumber(7)
  $pb.PbList<PavilionSeriesCard> get seriesCards => $_getList(6);
}

class PavilionItem extends $pb.GeneratedMessage {
  factory PavilionItem({
    $1.CommodityItem? item,
    $core.int? count,
    $core.bool? light,
    $fixnum.Int64? point,
    $core.int? level,
  }) {
    final result = create();
    if (item != null) result.item = item;
    if (count != null) result.count = count;
    if (light != null) result.light = light;
    if (point != null) result.point = point;
    if (level != null) result.level = level;
    return result;
  }

  PavilionItem._();

  factory PavilionItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aOM<$1.CommodityItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: $1.CommodityItem.create)
    ..aI(2, _omitFieldNames ? '' : 'count')
    ..aOB(3, _omitFieldNames ? '' : 'light')
    ..aInt64(4, _omitFieldNames ? '' : 'point')
    ..aI(5, _omitFieldNames ? '' : 'level')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionItem copyWith(void Function(PavilionItem) updates) =>
      super.copyWith((message) => updates(message as PavilionItem))
          as PavilionItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionItem create() => PavilionItem._();
  @$core.override
  PavilionItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionItem>(create);
  static PavilionItem? _defaultInstance;

  @$pb.TagNumber(1)
  $1.CommodityItem get item => $_getN(0);
  @$pb.TagNumber(1)
  set item($1.CommodityItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearItem() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.CommodityItem ensureItem() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get light => $_getBF(2);
  @$pb.TagNumber(3)
  set light($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLight() => $_has(2);
  @$pb.TagNumber(3)
  void clearLight() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get point => $_getI64(3);
  @$pb.TagNumber(4)
  set point($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPoint() => $_has(3);
  @$pb.TagNumber(4)
  void clearPoint() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get level => $_getIZ(4);
  @$pb.TagNumber(5)
  set level($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLevel() => $_clearField(5);
}

class PavilionSeriesCard extends $pb.GeneratedMessage {
  factory PavilionSeriesCard({
    $fixnum.Int64? seriesId,
    $core.String? name,
    $core.String? resource,
    $core.int? lit,
    $core.int? total,
  }) {
    final result = create();
    if (seriesId != null) result.seriesId = seriesId;
    if (name != null) result.name = name;
    if (resource != null) result.resource = resource;
    if (lit != null) result.lit = lit;
    if (total != null) result.total = total;
    return result;
  }

  PavilionSeriesCard._();

  factory PavilionSeriesCard.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionSeriesCard.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionSeriesCard',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'seriesId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'resource')
    ..aI(4, _omitFieldNames ? '' : 'lit')
    ..aI(5, _omitFieldNames ? '' : 'total')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSeriesCard clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSeriesCard copyWith(void Function(PavilionSeriesCard) updates) =>
      super.copyWith((message) => updates(message as PavilionSeriesCard))
          as PavilionSeriesCard;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionSeriesCard create() => PavilionSeriesCard._();
  @$core.override
  PavilionSeriesCard createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionSeriesCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionSeriesCard>(create);
  static PavilionSeriesCard? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get seriesId => $_getI64(0);
  @$pb.TagNumber(1)
  set seriesId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSeriesId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeriesId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get resource => $_getSZ(2);
  @$pb.TagNumber(3)
  set resource($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasResource() => $_has(2);
  @$pb.TagNumber(3)
  void clearResource() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get lit => $_getIZ(3);
  @$pb.TagNumber(4)
  set lit($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLit() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get total => $_getIZ(4);
  @$pb.TagNumber(5)
  set total($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotal() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotal() => $_clearField(5);
}

/// 回收预览
class PavilionRecyclePreviewReq extends $pb.GeneratedMessage {
  factory PavilionRecyclePreviewReq({
    $1.CommodityType? type,
    $core.Iterable<PavilionRecycleLine>? list,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (list != null) result.list.addAll(list);
    return result;
  }

  PavilionRecyclePreviewReq._();

  factory PavilionRecyclePreviewReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionRecyclePreviewReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionRecyclePreviewReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aE<$1.CommodityType>(1, _omitFieldNames ? '' : 'type',
        enumValues: $1.CommodityType.values)
    ..pPM<PavilionRecycleLine>(2, _omitFieldNames ? '' : 'list',
        subBuilder: PavilionRecycleLine.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRecyclePreviewReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRecyclePreviewReq copyWith(
          void Function(PavilionRecyclePreviewReq) updates) =>
      super.copyWith((message) => updates(message as PavilionRecyclePreviewReq))
          as PavilionRecyclePreviewReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionRecyclePreviewReq create() => PavilionRecyclePreviewReq._();
  @$core.override
  PavilionRecyclePreviewReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionRecyclePreviewReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionRecyclePreviewReq>(create);
  static PavilionRecyclePreviewReq? _defaultInstance;

  @$pb.TagNumber(1)
  $1.CommodityType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type($1.CommodityType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<PavilionRecycleLine> get list => $_getList(1);
}

class PavilionRecycleLine extends $pb.GeneratedMessage {
  factory PavilionRecycleLine({
    $fixnum.Int64? commodityId,
    $core.int? consumeCount,
  }) {
    final result = create();
    if (commodityId != null) result.commodityId = commodityId;
    if (consumeCount != null) result.consumeCount = consumeCount;
    return result;
  }

  PavilionRecycleLine._();

  factory PavilionRecycleLine.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionRecycleLine.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionRecycleLine',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'commodityId')
    ..aI(2, _omitFieldNames ? '' : 'consumeCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRecycleLine clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRecycleLine copyWith(void Function(PavilionRecycleLine) updates) =>
      super.copyWith((message) => updates(message as PavilionRecycleLine))
          as PavilionRecycleLine;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionRecycleLine create() => PavilionRecycleLine._();
  @$core.override
  PavilionRecycleLine createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionRecycleLine getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionRecycleLine>(create);
  static PavilionRecycleLine? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get commodityId => $_getI64(0);
  @$pb.TagNumber(1)
  set commodityId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCommodityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommodityId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get consumeCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set consumeCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConsumeCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearConsumeCount() => $_clearField(2);
}

class PavilionRecyclePreviewData extends $pb.GeneratedMessage {
  factory PavilionRecyclePreviewData({
    $fixnum.Int64? exp,
    $core.Iterable<PavilionRecyclePreviewItem>? list,
    $fixnum.Int64? points,
  }) {
    final result = create();
    if (exp != null) result.exp = exp;
    if (list != null) result.list.addAll(list);
    if (points != null) result.points = points;
    return result;
  }

  PavilionRecyclePreviewData._();

  factory PavilionRecyclePreviewData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionRecyclePreviewData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionRecyclePreviewData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'exp')
    ..pPM<PavilionRecyclePreviewItem>(2, _omitFieldNames ? '' : 'list',
        subBuilder: PavilionRecyclePreviewItem.create)
    ..aInt64(3, _omitFieldNames ? '' : 'points')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRecyclePreviewData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRecyclePreviewData copyWith(
          void Function(PavilionRecyclePreviewData) updates) =>
      super.copyWith(
              (message) => updates(message as PavilionRecyclePreviewData))
          as PavilionRecyclePreviewData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionRecyclePreviewData create() => PavilionRecyclePreviewData._();
  @$core.override
  PavilionRecyclePreviewData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionRecyclePreviewData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionRecyclePreviewData>(create);
  static PavilionRecyclePreviewData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get exp => $_getI64(0);
  @$pb.TagNumber(1)
  set exp($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasExp() => $_has(0);
  @$pb.TagNumber(1)
  void clearExp() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<PavilionRecyclePreviewItem> get list => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get points => $_getI64(2);
  @$pb.TagNumber(3)
  set points($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPoints() => $_has(2);
  @$pb.TagNumber(3)
  void clearPoints() => $_clearField(3);
}

class PavilionRecyclePreviewItem extends $pb.GeneratedMessage {
  factory PavilionRecyclePreviewItem({
    $fixnum.Int64? commodityId,
    $core.String? name,
    $core.String? icon,
    $core.int? count,
    $core.int? consumeCount,
    $core.bool? light,
    $fixnum.Int64? point,
    $core.bool? preSelection,
  }) {
    final result = create();
    if (commodityId != null) result.commodityId = commodityId;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (count != null) result.count = count;
    if (consumeCount != null) result.consumeCount = consumeCount;
    if (light != null) result.light = light;
    if (point != null) result.point = point;
    if (preSelection != null) result.preSelection = preSelection;
    return result;
  }

  PavilionRecyclePreviewItem._();

  factory PavilionRecyclePreviewItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionRecyclePreviewItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionRecyclePreviewItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'commodityId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aI(4, _omitFieldNames ? '' : 'count')
    ..aI(5, _omitFieldNames ? '' : 'consumeCount')
    ..aOB(6, _omitFieldNames ? '' : 'light')
    ..aInt64(7, _omitFieldNames ? '' : 'point')
    ..aOB(8, _omitFieldNames ? '' : 'preSelection')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRecyclePreviewItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRecyclePreviewItem copyWith(
          void Function(PavilionRecyclePreviewItem) updates) =>
      super.copyWith(
              (message) => updates(message as PavilionRecyclePreviewItem))
          as PavilionRecyclePreviewItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionRecyclePreviewItem create() => PavilionRecyclePreviewItem._();
  @$core.override
  PavilionRecyclePreviewItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionRecyclePreviewItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionRecyclePreviewItem>(create);
  static PavilionRecyclePreviewItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get commodityId => $_getI64(0);
  @$pb.TagNumber(1)
  set commodityId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCommodityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommodityId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get consumeCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set consumeCount($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasConsumeCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearConsumeCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get light => $_getBF(5);
  @$pb.TagNumber(6)
  set light($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLight() => $_has(5);
  @$pb.TagNumber(6)
  void clearLight() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get point => $_getI64(6);
  @$pb.TagNumber(7)
  set point($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPoint() => $_has(6);
  @$pb.TagNumber(7)
  void clearPoint() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get preSelection => $_getBF(7);
  @$pb.TagNumber(8)
  set preSelection($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPreSelection() => $_has(7);
  @$pb.TagNumber(8)
  void clearPreSelection() => $_clearField(8);
}

/// 确认回收
class PavilionRecycleReq extends $pb.GeneratedMessage {
  factory PavilionRecycleReq({
    $1.CommodityType? type,
    $core.Iterable<PavilionRecycleLine>? list,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (list != null) result.list.addAll(list);
    return result;
  }

  PavilionRecycleReq._();

  factory PavilionRecycleReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionRecycleReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionRecycleReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aE<$1.CommodityType>(1, _omitFieldNames ? '' : 'type',
        enumValues: $1.CommodityType.values)
    ..pPM<PavilionRecycleLine>(2, _omitFieldNames ? '' : 'list',
        subBuilder: PavilionRecycleLine.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRecycleReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRecycleReq copyWith(void Function(PavilionRecycleReq) updates) =>
      super.copyWith((message) => updates(message as PavilionRecycleReq))
          as PavilionRecycleReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionRecycleReq create() => PavilionRecycleReq._();
  @$core.override
  PavilionRecycleReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionRecycleReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionRecycleReq>(create);
  static PavilionRecycleReq? _defaultInstance;

  @$pb.TagNumber(1)
  $1.CommodityType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type($1.CommodityType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<PavilionRecycleLine> get list => $_getList(1);
}

/// 套组详情
class PavilionSeriesDetailReq extends $pb.GeneratedMessage {
  factory PavilionSeriesDetailReq({
    $fixnum.Int64? seriesId,
    $fixnum.Int64? uid,
  }) {
    final result = create();
    if (seriesId != null) result.seriesId = seriesId;
    if (uid != null) result.uid = uid;
    return result;
  }

  PavilionSeriesDetailReq._();

  factory PavilionSeriesDetailReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionSeriesDetailReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionSeriesDetailReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'seriesId')
    ..aInt64(2, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSeriesDetailReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSeriesDetailReq copyWith(
          void Function(PavilionSeriesDetailReq) updates) =>
      super.copyWith((message) => updates(message as PavilionSeriesDetailReq))
          as PavilionSeriesDetailReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionSeriesDetailReq create() => PavilionSeriesDetailReq._();
  @$core.override
  PavilionSeriesDetailReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionSeriesDetailReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionSeriesDetailReq>(create);
  static PavilionSeriesDetailReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get seriesId => $_getI64(0);
  @$pb.TagNumber(1)
  set seriesId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSeriesId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeriesId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);
}

class PavilionSeriesDetailData extends $pb.GeneratedMessage {
  factory PavilionSeriesDetailData({
    $fixnum.Int64? seriesId,
    $core.String? name,
    $core.String? resource,
    $core.int? lightCount,
    $core.int? total,
    $core.bool? completed,
    $core.Iterable<PavilionItem>? members,
  }) {
    final result = create();
    if (seriesId != null) result.seriesId = seriesId;
    if (name != null) result.name = name;
    if (resource != null) result.resource = resource;
    if (lightCount != null) result.lightCount = lightCount;
    if (total != null) result.total = total;
    if (completed != null) result.completed = completed;
    if (members != null) result.members.addAll(members);
    return result;
  }

  PavilionSeriesDetailData._();

  factory PavilionSeriesDetailData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionSeriesDetailData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionSeriesDetailData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'seriesId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'resource')
    ..aI(4, _omitFieldNames ? '' : 'lightCount')
    ..aI(5, _omitFieldNames ? '' : 'total')
    ..aOB(6, _omitFieldNames ? '' : 'completed')
    ..pPM<PavilionItem>(7, _omitFieldNames ? '' : 'members',
        subBuilder: PavilionItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSeriesDetailData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSeriesDetailData copyWith(
          void Function(PavilionSeriesDetailData) updates) =>
      super.copyWith((message) => updates(message as PavilionSeriesDetailData))
          as PavilionSeriesDetailData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionSeriesDetailData create() => PavilionSeriesDetailData._();
  @$core.override
  PavilionSeriesDetailData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionSeriesDetailData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionSeriesDetailData>(create);
  static PavilionSeriesDetailData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get seriesId => $_getI64(0);
  @$pb.TagNumber(1)
  set seriesId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSeriesId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeriesId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get resource => $_getSZ(2);
  @$pb.TagNumber(3)
  set resource($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasResource() => $_has(2);
  @$pb.TagNumber(3)
  void clearResource() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get lightCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set lightCount($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLightCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearLightCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get total => $_getIZ(4);
  @$pb.TagNumber(5)
  set total($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotal() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotal() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get completed => $_getBF(5);
  @$pb.TagNumber(6)
  set completed($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCompleted() => $_has(5);
  @$pb.TagNumber(6)
  void clearCompleted() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<PavilionItem> get members => $_getList(6);
}

/// 编排页
class PavilionExhibitsData extends $pb.GeneratedMessage {
  factory PavilionExhibitsData({
    $core.Iterable<PavilionSlotView>? slotList,
    $core.Iterable<$1.CommodityItem>? collectList,
  }) {
    final result = create();
    if (slotList != null) result.slotList.addAll(slotList);
    if (collectList != null) result.collectList.addAll(collectList);
    return result;
  }

  PavilionExhibitsData._();

  factory PavilionExhibitsData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionExhibitsData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionExhibitsData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..pPM<PavilionSlotView>(1, _omitFieldNames ? '' : 'slotList',
        subBuilder: PavilionSlotView.create)
    ..pPM<$1.CommodityItem>(2, _omitFieldNames ? '' : 'collectList',
        subBuilder: $1.CommodityItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionExhibitsData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionExhibitsData copyWith(void Function(PavilionExhibitsData) updates) =>
      super.copyWith((message) => updates(message as PavilionExhibitsData))
          as PavilionExhibitsData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionExhibitsData create() => PavilionExhibitsData._();
  @$core.override
  PavilionExhibitsData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionExhibitsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionExhibitsData>(create);
  static PavilionExhibitsData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PavilionSlotView> get slotList => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$1.CommodityItem> get collectList => $_getList(1);
}

/// Save Display
class PavilionSlotSaveReq extends $pb.GeneratedMessage {
  factory PavilionSlotSaveReq({
    $core.String? type,
    $core.Iterable<PavilionSlotSaveItem>? slots,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (slots != null) result.slots.addAll(slots);
    return result;
  }

  PavilionSlotSaveReq._();

  factory PavilionSlotSaveReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionSlotSaveReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionSlotSaveReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..pPM<PavilionSlotSaveItem>(2, _omitFieldNames ? '' : 'slots',
        subBuilder: PavilionSlotSaveItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSlotSaveReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSlotSaveReq copyWith(void Function(PavilionSlotSaveReq) updates) =>
      super.copyWith((message) => updates(message as PavilionSlotSaveReq))
          as PavilionSlotSaveReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionSlotSaveReq create() => PavilionSlotSaveReq._();
  @$core.override
  PavilionSlotSaveReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionSlotSaveReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionSlotSaveReq>(create);
  static PavilionSlotSaveReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<PavilionSlotSaveItem> get slots => $_getList(1);
}

class PavilionSlotSaveItem extends $pb.GeneratedMessage {
  factory PavilionSlotSaveItem({
    $fixnum.Int64? slotId,
    $fixnum.Int64? commodityId,
    $1.CommodityType? commodityType,
  }) {
    final result = create();
    if (slotId != null) result.slotId = slotId;
    if (commodityId != null) result.commodityId = commodityId;
    if (commodityType != null) result.commodityType = commodityType;
    return result;
  }

  PavilionSlotSaveItem._();

  factory PavilionSlotSaveItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionSlotSaveItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionSlotSaveItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'slotId')
    ..aInt64(2, _omitFieldNames ? '' : 'commodityId')
    ..aE<$1.CommodityType>(3, _omitFieldNames ? '' : 'commodityType',
        enumValues: $1.CommodityType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSlotSaveItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionSlotSaveItem copyWith(void Function(PavilionSlotSaveItem) updates) =>
      super.copyWith((message) => updates(message as PavilionSlotSaveItem))
          as PavilionSlotSaveItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionSlotSaveItem create() => PavilionSlotSaveItem._();
  @$core.override
  PavilionSlotSaveItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionSlotSaveItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionSlotSaveItem>(create);
  static PavilionSlotSaveItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get slotId => $_getI64(0);
  @$pb.TagNumber(1)
  set slotId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSlotId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlotId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get commodityId => $_getI64(1);
  @$pb.TagNumber(2)
  set commodityId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCommodityId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommodityId() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.CommodityType get commodityType => $_getN(2);
  @$pb.TagNumber(3)
  set commodityType($1.CommodityType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCommodityType() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommodityType() => $_clearField(3);
}

/// 装扮商店
class PavilionDecorShopListData extends $pb.GeneratedMessage {
  factory PavilionDecorShopListData({
    $fixnum.Int64? points,
    $core.Iterable<PavilionDecorShopItem>? backgroundList,
    $core.Iterable<PavilionDecorShopItem>? carList,
    $core.Iterable<PavilionDecorShopItem>? normalList,
  }) {
    final result = create();
    if (points != null) result.points = points;
    if (backgroundList != null) result.backgroundList.addAll(backgroundList);
    if (carList != null) result.carList.addAll(carList);
    if (normalList != null) result.normalList.addAll(normalList);
    return result;
  }

  PavilionDecorShopListData._();

  factory PavilionDecorShopListData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionDecorShopListData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionDecorShopListData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'points')
    ..pPM<PavilionDecorShopItem>(2, _omitFieldNames ? '' : 'backgroundList',
        subBuilder: PavilionDecorShopItem.create)
    ..pPM<PavilionDecorShopItem>(3, _omitFieldNames ? '' : 'carList',
        subBuilder: PavilionDecorShopItem.create)
    ..pPM<PavilionDecorShopItem>(4, _omitFieldNames ? '' : 'normalList',
        subBuilder: PavilionDecorShopItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionDecorShopListData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionDecorShopListData copyWith(
          void Function(PavilionDecorShopListData) updates) =>
      super.copyWith((message) => updates(message as PavilionDecorShopListData))
          as PavilionDecorShopListData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionDecorShopListData create() => PavilionDecorShopListData._();
  @$core.override
  PavilionDecorShopListData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionDecorShopListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionDecorShopListData>(create);
  static PavilionDecorShopListData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get points => $_getI64(0);
  @$pb.TagNumber(1)
  set points($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPoints() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoints() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<PavilionDecorShopItem> get backgroundList => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<PavilionDecorShopItem> get carList => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<PavilionDecorShopItem> get normalList => $_getList(3);
}

class PavilionDecorShopItem extends $pb.GeneratedMessage {
  factory PavilionDecorShopItem({
    $fixnum.Int64? decorId,
    $core.String? name,
    $core.String? resource,
    $core.String? type,
    $fixnum.Int64? points,
    $core.bool? isRepeatable,
    $core.int? count,
  }) {
    final result = create();
    if (decorId != null) result.decorId = decorId;
    if (name != null) result.name = name;
    if (resource != null) result.resource = resource;
    if (type != null) result.type = type;
    if (points != null) result.points = points;
    if (isRepeatable != null) result.isRepeatable = isRepeatable;
    if (count != null) result.count = count;
    return result;
  }

  PavilionDecorShopItem._();

  factory PavilionDecorShopItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionDecorShopItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionDecorShopItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'decorId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'resource')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..aInt64(5, _omitFieldNames ? '' : 'points')
    ..aOB(6, _omitFieldNames ? '' : 'isRepeatable')
    ..aI(7, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionDecorShopItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionDecorShopItem copyWith(
          void Function(PavilionDecorShopItem) updates) =>
      super.copyWith((message) => updates(message as PavilionDecorShopItem))
          as PavilionDecorShopItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionDecorShopItem create() => PavilionDecorShopItem._();
  @$core.override
  PavilionDecorShopItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionDecorShopItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionDecorShopItem>(create);
  static PavilionDecorShopItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get decorId => $_getI64(0);
  @$pb.TagNumber(1)
  set decorId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDecorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDecorId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get resource => $_getSZ(2);
  @$pb.TagNumber(3)
  set resource($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasResource() => $_has(2);
  @$pb.TagNumber(3)
  void clearResource() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get points => $_getI64(4);
  @$pb.TagNumber(5)
  set points($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPoints() => $_has(4);
  @$pb.TagNumber(5)
  void clearPoints() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isRepeatable => $_getBF(5);
  @$pb.TagNumber(6)
  set isRepeatable($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsRepeatable() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsRepeatable() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get count => $_getIZ(6);
  @$pb.TagNumber(7)
  set count($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearCount() => $_clearField(7);
}

/// My Skins
class PavilionDecorOwnedData extends $pb.GeneratedMessage {
  factory PavilionDecorOwnedData({
    $core.Iterable<PavilionDecorOwnedItem>? backgroundList,
    $core.Iterable<PavilionDecorOwnedItem>? carList,
    $core.Iterable<PavilionDecorOwnedItem>? normalList,
  }) {
    final result = create();
    if (backgroundList != null) result.backgroundList.addAll(backgroundList);
    if (carList != null) result.carList.addAll(carList);
    if (normalList != null) result.normalList.addAll(normalList);
    return result;
  }

  PavilionDecorOwnedData._();

  factory PavilionDecorOwnedData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionDecorOwnedData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionDecorOwnedData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..pPM<PavilionDecorOwnedItem>(1, _omitFieldNames ? '' : 'backgroundList',
        subBuilder: PavilionDecorOwnedItem.create)
    ..pPM<PavilionDecorOwnedItem>(2, _omitFieldNames ? '' : 'carList',
        subBuilder: PavilionDecorOwnedItem.create)
    ..pPM<PavilionDecorOwnedItem>(3, _omitFieldNames ? '' : 'normalList',
        subBuilder: PavilionDecorOwnedItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionDecorOwnedData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionDecorOwnedData copyWith(
          void Function(PavilionDecorOwnedData) updates) =>
      super.copyWith((message) => updates(message as PavilionDecorOwnedData))
          as PavilionDecorOwnedData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionDecorOwnedData create() => PavilionDecorOwnedData._();
  @$core.override
  PavilionDecorOwnedData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionDecorOwnedData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionDecorOwnedData>(create);
  static PavilionDecorOwnedData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PavilionDecorOwnedItem> get backgroundList => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<PavilionDecorOwnedItem> get carList => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<PavilionDecorOwnedItem> get normalList => $_getList(2);
}

class PavilionDecorOwnedItem extends $pb.GeneratedMessage {
  factory PavilionDecorOwnedItem({
    $fixnum.Int64? decorId,
    $core.String? name,
    $core.String? resource,
    $core.bool? inUse,
    $fixnum.Int64? slotId,
    $core.int? displayNo,
    $core.String? displayResource,
  }) {
    final result = create();
    if (decorId != null) result.decorId = decorId;
    if (name != null) result.name = name;
    if (resource != null) result.resource = resource;
    if (inUse != null) result.inUse = inUse;
    if (slotId != null) result.slotId = slotId;
    if (displayNo != null) result.displayNo = displayNo;
    if (displayResource != null) result.displayResource = displayResource;
    return result;
  }

  PavilionDecorOwnedItem._();

  factory PavilionDecorOwnedItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionDecorOwnedItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionDecorOwnedItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'decorId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'resource')
    ..aOB(4, _omitFieldNames ? '' : 'inUse')
    ..aInt64(5, _omitFieldNames ? '' : 'slotId')
    ..aI(6, _omitFieldNames ? '' : 'displayNo')
    ..aOS(7, _omitFieldNames ? '' : 'displayResource')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionDecorOwnedItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionDecorOwnedItem copyWith(
          void Function(PavilionDecorOwnedItem) updates) =>
      super.copyWith((message) => updates(message as PavilionDecorOwnedItem))
          as PavilionDecorOwnedItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionDecorOwnedItem create() => PavilionDecorOwnedItem._();
  @$core.override
  PavilionDecorOwnedItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionDecorOwnedItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionDecorOwnedItem>(create);
  static PavilionDecorOwnedItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get decorId => $_getI64(0);
  @$pb.TagNumber(1)
  set decorId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDecorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDecorId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get resource => $_getSZ(2);
  @$pb.TagNumber(3)
  set resource($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasResource() => $_has(2);
  @$pb.TagNumber(3)
  void clearResource() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get inUse => $_getBF(3);
  @$pb.TagNumber(4)
  set inUse($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasInUse() => $_has(3);
  @$pb.TagNumber(4)
  void clearInUse() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get slotId => $_getI64(4);
  @$pb.TagNumber(5)
  set slotId($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSlotId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSlotId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get displayNo => $_getIZ(5);
  @$pb.TagNumber(6)
  set displayNo($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDisplayNo() => $_has(5);
  @$pb.TagNumber(6)
  void clearDisplayNo() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get displayResource => $_getSZ(6);
  @$pb.TagNumber(7)
  set displayResource($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDisplayResource() => $_has(6);
  @$pb.TagNumber(7)
  void clearDisplayResource() => $_clearField(7);
}

/// 兑换 / 装配 / 卸下
class PavilionDecorRedeemReq extends $pb.GeneratedMessage {
  factory PavilionDecorRedeemReq({
    $fixnum.Int64? decorId,
  }) {
    final result = create();
    if (decorId != null) result.decorId = decorId;
    return result;
  }

  PavilionDecorRedeemReq._();

  factory PavilionDecorRedeemReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionDecorRedeemReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionDecorRedeemReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'decorId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionDecorRedeemReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionDecorRedeemReq copyWith(
          void Function(PavilionDecorRedeemReq) updates) =>
      super.copyWith((message) => updates(message as PavilionDecorRedeemReq))
          as PavilionDecorRedeemReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionDecorRedeemReq create() => PavilionDecorRedeemReq._();
  @$core.override
  PavilionDecorRedeemReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionDecorRedeemReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionDecorRedeemReq>(create);
  static PavilionDecorRedeemReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get decorId => $_getI64(0);
  @$pb.TagNumber(1)
  set decorId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDecorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDecorId() => $_clearField(1);
}

class PavilionShopEquipReq extends $pb.GeneratedMessage {
  factory PavilionShopEquipReq({
    $fixnum.Int64? decorId,
    $fixnum.Int64? slotId,
  }) {
    final result = create();
    if (decorId != null) result.decorId = decorId;
    if (slotId != null) result.slotId = slotId;
    return result;
  }

  PavilionShopEquipReq._();

  factory PavilionShopEquipReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionShopEquipReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionShopEquipReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'decorId')
    ..aInt64(2, _omitFieldNames ? '' : 'slotId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionShopEquipReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionShopEquipReq copyWith(void Function(PavilionShopEquipReq) updates) =>
      super.copyWith((message) => updates(message as PavilionShopEquipReq))
          as PavilionShopEquipReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionShopEquipReq create() => PavilionShopEquipReq._();
  @$core.override
  PavilionShopEquipReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionShopEquipReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionShopEquipReq>(create);
  static PavilionShopEquipReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get decorId => $_getI64(0);
  @$pb.TagNumber(1)
  set decorId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDecorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDecorId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get slotId => $_getI64(1);
  @$pb.TagNumber(2)
  set slotId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSlotId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSlotId() => $_clearField(2);
}

class PavilionShopUnequipReq extends $pb.GeneratedMessage {
  factory PavilionShopUnequipReq({
    $fixnum.Int64? slotId,
    $core.bool? unequipBackground,
  }) {
    final result = create();
    if (slotId != null) result.slotId = slotId;
    if (unequipBackground != null) result.unequipBackground = unequipBackground;
    return result;
  }

  PavilionShopUnequipReq._();

  factory PavilionShopUnequipReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionShopUnequipReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionShopUnequipReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'slotId')
    ..aOB(2, _omitFieldNames ? '' : 'unequipBackground')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionShopUnequipReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionShopUnequipReq copyWith(
          void Function(PavilionShopUnequipReq) updates) =>
      super.copyWith((message) => updates(message as PavilionShopUnequipReq))
          as PavilionShopUnequipReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionShopUnequipReq create() => PavilionShopUnequipReq._();
  @$core.override
  PavilionShopUnequipReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionShopUnequipReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionShopUnequipReq>(create);
  static PavilionShopUnequipReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get slotId => $_getI64(0);
  @$pb.TagNumber(1)
  set slotId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSlotId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlotId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get unequipBackground => $_getBF(1);
  @$pb.TagNumber(2)
  set unequipBackground($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUnequipBackground() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnequipBackground() => $_clearField(2);
}

/// 等级奖励
class PavilionRewardListData extends $pb.GeneratedMessage {
  factory PavilionRewardListData({
    $core.int? level,
    $core.String? levelName,
    $fixnum.Int64? exp,
    $fixnum.Int64? levelExp,
    $fixnum.Int64? points,
    $core.bool? redDot,
    $core.Iterable<PavilionRewardItem>? list,
  }) {
    final result = create();
    if (level != null) result.level = level;
    if (levelName != null) result.levelName = levelName;
    if (exp != null) result.exp = exp;
    if (levelExp != null) result.levelExp = levelExp;
    if (points != null) result.points = points;
    if (redDot != null) result.redDot = redDot;
    if (list != null) result.list.addAll(list);
    return result;
  }

  PavilionRewardListData._();

  factory PavilionRewardListData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionRewardListData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionRewardListData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'level')
    ..aOS(2, _omitFieldNames ? '' : 'levelName')
    ..aInt64(3, _omitFieldNames ? '' : 'exp')
    ..aInt64(4, _omitFieldNames ? '' : 'levelExp')
    ..aInt64(5, _omitFieldNames ? '' : 'points')
    ..aOB(6, _omitFieldNames ? '' : 'redDot')
    ..pPM<PavilionRewardItem>(7, _omitFieldNames ? '' : 'list',
        subBuilder: PavilionRewardItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRewardListData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRewardListData copyWith(
          void Function(PavilionRewardListData) updates) =>
      super.copyWith((message) => updates(message as PavilionRewardListData))
          as PavilionRewardListData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionRewardListData create() => PavilionRewardListData._();
  @$core.override
  PavilionRewardListData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionRewardListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionRewardListData>(create);
  static PavilionRewardListData? _defaultInstance;

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
  $fixnum.Int64 get exp => $_getI64(2);
  @$pb.TagNumber(3)
  set exp($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExp() => $_has(2);
  @$pb.TagNumber(3)
  void clearExp() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get levelExp => $_getI64(3);
  @$pb.TagNumber(4)
  set levelExp($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLevelExp() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevelExp() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get points => $_getI64(4);
  @$pb.TagNumber(5)
  set points($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPoints() => $_has(4);
  @$pb.TagNumber(5)
  void clearPoints() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get redDot => $_getBF(5);
  @$pb.TagNumber(6)
  set redDot($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRedDot() => $_has(5);
  @$pb.TagNumber(6)
  void clearRedDot() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<PavilionRewardItem> get list => $_getList(6);
}

class PavilionRewardItem extends $pb.GeneratedMessage {
  factory PavilionRewardItem({
    $fixnum.Int64? rewardId,
    $core.int? level,
    $core.String? rewardType,
    $fixnum.Int64? bizId,
    $core.String? status,
    $core.String? name,
    $core.String? icon,
  }) {
    final result = create();
    if (rewardId != null) result.rewardId = rewardId;
    if (level != null) result.level = level;
    if (rewardType != null) result.rewardType = rewardType;
    if (bizId != null) result.bizId = bizId;
    if (status != null) result.status = status;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    return result;
  }

  PavilionRewardItem._();

  factory PavilionRewardItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionRewardItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionRewardItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'rewardId')
    ..aI(2, _omitFieldNames ? '' : 'level')
    ..aOS(3, _omitFieldNames ? '' : 'rewardType')
    ..aInt64(4, _omitFieldNames ? '' : 'bizId')
    ..aOS(5, _omitFieldNames ? '' : 'status')
    ..aOS(6, _omitFieldNames ? '' : 'name')
    ..aOS(7, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRewardItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRewardItem copyWith(void Function(PavilionRewardItem) updates) =>
      super.copyWith((message) => updates(message as PavilionRewardItem))
          as PavilionRewardItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionRewardItem create() => PavilionRewardItem._();
  @$core.override
  PavilionRewardItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionRewardItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionRewardItem>(create);
  static PavilionRewardItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get rewardId => $_getI64(0);
  @$pb.TagNumber(1)
  set rewardId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRewardId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRewardId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get level => $_getIZ(1);
  @$pb.TagNumber(2)
  set level($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get rewardType => $_getSZ(2);
  @$pb.TagNumber(3)
  set rewardType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRewardType() => $_has(2);
  @$pb.TagNumber(3)
  void clearRewardType() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get bizId => $_getI64(3);
  @$pb.TagNumber(4)
  set bizId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBizId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBizId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get icon => $_getSZ(6);
  @$pb.TagNumber(7)
  set icon($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearIcon() => $_clearField(7);
}

class PavilionRewardClaimReq extends $pb.GeneratedMessage {
  factory PavilionRewardClaimReq({
    $fixnum.Int64? rewardId,
  }) {
    final result = create();
    if (rewardId != null) result.rewardId = rewardId;
    return result;
  }

  PavilionRewardClaimReq._();

  factory PavilionRewardClaimReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PavilionRewardClaimReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PavilionRewardClaimReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pavilion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'rewardId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRewardClaimReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PavilionRewardClaimReq copyWith(
          void Function(PavilionRewardClaimReq) updates) =>
      super.copyWith((message) => updates(message as PavilionRewardClaimReq))
          as PavilionRewardClaimReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PavilionRewardClaimReq create() => PavilionRewardClaimReq._();
  @$core.override
  PavilionRewardClaimReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PavilionRewardClaimReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PavilionRewardClaimReq>(create);
  static PavilionRewardClaimReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get rewardId => $_getI64(0);
  @$pb.TagNumber(1)
  set rewardId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRewardId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRewardId() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

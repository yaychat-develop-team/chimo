// This is a generated file - do not edit.
//
// Generated from server_client/couple.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'commodity.pb.dart' as $0;
import 'user.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ActivityBaseInfo extends $pb.GeneratedMessage {
  factory ActivityBaseInfo({
    $fixnum.Int64? id,
    $fixnum.Int64? currentIntimacy,
    $fixnum.Int64? upgradeIntimacy,
    $fixnum.Int64? totalIntimacy,
    $core.int? level,
    $0.CommodityItem? nextReward,
    $0.CommodityItem? claimItem,
    CoupleInfo? coupleInfo,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (currentIntimacy != null) result.currentIntimacy = currentIntimacy;
    if (upgradeIntimacy != null) result.upgradeIntimacy = upgradeIntimacy;
    if (totalIntimacy != null) result.totalIntimacy = totalIntimacy;
    if (level != null) result.level = level;
    if (nextReward != null) result.nextReward = nextReward;
    if (claimItem != null) result.claimItem = claimItem;
    if (coupleInfo != null) result.coupleInfo = coupleInfo;
    return result;
  }

  ActivityBaseInfo._();

  factory ActivityBaseInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ActivityBaseInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActivityBaseInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'couple'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'currentIntimacy')
    ..aInt64(3, _omitFieldNames ? '' : 'upgradeIntimacy')
    ..aInt64(4, _omitFieldNames ? '' : 'totalIntimacy')
    ..aI(5, _omitFieldNames ? '' : 'level')
    ..aOM<$0.CommodityItem>(6, _omitFieldNames ? '' : 'nextReward',
        subBuilder: $0.CommodityItem.create)
    ..aOM<$0.CommodityItem>(7, _omitFieldNames ? '' : 'claimItem',
        subBuilder: $0.CommodityItem.create)
    ..aOM<CoupleInfo>(8, _omitFieldNames ? '' : 'coupleInfo',
        subBuilder: CoupleInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityBaseInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityBaseInfo copyWith(void Function(ActivityBaseInfo) updates) =>
      super.copyWith((message) => updates(message as ActivityBaseInfo))
          as ActivityBaseInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActivityBaseInfo create() => ActivityBaseInfo._();
  @$core.override
  ActivityBaseInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ActivityBaseInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActivityBaseInfo>(create);
  static ActivityBaseInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get currentIntimacy => $_getI64(1);
  @$pb.TagNumber(2)
  set currentIntimacy($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCurrentIntimacy() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentIntimacy() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get upgradeIntimacy => $_getI64(2);
  @$pb.TagNumber(3)
  set upgradeIntimacy($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUpgradeIntimacy() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpgradeIntimacy() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalIntimacy => $_getI64(3);
  @$pb.TagNumber(4)
  set totalIntimacy($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalIntimacy() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalIntimacy() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get level => $_getIZ(4);
  @$pb.TagNumber(5)
  set level($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLevel() => $_clearField(5);

  @$pb.TagNumber(6)
  $0.CommodityItem get nextReward => $_getN(5);
  @$pb.TagNumber(6)
  set nextReward($0.CommodityItem value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasNextReward() => $_has(5);
  @$pb.TagNumber(6)
  void clearNextReward() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.CommodityItem ensureNextReward() => $_ensure(5);

  @$pb.TagNumber(7)
  $0.CommodityItem get claimItem => $_getN(6);
  @$pb.TagNumber(7)
  set claimItem($0.CommodityItem value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasClaimItem() => $_has(6);
  @$pb.TagNumber(7)
  void clearClaimItem() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.CommodityItem ensureClaimItem() => $_ensure(6);

  @$pb.TagNumber(8)
  CoupleInfo get coupleInfo => $_getN(7);
  @$pb.TagNumber(8)
  set coupleInfo(CoupleInfo value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasCoupleInfo() => $_has(7);
  @$pb.TagNumber(8)
  void clearCoupleInfo() => $_clearField(8);
  @$pb.TagNumber(8)
  CoupleInfo ensureCoupleInfo() => $_ensure(7);
}

class ActivityInfo extends $pb.GeneratedMessage {
  factory ActivityInfo({
    $1.User? user1,
    $1.User? user2,
    $core.Iterable<RewardItem>? rewardList,
  }) {
    final result = create();
    if (user1 != null) result.user1 = user1;
    if (user2 != null) result.user2 = user2;
    if (rewardList != null) result.rewardList.addAll(rewardList);
    return result;
  }

  ActivityInfo._();

  factory ActivityInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ActivityInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActivityInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'couple'),
      createEmptyInstance: create)
    ..aOM<$1.User>(1, _omitFieldNames ? '' : 'user1',
        subBuilder: $1.User.create)
    ..aOM<$1.User>(2, _omitFieldNames ? '' : 'user2',
        subBuilder: $1.User.create)
    ..pPM<RewardItem>(3, _omitFieldNames ? '' : 'rewardList',
        subBuilder: RewardItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityInfo copyWith(void Function(ActivityInfo) updates) =>
      super.copyWith((message) => updates(message as ActivityInfo))
          as ActivityInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActivityInfo create() => ActivityInfo._();
  @$core.override
  ActivityInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ActivityInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActivityInfo>(create);
  static ActivityInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $1.User get user1 => $_getN(0);
  @$pb.TagNumber(1)
  set user1($1.User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser1() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser1() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.User ensureUser1() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.User get user2 => $_getN(1);
  @$pb.TagNumber(2)
  set user2($1.User value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUser2() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser2() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.User ensureUser2() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbList<RewardItem> get rewardList => $_getList(2);
}

class RewardItem extends $pb.GeneratedMessage {
  factory RewardItem({
    $core.int? level,
    $fixnum.Int64? unlockIntimacy,
    $core.int? status,
    $0.CommodityItem? item,
    $fixnum.Int64? currentIntimacy,
    $core.int? period,
  }) {
    final result = create();
    if (level != null) result.level = level;
    if (unlockIntimacy != null) result.unlockIntimacy = unlockIntimacy;
    if (status != null) result.status = status;
    if (item != null) result.item = item;
    if (currentIntimacy != null) result.currentIntimacy = currentIntimacy;
    if (period != null) result.period = period;
    return result;
  }

  RewardItem._();

  factory RewardItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RewardItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RewardItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'couple'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'level')
    ..aInt64(2, _omitFieldNames ? '' : 'unlockIntimacy')
    ..aI(3, _omitFieldNames ? '' : 'status')
    ..aOM<$0.CommodityItem>(4, _omitFieldNames ? '' : 'item',
        subBuilder: $0.CommodityItem.create)
    ..aInt64(5, _omitFieldNames ? '' : 'currentIntimacy')
    ..aI(6, _omitFieldNames ? '' : 'period')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RewardItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RewardItem copyWith(void Function(RewardItem) updates) =>
      super.copyWith((message) => updates(message as RewardItem)) as RewardItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RewardItem create() => RewardItem._();
  @$core.override
  RewardItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RewardItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RewardItem>(create);
  static RewardItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get unlockIntimacy => $_getI64(1);
  @$pb.TagNumber(2)
  set unlockIntimacy($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUnlockIntimacy() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnlockIntimacy() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get status => $_getIZ(2);
  @$pb.TagNumber(3)
  set status($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.CommodityItem get item => $_getN(3);
  @$pb.TagNumber(4)
  set item($0.CommodityItem value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasItem() => $_has(3);
  @$pb.TagNumber(4)
  void clearItem() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.CommodityItem ensureItem() => $_ensure(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get currentIntimacy => $_getI64(4);
  @$pb.TagNumber(5)
  set currentIntimacy($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCurrentIntimacy() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentIntimacy() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get period => $_getIZ(5);
  @$pb.TagNumber(6)
  set period($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPeriod() => $_has(5);
  @$pb.TagNumber(6)
  void clearPeriod() => $_clearField(6);
}

class CoupleInfo extends $pb.GeneratedMessage {
  factory CoupleInfo({
    $fixnum.Int64? uid1,
    $core.String? name1,
    $core.String? avatar1,
    $fixnum.Int64? uid2,
    $core.String? name2,
    $core.String? avatar2,
    $fixnum.Int64? activityId,
    $fixnum.Int64? itemId,
    $core.String? itemName,
    $core.String? itemIcon,
    $fixnum.Int64? price,
    $core.String? emUid1,
    $core.String? emUid2,
  }) {
    final result = create();
    if (uid1 != null) result.uid1 = uid1;
    if (name1 != null) result.name1 = name1;
    if (avatar1 != null) result.avatar1 = avatar1;
    if (uid2 != null) result.uid2 = uid2;
    if (name2 != null) result.name2 = name2;
    if (avatar2 != null) result.avatar2 = avatar2;
    if (activityId != null) result.activityId = activityId;
    if (itemId != null) result.itemId = itemId;
    if (itemName != null) result.itemName = itemName;
    if (itemIcon != null) result.itemIcon = itemIcon;
    if (price != null) result.price = price;
    if (emUid1 != null) result.emUid1 = emUid1;
    if (emUid2 != null) result.emUid2 = emUid2;
    return result;
  }

  CoupleInfo._();

  factory CoupleInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CoupleInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CoupleInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'couple'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid1')
    ..aOS(2, _omitFieldNames ? '' : 'name1')
    ..aOS(3, _omitFieldNames ? '' : 'avatar1')
    ..aInt64(4, _omitFieldNames ? '' : 'uid2')
    ..aOS(5, _omitFieldNames ? '' : 'name2')
    ..aOS(6, _omitFieldNames ? '' : 'avatar2')
    ..aInt64(7, _omitFieldNames ? '' : 'activityId')
    ..aInt64(8, _omitFieldNames ? '' : 'itemId')
    ..aOS(9, _omitFieldNames ? '' : 'itemName')
    ..aOS(10, _omitFieldNames ? '' : 'itemIcon')
    ..aInt64(11, _omitFieldNames ? '' : 'price')
    ..aOS(12, _omitFieldNames ? '' : 'emUid1')
    ..aOS(13, _omitFieldNames ? '' : 'emUid2')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CoupleInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CoupleInfo copyWith(void Function(CoupleInfo) updates) =>
      super.copyWith((message) => updates(message as CoupleInfo)) as CoupleInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CoupleInfo create() => CoupleInfo._();
  @$core.override
  CoupleInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CoupleInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CoupleInfo>(create);
  static CoupleInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid1 => $_getI64(0);
  @$pb.TagNumber(1)
  set uid1($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid1() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid1() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name1 => $_getSZ(1);
  @$pb.TagNumber(2)
  set name1($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName1() => $_has(1);
  @$pb.TagNumber(2)
  void clearName1() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar1 => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar1($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar1() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar1() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get uid2 => $_getI64(3);
  @$pb.TagNumber(4)
  set uid2($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUid2() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid2() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get name2 => $_getSZ(4);
  @$pb.TagNumber(5)
  set name2($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasName2() => $_has(4);
  @$pb.TagNumber(5)
  void clearName2() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get avatar2 => $_getSZ(5);
  @$pb.TagNumber(6)
  set avatar2($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAvatar2() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvatar2() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get activityId => $_getI64(6);
  @$pb.TagNumber(7)
  set activityId($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasActivityId() => $_has(6);
  @$pb.TagNumber(7)
  void clearActivityId() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get itemId => $_getI64(7);
  @$pb.TagNumber(8)
  set itemId($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasItemId() => $_has(7);
  @$pb.TagNumber(8)
  void clearItemId() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get itemName => $_getSZ(8);
  @$pb.TagNumber(9)
  set itemName($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasItemName() => $_has(8);
  @$pb.TagNumber(9)
  void clearItemName() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get itemIcon => $_getSZ(9);
  @$pb.TagNumber(10)
  set itemIcon($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasItemIcon() => $_has(9);
  @$pb.TagNumber(10)
  void clearItemIcon() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get price => $_getI64(10);
  @$pb.TagNumber(11)
  set price($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasPrice() => $_has(10);
  @$pb.TagNumber(11)
  void clearPrice() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get emUid1 => $_getSZ(11);
  @$pb.TagNumber(12)
  set emUid1($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasEmUid1() => $_has(11);
  @$pb.TagNumber(12)
  void clearEmUid1() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get emUid2 => $_getSZ(12);
  @$pb.TagNumber(13)
  set emUid2($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasEmUid2() => $_has(12);
  @$pb.TagNumber(13)
  void clearEmUid2() => $_clearField(13);
}

class ActiveCommonRsp extends $pb.GeneratedMessage {
  factory ActiveCommonRsp({
    $core.bool? result,
    CoupleInfo? coupleInfo,
  }) {
    final result$ = create();
    if (result != null) result$.result = result;
    if (coupleInfo != null) result$.coupleInfo = coupleInfo;
    return result$;
  }

  ActiveCommonRsp._();

  factory ActiveCommonRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ActiveCommonRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActiveCommonRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'couple'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'result')
    ..aOM<CoupleInfo>(2, _omitFieldNames ? '' : 'coupleInfo',
        subBuilder: CoupleInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActiveCommonRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActiveCommonRsp copyWith(void Function(ActiveCommonRsp) updates) =>
      super.copyWith((message) => updates(message as ActiveCommonRsp))
          as ActiveCommonRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActiveCommonRsp create() => ActiveCommonRsp._();
  @$core.override
  ActiveCommonRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ActiveCommonRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActiveCommonRsp>(create);
  static ActiveCommonRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => $_clearField(1);

  @$pb.TagNumber(2)
  CoupleInfo get coupleInfo => $_getN(1);
  @$pb.TagNumber(2)
  set coupleInfo(CoupleInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCoupleInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoupleInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  CoupleInfo ensureCoupleInfo() => $_ensure(1);
}

class RewardReceiveReq extends $pb.GeneratedMessage {
  factory RewardReceiveReq({
    $fixnum.Int64? activityId,
    $core.int? level,
  }) {
    final result = create();
    if (activityId != null) result.activityId = activityId;
    if (level != null) result.level = level;
    return result;
  }

  RewardReceiveReq._();

  factory RewardReceiveReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RewardReceiveReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RewardReceiveReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'couple'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'activityId')
    ..aI(2, _omitFieldNames ? '' : 'level')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RewardReceiveReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RewardReceiveReq copyWith(void Function(RewardReceiveReq) updates) =>
      super.copyWith((message) => updates(message as RewardReceiveReq))
          as RewardReceiveReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RewardReceiveReq create() => RewardReceiveReq._();
  @$core.override
  RewardReceiveReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RewardReceiveReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RewardReceiveReq>(create);
  static RewardReceiveReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get activityId => $_getI64(0);
  @$pb.TagNumber(1)
  set activityId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActivityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get level => $_getIZ(1);
  @$pb.TagNumber(2)
  set level($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

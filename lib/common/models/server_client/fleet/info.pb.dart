// This is a generated file - do not edit.
//
// Generated from server_client/fleet/info.proto.

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
import 'info.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'info.pbenum.dart';

class FleetRankReq extends $pb.GeneratedMessage {
  factory FleetRankReq({
    $core.int? page,
    $core.int? size,
    $core.int? fleetId,
    FleetRankType? rankType,
  }) {
    final result = create();
    if (page != null) result.page = page;
    if (size != null) result.size = size;
    if (fleetId != null) result.fleetId = fleetId;
    if (rankType != null) result.rankType = rankType;
    return result;
  }

  FleetRankReq._();

  factory FleetRankReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetRankReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetRankReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.info'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'page', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'size', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'fleetId', fieldType: $pb.PbFieldType.OU3)
    ..aE<FleetRankType>(4, _omitFieldNames ? '' : 'rankType',
        enumValues: FleetRankType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRankReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRankReq copyWith(void Function(FleetRankReq) updates) =>
      super.copyWith((message) => updates(message as FleetRankReq))
          as FleetRankReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetRankReq create() => FleetRankReq._();
  @$core.override
  FleetRankReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetRankReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetRankReq>(create);
  static FleetRankReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get page => $_getIZ(0);
  @$pb.TagNumber(1)
  set page($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get size => $_getIZ(1);
  @$pb.TagNumber(2)
  set size($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get fleetId => $_getIZ(2);
  @$pb.TagNumber(3)
  set fleetId($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFleetId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFleetId() => $_clearField(3);

  @$pb.TagNumber(4)
  FleetRankType get rankType => $_getN(3);
  @$pb.TagNumber(4)
  set rankType(FleetRankType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRankType() => $_has(3);
  @$pb.TagNumber(4)
  void clearRankType() => $_clearField(4);
}

class FleetMyFleetInfo extends $pb.GeneratedMessage {
  factory FleetMyFleetInfo({
    $core.int? fleetId,
  }) {
    final result = create();
    if (fleetId != null) result.fleetId = fleetId;
    return result;
  }

  FleetMyFleetInfo._();

  factory FleetMyFleetInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetMyFleetInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetMyFleetInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.info'),
      createEmptyInstance: create)
    ..aI(3, _omitFieldNames ? '' : 'fleetId', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetMyFleetInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetMyFleetInfo copyWith(void Function(FleetMyFleetInfo) updates) =>
      super.copyWith((message) => updates(message as FleetMyFleetInfo))
          as FleetMyFleetInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetMyFleetInfo create() => FleetMyFleetInfo._();
  @$core.override
  FleetMyFleetInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetMyFleetInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetMyFleetInfo>(create);
  static FleetMyFleetInfo? _defaultInstance;

  @$pb.TagNumber(3)
  $core.int get fleetId => $_getIZ(0);
  @$pb.TagNumber(3)
  set fleetId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(3)
  $core.bool hasFleetId() => $_has(0);
  @$pb.TagNumber(3)
  void clearFleetId() => $_clearField(3);
}

class FleetLeaderboardRsp extends $pb.GeneratedMessage {
  factory FleetLeaderboardRsp({
    $core.Iterable<$0.FleetBaseInfo>? list,
    $core.bool? hasMore,
    $0.FleetBaseInfo? myFleet,
    $core.int? totalCoin,
    $0.FleetSeasonInfo? seasonInfo,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (hasMore != null) result.hasMore = hasMore;
    if (myFleet != null) result.myFleet = myFleet;
    if (totalCoin != null) result.totalCoin = totalCoin;
    if (seasonInfo != null) result.seasonInfo = seasonInfo;
    return result;
  }

  FleetLeaderboardRsp._();

  factory FleetLeaderboardRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetLeaderboardRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetLeaderboardRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.info'),
      createEmptyInstance: create)
    ..pPM<$0.FleetBaseInfo>(1, _omitFieldNames ? '' : 'list',
        subBuilder: $0.FleetBaseInfo.create)
    ..aOB(2, _omitFieldNames ? '' : 'hasMore')
    ..aOM<$0.FleetBaseInfo>(3, _omitFieldNames ? '' : 'myFleet',
        subBuilder: $0.FleetBaseInfo.create)
    ..aI(4, _omitFieldNames ? '' : 'totalCoin', fieldType: $pb.PbFieldType.OU3)
    ..aOM<$0.FleetSeasonInfo>(5, _omitFieldNames ? '' : 'seasonInfo',
        subBuilder: $0.FleetSeasonInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetLeaderboardRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetLeaderboardRsp copyWith(void Function(FleetLeaderboardRsp) updates) =>
      super.copyWith((message) => updates(message as FleetLeaderboardRsp))
          as FleetLeaderboardRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetLeaderboardRsp create() => FleetLeaderboardRsp._();
  @$core.override
  FleetLeaderboardRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetLeaderboardRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetLeaderboardRsp>(create);
  static FleetLeaderboardRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.FleetBaseInfo> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get hasMore => $_getBF(1);
  @$pb.TagNumber(2)
  set hasMore($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasMore() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.FleetBaseInfo get myFleet => $_getN(2);
  @$pb.TagNumber(3)
  set myFleet($0.FleetBaseInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMyFleet() => $_has(2);
  @$pb.TagNumber(3)
  void clearMyFleet() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.FleetBaseInfo ensureMyFleet() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get totalCoin => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalCoin($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalCoin() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalCoin() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.FleetSeasonInfo get seasonInfo => $_getN(4);
  @$pb.TagNumber(5)
  set seasonInfo($0.FleetSeasonInfo value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasSeasonInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearSeasonInfo() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.FleetSeasonInfo ensureSeasonInfo() => $_ensure(4);
}

class FleetHomeRsp extends $pb.GeneratedMessage {
  factory FleetHomeRsp({
    $fixnum.Int64? currentRank,
    $0.FleetBaseInfo? fleetInfo,
    $0.FleetSeasonInfo? seasonInfo,
    $0.FleetShipyardInfo? shipyardInfo,
    $0.FleetDragonInfo? dragonInfo,
    $0.TreasureCoveInfo? treasureInfo,
    $core.Iterable<$core.String>? tips,
    BlazeCard? card,
  }) {
    final result = create();
    if (currentRank != null) result.currentRank = currentRank;
    if (fleetInfo != null) result.fleetInfo = fleetInfo;
    if (seasonInfo != null) result.seasonInfo = seasonInfo;
    if (shipyardInfo != null) result.shipyardInfo = shipyardInfo;
    if (dragonInfo != null) result.dragonInfo = dragonInfo;
    if (treasureInfo != null) result.treasureInfo = treasureInfo;
    if (tips != null) result.tips.addAll(tips);
    if (card != null) result.card = card;
    return result;
  }

  FleetHomeRsp._();

  factory FleetHomeRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetHomeRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetHomeRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.info'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'currentRank')
    ..aOM<$0.FleetBaseInfo>(2, _omitFieldNames ? '' : 'fleetInfo',
        subBuilder: $0.FleetBaseInfo.create)
    ..aOM<$0.FleetSeasonInfo>(3, _omitFieldNames ? '' : 'seasonInfo',
        subBuilder: $0.FleetSeasonInfo.create)
    ..aOM<$0.FleetShipyardInfo>(4, _omitFieldNames ? '' : 'shipyardInfo',
        subBuilder: $0.FleetShipyardInfo.create)
    ..aOM<$0.FleetDragonInfo>(5, _omitFieldNames ? '' : 'dragonInfo',
        subBuilder: $0.FleetDragonInfo.create)
    ..aOM<$0.TreasureCoveInfo>(6, _omitFieldNames ? '' : 'treasureInfo',
        subBuilder: $0.TreasureCoveInfo.create)
    ..pPS(7, _omitFieldNames ? '' : 'tips')
    ..aOM<BlazeCard>(8, _omitFieldNames ? '' : 'card',
        subBuilder: BlazeCard.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHomeRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHomeRsp copyWith(void Function(FleetHomeRsp) updates) =>
      super.copyWith((message) => updates(message as FleetHomeRsp))
          as FleetHomeRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetHomeRsp create() => FleetHomeRsp._();
  @$core.override
  FleetHomeRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetHomeRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetHomeRsp>(create);
  static FleetHomeRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get currentRank => $_getI64(0);
  @$pb.TagNumber(1)
  set currentRank($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCurrentRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentRank() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.FleetBaseInfo get fleetInfo => $_getN(1);
  @$pb.TagNumber(2)
  set fleetInfo($0.FleetBaseInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFleetInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearFleetInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.FleetBaseInfo ensureFleetInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.FleetSeasonInfo get seasonInfo => $_getN(2);
  @$pb.TagNumber(3)
  set seasonInfo($0.FleetSeasonInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSeasonInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeasonInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.FleetSeasonInfo ensureSeasonInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.FleetShipyardInfo get shipyardInfo => $_getN(3);
  @$pb.TagNumber(4)
  set shipyardInfo($0.FleetShipyardInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasShipyardInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearShipyardInfo() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.FleetShipyardInfo ensureShipyardInfo() => $_ensure(3);

  @$pb.TagNumber(5)
  $0.FleetDragonInfo get dragonInfo => $_getN(4);
  @$pb.TagNumber(5)
  set dragonInfo($0.FleetDragonInfo value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDragonInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearDragonInfo() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.FleetDragonInfo ensureDragonInfo() => $_ensure(4);

  @$pb.TagNumber(6)
  $0.TreasureCoveInfo get treasureInfo => $_getN(5);
  @$pb.TagNumber(6)
  set treasureInfo($0.TreasureCoveInfo value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasTreasureInfo() => $_has(5);
  @$pb.TagNumber(6)
  void clearTreasureInfo() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.TreasureCoveInfo ensureTreasureInfo() => $_ensure(5);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get tips => $_getList(6);

  @$pb.TagNumber(8)
  BlazeCard get card => $_getN(7);
  @$pb.TagNumber(8)
  set card(BlazeCard value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasCard() => $_has(7);
  @$pb.TagNumber(8)
  void clearCard() => $_clearField(8);
  @$pb.TagNumber(8)
  BlazeCard ensureCard() => $_ensure(7);
}

class FleetContributorItem extends $pb.GeneratedMessage {
  factory FleetContributorItem({
    $fixnum.Int64? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? gender,
    $core.int? fleetScore,
    $core.String? fleetRole,
    $core.int? rankIdx,
    $core.int? age,
    $core.int? starNum,
    $core.int? coinNum,
    $core.String? detail,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (gender != null) result.gender = gender;
    if (fleetScore != null) result.fleetScore = fleetScore;
    if (fleetRole != null) result.fleetRole = fleetRole;
    if (rankIdx != null) result.rankIdx = rankIdx;
    if (age != null) result.age = age;
    if (starNum != null) result.starNum = starNum;
    if (coinNum != null) result.coinNum = coinNum;
    if (detail != null) result.detail = detail;
    return result;
  }

  FleetContributorItem._();

  factory FleetContributorItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetContributorItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetContributorItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.info'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aOS(4, _omitFieldNames ? '' : 'gender')
    ..aI(5, _omitFieldNames ? '' : 'fleetScore', fieldType: $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'fleetRole')
    ..aI(7, _omitFieldNames ? '' : 'rankIdx', fieldType: $pb.PbFieldType.OU3)
    ..aI(8, _omitFieldNames ? '' : 'age', fieldType: $pb.PbFieldType.OU3)
    ..aI(9, _omitFieldNames ? '' : 'starNum', fieldType: $pb.PbFieldType.OU3)
    ..aI(10, _omitFieldNames ? '' : 'coinNum', fieldType: $pb.PbFieldType.OU3)
    ..aOS(11, _omitFieldNames ? '' : 'detail')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetContributorItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetContributorItem copyWith(void Function(FleetContributorItem) updates) =>
      super.copyWith((message) => updates(message as FleetContributorItem))
          as FleetContributorItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetContributorItem create() => FleetContributorItem._();
  @$core.override
  FleetContributorItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetContributorItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetContributorItem>(create);
  static FleetContributorItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

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
  $core.String get gender => $_getSZ(3);
  @$pb.TagNumber(4)
  set gender($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get fleetScore => $_getIZ(4);
  @$pb.TagNumber(5)
  set fleetScore($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFleetScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearFleetScore() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get fleetRole => $_getSZ(5);
  @$pb.TagNumber(6)
  set fleetRole($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasFleetRole() => $_has(5);
  @$pb.TagNumber(6)
  void clearFleetRole() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get rankIdx => $_getIZ(6);
  @$pb.TagNumber(7)
  set rankIdx($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRankIdx() => $_has(6);
  @$pb.TagNumber(7)
  void clearRankIdx() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get age => $_getIZ(7);
  @$pb.TagNumber(8)
  set age($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAge() => $_has(7);
  @$pb.TagNumber(8)
  void clearAge() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get starNum => $_getIZ(8);
  @$pb.TagNumber(9)
  set starNum($core.int value) => $_setUnsignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasStarNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearStarNum() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get coinNum => $_getIZ(9);
  @$pb.TagNumber(10)
  set coinNum($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCoinNum() => $_has(9);
  @$pb.TagNumber(10)
  void clearCoinNum() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get detail => $_getSZ(10);
  @$pb.TagNumber(11)
  set detail($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasDetail() => $_has(10);
  @$pb.TagNumber(11)
  void clearDetail() => $_clearField(11);
}

class FleetContributorRsp extends $pb.GeneratedMessage {
  factory FleetContributorRsp({
    $core.Iterable<FleetContributorItem>? list,
    $core.bool? hasMore,
    FleetContributorItem? meInfo,
    $0.FleetBaseInfo? fleetInfo,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (hasMore != null) result.hasMore = hasMore;
    if (meInfo != null) result.meInfo = meInfo;
    if (fleetInfo != null) result.fleetInfo = fleetInfo;
    return result;
  }

  FleetContributorRsp._();

  factory FleetContributorRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetContributorRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetContributorRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.info'),
      createEmptyInstance: create)
    ..pPM<FleetContributorItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: FleetContributorItem.create)
    ..aOB(2, _omitFieldNames ? '' : 'hasMore')
    ..aOM<FleetContributorItem>(3, _omitFieldNames ? '' : 'meInfo',
        subBuilder: FleetContributorItem.create)
    ..aOM<$0.FleetBaseInfo>(4, _omitFieldNames ? '' : 'fleetInfo',
        subBuilder: $0.FleetBaseInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetContributorRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetContributorRsp copyWith(void Function(FleetContributorRsp) updates) =>
      super.copyWith((message) => updates(message as FleetContributorRsp))
          as FleetContributorRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetContributorRsp create() => FleetContributorRsp._();
  @$core.override
  FleetContributorRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetContributorRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetContributorRsp>(create);
  static FleetContributorRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<FleetContributorItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get hasMore => $_getBF(1);
  @$pb.TagNumber(2)
  set hasMore($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasMore() => $_clearField(2);

  @$pb.TagNumber(3)
  FleetContributorItem get meInfo => $_getN(2);
  @$pb.TagNumber(3)
  set meInfo(FleetContributorItem value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMeInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearMeInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  FleetContributorItem ensureMeInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.FleetBaseInfo get fleetInfo => $_getN(3);
  @$pb.TagNumber(4)
  set fleetInfo($0.FleetBaseInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasFleetInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearFleetInfo() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.FleetBaseInfo ensureFleetInfo() => $_ensure(3);
}

class FleetRedStatusRsp extends $pb.GeneratedMessage {
  factory FleetRedStatusRsp({
    $core.bool? dragon,
    $core.bool? forge,
    $core.bool? reward,
    $0.FleetSeasonInfo? seasonInfo,
  }) {
    final result = create();
    if (dragon != null) result.dragon = dragon;
    if (forge != null) result.forge = forge;
    if (reward != null) result.reward = reward;
    if (seasonInfo != null) result.seasonInfo = seasonInfo;
    return result;
  }

  FleetRedStatusRsp._();

  factory FleetRedStatusRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetRedStatusRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetRedStatusRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.info'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'dragon')
    ..aOB(2, _omitFieldNames ? '' : 'forge')
    ..aOB(3, _omitFieldNames ? '' : 'reward')
    ..aOM<$0.FleetSeasonInfo>(4, _omitFieldNames ? '' : 'seasonInfo',
        subBuilder: $0.FleetSeasonInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRedStatusRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetRedStatusRsp copyWith(void Function(FleetRedStatusRsp) updates) =>
      super.copyWith((message) => updates(message as FleetRedStatusRsp))
          as FleetRedStatusRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetRedStatusRsp create() => FleetRedStatusRsp._();
  @$core.override
  FleetRedStatusRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetRedStatusRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetRedStatusRsp>(create);
  static FleetRedStatusRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get dragon => $_getBF(0);
  @$pb.TagNumber(1)
  set dragon($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDragon() => $_has(0);
  @$pb.TagNumber(1)
  void clearDragon() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get forge => $_getBF(1);
  @$pb.TagNumber(2)
  set forge($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasForge() => $_has(1);
  @$pb.TagNumber(2)
  void clearForge() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get reward => $_getBF(2);
  @$pb.TagNumber(3)
  set reward($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReward() => $_has(2);
  @$pb.TagNumber(3)
  void clearReward() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.FleetSeasonInfo get seasonInfo => $_getN(3);
  @$pb.TagNumber(4)
  set seasonInfo($0.FleetSeasonInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasSeasonInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearSeasonInfo() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.FleetSeasonInfo ensureSeasonInfo() => $_ensure(3);
}

class BlazeCardRsp extends $pb.GeneratedMessage {
  factory BlazeCardRsp({
    BlazeCard? card,
  }) {
    final result = create();
    if (card != null) result.card = card;
    return result;
  }

  BlazeCardRsp._();

  factory BlazeCardRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlazeCardRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlazeCardRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.info'),
      createEmptyInstance: create)
    ..aOM<BlazeCard>(1, _omitFieldNames ? '' : 'card',
        subBuilder: BlazeCard.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlazeCardRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlazeCardRsp copyWith(void Function(BlazeCardRsp) updates) =>
      super.copyWith((message) => updates(message as BlazeCardRsp))
          as BlazeCardRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlazeCardRsp create() => BlazeCardRsp._();
  @$core.override
  BlazeCardRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlazeCardRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BlazeCardRsp>(create);
  static BlazeCardRsp? _defaultInstance;

  /// 卡片信息
  @$pb.TagNumber(1)
  BlazeCard get card => $_getN(0);
  @$pb.TagNumber(1)
  set card(BlazeCard value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCard() => $_has(0);
  @$pb.TagNumber(1)
  void clearCard() => $_clearField(1);
  @$pb.TagNumber(1)
  BlazeCard ensureCard() => $_ensure(0);
}

class ActiveBlazeCardReq extends $pb.GeneratedMessage {
  factory ActiveBlazeCardReq({
    $core.int? quantity,
    $fixnum.Int64? seasonId,
    $fixnum.Int64? fleetId,
  }) {
    final result = create();
    if (quantity != null) result.quantity = quantity;
    if (seasonId != null) result.seasonId = seasonId;
    if (fleetId != null) result.fleetId = fleetId;
    return result;
  }

  ActiveBlazeCardReq._();

  factory ActiveBlazeCardReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ActiveBlazeCardReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActiveBlazeCardReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.info'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'quantity', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'seasonId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'fleetId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActiveBlazeCardReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActiveBlazeCardReq copyWith(void Function(ActiveBlazeCardReq) updates) =>
      super.copyWith((message) => updates(message as ActiveBlazeCardReq))
          as ActiveBlazeCardReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActiveBlazeCardReq create() => ActiveBlazeCardReq._();
  @$core.override
  ActiveBlazeCardReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ActiveBlazeCardReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActiveBlazeCardReq>(create);
  static ActiveBlazeCardReq? _defaultInstance;

  /// 激活数量，默认1
  @$pb.TagNumber(1)
  $core.int get quantity => $_getIZ(0);
  @$pb.TagNumber(1)
  set quantity($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuantity() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuantity() => $_clearField(1);

  /// 赛季ID
  @$pb.TagNumber(2)
  $fixnum.Int64 get seasonId => $_getI64(1);
  @$pb.TagNumber(2)
  set seasonId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSeasonId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeasonId() => $_clearField(2);

  /// 舰队ID
  @$pb.TagNumber(3)
  $fixnum.Int64 get fleetId => $_getI64(2);
  @$pb.TagNumber(3)
  set fleetId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFleetId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFleetId() => $_clearField(3);
}

class ActiveBlazeCardRsp extends $pb.GeneratedMessage {
  factory ActiveBlazeCardRsp({
    $core.int? countdownSeconds,
  }) {
    final result = create();
    if (countdownSeconds != null) result.countdownSeconds = countdownSeconds;
    return result;
  }

  ActiveBlazeCardRsp._();

  factory ActiveBlazeCardRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ActiveBlazeCardRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActiveBlazeCardRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.info'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'countdownSeconds',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActiveBlazeCardRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActiveBlazeCardRsp copyWith(void Function(ActiveBlazeCardRsp) updates) =>
      super.copyWith((message) => updates(message as ActiveBlazeCardRsp))
          as ActiveBlazeCardRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActiveBlazeCardRsp create() => ActiveBlazeCardRsp._();
  @$core.override
  ActiveBlazeCardRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ActiveBlazeCardRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActiveBlazeCardRsp>(create);
  static ActiveBlazeCardRsp? _defaultInstance;

  /// 倒计时秒数
  @$pb.TagNumber(1)
  $core.int get countdownSeconds => $_getIZ(0);
  @$pb.TagNumber(1)
  set countdownSeconds($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCountdownSeconds() => $_has(0);
  @$pb.TagNumber(1)
  void clearCountdownSeconds() => $_clearField(1);
}

class BlazeCard extends $pb.GeneratedMessage {
  factory BlazeCard({
    $core.int? quantity,
    $core.int? countdownSeconds,
    $core.int? validityDurationSeconds,
  }) {
    final result = create();
    if (quantity != null) result.quantity = quantity;
    if (countdownSeconds != null) result.countdownSeconds = countdownSeconds;
    if (validityDurationSeconds != null)
      result.validityDurationSeconds = validityDurationSeconds;
    return result;
  }

  BlazeCard._();

  factory BlazeCard.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlazeCard.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlazeCard',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.info'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'quantity', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'countdownSeconds',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'validityDurationSeconds',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlazeCard clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlazeCard copyWith(void Function(BlazeCard) updates) =>
      super.copyWith((message) => updates(message as BlazeCard)) as BlazeCard;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlazeCard create() => BlazeCard._();
  @$core.override
  BlazeCard createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlazeCard getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlazeCard>(create);
  static BlazeCard? _defaultInstance;

  /// 数量
  @$pb.TagNumber(1)
  $core.int get quantity => $_getIZ(0);
  @$pb.TagNumber(1)
  set quantity($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuantity() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuantity() => $_clearField(1);

  /// 倒计时秒数
  @$pb.TagNumber(2)
  $core.int get countdownSeconds => $_getIZ(1);
  @$pb.TagNumber(2)
  set countdownSeconds($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCountdownSeconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearCountdownSeconds() => $_clearField(2);

  /// 卡片有效秒数
  @$pb.TagNumber(3)
  $core.int get validityDurationSeconds => $_getIZ(2);
  @$pb.TagNumber(3)
  set validityDurationSeconds($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValidityDurationSeconds() => $_has(2);
  @$pb.TagNumber(3)
  void clearValidityDurationSeconds() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

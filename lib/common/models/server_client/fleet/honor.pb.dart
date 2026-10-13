// This is a generated file - do not edit.
//
// Generated from server_client/fleet/honor.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 最强船长 响应
class FleetHonorGrandResp extends $pb.GeneratedMessage {
  factory FleetHonorGrandResp({
    $core.Iterable<FleetHonorItem>? items,
    FleetHonorConfig? config,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    if (config != null) result.config = config;
    return result;
  }

  FleetHonorGrandResp._();

  factory FleetHonorGrandResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetHonorGrandResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetHonorGrandResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.honor'),
      createEmptyInstance: create)
    ..pPM<FleetHonorItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: FleetHonorItem.create)
    ..aOM<FleetHonorConfig>(2, _omitFieldNames ? '' : 'config',
        subBuilder: FleetHonorConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHonorGrandResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHonorGrandResp copyWith(void Function(FleetHonorGrandResp) updates) =>
      super.copyWith((message) => updates(message as FleetHonorGrandResp))
          as FleetHonorGrandResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetHonorGrandResp create() => FleetHonorGrandResp._();
  @$core.override
  FleetHonorGrandResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetHonorGrandResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetHonorGrandResp>(create);
  static FleetHonorGrandResp? _defaultInstance;

  /// 船长清单
  @$pb.TagNumber(1)
  $pb.PbList<FleetHonorItem> get items => $_getList(0);

  /// 相关配置信息
  @$pb.TagNumber(2)
  FleetHonorConfig get config => $_getN(1);
  @$pb.TagNumber(2)
  set config(FleetHonorConfig value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasConfig() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfig() => $_clearField(2);
  @$pb.TagNumber(2)
  FleetHonorConfig ensureConfig() => $_ensure(1);
}

class FleetHonorConfig extends $pb.GeneratedMessage {
  factory FleetHonorConfig({
    $core.Iterable<FleetHonorReward>? rewards,
  }) {
    final result = create();
    if (rewards != null) result.rewards.addAll(rewards);
    return result;
  }

  FleetHonorConfig._();

  factory FleetHonorConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetHonorConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetHonorConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.honor'),
      createEmptyInstance: create)
    ..pPM<FleetHonorReward>(1, _omitFieldNames ? '' : 'rewards',
        subBuilder: FleetHonorReward.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHonorConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHonorConfig copyWith(void Function(FleetHonorConfig) updates) =>
      super.copyWith((message) => updates(message as FleetHonorConfig))
          as FleetHonorConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetHonorConfig create() => FleetHonorConfig._();
  @$core.override
  FleetHonorConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetHonorConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetHonorConfig>(create);
  static FleetHonorConfig? _defaultInstance;

  /// 最强船长 的默认奖品清单
  @$pb.TagNumber(1)
  $pb.PbList<FleetHonorReward> get rewards => $_getList(0);
}

class FleetHonorReward extends $pb.GeneratedMessage {
  factory FleetHonorReward({
    $core.String? icon,
    $core.String? name,
  }) {
    final result = create();
    if (icon != null) result.icon = icon;
    if (name != null) result.name = name;
    return result;
  }

  FleetHonorReward._();

  factory FleetHonorReward.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetHonorReward.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetHonorReward',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.honor'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'icon')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHonorReward clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHonorReward copyWith(void Function(FleetHonorReward) updates) =>
      super.copyWith((message) => updates(message as FleetHonorReward))
          as FleetHonorReward;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetHonorReward create() => FleetHonorReward._();
  @$core.override
  FleetHonorReward createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetHonorReward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetHonorReward>(create);
  static FleetHonorReward? _defaultInstance;

  /// 最强船长 的默认奖品图标
  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => $_clearField(1);

  /// 最强船长 的默认奖品名称
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);
}

class FleetHonorItem extends $pb.GeneratedMessage {
  factory FleetHonorItem({
    FleetHonorSeason? season,
    FleetInfo? fleetInfo,
    FleetHonorCaptain? captain,
  }) {
    final result = create();
    if (season != null) result.season = season;
    if (fleetInfo != null) result.fleetInfo = fleetInfo;
    if (captain != null) result.captain = captain;
    return result;
  }

  FleetHonorItem._();

  factory FleetHonorItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetHonorItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetHonorItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.honor'),
      createEmptyInstance: create)
    ..aOM<FleetHonorSeason>(1, _omitFieldNames ? '' : 'season',
        subBuilder: FleetHonorSeason.create)
    ..aOM<FleetInfo>(2, _omitFieldNames ? '' : 'fleetInfo',
        subBuilder: FleetInfo.create)
    ..aOM<FleetHonorCaptain>(3, _omitFieldNames ? '' : 'captain',
        subBuilder: FleetHonorCaptain.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHonorItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHonorItem copyWith(void Function(FleetHonorItem) updates) =>
      super.copyWith((message) => updates(message as FleetHonorItem))
          as FleetHonorItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetHonorItem create() => FleetHonorItem._();
  @$core.override
  FleetHonorItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetHonorItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetHonorItem>(create);
  static FleetHonorItem? _defaultInstance;

  /// 赛季信息
  @$pb.TagNumber(1)
  FleetHonorSeason get season => $_getN(0);
  @$pb.TagNumber(1)
  set season(FleetHonorSeason value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSeason() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeason() => $_clearField(1);
  @$pb.TagNumber(1)
  FleetHonorSeason ensureSeason() => $_ensure(0);

  /// 舰队信息
  @$pb.TagNumber(2)
  FleetInfo get fleetInfo => $_getN(1);
  @$pb.TagNumber(2)
  set fleetInfo(FleetInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFleetInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearFleetInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  FleetInfo ensureFleetInfo() => $_ensure(1);

  /// 可能为null，判定后显示 FleetHonorGrandConfig.rewards
  @$pb.TagNumber(3)
  FleetHonorCaptain get captain => $_getN(2);
  @$pb.TagNumber(3)
  set captain(FleetHonorCaptain value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCaptain() => $_has(2);
  @$pb.TagNumber(3)
  void clearCaptain() => $_clearField(3);
  @$pb.TagNumber(3)
  FleetHonorCaptain ensureCaptain() => $_ensure(2);
}

/// 赛季信息
class FleetHonorSeason extends $pb.GeneratedMessage {
  factory FleetHonorSeason({
    $fixnum.Int64? seasonId,
    $core.String? seasonName,
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
  }) {
    final result = create();
    if (seasonId != null) result.seasonId = seasonId;
    if (seasonName != null) result.seasonName = seasonName;
    if (startTime != null) result.startTime = startTime;
    if (endTime != null) result.endTime = endTime;
    return result;
  }

  FleetHonorSeason._();

  factory FleetHonorSeason.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetHonorSeason.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetHonorSeason',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.honor'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'seasonId')
    ..aOS(2, _omitFieldNames ? '' : 'seasonName')
    ..aInt64(3, _omitFieldNames ? '' : 'startTime')
    ..aInt64(4, _omitFieldNames ? '' : 'endTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHonorSeason clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHonorSeason copyWith(void Function(FleetHonorSeason) updates) =>
      super.copyWith((message) => updates(message as FleetHonorSeason))
          as FleetHonorSeason;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetHonorSeason create() => FleetHonorSeason._();
  @$core.override
  FleetHonorSeason createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetHonorSeason getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetHonorSeason>(create);
  static FleetHonorSeason? _defaultInstance;

  /// 赛季id 例如 15
  @$pb.TagNumber(1)
  $fixnum.Int64 get seasonId => $_getI64(0);
  @$pb.TagNumber(1)
  set seasonId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSeasonId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeasonId() => $_clearField(1);

  /// 赛季名称 例如  Season 28
  @$pb.TagNumber(2)
  $core.String get seasonName => $_getSZ(1);
  @$pb.TagNumber(2)
  set seasonName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSeasonName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeasonName() => $_clearField(2);

  /// 赛季开始时间 时间戳
  @$pb.TagNumber(3)
  $fixnum.Int64 get startTime => $_getI64(2);
  @$pb.TagNumber(3)
  set startTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStartTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartTime() => $_clearField(3);

  /// 赛季结束时间 时间戳
  @$pb.TagNumber(4)
  $fixnum.Int64 get endTime => $_getI64(3);
  @$pb.TagNumber(4)
  set endTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEndTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndTime() => $_clearField(4);
}

/// 船长信息
class FleetHonorCaptain extends $pb.GeneratedMessage {
  factory FleetHonorCaptain({
    $core.int? honorId,
    $fixnum.Int64? uid,
    $core.String? nickName,
    $core.String? avatar,
    $core.String? gender,
    $core.int? age,
    $core.int? vipLevel,
    $core.String? vipIcon,
    $core.int? knightLevel,
    $core.String? knightIcon,
    $core.int? seasonScore,
    $core.int? grand,
  }) {
    final result = create();
    if (honorId != null) result.honorId = honorId;
    if (uid != null) result.uid = uid;
    if (nickName != null) result.nickName = nickName;
    if (avatar != null) result.avatar = avatar;
    if (gender != null) result.gender = gender;
    if (age != null) result.age = age;
    if (vipLevel != null) result.vipLevel = vipLevel;
    if (vipIcon != null) result.vipIcon = vipIcon;
    if (knightLevel != null) result.knightLevel = knightLevel;
    if (knightIcon != null) result.knightIcon = knightIcon;
    if (seasonScore != null) result.seasonScore = seasonScore;
    if (grand != null) result.grand = grand;
    return result;
  }

  FleetHonorCaptain._();

  factory FleetHonorCaptain.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetHonorCaptain.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetHonorCaptain',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.honor'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'honorId')
    ..aInt64(2, _omitFieldNames ? '' : 'uid')
    ..aOS(3, _omitFieldNames ? '' : 'nickName')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..aOS(5, _omitFieldNames ? '' : 'gender')
    ..aI(6, _omitFieldNames ? '' : 'age', fieldType: $pb.PbFieldType.OU3)
    ..aI(7, _omitFieldNames ? '' : 'vipLevel')
    ..aOS(8, _omitFieldNames ? '' : 'vipIcon')
    ..aI(9, _omitFieldNames ? '' : 'knightLevel')
    ..aOS(10, _omitFieldNames ? '' : 'knightIcon')
    ..aI(11, _omitFieldNames ? '' : 'seasonScore')
    ..aI(12, _omitFieldNames ? '' : 'grand')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHonorCaptain clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHonorCaptain copyWith(void Function(FleetHonorCaptain) updates) =>
      super.copyWith((message) => updates(message as FleetHonorCaptain))
          as FleetHonorCaptain;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetHonorCaptain create() => FleetHonorCaptain._();
  @$core.override
  FleetHonorCaptain createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetHonorCaptain getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetHonorCaptain>(create);
  static FleetHonorCaptain? _defaultInstance;

  /// tb_fleet_honor.id 冗余字段
  @$pb.TagNumber(1)
  $core.int get honorId => $_getIZ(0);
  @$pb.TagNumber(1)
  set honorId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHonorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHonorId() => $_clearField(1);

  /// uid
  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  /// 昵称
  @$pb.TagNumber(3)
  $core.String get nickName => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickName() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickName() => $_clearField(3);

  /// 头像http网址
  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatar($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatar() => $_clearField(4);

  /// 性别 male female
  @$pb.TagNumber(5)
  $core.String get gender => $_getSZ(4);
  @$pb.TagNumber(5)
  set gender($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGender() => $_has(4);
  @$pb.TagNumber(5)
  void clearGender() => $_clearField(5);

  /// 年龄
  @$pb.TagNumber(6)
  $core.int get age => $_getIZ(5);
  @$pb.TagNumber(6)
  set age($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAge() => $_has(5);
  @$pb.TagNumber(6)
  void clearAge() => $_clearField(6);

  /// 等级
  @$pb.TagNumber(7)
  $core.int get vipLevel => $_getIZ(6);
  @$pb.TagNumber(7)
  set vipLevel($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasVipLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearVipLevel() => $_clearField(7);

  /// 等级图标
  @$pb.TagNumber(8)
  $core.String get vipIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set vipIcon($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasVipIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearVipIcon() => $_clearField(8);

  /// 爵位等级
  @$pb.TagNumber(9)
  $core.int get knightLevel => $_getIZ(8);
  @$pb.TagNumber(9)
  set knightLevel($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasKnightLevel() => $_has(8);
  @$pb.TagNumber(9)
  void clearKnightLevel() => $_clearField(9);

  /// 爵位图标
  @$pb.TagNumber(10)
  $core.String get knightIcon => $_getSZ(9);
  @$pb.TagNumber(10)
  set knightIcon($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasKnightIcon() => $_has(9);
  @$pb.TagNumber(10)
  void clearKnightIcon() => $_clearField(10);

  /// 船长在赛季中获得的贡献值
  @$pb.TagNumber(11)
  $core.int get seasonScore => $_getIZ(10);
  @$pb.TagNumber(11)
  set seasonScore($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasSeasonScore() => $_has(10);
  @$pb.TagNumber(11)
  void clearSeasonScore() => $_clearField(11);

  /// 是否最强船长, 0否 1是
  @$pb.TagNumber(12)
  $core.int get grand => $_getIZ(11);
  @$pb.TagNumber(12)
  set grand($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasGrand() => $_has(11);
  @$pb.TagNumber(12)
  void clearGrand() => $_clearField(12);
}

/// 舰队信息
class FleetInfo extends $pb.GeneratedMessage {
  factory FleetInfo({
    $fixnum.Int64? fleetId,
    $core.String? fleetName,
    $core.int? fleetLevel,
  }) {
    final result = create();
    if (fleetId != null) result.fleetId = fleetId;
    if (fleetName != null) result.fleetName = fleetName;
    if (fleetLevel != null) result.fleetLevel = fleetLevel;
    return result;
  }

  FleetInfo._();

  factory FleetInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.honor'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'fleetId')
    ..aOS(2, _omitFieldNames ? '' : 'fleetName')
    ..aI(3, _omitFieldNames ? '' : 'fleetLevel')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetInfo copyWith(void Function(FleetInfo) updates) =>
      super.copyWith((message) => updates(message as FleetInfo)) as FleetInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetInfo create() => FleetInfo._();
  @$core.override
  FleetInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FleetInfo>(create);
  static FleetInfo? _defaultInstance;

  /// 舰队id
  @$pb.TagNumber(1)
  $fixnum.Int64 get fleetId => $_getI64(0);
  @$pb.TagNumber(1)
  set fleetId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFleetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFleetId() => $_clearField(1);

  /// 舰队名称
  @$pb.TagNumber(2)
  $core.String get fleetName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fleetName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFleetName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFleetName() => $_clearField(2);

  /// 舰队等级
  @$pb.TagNumber(3)
  $core.int get fleetLevel => $_getIZ(2);
  @$pb.TagNumber(3)
  set fleetLevel($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFleetLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearFleetLevel() => $_clearField(3);
}

/// 荣誉大厅 响应
class FleetHonorHallResp extends $pb.GeneratedMessage {
  factory FleetHonorHallResp({
    $core.Iterable<FleetHonorItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  FleetHonorHallResp._();

  factory FleetHonorHallResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetHonorHallResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetHonorHallResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.honor'),
      createEmptyInstance: create)
    ..pPM<FleetHonorItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: FleetHonorItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHonorHallResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetHonorHallResp copyWith(void Function(FleetHonorHallResp) updates) =>
      super.copyWith((message) => updates(message as FleetHonorHallResp))
          as FleetHonorHallResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetHonorHallResp create() => FleetHonorHallResp._();
  @$core.override
  FleetHonorHallResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetHonorHallResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetHonorHallResp>(create);
  static FleetHonorHallResp? _defaultInstance;

  /// 船长清单
  @$pb.TagNumber(1)
  $pb.PbList<FleetHonorItem> get items => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

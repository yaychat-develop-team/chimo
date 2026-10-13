// This is a generated file - do not edit.
//
// Generated from server_client/crate_rush.proto.

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

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 简单用户信息
class SimpleUser extends $pb.GeneratedMessage {
  factory SimpleUser({
    $fixnum.Int64? uid,
    $core.String? nickname,
    $core.String? avatar,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    return result;
  }

  SimpleUser._();

  factory SimpleUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SimpleUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SimpleUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleUser copyWith(void Function(SimpleUser) updates) =>
      super.copyWith((message) => updates(message as SimpleUser)) as SimpleUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SimpleUser create() => SimpleUser._();
  @$core.override
  SimpleUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SimpleUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SimpleUser>(create);
  static SimpleUser? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);
}

/// 盲盒奖品信息
class CrateGiftItem extends $pb.GeneratedMessage {
  factory CrateGiftItem({
    $fixnum.Int64? itemId,
    $core.String? name,
    $core.String? icon,
    $fixnum.Int64? price,
    $core.String? dynamicResource,
    $core.bool? isSpecial,
    $core.String? probability,
  }) {
    final result = create();
    if (itemId != null) result.itemId = itemId;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (price != null) result.price = price;
    if (dynamicResource != null) result.dynamicResource = dynamicResource;
    if (isSpecial != null) result.isSpecial = isSpecial;
    if (probability != null) result.probability = probability;
    return result;
  }

  CrateGiftItem._();

  factory CrateGiftItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CrateGiftItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CrateGiftItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'itemId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aInt64(4, _omitFieldNames ? '' : 'price')
    ..aOS(5, _omitFieldNames ? '' : 'dynamicResource')
    ..aOB(6, _omitFieldNames ? '' : 'isSpecial')
    ..aOS(7, _omitFieldNames ? '' : 'probability')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateGiftItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateGiftItem copyWith(void Function(CrateGiftItem) updates) =>
      super.copyWith((message) => updates(message as CrateGiftItem))
          as CrateGiftItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CrateGiftItem create() => CrateGiftItem._();
  @$core.override
  CrateGiftItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CrateGiftItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CrateGiftItem>(create);
  static CrateGiftItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get itemId => $_getI64(0);
  @$pb.TagNumber(1)
  set itemId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItemId() => $_has(0);
  @$pb.TagNumber(1)
  void clearItemId() => $_clearField(1);

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
  $fixnum.Int64 get price => $_getI64(3);
  @$pb.TagNumber(4)
  set price($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get dynamicResource => $_getSZ(4);
  @$pb.TagNumber(5)
  set dynamicResource($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDynamicResource() => $_has(4);
  @$pb.TagNumber(5)
  void clearDynamicResource() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isSpecial => $_getBF(5);
  @$pb.TagNumber(6)
  set isSpecial($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsSpecial() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsSpecial() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get probability => $_getSZ(6);
  @$pb.TagNumber(7)
  set probability($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasProbability() => $_has(6);
  @$pb.TagNumber(7)
  void clearProbability() => $_clearField(7);
}

/// 盲盒排行榜用户项
class CrateRankItem extends $pb.GeneratedMessage {
  factory CrateRankItem({
    $core.int? rank,
    SimpleUser? user,
    $fixnum.Int64? score,
  }) {
    final result = create();
    if (rank != null) result.rank = rank;
    if (user != null) result.user = user;
    if (score != null) result.score = score;
    return result;
  }

  CrateRankItem._();

  factory CrateRankItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CrateRankItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CrateRankItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'rank')
    ..aOM<SimpleUser>(2, _omitFieldNames ? '' : 'user',
        subBuilder: SimpleUser.create)
    ..aInt64(3, _omitFieldNames ? '' : 'score')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateRankItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateRankItem copyWith(void Function(CrateRankItem) updates) =>
      super.copyWith((message) => updates(message as CrateRankItem))
          as CrateRankItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CrateRankItem create() => CrateRankItem._();
  @$core.override
  CrateRankItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CrateRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CrateRankItem>(create);
  static CrateRankItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rank => $_getIZ(0);
  @$pb.TagNumber(1)
  set rank($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearRank() => $_clearField(1);

  @$pb.TagNumber(2)
  SimpleUser get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(SimpleUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => $_clearField(2);
  @$pb.TagNumber(2)
  SimpleUser ensureUser() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get score => $_getI64(2);
  @$pb.TagNumber(3)
  set score($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => $_clearField(3);
}

/// 盒子页面全量响应
class CrateBoxPageRsp extends $pb.GeneratedMessage {
  factory CrateBoxPageRsp({
    CrateBoxConfig? config,
    $core.Iterable<CrateGiftItem>? prizePool,
    RoundInfo? round,
    UserProgress? userProgress,
    $core.Iterable<LuckyWinnerItem>? luckyWinners,
  }) {
    final result = create();
    if (config != null) result.config = config;
    if (prizePool != null) result.prizePool.addAll(prizePool);
    if (round != null) result.round = round;
    if (userProgress != null) result.userProgress = userProgress;
    if (luckyWinners != null) result.luckyWinners.addAll(luckyWinners);
    return result;
  }

  CrateBoxPageRsp._();

  factory CrateBoxPageRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CrateBoxPageRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CrateBoxPageRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aOM<CrateBoxConfig>(1, _omitFieldNames ? '' : 'config',
        subBuilder: CrateBoxConfig.create)
    ..pPM<CrateGiftItem>(2, _omitFieldNames ? '' : 'prizePool',
        subBuilder: CrateGiftItem.create)
    ..aOM<RoundInfo>(3, _omitFieldNames ? '' : 'round',
        subBuilder: RoundInfo.create)
    ..aOM<UserProgress>(4, _omitFieldNames ? '' : 'userProgress',
        subBuilder: UserProgress.create)
    ..pPM<LuckyWinnerItem>(5, _omitFieldNames ? '' : 'luckyWinners',
        subBuilder: LuckyWinnerItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateBoxPageRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateBoxPageRsp copyWith(void Function(CrateBoxPageRsp) updates) =>
      super.copyWith((message) => updates(message as CrateBoxPageRsp))
          as CrateBoxPageRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CrateBoxPageRsp create() => CrateBoxPageRsp._();
  @$core.override
  CrateBoxPageRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CrateBoxPageRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CrateBoxPageRsp>(create);
  static CrateBoxPageRsp? _defaultInstance;

  @$pb.TagNumber(1)
  CrateBoxConfig get config => $_getN(0);
  @$pb.TagNumber(1)
  set config(CrateBoxConfig value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasConfig() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfig() => $_clearField(1);
  @$pb.TagNumber(1)
  CrateBoxConfig ensureConfig() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<CrateGiftItem> get prizePool => $_getList(1);

  @$pb.TagNumber(3)
  RoundInfo get round => $_getN(2);
  @$pb.TagNumber(3)
  set round(RoundInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRound() => $_has(2);
  @$pb.TagNumber(3)
  void clearRound() => $_clearField(3);
  @$pb.TagNumber(3)
  RoundInfo ensureRound() => $_ensure(2);

  @$pb.TagNumber(4)
  UserProgress get userProgress => $_getN(3);
  @$pb.TagNumber(4)
  set userProgress(UserProgress value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasUserProgress() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserProgress() => $_clearField(4);
  @$pb.TagNumber(4)
  UserProgress ensureUserProgress() => $_ensure(3);

  @$pb.TagNumber(5)
  $pb.PbList<LuckyWinnerItem> get luckyWinners => $_getList(4);
}

/// 盲盒配置
class CrateBoxConfig extends $pb.GeneratedMessage {
  factory CrateBoxConfig({
    $core.String? crateType,
    $core.Iterable<DrawOption>? drawOptions,
  }) {
    final result = create();
    if (crateType != null) result.crateType = crateType;
    if (drawOptions != null) result.drawOptions.addAll(drawOptions);
    return result;
  }

  CrateBoxConfig._();

  factory CrateBoxConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CrateBoxConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CrateBoxConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'crateType')
    ..pPM<DrawOption>(2, _omitFieldNames ? '' : 'drawOptions',
        subBuilder: DrawOption.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateBoxConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateBoxConfig copyWith(void Function(CrateBoxConfig) updates) =>
      super.copyWith((message) => updates(message as CrateBoxConfig))
          as CrateBoxConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CrateBoxConfig create() => CrateBoxConfig._();
  @$core.override
  CrateBoxConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CrateBoxConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CrateBoxConfig>(create);
  static CrateBoxConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get crateType => $_getSZ(0);
  @$pb.TagNumber(1)
  set crateType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCrateType() => $_has(0);
  @$pb.TagNumber(1)
  void clearCrateType() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<DrawOption> get drawOptions => $_getList(1);
}

/// 抽奖选项配置
class DrawOption extends $pb.GeneratedMessage {
  factory DrawOption({
    $fixnum.Int64? configId,
    $core.int? count,
    $fixnum.Int64? price,
  }) {
    final result = create();
    if (configId != null) result.configId = configId;
    if (count != null) result.count = count;
    if (price != null) result.price = price;
    return result;
  }

  DrawOption._();

  factory DrawOption.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DrawOption.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DrawOption',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'configId')
    ..aI(2, _omitFieldNames ? '' : 'count')
    ..aInt64(3, _omitFieldNames ? '' : 'price')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawOption clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawOption copyWith(void Function(DrawOption) updates) =>
      super.copyWith((message) => updates(message as DrawOption)) as DrawOption;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DrawOption create() => DrawOption._();
  @$core.override
  DrawOption createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DrawOption getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrawOption>(create);
  static DrawOption? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get configId => $_getI64(0);
  @$pb.TagNumber(1)
  set configId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConfigId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfigId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get price => $_getI64(2);
  @$pb.TagNumber(3)
  set price($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => $_clearField(3);
}

/// 轮次信息
class RoundInfo extends $pb.GeneratedMessage {
  factory RoundInfo({
    $core.String? phase,
    $fixnum.Int64? phaseEndTime,
    $fixnum.Int64? serverTime,
    ChallengeLeader? leader,
    BonusKingInfo? bonusKing,
  }) {
    final result = create();
    if (phase != null) result.phase = phase;
    if (phaseEndTime != null) result.phaseEndTime = phaseEndTime;
    if (serverTime != null) result.serverTime = serverTime;
    if (leader != null) result.leader = leader;
    if (bonusKing != null) result.bonusKing = bonusKing;
    return result;
  }

  RoundInfo._();

  factory RoundInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoundInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoundInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'phase')
    ..aInt64(2, _omitFieldNames ? '' : 'phaseEndTime')
    ..aInt64(3, _omitFieldNames ? '' : 'serverTime')
    ..aOM<ChallengeLeader>(4, _omitFieldNames ? '' : 'leader',
        subBuilder: ChallengeLeader.create)
    ..aOM<BonusKingInfo>(5, _omitFieldNames ? '' : 'bonusKing',
        subBuilder: BonusKingInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoundInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoundInfo copyWith(void Function(RoundInfo) updates) =>
      super.copyWith((message) => updates(message as RoundInfo)) as RoundInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoundInfo create() => RoundInfo._();
  @$core.override
  RoundInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoundInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoundInfo>(create);
  static RoundInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phase => $_getSZ(0);
  @$pb.TagNumber(1)
  set phase($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPhase() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhase() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get phaseEndTime => $_getI64(1);
  @$pb.TagNumber(2)
  set phaseEndTime($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPhaseEndTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhaseEndTime() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get serverTime => $_getI64(2);
  @$pb.TagNumber(3)
  set serverTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasServerTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearServerTime() => $_clearField(3);

  @$pb.TagNumber(4)
  ChallengeLeader get leader => $_getN(3);
  @$pb.TagNumber(4)
  set leader(ChallengeLeader value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasLeader() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeader() => $_clearField(4);
  @$pb.TagNumber(4)
  ChallengeLeader ensureLeader() => $_ensure(3);

  @$pb.TagNumber(5)
  BonusKingInfo get bonusKing => $_getN(4);
  @$pb.TagNumber(5)
  set bonusKing(BonusKingInfo value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasBonusKing() => $_has(4);
  @$pb.TagNumber(5)
  void clearBonusKing() => $_clearField(5);
  @$pb.TagNumber(5)
  BonusKingInfo ensureBonusKing() => $_ensure(4);
}

/// Lucky Challenge 获奖者
class ChallengeLeader extends $pb.GeneratedMessage {
  factory ChallengeLeader({
    SimpleUser? user,
    CrateGiftItem? item,
    CrateGiftItem? topGift,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (item != null) result.item = item;
    if (topGift != null) result.topGift = topGift;
    return result;
  }

  ChallengeLeader._();

  factory ChallengeLeader.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChallengeLeader.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChallengeLeader',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aOM<SimpleUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: SimpleUser.create)
    ..aOM<CrateGiftItem>(2, _omitFieldNames ? '' : 'item',
        subBuilder: CrateGiftItem.create)
    ..aOM<CrateGiftItem>(3, _omitFieldNames ? '' : 'topGift',
        subBuilder: CrateGiftItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChallengeLeader clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChallengeLeader copyWith(void Function(ChallengeLeader) updates) =>
      super.copyWith((message) => updates(message as ChallengeLeader))
          as ChallengeLeader;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChallengeLeader create() => ChallengeLeader._();
  @$core.override
  ChallengeLeader createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChallengeLeader getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChallengeLeader>(create);
  static ChallengeLeader? _defaultInstance;

  @$pb.TagNumber(1)
  SimpleUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(SimpleUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  SimpleUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  CrateGiftItem get item => $_getN(1);
  @$pb.TagNumber(2)
  set item(CrateGiftItem value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasItem() => $_has(1);
  @$pb.TagNumber(2)
  void clearItem() => $_clearField(2);
  @$pb.TagNumber(2)
  CrateGiftItem ensureItem() => $_ensure(1);

  @$pb.TagNumber(3)
  CrateGiftItem get topGift => $_getN(2);
  @$pb.TagNumber(3)
  set topGift(CrateGiftItem value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTopGift() => $_has(2);
  @$pb.TagNumber(3)
  void clearTopGift() => $_clearField(3);
  @$pb.TagNumber(3)
  CrateGiftItem ensureTopGift() => $_ensure(2);
}

/// King of Bonus 完整信息
class BonusKingInfo extends $pb.GeneratedMessage {
  factory BonusKingInfo({
    BonusKingItem? rank1,
    BonusKingItem? rank2,
    BonusKingItem? rank3,
  }) {
    final result = create();
    if (rank1 != null) result.rank1 = rank1;
    if (rank2 != null) result.rank2 = rank2;
    if (rank3 != null) result.rank3 = rank3;
    return result;
  }

  BonusKingInfo._();

  factory BonusKingInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BonusKingInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BonusKingInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aOM<BonusKingItem>(1, _omitFieldNames ? '' : 'rank1',
        subBuilder: BonusKingItem.create)
    ..aOM<BonusKingItem>(2, _omitFieldNames ? '' : 'rank2',
        subBuilder: BonusKingItem.create)
    ..aOM<BonusKingItem>(3, _omitFieldNames ? '' : 'rank3',
        subBuilder: BonusKingItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BonusKingInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BonusKingInfo copyWith(void Function(BonusKingInfo) updates) =>
      super.copyWith((message) => updates(message as BonusKingInfo))
          as BonusKingInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BonusKingInfo create() => BonusKingInfo._();
  @$core.override
  BonusKingInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BonusKingInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BonusKingInfo>(create);
  static BonusKingInfo? _defaultInstance;

  @$pb.TagNumber(1)
  BonusKingItem get rank1 => $_getN(0);
  @$pb.TagNumber(1)
  set rank1(BonusKingItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRank1() => $_has(0);
  @$pb.TagNumber(1)
  void clearRank1() => $_clearField(1);
  @$pb.TagNumber(1)
  BonusKingItem ensureRank1() => $_ensure(0);

  @$pb.TagNumber(2)
  BonusKingItem get rank2 => $_getN(1);
  @$pb.TagNumber(2)
  set rank2(BonusKingItem value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRank2() => $_has(1);
  @$pb.TagNumber(2)
  void clearRank2() => $_clearField(2);
  @$pb.TagNumber(2)
  BonusKingItem ensureRank2() => $_ensure(1);

  @$pb.TagNumber(3)
  BonusKingItem get rank3 => $_getN(2);
  @$pb.TagNumber(3)
  set rank3(BonusKingItem value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRank3() => $_has(2);
  @$pb.TagNumber(3)
  void clearRank3() => $_clearField(3);
  @$pb.TagNumber(3)
  BonusKingItem ensureRank3() => $_ensure(2);
}

/// King of Bonus 排行项
class BonusKingItem extends $pb.GeneratedMessage {
  factory BonusKingItem({
    SimpleUser? user,
    $core.int? bonusCount,
    $core.Iterable<CrateGiftItem>? items,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (bonusCount != null) result.bonusCount = bonusCount;
    if (items != null) result.items.addAll(items);
    return result;
  }

  BonusKingItem._();

  factory BonusKingItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BonusKingItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BonusKingItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aOM<SimpleUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: SimpleUser.create)
    ..aI(2, _omitFieldNames ? '' : 'bonusCount')
    ..pPM<CrateGiftItem>(3, _omitFieldNames ? '' : 'items',
        subBuilder: CrateGiftItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BonusKingItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BonusKingItem copyWith(void Function(BonusKingItem) updates) =>
      super.copyWith((message) => updates(message as BonusKingItem))
          as BonusKingItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BonusKingItem create() => BonusKingItem._();
  @$core.override
  BonusKingItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BonusKingItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BonusKingItem>(create);
  static BonusKingItem? _defaultInstance;

  @$pb.TagNumber(1)
  SimpleUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(SimpleUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  SimpleUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get bonusCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set bonusCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBonusCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearBonusCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<CrateGiftItem> get items => $_getList(2);
}

/// 用户进度
class UserProgress extends $pb.GeneratedMessage {
  factory UserProgress({
    $fixnum.Int64? myCoins,
    $core.int? myKingRank,
    $core.int? myBonusCount,
    MyMilestoneProgress? myMilestone,
    MySpecialGiftProgress? mySpecialGift,
  }) {
    final result = create();
    if (myCoins != null) result.myCoins = myCoins;
    if (myKingRank != null) result.myKingRank = myKingRank;
    if (myBonusCount != null) result.myBonusCount = myBonusCount;
    if (myMilestone != null) result.myMilestone = myMilestone;
    if (mySpecialGift != null) result.mySpecialGift = mySpecialGift;
    return result;
  }

  UserProgress._();

  factory UserProgress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserProgress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserProgress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'myCoins')
    ..aI(2, _omitFieldNames ? '' : 'myKingRank')
    ..aI(3, _omitFieldNames ? '' : 'myBonusCount')
    ..aOM<MyMilestoneProgress>(4, _omitFieldNames ? '' : 'myMilestone',
        subBuilder: MyMilestoneProgress.create)
    ..aOM<MySpecialGiftProgress>(5, _omitFieldNames ? '' : 'mySpecialGift',
        subBuilder: MySpecialGiftProgress.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserProgress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserProgress copyWith(void Function(UserProgress) updates) =>
      super.copyWith((message) => updates(message as UserProgress))
          as UserProgress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserProgress create() => UserProgress._();
  @$core.override
  UserProgress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserProgress>(create);
  static UserProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get myCoins => $_getI64(0);
  @$pb.TagNumber(1)
  set myCoins($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMyCoins() => $_has(0);
  @$pb.TagNumber(1)
  void clearMyCoins() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get myKingRank => $_getIZ(1);
  @$pb.TagNumber(2)
  set myKingRank($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMyKingRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearMyKingRank() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get myBonusCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set myBonusCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMyBonusCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearMyBonusCount() => $_clearField(3);

  @$pb.TagNumber(4)
  MyMilestoneProgress get myMilestone => $_getN(3);
  @$pb.TagNumber(4)
  set myMilestone(MyMilestoneProgress value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasMyMilestone() => $_has(3);
  @$pb.TagNumber(4)
  void clearMyMilestone() => $_clearField(4);
  @$pb.TagNumber(4)
  MyMilestoneProgress ensureMyMilestone() => $_ensure(3);

  @$pb.TagNumber(5)
  MySpecialGiftProgress get mySpecialGift => $_getN(4);
  @$pb.TagNumber(5)
  set mySpecialGift(MySpecialGiftProgress value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasMySpecialGift() => $_has(4);
  @$pb.TagNumber(5)
  void clearMySpecialGift() => $_clearField(5);
  @$pb.TagNumber(5)
  MySpecialGiftProgress ensureMySpecialGift() => $_ensure(4);
}

/// Milestone 里程碑进度
class MyMilestoneProgress extends $pb.GeneratedMessage {
  factory MyMilestoneProgress({
    $core.int? currentPulls,
    $core.int? pullsToNext,
    $core.Iterable<MyMilestoneItem>? milestones,
  }) {
    final result = create();
    if (currentPulls != null) result.currentPulls = currentPulls;
    if (pullsToNext != null) result.pullsToNext = pullsToNext;
    if (milestones != null) result.milestones.addAll(milestones);
    return result;
  }

  MyMilestoneProgress._();

  factory MyMilestoneProgress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MyMilestoneProgress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MyMilestoneProgress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'currentPulls')
    ..aI(2, _omitFieldNames ? '' : 'pullsToNext')
    ..pPM<MyMilestoneItem>(3, _omitFieldNames ? '' : 'milestones',
        subBuilder: MyMilestoneItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MyMilestoneProgress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MyMilestoneProgress copyWith(void Function(MyMilestoneProgress) updates) =>
      super.copyWith((message) => updates(message as MyMilestoneProgress))
          as MyMilestoneProgress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MyMilestoneProgress create() => MyMilestoneProgress._();
  @$core.override
  MyMilestoneProgress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MyMilestoneProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MyMilestoneProgress>(create);
  static MyMilestoneProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get currentPulls => $_getIZ(0);
  @$pb.TagNumber(1)
  set currentPulls($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCurrentPulls() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentPulls() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get pullsToNext => $_getIZ(1);
  @$pb.TagNumber(2)
  set pullsToNext($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPullsToNext() => $_has(1);
  @$pb.TagNumber(2)
  void clearPullsToNext() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<MyMilestoneItem> get milestones => $_getList(2);
}

/// 单个里程碑状态
class MyMilestoneItem extends $pb.GeneratedMessage {
  factory MyMilestoneItem({
    $core.int? threshold,
    CrateGiftItem? item,
    $core.bool? unlocked,
  }) {
    final result = create();
    if (threshold != null) result.threshold = threshold;
    if (item != null) result.item = item;
    if (unlocked != null) result.unlocked = unlocked;
    return result;
  }

  MyMilestoneItem._();

  factory MyMilestoneItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MyMilestoneItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MyMilestoneItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'threshold')
    ..aOM<CrateGiftItem>(2, _omitFieldNames ? '' : 'item',
        subBuilder: CrateGiftItem.create)
    ..aOB(3, _omitFieldNames ? '' : 'unlocked')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MyMilestoneItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MyMilestoneItem copyWith(void Function(MyMilestoneItem) updates) =>
      super.copyWith((message) => updates(message as MyMilestoneItem))
          as MyMilestoneItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MyMilestoneItem create() => MyMilestoneItem._();
  @$core.override
  MyMilestoneItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MyMilestoneItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MyMilestoneItem>(create);
  static MyMilestoneItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get threshold => $_getIZ(0);
  @$pb.TagNumber(1)
  set threshold($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasThreshold() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreshold() => $_clearField(1);

  @$pb.TagNumber(2)
  CrateGiftItem get item => $_getN(1);
  @$pb.TagNumber(2)
  set item(CrateGiftItem value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasItem() => $_has(1);
  @$pb.TagNumber(2)
  void clearItem() => $_clearField(2);
  @$pb.TagNumber(2)
  CrateGiftItem ensureItem() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get unlocked => $_getBF(2);
  @$pb.TagNumber(3)
  set unlocked($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUnlocked() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnlocked() => $_clearField(3);
}

/// Special Gift 进度
class MySpecialGiftProgress extends $pb.GeneratedMessage {
  factory MySpecialGiftProgress({
    $core.Iterable<MySpecialGiftSlot>? slots,
  }) {
    final result = create();
    if (slots != null) result.slots.addAll(slots);
    return result;
  }

  MySpecialGiftProgress._();

  factory MySpecialGiftProgress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MySpecialGiftProgress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MySpecialGiftProgress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..pPM<MySpecialGiftSlot>(1, _omitFieldNames ? '' : 'slots',
        subBuilder: MySpecialGiftSlot.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MySpecialGiftProgress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MySpecialGiftProgress copyWith(
          void Function(MySpecialGiftProgress) updates) =>
      super.copyWith((message) => updates(message as MySpecialGiftProgress))
          as MySpecialGiftProgress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MySpecialGiftProgress create() => MySpecialGiftProgress._();
  @$core.override
  MySpecialGiftProgress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MySpecialGiftProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MySpecialGiftProgress>(create);
  static MySpecialGiftProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MySpecialGiftSlot> get slots => $_getList(0);
}

/// Special Gift 槽位
class MySpecialGiftSlot extends $pb.GeneratedMessage {
  factory MySpecialGiftSlot({
    $core.int? seq,
    CrateGiftItem? item,
    $core.bool? unlocked,
  }) {
    final result = create();
    if (seq != null) result.seq = seq;
    if (item != null) result.item = item;
    if (unlocked != null) result.unlocked = unlocked;
    return result;
  }

  MySpecialGiftSlot._();

  factory MySpecialGiftSlot.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MySpecialGiftSlot.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MySpecialGiftSlot',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'seq')
    ..aOM<CrateGiftItem>(2, _omitFieldNames ? '' : 'item',
        subBuilder: CrateGiftItem.create)
    ..aOB(3, _omitFieldNames ? '' : 'unlocked')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MySpecialGiftSlot clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MySpecialGiftSlot copyWith(void Function(MySpecialGiftSlot) updates) =>
      super.copyWith((message) => updates(message as MySpecialGiftSlot))
          as MySpecialGiftSlot;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MySpecialGiftSlot create() => MySpecialGiftSlot._();
  @$core.override
  MySpecialGiftSlot createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MySpecialGiftSlot getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MySpecialGiftSlot>(create);
  static MySpecialGiftSlot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get seq => $_getIZ(0);
  @$pb.TagNumber(1)
  set seq($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSeq() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeq() => $_clearField(1);

  @$pb.TagNumber(2)
  CrateGiftItem get item => $_getN(1);
  @$pb.TagNumber(2)
  set item(CrateGiftItem value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasItem() => $_has(1);
  @$pb.TagNumber(2)
  void clearItem() => $_clearField(2);
  @$pb.TagNumber(2)
  CrateGiftItem ensureItem() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get unlocked => $_getBF(2);
  @$pb.TagNumber(3)
  set unlocked($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUnlocked() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnlocked() => $_clearField(3);
}

/// 昨日幸运玩家
class LuckyWinnerItem extends $pb.GeneratedMessage {
  factory LuckyWinnerItem({
    SimpleUser? user,
  }) {
    final result = create();
    if (user != null) result.user = user;
    return result;
  }

  LuckyWinnerItem._();

  factory LuckyWinnerItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LuckyWinnerItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LuckyWinnerItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aOM<SimpleUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: SimpleUser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LuckyWinnerItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LuckyWinnerItem copyWith(void Function(LuckyWinnerItem) updates) =>
      super.copyWith((message) => updates(message as LuckyWinnerItem))
          as LuckyWinnerItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LuckyWinnerItem create() => LuckyWinnerItem._();
  @$core.override
  LuckyWinnerItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LuckyWinnerItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LuckyWinnerItem>(create);
  static LuckyWinnerItem? _defaultInstance;

  @$pb.TagNumber(1)
  SimpleUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(SimpleUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  SimpleUser ensureUser() => $_ensure(0);
}

/// 盒子页面实时响应（Bonus Time 期间轮询使用）
/// milestone/special_gift 的 item 字段不填值，前端复用 /box/page 的静态配置
class CrateBoxLiveRsp extends $pb.GeneratedMessage {
  factory CrateBoxLiveRsp({
    RoundInfo? round,
    UserProgress? userProgress,
  }) {
    final result = create();
    if (round != null) result.round = round;
    if (userProgress != null) result.userProgress = userProgress;
    return result;
  }

  CrateBoxLiveRsp._();

  factory CrateBoxLiveRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CrateBoxLiveRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CrateBoxLiveRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aOM<RoundInfo>(1, _omitFieldNames ? '' : 'round',
        subBuilder: RoundInfo.create)
    ..aOM<UserProgress>(2, _omitFieldNames ? '' : 'userProgress',
        subBuilder: UserProgress.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateBoxLiveRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateBoxLiveRsp copyWith(void Function(CrateBoxLiveRsp) updates) =>
      super.copyWith((message) => updates(message as CrateBoxLiveRsp))
          as CrateBoxLiveRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CrateBoxLiveRsp create() => CrateBoxLiveRsp._();
  @$core.override
  CrateBoxLiveRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CrateBoxLiveRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CrateBoxLiveRsp>(create);
  static CrateBoxLiveRsp? _defaultInstance;

  @$pb.TagNumber(1)
  RoundInfo get round => $_getN(0);
  @$pb.TagNumber(1)
  set round(RoundInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRound() => $_has(0);
  @$pb.TagNumber(1)
  void clearRound() => $_clearField(1);
  @$pb.TagNumber(1)
  RoundInfo ensureRound() => $_ensure(0);

  @$pb.TagNumber(2)
  UserProgress get userProgress => $_getN(1);
  @$pb.TagNumber(2)
  set userProgress(UserProgress value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUserProgress() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserProgress() => $_clearField(2);
  @$pb.TagNumber(2)
  UserProgress ensureUserProgress() => $_ensure(1);
}

/// 开盲盒请求
class CrateOpenReq extends $pb.GeneratedMessage {
  factory CrateOpenReq({
    $core.String? crateType,
    $fixnum.Int64? configId,
  }) {
    final result = create();
    if (crateType != null) result.crateType = crateType;
    if (configId != null) result.configId = configId;
    return result;
  }

  CrateOpenReq._();

  factory CrateOpenReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CrateOpenReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CrateOpenReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'crateType')
    ..aInt64(2, _omitFieldNames ? '' : 'configId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateOpenReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateOpenReq copyWith(void Function(CrateOpenReq) updates) =>
      super.copyWith((message) => updates(message as CrateOpenReq))
          as CrateOpenReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CrateOpenReq create() => CrateOpenReq._();
  @$core.override
  CrateOpenReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CrateOpenReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CrateOpenReq>(create);
  static CrateOpenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get crateType => $_getSZ(0);
  @$pb.TagNumber(1)
  set crateType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCrateType() => $_has(0);
  @$pb.TagNumber(1)
  void clearCrateType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get configId => $_getI64(1);
  @$pb.TagNumber(2)
  set configId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConfigId() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfigId() => $_clearField(2);
}

/// 开盲盒响应
class CrateOpenRsp extends $pb.GeneratedMessage {
  factory CrateOpenRsp({
    $core.Iterable<CrateGiftItem>? rewards,
    $core.Iterable<CrateGiftItem>? milestoneRewards,
    $core.Iterable<CrateGiftItem>? specialGiftRewards,
    UserProgress? userProgress,
  }) {
    final result = create();
    if (rewards != null) result.rewards.addAll(rewards);
    if (milestoneRewards != null)
      result.milestoneRewards.addAll(milestoneRewards);
    if (specialGiftRewards != null)
      result.specialGiftRewards.addAll(specialGiftRewards);
    if (userProgress != null) result.userProgress = userProgress;
    return result;
  }

  CrateOpenRsp._();

  factory CrateOpenRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CrateOpenRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CrateOpenRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..pPM<CrateGiftItem>(1, _omitFieldNames ? '' : 'rewards',
        subBuilder: CrateGiftItem.create)
    ..pPM<CrateGiftItem>(2, _omitFieldNames ? '' : 'milestoneRewards',
        subBuilder: CrateGiftItem.create)
    ..pPM<CrateGiftItem>(3, _omitFieldNames ? '' : 'specialGiftRewards',
        subBuilder: CrateGiftItem.create)
    ..aOM<UserProgress>(4, _omitFieldNames ? '' : 'userProgress',
        subBuilder: UserProgress.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateOpenRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateOpenRsp copyWith(void Function(CrateOpenRsp) updates) =>
      super.copyWith((message) => updates(message as CrateOpenRsp))
          as CrateOpenRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CrateOpenRsp create() => CrateOpenRsp._();
  @$core.override
  CrateOpenRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CrateOpenRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CrateOpenRsp>(create);
  static CrateOpenRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CrateGiftItem> get rewards => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<CrateGiftItem> get milestoneRewards => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<CrateGiftItem> get specialGiftRewards => $_getList(2);

  @$pb.TagNumber(4)
  UserProgress get userProgress => $_getN(3);
  @$pb.TagNumber(4)
  set userProgress(UserProgress value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasUserProgress() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserProgress() => $_clearField(4);
  @$pb.TagNumber(4)
  UserProgress ensureUserProgress() => $_ensure(3);
}

/// 日榜排行响应
class CrateLeaderboardRsp extends $pb.GeneratedMessage {
  factory CrateLeaderboardRsp({
    $core.Iterable<CrateRankItem>? items,
    CrateRankItem? myRank,
    $0.Page? page,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    if (myRank != null) result.myRank = myRank;
    if (page != null) result.page = page;
    return result;
  }

  CrateLeaderboardRsp._();

  factory CrateLeaderboardRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CrateLeaderboardRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CrateLeaderboardRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..pPM<CrateRankItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: CrateRankItem.create)
    ..aOM<CrateRankItem>(2, _omitFieldNames ? '' : 'myRank',
        subBuilder: CrateRankItem.create)
    ..aOM<$0.Page>(3, _omitFieldNames ? '' : 'page', subBuilder: $0.Page.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateLeaderboardRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateLeaderboardRsp copyWith(void Function(CrateLeaderboardRsp) updates) =>
      super.copyWith((message) => updates(message as CrateLeaderboardRsp))
          as CrateLeaderboardRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CrateLeaderboardRsp create() => CrateLeaderboardRsp._();
  @$core.override
  CrateLeaderboardRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CrateLeaderboardRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CrateLeaderboardRsp>(create);
  static CrateLeaderboardRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CrateRankItem> get items => $_getList(0);

  @$pb.TagNumber(2)
  CrateRankItem get myRank => $_getN(1);
  @$pb.TagNumber(2)
  set myRank(CrateRankItem value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMyRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearMyRank() => $_clearField(2);
  @$pb.TagNumber(2)
  CrateRankItem ensureMyRank() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Page get page => $_getN(2);
  @$pb.TagNumber(3)
  set page($0.Page value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Page ensurePage() => $_ensure(2);
}

/// 开箱历史响应
class CrateHistoryRsp extends $pb.GeneratedMessage {
  factory CrateHistoryRsp({
    $core.Iterable<CrateHistoryItem>? items,
    $0.Page? page,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    if (page != null) result.page = page;
    return result;
  }

  CrateHistoryRsp._();

  factory CrateHistoryRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CrateHistoryRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CrateHistoryRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..pPM<CrateHistoryItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: CrateHistoryItem.create)
    ..aOM<$0.Page>(2, _omitFieldNames ? '' : 'page', subBuilder: $0.Page.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateHistoryRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateHistoryRsp copyWith(void Function(CrateHistoryRsp) updates) =>
      super.copyWith((message) => updates(message as CrateHistoryRsp))
          as CrateHistoryRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CrateHistoryRsp create() => CrateHistoryRsp._();
  @$core.override
  CrateHistoryRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CrateHistoryRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CrateHistoryRsp>(create);
  static CrateHistoryRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CrateHistoryItem> get items => $_getList(0);

  @$pb.TagNumber(2)
  $0.Page get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($0.Page value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Page ensurePage() => $_ensure(1);
}

/// 开箱历史记录项
class CrateHistoryItem extends $pb.GeneratedMessage {
  factory CrateHistoryItem({
    $fixnum.Int64? recordId,
    $core.String? crateType,
    CrateGiftItem? item,
    $fixnum.Int64? createTime,
  }) {
    final result = create();
    if (recordId != null) result.recordId = recordId;
    if (crateType != null) result.crateType = crateType;
    if (item != null) result.item = item;
    if (createTime != null) result.createTime = createTime;
    return result;
  }

  CrateHistoryItem._();

  factory CrateHistoryItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CrateHistoryItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CrateHistoryItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'recordId')
    ..aOS(2, _omitFieldNames ? '' : 'crateType')
    ..aOM<CrateGiftItem>(3, _omitFieldNames ? '' : 'item',
        subBuilder: CrateGiftItem.create)
    ..aInt64(4, _omitFieldNames ? '' : 'createTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateHistoryItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrateHistoryItem copyWith(void Function(CrateHistoryItem) updates) =>
      super.copyWith((message) => updates(message as CrateHistoryItem))
          as CrateHistoryItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CrateHistoryItem create() => CrateHistoryItem._();
  @$core.override
  CrateHistoryItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CrateHistoryItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CrateHistoryItem>(create);
  static CrateHistoryItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get recordId => $_getI64(0);
  @$pb.TagNumber(1)
  set recordId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecordId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get crateType => $_getSZ(1);
  @$pb.TagNumber(2)
  set crateType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCrateType() => $_has(1);
  @$pb.TagNumber(2)
  void clearCrateType() => $_clearField(2);

  @$pb.TagNumber(3)
  CrateGiftItem get item => $_getN(2);
  @$pb.TagNumber(3)
  set item(CrateGiftItem value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasItem() => $_has(2);
  @$pb.TagNumber(3)
  void clearItem() => $_clearField(3);
  @$pb.TagNumber(3)
  CrateGiftItem ensureItem() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get createTime => $_getI64(3);
  @$pb.TagNumber(4)
  set createTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreateTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreateTime() => $_clearField(4);
}

/// 礼物兑换配置响应
class RedemptionConfigRsp extends $pb.GeneratedMessage {
  factory RedemptionConfigRsp({
    $fixnum.Int64? myShards,
    $core.Iterable<RedemptionPath>? luckyExchanges,
    $core.Iterable<RedemptionPath>? premiumExchanges,
  }) {
    final result = create();
    if (myShards != null) result.myShards = myShards;
    if (luckyExchanges != null) result.luckyExchanges.addAll(luckyExchanges);
    if (premiumExchanges != null)
      result.premiumExchanges.addAll(premiumExchanges);
    return result;
  }

  RedemptionConfigRsp._();

  factory RedemptionConfigRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RedemptionConfigRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RedemptionConfigRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'myShards')
    ..pPM<RedemptionPath>(2, _omitFieldNames ? '' : 'luckyExchanges',
        subBuilder: RedemptionPath.create)
    ..pPM<RedemptionPath>(3, _omitFieldNames ? '' : 'premiumExchanges',
        subBuilder: RedemptionPath.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RedemptionConfigRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RedemptionConfigRsp copyWith(void Function(RedemptionConfigRsp) updates) =>
      super.copyWith((message) => updates(message as RedemptionConfigRsp))
          as RedemptionConfigRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RedemptionConfigRsp create() => RedemptionConfigRsp._();
  @$core.override
  RedemptionConfigRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RedemptionConfigRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedemptionConfigRsp>(create);
  static RedemptionConfigRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get myShards => $_getI64(0);
  @$pb.TagNumber(1)
  set myShards($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMyShards() => $_has(0);
  @$pb.TagNumber(1)
  void clearMyShards() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<RedemptionPath> get luckyExchanges => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<RedemptionPath> get premiumExchanges => $_getList(2);
}

/// 兑换路径（源礼物 → 可兑换目标列表）
class RedemptionPath extends $pb.GeneratedMessage {
  factory RedemptionPath({
    CrateGiftItem? sourceItem,
    $core.int? sourceOwned,
    $core.Iterable<RedemptionOption>? options,
  }) {
    final result = create();
    if (sourceItem != null) result.sourceItem = sourceItem;
    if (sourceOwned != null) result.sourceOwned = sourceOwned;
    if (options != null) result.options.addAll(options);
    return result;
  }

  RedemptionPath._();

  factory RedemptionPath.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RedemptionPath.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RedemptionPath',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aOM<CrateGiftItem>(1, _omitFieldNames ? '' : 'sourceItem',
        subBuilder: CrateGiftItem.create)
    ..aI(2, _omitFieldNames ? '' : 'sourceOwned')
    ..pPM<RedemptionOption>(3, _omitFieldNames ? '' : 'options',
        subBuilder: RedemptionOption.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RedemptionPath clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RedemptionPath copyWith(void Function(RedemptionPath) updates) =>
      super.copyWith((message) => updates(message as RedemptionPath))
          as RedemptionPath;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RedemptionPath create() => RedemptionPath._();
  @$core.override
  RedemptionPath createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RedemptionPath getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedemptionPath>(create);
  static RedemptionPath? _defaultInstance;

  @$pb.TagNumber(1)
  CrateGiftItem get sourceItem => $_getN(0);
  @$pb.TagNumber(1)
  set sourceItem(CrateGiftItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSourceItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearSourceItem() => $_clearField(1);
  @$pb.TagNumber(1)
  CrateGiftItem ensureSourceItem() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get sourceOwned => $_getIZ(1);
  @$pb.TagNumber(2)
  set sourceOwned($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSourceOwned() => $_has(1);
  @$pb.TagNumber(2)
  void clearSourceOwned() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<RedemptionOption> get options => $_getList(2);
}

/// 单个兑换选项
class RedemptionOption extends $pb.GeneratedMessage {
  factory RedemptionOption({
    $fixnum.Int64? id,
    CrateGiftItem? item,
    $core.int? sourceCount,
    $core.int? shardsCost,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (item != null) result.item = item;
    if (sourceCount != null) result.sourceCount = sourceCount;
    if (shardsCost != null) result.shardsCost = shardsCost;
    return result;
  }

  RedemptionOption._();

  factory RedemptionOption.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RedemptionOption.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RedemptionOption',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOM<CrateGiftItem>(2, _omitFieldNames ? '' : 'item',
        subBuilder: CrateGiftItem.create)
    ..aI(3, _omitFieldNames ? '' : 'sourceCount')
    ..aI(4, _omitFieldNames ? '' : 'shardsCost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RedemptionOption clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RedemptionOption copyWith(void Function(RedemptionOption) updates) =>
      super.copyWith((message) => updates(message as RedemptionOption))
          as RedemptionOption;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RedemptionOption create() => RedemptionOption._();
  @$core.override
  RedemptionOption createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RedemptionOption getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedemptionOption>(create);
  static RedemptionOption? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  CrateGiftItem get item => $_getN(1);
  @$pb.TagNumber(2)
  set item(CrateGiftItem value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasItem() => $_has(1);
  @$pb.TagNumber(2)
  void clearItem() => $_clearField(2);
  @$pb.TagNumber(2)
  CrateGiftItem ensureItem() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get sourceCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set sourceCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSourceCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearSourceCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get shardsCost => $_getIZ(3);
  @$pb.TagNumber(4)
  set shardsCost($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasShardsCost() => $_has(3);
  @$pb.TagNumber(4)
  void clearShardsCost() => $_clearField(4);
}

/// 礼物兑换请求
class RedemptionExchangeReq extends $pb.GeneratedMessage {
  factory RedemptionExchangeReq({
    $fixnum.Int64? optionId,
    $core.String? crateType,
  }) {
    final result = create();
    if (optionId != null) result.optionId = optionId;
    if (crateType != null) result.crateType = crateType;
    return result;
  }

  RedemptionExchangeReq._();

  factory RedemptionExchangeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RedemptionExchangeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RedemptionExchangeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'optionId')
    ..aOS(2, _omitFieldNames ? '' : 'crateType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RedemptionExchangeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RedemptionExchangeReq copyWith(
          void Function(RedemptionExchangeReq) updates) =>
      super.copyWith((message) => updates(message as RedemptionExchangeReq))
          as RedemptionExchangeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RedemptionExchangeReq create() => RedemptionExchangeReq._();
  @$core.override
  RedemptionExchangeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RedemptionExchangeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedemptionExchangeReq>(create);
  static RedemptionExchangeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get optionId => $_getI64(0);
  @$pb.TagNumber(1)
  set optionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOptionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get crateType => $_getSZ(1);
  @$pb.TagNumber(2)
  set crateType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCrateType() => $_has(1);
  @$pb.TagNumber(2)
  void clearCrateType() => $_clearField(2);
}

/// 礼物兑换响应
class RedemptionExchangeRsp extends $pb.GeneratedMessage {
  factory RedemptionExchangeRsp({
    CrateGiftItem? targetGift,
    $fixnum.Int64? shardsRemaining,
  }) {
    final result = create();
    if (targetGift != null) result.targetGift = targetGift;
    if (shardsRemaining != null) result.shardsRemaining = shardsRemaining;
    return result;
  }

  RedemptionExchangeRsp._();

  factory RedemptionExchangeRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RedemptionExchangeRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RedemptionExchangeRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'crate_rush'),
      createEmptyInstance: create)
    ..aOM<CrateGiftItem>(1, _omitFieldNames ? '' : 'targetGift',
        subBuilder: CrateGiftItem.create)
    ..aInt64(2, _omitFieldNames ? '' : 'shardsRemaining')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RedemptionExchangeRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RedemptionExchangeRsp copyWith(
          void Function(RedemptionExchangeRsp) updates) =>
      super.copyWith((message) => updates(message as RedemptionExchangeRsp))
          as RedemptionExchangeRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RedemptionExchangeRsp create() => RedemptionExchangeRsp._();
  @$core.override
  RedemptionExchangeRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RedemptionExchangeRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedemptionExchangeRsp>(create);
  static RedemptionExchangeRsp? _defaultInstance;

  @$pb.TagNumber(1)
  CrateGiftItem get targetGift => $_getN(0);
  @$pb.TagNumber(1)
  set targetGift(CrateGiftItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTargetGift() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetGift() => $_clearField(1);
  @$pb.TagNumber(1)
  CrateGiftItem ensureTargetGift() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get shardsRemaining => $_getI64(1);
  @$pb.TagNumber(2)
  set shardsRemaining($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasShardsRemaining() => $_has(1);
  @$pb.TagNumber(2)
  void clearShardsRemaining() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

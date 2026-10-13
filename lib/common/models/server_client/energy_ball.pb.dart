// This is a generated file - do not edit.
//
// Generated from server_client/energy_ball.proto.

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

/// 能量与奖池
class EnergyBallInfoRsp extends $pb.GeneratedMessage {
  factory EnergyBallInfoRsp({
    $core.bool? enabled,
    $fixnum.Int64? energy,
    $core.int? lotteryCost,
    $core.Iterable<EnergyBallPrizeItem>? prizePool,
  }) {
    final result = create();
    if (enabled != null) result.enabled = enabled;
    if (energy != null) result.energy = energy;
    if (lotteryCost != null) result.lotteryCost = lotteryCost;
    if (prizePool != null) result.prizePool.addAll(prizePool);
    return result;
  }

  EnergyBallInfoRsp._();

  factory EnergyBallInfoRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EnergyBallInfoRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EnergyBallInfoRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'energy_ball'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..aInt64(2, _omitFieldNames ? '' : 'energy')
    ..aI(3, _omitFieldNames ? '' : 'lotteryCost')
    ..pPM<EnergyBallPrizeItem>(4, _omitFieldNames ? '' : 'prizePool',
        subBuilder: EnergyBallPrizeItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnergyBallInfoRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnergyBallInfoRsp copyWith(void Function(EnergyBallInfoRsp) updates) =>
      super.copyWith((message) => updates(message as EnergyBallInfoRsp))
          as EnergyBallInfoRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnergyBallInfoRsp create() => EnergyBallInfoRsp._();
  @$core.override
  EnergyBallInfoRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EnergyBallInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnergyBallInfoRsp>(create);
  static EnergyBallInfoRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get energy => $_getI64(1);
  @$pb.TagNumber(2)
  set energy($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEnergy() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnergy() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get lotteryCost => $_getIZ(2);
  @$pb.TagNumber(3)
  set lotteryCost($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLotteryCost() => $_has(2);
  @$pb.TagNumber(3)
  void clearLotteryCost() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<EnergyBallPrizeItem> get prizePool => $_getList(3);
}

class EnergyBallPrizeItem extends $pb.GeneratedMessage {
  factory EnergyBallPrizeItem({
    $core.String? prizeType,
    $fixnum.Int64? prizeId,
    $core.String? name,
    $core.String? icon,
    $core.int? num,
  }) {
    final result = create();
    if (prizeType != null) result.prizeType = prizeType;
    if (prizeId != null) result.prizeId = prizeId;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (num != null) result.num = num;
    return result;
  }

  EnergyBallPrizeItem._();

  factory EnergyBallPrizeItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EnergyBallPrizeItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EnergyBallPrizeItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'energy_ball'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'prizeType')
    ..aInt64(2, _omitFieldNames ? '' : 'prizeId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'icon')
    ..aI(5, _omitFieldNames ? '' : 'num')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnergyBallPrizeItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnergyBallPrizeItem copyWith(void Function(EnergyBallPrizeItem) updates) =>
      super.copyWith((message) => updates(message as EnergyBallPrizeItem))
          as EnergyBallPrizeItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnergyBallPrizeItem create() => EnergyBallPrizeItem._();
  @$core.override
  EnergyBallPrizeItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EnergyBallPrizeItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnergyBallPrizeItem>(create);
  static EnergyBallPrizeItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get prizeType => $_getSZ(0);
  @$pb.TagNumber(1)
  set prizeType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrizeType() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrizeType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get prizeId => $_getI64(1);
  @$pb.TagNumber(2)
  set prizeId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrizeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrizeId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get num => $_getIZ(4);
  @$pb.TagNumber(5)
  set num($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearNum() => $_clearField(5);
}

/// 全服抽奖播报
class EnergyBallBroadcastRsp extends $pb.GeneratedMessage {
  factory EnergyBallBroadcastRsp({
    $core.Iterable<EnergyBallBroadcastItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  EnergyBallBroadcastRsp._();

  factory EnergyBallBroadcastRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EnergyBallBroadcastRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EnergyBallBroadcastRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'energy_ball'),
      createEmptyInstance: create)
    ..pPM<EnergyBallBroadcastItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: EnergyBallBroadcastItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnergyBallBroadcastRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnergyBallBroadcastRsp copyWith(
          void Function(EnergyBallBroadcastRsp) updates) =>
      super.copyWith((message) => updates(message as EnergyBallBroadcastRsp))
          as EnergyBallBroadcastRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnergyBallBroadcastRsp create() => EnergyBallBroadcastRsp._();
  @$core.override
  EnergyBallBroadcastRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EnergyBallBroadcastRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnergyBallBroadcastRsp>(create);
  static EnergyBallBroadcastRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<EnergyBallBroadcastItem> get items => $_getList(0);
}

class EnergyBallBroadcastItem extends $pb.GeneratedMessage {
  factory EnergyBallBroadcastItem({
    $fixnum.Int64? uid,
    $core.String? nickname,
    $core.String? avatar,
    $core.String? prizeName,
    $core.String? prizeIcon,
    $fixnum.Int64? createTime,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    if (prizeName != null) result.prizeName = prizeName;
    if (prizeIcon != null) result.prizeIcon = prizeIcon;
    if (createTime != null) result.createTime = createTime;
    return result;
  }

  EnergyBallBroadcastItem._();

  factory EnergyBallBroadcastItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EnergyBallBroadcastItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EnergyBallBroadcastItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'energy_ball'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'prizeName')
    ..aOS(5, _omitFieldNames ? '' : 'prizeIcon')
    ..aInt64(6, _omitFieldNames ? '' : 'createTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnergyBallBroadcastItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnergyBallBroadcastItem copyWith(
          void Function(EnergyBallBroadcastItem) updates) =>
      super.copyWith((message) => updates(message as EnergyBallBroadcastItem))
          as EnergyBallBroadcastItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnergyBallBroadcastItem create() => EnergyBallBroadcastItem._();
  @$core.override
  EnergyBallBroadcastItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EnergyBallBroadcastItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnergyBallBroadcastItem>(create);
  static EnergyBallBroadcastItem? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.String get prizeName => $_getSZ(3);
  @$pb.TagNumber(4)
  set prizeName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPrizeName() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrizeName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get prizeIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set prizeIcon($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPrizeIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrizeIcon() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get createTime => $_getI64(5);
  @$pb.TagNumber(6)
  set createTime($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => $_clearField(6);
}

/// 抽奖结果
class EnergyBallLotteryRsp extends $pb.GeneratedMessage {
  factory EnergyBallLotteryRsp({
    EnergyBallPrizeItem? prize,
    $fixnum.Int64? energy,
    $core.int? lotteryCost,
  }) {
    final result = create();
    if (prize != null) result.prize = prize;
    if (energy != null) result.energy = energy;
    if (lotteryCost != null) result.lotteryCost = lotteryCost;
    return result;
  }

  EnergyBallLotteryRsp._();

  factory EnergyBallLotteryRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EnergyBallLotteryRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EnergyBallLotteryRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'energy_ball'),
      createEmptyInstance: create)
    ..aOM<EnergyBallPrizeItem>(1, _omitFieldNames ? '' : 'prize',
        subBuilder: EnergyBallPrizeItem.create)
    ..aInt64(2, _omitFieldNames ? '' : 'energy')
    ..aI(3, _omitFieldNames ? '' : 'lotteryCost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnergyBallLotteryRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnergyBallLotteryRsp copyWith(void Function(EnergyBallLotteryRsp) updates) =>
      super.copyWith((message) => updates(message as EnergyBallLotteryRsp))
          as EnergyBallLotteryRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnergyBallLotteryRsp create() => EnergyBallLotteryRsp._();
  @$core.override
  EnergyBallLotteryRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EnergyBallLotteryRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnergyBallLotteryRsp>(create);
  static EnergyBallLotteryRsp? _defaultInstance;

  @$pb.TagNumber(1)
  EnergyBallPrizeItem get prize => $_getN(0);
  @$pb.TagNumber(1)
  set prize(EnergyBallPrizeItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPrize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrize() => $_clearField(1);
  @$pb.TagNumber(1)
  EnergyBallPrizeItem ensurePrize() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get energy => $_getI64(1);
  @$pb.TagNumber(2)
  set energy($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEnergy() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnergy() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get lotteryCost => $_getIZ(2);
  @$pb.TagNumber(3)
  set lotteryCost($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLotteryCost() => $_has(2);
  @$pb.TagNumber(3)
  void clearLotteryCost() => $_clearField(3);
}

/// 能量流水
class EnergyBallHistoryRsp extends $pb.GeneratedMessage {
  factory EnergyBallHistoryRsp({
    $0.Page? page,
    $core.Iterable<EnergyBallHistoryItem>? items,
  }) {
    final result = create();
    if (page != null) result.page = page;
    if (items != null) result.items.addAll(items);
    return result;
  }

  EnergyBallHistoryRsp._();

  factory EnergyBallHistoryRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EnergyBallHistoryRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EnergyBallHistoryRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'energy_ball'),
      createEmptyInstance: create)
    ..aOM<$0.Page>(1, _omitFieldNames ? '' : 'page', subBuilder: $0.Page.create)
    ..pPM<EnergyBallHistoryItem>(2, _omitFieldNames ? '' : 'items',
        subBuilder: EnergyBallHistoryItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnergyBallHistoryRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnergyBallHistoryRsp copyWith(void Function(EnergyBallHistoryRsp) updates) =>
      super.copyWith((message) => updates(message as EnergyBallHistoryRsp))
          as EnergyBallHistoryRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnergyBallHistoryRsp create() => EnergyBallHistoryRsp._();
  @$core.override
  EnergyBallHistoryRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EnergyBallHistoryRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnergyBallHistoryRsp>(create);
  static EnergyBallHistoryRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Page get page => $_getN(0);
  @$pb.TagNumber(1)
  set page($0.Page value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Page ensurePage() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<EnergyBallHistoryItem> get items => $_getList(1);
}

class EnergyBallHistoryItem extends $pb.GeneratedMessage {
  factory EnergyBallHistoryItem({
    $core.String? type,
    $core.int? delta,
    $fixnum.Int64? createTime,
    $fixnum.Int64? relateUid,
    $core.String? title,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (delta != null) result.delta = delta;
    if (createTime != null) result.createTime = createTime;
    if (relateUid != null) result.relateUid = relateUid;
    if (title != null) result.title = title;
    return result;
  }

  EnergyBallHistoryItem._();

  factory EnergyBallHistoryItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EnergyBallHistoryItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EnergyBallHistoryItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'energy_ball'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..aI(2, _omitFieldNames ? '' : 'delta')
    ..aInt64(3, _omitFieldNames ? '' : 'createTime')
    ..aInt64(4, _omitFieldNames ? '' : 'relateUid')
    ..aOS(5, _omitFieldNames ? '' : 'title')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnergyBallHistoryItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnergyBallHistoryItem copyWith(
          void Function(EnergyBallHistoryItem) updates) =>
      super.copyWith((message) => updates(message as EnergyBallHistoryItem))
          as EnergyBallHistoryItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnergyBallHistoryItem create() => EnergyBallHistoryItem._();
  @$core.override
  EnergyBallHistoryItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EnergyBallHistoryItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnergyBallHistoryItem>(create);
  static EnergyBallHistoryItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get delta => $_getIZ(1);
  @$pb.TagNumber(2)
  set delta($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDelta() => $_has(1);
  @$pb.TagNumber(2)
  void clearDelta() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get createTime => $_getI64(2);
  @$pb.TagNumber(3)
  set createTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCreateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreateTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get relateUid => $_getI64(3);
  @$pb.TagNumber(4)
  set relateUid($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRelateUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearRelateUid() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(5)
  set title($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

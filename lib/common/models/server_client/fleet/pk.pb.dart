// This is a generated file - do not edit.
//
// Generated from server_client/fleet/pk.proto.

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
import 'pets.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// *
///  对战日志接口响应数据
class BattleLogRsp extends $pb.GeneratedMessage {
  factory BattleLogRsp({
    $core.Iterable<BattleLogItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  BattleLogRsp._();

  factory BattleLogRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BattleLogRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BattleLogRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..pPM<BattleLogItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: BattleLogItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleLogRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleLogRsp copyWith(void Function(BattleLogRsp) updates) =>
      super.copyWith((message) => updates(message as BattleLogRsp))
          as BattleLogRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BattleLogRsp create() => BattleLogRsp._();
  @$core.override
  BattleLogRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BattleLogRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BattleLogRsp>(create);
  static BattleLogRsp? _defaultInstance;

  /// 对战日志
  @$pb.TagNumber(1)
  $pb.PbList<BattleLogItem> get items => $_getList(0);
}

/// *
///  对战日志列表项
class BattleLogItem extends $pb.GeneratedMessage {
  factory BattleLogItem({
    FleetMemberInfo? left,
    FleetMemberInfo? right,
    $core.bool? win,
    $core.int? incomeStars,
    $fixnum.Int64? battleTime,
  }) {
    final result = create();
    if (left != null) result.left = left;
    if (right != null) result.right = right;
    if (win != null) result.win = win;
    if (incomeStars != null) result.incomeStars = incomeStars;
    if (battleTime != null) result.battleTime = battleTime;
    return result;
  }

  BattleLogItem._();

  factory BattleLogItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BattleLogItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BattleLogItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aOM<FleetMemberInfo>(1, _omitFieldNames ? '' : 'left',
        subBuilder: FleetMemberInfo.create)
    ..aOM<FleetMemberInfo>(2, _omitFieldNames ? '' : 'right',
        subBuilder: FleetMemberInfo.create)
    ..aOB(3, _omitFieldNames ? '' : 'win')
    ..aI(4, _omitFieldNames ? '' : 'incomeStars',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'battleTime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleLogItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleLogItem copyWith(void Function(BattleLogItem) updates) =>
      super.copyWith((message) => updates(message as BattleLogItem))
          as BattleLogItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BattleLogItem create() => BattleLogItem._();
  @$core.override
  BattleLogItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BattleLogItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BattleLogItem>(create);
  static BattleLogItem? _defaultInstance;

  /// 左方信息
  @$pb.TagNumber(1)
  FleetMemberInfo get left => $_getN(0);
  @$pb.TagNumber(1)
  set left(FleetMemberInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLeft() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeft() => $_clearField(1);
  @$pb.TagNumber(1)
  FleetMemberInfo ensureLeft() => $_ensure(0);

  /// 右方信息
  @$pb.TagNumber(2)
  FleetMemberInfo get right => $_getN(1);
  @$pb.TagNumber(2)
  set right(FleetMemberInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRight() => $_has(1);
  @$pb.TagNumber(2)
  void clearRight() => $_clearField(2);
  @$pb.TagNumber(2)
  FleetMemberInfo ensureRight() => $_ensure(1);

  /// 是否胜出
  @$pb.TagNumber(3)
  $core.bool get win => $_getBF(2);
  @$pb.TagNumber(3)
  set win($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWin() => $_has(2);
  @$pb.TagNumber(3)
  void clearWin() => $_clearField(3);

  /// 获得的星星数量
  @$pb.TagNumber(4)
  $core.int get incomeStars => $_getIZ(3);
  @$pb.TagNumber(4)
  set incomeStars($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIncomeStars() => $_has(3);
  @$pb.TagNumber(4)
  void clearIncomeStars() => $_clearField(4);

  /// 对战时间
  @$pb.TagNumber(5)
  $fixnum.Int64 get battleTime => $_getI64(4);
  @$pb.TagNumber(5)
  set battleTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBattleTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearBattleTime() => $_clearField(5);
}

/// *
///  开始战斗请求
class StartBattleReq extends $pb.GeneratedMessage {
  factory StartBattleReq({
    $core.bool? fastForward,
    $fixnum.Int64? rivalId,
  }) {
    final result = create();
    if (fastForward != null) result.fastForward = fastForward;
    if (rivalId != null) result.rivalId = rivalId;
    return result;
  }

  StartBattleReq._();

  factory StartBattleReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartBattleReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartBattleReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'fastForward')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'rivalId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartBattleReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartBattleReq copyWith(void Function(StartBattleReq) updates) =>
      super.copyWith((message) => updates(message as StartBattleReq))
          as StartBattleReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartBattleReq create() => StartBattleReq._();
  @$core.override
  StartBattleReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartBattleReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartBattleReq>(create);
  static StartBattleReq? _defaultInstance;

  /// 是否快进
  @$pb.TagNumber(1)
  $core.bool get fastForward => $_getBF(0);
  @$pb.TagNumber(1)
  set fastForward($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFastForward() => $_has(0);
  @$pb.TagNumber(1)
  void clearFastForward() => $_clearField(1);

  /// 对手ID
  @$pb.TagNumber(2)
  $fixnum.Int64 get rivalId => $_getI64(1);
  @$pb.TagNumber(2)
  set rivalId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRivalId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRivalId() => $_clearField(2);
}

/// *
///  开始战斗响应
class StartBattleRsp extends $pb.GeneratedMessage {
  factory StartBattleRsp({
    BattleSide? leftSide,
    BattleSide? rightSide,
    $fixnum.Int64? winnerId,
    $core.Iterable<BattleRound>? rounds,
  }) {
    final result = create();
    if (leftSide != null) result.leftSide = leftSide;
    if (rightSide != null) result.rightSide = rightSide;
    if (winnerId != null) result.winnerId = winnerId;
    if (rounds != null) result.rounds.addAll(rounds);
    return result;
  }

  StartBattleRsp._();

  factory StartBattleRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartBattleRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartBattleRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aOM<BattleSide>(1, _omitFieldNames ? '' : 'leftSide',
        subBuilder: BattleSide.create)
    ..aOM<BattleSide>(2, _omitFieldNames ? '' : 'rightSide',
        subBuilder: BattleSide.create)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'winnerId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<BattleRound>(4, _omitFieldNames ? '' : 'rounds',
        subBuilder: BattleRound.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartBattleRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartBattleRsp copyWith(void Function(StartBattleRsp) updates) =>
      super.copyWith((message) => updates(message as StartBattleRsp))
          as StartBattleRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartBattleRsp create() => StartBattleRsp._();
  @$core.override
  StartBattleRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartBattleRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartBattleRsp>(create);
  static StartBattleRsp? _defaultInstance;

  /// 左方
  @$pb.TagNumber(1)
  BattleSide get leftSide => $_getN(0);
  @$pb.TagNumber(1)
  set leftSide(BattleSide value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLeftSide() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftSide() => $_clearField(1);
  @$pb.TagNumber(1)
  BattleSide ensureLeftSide() => $_ensure(0);

  /// 右方
  @$pb.TagNumber(2)
  BattleSide get rightSide => $_getN(1);
  @$pb.TagNumber(2)
  set rightSide(BattleSide value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRightSide() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightSide() => $_clearField(2);
  @$pb.TagNumber(2)
  BattleSide ensureRightSide() => $_ensure(1);

  /// 胜方ID
  @$pb.TagNumber(3)
  $fixnum.Int64 get winnerId => $_getI64(2);
  @$pb.TagNumber(3)
  set winnerId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWinnerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearWinnerId() => $_clearField(3);

  /// 对战回合
  @$pb.TagNumber(4)
  $pb.PbList<BattleRound> get rounds => $_getList(3);
}

/// *
///  对战回合
class BattleRound extends $pb.GeneratedMessage {
  factory BattleRound({
    $fixnum.Int64? attackMemberId,
    $fixnum.Int64? takeAttackMemberId,
    $core.int? attackValue,
    $core.int? leftRemainHitPoint,
    $core.int? rightRemainHitPoint,
    $core.Iterable<Battle>? battle,
    $core.int? roundOrder,
  }) {
    final result = create();
    if (attackMemberId != null) result.attackMemberId = attackMemberId;
    if (takeAttackMemberId != null)
      result.takeAttackMemberId = takeAttackMemberId;
    if (attackValue != null) result.attackValue = attackValue;
    if (leftRemainHitPoint != null)
      result.leftRemainHitPoint = leftRemainHitPoint;
    if (rightRemainHitPoint != null)
      result.rightRemainHitPoint = rightRemainHitPoint;
    if (battle != null) result.battle.addAll(battle);
    if (roundOrder != null) result.roundOrder = roundOrder;
    return result;
  }

  BattleRound._();

  factory BattleRound.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BattleRound.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BattleRound',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'attackMemberId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'takeAttackMemberId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(3, _omitFieldNames ? '' : 'attackValue',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'leftRemainHitPoint',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'rightRemainHitPoint',
        fieldType: $pb.PbFieldType.OU3)
    ..pPM<Battle>(6, _omitFieldNames ? '' : 'battle', subBuilder: Battle.create)
    ..aI(7, _omitFieldNames ? '' : 'roundOrder', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleRound clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleRound copyWith(void Function(BattleRound) updates) =>
      super.copyWith((message) => updates(message as BattleRound))
          as BattleRound;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BattleRound create() => BattleRound._();
  @$core.override
  BattleRound createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BattleRound getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BattleRound>(create);
  static BattleRound? _defaultInstance;

  /// 发起攻击方ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get attackMemberId => $_getI64(0);
  @$pb.TagNumber(1)
  set attackMemberId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAttackMemberId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAttackMemberId() => $_clearField(1);

  /// 承受攻击方ID
  @$pb.TagNumber(2)
  $fixnum.Int64 get takeAttackMemberId => $_getI64(1);
  @$pb.TagNumber(2)
  set takeAttackMemberId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTakeAttackMemberId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTakeAttackMemberId() => $_clearField(2);

  /// 伤害值
  @$pb.TagNumber(3)
  $core.int get attackValue => $_getIZ(2);
  @$pb.TagNumber(3)
  set attackValue($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAttackValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearAttackValue() => $_clearField(3);

  /// 左方剩余血量
  @$pb.TagNumber(4)
  $core.int get leftRemainHitPoint => $_getIZ(3);
  @$pb.TagNumber(4)
  set leftRemainHitPoint($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLeftRemainHitPoint() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeftRemainHitPoint() => $_clearField(4);

  /// 右方剩余血量
  @$pb.TagNumber(5)
  $core.int get rightRemainHitPoint => $_getIZ(4);
  @$pb.TagNumber(5)
  set rightRemainHitPoint($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRightRemainHitPoint() => $_has(4);
  @$pb.TagNumber(5)
  void clearRightRemainHitPoint() => $_clearField(5);

  /// 对战动作列表
  @$pb.TagNumber(6)
  $pb.PbList<Battle> get battle => $_getList(5);

  /// 对战回合编号
  @$pb.TagNumber(7)
  $core.int get roundOrder => $_getIZ(6);
  @$pb.TagNumber(7)
  set roundOrder($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRoundOrder() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoundOrder() => $_clearField(7);
}

class Battle extends $pb.GeneratedMessage {
  factory Battle({
    $core.Iterable<BattleAction>? attackSideAction,
    $core.Iterable<BattleAction>? takeAttackSideAction,
    $core.Iterable<BattleAction>? petAction,
  }) {
    final result = create();
    if (attackSideAction != null)
      result.attackSideAction.addAll(attackSideAction);
    if (takeAttackSideAction != null)
      result.takeAttackSideAction.addAll(takeAttackSideAction);
    if (petAction != null) result.petAction.addAll(petAction);
    return result;
  }

  Battle._();

  factory Battle.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Battle.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Battle',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..pPM<BattleAction>(1, _omitFieldNames ? '' : 'attackSideAction',
        subBuilder: BattleAction.create)
    ..pPM<BattleAction>(2, _omitFieldNames ? '' : 'takeAttackSideAction',
        subBuilder: BattleAction.create)
    ..pPM<BattleAction>(3, _omitFieldNames ? '' : 'petAction',
        subBuilder: BattleAction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Battle clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Battle copyWith(void Function(Battle) updates) =>
      super.copyWith((message) => updates(message as Battle)) as Battle;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Battle create() => Battle._();
  @$core.override
  Battle createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Battle getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Battle>(create);
  static Battle? _defaultInstance;

  /// 攻击方战斗动作
  @$pb.TagNumber(1)
  $pb.PbList<BattleAction> get attackSideAction => $_getList(0);

  /// 承受攻击方战斗动作
  @$pb.TagNumber(2)
  $pb.PbList<BattleAction> get takeAttackSideAction => $_getList(1);

  /// 宠物战斗动作
  @$pb.TagNumber(3)
  $pb.PbList<BattleAction> get petAction => $_getList(2);
}

/// *
///  对战动作
class BattleAction extends $pb.GeneratedMessage {
  factory BattleAction({
    $core.int? type,
    $core.String? dynamicResource,
    $core.int? value,
    $fixnum.Int64? memberId,
    $core.String? petIdentifier,
    $core.int? petSkillType,
    $core.String? skillIdentifier,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (dynamicResource != null) result.dynamicResource = dynamicResource;
    if (value != null) result.value = value;
    if (memberId != null) result.memberId = memberId;
    if (petIdentifier != null) result.petIdentifier = petIdentifier;
    if (petSkillType != null) result.petSkillType = petSkillType;
    if (skillIdentifier != null) result.skillIdentifier = skillIdentifier;
    return result;
  }

  BattleAction._();

  factory BattleAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BattleAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BattleAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'type', fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'dynamicResource')
    ..aI(3, _omitFieldNames ? '' : 'value', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'memberId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, _omitFieldNames ? '' : 'petIdentifier')
    ..aI(6, _omitFieldNames ? '' : 'petSkillType',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(7, _omitFieldNames ? '' : 'skillIdentifier')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleAction copyWith(void Function(BattleAction) updates) =>
      super.copyWith((message) => updates(message as BattleAction))
          as BattleAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BattleAction create() => BattleAction._();
  @$core.override
  BattleAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BattleAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BattleAction>(create);
  static BattleAction? _defaultInstance;

  /// 动作类型 0-普通攻击 1-暴击，2-连击，3-闪避 4-防御 5-宠物技能
  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  /// 动效资源
  @$pb.TagNumber(2)
  $core.String get dynamicResource => $_getSZ(1);
  @$pb.TagNumber(2)
  set dynamicResource($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDynamicResource() => $_has(1);
  @$pb.TagNumber(2)
  void clearDynamicResource() => $_clearField(2);

  /// 动作携带的数值，如果是攻击则是攻击值
  @$pb.TagNumber(3)
  $core.int get value => $_getIZ(2);
  @$pb.TagNumber(3)
  set value($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => $_clearField(3);

  /// 发起动作的成员ID
  @$pb.TagNumber(4)
  $fixnum.Int64 get memberId => $_getI64(3);
  @$pb.TagNumber(4)
  set memberId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMemberId() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemberId() => $_clearField(4);

  /// 宠物identifier
  @$pb.TagNumber(5)
  $core.String get petIdentifier => $_getSZ(4);
  @$pb.TagNumber(5)
  set petIdentifier($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPetIdentifier() => $_has(4);
  @$pb.TagNumber(5)
  void clearPetIdentifier() => $_clearField(5);

  /// 宠物技能类型
  @$pb.TagNumber(6)
  $core.int get petSkillType => $_getIZ(5);
  @$pb.TagNumber(6)
  set petSkillType($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPetSkillType() => $_has(5);
  @$pb.TagNumber(6)
  void clearPetSkillType() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get skillIdentifier => $_getSZ(6);
  @$pb.TagNumber(7)
  set skillIdentifier($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSkillIdentifier() => $_has(6);
  @$pb.TagNumber(7)
  void clearSkillIdentifier() => $_clearField(7);
}

/// *
///  对战方信息
class BattleSide extends $pb.GeneratedMessage {
  factory BattleSide({
    FleetMemberInfo? member,
    FleetInfo? fleet,
    $0.FleetDragonInfo? dragon,
    $core.Iterable<RewardItem>? rewardItems,
    $1.Pet? pet,
  }) {
    final result = create();
    if (member != null) result.member = member;
    if (fleet != null) result.fleet = fleet;
    if (dragon != null) result.dragon = dragon;
    if (rewardItems != null) result.rewardItems.addAll(rewardItems);
    if (pet != null) result.pet = pet;
    return result;
  }

  BattleSide._();

  factory BattleSide.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BattleSide.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BattleSide',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aOM<FleetMemberInfo>(1, _omitFieldNames ? '' : 'member',
        subBuilder: FleetMemberInfo.create)
    ..aOM<FleetInfo>(2, _omitFieldNames ? '' : 'fleet',
        subBuilder: FleetInfo.create)
    ..aOM<$0.FleetDragonInfo>(3, _omitFieldNames ? '' : 'dragon',
        subBuilder: $0.FleetDragonInfo.create)
    ..pPM<RewardItem>(4, _omitFieldNames ? '' : 'rewardItems',
        subBuilder: RewardItem.create)
    ..aOM<$1.Pet>(5, _omitFieldNames ? '' : 'pet', subBuilder: $1.Pet.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleSide clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleSide copyWith(void Function(BattleSide) updates) =>
      super.copyWith((message) => updates(message as BattleSide)) as BattleSide;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BattleSide create() => BattleSide._();
  @$core.override
  BattleSide createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BattleSide getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BattleSide>(create);
  static BattleSide? _defaultInstance;

  /// 成员信息
  @$pb.TagNumber(1)
  FleetMemberInfo get member => $_getN(0);
  @$pb.TagNumber(1)
  set member(FleetMemberInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMember() => $_has(0);
  @$pb.TagNumber(1)
  void clearMember() => $_clearField(1);
  @$pb.TagNumber(1)
  FleetMemberInfo ensureMember() => $_ensure(0);

  /// 战船信息
  @$pb.TagNumber(2)
  FleetInfo get fleet => $_getN(1);
  @$pb.TagNumber(2)
  set fleet(FleetInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFleet() => $_has(1);
  @$pb.TagNumber(2)
  void clearFleet() => $_clearField(2);
  @$pb.TagNumber(2)
  FleetInfo ensureFleet() => $_ensure(1);

  /// 战宠信息
  @$pb.TagNumber(3)
  $0.FleetDragonInfo get dragon => $_getN(2);
  @$pb.TagNumber(3)
  set dragon($0.FleetDragonInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDragon() => $_has(2);
  @$pb.TagNumber(3)
  void clearDragon() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.FleetDragonInfo ensureDragon() => $_ensure(2);

  /// 奖励信息
  @$pb.TagNumber(4)
  $pb.PbList<RewardItem> get rewardItems => $_getList(3);

  /// 神兽信息
  @$pb.TagNumber(5)
  $1.Pet get pet => $_getN(4);
  @$pb.TagNumber(5)
  set pet($1.Pet value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPet() => $_has(4);
  @$pb.TagNumber(5)
  void clearPet() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Pet ensurePet() => $_ensure(4);
}

/// *
///  奖励项
class RewardItem extends $pb.GeneratedMessage {
  factory RewardItem({
    $0.PkRewardType? rewardType,
    $core.int? num,
    $core.String? icon,
    $core.String? bg,
  }) {
    final result = create();
    if (rewardType != null) result.rewardType = rewardType;
    if (num != null) result.num = num;
    if (icon != null) result.icon = icon;
    if (bg != null) result.bg = bg;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aE<$0.PkRewardType>(1, _omitFieldNames ? '' : 'rewardType',
        enumValues: $0.PkRewardType.values)
    ..aI(2, _omitFieldNames ? '' : 'num', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aOS(4, _omitFieldNames ? '' : 'bg')
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

  /// 奖励类型
  @$pb.TagNumber(1)
  $0.PkRewardType get rewardType => $_getN(0);
  @$pb.TagNumber(1)
  set rewardType($0.PkRewardType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRewardType() => $_has(0);
  @$pb.TagNumber(1)
  void clearRewardType() => $_clearField(1);

  /// 数量
  @$pb.TagNumber(2)
  $core.int get num => $_getIZ(1);
  @$pb.TagNumber(2)
  set num($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearNum() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get bg => $_getSZ(3);
  @$pb.TagNumber(4)
  set bg($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBg() => $_has(3);
  @$pb.TagNumber(4)
  void clearBg() => $_clearField(4);
}

/// *
///  赛程分组列表接口响应数据
class ScheduleGroupsRsp extends $pb.GeneratedMessage {
  factory ScheduleGroupsRsp({
    $core.Iterable<ScheduleGroupItem>? groups,
  }) {
    final result = create();
    if (groups != null) result.groups.addAll(groups);
    return result;
  }

  ScheduleGroupsRsp._();

  factory ScheduleGroupsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleGroupsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleGroupsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..pPM<ScheduleGroupItem>(1, _omitFieldNames ? '' : 'groups',
        subBuilder: ScheduleGroupItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleGroupsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleGroupsRsp copyWith(void Function(ScheduleGroupsRsp) updates) =>
      super.copyWith((message) => updates(message as ScheduleGroupsRsp))
          as ScheduleGroupsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleGroupsRsp create() => ScheduleGroupsRsp._();
  @$core.override
  ScheduleGroupsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduleGroupsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleGroupsRsp>(create);
  static ScheduleGroupsRsp? _defaultInstance;

  /// 赛程分组列表
  @$pb.TagNumber(1)
  $pb.PbList<ScheduleGroupItem> get groups => $_getList(0);
}

/// *
///  赛程分组项
class ScheduleGroupItem extends $pb.GeneratedMessage {
  factory ScheduleGroupItem({
    FleetInfo? leftFleet,
    FleetInfo? rightFleet,
    $fixnum.Int64? winFleetId,
  }) {
    final result = create();
    if (leftFleet != null) result.leftFleet = leftFleet;
    if (rightFleet != null) result.rightFleet = rightFleet;
    if (winFleetId != null) result.winFleetId = winFleetId;
    return result;
  }

  ScheduleGroupItem._();

  factory ScheduleGroupItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleGroupItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleGroupItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aOM<FleetInfo>(1, _omitFieldNames ? '' : 'leftFleet',
        subBuilder: FleetInfo.create)
    ..aOM<FleetInfo>(2, _omitFieldNames ? '' : 'rightFleet',
        subBuilder: FleetInfo.create)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'winFleetId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleGroupItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleGroupItem copyWith(void Function(ScheduleGroupItem) updates) =>
      super.copyWith((message) => updates(message as ScheduleGroupItem))
          as ScheduleGroupItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleGroupItem create() => ScheduleGroupItem._();
  @$core.override
  ScheduleGroupItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduleGroupItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleGroupItem>(create);
  static ScheduleGroupItem? _defaultInstance;

  /// 左边舰队
  @$pb.TagNumber(1)
  FleetInfo get leftFleet => $_getN(0);
  @$pb.TagNumber(1)
  set leftFleet(FleetInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLeftFleet() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftFleet() => $_clearField(1);
  @$pb.TagNumber(1)
  FleetInfo ensureLeftFleet() => $_ensure(0);

  /// 右边舰队
  @$pb.TagNumber(2)
  FleetInfo get rightFleet => $_getN(1);
  @$pb.TagNumber(2)
  set rightFleet(FleetInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRightFleet() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightFleet() => $_clearField(2);
  @$pb.TagNumber(2)
  FleetInfo ensureRightFleet() => $_ensure(1);

  /// 胜方舰队ID
  @$pb.TagNumber(3)
  $fixnum.Int64 get winFleetId => $_getI64(2);
  @$pb.TagNumber(3)
  set winFleetId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWinFleetId() => $_has(2);
  @$pb.TagNumber(3)
  void clearWinFleetId() => $_clearField(3);
}

/// *
///  赛程Tab列表接口响应数据
class ScheduleTabRsp extends $pb.GeneratedMessage {
  factory ScheduleTabRsp({
    $core.Iterable<ScheduleTabItem>? tabs,
  }) {
    final result = create();
    if (tabs != null) result.tabs.addAll(tabs);
    return result;
  }

  ScheduleTabRsp._();

  factory ScheduleTabRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleTabRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleTabRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..pPM<ScheduleTabItem>(1, _omitFieldNames ? '' : 'tabs',
        subBuilder: ScheduleTabItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleTabRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleTabRsp copyWith(void Function(ScheduleTabRsp) updates) =>
      super.copyWith((message) => updates(message as ScheduleTabRsp))
          as ScheduleTabRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleTabRsp create() => ScheduleTabRsp._();
  @$core.override
  ScheduleTabRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduleTabRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleTabRsp>(create);
  static ScheduleTabRsp? _defaultInstance;

  /// 赛程Tab列表
  @$pb.TagNumber(1)
  $pb.PbList<ScheduleTabItem> get tabs => $_getList(0);
}

/// *
///  赛程 Tab 项
class ScheduleTabItem extends $pb.GeneratedMessage {
  factory ScheduleTabItem({
    $fixnum.Int64? id,
    $core.String? name,
    $core.bool? ifCurrentSchedule,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (ifCurrentSchedule != null) result.ifCurrentSchedule = ifCurrentSchedule;
    return result;
  }

  ScheduleTabItem._();

  factory ScheduleTabItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleTabItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleTabItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOB(3, _omitFieldNames ? '' : 'ifCurrentSchedule')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleTabItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleTabItem copyWith(void Function(ScheduleTabItem) updates) =>
      super.copyWith((message) => updates(message as ScheduleTabItem))
          as ScheduleTabItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleTabItem create() => ScheduleTabItem._();
  @$core.override
  ScheduleTabItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduleTabItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleTabItem>(create);
  static ScheduleTabItem? _defaultInstance;

  /// 赛程ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 赛程名称
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// 是否当前赛程
  @$pb.TagNumber(3)
  $core.bool get ifCurrentSchedule => $_getBF(2);
  @$pb.TagNumber(3)
  set ifCurrentSchedule($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIfCurrentSchedule() => $_has(2);
  @$pb.TagNumber(3)
  void clearIfCurrentSchedule() => $_clearField(3);
}

/// *
///  战斗参数详情接口响应数据
class BattlePowerRsp extends $pb.GeneratedMessage {
  factory BattlePowerRsp({
    $core.Iterable<$0.CommodityInfo>? commodities,
    $core.Iterable<EquipmentInfo>? equipments,
  }) {
    final result = create();
    if (commodities != null) result.commodities.addAll(commodities);
    if (equipments != null) result.equipments.addAll(equipments);
    return result;
  }

  BattlePowerRsp._();

  factory BattlePowerRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BattlePowerRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BattlePowerRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..pPM<$0.CommodityInfo>(1, _omitFieldNames ? '' : 'commodities',
        subBuilder: $0.CommodityInfo.create)
    ..pPM<EquipmentInfo>(2, _omitFieldNames ? '' : 'equipments',
        subBuilder: EquipmentInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattlePowerRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattlePowerRsp copyWith(void Function(BattlePowerRsp) updates) =>
      super.copyWith((message) => updates(message as BattlePowerRsp))
          as BattlePowerRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BattlePowerRsp create() => BattlePowerRsp._();
  @$core.override
  BattlePowerRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BattlePowerRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BattlePowerRsp>(create);
  static BattlePowerRsp? _defaultInstance;

  /// 穿戴的装扮列表
  @$pb.TagNumber(1)
  $pb.PbList<$0.CommodityInfo> get commodities => $_getList(0);

  /// 装备列表(恶龙，战船，盾牌)
  @$pb.TagNumber(2)
  $pb.PbList<EquipmentInfo> get equipments => $_getList(1);
}

/// *
///  接受挑战方成员列表响应数据
class BattleRivalsRsp extends $pb.GeneratedMessage {
  factory BattleRivalsRsp({
    $core.int? remainBattleTimes,
    $core.Iterable<FleetMemberInfo>? members,
  }) {
    final result = create();
    if (remainBattleTimes != null) result.remainBattleTimes = remainBattleTimes;
    if (members != null) result.members.addAll(members);
    return result;
  }

  BattleRivalsRsp._();

  factory BattleRivalsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BattleRivalsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BattleRivalsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'remainBattleTimes',
        fieldType: $pb.PbFieldType.OU3)
    ..pPM<FleetMemberInfo>(2, _omitFieldNames ? '' : 'members',
        subBuilder: FleetMemberInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleRivalsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleRivalsRsp copyWith(void Function(BattleRivalsRsp) updates) =>
      super.copyWith((message) => updates(message as BattleRivalsRsp))
          as BattleRivalsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BattleRivalsRsp create() => BattleRivalsRsp._();
  @$core.override
  BattleRivalsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BattleRivalsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BattleRivalsRsp>(create);
  static BattleRivalsRsp? _defaultInstance;

  /// 今日剩余对战次数
  @$pb.TagNumber(1)
  $core.int get remainBattleTimes => $_getIZ(0);
  @$pb.TagNumber(1)
  set remainBattleTimes($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRemainBattleTimes() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemainBattleTimes() => $_clearField(1);

  /// 接受挑战方成员列表
  @$pb.TagNumber(2)
  $pb.PbList<FleetMemberInfo> get members => $_getList(1);
}

/// *
///  对战前线匹配界面响应数据
class BattleFrontRsp extends $pb.GeneratedMessage {
  factory BattleFrontRsp({
    FleetInfo? leftFleet,
    FleetInfo? rightFleet,
    $core.Iterable<FleetMemberLevelItem>? leftMembers,
    $core.Iterable<FleetMemberLevelItem>? rightMembers,
    FleetMemberInfo? currentMember,
    $fixnum.Int64? scheduleId,
  }) {
    final result = create();
    if (leftFleet != null) result.leftFleet = leftFleet;
    if (rightFleet != null) result.rightFleet = rightFleet;
    if (leftMembers != null) result.leftMembers.addAll(leftMembers);
    if (rightMembers != null) result.rightMembers.addAll(rightMembers);
    if (currentMember != null) result.currentMember = currentMember;
    if (scheduleId != null) result.scheduleId = scheduleId;
    return result;
  }

  BattleFrontRsp._();

  factory BattleFrontRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BattleFrontRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BattleFrontRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aOM<FleetInfo>(1, _omitFieldNames ? '' : 'leftFleet',
        subBuilder: FleetInfo.create)
    ..aOM<FleetInfo>(2, _omitFieldNames ? '' : 'rightFleet',
        subBuilder: FleetInfo.create)
    ..pPM<FleetMemberLevelItem>(3, _omitFieldNames ? '' : 'leftMembers',
        subBuilder: FleetMemberLevelItem.create)
    ..pPM<FleetMemberLevelItem>(4, _omitFieldNames ? '' : 'rightMembers',
        subBuilder: FleetMemberLevelItem.create)
    ..aOM<FleetMemberInfo>(5, _omitFieldNames ? '' : 'currentMember',
        subBuilder: FleetMemberInfo.create)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'scheduleId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleFrontRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleFrontRsp copyWith(void Function(BattleFrontRsp) updates) =>
      super.copyWith((message) => updates(message as BattleFrontRsp))
          as BattleFrontRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BattleFrontRsp create() => BattleFrontRsp._();
  @$core.override
  BattleFrontRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BattleFrontRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BattleFrontRsp>(create);
  static BattleFrontRsp? _defaultInstance;

  /// 左方舰队
  @$pb.TagNumber(1)
  FleetInfo get leftFleet => $_getN(0);
  @$pb.TagNumber(1)
  set leftFleet(FleetInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLeftFleet() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftFleet() => $_clearField(1);
  @$pb.TagNumber(1)
  FleetInfo ensureLeftFleet() => $_ensure(0);

  /// 右方舰队
  @$pb.TagNumber(2)
  FleetInfo get rightFleet => $_getN(1);
  @$pb.TagNumber(2)
  set rightFleet(FleetInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRightFleet() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightFleet() => $_clearField(2);
  @$pb.TagNumber(2)
  FleetInfo ensureRightFleet() => $_ensure(1);

  /// 左方舰队梯队成员列表
  @$pb.TagNumber(3)
  $pb.PbList<FleetMemberLevelItem> get leftMembers => $_getList(2);

  /// 右方舰队梯队成员列表
  @$pb.TagNumber(4)
  $pb.PbList<FleetMemberLevelItem> get rightMembers => $_getList(3);

  /// 当前用户信息
  @$pb.TagNumber(5)
  FleetMemberInfo get currentMember => $_getN(4);
  @$pb.TagNumber(5)
  set currentMember(FleetMemberInfo value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCurrentMember() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentMember() => $_clearField(5);
  @$pb.TagNumber(5)
  FleetMemberInfo ensureCurrentMember() => $_ensure(4);

  /// 赛程ID
  @$pb.TagNumber(6)
  $fixnum.Int64 get scheduleId => $_getI64(5);
  @$pb.TagNumber(6)
  set scheduleId($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasScheduleId() => $_has(5);
  @$pb.TagNumber(6)
  void clearScheduleId() => $_clearField(6);
}

/// *
///  舰队成员等级列表项
class FleetMemberLevelItem extends $pb.GeneratedMessage {
  factory FleetMemberLevelItem({
    $core.int? level,
    $core.int? winnerStarsNum,
    $core.Iterable<FleetMemberInfo>? members,
    $core.String? levelName,
  }) {
    final result = create();
    if (level != null) result.level = level;
    if (winnerStarsNum != null) result.winnerStarsNum = winnerStarsNum;
    if (members != null) result.members.addAll(members);
    if (levelName != null) result.levelName = levelName;
    return result;
  }

  FleetMemberLevelItem._();

  factory FleetMemberLevelItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetMemberLevelItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetMemberLevelItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'level', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'winnerStarsNum',
        fieldType: $pb.PbFieldType.OU3)
    ..pPM<FleetMemberInfo>(3, _omitFieldNames ? '' : 'members',
        subBuilder: FleetMemberInfo.create)
    ..aOS(4, _omitFieldNames ? '' : 'levelName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetMemberLevelItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetMemberLevelItem copyWith(void Function(FleetMemberLevelItem) updates) =>
      super.copyWith((message) => updates(message as FleetMemberLevelItem))
          as FleetMemberLevelItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetMemberLevelItem create() => FleetMemberLevelItem._();
  @$core.override
  FleetMemberLevelItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetMemberLevelItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetMemberLevelItem>(create);
  static FleetMemberLevelItem? _defaultInstance;

  /// 所属梯队等级
  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => $_clearField(1);

  /// 打赢获得的星星数量
  @$pb.TagNumber(2)
  $core.int get winnerStarsNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set winnerStarsNum($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWinnerStarsNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearWinnerStarsNum() => $_clearField(2);

  /// 成员列表
  @$pb.TagNumber(3)
  $pb.PbList<FleetMemberInfo> get members => $_getList(2);

  /// 梯队等级名称
  @$pb.TagNumber(4)
  $core.String get levelName => $_getSZ(3);
  @$pb.TagNumber(4)
  set levelName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLevelName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevelName() => $_clearField(4);
}

/// *
///  舰队信息
class FleetInfo extends $pb.GeneratedMessage {
  factory FleetInfo({
    $core.String? name,
    $core.String? avatar,
    $core.int? level,
    $core.int? stars,
    $core.int? tonnage,
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (avatar != null) result.avatar = avatar;
    if (level != null) result.level = level;
    if (stars != null) result.stars = stars;
    if (tonnage != null) result.tonnage = tonnage;
    if (id != null) result.id = id;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'avatar')
    ..aI(3, _omitFieldNames ? '' : 'level', fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'stars', fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'tonnage', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(6, _omitFieldNames ? '' : 'id')
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

  /// 舰队名称
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// 舰队头像
  @$pb.TagNumber(2)
  $core.String get avatar => $_getSZ(1);
  @$pb.TagNumber(2)
  set avatar($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAvatar() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvatar() => $_clearField(2);

  /// 舰队等级
  @$pb.TagNumber(3)
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => $_clearField(3);

  /// 舰队星星数量
  @$pb.TagNumber(4)
  $core.int get stars => $_getIZ(3);
  @$pb.TagNumber(4)
  set stars($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStars() => $_has(3);
  @$pb.TagNumber(4)
  void clearStars() => $_clearField(4);

  /// 战船载重
  @$pb.TagNumber(5)
  $core.int get tonnage => $_getIZ(4);
  @$pb.TagNumber(5)
  set tonnage($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTonnage() => $_has(4);
  @$pb.TagNumber(5)
  void clearTonnage() => $_clearField(5);

  /// 舰队ID
  @$pb.TagNumber(6)
  $fixnum.Int64 get id => $_getI64(5);
  @$pb.TagNumber(6)
  set id($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasId() => $_has(5);
  @$pb.TagNumber(6)
  void clearId() => $_clearField(6);
}

/// *
///  舰队成员信息
class FleetMemberInfo extends $pb.GeneratedMessage {
  factory FleetMemberInfo({
    $fixnum.Int64? id,
    $core.String? nickName,
    $core.String? avatar,
    $core.String? gender,
    $core.int? attackValue,
    $core.int? defenseValue,
    $core.int? dragonBuff,
    $core.int? fleetBuff,
    $core.int? stars,
    $core.int? hitPoint,
    $fixnum.Int64? fleetId,
    $core.String? fleetName,
    $core.String? petIcon,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (nickName != null) result.nickName = nickName;
    if (avatar != null) result.avatar = avatar;
    if (gender != null) result.gender = gender;
    if (attackValue != null) result.attackValue = attackValue;
    if (defenseValue != null) result.defenseValue = defenseValue;
    if (dragonBuff != null) result.dragonBuff = dragonBuff;
    if (fleetBuff != null) result.fleetBuff = fleetBuff;
    if (stars != null) result.stars = stars;
    if (hitPoint != null) result.hitPoint = hitPoint;
    if (fleetId != null) result.fleetId = fleetId;
    if (fleetName != null) result.fleetName = fleetName;
    if (petIcon != null) result.petIcon = petIcon;
    return result;
  }

  FleetMemberInfo._();

  factory FleetMemberInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FleetMemberInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FleetMemberInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'nickName')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'gender')
    ..aI(5, _omitFieldNames ? '' : 'attackValue',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(6, _omitFieldNames ? '' : 'defenseValue',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(7, _omitFieldNames ? '' : 'dragonBuff', fieldType: $pb.PbFieldType.OU3)
    ..aI(8, _omitFieldNames ? '' : 'fleetBuff', fieldType: $pb.PbFieldType.OU3)
    ..aI(9, _omitFieldNames ? '' : 'stars', fieldType: $pb.PbFieldType.OU3)
    ..aI(10, _omitFieldNames ? '' : 'hitPoint', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(11, _omitFieldNames ? '' : 'fleetId')
    ..aOS(12, _omitFieldNames ? '' : 'fleetName')
    ..aOS(13, _omitFieldNames ? '' : 'petIcon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetMemberInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FleetMemberInfo copyWith(void Function(FleetMemberInfo) updates) =>
      super.copyWith((message) => updates(message as FleetMemberInfo))
          as FleetMemberInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FleetMemberInfo create() => FleetMemberInfo._();
  @$core.override
  FleetMemberInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FleetMemberInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FleetMemberInfo>(create);
  static FleetMemberInfo? _defaultInstance;

  /// 舰队成员ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 舰队成员昵称
  @$pb.TagNumber(2)
  $core.String get nickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickName() => $_clearField(2);

  /// 舰队成员头像
  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);

  /// 舰队成员性别
  @$pb.TagNumber(4)
  $core.String get gender => $_getSZ(3);
  @$pb.TagNumber(4)
  set gender($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => $_clearField(4);

  /// 攻击力
  @$pb.TagNumber(5)
  $core.int get attackValue => $_getIZ(4);
  @$pb.TagNumber(5)
  set attackValue($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAttackValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearAttackValue() => $_clearField(5);

  /// 防御值
  @$pb.TagNumber(6)
  $core.int get defenseValue => $_getIZ(5);
  @$pb.TagNumber(6)
  set defenseValue($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDefenseValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearDefenseValue() => $_clearField(6);

  /// 团宠buff
  @$pb.TagNumber(7)
  $core.int get dragonBuff => $_getIZ(6);
  @$pb.TagNumber(7)
  set dragonBuff($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDragonBuff() => $_has(6);
  @$pb.TagNumber(7)
  void clearDragonBuff() => $_clearField(7);

  /// 战船buff
  @$pb.TagNumber(8)
  $core.int get fleetBuff => $_getIZ(7);
  @$pb.TagNumber(8)
  set fleetBuff($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasFleetBuff() => $_has(7);
  @$pb.TagNumber(8)
  void clearFleetBuff() => $_clearField(8);

  /// 星星数量
  @$pb.TagNumber(9)
  $core.int get stars => $_getIZ(8);
  @$pb.TagNumber(9)
  set stars($core.int value) => $_setUnsignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasStars() => $_has(8);
  @$pb.TagNumber(9)
  void clearStars() => $_clearField(9);

  /// 初始血量
  @$pb.TagNumber(10)
  $core.int get hitPoint => $_getIZ(9);
  @$pb.TagNumber(10)
  set hitPoint($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasHitPoint() => $_has(9);
  @$pb.TagNumber(10)
  void clearHitPoint() => $_clearField(10);

  /// 舰队ID
  @$pb.TagNumber(11)
  $fixnum.Int64 get fleetId => $_getI64(10);
  @$pb.TagNumber(11)
  set fleetId($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasFleetId() => $_has(10);
  @$pb.TagNumber(11)
  void clearFleetId() => $_clearField(11);

  /// 舰队名称
  @$pb.TagNumber(12)
  $core.String get fleetName => $_getSZ(11);
  @$pb.TagNumber(12)
  set fleetName($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasFleetName() => $_has(11);
  @$pb.TagNumber(12)
  void clearFleetName() => $_clearField(12);

  /// 宠物图标
  @$pb.TagNumber(13)
  $core.String get petIcon => $_getSZ(12);
  @$pb.TagNumber(13)
  set petIcon($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasPetIcon() => $_has(12);
  @$pb.TagNumber(13)
  void clearPetIcon() => $_clearField(13);
}

/// *
///  装备信息
class EquipmentInfo extends $pb.GeneratedMessage {
  factory EquipmentInfo({
    $core.String? name,
    $core.String? icon,
    $core.String? desc,
    $core.int? boostValue,
    $core.String? bg,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (desc != null) result.desc = desc;
    if (boostValue != null) result.boostValue = boostValue;
    if (bg != null) result.bg = bg;
    return result;
  }

  EquipmentInfo._();

  factory EquipmentInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EquipmentInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EquipmentInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..aOS(3, _omitFieldNames ? '' : 'desc')
    ..aI(4, _omitFieldNames ? '' : 'boostValue', fieldType: $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'bg')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EquipmentInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EquipmentInfo copyWith(void Function(EquipmentInfo) updates) =>
      super.copyWith((message) => updates(message as EquipmentInfo))
          as EquipmentInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EquipmentInfo create() => EquipmentInfo._();
  @$core.override
  EquipmentInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EquipmentInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EquipmentInfo>(create);
  static EquipmentInfo? _defaultInstance;

  /// 名称
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// 资源图标
  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);

  /// 资源描述
  @$pb.TagNumber(3)
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => $_clearField(3);

  /// 加成值
  @$pb.TagNumber(4)
  $core.int get boostValue => $_getIZ(3);
  @$pb.TagNumber(4)
  set boostValue($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBoostValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoostValue() => $_clearField(4);

  /// 背景
  @$pb.TagNumber(5)
  $core.String get bg => $_getSZ(4);
  @$pb.TagNumber(5)
  set bg($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBg() => $_has(4);
  @$pb.TagNumber(5)
  void clearBg() => $_clearField(5);
}

/// *
///  对战奖励响应数据
class BattleBonusRsp extends $pb.GeneratedMessage {
  factory BattleBonusRsp({
    $core.Iterable<BattleBonusItem>? items,
    ShowInfo? currentInfo,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    if (currentInfo != null) result.currentInfo = currentInfo;
    return result;
  }

  BattleBonusRsp._();

  factory BattleBonusRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BattleBonusRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BattleBonusRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..pPM<BattleBonusItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: BattleBonusItem.create)
    ..aOM<ShowInfo>(2, _omitFieldNames ? '' : 'currentInfo',
        subBuilder: ShowInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleBonusRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleBonusRsp copyWith(void Function(BattleBonusRsp) updates) =>
      super.copyWith((message) => updates(message as BattleBonusRsp))
          as BattleBonusRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BattleBonusRsp create() => BattleBonusRsp._();
  @$core.override
  BattleBonusRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BattleBonusRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BattleBonusRsp>(create);
  static BattleBonusRsp? _defaultInstance;

  /// 奖励项列表
  @$pb.TagNumber(1)
  $pb.PbList<BattleBonusItem> get items => $_getList(0);

  /// 当前对象信息(人或舰队)
  @$pb.TagNumber(2)
  ShowInfo get currentInfo => $_getN(1);
  @$pb.TagNumber(2)
  set currentInfo(ShowInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCurrentInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  ShowInfo ensureCurrentInfo() => $_ensure(1);
}

/// *
///  对战奖赏列表项
class BattleBonusItem extends $pb.GeneratedMessage {
  factory BattleBonusItem({
    $core.String? tittle,
    $core.Iterable<Bonus>? bonus,
  }) {
    final result = create();
    if (tittle != null) result.tittle = tittle;
    if (bonus != null) result.bonus.addAll(bonus);
    return result;
  }

  BattleBonusItem._();

  factory BattleBonusItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BattleBonusItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BattleBonusItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tittle')
    ..pPM<Bonus>(2, _omitFieldNames ? '' : 'bonus', subBuilder: Bonus.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleBonusItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BattleBonusItem copyWith(void Function(BattleBonusItem) updates) =>
      super.copyWith((message) => updates(message as BattleBonusItem))
          as BattleBonusItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BattleBonusItem create() => BattleBonusItem._();
  @$core.override
  BattleBonusItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BattleBonusItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BattleBonusItem>(create);
  static BattleBonusItem? _defaultInstance;

  /// 标题
  @$pb.TagNumber(1)
  $core.String get tittle => $_getSZ(0);
  @$pb.TagNumber(1)
  set tittle($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTittle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTittle() => $_clearField(1);

  /// 奖赏项
  @$pb.TagNumber(2)
  $pb.PbList<Bonus> get bonus => $_getList(1);
}

class Bonus extends $pb.GeneratedMessage {
  factory Bonus({
    $core.String? desc,
    $core.String? icon,
    $core.String? amountStr,
  }) {
    final result = create();
    if (desc != null) result.desc = desc;
    if (icon != null) result.icon = icon;
    if (amountStr != null) result.amountStr = amountStr;
    return result;
  }

  Bonus._();

  factory Bonus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Bonus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Bonus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'desc')
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..aOS(3, _omitFieldNames ? '' : 'amountStr')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Bonus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Bonus copyWith(void Function(Bonus) updates) =>
      super.copyWith((message) => updates(message as Bonus)) as Bonus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Bonus create() => Bonus._();
  @$core.override
  Bonus createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Bonus getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Bonus>(create);
  static Bonus? _defaultInstance;

  /// 奖赏描述
  @$pb.TagNumber(1)
  $core.String get desc => $_getSZ(0);
  @$pb.TagNumber(1)
  set desc($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearDesc() => $_clearField(1);

  /// 图标
  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);

  /// 奖金数量(字符串，带单位)
  @$pb.TagNumber(3)
  $core.String get amountStr => $_getSZ(2);
  @$pb.TagNumber(3)
  set amountStr($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmountStr() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmountStr() => $_clearField(3);
}

class ShowInfo extends $pb.GeneratedMessage {
  factory ShowInfo({
    $core.String? name,
    $core.String? avatar,
    $core.int? level,
    $core.Iterable<ShowItem>? showItems,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (avatar != null) result.avatar = avatar;
    if (level != null) result.level = level;
    if (showItems != null) result.showItems.addAll(showItems);
    return result;
  }

  ShowInfo._();

  factory ShowInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShowInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShowInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'avatar')
    ..aI(3, _omitFieldNames ? '' : 'level', fieldType: $pb.PbFieldType.OU3)
    ..pPM<ShowItem>(4, _omitFieldNames ? '' : 'showItems',
        subBuilder: ShowItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShowInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShowInfo copyWith(void Function(ShowInfo) updates) =>
      super.copyWith((message) => updates(message as ShowInfo)) as ShowInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShowInfo create() => ShowInfo._();
  @$core.override
  ShowInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShowInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShowInfo>(create);
  static ShowInfo? _defaultInstance;

  /// 名称
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// 头像
  @$pb.TagNumber(2)
  $core.String get avatar => $_getSZ(1);
  @$pb.TagNumber(2)
  set avatar($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAvatar() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvatar() => $_clearField(2);

  /// 等级
  @$pb.TagNumber(3)
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => $_clearField(3);

  /// 展示项列表
  @$pb.TagNumber(4)
  $pb.PbList<ShowItem> get showItems => $_getList(3);
}

class ShowItem extends $pb.GeneratedMessage {
  factory ShowItem({
    $core.String? icon,
    $core.String? text,
    $core.int? num,
  }) {
    final result = create();
    if (icon != null) result.icon = icon;
    if (text != null) result.text = text;
    if (num != null) result.num = num;
    return result;
  }

  ShowItem._();

  factory ShowItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShowItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShowItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pk'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'icon')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..aI(3, _omitFieldNames ? '' : 'num', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShowItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShowItem copyWith(void Function(ShowItem) updates) =>
      super.copyWith((message) => updates(message as ShowItem)) as ShowItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShowItem create() => ShowItem._();
  @$core.override
  ShowItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShowItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShowItem>(create);
  static ShowItem? _defaultInstance;

  /// 图标
  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => $_clearField(1);

  /// 文案
  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => $_clearField(2);

  /// 数量
  @$pb.TagNumber(3)
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

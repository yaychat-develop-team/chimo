// This is a generated file - do not edit.
//
// Generated from server_client/activity/zodiac_act.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../base.pbenum.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class PrizeHistoryRsp extends $pb.GeneratedMessage {
  factory PrizeHistoryRsp({
    $core.Iterable<PrizeItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  PrizeHistoryRsp._();

  factory PrizeHistoryRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrizeHistoryRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrizeHistoryRsp',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'activity.zodiac'),
      createEmptyInstance: create)
    ..pPM<PrizeItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: PrizeItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrizeHistoryRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrizeHistoryRsp copyWith(void Function(PrizeHistoryRsp) updates) =>
      super.copyWith((message) => updates(message as PrizeHistoryRsp))
          as PrizeHistoryRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrizeHistoryRsp create() => PrizeHistoryRsp._();
  @$core.override
  PrizeHistoryRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PrizeHistoryRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrizeHistoryRsp>(create);
  static PrizeHistoryRsp? _defaultInstance;

  /// 奖品列表
  @$pb.TagNumber(1)
  $pb.PbList<PrizeItem> get items => $_getList(0);
}

class CloseContactFriendsRsp extends $pb.GeneratedMessage {
  factory CloseContactFriendsRsp({
    $core.Iterable<UserItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  CloseContactFriendsRsp._();

  factory CloseContactFriendsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CloseContactFriendsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CloseContactFriendsRsp',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'activity.zodiac'),
      createEmptyInstance: create)
    ..pPM<UserItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: UserItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CloseContactFriendsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CloseContactFriendsRsp copyWith(
          void Function(CloseContactFriendsRsp) updates) =>
      super.copyWith((message) => updates(message as CloseContactFriendsRsp))
          as CloseContactFriendsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CloseContactFriendsRsp create() => CloseContactFriendsRsp._();
  @$core.override
  CloseContactFriendsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CloseContactFriendsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CloseContactFriendsRsp>(create);
  static CloseContactFriendsRsp? _defaultInstance;

  /// 用户列表
  @$pb.TagNumber(1)
  $pb.PbList<UserItem> get items => $_getList(0);
}

class UserItem extends $pb.GeneratedMessage {
  factory UserItem({
    $fixnum.Int64? id,
    $core.String? gender,
    $core.String? nickname,
    $core.String? avatar,
    $core.String? emUsername,
    $core.int? onlineStatus,
    $core.String? vipLevelIcon,
    $core.int? vipLevel,
    $core.int? age,
    $core.int? days,
    $0.Job? job,
    $core.String? avatarFrame,
    $core.String? knightIcon,
    $core.int? secretUser,
    $core.String? knightInfoCard,
    $core.bool? robot,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (gender != null) result.gender = gender;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    if (emUsername != null) result.emUsername = emUsername;
    if (onlineStatus != null) result.onlineStatus = onlineStatus;
    if (vipLevelIcon != null) result.vipLevelIcon = vipLevelIcon;
    if (vipLevel != null) result.vipLevel = vipLevel;
    if (age != null) result.age = age;
    if (days != null) result.days = days;
    if (job != null) result.job = job;
    if (avatarFrame != null) result.avatarFrame = avatarFrame;
    if (knightIcon != null) result.knightIcon = knightIcon;
    if (secretUser != null) result.secretUser = secretUser;
    if (knightInfoCard != null) result.knightInfoCard = knightInfoCard;
    if (robot != null) result.robot = robot;
    return result;
  }

  UserItem._();

  factory UserItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserItem',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'activity.zodiac'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'gender')
    ..aOS(3, _omitFieldNames ? '' : 'nickname')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..aOS(5, _omitFieldNames ? '' : 'emUsername')
    ..aI(6, _omitFieldNames ? '' : 'onlineStatus')
    ..aOS(7, _omitFieldNames ? '' : 'vipLevelIcon')
    ..aI(8, _omitFieldNames ? '' : 'vipLevel')
    ..aI(9, _omitFieldNames ? '' : 'age')
    ..aI(10, _omitFieldNames ? '' : 'days')
    ..aE<$0.Job>(11, _omitFieldNames ? '' : 'job', enumValues: $0.Job.values)
    ..aOS(12, _omitFieldNames ? '' : 'avatarFrame')
    ..aOS(13, _omitFieldNames ? '' : 'knightIcon')
    ..aI(14, _omitFieldNames ? '' : 'secretUser')
    ..aOS(15, _omitFieldNames ? '' : 'knightInfoCard')
    ..aOB(16, _omitFieldNames ? '' : 'robot')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserItem copyWith(void Function(UserItem) updates) =>
      super.copyWith((message) => updates(message as UserItem)) as UserItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserItem create() => UserItem._();
  @$core.override
  UserItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserItem>(create);
  static UserItem? _defaultInstance;

  /// 用户ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 用户性别
  @$pb.TagNumber(2)
  $core.String get gender => $_getSZ(1);
  @$pb.TagNumber(2)
  set gender($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGender() => $_has(1);
  @$pb.TagNumber(2)
  void clearGender() => $_clearField(2);

  /// 用户昵称
  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickname($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickname() => $_clearField(3);

  /// 用户头像
  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatar($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatar() => $_clearField(4);

  /// 环信ID
  @$pb.TagNumber(5)
  $core.String get emUsername => $_getSZ(4);
  @$pb.TagNumber(5)
  set emUsername($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEmUsername() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmUsername() => $_clearField(5);

  /// 在线状态
  @$pb.TagNumber(6)
  $core.int get onlineStatus => $_getIZ(5);
  @$pb.TagNumber(6)
  set onlineStatus($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOnlineStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnlineStatus() => $_clearField(6);

  /// vip等级图标
  @$pb.TagNumber(7)
  $core.String get vipLevelIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set vipLevelIcon($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasVipLevelIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearVipLevelIcon() => $_clearField(7);

  /// vip等级
  @$pb.TagNumber(8)
  $core.int get vipLevel => $_getIZ(7);
  @$pb.TagNumber(8)
  set vipLevel($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasVipLevel() => $_has(7);
  @$pb.TagNumber(8)
  void clearVipLevel() => $_clearField(8);

  /// 年龄
  @$pb.TagNumber(9)
  $core.int get age => $_getIZ(8);
  @$pb.TagNumber(9)
  set age($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasAge() => $_has(8);
  @$pb.TagNumber(9)
  void clearAge() => $_clearField(9);

  /// 注册天数
  @$pb.TagNumber(10)
  $core.int get days => $_getIZ(9);
  @$pb.TagNumber(10)
  set days($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasDays() => $_has(9);
  @$pb.TagNumber(10)
  void clearDays() => $_clearField(10);

  /// 用户职业
  @$pb.TagNumber(11)
  $0.Job get job => $_getN(10);
  @$pb.TagNumber(11)
  set job($0.Job value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasJob() => $_has(10);
  @$pb.TagNumber(11)
  void clearJob() => $_clearField(11);

  /// 头像框
  @$pb.TagNumber(12)
  $core.String get avatarFrame => $_getSZ(11);
  @$pb.TagNumber(12)
  set avatarFrame($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasAvatarFrame() => $_has(11);
  @$pb.TagNumber(12)
  void clearAvatarFrame() => $_clearField(12);

  /// 爵位勋章
  @$pb.TagNumber(13)
  $core.String get knightIcon => $_getSZ(12);
  @$pb.TagNumber(13)
  set knightIcon($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasKnightIcon() => $_has(12);
  @$pb.TagNumber(13)
  void clearKnightIcon() => $_clearField(13);

  /// 是否神秘人 1-神秘人 0-不是
  @$pb.TagNumber(14)
  $core.int get secretUser => $_getIZ(13);
  @$pb.TagNumber(14)
  set secretUser($core.int value) => $_setSignedInt32(13, value);
  @$pb.TagNumber(14)
  $core.bool hasSecretUser() => $_has(13);
  @$pb.TagNumber(14)
  void clearSecretUser() => $_clearField(14);

  /// 爵位资料卡
  @$pb.TagNumber(15)
  $core.String get knightInfoCard => $_getSZ(14);
  @$pb.TagNumber(15)
  set knightInfoCard($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasKnightInfoCard() => $_has(14);
  @$pb.TagNumber(15)
  void clearKnightInfoCard() => $_clearField(15);

  /// 机器人
  @$pb.TagNumber(16)
  $core.bool get robot => $_getBF(15);
  @$pb.TagNumber(16)
  set robot($core.bool value) => $_setBool(15, value);
  @$pb.TagNumber(16)
  $core.bool hasRobot() => $_has(15);
  @$pb.TagNumber(16)
  void clearRobot() => $_clearField(16);
}

class StartLotteryReq extends $pb.GeneratedMessage {
  factory StartLotteryReq({
    $core.int? times,
  }) {
    final result = create();
    if (times != null) result.times = times;
    return result;
  }

  StartLotteryReq._();

  factory StartLotteryReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartLotteryReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartLotteryReq',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'activity.zodiac'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'times', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartLotteryReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartLotteryReq copyWith(void Function(StartLotteryReq) updates) =>
      super.copyWith((message) => updates(message as StartLotteryReq))
          as StartLotteryReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartLotteryReq create() => StartLotteryReq._();
  @$core.override
  StartLotteryReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartLotteryReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartLotteryReq>(create);
  static StartLotteryReq? _defaultInstance;

  /// 抽奖次数
  @$pb.TagNumber(1)
  $core.int get times => $_getIZ(0);
  @$pb.TagNumber(1)
  set times($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimes() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimes() => $_clearField(1);
}

class LotteryResultRsp extends $pb.GeneratedMessage {
  factory LotteryResultRsp({
    $core.Iterable<PrizeItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  LotteryResultRsp._();

  factory LotteryResultRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LotteryResultRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LotteryResultRsp',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'activity.zodiac'),
      createEmptyInstance: create)
    ..pPM<PrizeItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: PrizeItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LotteryResultRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LotteryResultRsp copyWith(void Function(LotteryResultRsp) updates) =>
      super.copyWith((message) => updates(message as LotteryResultRsp))
          as LotteryResultRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LotteryResultRsp create() => LotteryResultRsp._();
  @$core.override
  LotteryResultRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LotteryResultRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LotteryResultRsp>(create);
  static LotteryResultRsp? _defaultInstance;

  /// 中奖列表
  @$pb.TagNumber(1)
  $pb.PbList<PrizeItem> get items => $_getList(0);
}

class PrizeItem extends $pb.GeneratedMessage {
  factory PrizeItem({
    $fixnum.Int64? commodityId,
    $core.String? commodityIcon,
    $fixnum.Int64? period,
    $core.int? quantity,
    $fixnum.Int64? time,
    $core.String? name,
  }) {
    final result = create();
    if (commodityId != null) result.commodityId = commodityId;
    if (commodityIcon != null) result.commodityIcon = commodityIcon;
    if (period != null) result.period = period;
    if (quantity != null) result.quantity = quantity;
    if (time != null) result.time = time;
    if (name != null) result.name = name;
    return result;
  }

  PrizeItem._();

  factory PrizeItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrizeItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrizeItem',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'activity.zodiac'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'commodityId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'commodityIcon')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'period', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(4, _omitFieldNames ? '' : 'quantity', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrizeItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrizeItem copyWith(void Function(PrizeItem) updates) =>
      super.copyWith((message) => updates(message as PrizeItem)) as PrizeItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrizeItem create() => PrizeItem._();
  @$core.override
  PrizeItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PrizeItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PrizeItem>(create);
  static PrizeItem? _defaultInstance;

  /// 道具ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get commodityId => $_getI64(0);
  @$pb.TagNumber(1)
  set commodityId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCommodityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommodityId() => $_clearField(1);

  /// 道具icon
  @$pb.TagNumber(2)
  $core.String get commodityIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set commodityIcon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCommodityIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommodityIcon() => $_clearField(2);

  /// 有效期，单位：秒
  @$pb.TagNumber(3)
  $fixnum.Int64 get period => $_getI64(2);
  @$pb.TagNumber(3)
  set period($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPeriod() => $_has(2);
  @$pb.TagNumber(3)
  void clearPeriod() => $_clearField(3);

  /// 中奖数量
  @$pb.TagNumber(4)
  $core.int get quantity => $_getIZ(3);
  @$pb.TagNumber(4)
  set quantity($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuantity() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuantity() => $_clearField(4);

  /// 中奖时间
  @$pb.TagNumber(5)
  $fixnum.Int64 get time => $_getI64(4);
  @$pb.TagNumber(5)
  set time($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => $_clearField(5);

  /// 奖品名称
  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => $_clearField(6);
}

class LotteryWheelRsp extends $pb.GeneratedMessage {
  factory LotteryWheelRsp({
    $core.Iterable<WheelItem>? items,
    $core.int? remainingTimes,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    if (remainingTimes != null) result.remainingTimes = remainingTimes;
    return result;
  }

  LotteryWheelRsp._();

  factory LotteryWheelRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LotteryWheelRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LotteryWheelRsp',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'activity.zodiac'),
      createEmptyInstance: create)
    ..pPM<WheelItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: WheelItem.create)
    ..aI(2, _omitFieldNames ? '' : 'remainingTimes',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LotteryWheelRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LotteryWheelRsp copyWith(void Function(LotteryWheelRsp) updates) =>
      super.copyWith((message) => updates(message as LotteryWheelRsp))
          as LotteryWheelRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LotteryWheelRsp create() => LotteryWheelRsp._();
  @$core.override
  LotteryWheelRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LotteryWheelRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LotteryWheelRsp>(create);
  static LotteryWheelRsp? _defaultInstance;

  /// 转盘列表
  @$pb.TagNumber(1)
  $pb.PbList<WheelItem> get items => $_getList(0);

  /// 剩余抽奖次数
  @$pb.TagNumber(2)
  $core.int get remainingTimes => $_getIZ(1);
  @$pb.TagNumber(2)
  set remainingTimes($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRemainingTimes() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemainingTimes() => $_clearField(2);
}

class WheelItem extends $pb.GeneratedMessage {
  factory WheelItem({
    $fixnum.Int64? giftId,
    $core.String? giftIcon,
    $core.String? giftName,
    $core.int? giftPrice,
    $core.int? count,
  }) {
    final result = create();
    if (giftId != null) result.giftId = giftId;
    if (giftIcon != null) result.giftIcon = giftIcon;
    if (giftName != null) result.giftName = giftName;
    if (giftPrice != null) result.giftPrice = giftPrice;
    if (count != null) result.count = count;
    return result;
  }

  WheelItem._();

  factory WheelItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WheelItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WheelItem',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'activity.zodiac'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'giftId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'giftIcon')
    ..aOS(3, _omitFieldNames ? '' : 'giftName')
    ..aI(4, _omitFieldNames ? '' : 'giftPrice', fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WheelItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WheelItem copyWith(void Function(WheelItem) updates) =>
      super.copyWith((message) => updates(message as WheelItem)) as WheelItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WheelItem create() => WheelItem._();
  @$core.override
  WheelItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WheelItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WheelItem>(create);
  static WheelItem? _defaultInstance;

  /// 礼物ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get giftId => $_getI64(0);
  @$pb.TagNumber(1)
  set giftId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => $_clearField(1);

  /// 礼物icon
  @$pb.TagNumber(2)
  $core.String get giftIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set giftIcon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGiftIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftIcon() => $_clearField(2);

  /// 礼物名称
  @$pb.TagNumber(3)
  $core.String get giftName => $_getSZ(2);
  @$pb.TagNumber(3)
  set giftName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGiftName() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftName() => $_clearField(3);

  /// 礼物
  @$pb.TagNumber(4)
  $core.int get giftPrice => $_getIZ(3);
  @$pb.TagNumber(4)
  set giftPrice($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGiftPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftPrice() => $_clearField(4);

  /// 赠送次数
  @$pb.TagNumber(5)
  $core.int get count => $_getIZ(4);
  @$pb.TagNumber(5)
  set count($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearCount() => $_clearField(5);
}

class HonorHallRsp extends $pb.GeneratedMessage {
  factory HonorHallRsp({
    $core.Iterable<ZodiacCard>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  HonorHallRsp._();

  factory HonorHallRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HonorHallRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HonorHallRsp',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'activity.zodiac'),
      createEmptyInstance: create)
    ..pPM<ZodiacCard>(1, _omitFieldNames ? '' : 'items',
        subBuilder: ZodiacCard.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonorHallRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonorHallRsp copyWith(void Function(HonorHallRsp) updates) =>
      super.copyWith((message) => updates(message as HonorHallRsp))
          as HonorHallRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HonorHallRsp create() => HonorHallRsp._();
  @$core.override
  HonorHallRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HonorHallRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HonorHallRsp>(create);
  static HonorHallRsp? _defaultInstance;

  /// 星座卡片
  @$pb.TagNumber(1)
  $pb.PbList<ZodiacCard> get items => $_getList(0);
}

class ZodiacCard extends $pb.GeneratedMessage {
  factory ZodiacCard({
    $core.String? name,
    $core.bool? finished,
    $core.bool? current,
    $core.Iterable<HonorUserItem>? items,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (finished != null) result.finished = finished;
    if (current != null) result.current = current;
    if (items != null) result.items.addAll(items);
    return result;
  }

  ZodiacCard._();

  factory ZodiacCard.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ZodiacCard.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ZodiacCard',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'activity.zodiac'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOB(2, _omitFieldNames ? '' : 'finished')
    ..aOB(3, _omitFieldNames ? '' : 'current')
    ..pPM<HonorUserItem>(4, _omitFieldNames ? '' : 'items',
        subBuilder: HonorUserItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ZodiacCard clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ZodiacCard copyWith(void Function(ZodiacCard) updates) =>
      super.copyWith((message) => updates(message as ZodiacCard)) as ZodiacCard;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ZodiacCard create() => ZodiacCard._();
  @$core.override
  ZodiacCard createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ZodiacCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ZodiacCard>(create);
  static ZodiacCard? _defaultInstance;

  /// 星座名称
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// 是否结束
  @$pb.TagNumber(2)
  $core.bool get finished => $_getBF(1);
  @$pb.TagNumber(2)
  set finished($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFinished() => $_has(1);
  @$pb.TagNumber(2)
  void clearFinished() => $_clearField(2);

  /// 是否当前星座
  @$pb.TagNumber(3)
  $core.bool get current => $_getBF(2);
  @$pb.TagNumber(3)
  set current($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCurrent() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrent() => $_clearField(3);

  /// 荣誉堂用户
  @$pb.TagNumber(4)
  $pb.PbList<HonorUserItem> get items => $_getList(3);
}

class HonorDetailRsp extends $pb.GeneratedMessage {
  factory HonorDetailRsp({
    $core.Iterable<HonorUserItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  HonorDetailRsp._();

  factory HonorDetailRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HonorDetailRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HonorDetailRsp',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'activity.zodiac'),
      createEmptyInstance: create)
    ..pPM<HonorUserItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: HonorUserItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonorDetailRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonorDetailRsp copyWith(void Function(HonorDetailRsp) updates) =>
      super.copyWith((message) => updates(message as HonorDetailRsp))
          as HonorDetailRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HonorDetailRsp create() => HonorDetailRsp._();
  @$core.override
  HonorDetailRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HonorDetailRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HonorDetailRsp>(create);
  static HonorDetailRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<HonorUserItem> get items => $_getList(0);
}

class HonorUserItem extends $pb.GeneratedMessage {
  factory HonorUserItem({
    $fixnum.Int64? id,
    $core.String? gender,
    $core.String? nickname,
    $core.String? avatar,
    $core.String? emUsername,
    $0.Job? job,
    $core.bool? absence,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (gender != null) result.gender = gender;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    if (emUsername != null) result.emUsername = emUsername;
    if (job != null) result.job = job;
    if (absence != null) result.absence = absence;
    return result;
  }

  HonorUserItem._();

  factory HonorUserItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HonorUserItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HonorUserItem',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'activity.zodiac'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'gender')
    ..aOS(3, _omitFieldNames ? '' : 'nickname')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..aOS(5, _omitFieldNames ? '' : 'emUsername')
    ..aE<$0.Job>(6, _omitFieldNames ? '' : 'job', enumValues: $0.Job.values)
    ..aOB(7, _omitFieldNames ? '' : 'absence')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonorUserItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonorUserItem copyWith(void Function(HonorUserItem) updates) =>
      super.copyWith((message) => updates(message as HonorUserItem))
          as HonorUserItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HonorUserItem create() => HonorUserItem._();
  @$core.override
  HonorUserItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HonorUserItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HonorUserItem>(create);
  static HonorUserItem? _defaultInstance;

  /// 用户Id
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 性别
  @$pb.TagNumber(2)
  $core.String get gender => $_getSZ(1);
  @$pb.TagNumber(2)
  set gender($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGender() => $_has(1);
  @$pb.TagNumber(2)
  void clearGender() => $_clearField(2);

  /// 昵称
  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickname($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickname() => $_clearField(3);

  /// 头像
  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatar($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatar() => $_clearField(4);

  /// 环信用户ID
  @$pb.TagNumber(5)
  $core.String get emUsername => $_getSZ(4);
  @$pb.TagNumber(5)
  set emUsername($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEmUsername() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmUsername() => $_clearField(5);

  /// 用户职业
  @$pb.TagNumber(6)
  $0.Job get job => $_getN(5);
  @$pb.TagNumber(6)
  set job($0.Job value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasJob() => $_has(5);
  @$pb.TagNumber(6)
  void clearJob() => $_clearField(6);

  /// 是否缺席
  @$pb.TagNumber(7)
  $core.bool get absence => $_getBF(6);
  @$pb.TagNumber(7)
  set absence($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAbsence() => $_has(6);
  @$pb.TagNumber(7)
  void clearAbsence() => $_clearField(7);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

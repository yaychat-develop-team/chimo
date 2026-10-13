// This is a generated file - do not edit.
//
// Generated from server_client/ride.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common/car.pbenum.dart' as $2;
import 'label.pb.dart' as $0;
import 'ride.pbenum.dart';
import 'user.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'ride.pbenum.dart';

/// 开始兜风
class StartRideRequestReq extends $pb.GeneratedMessage {
  factory StartRideRequestReq({
    RideType? rideType,
    $fixnum.Int64? gs,
  }) {
    final result = create();
    if (rideType != null) result.rideType = rideType;
    if (gs != null) result.gs = gs;
    return result;
  }

  StartRideRequestReq._();

  factory StartRideRequestReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartRideRequestReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartRideRequestReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..aE<RideType>(1, _omitFieldNames ? '' : 'rideType',
        enumValues: RideType.values)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'gs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRideRequestReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRideRequestReq copyWith(void Function(StartRideRequestReq) updates) =>
      super.copyWith((message) => updates(message as StartRideRequestReq))
          as StartRideRequestReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartRideRequestReq create() => StartRideRequestReq._();
  @$core.override
  StartRideRequestReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartRideRequestReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartRideRequestReq>(create);
  static StartRideRequestReq? _defaultInstance;

  @$pb.TagNumber(1)
  RideType get rideType => $_getN(0);
  @$pb.TagNumber(1)
  set rideType(RideType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRideType() => $_has(0);
  @$pb.TagNumber(1)
  void clearRideType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get gs => $_getI64(1);
  @$pb.TagNumber(2)
  set gs($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGs() => $_has(1);
  @$pb.TagNumber(2)
  void clearGs() => $_clearField(2);
}

class StartRideRequestRspData extends $pb.GeneratedMessage {
  factory StartRideRequestRspData({
    $fixnum.Int64? dispatchDurationSec,
    $core.String? dispatchUntil,
    $core.bool? insufficientFund,
    $fixnum.Int64? price,
  }) {
    final result = create();
    if (dispatchDurationSec != null)
      result.dispatchDurationSec = dispatchDurationSec;
    if (dispatchUntil != null) result.dispatchUntil = dispatchUntil;
    if (insufficientFund != null) result.insufficientFund = insufficientFund;
    if (price != null) result.price = price;
    return result;
  }

  StartRideRequestRspData._();

  factory StartRideRequestRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartRideRequestRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartRideRequestRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'dispatchDurationSec', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'dispatchUntil')
    ..aOB(5, _omitFieldNames ? '' : 'insufficientFund')
    ..aInt64(6, _omitFieldNames ? '' : 'price')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRideRequestRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartRideRequestRspData copyWith(
          void Function(StartRideRequestRspData) updates) =>
      super.copyWith((message) => updates(message as StartRideRequestRspData))
          as StartRideRequestRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartRideRequestRspData create() => StartRideRequestRspData._();
  @$core.override
  StartRideRequestRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartRideRequestRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartRideRequestRspData>(create);
  static StartRideRequestRspData? _defaultInstance;

  /// 兜风邀请分发时间
  @$pb.TagNumber(3)
  $fixnum.Int64 get dispatchDurationSec => $_getI64(0);
  @$pb.TagNumber(3)
  set dispatchDurationSec($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(3)
  $core.bool hasDispatchDurationSec() => $_has(0);
  @$pb.TagNumber(3)
  void clearDispatchDurationSec() => $_clearField(3);

  /// 兜风邀请分发截止时间
  @$pb.TagNumber(4)
  $core.String get dispatchUntil => $_getSZ(1);
  @$pb.TagNumber(4)
  set dispatchUntil($core.String value) => $_setString(1, value);
  @$pb.TagNumber(4)
  $core.bool hasDispatchUntil() => $_has(1);
  @$pb.TagNumber(4)
  void clearDispatchUntil() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get insufficientFund => $_getBF(2);
  @$pb.TagNumber(5)
  set insufficientFund($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(5)
  $core.bool hasInsufficientFund() => $_has(2);
  @$pb.TagNumber(5)
  void clearInsufficientFund() => $_clearField(5);

  /// 本次兜风的价格
  @$pb.TagNumber(6)
  $fixnum.Int64 get price => $_getI64(3);
  @$pb.TagNumber(6)
  set price($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(6)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(6)
  void clearPrice() => $_clearField(6);
}

/// 接受/拒绝邀请
class InviteResponseReq extends $pb.GeneratedMessage {
  factory InviteResponseReq({
    $fixnum.Int64? user,
    $core.bool? accept,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (accept != null) result.accept = accept;
    return result;
  }

  InviteResponseReq._();

  factory InviteResponseReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteResponseReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteResponseReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'user', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(2, _omitFieldNames ? '' : 'accept')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteResponseReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteResponseReq copyWith(void Function(InviteResponseReq) updates) =>
      super.copyWith((message) => updates(message as InviteResponseReq))
          as InviteResponseReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteResponseReq create() => InviteResponseReq._();
  @$core.override
  InviteResponseReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InviteResponseReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteResponseReq>(create);
  static InviteResponseReq? _defaultInstance;

  /// 车主
  @$pb.TagNumber(1)
  $fixnum.Int64 get user => $_getI64(0);
  @$pb.TagNumber(1)
  set user($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);

  /// 是否接受
  @$pb.TagNumber(2)
  $core.bool get accept => $_getBF(1);
  @$pb.TagNumber(2)
  set accept($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAccept() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccept() => $_clearField(2);
}

/// 心动反选
class PickReq extends $pb.GeneratedMessage {
  factory PickReq({
    $fixnum.Int64? gs,
  }) {
    final result = create();
    if (gs != null) result.gs = gs;
    return result;
  }

  PickReq._();

  factory PickReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PickReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PickReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'gs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PickReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PickReq copyWith(void Function(PickReq) updates) =>
      super.copyWith((message) => updates(message as PickReq)) as PickReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PickReq create() => PickReq._();
  @$core.override
  PickReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PickReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PickReq>(create);
  static PickReq? _defaultInstance;

  /// 如果不设置gs 则视为放弃
  @$pb.TagNumber(1)
  $fixnum.Int64 get gs => $_getI64(0);
  @$pb.TagNumber(1)
  set gs($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGs() => $_has(0);
  @$pb.TagNumber(1)
  void clearGs() => $_clearField(1);
}

class PickRspData extends $pb.GeneratedMessage {
  factory PickRspData({
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  PickRspData._();

  factory PickRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PickRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PickRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PickRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PickRspData copyWith(void Function(PickRspData) updates) =>
      super.copyWith((message) => updates(message as PickRspData))
          as PickRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PickRspData create() => PickRspData._();
  @$core.override
  PickRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PickRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PickRspData>(create);
  static PickRspData? _defaultInstance;

  /// 兜风房 客户端也可以统一根据push做处理 也可以使用这里的数据 两个都会有
  /// 但是兜风剩余时间只在push中包含 因为要双方进房并上麦才算开始
  @$pb.TagNumber(3)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(3)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(3)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(3)
  void clearChannelId() => $_clearField(3);
}

/// 续费
class RenewReq extends $pb.GeneratedMessage {
  factory RenewReq() => create();

  RenewReq._();

  factory RenewReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RenewReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RenewReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewReq copyWith(void Function(RenewReq) updates) =>
      super.copyWith((message) => updates(message as RenewReq)) as RenewReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenewReq create() => RenewReq._();
  @$core.override
  RenewReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RenewReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RenewReq>(create);
  static RenewReq? _defaultInstance;
}

class RenewRspData extends $pb.GeneratedMessage {
  factory RenewRspData({
    $fixnum.Int64? durationSec,
    $fixnum.Int64? untilTimestampMs,
  }) {
    final result = create();
    if (durationSec != null) result.durationSec = durationSec;
    if (untilTimestampMs != null) result.untilTimestampMs = untilTimestampMs;
    return result;
  }

  RenewRspData._();

  factory RenewRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RenewRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RenewRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'durationSec', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'untilTimestampMs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewRspData copyWith(void Function(RenewRspData) updates) =>
      super.copyWith((message) => updates(message as RenewRspData))
          as RenewRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenewRspData create() => RenewRspData._();
  @$core.override
  RenewRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RenewRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RenewRspData>(create);
  static RenewRspData? _defaultInstance;

  /// 续费后剩余时间
  @$pb.TagNumber(3)
  $fixnum.Int64 get durationSec => $_getI64(0);
  @$pb.TagNumber(3)
  set durationSec($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(3)
  $core.bool hasDurationSec() => $_has(0);
  @$pb.TagNumber(3)
  void clearDurationSec() => $_clearField(3);

  /// 续费后截止时间
  @$pb.TagNumber(5)
  $fixnum.Int64 get untilTimestampMs => $_getI64(1);
  @$pb.TagNumber(5)
  set untilTimestampMs($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(5)
  $core.bool hasUntilTimestampMs() => $_has(1);
  @$pb.TagNumber(5)
  void clearUntilTimestampMs() => $_clearField(5);
}

/// 停止兜风
class EndReq extends $pb.GeneratedMessage {
  factory EndReq() => create();

  EndReq._();

  factory EndReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EndReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EndReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndReq copyWith(void Function(EndReq) updates) =>
      super.copyWith((message) => updates(message as EndReq)) as EndReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndReq create() => EndReq._();
  @$core.override
  EndReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EndReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EndReq>(create);
  static EndReq? _defaultInstance;
}

/// 取消兜风
class RideCancelReq extends $pb.GeneratedMessage {
  factory RideCancelReq() => create();

  RideCancelReq._();

  factory RideCancelReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideCancelReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideCancelReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideCancelReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideCancelReq copyWith(void Function(RideCancelReq) updates) =>
      super.copyWith((message) => updates(message as RideCancelReq))
          as RideCancelReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideCancelReq create() => RideCancelReq._();
  @$core.override
  RideCancelReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideCancelReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideCancelReq>(create);
  static RideCancelReq? _defaultInstance;
}

/// 开启趣聊卡
class QuestStartReq extends $pb.GeneratedMessage {
  factory QuestStartReq({
    $fixnum.Int64? inviteUserId,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (inviteUserId != null) result.inviteUserId = inviteUserId;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  QuestStartReq._();

  factory QuestStartReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuestStartReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuestStartReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'inviteUserId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestStartReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestStartReq copyWith(void Function(QuestStartReq) updates) =>
      super.copyWith((message) => updates(message as QuestStartReq))
          as QuestStartReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuestStartReq create() => QuestStartReq._();
  @$core.override
  QuestStartReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuestStartReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuestStartReq>(create);
  static QuestStartReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get inviteUserId => $_getI64(0);
  @$pb.TagNumber(1)
  set inviteUserId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInviteUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInviteUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get channelId => $_getI64(1);
  @$pb.TagNumber(2)
  set channelId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => $_clearField(2);
}

class QuestStartRsp extends $pb.GeneratedMessage {
  factory QuestStartRsp({
    $fixnum.Int64? sessionId,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    return result;
  }

  QuestStartRsp._();

  factory QuestStartRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuestStartRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuestStartRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestStartRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestStartRsp copyWith(void Function(QuestStartRsp) updates) =>
      super.copyWith((message) => updates(message as QuestStartRsp))
          as QuestStartRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuestStartRsp create() => QuestStartRsp._();
  @$core.override
  QuestStartRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuestStartRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuestStartRsp>(create);
  static QuestStartRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);
}

/// 接受趣聊卡邀请
class QuestAcceptReq extends $pb.GeneratedMessage {
  factory QuestAcceptReq({
    $fixnum.Int64? sessionId,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  QuestAcceptReq._();

  factory QuestAcceptReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuestAcceptReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuestAcceptReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestAcceptReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestAcceptReq copyWith(void Function(QuestAcceptReq) updates) =>
      super.copyWith((message) => updates(message as QuestAcceptReq))
          as QuestAcceptReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuestAcceptReq create() => QuestAcceptReq._();
  @$core.override
  QuestAcceptReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuestAcceptReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuestAcceptReq>(create);
  static QuestAcceptReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get channelId => $_getI64(1);
  @$pb.TagNumber(2)
  set channelId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => $_clearField(2);
}

/// 趣聊卡猜拳
class QuestGuessReq extends $pb.GeneratedMessage {
  factory QuestGuessReq({
    $fixnum.Int64? sessionId,
    QuestGuess? guess,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (guess != null) result.guess = guess;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  QuestGuessReq._();

  factory QuestGuessReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuestGuessReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuestGuessReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<QuestGuess>(2, _omitFieldNames ? '' : 'guess',
        enumValues: QuestGuess.values)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestGuessReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestGuessReq copyWith(void Function(QuestGuessReq) updates) =>
      super.copyWith((message) => updates(message as QuestGuessReq))
          as QuestGuessReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuestGuessReq create() => QuestGuessReq._();
  @$core.override
  QuestGuessReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuestGuessReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuestGuessReq>(create);
  static QuestGuessReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  QuestGuess get guess => $_getN(1);
  @$pb.TagNumber(2)
  set guess(QuestGuess value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasGuess() => $_has(1);
  @$pb.TagNumber(2)
  void clearGuess() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get channelId => $_getI64(2);
  @$pb.TagNumber(3)
  set channelId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChannelId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannelId() => $_clearField(3);
}

/// 趣聊卡刷新题组
class QuestRefreshReq extends $pb.GeneratedMessage {
  factory QuestRefreshReq({
    $fixnum.Int64? sessionId,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  QuestRefreshReq._();

  factory QuestRefreshReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuestRefreshReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuestRefreshReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestRefreshReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestRefreshReq copyWith(void Function(QuestRefreshReq) updates) =>
      super.copyWith((message) => updates(message as QuestRefreshReq))
          as QuestRefreshReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuestRefreshReq create() => QuestRefreshReq._();
  @$core.override
  QuestRefreshReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuestRefreshReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuestRefreshReq>(create);
  static QuestRefreshReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get channelId => $_getI64(1);
  @$pb.TagNumber(2)
  set channelId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => $_clearField(2);
}

/// 趣聊卡选定问题
class QuestPickReq extends $pb.GeneratedMessage {
  factory QuestPickReq({
    $fixnum.Int64? sessionId,
    $fixnum.Int64? questId,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (questId != null) result.questId = questId;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  QuestPickReq._();

  factory QuestPickReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuestPickReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuestPickReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'questId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestPickReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestPickReq copyWith(void Function(QuestPickReq) updates) =>
      super.copyWith((message) => updates(message as QuestPickReq))
          as QuestPickReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuestPickReq create() => QuestPickReq._();
  @$core.override
  QuestPickReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuestPickReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuestPickReq>(create);
  static QuestPickReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get questId => $_getI64(1);
  @$pb.TagNumber(2)
  set questId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuestId() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get channelId => $_getI64(2);
  @$pb.TagNumber(3)
  set channelId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChannelId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannelId() => $_clearField(3);
}

/// 趣聊卡问题
class QuestItem extends $pb.GeneratedMessage {
  factory QuestItem({
    $fixnum.Int64? questId,
    $core.String? content,
  }) {
    final result = create();
    if (questId != null) result.questId = questId;
    if (content != null) result.content = content;
    return result;
  }

  QuestItem._();

  factory QuestItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuestItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuestItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'questId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestItem copyWith(void Function(QuestItem) updates) =>
      super.copyWith((message) => updates(message as QuestItem)) as QuestItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuestItem create() => QuestItem._();
  @$core.override
  QuestItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuestItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QuestItem>(create);
  static QuestItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get questId => $_getI64(0);
  @$pb.TagNumber(1)
  set questId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);
}

/// 趣聊卡题组
class QuestListRsp extends $pb.GeneratedMessage {
  factory QuestListRsp({
    $core.Iterable<QuestItem>? question,
  }) {
    final result = create();
    if (question != null) result.question.addAll(question);
    return result;
  }

  QuestListRsp._();

  factory QuestListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuestListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuestListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..pPM<QuestItem>(2, _omitFieldNames ? '' : 'question',
        subBuilder: QuestItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuestListRsp copyWith(void Function(QuestListRsp) updates) =>
      super.copyWith((message) => updates(message as QuestListRsp))
          as QuestListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuestListRsp create() => QuestListRsp._();
  @$core.override
  QuestListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuestListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuestListRsp>(create);
  static QuestListRsp? _defaultInstance;

  @$pb.TagNumber(2)
  $pb.PbList<QuestItem> get question => $_getList(0);
}

enum RidePush_Message {
  invite,
  inviteEnd,
  gsResponse,
  rideIgnite,
  counter,
  end,
  privilege,
  questInvite,
  questStart,
  questGuess,
  questRefresh,
  questPick,
  noGsAccept,
  pickTimeOut,
  notSet
}

/// 兜风相关push
class RidePush extends $pb.GeneratedMessage {
  factory RidePush({
    $fixnum.Int64? user,
    $fixnum.Int64? gs,
    RidePushInvite? invite,
    RidePushInviteEnd? inviteEnd,
    RidePushGsResponse? gsResponse,
    RideIgnite? rideIgnite,
    RideCounter? counter,
    RideEnd? end,
    RidePrivilege? privilege,
    RideQuestPushInvite? questInvite,
    RideQuestPushStart? questStart,
    RideQuestPushGuess? questGuess,
    RideQuestPushRefresh? questRefresh,
    RideQuestPushPickQuest? questPick,
    RidePushNoGsAcceptInFifteenSeconds? noGsAccept,
    RidePickTimeOut? pickTimeOut,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (gs != null) result.gs = gs;
    if (invite != null) result.invite = invite;
    if (inviteEnd != null) result.inviteEnd = inviteEnd;
    if (gsResponse != null) result.gsResponse = gsResponse;
    if (rideIgnite != null) result.rideIgnite = rideIgnite;
    if (counter != null) result.counter = counter;
    if (end != null) result.end = end;
    if (privilege != null) result.privilege = privilege;
    if (questInvite != null) result.questInvite = questInvite;
    if (questStart != null) result.questStart = questStart;
    if (questGuess != null) result.questGuess = questGuess;
    if (questRefresh != null) result.questRefresh = questRefresh;
    if (questPick != null) result.questPick = questPick;
    if (noGsAccept != null) result.noGsAccept = noGsAccept;
    if (pickTimeOut != null) result.pickTimeOut = pickTimeOut;
    return result;
  }

  RidePush._();

  factory RidePush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RidePush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, RidePush_Message> _RidePush_MessageByTag = {
    3: RidePush_Message.invite,
    4: RidePush_Message.inviteEnd,
    5: RidePush_Message.gsResponse,
    6: RidePush_Message.rideIgnite,
    7: RidePush_Message.counter,
    8: RidePush_Message.end,
    9: RidePush_Message.privilege,
    10: RidePush_Message.questInvite,
    11: RidePush_Message.questStart,
    12: RidePush_Message.questGuess,
    13: RidePush_Message.questRefresh,
    14: RidePush_Message.questPick,
    15: RidePush_Message.noGsAccept,
    16: RidePush_Message.pickTimeOut,
    0: RidePush_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RidePush',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16])
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'user', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'gs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RidePushInvite>(3, _omitFieldNames ? '' : 'invite',
        subBuilder: RidePushInvite.create)
    ..aOM<RidePushInviteEnd>(4, _omitFieldNames ? '' : 'inviteEnd',
        subBuilder: RidePushInviteEnd.create)
    ..aOM<RidePushGsResponse>(5, _omitFieldNames ? '' : 'gsResponse',
        subBuilder: RidePushGsResponse.create)
    ..aOM<RideIgnite>(6, _omitFieldNames ? '' : 'rideIgnite',
        subBuilder: RideIgnite.create)
    ..aOM<RideCounter>(7, _omitFieldNames ? '' : 'counter',
        subBuilder: RideCounter.create)
    ..aOM<RideEnd>(8, _omitFieldNames ? '' : 'end', subBuilder: RideEnd.create)
    ..aOM<RidePrivilege>(9, _omitFieldNames ? '' : 'privilege',
        subBuilder: RidePrivilege.create)
    ..aOM<RideQuestPushInvite>(10, _omitFieldNames ? '' : 'questInvite',
        subBuilder: RideQuestPushInvite.create)
    ..aOM<RideQuestPushStart>(11, _omitFieldNames ? '' : 'questStart',
        subBuilder: RideQuestPushStart.create)
    ..aOM<RideQuestPushGuess>(12, _omitFieldNames ? '' : 'questGuess',
        subBuilder: RideQuestPushGuess.create)
    ..aOM<RideQuestPushRefresh>(13, _omitFieldNames ? '' : 'questRefresh',
        subBuilder: RideQuestPushRefresh.create)
    ..aOM<RideQuestPushPickQuest>(14, _omitFieldNames ? '' : 'questPick',
        subBuilder: RideQuestPushPickQuest.create)
    ..aOM<RidePushNoGsAcceptInFifteenSeconds>(
        15, _omitFieldNames ? '' : 'noGsAccept',
        subBuilder: RidePushNoGsAcceptInFifteenSeconds.create)
    ..aOM<RidePickTimeOut>(16, _omitFieldNames ? '' : 'pickTimeOut',
        subBuilder: RidePickTimeOut.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePush copyWith(void Function(RidePush) updates) =>
      super.copyWith((message) => updates(message as RidePush)) as RidePush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RidePush create() => RidePush._();
  @$core.override
  RidePush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RidePush getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RidePush>(create);
  static RidePush? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  RidePush_Message whichMessage() => _RidePush_MessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  void clearMessage() => $_clearField($_whichOneof(0));

  /// 车主
  @$pb.TagNumber(1)
  $fixnum.Int64 get user => $_getI64(0);
  @$pb.TagNumber(1)
  set user($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);

  /// GS信息 如果需要GS
  @$pb.TagNumber(2)
  $fixnum.Int64 get gs => $_getI64(1);
  @$pb.TagNumber(2)
  set gs($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGs() => $_has(1);
  @$pb.TagNumber(2)
  void clearGs() => $_clearField(2);

  /// gs消息
  @$pb.TagNumber(3)
  RidePushInvite get invite => $_getN(2);
  @$pb.TagNumber(3)
  set invite(RidePushInvite value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasInvite() => $_has(2);
  @$pb.TagNumber(3)
  void clearInvite() => $_clearField(3);
  @$pb.TagNumber(3)
  RidePushInvite ensureInvite() => $_ensure(2);

  @$pb.TagNumber(4)
  RidePushInviteEnd get inviteEnd => $_getN(3);
  @$pb.TagNumber(4)
  set inviteEnd(RidePushInviteEnd value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasInviteEnd() => $_has(3);
  @$pb.TagNumber(4)
  void clearInviteEnd() => $_clearField(4);
  @$pb.TagNumber(4)
  RidePushInviteEnd ensureInviteEnd() => $_ensure(3);

  /// 车主消息
  @$pb.TagNumber(5)
  RidePushGsResponse get gsResponse => $_getN(4);
  @$pb.TagNumber(5)
  set gsResponse(RidePushGsResponse value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasGsResponse() => $_has(4);
  @$pb.TagNumber(5)
  void clearGsResponse() => $_clearField(5);
  @$pb.TagNumber(5)
  RidePushGsResponse ensureGsResponse() => $_ensure(4);

  /// 通用消息
  @$pb.TagNumber(6)
  RideIgnite get rideIgnite => $_getN(5);
  @$pb.TagNumber(6)
  set rideIgnite(RideIgnite value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasRideIgnite() => $_has(5);
  @$pb.TagNumber(6)
  void clearRideIgnite() => $_clearField(6);
  @$pb.TagNumber(6)
  RideIgnite ensureRideIgnite() => $_ensure(5);

  @$pb.TagNumber(7)
  RideCounter get counter => $_getN(6);
  @$pb.TagNumber(7)
  set counter(RideCounter value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasCounter() => $_has(6);
  @$pb.TagNumber(7)
  void clearCounter() => $_clearField(7);
  @$pb.TagNumber(7)
  RideCounter ensureCounter() => $_ensure(6);

  @$pb.TagNumber(8)
  RideEnd get end => $_getN(7);
  @$pb.TagNumber(8)
  set end(RideEnd value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasEnd() => $_has(7);
  @$pb.TagNumber(8)
  void clearEnd() => $_clearField(8);
  @$pb.TagNumber(8)
  RideEnd ensureEnd() => $_ensure(7);

  /// 兜风特权
  @$pb.TagNumber(9)
  RidePrivilege get privilege => $_getN(8);
  @$pb.TagNumber(9)
  set privilege(RidePrivilege value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasPrivilege() => $_has(8);
  @$pb.TagNumber(9)
  void clearPrivilege() => $_clearField(9);
  @$pb.TagNumber(9)
  RidePrivilege ensurePrivilege() => $_ensure(8);

  /// 趣聊邀请
  @$pb.TagNumber(10)
  RideQuestPushInvite get questInvite => $_getN(9);
  @$pb.TagNumber(10)
  set questInvite(RideQuestPushInvite value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasQuestInvite() => $_has(9);
  @$pb.TagNumber(10)
  void clearQuestInvite() => $_clearField(10);
  @$pb.TagNumber(10)
  RideQuestPushInvite ensureQuestInvite() => $_ensure(9);

  /// 趣聊开启
  @$pb.TagNumber(11)
  RideQuestPushStart get questStart => $_getN(10);
  @$pb.TagNumber(11)
  set questStart(RideQuestPushStart value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasQuestStart() => $_has(10);
  @$pb.TagNumber(11)
  void clearQuestStart() => $_clearField(11);
  @$pb.TagNumber(11)
  RideQuestPushStart ensureQuestStart() => $_ensure(10);

  /// 趣聊猜拳结果
  @$pb.TagNumber(12)
  RideQuestPushGuess get questGuess => $_getN(11);
  @$pb.TagNumber(12)
  set questGuess(RideQuestPushGuess value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasQuestGuess() => $_has(11);
  @$pb.TagNumber(12)
  void clearQuestGuess() => $_clearField(12);
  @$pb.TagNumber(12)
  RideQuestPushGuess ensureQuestGuess() => $_ensure(11);

  /// 趣聊问题刷新
  @$pb.TagNumber(13)
  RideQuestPushRefresh get questRefresh => $_getN(12);
  @$pb.TagNumber(13)
  set questRefresh(RideQuestPushRefresh value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasQuestRefresh() => $_has(12);
  @$pb.TagNumber(13)
  void clearQuestRefresh() => $_clearField(13);
  @$pb.TagNumber(13)
  RideQuestPushRefresh ensureQuestRefresh() => $_ensure(12);

  /// 趣聊问题选定
  @$pb.TagNumber(14)
  RideQuestPushPickQuest get questPick => $_getN(13);
  @$pb.TagNumber(14)
  set questPick(RideQuestPushPickQuest value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasQuestPick() => $_has(13);
  @$pb.TagNumber(14)
  void clearQuestPick() => $_clearField(14);
  @$pb.TagNumber(14)
  RideQuestPushPickQuest ensureQuestPick() => $_ensure(13);

  @$pb.TagNumber(15)
  RidePushNoGsAcceptInFifteenSeconds get noGsAccept => $_getN(14);
  @$pb.TagNumber(15)
  set noGsAccept(RidePushNoGsAcceptInFifteenSeconds value) =>
      $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasNoGsAccept() => $_has(14);
  @$pb.TagNumber(15)
  void clearNoGsAccept() => $_clearField(15);
  @$pb.TagNumber(15)
  RidePushNoGsAcceptInFifteenSeconds ensureNoGsAccept() => $_ensure(14);

  @$pb.TagNumber(16)
  RidePickTimeOut get pickTimeOut => $_getN(15);
  @$pb.TagNumber(16)
  set pickTimeOut(RidePickTimeOut value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasPickTimeOut() => $_has(15);
  @$pb.TagNumber(16)
  void clearPickTimeOut() => $_clearField(16);
  @$pb.TagNumber(16)
  RidePickTimeOut ensurePickTimeOut() => $_ensure(15);
}

/// 心动反选超时
class RidePickTimeOut extends $pb.GeneratedMessage {
  factory RidePickTimeOut() => create();

  RidePickTimeOut._();

  factory RidePickTimeOut.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RidePickTimeOut.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RidePickTimeOut',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePickTimeOut clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePickTimeOut copyWith(void Function(RidePickTimeOut) updates) =>
      super.copyWith((message) => updates(message as RidePickTimeOut))
          as RidePickTimeOut;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RidePickTimeOut create() => RidePickTimeOut._();
  @$core.override
  RidePickTimeOut createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RidePickTimeOut getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RidePickTimeOut>(create);
  static RidePickTimeOut? _defaultInstance;
}

class RidePrivilege extends $pb.GeneratedMessage {
  factory RidePrivilege({
    PrivilegeContent? content,
    PrivilegeOperation? operation,
  }) {
    final result = create();
    if (content != null) result.content = content;
    if (operation != null) result.operation = operation;
    return result;
  }

  RidePrivilege._();

  factory RidePrivilege.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RidePrivilege.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RidePrivilege',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..aOM<PrivilegeContent>(1, _omitFieldNames ? '' : 'content',
        subBuilder: PrivilegeContent.create)
    ..aE<PrivilegeOperation>(2, _omitFieldNames ? '' : 'operation',
        enumValues: PrivilegeOperation.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePrivilege clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePrivilege copyWith(void Function(RidePrivilege) updates) =>
      super.copyWith((message) => updates(message as RidePrivilege))
          as RidePrivilege;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RidePrivilege create() => RidePrivilege._();
  @$core.override
  RidePrivilege createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RidePrivilege getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RidePrivilege>(create);
  static RidePrivilege? _defaultInstance;

  @$pb.TagNumber(1)
  PrivilegeContent get content => $_getN(0);
  @$pb.TagNumber(1)
  set content(PrivilegeContent value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);
  @$pb.TagNumber(1)
  PrivilegeContent ensureContent() => $_ensure(0);

  @$pb.TagNumber(2)
  PrivilegeOperation get operation => $_getN(1);
  @$pb.TagNumber(2)
  set operation(PrivilegeOperation value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOperation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperation() => $_clearField(2);
}

class PrivilegeContent extends $pb.GeneratedMessage {
  factory PrivilegeContent({
    $2.CarPrivilegeType? privilegeType,
    $core.String? desc,
    $core.String? extDesc,
  }) {
    final result = create();
    if (privilegeType != null) result.privilegeType = privilegeType;
    if (desc != null) result.desc = desc;
    if (extDesc != null) result.extDesc = extDesc;
    return result;
  }

  PrivilegeContent._();

  factory PrivilegeContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrivilegeContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrivilegeContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..aE<$2.CarPrivilegeType>(1, _omitFieldNames ? '' : 'privilegeType',
        protoName: 'privilegeType', enumValues: $2.CarPrivilegeType.values)
    ..aOS(2, _omitFieldNames ? '' : 'desc')
    ..aOS(3, _omitFieldNames ? '' : 'extDesc')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrivilegeContent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrivilegeContent copyWith(void Function(PrivilegeContent) updates) =>
      super.copyWith((message) => updates(message as PrivilegeContent))
          as PrivilegeContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrivilegeContent create() => PrivilegeContent._();
  @$core.override
  PrivilegeContent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PrivilegeContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrivilegeContent>(create);
  static PrivilegeContent? _defaultInstance;

  @$pb.TagNumber(1)
  $2.CarPrivilegeType get privilegeType => $_getN(0);
  @$pb.TagNumber(1)
  set privilegeType($2.CarPrivilegeType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPrivilegeType() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivilegeType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get extDesc => $_getSZ(2);
  @$pb.TagNumber(3)
  set extDesc($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExtDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtDesc() => $_clearField(3);
}

/// 通知GS有兜风邀请
class RidePushInvite extends $pb.GeneratedMessage {
  factory RidePushInvite({
    RideType? type,
    $fixnum.Int64? dispatchDurationSec,
    $fixnum.Int64? dispatchUntilTimestampMs,
    $core.Iterable<$0.LabelItem>? likeLabels,
    $core.Iterable<$0.LabelItem>? wantLabels,
    $core.String? carLink,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (dispatchDurationSec != null)
      result.dispatchDurationSec = dispatchDurationSec;
    if (dispatchUntilTimestampMs != null)
      result.dispatchUntilTimestampMs = dispatchUntilTimestampMs;
    if (likeLabels != null) result.likeLabels.addAll(likeLabels);
    if (wantLabels != null) result.wantLabels.addAll(wantLabels);
    if (carLink != null) result.carLink = carLink;
    return result;
  }

  RidePushInvite._();

  factory RidePushInvite.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RidePushInvite.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RidePushInvite',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..aE<RideType>(1, _omitFieldNames ? '' : 'type',
        enumValues: RideType.values)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'dispatchDurationSec', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'dispatchUntilTimestampMs',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<$0.LabelItem>(5, _omitFieldNames ? '' : 'likeLabels',
        subBuilder: $0.LabelItem.create)
    ..pPM<$0.LabelItem>(6, _omitFieldNames ? '' : 'wantLabels',
        subBuilder: $0.LabelItem.create)
    ..aOS(7, _omitFieldNames ? '' : 'carLink')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePushInvite clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePushInvite copyWith(void Function(RidePushInvite) updates) =>
      super.copyWith((message) => updates(message as RidePushInvite))
          as RidePushInvite;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RidePushInvite create() => RidePushInvite._();
  @$core.override
  RidePushInvite createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RidePushInvite getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RidePushInvite>(create);
  static RidePushInvite? _defaultInstance;

  /// 类型
  @$pb.TagNumber(1)
  RideType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(RideType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  /// 兜风邀请分发时间
  @$pb.TagNumber(2)
  $fixnum.Int64 get dispatchDurationSec => $_getI64(1);
  @$pb.TagNumber(2)
  set dispatchDurationSec($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDispatchDurationSec() => $_has(1);
  @$pb.TagNumber(2)
  void clearDispatchDurationSec() => $_clearField(2);

  /// 兜风邀请分发截止时间
  @$pb.TagNumber(4)
  $fixnum.Int64 get dispatchUntilTimestampMs => $_getI64(2);
  @$pb.TagNumber(4)
  set dispatchUntilTimestampMs($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(4)
  $core.bool hasDispatchUntilTimestampMs() => $_has(2);
  @$pb.TagNumber(4)
  void clearDispatchUntilTimestampMs() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$0.LabelItem> get likeLabels => $_getList(3);

  @$pb.TagNumber(6)
  $pb.PbList<$0.LabelItem> get wantLabels => $_getList(4);

  @$pb.TagNumber(7)
  $core.String get carLink => $_getSZ(5);
  @$pb.TagNumber(7)
  set carLink($core.String value) => $_setString(5, value);
  @$pb.TagNumber(7)
  $core.bool hasCarLink() => $_has(5);
  @$pb.TagNumber(7)
  void clearCarLink() => $_clearField(7);
}

/// 通知GS兜风邀请失效
class RidePushInviteEnd extends $pb.GeneratedMessage {
  factory RidePushInviteEnd({
    $core.bool? timeout,
  }) {
    final result = create();
    if (timeout != null) result.timeout = timeout;
    return result;
  }

  RidePushInviteEnd._();

  factory RidePushInviteEnd.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RidePushInviteEnd.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RidePushInviteEnd',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'timeout')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePushInviteEnd clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePushInviteEnd copyWith(void Function(RidePushInviteEnd) updates) =>
      super.copyWith((message) => updates(message as RidePushInviteEnd))
          as RidePushInviteEnd;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RidePushInviteEnd create() => RidePushInviteEnd._();
  @$core.override
  RidePushInviteEnd createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RidePushInviteEnd getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RidePushInviteEnd>(create);
  static RidePushInviteEnd? _defaultInstance;

  /// 是否因为超时
  @$pb.TagNumber(1)
  $core.bool get timeout => $_getBF(0);
  @$pb.TagNumber(1)
  set timeout($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimeout() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimeout() => $_clearField(1);
}

/// 15秒后仍无嘉宾接单，通知车手
class RidePushNoGsAcceptInFifteenSeconds extends $pb.GeneratedMessage {
  factory RidePushNoGsAcceptInFifteenSeconds({
    $core.int? redistributeCount,
  }) {
    final result = create();
    if (redistributeCount != null) result.redistributeCount = redistributeCount;
    return result;
  }

  RidePushNoGsAcceptInFifteenSeconds._();

  factory RidePushNoGsAcceptInFifteenSeconds.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RidePushNoGsAcceptInFifteenSeconds.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RidePushNoGsAcceptInFifteenSeconds',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'redistributeCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePushNoGsAcceptInFifteenSeconds clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePushNoGsAcceptInFifteenSeconds copyWith(
          void Function(RidePushNoGsAcceptInFifteenSeconds) updates) =>
      super.copyWith((message) =>
              updates(message as RidePushNoGsAcceptInFifteenSeconds))
          as RidePushNoGsAcceptInFifteenSeconds;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RidePushNoGsAcceptInFifteenSeconds create() =>
      RidePushNoGsAcceptInFifteenSeconds._();
  @$core.override
  RidePushNoGsAcceptInFifteenSeconds createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RidePushNoGsAcceptInFifteenSeconds getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RidePushNoGsAcceptInFifteenSeconds>(
          create);
  static RidePushNoGsAcceptInFifteenSeconds? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get redistributeCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set redistributeCount($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRedistributeCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearRedistributeCount() => $_clearField(1);
}

/// 通知客户端兜风邀请结果
class RidePushGsResponse extends $pb.GeneratedMessage {
  factory RidePushGsResponse({
    $core.Iterable<$1.SimpleGsUser>? accepted,
    $fixnum.Int64? pickTimeoutSec,
    $fixnum.Int64? pickUntilTimestampMs,
  }) {
    final result = create();
    if (accepted != null) result.accepted.addAll(accepted);
    if (pickTimeoutSec != null) result.pickTimeoutSec = pickTimeoutSec;
    if (pickUntilTimestampMs != null)
      result.pickUntilTimestampMs = pickUntilTimestampMs;
    return result;
  }

  RidePushGsResponse._();

  factory RidePushGsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RidePushGsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RidePushGsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..pPM<$1.SimpleGsUser>(1, _omitFieldNames ? '' : 'accepted',
        subBuilder: $1.SimpleGsUser.create)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'pickTimeoutSec', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'pickUntilTimestampMs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePushGsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePushGsResponse copyWith(void Function(RidePushGsResponse) updates) =>
      super.copyWith((message) => updates(message as RidePushGsResponse))
          as RidePushGsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RidePushGsResponse create() => RidePushGsResponse._();
  @$core.override
  RidePushGsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RidePushGsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RidePushGsResponse>(create);
  static RidePushGsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$1.SimpleGsUser> get accepted => $_getList(0);

  /// 心动反选超时时间
  @$pb.TagNumber(4)
  $fixnum.Int64 get pickTimeoutSec => $_getI64(1);
  @$pb.TagNumber(4)
  set pickTimeoutSec($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(4)
  $core.bool hasPickTimeoutSec() => $_has(1);
  @$pb.TagNumber(4)
  void clearPickTimeoutSec() => $_clearField(4);

  /// 心动反选截止时间
  @$pb.TagNumber(6)
  $fixnum.Int64 get pickUntilTimestampMs => $_getI64(2);
  @$pb.TagNumber(6)
  set pickUntilTimestampMs($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(6)
  $core.bool hasPickUntilTimestampMs() => $_has(2);
  @$pb.TagNumber(6)
  void clearPickUntilTimestampMs() => $_clearField(6);
}

/// 通知兜风开始
class RideIgnite extends $pb.GeneratedMessage {
  factory RideIgnite({
    $fixnum.Int64? channel,
    $fixnum.Int64? joinTimeoutSec,
    $fixnum.Int64? joinUntilTimestampMs,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (joinTimeoutSec != null) result.joinTimeoutSec = joinTimeoutSec;
    if (joinUntilTimestampMs != null)
      result.joinUntilTimestampMs = joinUntilTimestampMs;
    return result;
  }

  RideIgnite._();

  factory RideIgnite.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideIgnite.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideIgnite',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'joinTimeoutSec', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'joinUntilTimestampMs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideIgnite clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideIgnite copyWith(void Function(RideIgnite) updates) =>
      super.copyWith((message) => updates(message as RideIgnite)) as RideIgnite;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideIgnite create() => RideIgnite._();
  @$core.override
  RideIgnite createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideIgnite getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideIgnite>(create);
  static RideIgnite? _defaultInstance;

  /// 房间
  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  /// 加入超时时间
  @$pb.TagNumber(2)
  $fixnum.Int64 get joinTimeoutSec => $_getI64(1);
  @$pb.TagNumber(2)
  set joinTimeoutSec($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasJoinTimeoutSec() => $_has(1);
  @$pb.TagNumber(2)
  void clearJoinTimeoutSec() => $_clearField(2);

  /// 加入截止时间
  @$pb.TagNumber(4)
  $fixnum.Int64 get joinUntilTimestampMs => $_getI64(2);
  @$pb.TagNumber(4)
  set joinUntilTimestampMs($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(4)
  $core.bool hasJoinUntilTimestampMs() => $_has(2);
  @$pb.TagNumber(4)
  void clearJoinUntilTimestampMs() => $_clearField(4);
}

/// 兜风计费信息
class RideCounter extends $pb.GeneratedMessage {
  factory RideCounter({
    $fixnum.Int64? durationSec,
    $fixnum.Int64? endAtTimestampMs,
  }) {
    final result = create();
    if (durationSec != null) result.durationSec = durationSec;
    if (endAtTimestampMs != null) result.endAtTimestampMs = endAtTimestampMs;
    return result;
  }

  RideCounter._();

  factory RideCounter.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideCounter.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideCounter',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'durationSec', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'endAtTimestampMs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideCounter clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideCounter copyWith(void Function(RideCounter) updates) =>
      super.copyWith((message) => updates(message as RideCounter))
          as RideCounter;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideCounter create() => RideCounter._();
  @$core.override
  RideCounter createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideCounter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideCounter>(create);
  static RideCounter? _defaultInstance;

  /// 剩余时间
  @$pb.TagNumber(1)
  $fixnum.Int64 get durationSec => $_getI64(0);
  @$pb.TagNumber(1)
  set durationSec($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDurationSec() => $_has(0);
  @$pb.TagNumber(1)
  void clearDurationSec() => $_clearField(1);

  /// 截止时间
  @$pb.TagNumber(3)
  $fixnum.Int64 get endAtTimestampMs => $_getI64(1);
  @$pb.TagNumber(3)
  set endAtTimestampMs($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(3)
  $core.bool hasEndAtTimestampMs() => $_has(1);
  @$pb.TagNumber(3)
  void clearEndAtTimestampMs() => $_clearField(3);
}

/// 兜风结束通知
class RideEnd extends $pb.GeneratedMessage {
  factory RideEnd({
    $core.String? reason,
    $core.String? subReason,
  }) {
    final result = create();
    if (reason != null) result.reason = reason;
    if (subReason != null) result.subReason = subReason;
    return result;
  }

  RideEnd._();

  factory RideEnd.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideEnd.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideEnd',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reason')
    ..aOS(2, _omitFieldNames ? '' : 'subReason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideEnd clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideEnd copyWith(void Function(RideEnd) updates) =>
      super.copyWith((message) => updates(message as RideEnd)) as RideEnd;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideEnd create() => RideEnd._();
  @$core.override
  RideEnd createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideEnd getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RideEnd>(create);
  static RideEnd? _defaultInstance;

  /// 可以直接展示给用户
  @$pb.TagNumber(1)
  $core.String get reason => $_getSZ(0);
  @$pb.TagNumber(1)
  set reason($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get subReason => $_getSZ(1);
  @$pb.TagNumber(2)
  set subReason($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSubReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubReason() => $_clearField(2);
}

/// 兜风秘籍
class RideTopicData extends $pb.GeneratedMessage {
  factory RideTopicData({
    $core.Iterable<$core.String>? topic,
  }) {
    final result = create();
    if (topic != null) result.topic.addAll(topic);
    return result;
  }

  RideTopicData._();

  factory RideTopicData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideTopicData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideTopicData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'topic')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideTopicData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideTopicData copyWith(void Function(RideTopicData) updates) =>
      super.copyWith((message) => updates(message as RideTopicData))
          as RideTopicData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideTopicData create() => RideTopicData._();
  @$core.override
  RideTopicData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideTopicData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideTopicData>(create);
  static RideTopicData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get topic => $_getList(0);
}

/// 趣聊邀请
class RideQuestPushInvite extends $pb.GeneratedMessage {
  factory RideQuestPushInvite({
    $fixnum.Int64? sessionId,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    return result;
  }

  RideQuestPushInvite._();

  factory RideQuestPushInvite.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideQuestPushInvite.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideQuestPushInvite',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideQuestPushInvite clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideQuestPushInvite copyWith(void Function(RideQuestPushInvite) updates) =>
      super.copyWith((message) => updates(message as RideQuestPushInvite))
          as RideQuestPushInvite;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideQuestPushInvite create() => RideQuestPushInvite._();
  @$core.override
  RideQuestPushInvite createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideQuestPushInvite getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideQuestPushInvite>(create);
  static RideQuestPushInvite? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);
}

/// 趣聊开始
class RideQuestPushStart extends $pb.GeneratedMessage {
  factory RideQuestPushStart({
    $fixnum.Int64? sessionId,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    return result;
  }

  RideQuestPushStart._();

  factory RideQuestPushStart.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideQuestPushStart.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideQuestPushStart',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideQuestPushStart clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideQuestPushStart copyWith(void Function(RideQuestPushStart) updates) =>
      super.copyWith((message) => updates(message as RideQuestPushStart))
          as RideQuestPushStart;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideQuestPushStart create() => RideQuestPushStart._();
  @$core.override
  RideQuestPushStart createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideQuestPushStart getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideQuestPushStart>(create);
  static RideQuestPushStart? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);
}

/// 趣聊猜拳结果push
class RideQuestPushGuess extends $pb.GeneratedMessage {
  factory RideQuestPushGuess({
    $fixnum.Int64? sessionId,
    QuestGuess? userGuess,
    QuestGuess? gsGuess,
    $fixnum.Int64? winnerId,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (userGuess != null) result.userGuess = userGuess;
    if (gsGuess != null) result.gsGuess = gsGuess;
    if (winnerId != null) result.winnerId = winnerId;
    return result;
  }

  RideQuestPushGuess._();

  factory RideQuestPushGuess.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideQuestPushGuess.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideQuestPushGuess',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<QuestGuess>(2, _omitFieldNames ? '' : 'userGuess',
        enumValues: QuestGuess.values)
    ..aE<QuestGuess>(3, _omitFieldNames ? '' : 'gsGuess',
        enumValues: QuestGuess.values)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'winnerId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideQuestPushGuess clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideQuestPushGuess copyWith(void Function(RideQuestPushGuess) updates) =>
      super.copyWith((message) => updates(message as RideQuestPushGuess))
          as RideQuestPushGuess;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideQuestPushGuess create() => RideQuestPushGuess._();
  @$core.override
  RideQuestPushGuess createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideQuestPushGuess getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideQuestPushGuess>(create);
  static RideQuestPushGuess? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  QuestGuess get userGuess => $_getN(1);
  @$pb.TagNumber(2)
  set userGuess(QuestGuess value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUserGuess() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserGuess() => $_clearField(2);

  @$pb.TagNumber(3)
  QuestGuess get gsGuess => $_getN(2);
  @$pb.TagNumber(3)
  set gsGuess(QuestGuess value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasGsGuess() => $_has(2);
  @$pb.TagNumber(3)
  void clearGsGuess() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get winnerId => $_getI64(3);
  @$pb.TagNumber(4)
  set winnerId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWinnerId() => $_has(3);
  @$pb.TagNumber(4)
  void clearWinnerId() => $_clearField(4);
}

/// 趣聊刷新问题组push
class RideQuestPushRefresh extends $pb.GeneratedMessage {
  factory RideQuestPushRefresh({
    $fixnum.Int64? sessionId,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    return result;
  }

  RideQuestPushRefresh._();

  factory RideQuestPushRefresh.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideQuestPushRefresh.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideQuestPushRefresh',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideQuestPushRefresh clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideQuestPushRefresh copyWith(void Function(RideQuestPushRefresh) updates) =>
      super.copyWith((message) => updates(message as RideQuestPushRefresh))
          as RideQuestPushRefresh;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideQuestPushRefresh create() => RideQuestPushRefresh._();
  @$core.override
  RideQuestPushRefresh createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideQuestPushRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideQuestPushRefresh>(create);
  static RideQuestPushRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);
}

/// 趣聊选定问题组push
class RideQuestPushPickQuest extends $pb.GeneratedMessage {
  factory RideQuestPushPickQuest({
    $fixnum.Int64? sessionId,
    $fixnum.Int64? questionId,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (questionId != null) result.questionId = questionId;
    return result;
  }

  RideQuestPushPickQuest._();

  factory RideQuestPushPickQuest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideQuestPushPickQuest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideQuestPushPickQuest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'sessionId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'questionId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideQuestPushPickQuest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideQuestPushPickQuest copyWith(
          void Function(RideQuestPushPickQuest) updates) =>
      super.copyWith((message) => updates(message as RideQuestPushPickQuest))
          as RideQuestPushPickQuest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideQuestPushPickQuest create() => RideQuestPushPickQuest._();
  @$core.override
  RideQuestPushPickQuest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideQuestPushPickQuest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideQuestPushPickQuest>(create);
  static RideQuestPushPickQuest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get questionId => $_getI64(1);
  @$pb.TagNumber(2)
  set questionId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuestionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestionId() => $_clearField(2);
}

class RideHistoryData extends $pb.GeneratedMessage {
  factory RideHistoryData({
    $core.Iterable<RideHistoryItem>? item,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    return result;
  }

  RideHistoryData._();

  factory RideHistoryData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideHistoryData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideHistoryData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..pPM<RideHistoryItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: RideHistoryItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideHistoryData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideHistoryData copyWith(void Function(RideHistoryData) updates) =>
      super.copyWith((message) => updates(message as RideHistoryData))
          as RideHistoryData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideHistoryData create() => RideHistoryData._();
  @$core.override
  RideHistoryData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideHistoryData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideHistoryData>(create);
  static RideHistoryData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RideHistoryItem> get item => $_getList(0);
}

class RideHistoryItem extends $pb.GeneratedMessage {
  factory RideHistoryItem({
    $1.User? user,
    $core.int? rideMinutes,
    $fixnum.Int64? startTime,
    $core.String? rate,
    $core.String? rateDesc,
    $fixnum.Int64? orderId,
    RideType? type,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (rideMinutes != null) result.rideMinutes = rideMinutes;
    if (startTime != null) result.startTime = startTime;
    if (rate != null) result.rate = rate;
    if (rateDesc != null) result.rateDesc = rateDesc;
    if (orderId != null) result.orderId = orderId;
    if (type != null) result.type = type;
    return result;
  }

  RideHistoryItem._();

  factory RideHistoryItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideHistoryItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideHistoryItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..aOM<$1.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $1.User.create)
    ..aI(2, _omitFieldNames ? '' : 'rideMinutes',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'startTime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'rate')
    ..aOS(5, _omitFieldNames ? '' : 'rateDesc')
    ..aInt64(6, _omitFieldNames ? '' : 'orderId')
    ..aE<RideType>(7, _omitFieldNames ? '' : 'type',
        enumValues: RideType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideHistoryItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideHistoryItem copyWith(void Function(RideHistoryItem) updates) =>
      super.copyWith((message) => updates(message as RideHistoryItem))
          as RideHistoryItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideHistoryItem create() => RideHistoryItem._();
  @$core.override
  RideHistoryItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideHistoryItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideHistoryItem>(create);
  static RideHistoryItem? _defaultInstance;

  @$pb.TagNumber(1)
  $1.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($1.User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get rideMinutes => $_getIZ(1);
  @$pb.TagNumber(2)
  set rideMinutes($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRideMinutes() => $_has(1);
  @$pb.TagNumber(2)
  void clearRideMinutes() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get startTime => $_getI64(2);
  @$pb.TagNumber(3)
  set startTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStartTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get rate => $_getSZ(3);
  @$pb.TagNumber(4)
  set rate($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRate() => $_has(3);
  @$pb.TagNumber(4)
  void clearRate() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get rateDesc => $_getSZ(4);
  @$pb.TagNumber(5)
  set rateDesc($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRateDesc() => $_has(4);
  @$pb.TagNumber(5)
  void clearRateDesc() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get orderId => $_getI64(5);
  @$pb.TagNumber(6)
  set orderId($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOrderId() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderId() => $_clearField(6);

  @$pb.TagNumber(7)
  RideType get type => $_getN(6);
  @$pb.TagNumber(7)
  set type(RideType value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => $_clearField(7);
}

class RideEvaluateReq extends $pb.GeneratedMessage {
  factory RideEvaluateReq({
    $fixnum.Int64? orderId,
    $core.String? rate,
  }) {
    final result = create();
    if (orderId != null) result.orderId = orderId;
    if (rate != null) result.rate = rate;
    return result;
  }

  RideEvaluateReq._();

  factory RideEvaluateReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideEvaluateReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideEvaluateReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'orderId')
    ..aOS(2, _omitFieldNames ? '' : 'rate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideEvaluateReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideEvaluateReq copyWith(void Function(RideEvaluateReq) updates) =>
      super.copyWith((message) => updates(message as RideEvaluateReq))
          as RideEvaluateReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideEvaluateReq create() => RideEvaluateReq._();
  @$core.override
  RideEvaluateReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideEvaluateReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideEvaluateReq>(create);
  static RideEvaluateReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get orderId => $_getI64(0);
  @$pb.TagNumber(1)
  set orderId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get rate => $_getSZ(1);
  @$pb.TagNumber(2)
  set rate($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRate() => $_has(1);
  @$pb.TagNumber(2)
  void clearRate() => $_clearField(2);
}

class RideStatusCard extends $pb.GeneratedMessage {
  factory RideStatusCard({
    $core.String? imageUrl,
    $core.String? content,
    $core.String? title,
    $core.bool? succ,
  }) {
    final result = create();
    if (imageUrl != null) result.imageUrl = imageUrl;
    if (content != null) result.content = content;
    if (title != null) result.title = title;
    if (succ != null) result.succ = succ;
    return result;
  }

  RideStatusCard._();

  factory RideStatusCard.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideStatusCard.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideStatusCard',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'imageUrl')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOB(4, _omitFieldNames ? '' : 'succ')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideStatusCard clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideStatusCard copyWith(void Function(RideStatusCard) updates) =>
      super.copyWith((message) => updates(message as RideStatusCard))
          as RideStatusCard;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideStatusCard create() => RideStatusCard._();
  @$core.override
  RideStatusCard createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideStatusCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideStatusCard>(create);
  static RideStatusCard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get imageUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set imageUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasImageUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearImageUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get succ => $_getBF(3);
  @$pb.TagNumber(4)
  set succ($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSucc() => $_has(3);
  @$pb.TagNumber(4)
  void clearSucc() => $_clearField(4);
}

class RideWaitRandomAvatars extends $pb.GeneratedMessage {
  factory RideWaitRandomAvatars({
    $core.Iterable<$core.String>? avatars,
  }) {
    final result = create();
    if (avatars != null) result.avatars.addAll(avatars);
    return result;
  }

  RideWaitRandomAvatars._();

  factory RideWaitRandomAvatars.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideWaitRandomAvatars.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideWaitRandomAvatars',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'avatars')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideWaitRandomAvatars clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideWaitRandomAvatars copyWith(
          void Function(RideWaitRandomAvatars) updates) =>
      super.copyWith((message) => updates(message as RideWaitRandomAvatars))
          as RideWaitRandomAvatars;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideWaitRandomAvatars create() => RideWaitRandomAvatars._();
  @$core.override
  RideWaitRandomAvatars createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideWaitRandomAvatars getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideWaitRandomAvatars>(create);
  static RideWaitRandomAvatars? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get avatars => $_getList(0);
}

class RidePrice extends $pb.GeneratedMessage {
  factory RidePrice({
    $core.int? ridePrice,
  }) {
    final result = create();
    if (ridePrice != null) result.ridePrice = ridePrice;
    return result;
  }

  RidePrice._();

  factory RidePrice.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RidePrice.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RidePrice',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'ridePrice', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePrice clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RidePrice copyWith(void Function(RidePrice) updates) =>
      super.copyWith((message) => updates(message as RidePrice)) as RidePrice;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RidePrice create() => RidePrice._();
  @$core.override
  RidePrice createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RidePrice getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RidePrice>(create);
  static RidePrice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get ridePrice => $_getIZ(0);
  @$pb.TagNumber(1)
  set ridePrice($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRidePrice() => $_has(0);
  @$pb.TagNumber(1)
  void clearRidePrice() => $_clearField(1);
}

class AfterFifteenSecondsReq extends $pb.GeneratedMessage {
  factory AfterFifteenSecondsReq({
    $core.bool? isContinue,
  }) {
    final result = create();
    if (isContinue != null) result.isContinue = isContinue;
    return result;
  }

  AfterFifteenSecondsReq._();

  factory AfterFifteenSecondsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AfterFifteenSecondsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AfterFifteenSecondsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isContinue')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AfterFifteenSecondsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AfterFifteenSecondsReq copyWith(
          void Function(AfterFifteenSecondsReq) updates) =>
      super.copyWith((message) => updates(message as AfterFifteenSecondsReq))
          as AfterFifteenSecondsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AfterFifteenSecondsReq create() => AfterFifteenSecondsReq._();
  @$core.override
  AfterFifteenSecondsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AfterFifteenSecondsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AfterFifteenSecondsReq>(create);
  static AfterFifteenSecondsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isContinue => $_getBF(0);
  @$pb.TagNumber(1)
  set isContinue($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsContinue() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsContinue() => $_clearField(1);
}

/// 兜风广场级别
class RideSquareRanksRsp extends $pb.GeneratedMessage {
  factory RideSquareRanksRsp({
    $core.Iterable<RideSquareRank>? ranks,
  }) {
    final result = create();
    if (ranks != null) result.ranks.addAll(ranks);
    return result;
  }

  RideSquareRanksRsp._();

  factory RideSquareRanksRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideSquareRanksRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideSquareRanksRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..pPM<RideSquareRank>(1, _omitFieldNames ? '' : 'ranks',
        subBuilder: RideSquareRank.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideSquareRanksRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideSquareRanksRsp copyWith(void Function(RideSquareRanksRsp) updates) =>
      super.copyWith((message) => updates(message as RideSquareRanksRsp))
          as RideSquareRanksRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideSquareRanksRsp create() => RideSquareRanksRsp._();
  @$core.override
  RideSquareRanksRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideSquareRanksRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideSquareRanksRsp>(create);
  static RideSquareRanksRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RideSquareRank> get ranks => $_getList(0);
}

/// 兜风级别数据
class RideSquareRank extends $pb.GeneratedMessage {
  factory RideSquareRank({
    RideType? rideType,
    $fixnum.Int64? price,
    $core.String? gsImage,
  }) {
    final result = create();
    if (rideType != null) result.rideType = rideType;
    if (price != null) result.price = price;
    if (gsImage != null) result.gsImage = gsImage;
    return result;
  }

  RideSquareRank._();

  factory RideSquareRank.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideSquareRank.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideSquareRank',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ride'),
      createEmptyInstance: create)
    ..aE<RideType>(1, _omitFieldNames ? '' : 'rideType',
        enumValues: RideType.values)
    ..aInt64(2, _omitFieldNames ? '' : 'price')
    ..aOS(3, _omitFieldNames ? '' : 'gsImage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideSquareRank clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideSquareRank copyWith(void Function(RideSquareRank) updates) =>
      super.copyWith((message) => updates(message as RideSquareRank))
          as RideSquareRank;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideSquareRank create() => RideSquareRank._();
  @$core.override
  RideSquareRank createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideSquareRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideSquareRank>(create);
  static RideSquareRank? _defaultInstance;

  @$pb.TagNumber(1)
  RideType get rideType => $_getN(0);
  @$pb.TagNumber(1)
  set rideType(RideType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRideType() => $_has(0);
  @$pb.TagNumber(1)
  void clearRideType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get price => $_getI64(1);
  @$pb.TagNumber(2)
  set price($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get gsImage => $_getSZ(2);
  @$pb.TagNumber(3)
  set gsImage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGsImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearGsImage() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

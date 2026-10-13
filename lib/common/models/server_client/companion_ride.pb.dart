// This is a generated file - do not edit.
//
// Generated from server_client/companion_ride.proto.

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

class CompanionRideVehicleLeaveRoomReq extends $pb.GeneratedMessage {
  factory CompanionRideVehicleLeaveRoomReq({
    $fixnum.Int64? companionRideId,
  }) {
    final result = create();
    if (companionRideId != null) result.companionRideId = companionRideId;
    return result;
  }

  CompanionRideVehicleLeaveRoomReq._();

  factory CompanionRideVehicleLeaveRoomReq.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionRideVehicleLeaveRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionRideVehicleLeaveRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion_ride'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'companionRideId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionRideVehicleLeaveRoomReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionRideVehicleLeaveRoomReq copyWith(
          void Function(CompanionRideVehicleLeaveRoomReq) updates) =>
      super.copyWith(
              (message) => updates(message as CompanionRideVehicleLeaveRoomReq))
          as CompanionRideVehicleLeaveRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionRideVehicleLeaveRoomReq create() =>
      CompanionRideVehicleLeaveRoomReq._();
  @$core.override
  CompanionRideVehicleLeaveRoomReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionRideVehicleLeaveRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionRideVehicleLeaveRoomReq>(
          create);
  static CompanionRideVehicleLeaveRoomReq? _defaultInstance;

  /// *
  /// 陪伴师兜风id
  @$pb.TagNumber(1)
  $fixnum.Int64 get companionRideId => $_getI64(0);
  @$pb.TagNumber(1)
  set companionRideId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCompanionRideId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanionRideId() => $_clearField(1);
}

class CompanionStartRideReq extends $pb.GeneratedMessage {
  factory CompanionStartRideReq({
    $fixnum.Int64? uid,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    return result;
  }

  CompanionStartRideReq._();

  factory CompanionStartRideReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionStartRideReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionStartRideReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion_ride'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionStartRideReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionStartRideReq copyWith(
          void Function(CompanionStartRideReq) updates) =>
      super.copyWith((message) => updates(message as CompanionStartRideReq))
          as CompanionStartRideReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionStartRideReq create() => CompanionStartRideReq._();
  @$core.override
  CompanionStartRideReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionStartRideReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionStartRideReq>(create);
  static CompanionStartRideReq? _defaultInstance;

  /// *
  /// 车主id
  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);
}

class CompanionOwnerAcceptReq extends $pb.GeneratedMessage {
  factory CompanionOwnerAcceptReq({
    $fixnum.Int64? companionRideId,
    $core.bool? ok,
  }) {
    final result = create();
    if (companionRideId != null) result.companionRideId = companionRideId;
    if (ok != null) result.ok = ok;
    return result;
  }

  CompanionOwnerAcceptReq._();

  factory CompanionOwnerAcceptReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionOwnerAcceptReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionOwnerAcceptReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion_ride'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'companionRideId')
    ..aOB(2, _omitFieldNames ? '' : 'ok')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionOwnerAcceptReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionOwnerAcceptReq copyWith(
          void Function(CompanionOwnerAcceptReq) updates) =>
      super.copyWith((message) => updates(message as CompanionOwnerAcceptReq))
          as CompanionOwnerAcceptReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionOwnerAcceptReq create() => CompanionOwnerAcceptReq._();
  @$core.override
  CompanionOwnerAcceptReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionOwnerAcceptReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionOwnerAcceptReq>(create);
  static CompanionOwnerAcceptReq? _defaultInstance;

  /// *
  /// 陪伴师兜风id
  @$pb.TagNumber(1)
  $fixnum.Int64 get companionRideId => $_getI64(0);
  @$pb.TagNumber(1)
  set companionRideId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCompanionRideId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanionRideId() => $_clearField(1);

  /// *
  /// true = 同意
  /// false = 拒绝
  @$pb.TagNumber(2)
  $core.bool get ok => $_getBF(1);
  @$pb.TagNumber(2)
  set ok($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOk() => $_has(1);
  @$pb.TagNumber(2)
  void clearOk() => $_clearField(2);
}

class CompanionOwnerRoomWheatReq extends $pb.GeneratedMessage {
  factory CompanionOwnerRoomWheatReq({
    $fixnum.Int64? companionRideId,
  }) {
    final result = create();
    if (companionRideId != null) result.companionRideId = companionRideId;
    return result;
  }

  CompanionOwnerRoomWheatReq._();

  factory CompanionOwnerRoomWheatReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionOwnerRoomWheatReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionOwnerRoomWheatReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion_ride'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'companionRideId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionOwnerRoomWheatReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionOwnerRoomWheatReq copyWith(
          void Function(CompanionOwnerRoomWheatReq) updates) =>
      super.copyWith(
              (message) => updates(message as CompanionOwnerRoomWheatReq))
          as CompanionOwnerRoomWheatReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionOwnerRoomWheatReq create() => CompanionOwnerRoomWheatReq._();
  @$core.override
  CompanionOwnerRoomWheatReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionOwnerRoomWheatReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionOwnerRoomWheatReq>(create);
  static CompanionOwnerRoomWheatReq? _defaultInstance;

  /// *
  /// 陪伴师兜风id
  @$pb.TagNumber(1)
  $fixnum.Int64 get companionRideId => $_getI64(0);
  @$pb.TagNumber(1)
  set companionRideId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCompanionRideId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanionRideId() => $_clearField(1);
}

class CompanionManagerCloseRoomReq extends $pb.GeneratedMessage {
  factory CompanionManagerCloseRoomReq({
    $fixnum.Int64? companionRideId,
  }) {
    final result = create();
    if (companionRideId != null) result.companionRideId = companionRideId;
    return result;
  }

  CompanionManagerCloseRoomReq._();

  factory CompanionManagerCloseRoomReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionManagerCloseRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionManagerCloseRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion_ride'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'companionRideId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionManagerCloseRoomReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionManagerCloseRoomReq copyWith(
          void Function(CompanionManagerCloseRoomReq) updates) =>
      super.copyWith(
              (message) => updates(message as CompanionManagerCloseRoomReq))
          as CompanionManagerCloseRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionManagerCloseRoomReq create() =>
      CompanionManagerCloseRoomReq._();
  @$core.override
  CompanionManagerCloseRoomReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionManagerCloseRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionManagerCloseRoomReq>(create);
  static CompanionManagerCloseRoomReq? _defaultInstance;

  /// *
  /// 陪伴师兜风id
  @$pb.TagNumber(1)
  $fixnum.Int64 get companionRideId => $_getI64(0);
  @$pb.TagNumber(1)
  set companionRideId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCompanionRideId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanionRideId() => $_clearField(1);
}

enum CompanionOwnerRidePush_Message {
  ownerCompanionRideReceive,
  ownerGsCompanionRideInRoom,
  ownerRefuseRideGsReceive,
  ownerCompanionRideGsCountdown,
  notSet
}

class CompanionOwnerRidePush extends $pb.GeneratedMessage {
  factory CompanionOwnerRidePush({
    OwnerCompanionRideReceive? ownerCompanionRideReceive,
    OwnerGSCompanionRideInRoom? ownerGsCompanionRideInRoom,
    OwnerRefuseRideGsReceive? ownerRefuseRideGsReceive,
    OwnerCompanionRideGsCountdown? ownerCompanionRideGsCountdown,
  }) {
    final result = create();
    if (ownerCompanionRideReceive != null)
      result.ownerCompanionRideReceive = ownerCompanionRideReceive;
    if (ownerGsCompanionRideInRoom != null)
      result.ownerGsCompanionRideInRoom = ownerGsCompanionRideInRoom;
    if (ownerRefuseRideGsReceive != null)
      result.ownerRefuseRideGsReceive = ownerRefuseRideGsReceive;
    if (ownerCompanionRideGsCountdown != null)
      result.ownerCompanionRideGsCountdown = ownerCompanionRideGsCountdown;
    return result;
  }

  CompanionOwnerRidePush._();

  factory CompanionOwnerRidePush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionOwnerRidePush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, CompanionOwnerRidePush_Message>
      _CompanionOwnerRidePush_MessageByTag = {
    1: CompanionOwnerRidePush_Message.ownerCompanionRideReceive,
    2: CompanionOwnerRidePush_Message.ownerGsCompanionRideInRoom,
    3: CompanionOwnerRidePush_Message.ownerRefuseRideGsReceive,
    4: CompanionOwnerRidePush_Message.ownerCompanionRideGsCountdown,
    0: CompanionOwnerRidePush_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionOwnerRidePush',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion_ride'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<OwnerCompanionRideReceive>(
        1, _omitFieldNames ? '' : 'ownerCompanionRideReceive',
        subBuilder: OwnerCompanionRideReceive.create)
    ..aOM<OwnerGSCompanionRideInRoom>(
        2, _omitFieldNames ? '' : 'ownerGsCompanionRideInRoom',
        subBuilder: OwnerGSCompanionRideInRoom.create)
    ..aOM<OwnerRefuseRideGsReceive>(
        3, _omitFieldNames ? '' : 'ownerRefuseRideGsReceive',
        subBuilder: OwnerRefuseRideGsReceive.create)
    ..aOM<OwnerCompanionRideGsCountdown>(
        4, _omitFieldNames ? '' : 'ownerCompanionRideGsCountdown',
        subBuilder: OwnerCompanionRideGsCountdown.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionOwnerRidePush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionOwnerRidePush copyWith(
          void Function(CompanionOwnerRidePush) updates) =>
      super.copyWith((message) => updates(message as CompanionOwnerRidePush))
          as CompanionOwnerRidePush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionOwnerRidePush create() => CompanionOwnerRidePush._();
  @$core.override
  CompanionOwnerRidePush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionOwnerRidePush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionOwnerRidePush>(create);
  static CompanionOwnerRidePush? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  CompanionOwnerRidePush_Message whichMessage() =>
      _CompanionOwnerRidePush_MessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearMessage() => $_clearField($_whichOneof(0));

  /// *
  /// 车主收到 兜风通知
  @$pb.TagNumber(1)
  OwnerCompanionRideReceive get ownerCompanionRideReceive => $_getN(0);
  @$pb.TagNumber(1)
  set ownerCompanionRideReceive(OwnerCompanionRideReceive value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerCompanionRideReceive() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerCompanionRideReceive() => $_clearField(1);
  @$pb.TagNumber(1)
  OwnerCompanionRideReceive ensureOwnerCompanionRideReceive() => $_ensure(0);

  /// *
  /// 车主与GS 收到进房通知
  @$pb.TagNumber(2)
  OwnerGSCompanionRideInRoom get ownerGsCompanionRideInRoom => $_getN(1);
  @$pb.TagNumber(2)
  set ownerGsCompanionRideInRoom(OwnerGSCompanionRideInRoom value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerGsCompanionRideInRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerGsCompanionRideInRoom() => $_clearField(2);
  @$pb.TagNumber(2)
  OwnerGSCompanionRideInRoom ensureOwnerGsCompanionRideInRoom() => $_ensure(1);

  /// *
  /// 车主拒绝兜风，gs收到拒绝兜风通知 这个消息在2个流程会收到，
  /// 1. 陪伴师配对流程发起兜风
  /// 2. 我的车手列表邀请兜风
  @$pb.TagNumber(3)
  OwnerRefuseRideGsReceive get ownerRefuseRideGsReceive => $_getN(2);
  @$pb.TagNumber(3)
  set ownerRefuseRideGsReceive(OwnerRefuseRideGsReceive value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasOwnerRefuseRideGsReceive() => $_has(2);
  @$pb.TagNumber(3)
  void clearOwnerRefuseRideGsReceive() => $_clearField(3);
  @$pb.TagNumber(3)
  OwnerRefuseRideGsReceive ensureOwnerRefuseRideGsReceive() => $_ensure(2);

  /// *
  /// 陪伴师发起兜风，陪伴师收到倒计时通知
  @$pb.TagNumber(4)
  OwnerCompanionRideGsCountdown get ownerCompanionRideGsCountdown => $_getN(3);
  @$pb.TagNumber(4)
  set ownerCompanionRideGsCountdown(OwnerCompanionRideGsCountdown value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasOwnerCompanionRideGsCountdown() => $_has(3);
  @$pb.TagNumber(4)
  void clearOwnerCompanionRideGsCountdown() => $_clearField(4);
  @$pb.TagNumber(4)
  OwnerCompanionRideGsCountdown ensureOwnerCompanionRideGsCountdown() =>
      $_ensure(3);
}

class OwnerCompanionRideGsCountdown extends $pb.GeneratedMessage {
  factory OwnerCompanionRideGsCountdown({
    $fixnum.Int64? companionRideId,
    $fixnum.Int64? ownerId,
    $fixnum.Int64? timeoutTime,
  }) {
    final result = create();
    if (companionRideId != null) result.companionRideId = companionRideId;
    if (ownerId != null) result.ownerId = ownerId;
    if (timeoutTime != null) result.timeoutTime = timeoutTime;
    return result;
  }

  OwnerCompanionRideGsCountdown._();

  factory OwnerCompanionRideGsCountdown.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerCompanionRideGsCountdown.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerCompanionRideGsCountdown',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion_ride'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'companionRideId')
    ..aInt64(2, _omitFieldNames ? '' : 'ownerId')
    ..aInt64(3, _omitFieldNames ? '' : 'timeoutTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerCompanionRideGsCountdown clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerCompanionRideGsCountdown copyWith(
          void Function(OwnerCompanionRideGsCountdown) updates) =>
      super.copyWith(
              (message) => updates(message as OwnerCompanionRideGsCountdown))
          as OwnerCompanionRideGsCountdown;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerCompanionRideGsCountdown create() =>
      OwnerCompanionRideGsCountdown._();
  @$core.override
  OwnerCompanionRideGsCountdown createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerCompanionRideGsCountdown getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerCompanionRideGsCountdown>(create);
  static OwnerCompanionRideGsCountdown? _defaultInstance;

  /// *
  /// 陪伴师兜风id
  @$pb.TagNumber(1)
  $fixnum.Int64 get companionRideId => $_getI64(0);
  @$pb.TagNumber(1)
  set companionRideId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCompanionRideId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanionRideId() => $_clearField(1);

  /// *
  /// 车主id
  @$pb.TagNumber(2)
  $fixnum.Int64 get ownerId => $_getI64(1);
  @$pb.TagNumber(2)
  set ownerId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerId() => $_clearField(2);

  /// *
  /// 超时时间
  @$pb.TagNumber(3)
  $fixnum.Int64 get timeoutTime => $_getI64(2);
  @$pb.TagNumber(3)
  set timeoutTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTimeoutTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimeoutTime() => $_clearField(3);
}

class OwnerRefuseRideGsReceive extends $pb.GeneratedMessage {
  factory OwnerRefuseRideGsReceive({
    $fixnum.Int64? companionRideId,
    $fixnum.Int64? ownerId,
  }) {
    final result = create();
    if (companionRideId != null) result.companionRideId = companionRideId;
    if (ownerId != null) result.ownerId = ownerId;
    return result;
  }

  OwnerRefuseRideGsReceive._();

  factory OwnerRefuseRideGsReceive.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerRefuseRideGsReceive.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerRefuseRideGsReceive',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion_ride'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'companionRideId')
    ..aInt64(2, _omitFieldNames ? '' : 'ownerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerRefuseRideGsReceive clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerRefuseRideGsReceive copyWith(
          void Function(OwnerRefuseRideGsReceive) updates) =>
      super.copyWith((message) => updates(message as OwnerRefuseRideGsReceive))
          as OwnerRefuseRideGsReceive;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerRefuseRideGsReceive create() => OwnerRefuseRideGsReceive._();
  @$core.override
  OwnerRefuseRideGsReceive createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerRefuseRideGsReceive getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerRefuseRideGsReceive>(create);
  static OwnerRefuseRideGsReceive? _defaultInstance;

  /// *
  /// 陪伴师兜风id
  @$pb.TagNumber(1)
  $fixnum.Int64 get companionRideId => $_getI64(0);
  @$pb.TagNumber(1)
  set companionRideId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCompanionRideId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanionRideId() => $_clearField(1);

  /// *
  /// 车主id
  @$pb.TagNumber(2)
  $fixnum.Int64 get ownerId => $_getI64(1);
  @$pb.TagNumber(2)
  set ownerId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOwnerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwnerId() => $_clearField(2);
}

class OwnerCompanionRideReceive extends $pb.GeneratedMessage {
  factory OwnerCompanionRideReceive({
    $fixnum.Int64? companionRideId,
    $fixnum.Int64? gsId,
  }) {
    final result = create();
    if (companionRideId != null) result.companionRideId = companionRideId;
    if (gsId != null) result.gsId = gsId;
    return result;
  }

  OwnerCompanionRideReceive._();

  factory OwnerCompanionRideReceive.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerCompanionRideReceive.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerCompanionRideReceive',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion_ride'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'companionRideId')
    ..aInt64(2, _omitFieldNames ? '' : 'gsId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerCompanionRideReceive clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerCompanionRideReceive copyWith(
          void Function(OwnerCompanionRideReceive) updates) =>
      super.copyWith((message) => updates(message as OwnerCompanionRideReceive))
          as OwnerCompanionRideReceive;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerCompanionRideReceive create() => OwnerCompanionRideReceive._();
  @$core.override
  OwnerCompanionRideReceive createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerCompanionRideReceive getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerCompanionRideReceive>(create);
  static OwnerCompanionRideReceive? _defaultInstance;

  /// *
  /// 陪伴师兜风id
  @$pb.TagNumber(1)
  $fixnum.Int64 get companionRideId => $_getI64(0);
  @$pb.TagNumber(1)
  set companionRideId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCompanionRideId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanionRideId() => $_clearField(1);

  /// *
  /// 发起邀请的嘉宾id
  @$pb.TagNumber(2)
  $fixnum.Int64 get gsId => $_getI64(1);
  @$pb.TagNumber(2)
  set gsId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGsId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGsId() => $_clearField(2);
}

class OwnerGSCompanionRideInRoom extends $pb.GeneratedMessage {
  factory OwnerGSCompanionRideInRoom({
    $fixnum.Int64? companionRideId,
    $fixnum.Int64? roomId,
  }) {
    final result = create();
    if (companionRideId != null) result.companionRideId = companionRideId;
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  OwnerGSCompanionRideInRoom._();

  factory OwnerGSCompanionRideInRoom.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerGSCompanionRideInRoom.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerGSCompanionRideInRoom',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion_ride'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'companionRideId')
    ..aInt64(2, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerGSCompanionRideInRoom clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerGSCompanionRideInRoom copyWith(
          void Function(OwnerGSCompanionRideInRoom) updates) =>
      super.copyWith(
              (message) => updates(message as OwnerGSCompanionRideInRoom))
          as OwnerGSCompanionRideInRoom;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerGSCompanionRideInRoom create() => OwnerGSCompanionRideInRoom._();
  @$core.override
  OwnerGSCompanionRideInRoom createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerGSCompanionRideInRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerGSCompanionRideInRoom>(create);
  static OwnerGSCompanionRideInRoom? _defaultInstance;

  /// *
  /// 陪伴师兜风id
  @$pb.TagNumber(1)
  $fixnum.Int64 get companionRideId => $_getI64(0);
  @$pb.TagNumber(1)
  set companionRideId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCompanionRideId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanionRideId() => $_clearField(1);

  /// *
  /// 房间id
  @$pb.TagNumber(2)
  $fixnum.Int64 get roomId => $_getI64(1);
  @$pb.TagNumber(2)
  set roomId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

// This is a generated file - do not edit.
//
// Generated from server_client/super_admin.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'super_admin.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'super_admin.pbenum.dart';

class WarnReq extends $pb.GeneratedMessage {
  factory WarnReq({
    $fixnum.Int64? channelId,
    $fixnum.Int64? userId,
    WarnType? warnType,
    $core.String? reason,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    if (userId != null) result.userId = userId;
    if (warnType != null) result.warnType = warnType;
    if (reason != null) result.reason = reason;
    return result;
  }

  WarnReq._();

  factory WarnReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WarnReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WarnReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'channelId')
    ..aInt64(2, _omitFieldNames ? '' : 'userId')
    ..aE<WarnType>(3, _omitFieldNames ? '' : 'warnType',
        enumValues: WarnType.values)
    ..aOS(4, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WarnReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WarnReq copyWith(void Function(WarnReq) updates) =>
      super.copyWith((message) => updates(message as WarnReq)) as WarnReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WarnReq create() => WarnReq._();
  @$core.override
  WarnReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WarnReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WarnReq>(create);
  static WarnReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(1)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  WarnType get warnType => $_getN(2);
  @$pb.TagNumber(3)
  set warnType(WarnType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasWarnType() => $_has(2);
  @$pb.TagNumber(3)
  void clearWarnType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get reason => $_getSZ(3);
  @$pb.TagNumber(4)
  set reason($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReason() => $_has(3);
  @$pb.TagNumber(4)
  void clearReason() => $_clearField(4);
}

class CloseRoomReq extends $pb.GeneratedMessage {
  factory CloseRoomReq({
    $fixnum.Int64? channelId,
    $core.String? reason,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    if (reason != null) result.reason = reason;
    return result;
  }

  CloseRoomReq._();

  factory CloseRoomReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CloseRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CloseRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'channelId')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CloseRoomReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CloseRoomReq copyWith(void Function(CloseRoomReq) updates) =>
      super.copyWith((message) => updates(message as CloseRoomReq))
          as CloseRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CloseRoomReq create() => CloseRoomReq._();
  @$core.override
  CloseRoomReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CloseRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CloseRoomReq>(create);
  static CloseRoomReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(1)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => $_clearField(2);
}

class ScheduleDeductReq extends $pb.GeneratedMessage {
  factory ScheduleDeductReq({
    $fixnum.Int64? scheduleId,
    $fixnum.Int64? gsId,
    $core.int? score,
    $core.String? reason,
  }) {
    final result = create();
    if (scheduleId != null) result.scheduleId = scheduleId;
    if (gsId != null) result.gsId = gsId;
    if (score != null) result.score = score;
    if (reason != null) result.reason = reason;
    return result;
  }

  ScheduleDeductReq._();

  factory ScheduleDeductReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleDeductReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleDeductReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'scheduleId')
    ..aInt64(2, _omitFieldNames ? '' : 'gsId')
    ..aI(3, _omitFieldNames ? '' : 'score')
    ..aOS(4, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleDeductReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleDeductReq copyWith(void Function(ScheduleDeductReq) updates) =>
      super.copyWith((message) => updates(message as ScheduleDeductReq))
          as ScheduleDeductReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleDeductReq create() => ScheduleDeductReq._();
  @$core.override
  ScheduleDeductReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduleDeductReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleDeductReq>(create);
  static ScheduleDeductReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get scheduleId => $_getI64(0);
  @$pb.TagNumber(1)
  set scheduleId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearScheduleId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get gsId => $_getI64(1);
  @$pb.TagNumber(2)
  set gsId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGsId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGsId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get score => $_getIZ(2);
  @$pb.TagNumber(3)
  set score($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get reason => $_getSZ(3);
  @$pb.TagNumber(4)
  set reason($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReason() => $_has(3);
  @$pb.TagNumber(4)
  void clearReason() => $_clearField(4);
}

class KickUserReq extends $pb.GeneratedMessage {
  factory KickUserReq({
    $fixnum.Int64? channelId,
    $fixnum.Int64? userId,
    $core.int? kickSeconds,
    $core.String? reason,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    if (userId != null) result.userId = userId;
    if (kickSeconds != null) result.kickSeconds = kickSeconds;
    if (reason != null) result.reason = reason;
    return result;
  }

  KickUserReq._();

  factory KickUserReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KickUserReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KickUserReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'channelId')
    ..aInt64(2, _omitFieldNames ? '' : 'userId')
    ..aI(3, _omitFieldNames ? '' : 'kickSeconds')
    ..aOS(4, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KickUserReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KickUserReq copyWith(void Function(KickUserReq) updates) =>
      super.copyWith((message) => updates(message as KickUserReq))
          as KickUserReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KickUserReq create() => KickUserReq._();
  @$core.override
  KickUserReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KickUserReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KickUserReq>(create);
  static KickUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(1)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get kickSeconds => $_getIZ(2);
  @$pb.TagNumber(3)
  set kickSeconds($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasKickSeconds() => $_has(2);
  @$pb.TagNumber(3)
  void clearKickSeconds() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get reason => $_getSZ(3);
  @$pb.TagNumber(4)
  set reason($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReason() => $_has(3);
  @$pb.TagNumber(4)
  void clearReason() => $_clearField(4);
}

/// 超管相关push
class SuperAdminPush extends $pb.GeneratedMessage {
  factory SuperAdminPush({
    $fixnum.Int64? superAdmin,
    $fixnum.Int64? userId,
    OperationType? type,
  }) {
    final result = create();
    if (superAdmin != null) result.superAdmin = superAdmin;
    if (userId != null) result.userId = userId;
    if (type != null) result.type = type;
    return result;
  }

  SuperAdminPush._();

  factory SuperAdminPush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SuperAdminPush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SuperAdminPush',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'superAdmin')
    ..aInt64(2, _omitFieldNames ? '' : 'userId')
    ..aE<OperationType>(3, _omitFieldNames ? '' : 'type',
        enumValues: OperationType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SuperAdminPush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SuperAdminPush copyWith(void Function(SuperAdminPush) updates) =>
      super.copyWith((message) => updates(message as SuperAdminPush))
          as SuperAdminPush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SuperAdminPush create() => SuperAdminPush._();
  @$core.override
  SuperAdminPush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SuperAdminPush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuperAdminPush>(create);
  static SuperAdminPush? _defaultInstance;

  /// 超管uid
  @$pb.TagNumber(1)
  $fixnum.Int64 get superAdmin => $_getI64(0);
  @$pb.TagNumber(1)
  set superAdmin($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuperAdmin() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuperAdmin() => $_clearField(1);

  /// 目标用户uid
  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  OperationType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(OperationType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

// This is a generated file - do not edit.
//
// Generated from server_client/ban.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'ban.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'ban.pbenum.dart';

class BanReq extends $pb.GeneratedMessage {
  factory BanReq({
    $fixnum.Int64? busId,
    BanScene? scene,
    BanType? type,
    BanLevel? level,
    $core.String? reason,
    $core.String? description,
    $fixnum.Int64? operatorId,
    $fixnum.Int64? bannedEndTime,
  }) {
    final result = create();
    if (busId != null) result.busId = busId;
    if (scene != null) result.scene = scene;
    if (type != null) result.type = type;
    if (level != null) result.level = level;
    if (reason != null) result.reason = reason;
    if (description != null) result.description = description;
    if (operatorId != null) result.operatorId = operatorId;
    if (bannedEndTime != null) result.bannedEndTime = bannedEndTime;
    return result;
  }

  BanReq._();

  factory BanReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BanReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BanReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ban'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'busId')
    ..aE<BanScene>(2, _omitFieldNames ? '' : 'scene',
        enumValues: BanScene.values)
    ..aE<BanType>(3, _omitFieldNames ? '' : 'type', enumValues: BanType.values)
    ..aE<BanLevel>(4, _omitFieldNames ? '' : 'level',
        enumValues: BanLevel.values)
    ..aOS(5, _omitFieldNames ? '' : 'reason')
    ..aOS(6, _omitFieldNames ? '' : 'description')
    ..aInt64(7, _omitFieldNames ? '' : 'operatorId')
    ..aInt64(8, _omitFieldNames ? '' : 'bannedEndTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BanReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BanReq copyWith(void Function(BanReq) updates) =>
      super.copyWith((message) => updates(message as BanReq)) as BanReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BanReq create() => BanReq._();
  @$core.override
  BanReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BanReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BanReq>(create);
  static BanReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get busId => $_getI64(0);
  @$pb.TagNumber(1)
  set busId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBusId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusId() => $_clearField(1);

  @$pb.TagNumber(2)
  BanScene get scene => $_getN(1);
  @$pb.TagNumber(2)
  set scene(BanScene value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasScene() => $_has(1);
  @$pb.TagNumber(2)
  void clearScene() => $_clearField(2);

  @$pb.TagNumber(3)
  BanType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(BanType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  BanLevel get level => $_getN(3);
  @$pb.TagNumber(4)
  set level(BanLevel value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get reason => $_getSZ(4);
  @$pb.TagNumber(5)
  set reason($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReason() => $_has(4);
  @$pb.TagNumber(5)
  void clearReason() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get operatorId => $_getI64(6);
  @$pb.TagNumber(7)
  set operatorId($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasOperatorId() => $_has(6);
  @$pb.TagNumber(7)
  void clearOperatorId() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get bannedEndTime => $_getI64(7);
  @$pb.TagNumber(8)
  set bannedEndTime($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasBannedEndTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearBannedEndTime() => $_clearField(8);
}

class UnbanReq extends $pb.GeneratedMessage {
  factory UnbanReq({
    $fixnum.Int64? banOperation,
    BanType? type,
    $fixnum.Int64? operatorId,
  }) {
    final result = create();
    if (banOperation != null) result.banOperation = banOperation;
    if (type != null) result.type = type;
    if (operatorId != null) result.operatorId = operatorId;
    return result;
  }

  UnbanReq._();

  factory UnbanReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnbanReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnbanReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ban'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'banOperation')
    ..aE<BanType>(2, _omitFieldNames ? '' : 'type', enumValues: BanType.values)
    ..aInt64(3, _omitFieldNames ? '' : 'operatorId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnbanReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnbanReq copyWith(void Function(UnbanReq) updates) =>
      super.copyWith((message) => updates(message as UnbanReq)) as UnbanReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnbanReq create() => UnbanReq._();
  @$core.override
  UnbanReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnbanReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnbanReq>(create);
  static UnbanReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get banOperation => $_getI64(0);
  @$pb.TagNumber(1)
  set banOperation($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBanOperation() => $_has(0);
  @$pb.TagNumber(1)
  void clearBanOperation() => $_clearField(1);

  @$pb.TagNumber(2)
  BanType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(BanType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get operatorId => $_getI64(2);
  @$pb.TagNumber(3)
  set operatorId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOperatorId() => $_has(2);
  @$pb.TagNumber(3)
  void clearOperatorId() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

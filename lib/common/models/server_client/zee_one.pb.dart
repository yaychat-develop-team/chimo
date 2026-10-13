// This is a generated file - do not edit.
//
// Generated from server_client/zee_one.proto.

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

class ZeeOneStartGameReq extends $pb.GeneratedMessage {
  factory ZeeOneStartGameReq({
    $core.int? gameId,
  }) {
    final result = create();
    if (gameId != null) result.gameId = gameId;
    return result;
  }

  ZeeOneStartGameReq._();

  factory ZeeOneStartGameReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ZeeOneStartGameReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ZeeOneStartGameReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'zee_one'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'gameId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ZeeOneStartGameReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ZeeOneStartGameReq copyWith(void Function(ZeeOneStartGameReq) updates) =>
      super.copyWith((message) => updates(message as ZeeOneStartGameReq))
          as ZeeOneStartGameReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ZeeOneStartGameReq create() => ZeeOneStartGameReq._();
  @$core.override
  ZeeOneStartGameReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ZeeOneStartGameReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ZeeOneStartGameReq>(create);
  static ZeeOneStartGameReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gameId => $_getIZ(0);
  @$pb.TagNumber(1)
  set gameId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => $_clearField(1);
}

class ZeeOneStartGameRsp extends $pb.GeneratedMessage {
  factory ZeeOneStartGameRsp({
    $core.String? sessionId,
    $fixnum.Int64? plateform,
    $fixnum.Int64? merchant,
    $core.String? iconType,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (plateform != null) result.plateform = plateform;
    if (merchant != null) result.merchant = merchant;
    if (iconType != null) result.iconType = iconType;
    return result;
  }

  ZeeOneStartGameRsp._();

  factory ZeeOneStartGameRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ZeeOneStartGameRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ZeeOneStartGameRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'zee_one'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..aInt64(2, _omitFieldNames ? '' : 'plateform')
    ..aInt64(3, _omitFieldNames ? '' : 'merchant')
    ..aOS(4, _omitFieldNames ? '' : 'iconType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ZeeOneStartGameRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ZeeOneStartGameRsp copyWith(void Function(ZeeOneStartGameRsp) updates) =>
      super.copyWith((message) => updates(message as ZeeOneStartGameRsp))
          as ZeeOneStartGameRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ZeeOneStartGameRsp create() => ZeeOneStartGameRsp._();
  @$core.override
  ZeeOneStartGameRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ZeeOneStartGameRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ZeeOneStartGameRsp>(create);
  static ZeeOneStartGameRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get plateform => $_getI64(1);
  @$pb.TagNumber(2)
  set plateform($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPlateform() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlateform() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get merchant => $_getI64(2);
  @$pb.TagNumber(3)
  set merchant($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMerchant() => $_has(2);
  @$pb.TagNumber(3)
  void clearMerchant() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get iconType => $_getSZ(3);
  @$pb.TagNumber(4)
  set iconType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIconType() => $_has(3);
  @$pb.TagNumber(4)
  void clearIconType() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

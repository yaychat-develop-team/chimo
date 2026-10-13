// This is a generated file - do not edit.
//
// Generated from server_client/amg.proto.

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

/// *
/// POST /api/v1/amg/start-game
/// Returns credentials passed to the AMG client SDK.
class AmgStartGameReq extends $pb.GeneratedMessage {
  factory AmgStartGameReq({
    $core.int? gameId,
    $core.String? roomId,
  }) {
    final result = create();
    if (gameId != null) result.gameId = gameId;
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  AmgStartGameReq._();

  factory AmgStartGameReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AmgStartGameReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AmgStartGameReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'amg'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'gameId')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AmgStartGameReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AmgStartGameReq copyWith(void Function(AmgStartGameReq) updates) =>
      super.copyWith((message) => updates(message as AmgStartGameReq))
          as AmgStartGameReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AmgStartGameReq create() => AmgStartGameReq._();
  @$core.override
  AmgStartGameReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AmgStartGameReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AmgStartGameReq>(create);
  static AmgStartGameReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gameId => $_getIZ(0);
  @$pb.TagNumber(1)
  set gameId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);
}

class AmgStartGameRsp extends $pb.GeneratedMessage {
  factory AmgStartGameRsp({
    $core.String? appKey,
    $core.String? token,
    $core.String? ext,
    $core.String? iconType,
    $fixnum.Int64? expireAt,
  }) {
    final result = create();
    if (appKey != null) result.appKey = appKey;
    if (token != null) result.token = token;
    if (ext != null) result.ext = ext;
    if (iconType != null) result.iconType = iconType;
    if (expireAt != null) result.expireAt = expireAt;
    return result;
  }

  AmgStartGameRsp._();

  factory AmgStartGameRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AmgStartGameRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AmgStartGameRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'amg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'appKey')
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..aOS(3, _omitFieldNames ? '' : 'ext')
    ..aOS(4, _omitFieldNames ? '' : 'iconType')
    ..aInt64(5, _omitFieldNames ? '' : 'expireAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AmgStartGameRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AmgStartGameRsp copyWith(void Function(AmgStartGameRsp) updates) =>
      super.copyWith((message) => updates(message as AmgStartGameRsp))
          as AmgStartGameRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AmgStartGameRsp create() => AmgStartGameRsp._();
  @$core.override
  AmgStartGameRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AmgStartGameRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AmgStartGameRsp>(create);
  static AmgStartGameRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get appKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set appKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAppKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get ext => $_getSZ(2);
  @$pb.TagNumber(3)
  set ext($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExt() => $_has(2);
  @$pb.TagNumber(3)
  void clearExt() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get iconType => $_getSZ(3);
  @$pb.TagNumber(4)
  set iconType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIconType() => $_has(3);
  @$pb.TagNumber(4)
  void clearIconType() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get expireAt => $_getI64(4);
  @$pb.TagNumber(5)
  set expireAt($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExpireAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpireAt() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

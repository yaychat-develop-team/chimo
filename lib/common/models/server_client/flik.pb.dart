// This is a generated file - do not edit.
//
// Generated from server_client/flik.proto.

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
/// POST /api/v1/flik/start-game
/// 返回游戏凭证和编码后的 Flik 游戏入口地址。
class FlikStartGameReq extends $pb.GeneratedMessage {
  factory FlikStartGameReq({
    $core.String? gameId,
    $core.String? roomId,
  }) {
    final result = create();
    if (gameId != null) result.gameId = gameId;
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  FlikStartGameReq._();

  factory FlikStartGameReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FlikStartGameReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FlikStartGameReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'flik'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gameId')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FlikStartGameReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FlikStartGameReq copyWith(void Function(FlikStartGameReq) updates) =>
      super.copyWith((message) => updates(message as FlikStartGameReq))
          as FlikStartGameReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FlikStartGameReq create() => FlikStartGameReq._();
  @$core.override
  FlikStartGameReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FlikStartGameReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FlikStartGameReq>(create);
  static FlikStartGameReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gameId => $_getSZ(0);
  @$pb.TagNumber(1)
  set gameId($core.String value) => $_setString(0, value);
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

class FlikStartGameRsp extends $pb.GeneratedMessage {
  factory FlikStartGameRsp({
    $core.String? appId,
    $core.String? token,
    $core.String? currency,
    $core.String? entryUrl,
    $fixnum.Int64? expireAt,
  }) {
    final result = create();
    if (appId != null) result.appId = appId;
    if (token != null) result.token = token;
    if (currency != null) result.currency = currency;
    if (entryUrl != null) result.entryUrl = entryUrl;
    if (expireAt != null) result.expireAt = expireAt;
    return result;
  }

  FlikStartGameRsp._();

  factory FlikStartGameRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FlikStartGameRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FlikStartGameRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'flik'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'appId')
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..aOS(3, _omitFieldNames ? '' : 'currency')
    ..aOS(4, _omitFieldNames ? '' : 'entryUrl')
    ..aInt64(5, _omitFieldNames ? '' : 'expireAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FlikStartGameRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FlikStartGameRsp copyWith(void Function(FlikStartGameRsp) updates) =>
      super.copyWith((message) => updates(message as FlikStartGameRsp))
          as FlikStartGameRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FlikStartGameRsp create() => FlikStartGameRsp._();
  @$core.override
  FlikStartGameRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FlikStartGameRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FlikStartGameRsp>(create);
  static FlikStartGameRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get appId => $_getSZ(0);
  @$pb.TagNumber(1)
  set appId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAppId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get currency => $_getSZ(2);
  @$pb.TagNumber(3)
  set currency($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCurrency() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrency() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get entryUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set entryUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEntryUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearEntryUrl() => $_clearField(4);

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

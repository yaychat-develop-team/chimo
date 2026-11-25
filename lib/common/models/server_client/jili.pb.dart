// This is a generated file - do not edit.
//
// Generated from server_client/jili.proto.

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

/// POST /api/v1/jili/start-game；钱包固定为 gem，不接收币种选择。
class JiliStartGameReq extends $pb.GeneratedMessage {
  factory JiliStartGameReq({
    $core.int? gameId,
    $core.String? roomId,
  }) {
    final result = create();
    if (gameId != null) result.gameId = gameId;
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  JiliStartGameReq._();

  factory JiliStartGameReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JiliStartGameReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JiliStartGameReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'jili'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'gameId')
    ..aOS(2, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JiliStartGameReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JiliStartGameReq copyWith(void Function(JiliStartGameReq) updates) =>
      super.copyWith((message) => updates(message as JiliStartGameReq))
          as JiliStartGameReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JiliStartGameReq create() => JiliStartGameReq._();
  @$core.override
  JiliStartGameReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JiliStartGameReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JiliStartGameReq>(create);
  static JiliStartGameReq? _defaultInstance;

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

class JiliStartGameRsp extends $pb.GeneratedMessage {
  factory JiliStartGameRsp({
    $core.String? entryUrl,
    $core.String? currency,
    $fixnum.Int64? expireAt,
  }) {
    final result = create();
    if (entryUrl != null) result.entryUrl = entryUrl;
    if (currency != null) result.currency = currency;
    if (expireAt != null) result.expireAt = expireAt;
    return result;
  }

  JiliStartGameRsp._();

  factory JiliStartGameRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JiliStartGameRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JiliStartGameRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'jili'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'entryUrl')
    ..aOS(2, _omitFieldNames ? '' : 'currency')
    ..aInt64(3, _omitFieldNames ? '' : 'expireAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JiliStartGameRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JiliStartGameRsp copyWith(void Function(JiliStartGameRsp) updates) =>
      super.copyWith((message) => updates(message as JiliStartGameRsp))
          as JiliStartGameRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JiliStartGameRsp create() => JiliStartGameRsp._();
  @$core.override
  JiliStartGameRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JiliStartGameRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JiliStartGameRsp>(create);
  static JiliStartGameRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get entryUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set entryUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEntryUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntryUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get currency => $_getSZ(1);
  @$pb.TagNumber(2)
  set currency($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCurrency() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrency() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get expireAt => $_getI64(2);
  @$pb.TagNumber(3)
  set expireAt($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpireAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpireAt() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

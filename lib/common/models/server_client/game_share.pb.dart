// This is a generated file - do not edit.
//
// Generated from server_client/game_share.proto.

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

/// 发送游戏分享卡片
class ShareGameReq extends $pb.GeneratedMessage {
  factory ShareGameReq({
    $core.String? gameId,
    $fixnum.Int64? toUid,
    $core.int? vendor,
  }) {
    final result = create();
    if (gameId != null) result.gameId = gameId;
    if (toUid != null) result.toUid = toUid;
    if (vendor != null) result.vendor = vendor;
    return result;
  }

  ShareGameReq._();

  factory ShareGameReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShareGameReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShareGameReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'game_share'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gameId')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'toUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(3, _omitFieldNames ? '' : 'vendor', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShareGameReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShareGameReq copyWith(void Function(ShareGameReq) updates) =>
      super.copyWith((message) => updates(message as ShareGameReq))
          as ShareGameReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShareGameReq create() => ShareGameReq._();
  @$core.override
  ShareGameReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShareGameReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShareGameReq>(create);
  static ShareGameReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gameId => $_getSZ(0);
  @$pb.TagNumber(1)
  set gameId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get toUid => $_getI64(1);
  @$pb.TagNumber(2)
  set toUid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearToUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get vendor => $_getIZ(2);
  @$pb.TagNumber(3)
  set vendor($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVendor() => $_has(2);
  @$pb.TagNumber(3)
  void clearVendor() => $_clearField(3);
}

/// 点击游戏卡片上报
class GameShareClickReq extends $pb.GeneratedMessage {
  factory GameShareClickReq({
    $core.String? gameId,
    $fixnum.Int64? senderUid,
  }) {
    final result = create();
    if (gameId != null) result.gameId = gameId;
    if (senderUid != null) result.senderUid = senderUid;
    return result;
  }

  GameShareClickReq._();

  factory GameShareClickReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GameShareClickReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GameShareClickReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'game_share'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gameId')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'senderUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GameShareClickReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GameShareClickReq copyWith(void Function(GameShareClickReq) updates) =>
      super.copyWith((message) => updates(message as GameShareClickReq))
          as GameShareClickReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GameShareClickReq create() => GameShareClickReq._();
  @$core.override
  GameShareClickReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GameShareClickReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GameShareClickReq>(create);
  static GameShareClickReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gameId => $_getSZ(0);
  @$pb.TagNumber(1)
  set gameId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get senderUid => $_getI64(1);
  @$pb.TagNumber(2)
  set senderUid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSenderUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderUid() => $_clearField(2);
}

/// 私聊游戏卡片消息体（IM custom 消息 content）
class GameShareCardContent extends $pb.GeneratedMessage {
  factory GameShareCardContent({
    $core.String? gameId,
    $core.String? gameName,
    $core.String? gameIcon,
    $core.String? gameUrl,
    $fixnum.Int64? senderUid,
    $core.String? senderNickname,
    $core.String? senderAvatar,
    $core.String? desc,
    $core.double? aspectRatio,
    $core.int? vendor,
  }) {
    final result = create();
    if (gameId != null) result.gameId = gameId;
    if (gameName != null) result.gameName = gameName;
    if (gameIcon != null) result.gameIcon = gameIcon;
    if (gameUrl != null) result.gameUrl = gameUrl;
    if (senderUid != null) result.senderUid = senderUid;
    if (senderNickname != null) result.senderNickname = senderNickname;
    if (senderAvatar != null) result.senderAvatar = senderAvatar;
    if (desc != null) result.desc = desc;
    if (aspectRatio != null) result.aspectRatio = aspectRatio;
    if (vendor != null) result.vendor = vendor;
    return result;
  }

  GameShareCardContent._();

  factory GameShareCardContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GameShareCardContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GameShareCardContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'game_share'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gameId')
    ..aOS(2, _omitFieldNames ? '' : 'gameName')
    ..aOS(3, _omitFieldNames ? '' : 'gameIcon')
    ..aOS(4, _omitFieldNames ? '' : 'gameUrl')
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'senderUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'senderNickname')
    ..aOS(7, _omitFieldNames ? '' : 'senderAvatar')
    ..aOS(8, _omitFieldNames ? '' : 'desc')
    ..aD(9, _omitFieldNames ? '' : 'aspectRatio', fieldType: $pb.PbFieldType.OF)
    ..aI(10, _omitFieldNames ? '' : 'vendor', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GameShareCardContent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GameShareCardContent copyWith(void Function(GameShareCardContent) updates) =>
      super.copyWith((message) => updates(message as GameShareCardContent))
          as GameShareCardContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GameShareCardContent create() => GameShareCardContent._();
  @$core.override
  GameShareCardContent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GameShareCardContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GameShareCardContent>(create);
  static GameShareCardContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gameId => $_getSZ(0);
  @$pb.TagNumber(1)
  set gameId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get gameName => $_getSZ(1);
  @$pb.TagNumber(2)
  set gameName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGameName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGameName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get gameIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set gameIcon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGameIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get gameUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set gameUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGameUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearGameUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get senderUid => $_getI64(4);
  @$pb.TagNumber(5)
  set senderUid($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSenderUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearSenderUid() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get senderNickname => $_getSZ(5);
  @$pb.TagNumber(6)
  set senderNickname($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSenderNickname() => $_has(5);
  @$pb.TagNumber(6)
  void clearSenderNickname() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get senderAvatar => $_getSZ(6);
  @$pb.TagNumber(7)
  set senderAvatar($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSenderAvatar() => $_has(6);
  @$pb.TagNumber(7)
  void clearSenderAvatar() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get desc => $_getSZ(7);
  @$pb.TagNumber(8)
  set desc($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDesc() => $_has(7);
  @$pb.TagNumber(8)
  void clearDesc() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get aspectRatio => $_getN(8);
  @$pb.TagNumber(9)
  set aspectRatio($core.double value) => $_setFloat(8, value);
  @$pb.TagNumber(9)
  $core.bool hasAspectRatio() => $_has(8);
  @$pb.TagNumber(9)
  void clearAspectRatio() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get vendor => $_getIZ(9);
  @$pb.TagNumber(10)
  set vendor($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasVendor() => $_has(9);
  @$pb.TagNumber(10)
  void clearVendor() => $_clearField(10);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

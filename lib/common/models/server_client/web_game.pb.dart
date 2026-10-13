// This is a generated file - do not edit.
//
// Generated from server_client/web_game.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'sud.pb.dart' as $0;
import 'user.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class WebGameListRsp extends $pb.GeneratedMessage {
  factory WebGameListRsp({
    $core.Iterable<$0.GameItemInfo>? gameList,
    $core.Iterable<$0.GameItemInfo>? playedList,
    $core.Iterable<$0.GameItemInfo>? hotList,
  }) {
    final result = create();
    if (gameList != null) result.gameList.addAll(gameList);
    if (playedList != null) result.playedList.addAll(playedList);
    if (hotList != null) result.hotList.addAll(hotList);
    return result;
  }

  WebGameListRsp._();

  factory WebGameListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WebGameListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WebGameListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'web_game'),
      createEmptyInstance: create)
    ..pPM<$0.GameItemInfo>(1, _omitFieldNames ? '' : 'gameList',
        subBuilder: $0.GameItemInfo.create)
    ..pPM<$0.GameItemInfo>(2, _omitFieldNames ? '' : 'playedList',
        subBuilder: $0.GameItemInfo.create)
    ..pPM<$0.GameItemInfo>(3, _omitFieldNames ? '' : 'hotList',
        subBuilder: $0.GameItemInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebGameListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebGameListRsp copyWith(void Function(WebGameListRsp) updates) =>
      super.copyWith((message) => updates(message as WebGameListRsp))
          as WebGameListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WebGameListRsp create() => WebGameListRsp._();
  @$core.override
  WebGameListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WebGameListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WebGameListRsp>(create);
  static WebGameListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.GameItemInfo> get gameList => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$0.GameItemInfo> get playedList => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$0.GameItemInfo> get hotList => $_getList(2);
}

class WebGameLotteryMessage extends $pb.GeneratedMessage {
  factory WebGameLotteryMessage({
    $1.SimpleUser? user,
    $core.String? gameUrl,
    $core.String? gameName,
    $fixnum.Int64? coins,
    $core.int? vendor,
    $core.double? aspectRatio,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (gameUrl != null) result.gameUrl = gameUrl;
    if (gameName != null) result.gameName = gameName;
    if (coins != null) result.coins = coins;
    if (vendor != null) result.vendor = vendor;
    if (aspectRatio != null) result.aspectRatio = aspectRatio;
    return result;
  }

  WebGameLotteryMessage._();

  factory WebGameLotteryMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WebGameLotteryMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WebGameLotteryMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'web_game'),
      createEmptyInstance: create)
    ..aOM<$1.SimpleUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: $1.SimpleUser.create)
    ..aOS(2, _omitFieldNames ? '' : 'gameUrl')
    ..aOS(3, _omitFieldNames ? '' : 'gameName')
    ..aInt64(4, _omitFieldNames ? '' : 'coins')
    ..aI(5, _omitFieldNames ? '' : 'vendor', fieldType: $pb.PbFieldType.OU3)
    ..aD(6, _omitFieldNames ? '' : 'aspectRatio', fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebGameLotteryMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebGameLotteryMessage copyWith(
          void Function(WebGameLotteryMessage) updates) =>
      super.copyWith((message) => updates(message as WebGameLotteryMessage))
          as WebGameLotteryMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WebGameLotteryMessage create() => WebGameLotteryMessage._();
  @$core.override
  WebGameLotteryMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WebGameLotteryMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WebGameLotteryMessage>(create);
  static WebGameLotteryMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $1.SimpleUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($1.SimpleUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.SimpleUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get gameUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set gameUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGameUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearGameUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get gameName => $_getSZ(2);
  @$pb.TagNumber(3)
  set gameName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGameName() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameName() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get coins => $_getI64(3);
  @$pb.TagNumber(4)
  set coins($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCoins() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoins() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get vendor => $_getIZ(4);
  @$pb.TagNumber(5)
  set vendor($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVendor() => $_has(4);
  @$pb.TagNumber(5)
  void clearVendor() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get aspectRatio => $_getN(5);
  @$pb.TagNumber(6)
  set aspectRatio($core.double value) => $_setFloat(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAspectRatio() => $_has(5);
  @$pb.TagNumber(6)
  void clearAspectRatio() => $_clearField(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

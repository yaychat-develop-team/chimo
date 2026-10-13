// This is a generated file - do not edit.
//
// Generated from server_client/sud.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'cash.pb.dart' as $1;
import 'user.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class SudLoginRsp extends $pb.GeneratedMessage {
  factory SudLoginRsp({
    $core.bool? success,
    $core.String? message,
    $core.String? code,
    $fixnum.Int64? expireDate,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (code != null) result.code = code;
    if (expireDate != null) result.expireDate = expireDate;
    return result;
  }

  SudLoginRsp._();

  factory SudLoginRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SudLoginRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SudLoginRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sud'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOS(3, _omitFieldNames ? '' : 'code')
    ..aInt64(4, _omitFieldNames ? '' : 'expireDate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SudLoginRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SudLoginRsp copyWith(void Function(SudLoginRsp) updates) =>
      super.copyWith((message) => updates(message as SudLoginRsp))
          as SudLoginRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SudLoginRsp create() => SudLoginRsp._();
  @$core.override
  SudLoginRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SudLoginRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SudLoginRsp>(create);
  static SudLoginRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get code => $_getSZ(2);
  @$pb.TagNumber(3)
  set code($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCode() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get expireDate => $_getI64(3);
  @$pb.TagNumber(4)
  set expireDate($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpireDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpireDate() => $_clearField(4);
}

class GameItemInfo extends $pb.GeneratedMessage {
  factory GameItemInfo({
    $core.String? gameId,
    $core.String? gameTitle,
    $core.String? gameIcon,
    $core.String? gameUrl,
    $core.int? gameLikes,
    $core.int? needMembers,
    $core.int? vendor,
    $core.double? aspectRatio,
    $core.bool? isNew,
  }) {
    final result = create();
    if (gameId != null) result.gameId = gameId;
    if (gameTitle != null) result.gameTitle = gameTitle;
    if (gameIcon != null) result.gameIcon = gameIcon;
    if (gameUrl != null) result.gameUrl = gameUrl;
    if (gameLikes != null) result.gameLikes = gameLikes;
    if (needMembers != null) result.needMembers = needMembers;
    if (vendor != null) result.vendor = vendor;
    if (aspectRatio != null) result.aspectRatio = aspectRatio;
    if (isNew != null) result.isNew = isNew;
    return result;
  }

  GameItemInfo._();

  factory GameItemInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GameItemInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GameItemInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sud'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gameId')
    ..aOS(2, _omitFieldNames ? '' : 'gameTitle')
    ..aOS(3, _omitFieldNames ? '' : 'gameIcon')
    ..aOS(4, _omitFieldNames ? '' : 'gameUrl')
    ..aI(5, _omitFieldNames ? '' : 'gameLikes')
    ..aI(6, _omitFieldNames ? '' : 'needMembers')
    ..aI(7, _omitFieldNames ? '' : 'vendor', fieldType: $pb.PbFieldType.OU3)
    ..aD(8, _omitFieldNames ? '' : 'aspectRatio', fieldType: $pb.PbFieldType.OF)
    ..aOB(9, _omitFieldNames ? '' : 'isNew')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GameItemInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GameItemInfo copyWith(void Function(GameItemInfo) updates) =>
      super.copyWith((message) => updates(message as GameItemInfo))
          as GameItemInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GameItemInfo create() => GameItemInfo._();
  @$core.override
  GameItemInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GameItemInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GameItemInfo>(create);
  static GameItemInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gameId => $_getSZ(0);
  @$pb.TagNumber(1)
  set gameId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get gameTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set gameTitle($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGameTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearGameTitle() => $_clearField(2);

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
  $core.int get gameLikes => $_getIZ(4);
  @$pb.TagNumber(5)
  set gameLikes($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGameLikes() => $_has(4);
  @$pb.TagNumber(5)
  void clearGameLikes() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get needMembers => $_getIZ(5);
  @$pb.TagNumber(6)
  set needMembers($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNeedMembers() => $_has(5);
  @$pb.TagNumber(6)
  void clearNeedMembers() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get vendor => $_getIZ(6);
  @$pb.TagNumber(7)
  set vendor($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasVendor() => $_has(6);
  @$pb.TagNumber(7)
  void clearVendor() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get aspectRatio => $_getN(7);
  @$pb.TagNumber(8)
  set aspectRatio($core.double value) => $_setFloat(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAspectRatio() => $_has(7);
  @$pb.TagNumber(8)
  void clearAspectRatio() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isNew => $_getBF(8);
  @$pb.TagNumber(9)
  set isNew($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasIsNew() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsNew() => $_clearField(9);
}

class SudGameListRsp extends $pb.GeneratedMessage {
  factory SudGameListRsp({
    $core.Iterable<GameItemInfo>? gameList,
  }) {
    final result = create();
    if (gameList != null) result.gameList.addAll(gameList);
    return result;
  }

  SudGameListRsp._();

  factory SudGameListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SudGameListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SudGameListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sud'),
      createEmptyInstance: create)
    ..pPM<GameItemInfo>(1, _omitFieldNames ? '' : 'gameList',
        subBuilder: GameItemInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SudGameListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SudGameListRsp copyWith(void Function(SudGameListRsp) updates) =>
      super.copyWith((message) => updates(message as SudGameListRsp))
          as SudGameListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SudGameListRsp create() => SudGameListRsp._();
  @$core.override
  SudGameListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SudGameListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SudGameListRsp>(create);
  static SudGameListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GameItemInfo> get gameList => $_getList(0);
}

class GameResultMsg extends $pb.GeneratedMessage {
  factory GameResultMsg({
    $core.Iterable<$fixnum.Int64>? winners,
    $core.Iterable<$fixnum.Int64>? losers,
    $core.Iterable<$fixnum.Int64>? winnerGifts,
    $core.Iterable<$fixnum.Int64>? loserGifts,
    $core.Iterable<$0.User>? users,
    $core.Iterable<$1.ItemInfo>? gifts,
  }) {
    final result = create();
    if (winners != null) result.winners.addAll(winners);
    if (losers != null) result.losers.addAll(losers);
    if (winnerGifts != null) result.winnerGifts.addAll(winnerGifts);
    if (loserGifts != null) result.loserGifts.addAll(loserGifts);
    if (users != null) result.users.addAll(users);
    if (gifts != null) result.gifts.addAll(gifts);
    return result;
  }

  GameResultMsg._();

  factory GameResultMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GameResultMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GameResultMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sud'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'winners', $pb.PbFieldType.K6)
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : 'losers', $pb.PbFieldType.K6)
    ..p<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'winnerGifts', $pb.PbFieldType.K6,
        protoName: 'winnerGifts')
    ..p<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'loserGifts', $pb.PbFieldType.K6,
        protoName: 'loserGifts')
    ..pPM<$0.User>(5, _omitFieldNames ? '' : 'users',
        subBuilder: $0.User.create)
    ..pPM<$1.ItemInfo>(6, _omitFieldNames ? '' : 'gifts',
        subBuilder: $1.ItemInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GameResultMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GameResultMsg copyWith(void Function(GameResultMsg) updates) =>
      super.copyWith((message) => updates(message as GameResultMsg))
          as GameResultMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GameResultMsg create() => GameResultMsg._();
  @$core.override
  GameResultMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GameResultMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GameResultMsg>(create);
  static GameResultMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get winners => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$fixnum.Int64> get losers => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$fixnum.Int64> get winnerGifts => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<$fixnum.Int64> get loserGifts => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<$0.User> get users => $_getList(4);

  @$pb.TagNumber(6)
  $pb.PbList<$1.ItemInfo> get gifts => $_getList(5);
}

class UserGameCareerItem extends $pb.GeneratedMessage {
  factory UserGameCareerItem({
    $core.String? icon,
    $core.bool? hasPlayed,
    $fixnum.Int64? gameId,
    $core.String? gameName,
  }) {
    final result = create();
    if (icon != null) result.icon = icon;
    if (hasPlayed != null) result.hasPlayed = hasPlayed;
    if (gameId != null) result.gameId = gameId;
    if (gameName != null) result.gameName = gameName;
    return result;
  }

  UserGameCareerItem._();

  factory UserGameCareerItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserGameCareerItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserGameCareerItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sud'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'icon')
    ..aOB(2, _omitFieldNames ? '' : 'hasPlayed')
    ..aInt64(3, _omitFieldNames ? '' : 'gameId')
    ..aOS(4, _omitFieldNames ? '' : 'gameName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserGameCareerItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserGameCareerItem copyWith(void Function(UserGameCareerItem) updates) =>
      super.copyWith((message) => updates(message as UserGameCareerItem))
          as UserGameCareerItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserGameCareerItem create() => UserGameCareerItem._();
  @$core.override
  UserGameCareerItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserGameCareerItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserGameCareerItem>(create);
  static UserGameCareerItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get hasPlayed => $_getBF(1);
  @$pb.TagNumber(2)
  set hasPlayed($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHasPlayed() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasPlayed() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get gameId => $_getI64(2);
  @$pb.TagNumber(3)
  set gameId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGameId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get gameName => $_getSZ(3);
  @$pb.TagNumber(4)
  set gameName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGameName() => $_has(3);
  @$pb.TagNumber(4)
  void clearGameName() => $_clearField(4);
}

class UserGameCareerRsp extends $pb.GeneratedMessage {
  factory UserGameCareerRsp({
    $core.Iterable<UserGameCareerItem>? gameCareerList,
  }) {
    final result = create();
    if (gameCareerList != null) result.gameCareerList.addAll(gameCareerList);
    return result;
  }

  UserGameCareerRsp._();

  factory UserGameCareerRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserGameCareerRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserGameCareerRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sud'),
      createEmptyInstance: create)
    ..pPM<UserGameCareerItem>(1, _omitFieldNames ? '' : 'gameCareerList',
        subBuilder: UserGameCareerItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserGameCareerRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserGameCareerRsp copyWith(void Function(UserGameCareerRsp) updates) =>
      super.copyWith((message) => updates(message as UserGameCareerRsp))
          as UserGameCareerRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserGameCareerRsp create() => UserGameCareerRsp._();
  @$core.override
  UserGameCareerRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserGameCareerRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserGameCareerRsp>(create);
  static UserGameCareerRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserGameCareerItem> get gameCareerList => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

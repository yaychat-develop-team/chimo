// This is a generated file - do not edit.
//
// Generated from server_client/gs_invite.proto.

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

class GsInviteUser extends $pb.GeneratedMessage {
  factory GsInviteUser({
    $fixnum.Int64? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? gender,
    $core.int? age,
    $core.String? createTime,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (gender != null) result.gender = gender;
    if (age != null) result.age = age;
    if (createTime != null) result.createTime = createTime;
    return result;
  }

  GsInviteUser._();

  factory GsInviteUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsInviteUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsInviteUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_train_group'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aOS(4, _omitFieldNames ? '' : 'gender')
    ..aI(5, _omitFieldNames ? '' : 'age', fieldType: $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'createTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInviteUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInviteUser copyWith(void Function(GsInviteUser) updates) =>
      super.copyWith((message) => updates(message as GsInviteUser))
          as GsInviteUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsInviteUser create() => GsInviteUser._();
  @$core.override
  GsInviteUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsInviteUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsInviteUser>(create);
  static GsInviteUser? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get gender => $_getSZ(3);
  @$pb.TagNumber(4)
  set gender($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get age => $_getIZ(4);
  @$pb.TagNumber(5)
  set age($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAge() => $_has(4);
  @$pb.TagNumber(5)
  void clearAge() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get createTime => $_getSZ(5);
  @$pb.TagNumber(6)
  set createTime($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => $_clearField(6);
}

class GsInviteMineInfo extends $pb.GeneratedMessage {
  factory GsInviteMineInfo({
    $core.int? lastWeekReward,
    $core.int? totalReward,
    $core.String? inviteCode,
    $core.Iterable<GsInviteUser>? rank,
    $core.String? shareUrl,
    $core.String? shareText,
    $core.String? shareTextCopy,
  }) {
    final result = create();
    if (lastWeekReward != null) result.lastWeekReward = lastWeekReward;
    if (totalReward != null) result.totalReward = totalReward;
    if (inviteCode != null) result.inviteCode = inviteCode;
    if (rank != null) result.rank.addAll(rank);
    if (shareUrl != null) result.shareUrl = shareUrl;
    if (shareText != null) result.shareText = shareText;
    if (shareTextCopy != null) result.shareTextCopy = shareTextCopy;
    return result;
  }

  GsInviteMineInfo._();

  factory GsInviteMineInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsInviteMineInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsInviteMineInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_train_group'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'lastWeekReward',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'totalReward',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'inviteCode')
    ..pPM<GsInviteUser>(4, _omitFieldNames ? '' : 'rank',
        subBuilder: GsInviteUser.create)
    ..aOS(5, _omitFieldNames ? '' : 'shareUrl')
    ..aOS(6, _omitFieldNames ? '' : 'shareText')
    ..aOS(7, _omitFieldNames ? '' : 'shareTextCopy')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInviteMineInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInviteMineInfo copyWith(void Function(GsInviteMineInfo) updates) =>
      super.copyWith((message) => updates(message as GsInviteMineInfo))
          as GsInviteMineInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsInviteMineInfo create() => GsInviteMineInfo._();
  @$core.override
  GsInviteMineInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsInviteMineInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsInviteMineInfo>(create);
  static GsInviteMineInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lastWeekReward => $_getIZ(0);
  @$pb.TagNumber(1)
  set lastWeekReward($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLastWeekReward() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastWeekReward() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalReward => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalReward($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalReward() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalReward() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get inviteCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set inviteCode($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasInviteCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearInviteCode() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<GsInviteUser> get rank => $_getList(3);

  /// 分享链接
  @$pb.TagNumber(5)
  $core.String get shareUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set shareUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasShareUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearShareUrl() => $_clearField(5);

  /// 分享文案(分享按钮)
  @$pb.TagNumber(6)
  $core.String get shareText => $_getSZ(5);
  @$pb.TagNumber(6)
  set shareText($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasShareText() => $_has(5);
  @$pb.TagNumber(6)
  void clearShareText() => $_clearField(6);

  /// 分享文案(复制链接)
  @$pb.TagNumber(7)
  $core.String get shareTextCopy => $_getSZ(6);
  @$pb.TagNumber(7)
  set shareTextCopy($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasShareTextCopy() => $_has(6);
  @$pb.TagNumber(7)
  void clearShareTextCopy() => $_clearField(7);
}

/// 邀请列表
class GsInviteItem extends $pb.GeneratedMessage {
  factory GsInviteItem({
    GsInviteUser? user,
    $core.int? status,
    $core.String? statusStr,
    $core.int? reward,
    $core.String? rewardStr,
    $core.String? level,
    $core.String? period,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (status != null) result.status = status;
    if (statusStr != null) result.statusStr = statusStr;
    if (reward != null) result.reward = reward;
    if (rewardStr != null) result.rewardStr = rewardStr;
    if (level != null) result.level = level;
    if (period != null) result.period = period;
    return result;
  }

  GsInviteItem._();

  factory GsInviteItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsInviteItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsInviteItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_train_group'),
      createEmptyInstance: create)
    ..aOM<GsInviteUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: GsInviteUser.create)
    ..aI(2, _omitFieldNames ? '' : 'status', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'statusStr')
    ..aI(4, _omitFieldNames ? '' : 'reward', fieldType: $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'rewardStr')
    ..aOS(6, _omitFieldNames ? '' : 'level')
    ..aOS(7, _omitFieldNames ? '' : 'period')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInviteItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInviteItem copyWith(void Function(GsInviteItem) updates) =>
      super.copyWith((message) => updates(message as GsInviteItem))
          as GsInviteItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsInviteItem create() => GsInviteItem._();
  @$core.override
  GsInviteItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsInviteItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsInviteItem>(create);
  static GsInviteItem? _defaultInstance;

  @$pb.TagNumber(1)
  GsInviteUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(GsInviteUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  GsInviteUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(2)
  set status($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get statusStr => $_getSZ(2);
  @$pb.TagNumber(3)
  set statusStr($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStatusStr() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatusStr() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get reward => $_getIZ(3);
  @$pb.TagNumber(4)
  set reward($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReward() => $_has(3);
  @$pb.TagNumber(4)
  void clearReward() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get rewardStr => $_getSZ(4);
  @$pb.TagNumber(5)
  set rewardStr($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRewardStr() => $_has(4);
  @$pb.TagNumber(5)
  void clearRewardStr() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get level => $_getSZ(5);
  @$pb.TagNumber(6)
  set level($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearLevel() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get period => $_getSZ(6);
  @$pb.TagNumber(7)
  set period($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPeriod() => $_has(6);
  @$pb.TagNumber(7)
  void clearPeriod() => $_clearField(7);
}

class GsInviteListRsp extends $pb.GeneratedMessage {
  factory GsInviteListRsp({
    GsInviteMineInfo? mineInfo,
    $core.int? pageNum,
    $core.int? pageSize,
    $core.Iterable<GsInviteItem>? items,
  }) {
    final result = create();
    if (mineInfo != null) result.mineInfo = mineInfo;
    if (pageNum != null) result.pageNum = pageNum;
    if (pageSize != null) result.pageSize = pageSize;
    if (items != null) result.items.addAll(items);
    return result;
  }

  GsInviteListRsp._();

  factory GsInviteListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsInviteListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsInviteListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_train_group'),
      createEmptyInstance: create)
    ..aOM<GsInviteMineInfo>(1, _omitFieldNames ? '' : 'mineInfo',
        subBuilder: GsInviteMineInfo.create)
    ..aI(2, _omitFieldNames ? '' : 'pageNum', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'pageSize', fieldType: $pb.PbFieldType.OU3)
    ..pPM<GsInviteItem>(4, _omitFieldNames ? '' : 'items',
        subBuilder: GsInviteItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInviteListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInviteListRsp copyWith(void Function(GsInviteListRsp) updates) =>
      super.copyWith((message) => updates(message as GsInviteListRsp))
          as GsInviteListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsInviteListRsp create() => GsInviteListRsp._();
  @$core.override
  GsInviteListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsInviteListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsInviteListRsp>(create);
  static GsInviteListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  GsInviteMineInfo get mineInfo => $_getN(0);
  @$pb.TagNumber(1)
  set mineInfo(GsInviteMineInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMineInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearMineInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  GsInviteMineInfo ensureMineInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get pageNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageNum($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPageNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageNum() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get pageSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set pageSize($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPageSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageSize() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<GsInviteItem> get items => $_getList(3);
}

/// 主播邀请榜，积分榜 & 奖励榜
class GsInviteRankItem extends $pb.GeneratedMessage {
  factory GsInviteRankItem({
    GsInviteUser? user,
    $core.int? rank,
    $core.int? reward,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (rank != null) result.rank = rank;
    if (reward != null) result.reward = reward;
    return result;
  }

  GsInviteRankItem._();

  factory GsInviteRankItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsInviteRankItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsInviteRankItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_train_group'),
      createEmptyInstance: create)
    ..aOM<GsInviteUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: GsInviteUser.create)
    ..aI(2, _omitFieldNames ? '' : 'rank', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'reward', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInviteRankItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInviteRankItem copyWith(void Function(GsInviteRankItem) updates) =>
      super.copyWith((message) => updates(message as GsInviteRankItem))
          as GsInviteRankItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsInviteRankItem create() => GsInviteRankItem._();
  @$core.override
  GsInviteRankItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsInviteRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsInviteRankItem>(create);
  static GsInviteRankItem? _defaultInstance;

  @$pb.TagNumber(1)
  GsInviteUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(GsInviteUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  GsInviteUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get rank => $_getIZ(1);
  @$pb.TagNumber(2)
  set rank($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearRank() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get reward => $_getIZ(2);
  @$pb.TagNumber(3)
  set reward($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReward() => $_has(2);
  @$pb.TagNumber(3)
  void clearReward() => $_clearField(3);
}

class GsInviteRankRsp extends $pb.GeneratedMessage {
  factory GsInviteRankRsp({
    GsInviteRankItem? mine,
    $core.Iterable<GsInviteRankItem>? items,
  }) {
    final result = create();
    if (mine != null) result.mine = mine;
    if (items != null) result.items.addAll(items);
    return result;
  }

  GsInviteRankRsp._();

  factory GsInviteRankRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsInviteRankRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsInviteRankRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_train_group'),
      createEmptyInstance: create)
    ..aOM<GsInviteRankItem>(1, _omitFieldNames ? '' : 'mine',
        subBuilder: GsInviteRankItem.create)
    ..pPM<GsInviteRankItem>(2, _omitFieldNames ? '' : 'items',
        subBuilder: GsInviteRankItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInviteRankRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInviteRankRsp copyWith(void Function(GsInviteRankRsp) updates) =>
      super.copyWith((message) => updates(message as GsInviteRankRsp))
          as GsInviteRankRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsInviteRankRsp create() => GsInviteRankRsp._();
  @$core.override
  GsInviteRankRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsInviteRankRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsInviteRankRsp>(create);
  static GsInviteRankRsp? _defaultInstance;

  @$pb.TagNumber(1)
  GsInviteRankItem get mine => $_getN(0);
  @$pb.TagNumber(1)
  set mine(GsInviteRankItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMine() => $_has(0);
  @$pb.TagNumber(1)
  void clearMine() => $_clearField(1);
  @$pb.TagNumber(1)
  GsInviteRankItem ensureMine() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<GsInviteRankItem> get items => $_getList(1);
}

class UpdateGsInviteStatusReq extends $pb.GeneratedMessage {
  factory UpdateGsInviteStatusReq({
    $fixnum.Int64? uid,
    $core.String? stage,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (stage != null) result.stage = stage;
    return result;
  }

  UpdateGsInviteStatusReq._();

  factory UpdateGsInviteStatusReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateGsInviteStatusReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateGsInviteStatusReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_train_group'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'stage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGsInviteStatusReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGsInviteStatusReq copyWith(
          void Function(UpdateGsInviteStatusReq) updates) =>
      super.copyWith((message) => updates(message as UpdateGsInviteStatusReq))
          as UpdateGsInviteStatusReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGsInviteStatusReq create() => UpdateGsInviteStatusReq._();
  @$core.override
  UpdateGsInviteStatusReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateGsInviteStatusReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateGsInviteStatusReq>(create);
  static UpdateGsInviteStatusReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get stage => $_getSZ(1);
  @$pb.TagNumber(2)
  set stage($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStage() => $_has(1);
  @$pb.TagNumber(2)
  void clearStage() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

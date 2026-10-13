// This is a generated file - do not edit.
//
// Generated from server_client/gs_group.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GroupMemberData extends $pb.GeneratedMessage {
  factory GroupMemberData({
    $core.Iterable<GroupMemberDataItem>? item,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    return result;
  }

  GroupMemberData._();

  factory GroupMemberData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupMemberData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupMemberData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..pPM<GroupMemberDataItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: GroupMemberDataItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupMemberData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupMemberData copyWith(void Function(GroupMemberData) updates) =>
      super.copyWith((message) => updates(message as GroupMemberData))
          as GroupMemberData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupMemberData create() => GroupMemberData._();
  @$core.override
  GroupMemberData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupMemberData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupMemberData>(create);
  static GroupMemberData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GroupMemberDataItem> get item => $_getList(0);
}

class GroupMemberDataItem extends $pb.GeneratedMessage {
  factory GroupMemberDataItem({
    $fixnum.Int64? uid,
    $core.String? nickName,
    $core.String? gender,
    $core.int? age,
    $core.String? avatar,
    $core.int? takeCashPermission,
    $core.int? role,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (nickName != null) result.nickName = nickName;
    if (gender != null) result.gender = gender;
    if (age != null) result.age = age;
    if (avatar != null) result.avatar = avatar;
    if (takeCashPermission != null)
      result.takeCashPermission = takeCashPermission;
    if (role != null) result.role = role;
    return result;
  }

  GroupMemberDataItem._();

  factory GroupMemberDataItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupMemberDataItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupMemberDataItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'nickName')
    ..aOS(3, _omitFieldNames ? '' : 'gender')
    ..aI(4, _omitFieldNames ? '' : 'age', fieldType: $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'avatar')
    ..aI(6, _omitFieldNames ? '' : 'takeCashPermission',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(7, _omitFieldNames ? '' : 'role', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupMemberDataItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupMemberDataItem copyWith(void Function(GroupMemberDataItem) updates) =>
      super.copyWith((message) => updates(message as GroupMemberDataItem))
          as GroupMemberDataItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupMemberDataItem create() => GroupMemberDataItem._();
  @$core.override
  GroupMemberDataItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupMemberDataItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupMemberDataItem>(create);
  static GroupMemberDataItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get gender => $_getSZ(2);
  @$pb.TagNumber(3)
  set gender($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGender() => $_has(2);
  @$pb.TagNumber(3)
  void clearGender() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get age => $_getIZ(3);
  @$pb.TagNumber(4)
  set age($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAge() => $_has(3);
  @$pb.TagNumber(4)
  void clearAge() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get avatar => $_getSZ(4);
  @$pb.TagNumber(5)
  set avatar($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAvatar() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvatar() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get takeCashPermission => $_getIZ(5);
  @$pb.TagNumber(6)
  set takeCashPermission($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTakeCashPermission() => $_has(5);
  @$pb.TagNumber(6)
  void clearTakeCashPermission() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get role => $_getIZ(6);
  @$pb.TagNumber(7)
  set role($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRole() => $_has(6);
  @$pb.TagNumber(7)
  void clearRole() => $_clearField(7);
}

class TopFlowGroupRankData extends $pb.GeneratedMessage {
  factory TopFlowGroupRankData({
    $core.Iterable<TopFlowGroupRankItem>? item,
    TopFlowGroupRankItem? myselfItem,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    if (myselfItem != null) result.myselfItem = myselfItem;
    return result;
  }

  TopFlowGroupRankData._();

  factory TopFlowGroupRankData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TopFlowGroupRankData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TopFlowGroupRankData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..pPM<TopFlowGroupRankItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: TopFlowGroupRankItem.create)
    ..aOM<TopFlowGroupRankItem>(2, _omitFieldNames ? '' : 'myselfItem',
        subBuilder: TopFlowGroupRankItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TopFlowGroupRankData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TopFlowGroupRankData copyWith(void Function(TopFlowGroupRankData) updates) =>
      super.copyWith((message) => updates(message as TopFlowGroupRankData))
          as TopFlowGroupRankData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TopFlowGroupRankData create() => TopFlowGroupRankData._();
  @$core.override
  TopFlowGroupRankData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TopFlowGroupRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TopFlowGroupRankData>(create);
  static TopFlowGroupRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TopFlowGroupRankItem> get item => $_getList(0);

  @$pb.TagNumber(2)
  TopFlowGroupRankItem get myselfItem => $_getN(1);
  @$pb.TagNumber(2)
  set myselfItem(TopFlowGroupRankItem value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMyselfItem() => $_has(1);
  @$pb.TagNumber(2)
  void clearMyselfItem() => $_clearField(2);
  @$pb.TagNumber(2)
  TopFlowGroupRankItem ensureMyselfItem() => $_ensure(1);
}

class TopFlowGroupRankItem extends $pb.GeneratedMessage {
  factory TopFlowGroupRankItem({
    $fixnum.Int64? groupId,
    $core.String? groupName,
    $fixnum.Int64? leaderId,
    $core.String? leaderNickName,
    $core.String? leaderGender,
    $core.int? leaderAge,
    $core.String? leaderAvatar,
    $fixnum.Int64? totalScore,
    $fixnum.Int64? newRegisterScore,
    $fixnum.Int64? over100Score,
    $fixnum.Int64? over1000Score,
    $core.int? rank,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    if (groupName != null) result.groupName = groupName;
    if (leaderId != null) result.leaderId = leaderId;
    if (leaderNickName != null) result.leaderNickName = leaderNickName;
    if (leaderGender != null) result.leaderGender = leaderGender;
    if (leaderAge != null) result.leaderAge = leaderAge;
    if (leaderAvatar != null) result.leaderAvatar = leaderAvatar;
    if (totalScore != null) result.totalScore = totalScore;
    if (newRegisterScore != null) result.newRegisterScore = newRegisterScore;
    if (over100Score != null) result.over100Score = over100Score;
    if (over1000Score != null) result.over1000Score = over1000Score;
    if (rank != null) result.rank = rank;
    return result;
  }

  TopFlowGroupRankItem._();

  factory TopFlowGroupRankItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TopFlowGroupRankItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TopFlowGroupRankItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'groupName')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'leaderId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'leaderNickName')
    ..aOS(5, _omitFieldNames ? '' : 'leaderGender')
    ..aI(6, _omitFieldNames ? '' : 'leaderAge', fieldType: $pb.PbFieldType.OU3)
    ..aOS(7, _omitFieldNames ? '' : 'leaderAvatar')
    ..a<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'totalScore', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        9, _omitFieldNames ? '' : 'newRegisterScore', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        10, _omitFieldNames ? '' : 'over100Score', $pb.PbFieldType.OU6,
        protoName: 'over_100_score', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        11, _omitFieldNames ? '' : 'over1000Score', $pb.PbFieldType.OU6,
        protoName: 'over_1000_score', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(12, _omitFieldNames ? '' : 'rank')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TopFlowGroupRankItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TopFlowGroupRankItem copyWith(void Function(TopFlowGroupRankItem) updates) =>
      super.copyWith((message) => updates(message as TopFlowGroupRankItem))
          as TopFlowGroupRankItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TopFlowGroupRankItem create() => TopFlowGroupRankItem._();
  @$core.override
  TopFlowGroupRankItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TopFlowGroupRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TopFlowGroupRankItem>(create);
  static TopFlowGroupRankItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get leaderId => $_getI64(2);
  @$pb.TagNumber(3)
  set leaderId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLeaderId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeaderId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get leaderNickName => $_getSZ(3);
  @$pb.TagNumber(4)
  set leaderNickName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLeaderNickName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeaderNickName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get leaderGender => $_getSZ(4);
  @$pb.TagNumber(5)
  set leaderGender($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLeaderGender() => $_has(4);
  @$pb.TagNumber(5)
  void clearLeaderGender() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get leaderAge => $_getIZ(5);
  @$pb.TagNumber(6)
  set leaderAge($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLeaderAge() => $_has(5);
  @$pb.TagNumber(6)
  void clearLeaderAge() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get leaderAvatar => $_getSZ(6);
  @$pb.TagNumber(7)
  set leaderAvatar($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLeaderAvatar() => $_has(6);
  @$pb.TagNumber(7)
  void clearLeaderAvatar() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get totalScore => $_getI64(7);
  @$pb.TagNumber(8)
  set totalScore($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTotalScore() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalScore() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get newRegisterScore => $_getI64(8);
  @$pb.TagNumber(9)
  set newRegisterScore($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasNewRegisterScore() => $_has(8);
  @$pb.TagNumber(9)
  void clearNewRegisterScore() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get over100Score => $_getI64(9);
  @$pb.TagNumber(10)
  set over100Score($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasOver100Score() => $_has(9);
  @$pb.TagNumber(10)
  void clearOver100Score() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get over1000Score => $_getI64(10);
  @$pb.TagNumber(11)
  set over1000Score($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasOver1000Score() => $_has(10);
  @$pb.TagNumber(11)
  void clearOver1000Score() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get rank => $_getIZ(11);
  @$pb.TagNumber(12)
  set rank($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasRank() => $_has(11);
  @$pb.TagNumber(12)
  void clearRank() => $_clearField(12);
}

class TopFlowPersonalRankData extends $pb.GeneratedMessage {
  factory TopFlowPersonalRankData({
    $core.Iterable<TopFlowPersonalRankItem>? item,
    TopFlowPersonalRankItem? myselfItem,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    if (myselfItem != null) result.myselfItem = myselfItem;
    return result;
  }

  TopFlowPersonalRankData._();

  factory TopFlowPersonalRankData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TopFlowPersonalRankData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TopFlowPersonalRankData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..pPM<TopFlowPersonalRankItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: TopFlowPersonalRankItem.create)
    ..aOM<TopFlowPersonalRankItem>(2, _omitFieldNames ? '' : 'myselfItem',
        subBuilder: TopFlowPersonalRankItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TopFlowPersonalRankData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TopFlowPersonalRankData copyWith(
          void Function(TopFlowPersonalRankData) updates) =>
      super.copyWith((message) => updates(message as TopFlowPersonalRankData))
          as TopFlowPersonalRankData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TopFlowPersonalRankData create() => TopFlowPersonalRankData._();
  @$core.override
  TopFlowPersonalRankData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TopFlowPersonalRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TopFlowPersonalRankData>(create);
  static TopFlowPersonalRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TopFlowPersonalRankItem> get item => $_getList(0);

  @$pb.TagNumber(2)
  TopFlowPersonalRankItem get myselfItem => $_getN(1);
  @$pb.TagNumber(2)
  set myselfItem(TopFlowPersonalRankItem value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMyselfItem() => $_has(1);
  @$pb.TagNumber(2)
  void clearMyselfItem() => $_clearField(2);
  @$pb.TagNumber(2)
  TopFlowPersonalRankItem ensureMyselfItem() => $_ensure(1);
}

class TopFlowPersonalRankItem extends $pb.GeneratedMessage {
  factory TopFlowPersonalRankItem({
    $fixnum.Int64? uid,
    $core.String? nickName,
    $core.String? gender,
    $core.int? age,
    $core.String? avatar,
    $fixnum.Int64? groupId,
    $core.String? groupName,
    $fixnum.Int64? totalScore,
    $fixnum.Int64? newRegisterScore,
    $fixnum.Int64? over100Score,
    $fixnum.Int64? over1000Score,
    $core.int? rank,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (nickName != null) result.nickName = nickName;
    if (gender != null) result.gender = gender;
    if (age != null) result.age = age;
    if (avatar != null) result.avatar = avatar;
    if (groupId != null) result.groupId = groupId;
    if (groupName != null) result.groupName = groupName;
    if (totalScore != null) result.totalScore = totalScore;
    if (newRegisterScore != null) result.newRegisterScore = newRegisterScore;
    if (over100Score != null) result.over100Score = over100Score;
    if (over1000Score != null) result.over1000Score = over1000Score;
    if (rank != null) result.rank = rank;
    return result;
  }

  TopFlowPersonalRankItem._();

  factory TopFlowPersonalRankItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TopFlowPersonalRankItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TopFlowPersonalRankItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'nickName')
    ..aOS(4, _omitFieldNames ? '' : 'gender')
    ..aI(5, _omitFieldNames ? '' : 'age', fieldType: $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'avatar')
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(8, _omitFieldNames ? '' : 'groupName')
    ..a<$fixnum.Int64>(
        9, _omitFieldNames ? '' : 'totalScore', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        10, _omitFieldNames ? '' : 'newRegisterScore', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        11, _omitFieldNames ? '' : 'over100Score', $pb.PbFieldType.OU6,
        protoName: 'over_100_score', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        12, _omitFieldNames ? '' : 'over1000Score', $pb.PbFieldType.OU6,
        protoName: 'over_1000_score', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(13, _omitFieldNames ? '' : 'rank')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TopFlowPersonalRankItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TopFlowPersonalRankItem copyWith(
          void Function(TopFlowPersonalRankItem) updates) =>
      super.copyWith((message) => updates(message as TopFlowPersonalRankItem))
          as TopFlowPersonalRankItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TopFlowPersonalRankItem create() => TopFlowPersonalRankItem._();
  @$core.override
  TopFlowPersonalRankItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TopFlowPersonalRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TopFlowPersonalRankItem>(create);
  static TopFlowPersonalRankItem? _defaultInstance;

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickName => $_getSZ(1);
  @$pb.TagNumber(3)
  set nickName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasNickName() => $_has(1);
  @$pb.TagNumber(3)
  void clearNickName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get gender => $_getSZ(2);
  @$pb.TagNumber(4)
  set gender($core.String value) => $_setString(2, value);
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(2);
  @$pb.TagNumber(4)
  void clearGender() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get age => $_getIZ(3);
  @$pb.TagNumber(5)
  set age($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(5)
  $core.bool hasAge() => $_has(3);
  @$pb.TagNumber(5)
  void clearAge() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get avatar => $_getSZ(4);
  @$pb.TagNumber(6)
  set avatar($core.String value) => $_setString(4, value);
  @$pb.TagNumber(6)
  $core.bool hasAvatar() => $_has(4);
  @$pb.TagNumber(6)
  void clearAvatar() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get groupId => $_getI64(5);
  @$pb.TagNumber(7)
  set groupId($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(7)
  $core.bool hasGroupId() => $_has(5);
  @$pb.TagNumber(7)
  void clearGroupId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get groupName => $_getSZ(6);
  @$pb.TagNumber(8)
  set groupName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(8)
  $core.bool hasGroupName() => $_has(6);
  @$pb.TagNumber(8)
  void clearGroupName() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get totalScore => $_getI64(7);
  @$pb.TagNumber(9)
  set totalScore($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(9)
  $core.bool hasTotalScore() => $_has(7);
  @$pb.TagNumber(9)
  void clearTotalScore() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get newRegisterScore => $_getI64(8);
  @$pb.TagNumber(10)
  set newRegisterScore($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(10)
  $core.bool hasNewRegisterScore() => $_has(8);
  @$pb.TagNumber(10)
  void clearNewRegisterScore() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get over100Score => $_getI64(9);
  @$pb.TagNumber(11)
  set over100Score($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(11)
  $core.bool hasOver100Score() => $_has(9);
  @$pb.TagNumber(11)
  void clearOver100Score() => $_clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get over1000Score => $_getI64(10);
  @$pb.TagNumber(12)
  set over1000Score($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(12)
  $core.bool hasOver1000Score() => $_has(10);
  @$pb.TagNumber(12)
  void clearOver1000Score() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get rank => $_getIZ(11);
  @$pb.TagNumber(13)
  set rank($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(13)
  $core.bool hasRank() => $_has(11);
  @$pb.TagNumber(13)
  void clearRank() => $_clearField(13);
}

class ApplyListData extends $pb.GeneratedMessage {
  factory ApplyListData({
    $core.Iterable<ApplyListItem>? item,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    return result;
  }

  ApplyListData._();

  factory ApplyListData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ApplyListData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApplyListData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..pPM<ApplyListItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: ApplyListItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApplyListData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApplyListData copyWith(void Function(ApplyListData) updates) =>
      super.copyWith((message) => updates(message as ApplyListData))
          as ApplyListData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApplyListData create() => ApplyListData._();
  @$core.override
  ApplyListData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ApplyListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApplyListData>(create);
  static ApplyListData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ApplyListItem> get item => $_getList(0);
}

class ApplyListItem extends $pb.GeneratedMessage {
  factory ApplyListItem({
    $fixnum.Int64? id,
    $fixnum.Int64? uid,
    $core.String? nickName,
    $core.String? gender,
    $core.int? age,
    $core.String? avatar,
    $core.int? type,
    $fixnum.Int64? dateTime,
    $core.int? status,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (uid != null) result.uid = uid;
    if (nickName != null) result.nickName = nickName;
    if (gender != null) result.gender = gender;
    if (age != null) result.age = age;
    if (avatar != null) result.avatar = avatar;
    if (type != null) result.type = type;
    if (dateTime != null) result.dateTime = dateTime;
    if (status != null) result.status = status;
    return result;
  }

  ApplyListItem._();

  factory ApplyListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ApplyListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApplyListItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'nickName')
    ..aOS(4, _omitFieldNames ? '' : 'gender')
    ..aI(5, _omitFieldNames ? '' : 'age', fieldType: $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'avatar')
    ..aI(7, _omitFieldNames ? '' : 'type', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'dateTime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(9, _omitFieldNames ? '' : 'status', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApplyListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApplyListItem copyWith(void Function(ApplyListItem) updates) =>
      super.copyWith((message) => updates(message as ApplyListItem))
          as ApplyListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApplyListItem create() => ApplyListItem._();
  @$core.override
  ApplyListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ApplyListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApplyListItem>(create);
  static ApplyListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickName => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickName() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickName() => $_clearField(3);

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
  $core.String get avatar => $_getSZ(5);
  @$pb.TagNumber(6)
  set avatar($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAvatar() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvatar() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get type => $_getIZ(6);
  @$pb.TagNumber(7)
  set type($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get dateTime => $_getI64(7);
  @$pb.TagNumber(8)
  set dateTime($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDateTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearDateTime() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get status => $_getIZ(8);
  @$pb.TagNumber(9)
  set status($core.int value) => $_setUnsignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearStatus() => $_clearField(9);
}

class ApproveApplyReq extends $pb.GeneratedMessage {
  factory ApproveApplyReq({
    $core.int? type,
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (id != null) result.id = id;
    return result;
  }

  ApproveApplyReq._();

  factory ApproveApplyReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ApproveApplyReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApproveApplyReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'type', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApproveApplyReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApproveApplyReq copyWith(void Function(ApproveApplyReq) updates) =>
      super.copyWith((message) => updates(message as ApproveApplyReq))
          as ApproveApplyReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApproveApplyReq create() => ApproveApplyReq._();
  @$core.override
  ApproveApplyReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ApproveApplyReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApproveApplyReq>(create);
  static ApproveApplyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);
}

class SubmitApplyReq extends $pb.GeneratedMessage {
  factory SubmitApplyReq({
    $core.int? type,
    $fixnum.Int64? groupId,
    $core.int? coin,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (groupId != null) result.groupId = groupId;
    if (coin != null) result.coin = coin;
    return result;
  }

  SubmitApplyReq._();

  factory SubmitApplyReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitApplyReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitApplyReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'type', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(4, _omitFieldNames ? '' : 'coin', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitApplyReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitApplyReq copyWith(void Function(SubmitApplyReq) updates) =>
      super.copyWith((message) => updates(message as SubmitApplyReq))
          as SubmitApplyReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitApplyReq create() => SubmitApplyReq._();
  @$core.override
  SubmitApplyReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitApplyReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitApplyReq>(create);
  static SubmitApplyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get groupId => $_getI64(1);
  @$pb.TagNumber(2)
  set groupId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupId() => $_clearField(2);

  @$pb.TagNumber(4)
  $core.int get coin => $_getIZ(2);
  @$pb.TagNumber(4)
  set coin($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(4)
  $core.bool hasCoin() => $_has(2);
  @$pb.TagNumber(4)
  void clearCoin() => $_clearField(4);
}

class GroupListData extends $pb.GeneratedMessage {
  factory GroupListData({
    $core.Iterable<GroupListItem>? item,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    return result;
  }

  GroupListData._();

  factory GroupListData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupListData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupListData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..pPM<GroupListItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: GroupListItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupListData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupListData copyWith(void Function(GroupListData) updates) =>
      super.copyWith((message) => updates(message as GroupListData))
          as GroupListData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupListData create() => GroupListData._();
  @$core.override
  GroupListData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupListData>(create);
  static GroupListData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GroupListItem> get item => $_getList(0);
}

class GroupListItem extends $pb.GeneratedMessage {
  factory GroupListItem({
    $fixnum.Int64? id,
    $core.String? name,
    $fixnum.Int64? leaderId,
    $core.String? leaderNickName,
    $core.String? inviteCode,
    $core.String? leaderHeadImage,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (leaderId != null) result.leaderId = leaderId;
    if (leaderNickName != null) result.leaderNickName = leaderNickName;
    if (inviteCode != null) result.inviteCode = inviteCode;
    if (leaderHeadImage != null) result.leaderHeadImage = leaderHeadImage;
    return result;
  }

  GroupListItem._();

  factory GroupListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupListItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'leaderId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'leaderNickName')
    ..aOS(5, _omitFieldNames ? '' : 'inviteCode')
    ..aOS(6, _omitFieldNames ? '' : 'leaderHeadImage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupListItem copyWith(void Function(GroupListItem) updates) =>
      super.copyWith((message) => updates(message as GroupListItem))
          as GroupListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupListItem create() => GroupListItem._();
  @$core.override
  GroupListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupListItem>(create);
  static GroupListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get leaderId => $_getI64(2);
  @$pb.TagNumber(3)
  set leaderId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLeaderId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeaderId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get leaderNickName => $_getSZ(3);
  @$pb.TagNumber(4)
  set leaderNickName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLeaderNickName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeaderNickName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get inviteCode => $_getSZ(4);
  @$pb.TagNumber(5)
  set inviteCode($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasInviteCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearInviteCode() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get leaderHeadImage => $_getSZ(5);
  @$pb.TagNumber(6)
  set leaderHeadImage($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLeaderHeadImage() => $_has(5);
  @$pb.TagNumber(6)
  void clearLeaderHeadImage() => $_clearField(6);
}

class MyGroupRsp extends $pb.GeneratedMessage {
  factory MyGroupRsp({
    GsGroup? group,
    $0.SimpleUser? manager,
    @$core.Deprecated('This field is deprecated.') $0.SimpleUser? agent,
    $core.String? wechatNo,
    $core.String? phoneNo,
    $core.String? contractUrl,
    @$core.Deprecated('This field is deprecated.')
    $core.Iterable<$core.String>? role,
    $core.String? inviteCode,
    $core.int? memberNum,
    $core.int? appliedNum,
    $core.bool? isLeader,
    $0.SimpleUser? handler,
    $core.String? groupRole,
  }) {
    final result = create();
    if (group != null) result.group = group;
    if (manager != null) result.manager = manager;
    if (agent != null) result.agent = agent;
    if (wechatNo != null) result.wechatNo = wechatNo;
    if (phoneNo != null) result.phoneNo = phoneNo;
    if (contractUrl != null) result.contractUrl = contractUrl;
    if (role != null) result.role.addAll(role);
    if (inviteCode != null) result.inviteCode = inviteCode;
    if (memberNum != null) result.memberNum = memberNum;
    if (appliedNum != null) result.appliedNum = appliedNum;
    if (isLeader != null) result.isLeader = isLeader;
    if (handler != null) result.handler = handler;
    if (groupRole != null) result.groupRole = groupRole;
    return result;
  }

  MyGroupRsp._();

  factory MyGroupRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MyGroupRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MyGroupRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..aOM<GsGroup>(1, _omitFieldNames ? '' : 'group',
        subBuilder: GsGroup.create)
    ..aOM<$0.SimpleUser>(2, _omitFieldNames ? '' : 'manager',
        subBuilder: $0.SimpleUser.create)
    ..aOM<$0.SimpleUser>(3, _omitFieldNames ? '' : 'agent',
        subBuilder: $0.SimpleUser.create)
    ..aOS(4, _omitFieldNames ? '' : 'wechatNo')
    ..aOS(5, _omitFieldNames ? '' : 'phoneNo')
    ..aOS(6, _omitFieldNames ? '' : 'contractUrl')
    ..pPS(7, _omitFieldNames ? '' : 'role')
    ..aOS(8, _omitFieldNames ? '' : 'inviteCode')
    ..aI(9, _omitFieldNames ? '' : 'memberNum', fieldType: $pb.PbFieldType.OU3)
    ..aI(10, _omitFieldNames ? '' : 'appliedNum',
        fieldType: $pb.PbFieldType.OU3)
    ..aOB(11, _omitFieldNames ? '' : 'isLeader')
    ..aOM<$0.SimpleUser>(12, _omitFieldNames ? '' : 'handler',
        subBuilder: $0.SimpleUser.create)
    ..aOS(13, _omitFieldNames ? '' : 'groupRole')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MyGroupRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MyGroupRsp copyWith(void Function(MyGroupRsp) updates) =>
      super.copyWith((message) => updates(message as MyGroupRsp)) as MyGroupRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MyGroupRsp create() => MyGroupRsp._();
  @$core.override
  MyGroupRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MyGroupRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MyGroupRsp>(create);
  static MyGroupRsp? _defaultInstance;

  @$pb.TagNumber(1)
  GsGroup get group => $_getN(0);
  @$pb.TagNumber(1)
  set group(GsGroup value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroup() => $_clearField(1);
  @$pb.TagNumber(1)
  GsGroup ensureGroup() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.SimpleUser get manager => $_getN(1);
  @$pb.TagNumber(2)
  set manager($0.SimpleUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasManager() => $_has(1);
  @$pb.TagNumber(2)
  void clearManager() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.SimpleUser ensureManager() => $_ensure(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $0.SimpleUser get agent => $_getN(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  set agent($0.SimpleUser value) => $_setField(3, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $core.bool hasAgent() => $_has(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  void clearAgent() => $_clearField(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(3)
  $0.SimpleUser ensureAgent() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get wechatNo => $_getSZ(3);
  @$pb.TagNumber(4)
  set wechatNo($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWechatNo() => $_has(3);
  @$pb.TagNumber(4)
  void clearWechatNo() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get phoneNo => $_getSZ(4);
  @$pb.TagNumber(5)
  set phoneNo($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPhoneNo() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhoneNo() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get contractUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set contractUrl($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasContractUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearContractUrl() => $_clearField(6);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get role => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get inviteCode => $_getSZ(7);
  @$pb.TagNumber(8)
  set inviteCode($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasInviteCode() => $_has(7);
  @$pb.TagNumber(8)
  void clearInviteCode() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get memberNum => $_getIZ(8);
  @$pb.TagNumber(9)
  set memberNum($core.int value) => $_setUnsignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasMemberNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearMemberNum() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get appliedNum => $_getIZ(9);
  @$pb.TagNumber(10)
  set appliedNum($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasAppliedNum() => $_has(9);
  @$pb.TagNumber(10)
  void clearAppliedNum() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isLeader => $_getBF(10);
  @$pb.TagNumber(11)
  set isLeader($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasIsLeader() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsLeader() => $_clearField(11);

  @$pb.TagNumber(12)
  $0.SimpleUser get handler => $_getN(11);
  @$pb.TagNumber(12)
  set handler($0.SimpleUser value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasHandler() => $_has(11);
  @$pb.TagNumber(12)
  void clearHandler() => $_clearField(12);
  @$pb.TagNumber(12)
  $0.SimpleUser ensureHandler() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.String get groupRole => $_getSZ(12);
  @$pb.TagNumber(13)
  set groupRole($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasGroupRole() => $_has(12);
  @$pb.TagNumber(13)
  void clearGroupRole() => $_clearField(13);
}

class GsGroup extends $pb.GeneratedMessage {
  factory GsGroup({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? inviteCode,
    $core.String? bizType,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (inviteCode != null) result.inviteCode = inviteCode;
    if (bizType != null) result.bizType = bizType;
    return result;
  }

  GsGroup._();

  factory GsGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'inviteCode')
    ..aOS(4, _omitFieldNames ? '' : 'bizType', protoName: 'bizType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsGroup copyWith(void Function(GsGroup) updates) =>
      super.copyWith((message) => updates(message as GsGroup)) as GsGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsGroup create() => GsGroup._();
  @$core.override
  GsGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsGroup getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GsGroup>(create);
  static GsGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get inviteCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set inviteCode($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasInviteCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearInviteCode() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get bizType => $_getSZ(3);
  @$pb.TagNumber(4)
  set bizType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBizType() => $_has(3);
  @$pb.TagNumber(4)
  void clearBizType() => $_clearField(4);
}

class LicenseApplyReq extends $pb.GeneratedMessage {
  factory LicenseApplyReq({
    $core.int? type,
    $core.String? reason,
    $core.Iterable<$core.String>? pics,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (reason != null) result.reason = reason;
    if (pics != null) result.pics.addAll(pics);
    return result;
  }

  LicenseApplyReq._();

  factory LicenseApplyReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LicenseApplyReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LicenseApplyReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'type')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..pPS(3, _omitFieldNames ? '' : 'pics')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LicenseApplyReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LicenseApplyReq copyWith(void Function(LicenseApplyReq) updates) =>
      super.copyWith((message) => updates(message as LicenseApplyReq))
          as LicenseApplyReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LicenseApplyReq create() => LicenseApplyReq._();
  @$core.override
  LicenseApplyReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LicenseApplyReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LicenseApplyReq>(create);
  static LicenseApplyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get pics => $_getList(2);
}

class TransferGroupApplyReq extends $pb.GeneratedMessage {
  factory TransferGroupApplyReq({
    $fixnum.Int64? originGroupId,
    $fixnum.Int64? newGroupId,
    $core.int? defaultPlan,
    $core.String? reason,
    $core.Iterable<$core.String>? pics,
  }) {
    final result = create();
    if (originGroupId != null) result.originGroupId = originGroupId;
    if (newGroupId != null) result.newGroupId = newGroupId;
    if (defaultPlan != null) result.defaultPlan = defaultPlan;
    if (reason != null) result.reason = reason;
    if (pics != null) result.pics.addAll(pics);
    return result;
  }

  TransferGroupApplyReq._();

  factory TransferGroupApplyReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TransferGroupApplyReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TransferGroupApplyReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'originGroupId')
    ..aInt64(2, _omitFieldNames ? '' : 'newGroupId')
    ..aI(3, _omitFieldNames ? '' : 'defaultPlan')
    ..aOS(4, _omitFieldNames ? '' : 'reason')
    ..pPS(5, _omitFieldNames ? '' : 'pics')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferGroupApplyReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TransferGroupApplyReq copyWith(
          void Function(TransferGroupApplyReq) updates) =>
      super.copyWith((message) => updates(message as TransferGroupApplyReq))
          as TransferGroupApplyReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferGroupApplyReq create() => TransferGroupApplyReq._();
  @$core.override
  TransferGroupApplyReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TransferGroupApplyReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferGroupApplyReq>(create);
  static TransferGroupApplyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get originGroupId => $_getI64(0);
  @$pb.TagNumber(1)
  set originGroupId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOriginGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOriginGroupId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get newGroupId => $_getI64(1);
  @$pb.TagNumber(2)
  set newGroupId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNewGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewGroupId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get defaultPlan => $_getIZ(2);
  @$pb.TagNumber(3)
  set defaultPlan($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDefaultPlan() => $_has(2);
  @$pb.TagNumber(3)
  void clearDefaultPlan() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get reason => $_getSZ(3);
  @$pb.TagNumber(4)
  set reason($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReason() => $_has(3);
  @$pb.TagNumber(4)
  void clearReason() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get pics => $_getList(4);
}

class ChangeManagerApplyReq extends $pb.GeneratedMessage {
  factory ChangeManagerApplyReq({
    $fixnum.Int64? originManagerId,
    $fixnum.Int64? newManagerId,
    $core.String? reason,
    $core.Iterable<$core.String>? pics,
  }) {
    final result = create();
    if (originManagerId != null) result.originManagerId = originManagerId;
    if (newManagerId != null) result.newManagerId = newManagerId;
    if (reason != null) result.reason = reason;
    if (pics != null) result.pics.addAll(pics);
    return result;
  }

  ChangeManagerApplyReq._();

  factory ChangeManagerApplyReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChangeManagerApplyReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChangeManagerApplyReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'originManagerId')
    ..aInt64(2, _omitFieldNames ? '' : 'newManagerId')
    ..aOS(3, _omitFieldNames ? '' : 'reason')
    ..pPS(4, _omitFieldNames ? '' : 'pics')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangeManagerApplyReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangeManagerApplyReq copyWith(
          void Function(ChangeManagerApplyReq) updates) =>
      super.copyWith((message) => updates(message as ChangeManagerApplyReq))
          as ChangeManagerApplyReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeManagerApplyReq create() => ChangeManagerApplyReq._();
  @$core.override
  ChangeManagerApplyReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChangeManagerApplyReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChangeManagerApplyReq>(create);
  static ChangeManagerApplyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get originManagerId => $_getI64(0);
  @$pb.TagNumber(1)
  set originManagerId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOriginManagerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOriginManagerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get newManagerId => $_getI64(1);
  @$pb.TagNumber(2)
  set newManagerId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNewManagerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewManagerId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get reason => $_getSZ(2);
  @$pb.TagNumber(3)
  set reason($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get pics => $_getList(3);
}

class AdviceReq extends $pb.GeneratedMessage {
  factory AdviceReq({
    $core.int? type,
    $core.String? desc,
    $core.Iterable<$core.String>? pics,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (desc != null) result.desc = desc;
    if (pics != null) result.pics.addAll(pics);
    return result;
  }

  AdviceReq._();

  factory AdviceReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AdviceReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AdviceReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'type')
    ..aOS(2, _omitFieldNames ? '' : 'desc')
    ..pPS(3, _omitFieldNames ? '' : 'pics')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AdviceReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AdviceReq copyWith(void Function(AdviceReq) updates) =>
      super.copyWith((message) => updates(message as AdviceReq)) as AdviceReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdviceReq create() => AdviceReq._();
  @$core.override
  AdviceReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AdviceReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdviceReq>(create);
  static AdviceReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get pics => $_getList(2);
}

class CreateGroupReq extends $pb.GeneratedMessage {
  factory CreateGroupReq({
    $core.String? groupName,
    $core.String? superAdminAccount,
    $core.String? superAdminPassword,
  }) {
    final result = create();
    if (groupName != null) result.groupName = groupName;
    if (superAdminAccount != null) result.superAdminAccount = superAdminAccount;
    if (superAdminPassword != null)
      result.superAdminPassword = superAdminPassword;
    return result;
  }

  CreateGroupReq._();

  factory CreateGroupReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateGroupReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateGroupReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'groupName')
    ..aOS(2, _omitFieldNames ? '' : 'superAdminAccount')
    ..aOS(3, _omitFieldNames ? '' : 'superAdminPassword')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGroupReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGroupReq copyWith(void Function(CreateGroupReq) updates) =>
      super.copyWith((message) => updates(message as CreateGroupReq))
          as CreateGroupReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateGroupReq create() => CreateGroupReq._();
  @$core.override
  CreateGroupReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateGroupReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateGroupReq>(create);
  static CreateGroupReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupName => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get superAdminAccount => $_getSZ(1);
  @$pb.TagNumber(2)
  set superAdminAccount($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSuperAdminAccount() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuperAdminAccount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get superAdminPassword => $_getSZ(2);
  @$pb.TagNumber(3)
  set superAdminPassword($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSuperAdminPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuperAdminPassword() => $_clearField(3);
}

class GroupAddMemberReq extends $pb.GeneratedMessage {
  factory GroupAddMemberReq({
    $fixnum.Int64? groupId,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    return result;
  }

  GroupAddMemberReq._();

  factory GroupAddMemberReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupAddMemberReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupAddMemberReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'groupId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupAddMemberReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupAddMemberReq copyWith(void Function(GroupAddMemberReq) updates) =>
      super.copyWith((message) => updates(message as GroupAddMemberReq))
          as GroupAddMemberReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupAddMemberReq create() => GroupAddMemberReq._();
  @$core.override
  GroupAddMemberReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupAddMemberReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupAddMemberReq>(create);
  static GroupAddMemberReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);
}

class GroupListRsp extends $pb.GeneratedMessage {
  factory GroupListRsp({
    $core.Iterable<GroupItem>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  GroupListRsp._();

  factory GroupListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..pPM<GroupItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: GroupItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupListRsp copyWith(void Function(GroupListRsp) updates) =>
      super.copyWith((message) => updates(message as GroupListRsp))
          as GroupListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupListRsp create() => GroupListRsp._();
  @$core.override
  GroupListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupListRsp>(create);
  static GroupListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GroupItem> get list => $_getList(0);
}

class GroupItem extends $pb.GeneratedMessage {
  factory GroupItem({
    $fixnum.Int64? groupId,
    $core.String? groupName,
    $core.String? superAdminAccount,
    $core.String? superAdminPassword,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    if (groupName != null) result.groupName = groupName;
    if (superAdminAccount != null) result.superAdminAccount = superAdminAccount;
    if (superAdminPassword != null)
      result.superAdminPassword = superAdminPassword;
    return result;
  }

  GroupItem._();

  factory GroupItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_group'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'groupId')
    ..aOS(2, _omitFieldNames ? '' : 'groupName')
    ..aOS(3, _omitFieldNames ? '' : 'superAdminAccount')
    ..aOS(4, _omitFieldNames ? '' : 'superAdminPassword')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupItem copyWith(void Function(GroupItem) updates) =>
      super.copyWith((message) => updates(message as GroupItem)) as GroupItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupItem create() => GroupItem._();
  @$core.override
  GroupItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GroupItem>(create);
  static GroupItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get superAdminAccount => $_getSZ(2);
  @$pb.TagNumber(3)
  set superAdminAccount($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSuperAdminAccount() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuperAdminAccount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get superAdminPassword => $_getSZ(3);
  @$pb.TagNumber(4)
  set superAdminPassword($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSuperAdminPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearSuperAdminPassword() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

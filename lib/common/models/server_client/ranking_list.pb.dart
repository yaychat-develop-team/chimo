// This is a generated file - do not edit.
//
// Generated from server_client/ranking_list.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'base.pb.dart' as $0;
import 'cash.pb.dart' as $3;
import 'common/car.pbenum.dart' as $4;
import 'ranking_list.pbenum.dart';
import 'sud.pb.dart' as $2;
import 'user.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'ranking_list.pbenum.dart';

class RankingListItem extends $pb.GeneratedMessage {
  factory RankingListItem({
    $core.String? avatar,
    $core.String? nickname,
    $fixnum.Int64? age,
    $0.UserVipLevelIcons? vipIcons,
    $4.CarLevel? carLevel,
    $fixnum.Int64? contribution,
    $1.ChannelInfo? currentChannel,
    $fixnum.Int64? userId,
    $fixnum.Int64? contributionDiff,
    $core.String? gender,
    $core.String? job,
    $core.String? knightIcon,
    $2.GameItemInfo? gameInfo,
    $core.int? itemCount,
    $core.String? itemName,
    $core.String? itemIcon,
  }) {
    final result = create();
    if (avatar != null) result.avatar = avatar;
    if (nickname != null) result.nickname = nickname;
    if (age != null) result.age = age;
    if (vipIcons != null) result.vipIcons = vipIcons;
    if (carLevel != null) result.carLevel = carLevel;
    if (contribution != null) result.contribution = contribution;
    if (currentChannel != null) result.currentChannel = currentChannel;
    if (userId != null) result.userId = userId;
    if (contributionDiff != null) result.contributionDiff = contributionDiff;
    if (gender != null) result.gender = gender;
    if (job != null) result.job = job;
    if (knightIcon != null) result.knightIcon = knightIcon;
    if (gameInfo != null) result.gameInfo = gameInfo;
    if (itemCount != null) result.itemCount = itemCount;
    if (itemName != null) result.itemName = itemName;
    if (itemIcon != null) result.itemIcon = itemIcon;
    return result;
  }

  RankingListItem._();

  factory RankingListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RankingListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RankingListItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'avatar')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aInt64(3, _omitFieldNames ? '' : 'age')
    ..aOM<$0.UserVipLevelIcons>(4, _omitFieldNames ? '' : 'vipIcons',
        subBuilder: $0.UserVipLevelIcons.create)
    ..aE<$4.CarLevel>(5, _omitFieldNames ? '' : 'carLevel',
        enumValues: $4.CarLevel.values)
    ..aInt64(6, _omitFieldNames ? '' : 'contribution')
    ..aOM<$1.ChannelInfo>(7, _omitFieldNames ? '' : 'currentChannel',
        subBuilder: $1.ChannelInfo.create)
    ..aInt64(8, _omitFieldNames ? '' : 'userId')
    ..aInt64(9, _omitFieldNames ? '' : 'contributionDiff')
    ..aOS(10, _omitFieldNames ? '' : 'gender')
    ..aOS(11, _omitFieldNames ? '' : 'job')
    ..aOS(12, _omitFieldNames ? '' : 'knightIcon')
    ..aOM<$2.GameItemInfo>(13, _omitFieldNames ? '' : 'gameInfo',
        subBuilder: $2.GameItemInfo.create)
    ..aI(14, _omitFieldNames ? '' : 'itemCount')
    ..aOS(15, _omitFieldNames ? '' : 'itemName')
    ..aOS(16, _omitFieldNames ? '' : 'itemIcon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RankingListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RankingListItem copyWith(void Function(RankingListItem) updates) =>
      super.copyWith((message) => updates(message as RankingListItem))
          as RankingListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RankingListItem create() => RankingListItem._();
  @$core.override
  RankingListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RankingListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RankingListItem>(create);
  static RankingListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get avatar => $_getSZ(0);
  @$pb.TagNumber(1)
  set avatar($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAvatar() => $_has(0);
  @$pb.TagNumber(1)
  void clearAvatar() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get age => $_getI64(2);
  @$pb.TagNumber(3)
  set age($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearAge() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.UserVipLevelIcons get vipIcons => $_getN(3);
  @$pb.TagNumber(4)
  set vipIcons($0.UserVipLevelIcons value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasVipIcons() => $_has(3);
  @$pb.TagNumber(4)
  void clearVipIcons() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.UserVipLevelIcons ensureVipIcons() => $_ensure(3);

  @$pb.TagNumber(5)
  $4.CarLevel get carLevel => $_getN(4);
  @$pb.TagNumber(5)
  set carLevel($4.CarLevel value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCarLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearCarLevel() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get contribution => $_getI64(5);
  @$pb.TagNumber(6)
  set contribution($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasContribution() => $_has(5);
  @$pb.TagNumber(6)
  void clearContribution() => $_clearField(6);

  @$pb.TagNumber(7)
  $1.ChannelInfo get currentChannel => $_getN(6);
  @$pb.TagNumber(7)
  set currentChannel($1.ChannelInfo value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasCurrentChannel() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurrentChannel() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.ChannelInfo ensureCurrentChannel() => $_ensure(6);

  @$pb.TagNumber(8)
  $fixnum.Int64 get userId => $_getI64(7);
  @$pb.TagNumber(8)
  set userId($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasUserId() => $_has(7);
  @$pb.TagNumber(8)
  void clearUserId() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get contributionDiff => $_getI64(8);
  @$pb.TagNumber(9)
  set contributionDiff($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasContributionDiff() => $_has(8);
  @$pb.TagNumber(9)
  void clearContributionDiff() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get gender => $_getSZ(9);
  @$pb.TagNumber(10)
  set gender($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasGender() => $_has(9);
  @$pb.TagNumber(10)
  void clearGender() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get job => $_getSZ(10);
  @$pb.TagNumber(11)
  set job($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasJob() => $_has(10);
  @$pb.TagNumber(11)
  void clearJob() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get knightIcon => $_getSZ(11);
  @$pb.TagNumber(12)
  set knightIcon($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasKnightIcon() => $_has(11);
  @$pb.TagNumber(12)
  void clearKnightIcon() => $_clearField(12);

  @$pb.TagNumber(13)
  $2.GameItemInfo get gameInfo => $_getN(12);
  @$pb.TagNumber(13)
  set gameInfo($2.GameItemInfo value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasGameInfo() => $_has(12);
  @$pb.TagNumber(13)
  void clearGameInfo() => $_clearField(13);
  @$pb.TagNumber(13)
  $2.GameItemInfo ensureGameInfo() => $_ensure(12);

  @$pb.TagNumber(14)
  $core.int get itemCount => $_getIZ(13);
  @$pb.TagNumber(14)
  set itemCount($core.int value) => $_setSignedInt32(13, value);
  @$pb.TagNumber(14)
  $core.bool hasItemCount() => $_has(13);
  @$pb.TagNumber(14)
  void clearItemCount() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get itemName => $_getSZ(14);
  @$pb.TagNumber(15)
  set itemName($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasItemName() => $_has(14);
  @$pb.TagNumber(15)
  void clearItemName() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get itemIcon => $_getSZ(15);
  @$pb.TagNumber(16)
  set itemIcon($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasItemIcon() => $_has(15);
  @$pb.TagNumber(16)
  void clearItemIcon() => $_clearField(16);
}

class GetRankingListResp extends $pb.GeneratedMessage {
  factory GetRankingListResp({
    $core.Iterable<RankingListItem>? items,
    $core.bool? hasMore,
    RankingListItem? currentItem,
    $fixnum.Int64? rank,
    $fixnum.Int64? contributionDiff,
    $core.bool? isOnRank,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    if (hasMore != null) result.hasMore = hasMore;
    if (currentItem != null) result.currentItem = currentItem;
    if (rank != null) result.rank = rank;
    if (contributionDiff != null) result.contributionDiff = contributionDiff;
    if (isOnRank != null) result.isOnRank = isOnRank;
    return result;
  }

  GetRankingListResp._();

  factory GetRankingListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRankingListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRankingListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..pPM<RankingListItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: RankingListItem.create)
    ..aOB(2, _omitFieldNames ? '' : 'hasMore')
    ..aOM<RankingListItem>(3, _omitFieldNames ? '' : 'currentItem',
        subBuilder: RankingListItem.create)
    ..aInt64(4, _omitFieldNames ? '' : 'rank')
    ..aInt64(5, _omitFieldNames ? '' : 'contributionDiff')
    ..aOB(6, _omitFieldNames ? '' : 'isOnRank')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRankingListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRankingListResp copyWith(void Function(GetRankingListResp) updates) =>
      super.copyWith((message) => updates(message as GetRankingListResp))
          as GetRankingListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRankingListResp create() => GetRankingListResp._();
  @$core.override
  GetRankingListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetRankingListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRankingListResp>(create);
  static GetRankingListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RankingListItem> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get hasMore => $_getBF(1);
  @$pb.TagNumber(2)
  set hasMore($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasMore() => $_clearField(2);

  @$pb.TagNumber(3)
  RankingListItem get currentItem => $_getN(2);
  @$pb.TagNumber(3)
  set currentItem(RankingListItem value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCurrentItem() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentItem() => $_clearField(3);
  @$pb.TagNumber(3)
  RankingListItem ensureCurrentItem() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get rank => $_getI64(3);
  @$pb.TagNumber(4)
  set rank($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearRank() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get contributionDiff => $_getI64(4);
  @$pb.TagNumber(5)
  set contributionDiff($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasContributionDiff() => $_has(4);
  @$pb.TagNumber(5)
  void clearContributionDiff() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isOnRank => $_getBF(5);
  @$pb.TagNumber(6)
  set isOnRank($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsOnRank() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsOnRank() => $_clearField(6);
}

class GetUserRankingListStatusResp extends $pb.GeneratedMessage {
  factory GetUserRankingListStatusResp({
    RankingListItem? item,
    $fixnum.Int64? rank,
    $fixnum.Int64? contributionDiff,
    $core.bool? isOnRank,
  }) {
    final result = create();
    if (item != null) result.item = item;
    if (rank != null) result.rank = rank;
    if (contributionDiff != null) result.contributionDiff = contributionDiff;
    if (isOnRank != null) result.isOnRank = isOnRank;
    return result;
  }

  GetUserRankingListStatusResp._();

  factory GetUserRankingListStatusResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUserRankingListStatusResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUserRankingListStatusResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..aOM<RankingListItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: RankingListItem.create)
    ..aInt64(2, _omitFieldNames ? '' : 'rank')
    ..aInt64(3, _omitFieldNames ? '' : 'contributionDiff')
    ..aOB(4, _omitFieldNames ? '' : 'isOnRank')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserRankingListStatusResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserRankingListStatusResp copyWith(
          void Function(GetUserRankingListStatusResp) updates) =>
      super.copyWith(
              (message) => updates(message as GetUserRankingListStatusResp))
          as GetUserRankingListStatusResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserRankingListStatusResp create() =>
      GetUserRankingListStatusResp._();
  @$core.override
  GetUserRankingListStatusResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUserRankingListStatusResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUserRankingListStatusResp>(create);
  static GetUserRankingListStatusResp? _defaultInstance;

  @$pb.TagNumber(1)
  RankingListItem get item => $_getN(0);
  @$pb.TagNumber(1)
  set item(RankingListItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearItem() => $_clearField(1);
  @$pb.TagNumber(1)
  RankingListItem ensureItem() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get rank => $_getI64(1);
  @$pb.TagNumber(2)
  set rank($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearRank() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get contributionDiff => $_getI64(2);
  @$pb.TagNumber(3)
  set contributionDiff($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContributionDiff() => $_has(2);
  @$pb.TagNumber(3)
  void clearContributionDiff() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isOnRank => $_getBF(3);
  @$pb.TagNumber(4)
  set isOnRank($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsOnRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsOnRank() => $_clearField(4);
}

class TrueLoveRankListItem extends $pb.GeneratedMessage {
  factory TrueLoveRankListItem({
    $1.SimpleUser? sender,
    $1.SimpleUser? receiver,
    $fixnum.Int64? coin,
    $fixnum.Int64? createTime,
    $3.ItemInfo? itemInfo,
    $fixnum.Int64? channelId,
    $core.String? channelName,
    $core.String? boxIcon,
    $core.int? count,
  }) {
    final result = create();
    if (sender != null) result.sender = sender;
    if (receiver != null) result.receiver = receiver;
    if (coin != null) result.coin = coin;
    if (createTime != null) result.createTime = createTime;
    if (itemInfo != null) result.itemInfo = itemInfo;
    if (channelId != null) result.channelId = channelId;
    if (channelName != null) result.channelName = channelName;
    if (boxIcon != null) result.boxIcon = boxIcon;
    if (count != null) result.count = count;
    return result;
  }

  TrueLoveRankListItem._();

  factory TrueLoveRankListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrueLoveRankListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrueLoveRankListItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..aOM<$1.SimpleUser>(1, _omitFieldNames ? '' : 'sender',
        subBuilder: $1.SimpleUser.create)
    ..aOM<$1.SimpleUser>(2, _omitFieldNames ? '' : 'receiver',
        subBuilder: $1.SimpleUser.create)
    ..aInt64(3, _omitFieldNames ? '' : 'coin')
    ..aInt64(4, _omitFieldNames ? '' : 'createTime')
    ..aOM<$3.ItemInfo>(5, _omitFieldNames ? '' : 'itemInfo',
        subBuilder: $3.ItemInfo.create)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(7, _omitFieldNames ? '' : 'channelName')
    ..aOS(8, _omitFieldNames ? '' : 'boxIcon')
    ..aI(9, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrueLoveRankListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrueLoveRankListItem copyWith(void Function(TrueLoveRankListItem) updates) =>
      super.copyWith((message) => updates(message as TrueLoveRankListItem))
          as TrueLoveRankListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrueLoveRankListItem create() => TrueLoveRankListItem._();
  @$core.override
  TrueLoveRankListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TrueLoveRankListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrueLoveRankListItem>(create);
  static TrueLoveRankListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $1.SimpleUser get sender => $_getN(0);
  @$pb.TagNumber(1)
  set sender($1.SimpleUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.SimpleUser ensureSender() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.SimpleUser get receiver => $_getN(1);
  @$pb.TagNumber(2)
  set receiver($1.SimpleUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasReceiver() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiver() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.SimpleUser ensureReceiver() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get coin => $_getI64(2);
  @$pb.TagNumber(3)
  set coin($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCoin() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoin() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get createTime => $_getI64(3);
  @$pb.TagNumber(4)
  set createTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreateTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreateTime() => $_clearField(4);

  @$pb.TagNumber(5)
  $3.ItemInfo get itemInfo => $_getN(4);
  @$pb.TagNumber(5)
  set itemInfo($3.ItemInfo value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasItemInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearItemInfo() => $_clearField(5);
  @$pb.TagNumber(5)
  $3.ItemInfo ensureItemInfo() => $_ensure(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get channelId => $_getI64(5);
  @$pb.TagNumber(6)
  set channelId($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasChannelId() => $_has(5);
  @$pb.TagNumber(6)
  void clearChannelId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get channelName => $_getSZ(6);
  @$pb.TagNumber(7)
  set channelName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasChannelName() => $_has(6);
  @$pb.TagNumber(7)
  void clearChannelName() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get boxIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set boxIcon($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasBoxIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearBoxIcon() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get count => $_getIZ(8);
  @$pb.TagNumber(9)
  set count($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearCount() => $_clearField(9);
}

class GetTrueLoveRankListResp extends $pb.GeneratedMessage {
  factory GetTrueLoveRankListResp({
    $core.Iterable<TrueLoveRankListItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  GetTrueLoveRankListResp._();

  factory GetTrueLoveRankListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTrueLoveRankListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTrueLoveRankListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..pPM<TrueLoveRankListItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: TrueLoveRankListItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTrueLoveRankListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTrueLoveRankListResp copyWith(
          void Function(GetTrueLoveRankListResp) updates) =>
      super.copyWith((message) => updates(message as GetTrueLoveRankListResp))
          as GetTrueLoveRankListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTrueLoveRankListResp create() => GetTrueLoveRankListResp._();
  @$core.override
  GetTrueLoveRankListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetTrueLoveRankListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTrueLoveRankListResp>(create);
  static GetTrueLoveRankListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TrueLoveRankListItem> get items => $_getList(0);
}

class RoomKickListItem extends $pb.GeneratedMessage {
  factory RoomKickListItem({
    $fixnum.Int64? id,
    $core.String? avatar,
    $core.String? nickname,
    $fixnum.Int64? age,
    $core.String? gender,
    $core.String? desc,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (avatar != null) result.avatar = avatar;
    if (nickname != null) result.nickname = nickname;
    if (age != null) result.age = age;
    if (gender != null) result.gender = gender;
    if (desc != null) result.desc = desc;
    return result;
  }

  RoomKickListItem._();

  factory RoomKickListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomKickListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomKickListItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'avatar')
    ..aOS(3, _omitFieldNames ? '' : 'nickname')
    ..aInt64(4, _omitFieldNames ? '' : 'age')
    ..aOS(5, _omitFieldNames ? '' : 'gender')
    ..aOS(6, _omitFieldNames ? '' : 'desc')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomKickListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomKickListItem copyWith(void Function(RoomKickListItem) updates) =>
      super.copyWith((message) => updates(message as RoomKickListItem))
          as RoomKickListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomKickListItem create() => RoomKickListItem._();
  @$core.override
  RoomKickListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomKickListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomKickListItem>(create);
  static RoomKickListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get avatar => $_getSZ(1);
  @$pb.TagNumber(2)
  set avatar($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAvatar() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvatar() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickname($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickname() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get age => $_getI64(3);
  @$pb.TagNumber(4)
  set age($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAge() => $_has(3);
  @$pb.TagNumber(4)
  void clearAge() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get gender => $_getSZ(4);
  @$pb.TagNumber(5)
  set gender($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGender() => $_has(4);
  @$pb.TagNumber(5)
  void clearGender() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => $_clearField(6);
}

class GetRoomKickListResp extends $pb.GeneratedMessage {
  factory GetRoomKickListResp({
    $core.Iterable<RoomKickListItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  GetRoomKickListResp._();

  factory GetRoomKickListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRoomKickListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRoomKickListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..pPM<RoomKickListItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: RoomKickListItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRoomKickListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRoomKickListResp copyWith(void Function(GetRoomKickListResp) updates) =>
      super.copyWith((message) => updates(message as GetRoomKickListResp))
          as GetRoomKickListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoomKickListResp create() => GetRoomKickListResp._();
  @$core.override
  GetRoomKickListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetRoomKickListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRoomKickListResp>(create);
  static GetRoomKickListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RoomKickListItem> get items => $_getList(0);
}

class ChristmasRankRsp extends $pb.GeneratedMessage {
  factory ChristmasRankRsp({
    $core.Iterable<GiftRankItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ChristmasRankRsp._();

  factory ChristmasRankRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChristmasRankRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChristmasRankRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..pPM<GiftRankItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: GiftRankItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChristmasRankRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChristmasRankRsp copyWith(void Function(ChristmasRankRsp) updates) =>
      super.copyWith((message) => updates(message as ChristmasRankRsp))
          as ChristmasRankRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChristmasRankRsp create() => ChristmasRankRsp._();
  @$core.override
  ChristmasRankRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChristmasRankRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChristmasRankRsp>(create);
  static ChristmasRankRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GiftRankItem> get items => $_getList(0);
}

class GiftRankItem extends $pb.GeneratedMessage {
  factory GiftRankItem({
    $core.Iterable<RankUserItem>? userItem,
    $fixnum.Int64? giftId,
    $core.String? giftIcon,
    $core.String? giftName,
    $fixnum.Int64? giftPrice,
    $1.SimpleUser? myself,
    $core.int? selfGiftCount,
    $core.int? selfRank,
  }) {
    final result = create();
    if (userItem != null) result.userItem.addAll(userItem);
    if (giftId != null) result.giftId = giftId;
    if (giftIcon != null) result.giftIcon = giftIcon;
    if (giftName != null) result.giftName = giftName;
    if (giftPrice != null) result.giftPrice = giftPrice;
    if (myself != null) result.myself = myself;
    if (selfGiftCount != null) result.selfGiftCount = selfGiftCount;
    if (selfRank != null) result.selfRank = selfRank;
    return result;
  }

  GiftRankItem._();

  factory GiftRankItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GiftRankItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GiftRankItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..pPM<RankUserItem>(1, _omitFieldNames ? '' : 'userItem',
        protoName: 'userItem', subBuilder: RankUserItem.create)
    ..aInt64(2, _omitFieldNames ? '' : 'giftId')
    ..aOS(3, _omitFieldNames ? '' : 'giftIcon')
    ..aOS(4, _omitFieldNames ? '' : 'giftName')
    ..aInt64(5, _omitFieldNames ? '' : 'giftPrice')
    ..aOM<$1.SimpleUser>(6, _omitFieldNames ? '' : 'myself',
        subBuilder: $1.SimpleUser.create)
    ..aI(7, _omitFieldNames ? '' : 'selfGiftCount')
    ..aI(8, _omitFieldNames ? '' : 'selfRank')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftRankItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftRankItem copyWith(void Function(GiftRankItem) updates) =>
      super.copyWith((message) => updates(message as GiftRankItem))
          as GiftRankItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GiftRankItem create() => GiftRankItem._();
  @$core.override
  GiftRankItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GiftRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftRankItem>(create);
  static GiftRankItem? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RankUserItem> get userItem => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get giftId => $_getI64(1);
  @$pb.TagNumber(2)
  set giftId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGiftId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get giftIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set giftIcon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGiftIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get giftName => $_getSZ(3);
  @$pb.TagNumber(4)
  set giftName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGiftName() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftName() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get giftPrice => $_getI64(4);
  @$pb.TagNumber(5)
  set giftPrice($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGiftPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftPrice() => $_clearField(5);

  @$pb.TagNumber(6)
  $1.SimpleUser get myself => $_getN(5);
  @$pb.TagNumber(6)
  set myself($1.SimpleUser value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasMyself() => $_has(5);
  @$pb.TagNumber(6)
  void clearMyself() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.SimpleUser ensureMyself() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get selfGiftCount => $_getIZ(6);
  @$pb.TagNumber(7)
  set selfGiftCount($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSelfGiftCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearSelfGiftCount() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get selfRank => $_getIZ(7);
  @$pb.TagNumber(8)
  set selfRank($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSelfRank() => $_has(7);
  @$pb.TagNumber(8)
  void clearSelfRank() => $_clearField(8);
}

class RankUserItem extends $pb.GeneratedMessage {
  factory RankUserItem({
    $1.SimpleUser? user,
    $core.int? giftCount,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (giftCount != null) result.giftCount = giftCount;
    return result;
  }

  RankUserItem._();

  factory RankUserItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RankUserItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RankUserItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..aOM<$1.SimpleUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: $1.SimpleUser.create)
    ..aI(2, _omitFieldNames ? '' : 'giftCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RankUserItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RankUserItem copyWith(void Function(RankUserItem) updates) =>
      super.copyWith((message) => updates(message as RankUserItem))
          as RankUserItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RankUserItem create() => RankUserItem._();
  @$core.override
  RankUserItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RankUserItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RankUserItem>(create);
  static RankUserItem? _defaultInstance;

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
  $core.int get giftCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set giftCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGiftCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftCount() => $_clearField(2);
}

/// 情人节礼物墙
class LoveGiftWallRsp extends $pb.GeneratedMessage {
  factory LoveGiftWallRsp({
    $core.Iterable<GiftWallItem>? giftWallItem,
  }) {
    final result = create();
    if (giftWallItem != null) result.giftWallItem.addAll(giftWallItem);
    return result;
  }

  LoveGiftWallRsp._();

  factory LoveGiftWallRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoveGiftWallRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoveGiftWallRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..pPM<GiftWallItem>(1, _omitFieldNames ? '' : 'giftWallItem',
        protoName: 'giftWallItem', subBuilder: GiftWallItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoveGiftWallRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoveGiftWallRsp copyWith(void Function(LoveGiftWallRsp) updates) =>
      super.copyWith((message) => updates(message as LoveGiftWallRsp))
          as LoveGiftWallRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoveGiftWallRsp create() => LoveGiftWallRsp._();
  @$core.override
  LoveGiftWallRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoveGiftWallRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoveGiftWallRsp>(create);
  static LoveGiftWallRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GiftWallItem> get giftWallItem => $_getList(0);
}

class GiftWallItem extends $pb.GeneratedMessage {
  factory GiftWallItem({
    $fixnum.Int64? giftId,
    $core.String? giftIcon,
    $core.String? giftName,
    $fixnum.Int64? giftPrice,
    $core.bool? lighting,
  }) {
    final result = create();
    if (giftId != null) result.giftId = giftId;
    if (giftIcon != null) result.giftIcon = giftIcon;
    if (giftName != null) result.giftName = giftName;
    if (giftPrice != null) result.giftPrice = giftPrice;
    if (lighting != null) result.lighting = lighting;
    return result;
  }

  GiftWallItem._();

  factory GiftWallItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GiftWallItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GiftWallItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'giftId')
    ..aOS(2, _omitFieldNames ? '' : 'giftIcon')
    ..aOS(3, _omitFieldNames ? '' : 'giftName')
    ..aInt64(4, _omitFieldNames ? '' : 'giftPrice')
    ..aOB(5, _omitFieldNames ? '' : 'lighting')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftWallItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftWallItem copyWith(void Function(GiftWallItem) updates) =>
      super.copyWith((message) => updates(message as GiftWallItem))
          as GiftWallItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GiftWallItem create() => GiftWallItem._();
  @$core.override
  GiftWallItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GiftWallItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallItem>(create);
  static GiftWallItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get giftId => $_getI64(0);
  @$pb.TagNumber(1)
  set giftId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get giftIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set giftIcon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGiftIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftIcon() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get giftName => $_getSZ(2);
  @$pb.TagNumber(3)
  set giftName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGiftName() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftName() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get giftPrice => $_getI64(3);
  @$pb.TagNumber(4)
  set giftPrice($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGiftPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftPrice() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get lighting => $_getBF(4);
  @$pb.TagNumber(5)
  set lighting($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLighting() => $_has(4);
  @$pb.TagNumber(5)
  void clearLighting() => $_clearField(5);
}

/// 情人节榜单
class LoveRankRsp extends $pb.GeneratedMessage {
  factory LoveRankRsp({
    $core.Iterable<LoveRankItem>? loveRankItem,
    $1.SimpleUser? myself,
    $core.int? selfLoveValue,
    $core.int? selfRank,
  }) {
    final result = create();
    if (loveRankItem != null) result.loveRankItem.addAll(loveRankItem);
    if (myself != null) result.myself = myself;
    if (selfLoveValue != null) result.selfLoveValue = selfLoveValue;
    if (selfRank != null) result.selfRank = selfRank;
    return result;
  }

  LoveRankRsp._();

  factory LoveRankRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoveRankRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoveRankRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..pPM<LoveRankItem>(1, _omitFieldNames ? '' : 'loveRankItem',
        protoName: 'loveRankItem', subBuilder: LoveRankItem.create)
    ..aOM<$1.SimpleUser>(2, _omitFieldNames ? '' : 'myself',
        subBuilder: $1.SimpleUser.create)
    ..aI(3, _omitFieldNames ? '' : 'selfLoveValue')
    ..aI(4, _omitFieldNames ? '' : 'selfRank')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoveRankRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoveRankRsp copyWith(void Function(LoveRankRsp) updates) =>
      super.copyWith((message) => updates(message as LoveRankRsp))
          as LoveRankRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoveRankRsp create() => LoveRankRsp._();
  @$core.override
  LoveRankRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoveRankRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoveRankRsp>(create);
  static LoveRankRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<LoveRankItem> get loveRankItem => $_getList(0);

  @$pb.TagNumber(2)
  $1.SimpleUser get myself => $_getN(1);
  @$pb.TagNumber(2)
  set myself($1.SimpleUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMyself() => $_has(1);
  @$pb.TagNumber(2)
  void clearMyself() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.SimpleUser ensureMyself() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get selfLoveValue => $_getIZ(2);
  @$pb.TagNumber(3)
  set selfLoveValue($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSelfLoveValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearSelfLoveValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get selfRank => $_getIZ(3);
  @$pb.TagNumber(4)
  set selfRank($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSelfRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearSelfRank() => $_clearField(4);
}

class LoveRankItem extends $pb.GeneratedMessage {
  factory LoveRankItem({
    $1.SimpleUser? user,
    $core.int? loveValue,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (loveValue != null) result.loveValue = loveValue;
    return result;
  }

  LoveRankItem._();

  factory LoveRankItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoveRankItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoveRankItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..aOM<$1.SimpleUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: $1.SimpleUser.create)
    ..aI(2, _omitFieldNames ? '' : 'loveValue')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoveRankItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoveRankItem copyWith(void Function(LoveRankItem) updates) =>
      super.copyWith((message) => updates(message as LoveRankItem))
          as LoveRankItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoveRankItem create() => LoveRankItem._();
  @$core.override
  LoveRankItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoveRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoveRankItem>(create);
  static LoveRankItem? _defaultInstance;

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
  $core.int get loveValue => $_getIZ(1);
  @$pb.TagNumber(2)
  set loveValue($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLoveValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearLoveValue() => $_clearField(2);
}

class LuckRankRsp extends $pb.GeneratedMessage {
  factory LuckRankRsp({
    $core.Iterable<LuckRankItem>? item,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    return result;
  }

  LuckRankRsp._();

  factory LuckRankRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LuckRankRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LuckRankRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..pPM<LuckRankItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: LuckRankItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LuckRankRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LuckRankRsp copyWith(void Function(LuckRankRsp) updates) =>
      super.copyWith((message) => updates(message as LuckRankRsp))
          as LuckRankRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LuckRankRsp create() => LuckRankRsp._();
  @$core.override
  LuckRankRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LuckRankRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LuckRankRsp>(create);
  static LuckRankRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<LuckRankItem> get item => $_getList(0);
}

class LuckRankItem extends $pb.GeneratedMessage {
  factory LuckRankItem({
    $1.SimpleUser? user,
    LuckRankType? type,
    $core.int? coin,
    $core.String? icon,
    $core.String? text,
    $core.int? count,
    $core.String? boxIcon,
    $fixnum.Int64? time,
    $core.String? url,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (type != null) result.type = type;
    if (coin != null) result.coin = coin;
    if (icon != null) result.icon = icon;
    if (text != null) result.text = text;
    if (count != null) result.count = count;
    if (boxIcon != null) result.boxIcon = boxIcon;
    if (time != null) result.time = time;
    if (url != null) result.url = url;
    return result;
  }

  LuckRankItem._();

  factory LuckRankItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LuckRankItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LuckRankItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..aOM<$1.SimpleUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: $1.SimpleUser.create)
    ..aE<LuckRankType>(2, _omitFieldNames ? '' : 'type',
        enumValues: LuckRankType.values)
    ..aI(3, _omitFieldNames ? '' : 'coin')
    ..aOS(4, _omitFieldNames ? '' : 'icon')
    ..aOS(5, _omitFieldNames ? '' : 'text')
    ..aI(6, _omitFieldNames ? '' : 'count')
    ..aOS(7, _omitFieldNames ? '' : 'boxIcon')
    ..aInt64(8, _omitFieldNames ? '' : 'time')
    ..aOS(9, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LuckRankItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LuckRankItem copyWith(void Function(LuckRankItem) updates) =>
      super.copyWith((message) => updates(message as LuckRankItem))
          as LuckRankItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LuckRankItem create() => LuckRankItem._();
  @$core.override
  LuckRankItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LuckRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LuckRankItem>(create);
  static LuckRankItem? _defaultInstance;

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
  LuckRankType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(LuckRankType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get coin => $_getIZ(2);
  @$pb.TagNumber(3)
  set coin($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCoin() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoin() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get text => $_getSZ(4);
  @$pb.TagNumber(5)
  set text($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasText() => $_has(4);
  @$pb.TagNumber(5)
  void clearText() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get count => $_getIZ(5);
  @$pb.TagNumber(6)
  set count($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearCount() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get boxIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set boxIcon($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBoxIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearBoxIcon() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get time => $_getI64(7);
  @$pb.TagNumber(8)
  set time($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearTime() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get url => $_getSZ(8);
  @$pb.TagNumber(9)
  set url($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearUrl() => $_clearField(9);
}

class BeerStatusRsp extends $pb.GeneratedMessage {
  factory BeerStatusRsp({
    $core.Iterable<BeerItem>? items,
    $core.String? honorIcon,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    if (honorIcon != null) result.honorIcon = honorIcon;
    return result;
  }

  BeerStatusRsp._();

  factory BeerStatusRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BeerStatusRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BeerStatusRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..pPM<BeerItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: BeerItem.create)
    ..aOS(2, _omitFieldNames ? '' : 'honorIcon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeerStatusRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeerStatusRsp copyWith(void Function(BeerStatusRsp) updates) =>
      super.copyWith((message) => updates(message as BeerStatusRsp))
          as BeerStatusRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BeerStatusRsp create() => BeerStatusRsp._();
  @$core.override
  BeerStatusRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BeerStatusRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BeerStatusRsp>(create);
  static BeerStatusRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BeerItem> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get honorIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set honorIcon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHonorIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearHonorIcon() => $_clearField(2);
}

class BeerGiftItem extends $pb.GeneratedMessage {
  factory BeerGiftItem({
    $fixnum.Int64? id,
    $core.String? icon,
    $core.String? name,
    $core.int? status,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (icon != null) result.icon = icon;
    if (name != null) result.name = name;
    if (status != null) result.status = status;
    return result;
  }

  BeerGiftItem._();

  factory BeerGiftItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BeerGiftItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BeerGiftItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aI(4, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeerGiftItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeerGiftItem copyWith(void Function(BeerGiftItem) updates) =>
      super.copyWith((message) => updates(message as BeerGiftItem))
          as BeerGiftItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BeerGiftItem create() => BeerGiftItem._();
  @$core.override
  BeerGiftItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BeerGiftItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BeerGiftItem>(create);
  static BeerGiftItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get status => $_getIZ(3);
  @$pb.TagNumber(4)
  set status($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);
}

class BeerItem extends $pb.GeneratedMessage {
  factory BeerItem({
    $core.int? periodId,
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
    $core.Iterable<BeerGiftItem>? gifts,
    $fixnum.Int64? complete,
    $core.String? honorIcon,
    $core.String? honorName,
  }) {
    final result = create();
    if (periodId != null) result.periodId = periodId;
    if (startTime != null) result.startTime = startTime;
    if (endTime != null) result.endTime = endTime;
    if (gifts != null) result.gifts.addAll(gifts);
    if (complete != null) result.complete = complete;
    if (honorIcon != null) result.honorIcon = honorIcon;
    if (honorName != null) result.honorName = honorName;
    return result;
  }

  BeerItem._();

  factory BeerItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BeerItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BeerItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'periodId')
    ..aInt64(2, _omitFieldNames ? '' : 'startTime')
    ..aInt64(3, _omitFieldNames ? '' : 'endTime')
    ..pPM<BeerGiftItem>(4, _omitFieldNames ? '' : 'gifts',
        subBuilder: BeerGiftItem.create)
    ..aInt64(5, _omitFieldNames ? '' : 'complete')
    ..aOS(6, _omitFieldNames ? '' : 'honorIcon')
    ..aOS(7, _omitFieldNames ? '' : 'honorName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeerItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BeerItem copyWith(void Function(BeerItem) updates) =>
      super.copyWith((message) => updates(message as BeerItem)) as BeerItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BeerItem create() => BeerItem._();
  @$core.override
  BeerItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BeerItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BeerItem>(create);
  static BeerItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get periodId => $_getIZ(0);
  @$pb.TagNumber(1)
  set periodId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPeriodId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeriodId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get startTime => $_getI64(1);
  @$pb.TagNumber(2)
  set startTime($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get endTime => $_getI64(2);
  @$pb.TagNumber(3)
  set endTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<BeerGiftItem> get gifts => $_getList(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get complete => $_getI64(4);
  @$pb.TagNumber(5)
  set complete($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasComplete() => $_has(4);
  @$pb.TagNumber(5)
  void clearComplete() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get honorIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set honorIcon($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasHonorIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearHonorIcon() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get honorName => $_getSZ(6);
  @$pb.TagNumber(7)
  set honorName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasHonorName() => $_has(6);
  @$pb.TagNumber(7)
  void clearHonorName() => $_clearField(7);
}

/// 用户榜单，通用
class UserRankRsp extends $pb.GeneratedMessage {
  factory UserRankRsp({
    $core.Iterable<UserRankItem>? item,
    $1.SimpleUser? myself,
    $core.int? selfValue,
    $core.int? selfRank,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    if (myself != null) result.myself = myself;
    if (selfValue != null) result.selfValue = selfValue;
    if (selfRank != null) result.selfRank = selfRank;
    return result;
  }

  UserRankRsp._();

  factory UserRankRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRankRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRankRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..pPM<UserRankItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: UserRankItem.create)
    ..aOM<$1.SimpleUser>(2, _omitFieldNames ? '' : 'myself',
        subBuilder: $1.SimpleUser.create)
    ..aI(3, _omitFieldNames ? '' : 'selfValue')
    ..aI(4, _omitFieldNames ? '' : 'selfRank')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRankRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRankRsp copyWith(void Function(UserRankRsp) updates) =>
      super.copyWith((message) => updates(message as UserRankRsp))
          as UserRankRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRankRsp create() => UserRankRsp._();
  @$core.override
  UserRankRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRankRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRankRsp>(create);
  static UserRankRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserRankItem> get item => $_getList(0);

  @$pb.TagNumber(2)
  $1.SimpleUser get myself => $_getN(1);
  @$pb.TagNumber(2)
  set myself($1.SimpleUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMyself() => $_has(1);
  @$pb.TagNumber(2)
  void clearMyself() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.SimpleUser ensureMyself() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get selfValue => $_getIZ(2);
  @$pb.TagNumber(3)
  set selfValue($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSelfValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearSelfValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get selfRank => $_getIZ(3);
  @$pb.TagNumber(4)
  set selfRank($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSelfRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearSelfRank() => $_clearField(4);
}

class UserRankItem extends $pb.GeneratedMessage {
  factory UserRankItem({
    $1.SimpleUser? user,
    $core.int? value,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (value != null) result.value = value;
    return result;
  }

  UserRankItem._();

  factory UserRankItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRankItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRankItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ranking_list'),
      createEmptyInstance: create)
    ..aOM<$1.SimpleUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: $1.SimpleUser.create)
    ..aI(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRankItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRankItem copyWith(void Function(UserRankItem) updates) =>
      super.copyWith((message) => updates(message as UserRankItem))
          as UserRankItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRankItem create() => UserRankItem._();
  @$core.override
  UserRankItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRankItem>(create);
  static UserRankItem? _defaultInstance;

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
  $core.int get value => $_getIZ(1);
  @$pb.TagNumber(2)
  set value($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

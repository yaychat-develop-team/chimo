// This is a generated file - do not edit.
//
// Generated from server_client/world_megaphone.proto.

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

/// 发布喇叭消息请求报文
class UseMegaphoneReq extends $pb.GeneratedMessage {
  factory UseMegaphoneReq({
    $core.String? content,
    $fixnum.Int64? parentId,
    $core.int? skinType,
  }) {
    final result = create();
    if (content != null) result.content = content;
    if (parentId != null) result.parentId = parentId;
    if (skinType != null) result.skinType = skinType;
    return result;
  }

  UseMegaphoneReq._();

  factory UseMegaphoneReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UseMegaphoneReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UseMegaphoneReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worldMegaphone'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..aInt64(2, _omitFieldNames ? '' : 'parentId')
    ..aI(3, _omitFieldNames ? '' : 'skinType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UseMegaphoneReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UseMegaphoneReq copyWith(void Function(UseMegaphoneReq) updates) =>
      super.copyWith((message) => updates(message as UseMegaphoneReq))
          as UseMegaphoneReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UseMegaphoneReq create() => UseMegaphoneReq._();
  @$core.override
  UseMegaphoneReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UseMegaphoneReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UseMegaphoneReq>(create);
  static UseMegaphoneReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get parentId => $_getI64(1);
  @$pb.TagNumber(2)
  set parentId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasParentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get skinType => $_getIZ(2);
  @$pb.TagNumber(3)
  set skinType($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSkinType() => $_has(2);
  @$pb.TagNumber(3)
  void clearSkinType() => $_clearField(3);
}

/// 发布喇叭消息响应报文
class UseMegaphoneRsp extends $pb.GeneratedMessage {
  factory UseMegaphoneRsp({
    $fixnum.Int64? megaphoneId,
    $core.int? remainCardCount,
    $core.String? lowBalanceTip,
  }) {
    final result = create();
    if (megaphoneId != null) result.megaphoneId = megaphoneId;
    if (remainCardCount != null) result.remainCardCount = remainCardCount;
    if (lowBalanceTip != null) result.lowBalanceTip = lowBalanceTip;
    return result;
  }

  UseMegaphoneRsp._();

  factory UseMegaphoneRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UseMegaphoneRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UseMegaphoneRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worldMegaphone'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'megaphoneId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(2, _omitFieldNames ? '' : 'remainCardCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'lowBalanceTip')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UseMegaphoneRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UseMegaphoneRsp copyWith(void Function(UseMegaphoneRsp) updates) =>
      super.copyWith((message) => updates(message as UseMegaphoneRsp))
          as UseMegaphoneRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UseMegaphoneRsp create() => UseMegaphoneRsp._();
  @$core.override
  UseMegaphoneRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UseMegaphoneRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UseMegaphoneRsp>(create);
  static UseMegaphoneRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get megaphoneId => $_getI64(0);
  @$pb.TagNumber(1)
  set megaphoneId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMegaphoneId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMegaphoneId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get remainCardCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set remainCardCount($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRemainCardCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemainCardCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get lowBalanceTip => $_getSZ(2);
  @$pb.TagNumber(3)
  set lowBalanceTip($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLowBalanceTip() => $_has(2);
  @$pb.TagNumber(3)
  void clearLowBalanceTip() => $_clearField(3);
}

/// 查询喇叭消息列表请求报文
class QueryWorldMegaphoneReq extends $pb.GeneratedMessage {
  factory QueryWorldMegaphoneReq({
    $core.int? pageIndex,
  }) {
    final result = create();
    if (pageIndex != null) result.pageIndex = pageIndex;
    return result;
  }

  QueryWorldMegaphoneReq._();

  factory QueryWorldMegaphoneReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryWorldMegaphoneReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryWorldMegaphoneReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worldMegaphone'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'pageIndex')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryWorldMegaphoneReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryWorldMegaphoneReq copyWith(
          void Function(QueryWorldMegaphoneReq) updates) =>
      super.copyWith((message) => updates(message as QueryWorldMegaphoneReq))
          as QueryWorldMegaphoneReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryWorldMegaphoneReq create() => QueryWorldMegaphoneReq._();
  @$core.override
  QueryWorldMegaphoneReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryWorldMegaphoneReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryWorldMegaphoneReq>(create);
  static QueryWorldMegaphoneReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageIndex($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPageIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageIndex() => $_clearField(1);
}

/// 查询世界喇叭列表响应
class QueryWorldMegaphoneRsp extends $pb.GeneratedMessage {
  factory QueryWorldMegaphoneRsp({
    $core.Iterable<WorldMegaphoneItem>? list,
    $core.bool? hasMore,
    $core.int? remainCardCount,
    $core.String? lowBalanceTip,
    WorldMegaphoneTopInfo? top,
    $core.int? nextTakeoverCost,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (hasMore != null) result.hasMore = hasMore;
    if (remainCardCount != null) result.remainCardCount = remainCardCount;
    if (lowBalanceTip != null) result.lowBalanceTip = lowBalanceTip;
    if (top != null) result.top = top;
    if (nextTakeoverCost != null) result.nextTakeoverCost = nextTakeoverCost;
    return result;
  }

  QueryWorldMegaphoneRsp._();

  factory QueryWorldMegaphoneRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryWorldMegaphoneRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryWorldMegaphoneRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worldMegaphone'),
      createEmptyInstance: create)
    ..pPM<WorldMegaphoneItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: WorldMegaphoneItem.create)
    ..aOB(2, _omitFieldNames ? '' : 'hasMore')
    ..aI(3, _omitFieldNames ? '' : 'remainCardCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'lowBalanceTip')
    ..aOM<WorldMegaphoneTopInfo>(5, _omitFieldNames ? '' : 'top',
        subBuilder: WorldMegaphoneTopInfo.create)
    ..aI(6, _omitFieldNames ? '' : 'nextTakeoverCost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryWorldMegaphoneRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryWorldMegaphoneRsp copyWith(
          void Function(QueryWorldMegaphoneRsp) updates) =>
      super.copyWith((message) => updates(message as QueryWorldMegaphoneRsp))
          as QueryWorldMegaphoneRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryWorldMegaphoneRsp create() => QueryWorldMegaphoneRsp._();
  @$core.override
  QueryWorldMegaphoneRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryWorldMegaphoneRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryWorldMegaphoneRsp>(create);
  static QueryWorldMegaphoneRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WorldMegaphoneItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get hasMore => $_getBF(1);
  @$pb.TagNumber(2)
  set hasMore($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasMore() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get remainCardCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set remainCardCount($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRemainCardCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemainCardCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get lowBalanceTip => $_getSZ(3);
  @$pb.TagNumber(4)
  set lowBalanceTip($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLowBalanceTip() => $_has(3);
  @$pb.TagNumber(4)
  void clearLowBalanceTip() => $_clearField(4);

  @$pb.TagNumber(5)
  WorldMegaphoneTopInfo get top => $_getN(4);
  @$pb.TagNumber(5)
  set top(WorldMegaphoneTopInfo value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasTop() => $_has(4);
  @$pb.TagNumber(5)
  void clearTop() => $_clearField(5);
  @$pb.TagNumber(5)
  WorldMegaphoneTopInfo ensureTop() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get nextTakeoverCost => $_getIZ(5);
  @$pb.TagNumber(6)
  set nextTakeoverCost($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNextTakeoverCost() => $_has(5);
  @$pb.TagNumber(6)
  void clearNextTakeoverCost() => $_clearField(6);
}

/// 查询喇叭消息列表响应报文列表项
class WorldMegaphoneItem extends $pb.GeneratedMessage {
  factory WorldMegaphoneItem({
    $fixnum.Int64? id,
    $fixnum.Int64? senderId,
    $core.String? senderNickname,
    $core.String? senderAvatar,
    $core.String? content,
    $fixnum.Int64? parentId,
    $core.String? quoteContent,
    $fixnum.Int64? quoteSenderId,
    $core.int? likeCount,
    $core.int? dislikeCount,
    $core.int? replyCount,
    $fixnum.Int64? createdAt,
    $core.int? reactionType,
    $core.String? senderGender,
    $fixnum.Int64? channelId,
    $core.String? quoteSenderNickname,
    $core.Iterable<$core.String>? nicknameColor,
    $core.int? skinType,
    $core.bool? canPin,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (senderId != null) result.senderId = senderId;
    if (senderNickname != null) result.senderNickname = senderNickname;
    if (senderAvatar != null) result.senderAvatar = senderAvatar;
    if (content != null) result.content = content;
    if (parentId != null) result.parentId = parentId;
    if (quoteContent != null) result.quoteContent = quoteContent;
    if (quoteSenderId != null) result.quoteSenderId = quoteSenderId;
    if (likeCount != null) result.likeCount = likeCount;
    if (dislikeCount != null) result.dislikeCount = dislikeCount;
    if (replyCount != null) result.replyCount = replyCount;
    if (createdAt != null) result.createdAt = createdAt;
    if (reactionType != null) result.reactionType = reactionType;
    if (senderGender != null) result.senderGender = senderGender;
    if (channelId != null) result.channelId = channelId;
    if (quoteSenderNickname != null)
      result.quoteSenderNickname = quoteSenderNickname;
    if (nicknameColor != null) result.nicknameColor.addAll(nicknameColor);
    if (skinType != null) result.skinType = skinType;
    if (canPin != null) result.canPin = canPin;
    return result;
  }

  WorldMegaphoneItem._();

  factory WorldMegaphoneItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorldMegaphoneItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorldMegaphoneItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worldMegaphone'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'senderId')
    ..aOS(3, _omitFieldNames ? '' : 'senderNickname')
    ..aOS(4, _omitFieldNames ? '' : 'senderAvatar')
    ..aOS(5, _omitFieldNames ? '' : 'content')
    ..aInt64(6, _omitFieldNames ? '' : 'parentId')
    ..aOS(7, _omitFieldNames ? '' : 'quoteContent')
    ..aInt64(8, _omitFieldNames ? '' : 'quoteSenderId')
    ..aI(9, _omitFieldNames ? '' : 'likeCount', fieldType: $pb.PbFieldType.OU3)
    ..aI(10, _omitFieldNames ? '' : 'dislikeCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(11, _omitFieldNames ? '' : 'replyCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aInt64(12, _omitFieldNames ? '' : 'createdAt')
    ..aI(13, _omitFieldNames ? '' : 'reactionType')
    ..aOS(14, _omitFieldNames ? '' : 'senderGender')
    ..aInt64(15, _omitFieldNames ? '' : 'channelId', protoName: 'channelId')
    ..aOS(16, _omitFieldNames ? '' : 'quoteSenderNickname')
    ..pPS(17, _omitFieldNames ? '' : 'nicknameColor')
    ..aI(18, _omitFieldNames ? '' : 'skinType')
    ..aOB(19, _omitFieldNames ? '' : 'canPin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorldMegaphoneItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorldMegaphoneItem copyWith(void Function(WorldMegaphoneItem) updates) =>
      super.copyWith((message) => updates(message as WorldMegaphoneItem))
          as WorldMegaphoneItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorldMegaphoneItem create() => WorldMegaphoneItem._();
  @$core.override
  WorldMegaphoneItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WorldMegaphoneItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WorldMegaphoneItem>(create);
  static WorldMegaphoneItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get senderId => $_getI64(1);
  @$pb.TagNumber(2)
  set senderId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSenderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get senderNickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set senderNickname($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSenderNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearSenderNickname() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get senderAvatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set senderAvatar($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSenderAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearSenderAvatar() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get content => $_getSZ(4);
  @$pb.TagNumber(5)
  set content($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasContent() => $_has(4);
  @$pb.TagNumber(5)
  void clearContent() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get parentId => $_getI64(5);
  @$pb.TagNumber(6)
  set parentId($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasParentId() => $_has(5);
  @$pb.TagNumber(6)
  void clearParentId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get quoteContent => $_getSZ(6);
  @$pb.TagNumber(7)
  set quoteContent($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasQuoteContent() => $_has(6);
  @$pb.TagNumber(7)
  void clearQuoteContent() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get quoteSenderId => $_getI64(7);
  @$pb.TagNumber(8)
  set quoteSenderId($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasQuoteSenderId() => $_has(7);
  @$pb.TagNumber(8)
  void clearQuoteSenderId() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get likeCount => $_getIZ(8);
  @$pb.TagNumber(9)
  set likeCount($core.int value) => $_setUnsignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasLikeCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearLikeCount() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get dislikeCount => $_getIZ(9);
  @$pb.TagNumber(10)
  set dislikeCount($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasDislikeCount() => $_has(9);
  @$pb.TagNumber(10)
  void clearDislikeCount() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get replyCount => $_getIZ(10);
  @$pb.TagNumber(11)
  set replyCount($core.int value) => $_setUnsignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasReplyCount() => $_has(10);
  @$pb.TagNumber(11)
  void clearReplyCount() => $_clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get createdAt => $_getI64(11);
  @$pb.TagNumber(12)
  set createdAt($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(12)
  $core.bool hasCreatedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearCreatedAt() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get reactionType => $_getIZ(12);
  @$pb.TagNumber(13)
  set reactionType($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasReactionType() => $_has(12);
  @$pb.TagNumber(13)
  void clearReactionType() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get senderGender => $_getSZ(13);
  @$pb.TagNumber(14)
  set senderGender($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasSenderGender() => $_has(13);
  @$pb.TagNumber(14)
  void clearSenderGender() => $_clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get channelId => $_getI64(14);
  @$pb.TagNumber(15)
  set channelId($fixnum.Int64 value) => $_setInt64(14, value);
  @$pb.TagNumber(15)
  $core.bool hasChannelId() => $_has(14);
  @$pb.TagNumber(15)
  void clearChannelId() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get quoteSenderNickname => $_getSZ(15);
  @$pb.TagNumber(16)
  set quoteSenderNickname($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasQuoteSenderNickname() => $_has(15);
  @$pb.TagNumber(16)
  void clearQuoteSenderNickname() => $_clearField(16);

  @$pb.TagNumber(17)
  $pb.PbList<$core.String> get nicknameColor => $_getList(16);

  @$pb.TagNumber(18)
  $core.int get skinType => $_getIZ(17);
  @$pb.TagNumber(18)
  set skinType($core.int value) => $_setSignedInt32(17, value);
  @$pb.TagNumber(18)
  $core.bool hasSkinType() => $_has(17);
  @$pb.TagNumber(18)
  void clearSkinType() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.bool get canPin => $_getBF(18);
  @$pb.TagNumber(19)
  set canPin($core.bool value) => $_setBool(18, value);
  @$pb.TagNumber(19)
  $core.bool hasCanPin() => $_has(18);
  @$pb.TagNumber(19)
  void clearCanPin() => $_clearField(19);
}

/// 世界第一顶部位。卡片内容复用 WorldMegaphoneItem（含皮肤、点赞、引用）
class WorldMegaphoneTopInfo extends $pb.GeneratedMessage {
  factory WorldMegaphoneTopInfo({
    WorldMegaphoneItem? item,
    $fixnum.Int64? startTime,
    $fixnum.Int64? expireTime,
    $core.bool? canRenew,
    $core.bool? canCancel,
  }) {
    final result = create();
    if (item != null) result.item = item;
    if (startTime != null) result.startTime = startTime;
    if (expireTime != null) result.expireTime = expireTime;
    if (canRenew != null) result.canRenew = canRenew;
    if (canCancel != null) result.canCancel = canCancel;
    return result;
  }

  WorldMegaphoneTopInfo._();

  factory WorldMegaphoneTopInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorldMegaphoneTopInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorldMegaphoneTopInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worldMegaphone'),
      createEmptyInstance: create)
    ..aOM<WorldMegaphoneItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: WorldMegaphoneItem.create)
    ..aInt64(2, _omitFieldNames ? '' : 'startTime')
    ..aInt64(3, _omitFieldNames ? '' : 'expireTime')
    ..aOB(4, _omitFieldNames ? '' : 'canRenew')
    ..aOB(5, _omitFieldNames ? '' : 'canCancel')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorldMegaphoneTopInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorldMegaphoneTopInfo copyWith(
          void Function(WorldMegaphoneTopInfo) updates) =>
      super.copyWith((message) => updates(message as WorldMegaphoneTopInfo))
          as WorldMegaphoneTopInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorldMegaphoneTopInfo create() => WorldMegaphoneTopInfo._();
  @$core.override
  WorldMegaphoneTopInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WorldMegaphoneTopInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WorldMegaphoneTopInfo>(create);
  static WorldMegaphoneTopInfo? _defaultInstance;

  @$pb.TagNumber(1)
  WorldMegaphoneItem get item => $_getN(0);
  @$pb.TagNumber(1)
  set item(WorldMegaphoneItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearItem() => $_clearField(1);
  @$pb.TagNumber(1)
  WorldMegaphoneItem ensureItem() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get startTime => $_getI64(1);
  @$pb.TagNumber(2)
  set startTime($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get expireTime => $_getI64(2);
  @$pb.TagNumber(3)
  set expireTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpireTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpireTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get canRenew => $_getBF(3);
  @$pb.TagNumber(4)
  set canRenew($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCanRenew() => $_has(3);
  @$pb.TagNumber(4)
  void clearCanRenew() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get canCancel => $_getBF(4);
  @$pb.TagNumber(5)
  set canCancel($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCanCancel() => $_has(4);
  @$pb.TagNumber(5)
  void clearCanCancel() => $_clearField(5);
}

/// 对指定喇叭消息点赞/点踩请求报文
class ReactWorldMegaphoneReq extends $pb.GeneratedMessage {
  factory ReactWorldMegaphoneReq({
    $fixnum.Int64? megaphoneId,
    $core.int? opType,
  }) {
    final result = create();
    if (megaphoneId != null) result.megaphoneId = megaphoneId;
    if (opType != null) result.opType = opType;
    return result;
  }

  ReactWorldMegaphoneReq._();

  factory ReactWorldMegaphoneReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReactWorldMegaphoneReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReactWorldMegaphoneReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worldMegaphone'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'megaphoneId')
    ..aI(2, _omitFieldNames ? '' : 'opType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReactWorldMegaphoneReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReactWorldMegaphoneReq copyWith(
          void Function(ReactWorldMegaphoneReq) updates) =>
      super.copyWith((message) => updates(message as ReactWorldMegaphoneReq))
          as ReactWorldMegaphoneReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReactWorldMegaphoneReq create() => ReactWorldMegaphoneReq._();
  @$core.override
  ReactWorldMegaphoneReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReactWorldMegaphoneReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReactWorldMegaphoneReq>(create);
  static ReactWorldMegaphoneReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get megaphoneId => $_getI64(0);
  @$pb.TagNumber(1)
  set megaphoneId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMegaphoneId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMegaphoneId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get opType => $_getIZ(1);
  @$pb.TagNumber(2)
  set opType($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOpType() => $_has(1);
  @$pb.TagNumber(2)
  void clearOpType() => $_clearField(2);
}

/// 对指定喇叭消息点赞/点踩响应报文
class ReactWorldMegaphoneRsp extends $pb.GeneratedMessage {
  factory ReactWorldMegaphoneRsp({
    $fixnum.Int64? megaphoneId,
    $core.int? likeCount,
    $core.int? dislikeCount,
    $core.int? reactionType,
  }) {
    final result = create();
    if (megaphoneId != null) result.megaphoneId = megaphoneId;
    if (likeCount != null) result.likeCount = likeCount;
    if (dislikeCount != null) result.dislikeCount = dislikeCount;
    if (reactionType != null) result.reactionType = reactionType;
    return result;
  }

  ReactWorldMegaphoneRsp._();

  factory ReactWorldMegaphoneRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReactWorldMegaphoneRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReactWorldMegaphoneRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worldMegaphone'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'megaphoneId')
    ..aI(2, _omitFieldNames ? '' : 'likeCount', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'dislikeCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'reactionType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReactWorldMegaphoneRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReactWorldMegaphoneRsp copyWith(
          void Function(ReactWorldMegaphoneRsp) updates) =>
      super.copyWith((message) => updates(message as ReactWorldMegaphoneRsp))
          as ReactWorldMegaphoneRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReactWorldMegaphoneRsp create() => ReactWorldMegaphoneRsp._();
  @$core.override
  ReactWorldMegaphoneRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReactWorldMegaphoneRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReactWorldMegaphoneRsp>(create);
  static ReactWorldMegaphoneRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get megaphoneId => $_getI64(0);
  @$pb.TagNumber(1)
  set megaphoneId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMegaphoneId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMegaphoneId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get likeCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set likeCount($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLikeCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearLikeCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get dislikeCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set dislikeCount($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDislikeCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearDislikeCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get reactionType => $_getIZ(3);
  @$pb.TagNumber(4)
  set reactionType($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReactionType() => $_has(3);
  @$pb.TagNumber(4)
  void clearReactionType() => $_clearField(4);
}

/// 抢占世界第一
class PinWorldMegaphoneTopReq extends $pb.GeneratedMessage {
  factory PinWorldMegaphoneTopReq({
    $fixnum.Int64? megaphoneId,
    $core.int? expectedCost,
  }) {
    final result = create();
    if (megaphoneId != null) result.megaphoneId = megaphoneId;
    if (expectedCost != null) result.expectedCost = expectedCost;
    return result;
  }

  PinWorldMegaphoneTopReq._();

  factory PinWorldMegaphoneTopReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PinWorldMegaphoneTopReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PinWorldMegaphoneTopReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worldMegaphone'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'megaphoneId')
    ..aI(2, _omitFieldNames ? '' : 'expectedCost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PinWorldMegaphoneTopReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PinWorldMegaphoneTopReq copyWith(
          void Function(PinWorldMegaphoneTopReq) updates) =>
      super.copyWith((message) => updates(message as PinWorldMegaphoneTopReq))
          as PinWorldMegaphoneTopReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PinWorldMegaphoneTopReq create() => PinWorldMegaphoneTopReq._();
  @$core.override
  PinWorldMegaphoneTopReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PinWorldMegaphoneTopReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PinWorldMegaphoneTopReq>(create);
  static PinWorldMegaphoneTopReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get megaphoneId => $_getI64(0);
  @$pb.TagNumber(1)
  set megaphoneId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMegaphoneId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMegaphoneId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get expectedCost => $_getIZ(1);
  @$pb.TagNumber(2)
  set expectedCost($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExpectedCost() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpectedCost() => $_clearField(2);
}

/// 续顶世界第一，消耗 1 张权益卡，剩余时间重置为 6 小时，不改变抢占成本
class RenewWorldMegaphoneTopReq extends $pb.GeneratedMessage {
  factory RenewWorldMegaphoneTopReq({
    $fixnum.Int64? megaphoneId,
  }) {
    final result = create();
    if (megaphoneId != null) result.megaphoneId = megaphoneId;
    return result;
  }

  RenewWorldMegaphoneTopReq._();

  factory RenewWorldMegaphoneTopReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RenewWorldMegaphoneTopReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RenewWorldMegaphoneTopReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worldMegaphone'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'megaphoneId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewWorldMegaphoneTopReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewWorldMegaphoneTopReq copyWith(
          void Function(RenewWorldMegaphoneTopReq) updates) =>
      super.copyWith((message) => updates(message as RenewWorldMegaphoneTopReq))
          as RenewWorldMegaphoneTopReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenewWorldMegaphoneTopReq create() => RenewWorldMegaphoneTopReq._();
  @$core.override
  RenewWorldMegaphoneTopReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RenewWorldMegaphoneTopReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RenewWorldMegaphoneTopReq>(create);
  static RenewWorldMegaphoneTopReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get megaphoneId => $_getI64(0);
  @$pb.TagNumber(1)
  set megaphoneId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMegaphoneId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMegaphoneId() => $_clearField(1);
}

/// 取消世界第一。不返还剩余时间和已消耗权益卡，坑位清空后抢占成本重置为 1
class CancelWorldMegaphoneTopReq extends $pb.GeneratedMessage {
  factory CancelWorldMegaphoneTopReq({
    $fixnum.Int64? megaphoneId,
  }) {
    final result = create();
    if (megaphoneId != null) result.megaphoneId = megaphoneId;
    return result;
  }

  CancelWorldMegaphoneTopReq._();

  factory CancelWorldMegaphoneTopReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelWorldMegaphoneTopReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelWorldMegaphoneTopReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worldMegaphone'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'megaphoneId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelWorldMegaphoneTopReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelWorldMegaphoneTopReq copyWith(
          void Function(CancelWorldMegaphoneTopReq) updates) =>
      super.copyWith(
              (message) => updates(message as CancelWorldMegaphoneTopReq))
          as CancelWorldMegaphoneTopReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelWorldMegaphoneTopReq create() => CancelWorldMegaphoneTopReq._();
  @$core.override
  CancelWorldMegaphoneTopReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CancelWorldMegaphoneTopReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelWorldMegaphoneTopReq>(create);
  static CancelWorldMegaphoneTopReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get megaphoneId => $_getI64(0);
  @$pb.TagNumber(1)
  set megaphoneId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMegaphoneId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMegaphoneId() => $_clearField(1);
}

/// 抢占 / 续顶 / 取消响应
class WorldMegaphoneTopOpRsp extends $pb.GeneratedMessage {
  factory WorldMegaphoneTopOpRsp({
    WorldMegaphoneTopInfo? top,
    $core.int? nextTakeoverCost,
    $core.int? remainCardCount,
    $core.String? lowBalanceTip,
  }) {
    final result = create();
    if (top != null) result.top = top;
    if (nextTakeoverCost != null) result.nextTakeoverCost = nextTakeoverCost;
    if (remainCardCount != null) result.remainCardCount = remainCardCount;
    if (lowBalanceTip != null) result.lowBalanceTip = lowBalanceTip;
    return result;
  }

  WorldMegaphoneTopOpRsp._();

  factory WorldMegaphoneTopOpRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorldMegaphoneTopOpRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorldMegaphoneTopOpRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worldMegaphone'),
      createEmptyInstance: create)
    ..aOM<WorldMegaphoneTopInfo>(1, _omitFieldNames ? '' : 'top',
        subBuilder: WorldMegaphoneTopInfo.create)
    ..aI(2, _omitFieldNames ? '' : 'nextTakeoverCost')
    ..aI(3, _omitFieldNames ? '' : 'remainCardCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'lowBalanceTip')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorldMegaphoneTopOpRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorldMegaphoneTopOpRsp copyWith(
          void Function(WorldMegaphoneTopOpRsp) updates) =>
      super.copyWith((message) => updates(message as WorldMegaphoneTopOpRsp))
          as WorldMegaphoneTopOpRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorldMegaphoneTopOpRsp create() => WorldMegaphoneTopOpRsp._();
  @$core.override
  WorldMegaphoneTopOpRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WorldMegaphoneTopOpRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WorldMegaphoneTopOpRsp>(create);
  static WorldMegaphoneTopOpRsp? _defaultInstance;

  @$pb.TagNumber(1)
  WorldMegaphoneTopInfo get top => $_getN(0);
  @$pb.TagNumber(1)
  set top(WorldMegaphoneTopInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTop() => $_has(0);
  @$pb.TagNumber(1)
  void clearTop() => $_clearField(1);
  @$pb.TagNumber(1)
  WorldMegaphoneTopInfo ensureTop() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get nextTakeoverCost => $_getIZ(1);
  @$pb.TagNumber(2)
  set nextTakeoverCost($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNextTakeoverCost() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextTakeoverCost() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get remainCardCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set remainCardCount($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRemainCardCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemainCardCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get lowBalanceTip => $_getSZ(3);
  @$pb.TagNumber(4)
  set lowBalanceTip($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLowBalanceTip() => $_has(3);
  @$pb.TagNumber(4)
  void clearLowBalanceTip() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

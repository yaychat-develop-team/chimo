// This is a generated file - do not edit.
//
// Generated from server_client/activity_share.proto.

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

/// 可分享活动项
class ShareableActivityItem extends $pb.GeneratedMessage {
  factory ShareableActivityItem({
    $fixnum.Int64? activityId,
    $core.String? name,
    $core.String? subtitle,
    $core.String? cardImageUrl,
    $core.String? jumpLink,
    $core.String? barrageText,
    $core.String? barrageIcon,
    $core.String? barrageColor,
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
  }) {
    final result = create();
    if (activityId != null) result.activityId = activityId;
    if (name != null) result.name = name;
    if (subtitle != null) result.subtitle = subtitle;
    if (cardImageUrl != null) result.cardImageUrl = cardImageUrl;
    if (jumpLink != null) result.jumpLink = jumpLink;
    if (barrageText != null) result.barrageText = barrageText;
    if (barrageIcon != null) result.barrageIcon = barrageIcon;
    if (barrageColor != null) result.barrageColor = barrageColor;
    if (startTime != null) result.startTime = startTime;
    if (endTime != null) result.endTime = endTime;
    return result;
  }

  ShareableActivityItem._();

  factory ShareableActivityItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShareableActivityItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShareableActivityItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'activity_share'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'activityId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'subtitle')
    ..aOS(4, _omitFieldNames ? '' : 'cardImageUrl')
    ..aOS(5, _omitFieldNames ? '' : 'jumpLink')
    ..aOS(6, _omitFieldNames ? '' : 'barrageText')
    ..aOS(7, _omitFieldNames ? '' : 'barrageIcon')
    ..aOS(8, _omitFieldNames ? '' : 'barrageColor')
    ..aInt64(9, _omitFieldNames ? '' : 'startTime')
    ..aInt64(10, _omitFieldNames ? '' : 'endTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShareableActivityItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShareableActivityItem copyWith(
          void Function(ShareableActivityItem) updates) =>
      super.copyWith((message) => updates(message as ShareableActivityItem))
          as ShareableActivityItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShareableActivityItem create() => ShareableActivityItem._();
  @$core.override
  ShareableActivityItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShareableActivityItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShareableActivityItem>(create);
  static ShareableActivityItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get activityId => $_getI64(0);
  @$pb.TagNumber(1)
  set activityId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActivityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get subtitle => $_getSZ(2);
  @$pb.TagNumber(3)
  set subtitle($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSubtitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubtitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get cardImageUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set cardImageUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCardImageUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearCardImageUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get jumpLink => $_getSZ(4);
  @$pb.TagNumber(5)
  set jumpLink($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasJumpLink() => $_has(4);
  @$pb.TagNumber(5)
  void clearJumpLink() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get barrageText => $_getSZ(5);
  @$pb.TagNumber(6)
  set barrageText($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBarrageText() => $_has(5);
  @$pb.TagNumber(6)
  void clearBarrageText() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get barrageIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set barrageIcon($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBarrageIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearBarrageIcon() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get barrageColor => $_getSZ(7);
  @$pb.TagNumber(8)
  set barrageColor($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasBarrageColor() => $_has(7);
  @$pb.TagNumber(8)
  void clearBarrageColor() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get startTime => $_getI64(8);
  @$pb.TagNumber(9)
  set startTime($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasStartTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearStartTime() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get endTime => $_getI64(9);
  @$pb.TagNumber(10)
  set endTime($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasEndTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearEndTime() => $_clearField(10);
}

class ShareableActivityListRsp extends $pb.GeneratedMessage {
  factory ShareableActivityListRsp({
    $core.Iterable<ShareableActivityItem>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  ShareableActivityListRsp._();

  factory ShareableActivityListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShareableActivityListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShareableActivityListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'activity_share'),
      createEmptyInstance: create)
    ..pPM<ShareableActivityItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: ShareableActivityItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShareableActivityListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShareableActivityListRsp copyWith(
          void Function(ShareableActivityListRsp) updates) =>
      super.copyWith((message) => updates(message as ShareableActivityListRsp))
          as ShareableActivityListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShareableActivityListRsp create() => ShareableActivityListRsp._();
  @$core.override
  ShareableActivityListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShareableActivityListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShareableActivityListRsp>(create);
  static ShareableActivityListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ShareableActivityItem> get list => $_getList(0);
}

/// 主播分享活动到厅内公屏
class ActivityShareToRoomReq extends $pb.GeneratedMessage {
  factory ActivityShareToRoomReq({
    $fixnum.Int64? activityId,
    $fixnum.Int64? rid,
    $core.String? shareButtonPosition,
  }) {
    final result = create();
    if (activityId != null) result.activityId = activityId;
    if (rid != null) result.rid = rid;
    if (shareButtonPosition != null)
      result.shareButtonPosition = shareButtonPosition;
    return result;
  }

  ActivityShareToRoomReq._();

  factory ActivityShareToRoomReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ActivityShareToRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActivityShareToRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'activity_share'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'activityId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'rid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'shareButtonPosition')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityShareToRoomReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityShareToRoomReq copyWith(
          void Function(ActivityShareToRoomReq) updates) =>
      super.copyWith((message) => updates(message as ActivityShareToRoomReq))
          as ActivityShareToRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActivityShareToRoomReq create() => ActivityShareToRoomReq._();
  @$core.override
  ActivityShareToRoomReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ActivityShareToRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActivityShareToRoomReq>(create);
  static ActivityShareToRoomReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get activityId => $_getI64(0);
  @$pb.TagNumber(1)
  set activityId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActivityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get rid => $_getI64(1);
  @$pb.TagNumber(2)
  set rid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get shareButtonPosition => $_getSZ(2);
  @$pb.TagNumber(3)
  set shareButtonPosition($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasShareButtonPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearShareButtonPosition() => $_clearField(3);
}

/// 分享活动到私聊
class ActivityShareToChatReq extends $pb.GeneratedMessage {
  factory ActivityShareToChatReq({
    $fixnum.Int64? activityId,
    $fixnum.Int64? toUid,
    $core.String? customText,
    $core.String? shareButtonPosition,
  }) {
    final result = create();
    if (activityId != null) result.activityId = activityId;
    if (toUid != null) result.toUid = toUid;
    if (customText != null) result.customText = customText;
    if (shareButtonPosition != null)
      result.shareButtonPosition = shareButtonPosition;
    return result;
  }

  ActivityShareToChatReq._();

  factory ActivityShareToChatReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ActivityShareToChatReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActivityShareToChatReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'activity_share'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'activityId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'toUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'customText')
    ..aOS(4, _omitFieldNames ? '' : 'shareButtonPosition')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityShareToChatReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityShareToChatReq copyWith(
          void Function(ActivityShareToChatReq) updates) =>
      super.copyWith((message) => updates(message as ActivityShareToChatReq))
          as ActivityShareToChatReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActivityShareToChatReq create() => ActivityShareToChatReq._();
  @$core.override
  ActivityShareToChatReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ActivityShareToChatReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActivityShareToChatReq>(create);
  static ActivityShareToChatReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get activityId => $_getI64(0);
  @$pb.TagNumber(1)
  set activityId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActivityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get toUid => $_getI64(1);
  @$pb.TagNumber(2)
  set toUid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearToUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get customText => $_getSZ(2);
  @$pb.TagNumber(3)
  set customText($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCustomText() => $_has(2);
  @$pb.TagNumber(3)
  void clearCustomText() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get shareButtonPosition => $_getSZ(3);
  @$pb.TagNumber(4)
  set shareButtonPosition($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasShareButtonPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearShareButtonPosition() => $_clearField(4);
}

/// H5 活动页分享到私聊（P1）
class ActivityShareToChatFromH5Req extends $pb.GeneratedMessage {
  factory ActivityShareToChatFromH5Req({
    $fixnum.Int64? activityId,
    $fixnum.Int64? toUid,
  }) {
    final result = create();
    if (activityId != null) result.activityId = activityId;
    if (toUid != null) result.toUid = toUid;
    return result;
  }

  ActivityShareToChatFromH5Req._();

  factory ActivityShareToChatFromH5Req.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ActivityShareToChatFromH5Req.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActivityShareToChatFromH5Req',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'activity_share'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'activityId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'toUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityShareToChatFromH5Req clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityShareToChatFromH5Req copyWith(
          void Function(ActivityShareToChatFromH5Req) updates) =>
      super.copyWith(
              (message) => updates(message as ActivityShareToChatFromH5Req))
          as ActivityShareToChatFromH5Req;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActivityShareToChatFromH5Req create() =>
      ActivityShareToChatFromH5Req._();
  @$core.override
  ActivityShareToChatFromH5Req createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ActivityShareToChatFromH5Req getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActivityShareToChatFromH5Req>(create);
  static ActivityShareToChatFromH5Req? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get activityId => $_getI64(0);
  @$pb.TagNumber(1)
  set activityId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActivityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get toUid => $_getI64(1);
  @$pb.TagNumber(2)
  set toUid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearToUid() => $_clearField(2);
}

/// 活动卡片点击上报
class ActivityShareClickReq extends $pb.GeneratedMessage {
  factory ActivityShareClickReq({
    $fixnum.Int64? activityId,
    $core.String? clickType,
    $fixnum.Int64? shareUserId,
    $fixnum.Int64? rid,
  }) {
    final result = create();
    if (activityId != null) result.activityId = activityId;
    if (clickType != null) result.clickType = clickType;
    if (shareUserId != null) result.shareUserId = shareUserId;
    if (rid != null) result.rid = rid;
    return result;
  }

  ActivityShareClickReq._();

  factory ActivityShareClickReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ActivityShareClickReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActivityShareClickReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'activity_share'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'activityId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'clickType')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'shareUserId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'rid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityShareClickReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityShareClickReq copyWith(
          void Function(ActivityShareClickReq) updates) =>
      super.copyWith((message) => updates(message as ActivityShareClickReq))
          as ActivityShareClickReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActivityShareClickReq create() => ActivityShareClickReq._();
  @$core.override
  ActivityShareClickReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ActivityShareClickReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActivityShareClickReq>(create);
  static ActivityShareClickReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get activityId => $_getI64(0);
  @$pb.TagNumber(1)
  set activityId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActivityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clickType => $_getSZ(1);
  @$pb.TagNumber(2)
  set clickType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClickType() => $_has(1);
  @$pb.TagNumber(2)
  void clearClickType() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get shareUserId => $_getI64(2);
  @$pb.TagNumber(3)
  set shareUserId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasShareUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearShareUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get rid => $_getI64(3);
  @$pb.TagNumber(4)
  set rid($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRid() => $_has(3);
  @$pb.TagNumber(4)
  void clearRid() => $_clearField(4);
}

/// 私聊活动卡片消息体（IM custom 消息 content）
class ActivityShareCardContent extends $pb.GeneratedMessage {
  factory ActivityShareCardContent({
    $fixnum.Int64? activityId,
    $core.String? name,
    $core.String? subtitle,
    $core.String? cardImageUrl,
    $core.String? jumpLink,
    $core.String? customText,
    $fixnum.Int64? senderUid,
    $core.String? senderNickname,
    $core.String? senderAvatar,
  }) {
    final result = create();
    if (activityId != null) result.activityId = activityId;
    if (name != null) result.name = name;
    if (subtitle != null) result.subtitle = subtitle;
    if (cardImageUrl != null) result.cardImageUrl = cardImageUrl;
    if (jumpLink != null) result.jumpLink = jumpLink;
    if (customText != null) result.customText = customText;
    if (senderUid != null) result.senderUid = senderUid;
    if (senderNickname != null) result.senderNickname = senderNickname;
    if (senderAvatar != null) result.senderAvatar = senderAvatar;
    return result;
  }

  ActivityShareCardContent._();

  factory ActivityShareCardContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ActivityShareCardContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActivityShareCardContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'activity_share'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'activityId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'subtitle')
    ..aOS(4, _omitFieldNames ? '' : 'cardImageUrl')
    ..aOS(5, _omitFieldNames ? '' : 'jumpLink')
    ..aOS(6, _omitFieldNames ? '' : 'customText')
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'senderUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(8, _omitFieldNames ? '' : 'senderNickname')
    ..aOS(9, _omitFieldNames ? '' : 'senderAvatar')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityShareCardContent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityShareCardContent copyWith(
          void Function(ActivityShareCardContent) updates) =>
      super.copyWith((message) => updates(message as ActivityShareCardContent))
          as ActivityShareCardContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActivityShareCardContent create() => ActivityShareCardContent._();
  @$core.override
  ActivityShareCardContent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ActivityShareCardContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActivityShareCardContent>(create);
  static ActivityShareCardContent? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get activityId => $_getI64(0);
  @$pb.TagNumber(1)
  set activityId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActivityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get subtitle => $_getSZ(2);
  @$pb.TagNumber(3)
  set subtitle($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSubtitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubtitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get cardImageUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set cardImageUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCardImageUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearCardImageUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get jumpLink => $_getSZ(4);
  @$pb.TagNumber(5)
  set jumpLink($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasJumpLink() => $_has(4);
  @$pb.TagNumber(5)
  void clearJumpLink() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get customText => $_getSZ(5);
  @$pb.TagNumber(6)
  set customText($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCustomText() => $_has(5);
  @$pb.TagNumber(6)
  void clearCustomText() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get senderUid => $_getI64(6);
  @$pb.TagNumber(7)
  set senderUid($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSenderUid() => $_has(6);
  @$pb.TagNumber(7)
  void clearSenderUid() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get senderNickname => $_getSZ(7);
  @$pb.TagNumber(8)
  set senderNickname($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSenderNickname() => $_has(7);
  @$pb.TagNumber(8)
  void clearSenderNickname() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get senderAvatar => $_getSZ(8);
  @$pb.TagNumber(9)
  set senderAvatar($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasSenderAvatar() => $_has(8);
  @$pb.TagNumber(9)
  void clearSenderAvatar() => $_clearField(9);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

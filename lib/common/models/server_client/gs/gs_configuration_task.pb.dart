// This is a generated file - do not edit.
//
// Generated from server_client/gs/gs_configuration_task.proto.

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

/// 获取gs某一时间段的积分点数
class GetGSTimeReq extends $pb.GeneratedMessage {
  factory GetGSTimeReq({
    $fixnum.Int64? beginTime,
    $fixnum.Int64? endTime,
  }) {
    final result = create();
    if (beginTime != null) result.beginTime = beginTime;
    if (endTime != null) result.endTime = endTime;
    return result;
  }

  GetGSTimeReq._();

  factory GetGSTimeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetGSTimeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetGSTimeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'beginTime')
    ..aInt64(2, _omitFieldNames ? '' : 'endTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetGSTimeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetGSTimeReq copyWith(void Function(GetGSTimeReq) updates) =>
      super.copyWith((message) => updates(message as GetGSTimeReq))
          as GetGSTimeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGSTimeReq create() => GetGSTimeReq._();
  @$core.override
  GetGSTimeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetGSTimeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetGSTimeReq>(create);
  static GetGSTimeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get beginTime => $_getI64(0);
  @$pb.TagNumber(1)
  set beginTime($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBeginTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearBeginTime() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endTime => $_getI64(1);
  @$pb.TagNumber(2)
  set endTime($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEndTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndTime() => $_clearField(2);
}

class GetGSPointsRsp extends $pb.GeneratedMessage {
  factory GetGSPointsRsp({
    $fixnum.Int64? point,
  }) {
    final result = create();
    if (point != null) result.point = point;
    return result;
  }

  GetGSPointsRsp._();

  factory GetGSPointsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetGSPointsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetGSPointsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'point')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetGSPointsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetGSPointsRsp copyWith(void Function(GetGSPointsRsp) updates) =>
      super.copyWith((message) => updates(message as GetGSPointsRsp))
          as GetGSPointsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGSPointsRsp create() => GetGSPointsRsp._();
  @$core.override
  GetGSPointsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetGSPointsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetGSPointsRsp>(create);
  static GetGSPointsRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get point => $_getI64(0);
  @$pb.TagNumber(1)
  set point($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPoint() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoint() => $_clearField(1);
}

class GetGSTaskDetailListRsp extends $pb.GeneratedMessage {
  factory GetGSTaskDetailListRsp({
    $fixnum.Int64? totalPoints,
    $core.Iterable<GSTaskGroup>? taskGroups,
  }) {
    final result = create();
    if (totalPoints != null) result.totalPoints = totalPoints;
    if (taskGroups != null) result.taskGroups.addAll(taskGroups);
    return result;
  }

  GetGSTaskDetailListRsp._();

  factory GetGSTaskDetailListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetGSTaskDetailListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetGSTaskDetailListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'totalPoints')
    ..pPM<GSTaskGroup>(2, _omitFieldNames ? '' : 'taskGroups',
        protoName: 'taskGroups', subBuilder: GSTaskGroup.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetGSTaskDetailListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetGSTaskDetailListRsp copyWith(
          void Function(GetGSTaskDetailListRsp) updates) =>
      super.copyWith((message) => updates(message as GetGSTaskDetailListRsp))
          as GetGSTaskDetailListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGSTaskDetailListRsp create() => GetGSTaskDetailListRsp._();
  @$core.override
  GetGSTaskDetailListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetGSTaskDetailListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetGSTaskDetailListRsp>(create);
  static GetGSTaskDetailListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalPoints => $_getI64(0);
  @$pb.TagNumber(1)
  set totalPoints($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalPoints() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalPoints() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<GSTaskGroup> get taskGroups => $_getList(1);
}

/// *
/// 所有gs工作详情
class AllGSWorkingLivingRsp extends $pb.GeneratedMessage {
  factory AllGSWorkingLivingRsp({
    $core.int? count,
    $core.Iterable<GSWorkDetailRsp>? gsWorkDetailList,
  }) {
    final result = create();
    if (count != null) result.count = count;
    if (gsWorkDetailList != null)
      result.gsWorkDetailList.addAll(gsWorkDetailList);
    return result;
  }

  AllGSWorkingLivingRsp._();

  factory AllGSWorkingLivingRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AllGSWorkingLivingRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AllGSWorkingLivingRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count')
    ..pPM<GSWorkDetailRsp>(2, _omitFieldNames ? '' : 'gsWorkDetailList',
        subBuilder: GSWorkDetailRsp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AllGSWorkingLivingRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AllGSWorkingLivingRsp copyWith(
          void Function(AllGSWorkingLivingRsp) updates) =>
      super.copyWith((message) => updates(message as AllGSWorkingLivingRsp))
          as AllGSWorkingLivingRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AllGSWorkingLivingRsp create() => AllGSWorkingLivingRsp._();
  @$core.override
  AllGSWorkingLivingRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AllGSWorkingLivingRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AllGSWorkingLivingRsp>(create);
  static AllGSWorkingLivingRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<GSWorkDetailRsp> get gsWorkDetailList => $_getList(1);
}

class GSWorkDetailRsp extends $pb.GeneratedMessage {
  factory GSWorkDetailRsp({
    $fixnum.Int64? gsUserId,
    $fixnum.Int64? totalLivingTimeMs,
    $fixnum.Int64? totalPoints,
  }) {
    final result = create();
    if (gsUserId != null) result.gsUserId = gsUserId;
    if (totalLivingTimeMs != null) result.totalLivingTimeMs = totalLivingTimeMs;
    if (totalPoints != null) result.totalPoints = totalPoints;
    return result;
  }

  GSWorkDetailRsp._();

  factory GSWorkDetailRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GSWorkDetailRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GSWorkDetailRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'gsUserId')
    ..aInt64(2, _omitFieldNames ? '' : 'totalLivingTimeMs')
    ..aInt64(3, _omitFieldNames ? '' : 'totalPoints')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSWorkDetailRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSWorkDetailRsp copyWith(void Function(GSWorkDetailRsp) updates) =>
      super.copyWith((message) => updates(message as GSWorkDetailRsp))
          as GSWorkDetailRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GSWorkDetailRsp create() => GSWorkDetailRsp._();
  @$core.override
  GSWorkDetailRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GSWorkDetailRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GSWorkDetailRsp>(create);
  static GSWorkDetailRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get gsUserId => $_getI64(0);
  @$pb.TagNumber(1)
  set gsUserId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalLivingTimeMs => $_getI64(1);
  @$pb.TagNumber(2)
  set totalLivingTimeMs($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalLivingTimeMs() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalLivingTimeMs() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get totalPoints => $_getI64(2);
  @$pb.TagNumber(3)
  set totalPoints($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalPoints() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalPoints() => $_clearField(3);
}

class GSTaskGroup extends $pb.GeneratedMessage {
  factory GSTaskGroup({
    $core.String? name,
    $core.Iterable<GSTaskItem>? tasks,
    TaskLinkAction? linkAction,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (tasks != null) result.tasks.addAll(tasks);
    if (linkAction != null) result.linkAction = linkAction;
    return result;
  }

  GSTaskGroup._();

  factory GSTaskGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GSTaskGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GSTaskGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..pPM<GSTaskItem>(2, _omitFieldNames ? '' : 'tasks',
        subBuilder: GSTaskItem.create)
    ..aOM<TaskLinkAction>(3, _omitFieldNames ? '' : 'linkAction',
        protoName: 'linkAction', subBuilder: TaskLinkAction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSTaskGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSTaskGroup copyWith(void Function(GSTaskGroup) updates) =>
      super.copyWith((message) => updates(message as GSTaskGroup))
          as GSTaskGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GSTaskGroup create() => GSTaskGroup._();
  @$core.override
  GSTaskGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GSTaskGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GSTaskGroup>(create);
  static GSTaskGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<GSTaskItem> get tasks => $_getList(1);

  @$pb.TagNumber(3)
  TaskLinkAction get linkAction => $_getN(2);
  @$pb.TagNumber(3)
  set linkAction(TaskLinkAction value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasLinkAction() => $_has(2);
  @$pb.TagNumber(3)
  void clearLinkAction() => $_clearField(3);
  @$pb.TagNumber(3)
  TaskLinkAction ensureLinkAction() => $_ensure(2);
}

class GSTaskItem extends $pb.GeneratedMessage {
  factory GSTaskItem({
    $core.String? name,
    $core.String? awardInfo,
    $core.String? extraInfo,
    $fixnum.Int64? points,
    $core.String? iconUri,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (awardInfo != null) result.awardInfo = awardInfo;
    if (extraInfo != null) result.extraInfo = extraInfo;
    if (points != null) result.points = points;
    if (iconUri != null) result.iconUri = iconUri;
    return result;
  }

  GSTaskItem._();

  factory GSTaskItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GSTaskItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GSTaskItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'awardInfo')
    ..aOS(3, _omitFieldNames ? '' : 'extraInfo')
    ..aInt64(4, _omitFieldNames ? '' : 'points')
    ..aOS(5, _omitFieldNames ? '' : 'iconUri')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSTaskItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSTaskItem copyWith(void Function(GSTaskItem) updates) =>
      super.copyWith((message) => updates(message as GSTaskItem)) as GSTaskItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GSTaskItem create() => GSTaskItem._();
  @$core.override
  GSTaskItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GSTaskItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GSTaskItem>(create);
  static GSTaskItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get awardInfo => $_getSZ(1);
  @$pb.TagNumber(2)
  set awardInfo($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAwardInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearAwardInfo() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get extraInfo => $_getSZ(2);
  @$pb.TagNumber(3)
  set extraInfo($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExtraInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtraInfo() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get points => $_getI64(3);
  @$pb.TagNumber(4)
  set points($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPoints() => $_has(3);
  @$pb.TagNumber(4)
  void clearPoints() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get iconUri => $_getSZ(4);
  @$pb.TagNumber(5)
  set iconUri($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIconUri() => $_has(4);
  @$pb.TagNumber(5)
  void clearIconUri() => $_clearField(5);
}

class TaskLinkAction extends $pb.GeneratedMessage {
  factory TaskLinkAction({
    $core.String? actionDescription,
    $core.String? actionUri,
  }) {
    final result = create();
    if (actionDescription != null) result.actionDescription = actionDescription;
    if (actionUri != null) result.actionUri = actionUri;
    return result;
  }

  TaskLinkAction._();

  factory TaskLinkAction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TaskLinkAction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TaskLinkAction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'actionDescription')
    ..aOS(2, _omitFieldNames ? '' : 'actionUri')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskLinkAction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskLinkAction copyWith(void Function(TaskLinkAction) updates) =>
      super.copyWith((message) => updates(message as TaskLinkAction))
          as TaskLinkAction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskLinkAction create() => TaskLinkAction._();
  @$core.override
  TaskLinkAction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TaskLinkAction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TaskLinkAction>(create);
  static TaskLinkAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get actionDescription => $_getSZ(0);
  @$pb.TagNumber(1)
  set actionDescription($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActionDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearActionDescription() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get actionUri => $_getSZ(1);
  @$pb.TagNumber(2)
  set actionUri($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasActionUri() => $_has(1);
  @$pb.TagNumber(2)
  void clearActionUri() => $_clearField(2);
}

class AgentCommentReq extends $pb.GeneratedMessage {
  factory AgentCommentReq({
    $fixnum.Int64? agentId,
    $core.int? jobScore,
    $core.int? answerScore,
    $core.int? interestScore,
    $core.String? comment,
  }) {
    final result = create();
    if (agentId != null) result.agentId = agentId;
    if (jobScore != null) result.jobScore = jobScore;
    if (answerScore != null) result.answerScore = answerScore;
    if (interestScore != null) result.interestScore = interestScore;
    if (comment != null) result.comment = comment;
    return result;
  }

  AgentCommentReq._();

  factory AgentCommentReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgentCommentReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgentCommentReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'agentId')
    ..aI(2, _omitFieldNames ? '' : 'jobScore')
    ..aI(3, _omitFieldNames ? '' : 'answerScore')
    ..aI(4, _omitFieldNames ? '' : 'interestScore')
    ..aOS(5, _omitFieldNames ? '' : 'comment')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentCommentReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentCommentReq copyWith(void Function(AgentCommentReq) updates) =>
      super.copyWith((message) => updates(message as AgentCommentReq))
          as AgentCommentReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentCommentReq create() => AgentCommentReq._();
  @$core.override
  AgentCommentReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgentCommentReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AgentCommentReq>(create);
  static AgentCommentReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get agentId => $_getI64(0);
  @$pb.TagNumber(1)
  set agentId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAgentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get jobScore => $_getIZ(1);
  @$pb.TagNumber(2)
  set jobScore($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasJobScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearJobScore() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get answerScore => $_getIZ(2);
  @$pb.TagNumber(3)
  set answerScore($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAnswerScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearAnswerScore() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get interestScore => $_getIZ(3);
  @$pb.TagNumber(4)
  set interestScore($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasInterestScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearInterestScore() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get comment => $_getSZ(4);
  @$pb.TagNumber(5)
  set comment($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasComment() => $_has(4);
  @$pb.TagNumber(5)
  void clearComment() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

// This is a generated file - do not edit.
//
// Generated from server_client/gs_task.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'gs_task.pbenum.dart';

class TaskDetailRsp extends $pb.GeneratedMessage {
  factory TaskDetailRsp({
    LastWeekPerformance? lastWeekPerformance,
    $core.Iterable<TaskModuleItem>? list,
  }) {
    final result = create();
    if (lastWeekPerformance != null)
      result.lastWeekPerformance = lastWeekPerformance;
    if (list != null) result.list.addAll(list);
    return result;
  }

  TaskDetailRsp._();

  factory TaskDetailRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TaskDetailRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TaskDetailRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOM<LastWeekPerformance>(1, _omitFieldNames ? '' : 'lastWeekPerformance',
        protoName: 'lastWeekPerformance',
        subBuilder: LastWeekPerformance.create)
    ..pPM<TaskModuleItem>(2, _omitFieldNames ? '' : 'list',
        subBuilder: TaskModuleItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskDetailRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskDetailRsp copyWith(void Function(TaskDetailRsp) updates) =>
      super.copyWith((message) => updates(message as TaskDetailRsp))
          as TaskDetailRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskDetailRsp create() => TaskDetailRsp._();
  @$core.override
  TaskDetailRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TaskDetailRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TaskDetailRsp>(create);
  static TaskDetailRsp? _defaultInstance;

  @$pb.TagNumber(1)
  LastWeekPerformance get lastWeekPerformance => $_getN(0);
  @$pb.TagNumber(1)
  set lastWeekPerformance(LastWeekPerformance value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLastWeekPerformance() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastWeekPerformance() => $_clearField(1);
  @$pb.TagNumber(1)
  LastWeekPerformance ensureLastWeekPerformance() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<TaskModuleItem> get list => $_getList(1);
}

class LastWeekPerformance extends $pb.GeneratedMessage {
  factory LastWeekPerformance({
    $core.double? taskScoreAverage,
    $core.double? returnRate,
    $core.double? surpassRate,
  }) {
    final result = create();
    if (taskScoreAverage != null) result.taskScoreAverage = taskScoreAverage;
    if (returnRate != null) result.returnRate = returnRate;
    if (surpassRate != null) result.surpassRate = surpassRate;
    return result;
  }

  LastWeekPerformance._();

  factory LastWeekPerformance.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LastWeekPerformance.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LastWeekPerformance',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'taskScoreAverage')
    ..aD(2, _omitFieldNames ? '' : 'returnRate')
    ..aD(3, _omitFieldNames ? '' : 'surpassRate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LastWeekPerformance clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LastWeekPerformance copyWith(void Function(LastWeekPerformance) updates) =>
      super.copyWith((message) => updates(message as LastWeekPerformance))
          as LastWeekPerformance;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LastWeekPerformance create() => LastWeekPerformance._();
  @$core.override
  LastWeekPerformance createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LastWeekPerformance getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LastWeekPerformance>(create);
  static LastWeekPerformance? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get taskScoreAverage => $_getN(0);
  @$pb.TagNumber(1)
  set taskScoreAverage($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskScoreAverage() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskScoreAverage() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get returnRate => $_getN(1);
  @$pb.TagNumber(2)
  set returnRate($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReturnRate() => $_has(1);
  @$pb.TagNumber(2)
  void clearReturnRate() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get surpassRate => $_getN(2);
  @$pb.TagNumber(3)
  set surpassRate($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSurpassRate() => $_has(2);
  @$pb.TagNumber(3)
  void clearSurpassRate() => $_clearField(3);
}

class TaskModuleItem extends $pb.GeneratedMessage {
  factory TaskModuleItem({
    $core.String? module,
    $core.double? maxReturnRate,
    $core.Iterable<TaskScoreItem>? tasks,
    $core.String? taskDesc,
  }) {
    final result = create();
    if (module != null) result.module = module;
    if (maxReturnRate != null) result.maxReturnRate = maxReturnRate;
    if (tasks != null) result.tasks.addAll(tasks);
    if (taskDesc != null) result.taskDesc = taskDesc;
    return result;
  }

  TaskModuleItem._();

  factory TaskModuleItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TaskModuleItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TaskModuleItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'module')
    ..aD(2, _omitFieldNames ? '' : 'maxReturnRate')
    ..pPM<TaskScoreItem>(3, _omitFieldNames ? '' : 'tasks',
        subBuilder: TaskScoreItem.create)
    ..aOS(4, _omitFieldNames ? '' : 'taskDesc')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskModuleItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskModuleItem copyWith(void Function(TaskModuleItem) updates) =>
      super.copyWith((message) => updates(message as TaskModuleItem))
          as TaskModuleItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskModuleItem create() => TaskModuleItem._();
  @$core.override
  TaskModuleItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TaskModuleItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TaskModuleItem>(create);
  static TaskModuleItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get module => $_getSZ(0);
  @$pb.TagNumber(1)
  set module($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasModule() => $_has(0);
  @$pb.TagNumber(1)
  void clearModule() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get maxReturnRate => $_getN(1);
  @$pb.TagNumber(2)
  set maxReturnRate($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMaxReturnRate() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxReturnRate() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<TaskScoreItem> get tasks => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get taskDesc => $_getSZ(3);
  @$pb.TagNumber(4)
  set taskDesc($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTaskDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearTaskDesc() => $_clearField(4);
}

class TaskScoreItem extends $pb.GeneratedMessage {
  factory TaskScoreItem({
    $core.String? task,
    $core.double? score,
  }) {
    final result = create();
    if (task != null) result.task = task;
    if (score != null) result.score = score;
    return result;
  }

  TaskScoreItem._();

  factory TaskScoreItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TaskScoreItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TaskScoreItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'task')
    ..aD(2, _omitFieldNames ? '' : 'score')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskScoreItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskScoreItem copyWith(void Function(TaskScoreItem) updates) =>
      super.copyWith((message) => updates(message as TaskScoreItem))
          as TaskScoreItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskScoreItem create() => TaskScoreItem._();
  @$core.override
  TaskScoreItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TaskScoreItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TaskScoreItem>(create);
  static TaskScoreItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get task => $_getSZ(0);
  @$pb.TagNumber(1)
  set task($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get score => $_getN(1);
  @$pb.TagNumber(2)
  set score($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

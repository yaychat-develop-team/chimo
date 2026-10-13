// This is a generated file - do not edit.
//
// Generated from server_client/gs_schedule.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'base.pb.dart' as $1;
import 'user.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class UserScheduleStatusRsp extends $pb.GeneratedMessage {
  factory UserScheduleStatusRsp({
    $core.String? currentScheduleInterval,
    $core.int? status,
    $core.int? reward,
    $core.int? taskScore,
    $core.int? absentInterval,
    ScheduleRoom? assignedRoom,
    $core.int? job,
    $core.Iterable<$0.SimpleUser>? togetherUsers,
    $core.String? scheduleType,
    $core.String? scheduleTypeDesc,
  }) {
    final result = create();
    if (currentScheduleInterval != null)
      result.currentScheduleInterval = currentScheduleInterval;
    if (status != null) result.status = status;
    if (reward != null) result.reward = reward;
    if (taskScore != null) result.taskScore = taskScore;
    if (absentInterval != null) result.absentInterval = absentInterval;
    if (assignedRoom != null) result.assignedRoom = assignedRoom;
    if (job != null) result.job = job;
    if (togetherUsers != null) result.togetherUsers.addAll(togetherUsers);
    if (scheduleType != null) result.scheduleType = scheduleType;
    if (scheduleTypeDesc != null) result.scheduleTypeDesc = scheduleTypeDesc;
    return result;
  }

  UserScheduleStatusRsp._();

  factory UserScheduleStatusRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserScheduleStatusRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserScheduleStatusRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'schedule'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'currentScheduleInterval')
    ..aI(2, _omitFieldNames ? '' : 'status')
    ..aI(3, _omitFieldNames ? '' : 'reward')
    ..aI(4, _omitFieldNames ? '' : 'taskScore')
    ..aI(5, _omitFieldNames ? '' : 'absentInterval')
    ..aOM<ScheduleRoom>(6, _omitFieldNames ? '' : 'assignedRoom',
        subBuilder: ScheduleRoom.create)
    ..aI(7, _omitFieldNames ? '' : 'job')
    ..pPM<$0.SimpleUser>(8, _omitFieldNames ? '' : 'togetherUsers',
        subBuilder: $0.SimpleUser.create)
    ..aOS(9, _omitFieldNames ? '' : 'scheduleType')
    ..aOS(10, _omitFieldNames ? '' : 'scheduleTypeDesc')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserScheduleStatusRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserScheduleStatusRsp copyWith(
          void Function(UserScheduleStatusRsp) updates) =>
      super.copyWith((message) => updates(message as UserScheduleStatusRsp))
          as UserScheduleStatusRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserScheduleStatusRsp create() => UserScheduleStatusRsp._();
  @$core.override
  UserScheduleStatusRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserScheduleStatusRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserScheduleStatusRsp>(create);
  static UserScheduleStatusRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get currentScheduleInterval => $_getSZ(0);
  @$pb.TagNumber(1)
  set currentScheduleInterval($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCurrentScheduleInterval() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentScheduleInterval() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(2)
  set status($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get reward => $_getIZ(2);
  @$pb.TagNumber(3)
  set reward($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReward() => $_has(2);
  @$pb.TagNumber(3)
  void clearReward() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get taskScore => $_getIZ(3);
  @$pb.TagNumber(4)
  set taskScore($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTaskScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearTaskScore() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get absentInterval => $_getIZ(4);
  @$pb.TagNumber(5)
  set absentInterval($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAbsentInterval() => $_has(4);
  @$pb.TagNumber(5)
  void clearAbsentInterval() => $_clearField(5);

  @$pb.TagNumber(6)
  ScheduleRoom get assignedRoom => $_getN(5);
  @$pb.TagNumber(6)
  set assignedRoom(ScheduleRoom value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasAssignedRoom() => $_has(5);
  @$pb.TagNumber(6)
  void clearAssignedRoom() => $_clearField(6);
  @$pb.TagNumber(6)
  ScheduleRoom ensureAssignedRoom() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get job => $_getIZ(6);
  @$pb.TagNumber(7)
  set job($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasJob() => $_has(6);
  @$pb.TagNumber(7)
  void clearJob() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<$0.SimpleUser> get togetherUsers => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get scheduleType => $_getSZ(8);
  @$pb.TagNumber(9)
  set scheduleType($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasScheduleType() => $_has(8);
  @$pb.TagNumber(9)
  void clearScheduleType() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get scheduleTypeDesc => $_getSZ(9);
  @$pb.TagNumber(10)
  set scheduleTypeDesc($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasScheduleTypeDesc() => $_has(9);
  @$pb.TagNumber(10)
  void clearScheduleTypeDesc() => $_clearField(10);
}

class ScheduleListRsp extends $pb.GeneratedMessage {
  factory ScheduleListRsp({
    $core.Iterable<ScheduleItem>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  ScheduleListRsp._();

  factory ScheduleListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'schedule'),
      createEmptyInstance: create)
    ..pPM<ScheduleItem>(3, _omitFieldNames ? '' : 'list',
        subBuilder: ScheduleItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleListRsp copyWith(void Function(ScheduleListRsp) updates) =>
      super.copyWith((message) => updates(message as ScheduleListRsp))
          as ScheduleListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleListRsp create() => ScheduleListRsp._();
  @$core.override
  ScheduleListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduleListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleListRsp>(create);
  static ScheduleListRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $pb.PbList<ScheduleItem> get list => $_getList(0);
}

class ScheduleItem extends $pb.GeneratedMessage {
  factory ScheduleItem({
    $fixnum.Int64? scheduleId,
    $core.int? startTime,
    $core.int? endTime,
    $core.int? lowestTaskScore,
    $core.int? status,
    $core.int? applyScheduleCount,
    $core.String? scheduleTime,
    $core.int? currentMaxTaskScore,
    $core.int? taskScore,
    $core.bool? hasBeenGrab,
  }) {
    final result = create();
    if (scheduleId != null) result.scheduleId = scheduleId;
    if (startTime != null) result.startTime = startTime;
    if (endTime != null) result.endTime = endTime;
    if (lowestTaskScore != null) result.lowestTaskScore = lowestTaskScore;
    if (status != null) result.status = status;
    if (applyScheduleCount != null)
      result.applyScheduleCount = applyScheduleCount;
    if (scheduleTime != null) result.scheduleTime = scheduleTime;
    if (currentMaxTaskScore != null)
      result.currentMaxTaskScore = currentMaxTaskScore;
    if (taskScore != null) result.taskScore = taskScore;
    if (hasBeenGrab != null) result.hasBeenGrab = hasBeenGrab;
    return result;
  }

  ScheduleItem._();

  factory ScheduleItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'schedule'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'scheduleId')
    ..aI(2, _omitFieldNames ? '' : 'startTime')
    ..aI(3, _omitFieldNames ? '' : 'endTime')
    ..aI(4, _omitFieldNames ? '' : 'lowestTaskScore')
    ..aI(5, _omitFieldNames ? '' : 'status')
    ..aI(6, _omitFieldNames ? '' : 'applyScheduleCount')
    ..aOS(7, _omitFieldNames ? '' : 'scheduleTime')
    ..aI(8, _omitFieldNames ? '' : 'currentMaxTaskScore')
    ..aI(9, _omitFieldNames ? '' : 'taskScore')
    ..aOB(10, _omitFieldNames ? '' : 'hasBeenGrab')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleItem copyWith(void Function(ScheduleItem) updates) =>
      super.copyWith((message) => updates(message as ScheduleItem))
          as ScheduleItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleItem create() => ScheduleItem._();
  @$core.override
  ScheduleItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduleItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleItem>(create);
  static ScheduleItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get scheduleId => $_getI64(0);
  @$pb.TagNumber(1)
  set scheduleId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearScheduleId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get startTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set startTime($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTime() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get endTime => $_getIZ(2);
  @$pb.TagNumber(3)
  set endTime($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get lowestTaskScore => $_getIZ(3);
  @$pb.TagNumber(4)
  set lowestTaskScore($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLowestTaskScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearLowestTaskScore() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get status => $_getIZ(4);
  @$pb.TagNumber(5)
  set status($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get applyScheduleCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set applyScheduleCount($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasApplyScheduleCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearApplyScheduleCount() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get scheduleTime => $_getSZ(6);
  @$pb.TagNumber(7)
  set scheduleTime($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasScheduleTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearScheduleTime() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get currentMaxTaskScore => $_getIZ(7);
  @$pb.TagNumber(8)
  set currentMaxTaskScore($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCurrentMaxTaskScore() => $_has(7);
  @$pb.TagNumber(8)
  void clearCurrentMaxTaskScore() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get taskScore => $_getIZ(8);
  @$pb.TagNumber(9)
  set taskScore($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasTaskScore() => $_has(8);
  @$pb.TagNumber(9)
  void clearTaskScore() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get hasBeenGrab => $_getBF(9);
  @$pb.TagNumber(10)
  set hasBeenGrab($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasHasBeenGrab() => $_has(9);
  @$pb.TagNumber(10)
  void clearHasBeenGrab() => $_clearField(10);
}

class ScheduleApplyReq extends $pb.GeneratedMessage {
  factory ScheduleApplyReq({
    $fixnum.Int64? scheduleId,
    $core.int? job,
    $core.int? taskScore,
    $core.String? scheduleType,
  }) {
    final result = create();
    if (scheduleId != null) result.scheduleId = scheduleId;
    if (job != null) result.job = job;
    if (taskScore != null) result.taskScore = taskScore;
    if (scheduleType != null) result.scheduleType = scheduleType;
    return result;
  }

  ScheduleApplyReq._();

  factory ScheduleApplyReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleApplyReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleApplyReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'schedule'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'scheduleId')
    ..aI(2, _omitFieldNames ? '' : 'job')
    ..aI(3, _omitFieldNames ? '' : 'taskScore')
    ..aOS(4, _omitFieldNames ? '' : 'scheduleType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleApplyReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleApplyReq copyWith(void Function(ScheduleApplyReq) updates) =>
      super.copyWith((message) => updates(message as ScheduleApplyReq))
          as ScheduleApplyReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleApplyReq create() => ScheduleApplyReq._();
  @$core.override
  ScheduleApplyReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduleApplyReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleApplyReq>(create);
  static ScheduleApplyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get scheduleId => $_getI64(0);
  @$pb.TagNumber(1)
  set scheduleId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearScheduleId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get job => $_getIZ(1);
  @$pb.TagNumber(2)
  set job($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasJob() => $_has(1);
  @$pb.TagNumber(2)
  void clearJob() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get taskScore => $_getIZ(2);
  @$pb.TagNumber(3)
  set taskScore($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTaskScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearTaskScore() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get scheduleType => $_getSZ(3);
  @$pb.TagNumber(4)
  set scheduleType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasScheduleType() => $_has(3);
  @$pb.TagNumber(4)
  void clearScheduleType() => $_clearField(4);
}

class ScheduleApplyRsp extends $pb.GeneratedMessage {
  factory ScheduleApplyRsp({
    $fixnum.Int64? scheduleId,
    $core.int? job,
    $core.int? taskScore,
    $core.String? scheduleType,
    $core.int? reward,
    $core.String? secretCode,
    $core.int? actualValue,
    $core.int? totalValue,
    $core.int? status,
    $core.bool? hasBeenGrab,
    $core.int? minTaskScore,
  }) {
    final result = create();
    if (scheduleId != null) result.scheduleId = scheduleId;
    if (job != null) result.job = job;
    if (taskScore != null) result.taskScore = taskScore;
    if (scheduleType != null) result.scheduleType = scheduleType;
    if (reward != null) result.reward = reward;
    if (secretCode != null) result.secretCode = secretCode;
    if (actualValue != null) result.actualValue = actualValue;
    if (totalValue != null) result.totalValue = totalValue;
    if (status != null) result.status = status;
    if (hasBeenGrab != null) result.hasBeenGrab = hasBeenGrab;
    if (minTaskScore != null) result.minTaskScore = minTaskScore;
    return result;
  }

  ScheduleApplyRsp._();

  factory ScheduleApplyRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleApplyRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleApplyRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'schedule'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'scheduleId')
    ..aI(2, _omitFieldNames ? '' : 'job')
    ..aI(3, _omitFieldNames ? '' : 'taskScore')
    ..aOS(4, _omitFieldNames ? '' : 'scheduleType')
    ..aI(5, _omitFieldNames ? '' : 'reward')
    ..aOS(6, _omitFieldNames ? '' : 'secretCode')
    ..aI(7, _omitFieldNames ? '' : 'actualValue',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(8, _omitFieldNames ? '' : 'totalValue', fieldType: $pb.PbFieldType.OU3)
    ..aI(9, _omitFieldNames ? '' : 'status')
    ..aOB(10, _omitFieldNames ? '' : 'hasBeenGrab')
    ..aI(11, _omitFieldNames ? '' : 'minTaskScore')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleApplyRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleApplyRsp copyWith(void Function(ScheduleApplyRsp) updates) =>
      super.copyWith((message) => updates(message as ScheduleApplyRsp))
          as ScheduleApplyRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleApplyRsp create() => ScheduleApplyRsp._();
  @$core.override
  ScheduleApplyRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduleApplyRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleApplyRsp>(create);
  static ScheduleApplyRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get scheduleId => $_getI64(0);
  @$pb.TagNumber(1)
  set scheduleId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearScheduleId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get job => $_getIZ(1);
  @$pb.TagNumber(2)
  set job($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasJob() => $_has(1);
  @$pb.TagNumber(2)
  void clearJob() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get taskScore => $_getIZ(2);
  @$pb.TagNumber(3)
  set taskScore($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTaskScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearTaskScore() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get scheduleType => $_getSZ(3);
  @$pb.TagNumber(4)
  set scheduleType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasScheduleType() => $_has(3);
  @$pb.TagNumber(4)
  void clearScheduleType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get reward => $_getIZ(4);
  @$pb.TagNumber(5)
  set reward($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReward() => $_has(4);
  @$pb.TagNumber(5)
  void clearReward() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get secretCode => $_getSZ(5);
  @$pb.TagNumber(6)
  set secretCode($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSecretCode() => $_has(5);
  @$pb.TagNumber(6)
  void clearSecretCode() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get actualValue => $_getIZ(6);
  @$pb.TagNumber(7)
  set actualValue($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasActualValue() => $_has(6);
  @$pb.TagNumber(7)
  void clearActualValue() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get totalValue => $_getIZ(7);
  @$pb.TagNumber(8)
  set totalValue($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTotalValue() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalValue() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get status => $_getIZ(8);
  @$pb.TagNumber(9)
  set status($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearStatus() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get hasBeenGrab => $_getBF(9);
  @$pb.TagNumber(10)
  set hasBeenGrab($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasHasBeenGrab() => $_has(9);
  @$pb.TagNumber(10)
  void clearHasBeenGrab() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get minTaskScore => $_getIZ(10);
  @$pb.TagNumber(11)
  set minTaskScore($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasMinTaskScore() => $_has(10);
  @$pb.TagNumber(11)
  void clearMinTaskScore() => $_clearField(11);
}

class ScheduleApplyRecord extends $pb.GeneratedMessage {
  factory ScheduleApplyRecord({
    $fixnum.Int64? userId,
    $core.String? nickName,
    $core.String? avatar,
    $core.String? gender,
    $fixnum.Int64? scheduleId,
    $core.int? job,
    $core.int? taskScore,
    $core.String? scheduleType,
    $fixnum.Int64? applyId,
    $core.String? applyTime,
    $core.int? status,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (nickName != null) result.nickName = nickName;
    if (avatar != null) result.avatar = avatar;
    if (gender != null) result.gender = gender;
    if (scheduleId != null) result.scheduleId = scheduleId;
    if (job != null) result.job = job;
    if (taskScore != null) result.taskScore = taskScore;
    if (scheduleType != null) result.scheduleType = scheduleType;
    if (applyId != null) result.applyId = applyId;
    if (applyTime != null) result.applyTime = applyTime;
    if (status != null) result.status = status;
    return result;
  }

  ScheduleApplyRecord._();

  factory ScheduleApplyRecord.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleApplyRecord.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleApplyRecord',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'schedule'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'nickName')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'gender')
    ..aInt64(5, _omitFieldNames ? '' : 'scheduleId')
    ..aI(6, _omitFieldNames ? '' : 'job')
    ..aI(7, _omitFieldNames ? '' : 'taskScore')
    ..aOS(8, _omitFieldNames ? '' : 'scheduleType')
    ..aInt64(9, _omitFieldNames ? '' : 'applyId')
    ..aOS(10, _omitFieldNames ? '' : 'applyTime')
    ..aI(11, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleApplyRecord clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleApplyRecord copyWith(void Function(ScheduleApplyRecord) updates) =>
      super.copyWith((message) => updates(message as ScheduleApplyRecord))
          as ScheduleApplyRecord;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleApplyRecord create() => ScheduleApplyRecord._();
  @$core.override
  ScheduleApplyRecord createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduleApplyRecord getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleApplyRecord>(create);
  static ScheduleApplyRecord? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get gender => $_getSZ(3);
  @$pb.TagNumber(4)
  set gender($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get scheduleId => $_getI64(4);
  @$pb.TagNumber(5)
  set scheduleId($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasScheduleId() => $_has(4);
  @$pb.TagNumber(5)
  void clearScheduleId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get job => $_getIZ(5);
  @$pb.TagNumber(6)
  set job($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasJob() => $_has(5);
  @$pb.TagNumber(6)
  void clearJob() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get taskScore => $_getIZ(6);
  @$pb.TagNumber(7)
  set taskScore($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTaskScore() => $_has(6);
  @$pb.TagNumber(7)
  void clearTaskScore() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get scheduleType => $_getSZ(7);
  @$pb.TagNumber(8)
  set scheduleType($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasScheduleType() => $_has(7);
  @$pb.TagNumber(8)
  void clearScheduleType() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get applyId => $_getI64(8);
  @$pb.TagNumber(9)
  set applyId($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasApplyId() => $_has(8);
  @$pb.TagNumber(9)
  void clearApplyId() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get applyTime => $_getSZ(9);
  @$pb.TagNumber(10)
  set applyTime($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasApplyTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearApplyTime() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get status => $_getIZ(10);
  @$pb.TagNumber(11)
  set status($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearStatus() => $_clearField(11);
}

class ScheduleApplyRankRsp extends $pb.GeneratedMessage {
  factory ScheduleApplyRankRsp({
    $1.Page? page,
    $core.Iterable<ScheduleApplyRecord>? list,
    ScheduleApplyRecord? myRecord,
    $core.int? actualValue,
    $core.int? totalValue,
  }) {
    final result = create();
    if (page != null) result.page = page;
    if (list != null) result.list.addAll(list);
    if (myRecord != null) result.myRecord = myRecord;
    if (actualValue != null) result.actualValue = actualValue;
    if (totalValue != null) result.totalValue = totalValue;
    return result;
  }

  ScheduleApplyRankRsp._();

  factory ScheduleApplyRankRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleApplyRankRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleApplyRankRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'schedule'),
      createEmptyInstance: create)
    ..aOM<$1.Page>(1, _omitFieldNames ? '' : 'page', subBuilder: $1.Page.create)
    ..pPM<ScheduleApplyRecord>(2, _omitFieldNames ? '' : 'list',
        subBuilder: ScheduleApplyRecord.create)
    ..aOM<ScheduleApplyRecord>(3, _omitFieldNames ? '' : 'myRecord',
        protoName: 'myRecord', subBuilder: ScheduleApplyRecord.create)
    ..aI(4, _omitFieldNames ? '' : 'actualValue',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'totalValue', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleApplyRankRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleApplyRankRsp copyWith(void Function(ScheduleApplyRankRsp) updates) =>
      super.copyWith((message) => updates(message as ScheduleApplyRankRsp))
          as ScheduleApplyRankRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleApplyRankRsp create() => ScheduleApplyRankRsp._();
  @$core.override
  ScheduleApplyRankRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduleApplyRankRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleApplyRankRsp>(create);
  static ScheduleApplyRankRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Page get page => $_getN(0);
  @$pb.TagNumber(1)
  set page($1.Page value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Page ensurePage() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<ScheduleApplyRecord> get list => $_getList(1);

  @$pb.TagNumber(3)
  ScheduleApplyRecord get myRecord => $_getN(2);
  @$pb.TagNumber(3)
  set myRecord(ScheduleApplyRecord value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMyRecord() => $_has(2);
  @$pb.TagNumber(3)
  void clearMyRecord() => $_clearField(3);
  @$pb.TagNumber(3)
  ScheduleApplyRecord ensureMyRecord() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get actualValue => $_getIZ(3);
  @$pb.TagNumber(4)
  set actualValue($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasActualValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearActualValue() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get totalValue => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalValue($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotalValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalValue() => $_clearField(5);
}

class SchedulePersonalSettingReq extends $pb.GeneratedMessage {
  factory SchedulePersonalSettingReq({
    $core.String? secretCode,
  }) {
    final result = create();
    if (secretCode != null) result.secretCode = secretCode;
    return result;
  }

  SchedulePersonalSettingReq._();

  factory SchedulePersonalSettingReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SchedulePersonalSettingReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SchedulePersonalSettingReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'schedule'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'secretCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SchedulePersonalSettingReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SchedulePersonalSettingReq copyWith(
          void Function(SchedulePersonalSettingReq) updates) =>
      super.copyWith(
              (message) => updates(message as SchedulePersonalSettingReq))
          as SchedulePersonalSettingReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SchedulePersonalSettingReq create() => SchedulePersonalSettingReq._();
  @$core.override
  SchedulePersonalSettingReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SchedulePersonalSettingReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SchedulePersonalSettingReq>(create);
  static SchedulePersonalSettingReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secretCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set secretCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSecretCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecretCode() => $_clearField(1);
}

class ScheduleRoom extends $pb.GeneratedMessage {
  factory ScheduleRoom({
    $fixnum.Int64? id,
    $core.String? title,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    return result;
  }

  ScheduleRoom._();

  factory ScheduleRoom.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleRoom.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleRoom',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'schedule'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleRoom clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleRoom copyWith(void Function(ScheduleRoom) updates) =>
      super.copyWith((message) => updates(message as ScheduleRoom))
          as ScheduleRoom;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleRoom create() => ScheduleRoom._();
  @$core.override
  ScheduleRoom createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduleRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleRoom>(create);
  static ScheduleRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);
}

class ScheduleGsTaskRsp extends $pb.GeneratedMessage {
  factory ScheduleGsTaskRsp({
    $core.bool? inProcessOfSchedule,
    $fixnum.Int64? scheduleId,
    $core.int? score,
    $core.int? absenceSeconds,
    $core.String? scheduleType,
    $core.String? scheduleTime,
    $core.Iterable<TaskItem>? task,
    $core.String? scheduleTypeText,
  }) {
    final result = create();
    if (inProcessOfSchedule != null)
      result.inProcessOfSchedule = inProcessOfSchedule;
    if (scheduleId != null) result.scheduleId = scheduleId;
    if (score != null) result.score = score;
    if (absenceSeconds != null) result.absenceSeconds = absenceSeconds;
    if (scheduleType != null) result.scheduleType = scheduleType;
    if (scheduleTime != null) result.scheduleTime = scheduleTime;
    if (task != null) result.task.addAll(task);
    if (scheduleTypeText != null) result.scheduleTypeText = scheduleTypeText;
    return result;
  }

  ScheduleGsTaskRsp._();

  factory ScheduleGsTaskRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleGsTaskRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleGsTaskRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'schedule'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'inProcessOfSchedule')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'scheduleId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(3, _omitFieldNames ? '' : 'score', fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'absenceSeconds',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'scheduleType')
    ..aOS(6, _omitFieldNames ? '' : 'scheduleTime')
    ..pPM<TaskItem>(7, _omitFieldNames ? '' : 'task',
        subBuilder: TaskItem.create)
    ..aOS(8, _omitFieldNames ? '' : 'scheduleTypeText')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleGsTaskRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleGsTaskRsp copyWith(void Function(ScheduleGsTaskRsp) updates) =>
      super.copyWith((message) => updates(message as ScheduleGsTaskRsp))
          as ScheduleGsTaskRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleGsTaskRsp create() => ScheduleGsTaskRsp._();
  @$core.override
  ScheduleGsTaskRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduleGsTaskRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleGsTaskRsp>(create);
  static ScheduleGsTaskRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get inProcessOfSchedule => $_getBF(0);
  @$pb.TagNumber(1)
  set inProcessOfSchedule($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInProcessOfSchedule() => $_has(0);
  @$pb.TagNumber(1)
  void clearInProcessOfSchedule() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get scheduleId => $_getI64(1);
  @$pb.TagNumber(2)
  set scheduleId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasScheduleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearScheduleId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get score => $_getIZ(2);
  @$pb.TagNumber(3)
  set score($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get absenceSeconds => $_getIZ(3);
  @$pb.TagNumber(4)
  set absenceSeconds($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAbsenceSeconds() => $_has(3);
  @$pb.TagNumber(4)
  void clearAbsenceSeconds() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get scheduleType => $_getSZ(4);
  @$pb.TagNumber(5)
  set scheduleType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasScheduleType() => $_has(4);
  @$pb.TagNumber(5)
  void clearScheduleType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get scheduleTime => $_getSZ(5);
  @$pb.TagNumber(6)
  set scheduleTime($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasScheduleTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearScheduleTime() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<TaskItem> get task => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get scheduleTypeText => $_getSZ(7);
  @$pb.TagNumber(8)
  set scheduleTypeText($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasScheduleTypeText() => $_has(7);
  @$pb.TagNumber(8)
  void clearScheduleTypeText() => $_clearField(8);
}

class TaskItem extends $pb.GeneratedMessage {
  factory TaskItem({
    $fixnum.Int64? actualValue,
    $fixnum.Int64? totalValue,
    $core.String? title,
    $core.String? desc,
    $core.Iterable<ScoreItem>? score,
    $core.String? unitDesc,
  }) {
    final result = create();
    if (actualValue != null) result.actualValue = actualValue;
    if (totalValue != null) result.totalValue = totalValue;
    if (title != null) result.title = title;
    if (desc != null) result.desc = desc;
    if (score != null) result.score.addAll(score);
    if (unitDesc != null) result.unitDesc = unitDesc;
    return result;
  }

  TaskItem._();

  factory TaskItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TaskItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TaskItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'schedule'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'actualValue')
    ..aInt64(2, _omitFieldNames ? '' : 'totalValue')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'desc')
    ..pPM<ScoreItem>(5, _omitFieldNames ? '' : 'score',
        subBuilder: ScoreItem.create)
    ..aOS(6, _omitFieldNames ? '' : 'unitDesc')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskItem copyWith(void Function(TaskItem) updates) =>
      super.copyWith((message) => updates(message as TaskItem)) as TaskItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskItem create() => TaskItem._();
  @$core.override
  TaskItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TaskItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskItem>(create);
  static TaskItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get actualValue => $_getI64(0);
  @$pb.TagNumber(1)
  set actualValue($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActualValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearActualValue() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalValue => $_getI64(1);
  @$pb.TagNumber(2)
  set totalValue($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<ScoreItem> get score => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get unitDesc => $_getSZ(5);
  @$pb.TagNumber(6)
  set unitDesc($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasUnitDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearUnitDesc() => $_clearField(6);
}

class ScoreItem extends $pb.GeneratedMessage {
  factory ScoreItem({
    $core.int? count,
    $core.int? score,
  }) {
    final result = create();
    if (count != null) result.count = count;
    if (score != null) result.score = score;
    return result;
  }

  ScoreItem._();

  factory ScoreItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScoreItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScoreItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'schedule'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'score', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScoreItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScoreItem copyWith(void Function(ScoreItem) updates) =>
      super.copyWith((message) => updates(message as ScoreItem)) as ScoreItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScoreItem create() => ScoreItem._();
  @$core.override
  ScoreItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScoreItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScoreItem>(create);
  static ScoreItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get score => $_getIZ(1);
  @$pb.TagNumber(2)
  set score($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => $_clearField(2);
}

class TypeListData extends $pb.GeneratedMessage {
  factory TypeListData({
    $core.Iterable<ScheduleTypeItem>? type,
  }) {
    final result = create();
    if (type != null) result.type.addAll(type);
    return result;
  }

  TypeListData._();

  factory TypeListData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TypeListData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TypeListData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'schedule'),
      createEmptyInstance: create)
    ..pPM<ScheduleTypeItem>(1, _omitFieldNames ? '' : 'type',
        subBuilder: ScheduleTypeItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TypeListData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TypeListData copyWith(void Function(TypeListData) updates) =>
      super.copyWith((message) => updates(message as TypeListData))
          as TypeListData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TypeListData create() => TypeListData._();
  @$core.override
  TypeListData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TypeListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TypeListData>(create);
  static TypeListData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ScheduleTypeItem> get type => $_getList(0);
}

class ScheduleTypeItem extends $pb.GeneratedMessage {
  factory ScheduleTypeItem({
    $core.String? id,
    $core.String? name,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    return result;
  }

  ScheduleTypeItem._();

  factory ScheduleTypeItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScheduleTypeItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScheduleTypeItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'schedule'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleTypeItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScheduleTypeItem copyWith(void Function(ScheduleTypeItem) updates) =>
      super.copyWith((message) => updates(message as ScheduleTypeItem))
          as ScheduleTypeItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScheduleTypeItem create() => ScheduleTypeItem._();
  @$core.override
  ScheduleTypeItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScheduleTypeItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScheduleTypeItem>(create);
  static ScheduleTypeItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
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
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

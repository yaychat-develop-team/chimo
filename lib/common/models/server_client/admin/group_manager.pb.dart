// This is a generated file - do not edit.
//
// Generated from server_client/admin/group_manager.proto.

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

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GroupListReq extends $pb.GeneratedMessage {
  factory GroupListReq() => create();

  GroupListReq._();

  factory GroupListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupListReq copyWith(void Function(GroupListReq) updates) =>
      super.copyWith((message) => updates(message as GroupListReq))
          as GroupListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupListReq create() => GroupListReq._();
  @$core.override
  GroupListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupListReq>(create);
  static GroupListReq? _defaultInstance;
}

class GroupListResp extends $pb.GeneratedMessage {
  factory GroupListResp({
    $core.Iterable<GroupListItem>? item,
    $0.Pagination? page,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    if (page != null) result.page = page;
    return result;
  }

  GroupListResp._();

  factory GroupListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..pPM<GroupListItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: GroupListItem.create)
    ..aOM<$0.Pagination>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $0.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupListResp copyWith(void Function(GroupListResp) updates) =>
      super.copyWith((message) => updates(message as GroupListResp))
          as GroupListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupListResp create() => GroupListResp._();
  @$core.override
  GroupListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupListResp>(create);
  static GroupListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GroupListItem> get item => $_getList(0);

  @$pb.TagNumber(2)
  $0.Pagination get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($0.Pagination value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Pagination ensurePage() => $_ensure(1);
}

class GroupListItem extends $pb.GeneratedMessage {
  factory GroupListItem({
    $fixnum.Int64? id,
    $core.String? groupName,
    $core.String? superAdminAccount,
    $core.String? superAdminPassword,
    $core.String? bizType,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (groupName != null) result.groupName = groupName;
    if (superAdminAccount != null) result.superAdminAccount = superAdminAccount;
    if (superAdminPassword != null)
      result.superAdminPassword = superAdminPassword;
    if (bizType != null) result.bizType = bizType;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'groupName')
    ..aOS(3, _omitFieldNames ? '' : 'superAdminAccount')
    ..aOS(4, _omitFieldNames ? '' : 'superAdminPassword')
    ..aOS(5, _omitFieldNames ? '' : 'bizType')
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

  /// *
  /// 工会id
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// *
  /// 工会名称
  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => $_clearField(2);

  /// *
  /// 超管账号
  @$pb.TagNumber(3)
  $core.String get superAdminAccount => $_getSZ(2);
  @$pb.TagNumber(3)
  set superAdminAccount($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSuperAdminAccount() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuperAdminAccount() => $_clearField(3);

  /// *
  /// 超管密码
  @$pb.TagNumber(4)
  $core.String get superAdminPassword => $_getSZ(3);
  @$pb.TagNumber(4)
  set superAdminPassword($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSuperAdminPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearSuperAdminPassword() => $_clearField(4);

  /// *
  /// 工会管理模块
  @$pb.TagNumber(5)
  $core.String get bizType => $_getSZ(4);
  @$pb.TagNumber(5)
  set bizType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBizType() => $_has(4);
  @$pb.TagNumber(5)
  void clearBizType() => $_clearField(5);
}

class GroupAddUpdateReq extends $pb.GeneratedMessage {
  factory GroupAddUpdateReq({
    $fixnum.Int64? id,
    $core.String? groupName,
    $core.String? superAdminAccount,
    $core.String? superAdminPassword,
    $core.String? bizType,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (groupName != null) result.groupName = groupName;
    if (superAdminAccount != null) result.superAdminAccount = superAdminAccount;
    if (superAdminPassword != null)
      result.superAdminPassword = superAdminPassword;
    if (bizType != null) result.bizType = bizType;
    return result;
  }

  GroupAddUpdateReq._();

  factory GroupAddUpdateReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupAddUpdateReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupAddUpdateReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'groupName')
    ..aOS(3, _omitFieldNames ? '' : 'superAdminAccount')
    ..aOS(4, _omitFieldNames ? '' : 'superAdminPassword')
    ..aOS(5, _omitFieldNames ? '' : 'bizType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupAddUpdateReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupAddUpdateReq copyWith(void Function(GroupAddUpdateReq) updates) =>
      super.copyWith((message) => updates(message as GroupAddUpdateReq))
          as GroupAddUpdateReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupAddUpdateReq create() => GroupAddUpdateReq._();
  @$core.override
  GroupAddUpdateReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupAddUpdateReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupAddUpdateReq>(create);
  static GroupAddUpdateReq? _defaultInstance;

  /// *
  /// 工会id
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// *
  /// 工会名称
  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => $_clearField(2);

  /// *
  /// 超管账号
  @$pb.TagNumber(3)
  $core.String get superAdminAccount => $_getSZ(2);
  @$pb.TagNumber(3)
  set superAdminAccount($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSuperAdminAccount() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuperAdminAccount() => $_clearField(3);

  /// *
  /// 超管密码
  @$pb.TagNumber(4)
  $core.String get superAdminPassword => $_getSZ(3);
  @$pb.TagNumber(4)
  set superAdminPassword($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSuperAdminPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearSuperAdminPassword() => $_clearField(4);

  /// *
  /// 工会管理模块
  @$pb.TagNumber(5)
  $core.String get bizType => $_getSZ(4);
  @$pb.TagNumber(5)
  set bizType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBizType() => $_has(4);
  @$pb.TagNumber(5)
  void clearBizType() => $_clearField(5);
}

class GearshiftListReq extends $pb.GeneratedMessage {
  factory GearshiftListReq({
    $core.String? gsName,
    $core.String? groupName,
    $core.String? leaderName,
    $core.int? status,
    $fixnum.Int64? beginTime,
    $fixnum.Int64? endTime,
  }) {
    final result = create();
    if (gsName != null) result.gsName = gsName;
    if (groupName != null) result.groupName = groupName;
    if (leaderName != null) result.leaderName = leaderName;
    if (status != null) result.status = status;
    if (beginTime != null) result.beginTime = beginTime;
    if (endTime != null) result.endTime = endTime;
    return result;
  }

  GearshiftListReq._();

  factory GearshiftListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GearshiftListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GearshiftListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gsName')
    ..aOS(2, _omitFieldNames ? '' : 'groupName')
    ..aOS(3, _omitFieldNames ? '' : 'leaderName')
    ..aI(4, _omitFieldNames ? '' : 'status')
    ..aInt64(5, _omitFieldNames ? '' : 'beginTime')
    ..aInt64(6, _omitFieldNames ? '' : 'endTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GearshiftListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GearshiftListReq copyWith(void Function(GearshiftListReq) updates) =>
      super.copyWith((message) => updates(message as GearshiftListReq))
          as GearshiftListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GearshiftListReq create() => GearshiftListReq._();
  @$core.override
  GearshiftListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GearshiftListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GearshiftListReq>(create);
  static GearshiftListReq? _defaultInstance;

  /// *
  /// 嘉宾id or name
  @$pb.TagNumber(1)
  $core.String get gsName => $_getSZ(0);
  @$pb.TagNumber(1)
  set gsName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsName() => $_clearField(1);

  /// *
  /// 工会id or name
  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => $_clearField(2);

  /// *
  /// 会长id or name
  @$pb.TagNumber(3)
  $core.String get leaderName => $_getSZ(2);
  @$pb.TagNumber(3)
  set leaderName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLeaderName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeaderName() => $_clearField(3);

  /// *
  /// 状态
  /// 1 = 已结算
  /// 2 = 未结算
  @$pb.TagNumber(4)
  $core.int get status => $_getIZ(3);
  @$pb.TagNumber(4)
  set status($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  /// *
  /// 结算周期开始
  @$pb.TagNumber(5)
  $fixnum.Int64 get beginTime => $_getI64(4);
  @$pb.TagNumber(5)
  set beginTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBeginTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearBeginTime() => $_clearField(5);

  /// *
  /// 结算周期结束
  @$pb.TagNumber(6)
  $fixnum.Int64 get endTime => $_getI64(5);
  @$pb.TagNumber(6)
  set endTime($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEndTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearEndTime() => $_clearField(6);
}

class GearshiftListResp extends $pb.GeneratedMessage {
  factory GearshiftListResp({
    $core.Iterable<GearshiftListItem>? item,
    $0.Pagination? page,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    if (page != null) result.page = page;
    return result;
  }

  GearshiftListResp._();

  factory GearshiftListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GearshiftListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GearshiftListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..pPM<GearshiftListItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: GearshiftListItem.create)
    ..aOM<$0.Pagination>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $0.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GearshiftListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GearshiftListResp copyWith(void Function(GearshiftListResp) updates) =>
      super.copyWith((message) => updates(message as GearshiftListResp))
          as GearshiftListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GearshiftListResp create() => GearshiftListResp._();
  @$core.override
  GearshiftListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GearshiftListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GearshiftListResp>(create);
  static GearshiftListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GearshiftListItem> get item => $_getList(0);

  @$pb.TagNumber(2)
  $0.Pagination get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($0.Pagination value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Pagination ensurePage() => $_ensure(1);
}

class GearshiftListItem extends $pb.GeneratedMessage {
  factory GearshiftListItem({
    $fixnum.Int64? gsId,
    $core.String? gsName,
    $fixnum.Int64? date,
    $core.String? shiftPeriod,
    $core.String? status,
    $fixnum.Int64? robTime,
    $core.String? gearType,
    $core.int? taskValue,
    $core.String? secretSignal,
    $fixnum.Int64? room,
    $fixnum.Int64? gearTime,
    $fixnum.Int64? bill,
    $fixnum.Int64? taskFraction,
    $core.String? flowTask,
    $fixnum.Int64? receiptOrder,
    $fixnum.Int64? driverWheat,
    $fixnum.Int64? privateChat,
    $fixnum.Int64? receivingOrders,
    $core.String? getPaid,
  }) {
    final result = create();
    if (gsId != null) result.gsId = gsId;
    if (gsName != null) result.gsName = gsName;
    if (date != null) result.date = date;
    if (shiftPeriod != null) result.shiftPeriod = shiftPeriod;
    if (status != null) result.status = status;
    if (robTime != null) result.robTime = robTime;
    if (gearType != null) result.gearType = gearType;
    if (taskValue != null) result.taskValue = taskValue;
    if (secretSignal != null) result.secretSignal = secretSignal;
    if (room != null) result.room = room;
    if (gearTime != null) result.gearTime = gearTime;
    if (bill != null) result.bill = bill;
    if (taskFraction != null) result.taskFraction = taskFraction;
    if (flowTask != null) result.flowTask = flowTask;
    if (receiptOrder != null) result.receiptOrder = receiptOrder;
    if (driverWheat != null) result.driverWheat = driverWheat;
    if (privateChat != null) result.privateChat = privateChat;
    if (receivingOrders != null) result.receivingOrders = receivingOrders;
    if (getPaid != null) result.getPaid = getPaid;
    return result;
  }

  GearshiftListItem._();

  factory GearshiftListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GearshiftListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GearshiftListItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'gsId')
    ..aOS(2, _omitFieldNames ? '' : 'gsName')
    ..aInt64(3, _omitFieldNames ? '' : 'date')
    ..aOS(4, _omitFieldNames ? '' : 'shiftPeriod')
    ..aOS(5, _omitFieldNames ? '' : 'status')
    ..aInt64(6, _omitFieldNames ? '' : 'robTime')
    ..aOS(7, _omitFieldNames ? '' : 'gearType')
    ..aI(8, _omitFieldNames ? '' : 'taskValue')
    ..aOS(9, _omitFieldNames ? '' : 'secretSignal')
    ..aInt64(10, _omitFieldNames ? '' : 'room')
    ..aInt64(11, _omitFieldNames ? '' : 'gearTime')
    ..aInt64(12, _omitFieldNames ? '' : 'bill')
    ..aInt64(13, _omitFieldNames ? '' : 'taskFraction')
    ..aOS(14, _omitFieldNames ? '' : 'flowTask')
    ..aInt64(15, _omitFieldNames ? '' : 'receiptOrder')
    ..aInt64(16, _omitFieldNames ? '' : 'driverWheat')
    ..aInt64(17, _omitFieldNames ? '' : 'privateChat')
    ..aInt64(18, _omitFieldNames ? '' : 'receivingOrders')
    ..aOS(19, _omitFieldNames ? '' : 'getPaid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GearshiftListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GearshiftListItem copyWith(void Function(GearshiftListItem) updates) =>
      super.copyWith((message) => updates(message as GearshiftListItem))
          as GearshiftListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GearshiftListItem create() => GearshiftListItem._();
  @$core.override
  GearshiftListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GearshiftListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GearshiftListItem>(create);
  static GearshiftListItem? _defaultInstance;

  /// *
  /// 嘉宾id
  @$pb.TagNumber(1)
  $fixnum.Int64 get gsId => $_getI64(0);
  @$pb.TagNumber(1)
  set gsId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsId() => $_clearField(1);

  /// *
  /// 用户昵称
  @$pb.TagNumber(2)
  $core.String get gsName => $_getSZ(1);
  @$pb.TagNumber(2)
  set gsName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGsName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGsName() => $_clearField(2);

  /// *
  /// 档位日期
  @$pb.TagNumber(3)
  $fixnum.Int64 get date => $_getI64(2);
  @$pb.TagNumber(3)
  set date($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDate() => $_clearField(3);

  /// *
  /// 档位时段
  @$pb.TagNumber(4)
  $core.String get shiftPeriod => $_getSZ(3);
  @$pb.TagNumber(4)
  set shiftPeriod($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasShiftPeriod() => $_has(3);
  @$pb.TagNumber(4)
  void clearShiftPeriod() => $_clearField(4);

  /// *
  /// 状态 抢档有效、抢档失效、排档中、有效排档、无效排档
  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  /// *
  /// 抢档时间
  @$pb.TagNumber(6)
  $fixnum.Int64 get robTime => $_getI64(5);
  @$pb.TagNumber(6)
  set robTime($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRobTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearRobTime() => $_clearField(6);

  /// *
  /// 档位类型 音乐业务嘉宾、音乐自由嘉宾、情感男厅嘉宾、情感女厅嘉宾、情感自由嘉宾
  @$pb.TagNumber(7)
  $core.String get gearType => $_getSZ(6);
  @$pb.TagNumber(7)
  set gearType($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasGearType() => $_has(6);
  @$pb.TagNumber(7)
  void clearGearType() => $_clearField(7);

  /// *
  /// 任务值
  @$pb.TagNumber(8)
  $core.int get taskValue => $_getIZ(7);
  @$pb.TagNumber(8)
  set taskValue($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTaskValue() => $_has(7);
  @$pb.TagNumber(8)
  void clearTaskValue() => $_clearField(8);

  /// *
  /// 同排暗号
  @$pb.TagNumber(9)
  $core.String get secretSignal => $_getSZ(8);
  @$pb.TagNumber(9)
  set secretSignal($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasSecretSignal() => $_has(8);
  @$pb.TagNumber(9)
  void clearSecretSignal() => $_clearField(9);

  /// *
  /// 分配房间
  @$pb.TagNumber(10)
  $fixnum.Int64 get room => $_getI64(9);
  @$pb.TagNumber(10)
  set room($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasRoom() => $_has(9);
  @$pb.TagNumber(10)
  void clearRoom() => $_clearField(10);

  /// *
  /// 在档时长
  @$pb.TagNumber(11)
  $fixnum.Int64 get gearTime => $_getI64(10);
  @$pb.TagNumber(11)
  set gearTime($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasGearTime() => $_has(10);
  @$pb.TagNumber(11)
  void clearGearTime() => $_clearField(11);

  /// *
  /// 排档期间流水
  @$pb.TagNumber(12)
  $fixnum.Int64 get bill => $_getI64(11);
  @$pb.TagNumber(12)
  set bill($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(12)
  $core.bool hasBill() => $_has(11);
  @$pb.TagNumber(12)
  void clearBill() => $_clearField(12);

  /// *
  /// 任务得分
  @$pb.TagNumber(13)
  $fixnum.Int64 get taskFraction => $_getI64(12);
  @$pb.TagNumber(13)
  set taskFraction($fixnum.Int64 value) => $_setInt64(12, value);
  @$pb.TagNumber(13)
  $core.bool hasTaskFraction() => $_has(12);
  @$pb.TagNumber(13)
  void clearTaskFraction() => $_clearField(13);

  /// *
  /// 流水任务完成
  @$pb.TagNumber(14)
  $core.String get flowTask => $_getSZ(13);
  @$pb.TagNumber(14)
  set flowTask($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasFlowTask() => $_has(13);
  @$pb.TagNumber(14)
  void clearFlowTask() => $_clearField(14);

  /// *
  /// 收到点单完成
  @$pb.TagNumber(15)
  $fixnum.Int64 get receiptOrder => $_getI64(14);
  @$pb.TagNumber(15)
  set receiptOrder($fixnum.Int64 value) => $_setInt64(14, value);
  @$pb.TagNumber(15)
  $core.bool hasReceiptOrder() => $_has(14);
  @$pb.TagNumber(15)
  void clearReceiptOrder() => $_clearField(15);

  /// *
  /// 车手麦上互动完成
  @$pb.TagNumber(16)
  $fixnum.Int64 get driverWheat => $_getI64(15);
  @$pb.TagNumber(16)
  set driverWheat($fixnum.Int64 value) => $_setInt64(15, value);
  @$pb.TagNumber(16)
  $core.bool hasDriverWheat() => $_has(15);
  @$pb.TagNumber(16)
  void clearDriverWheat() => $_clearField(16);

  /// *
  /// 私聊完成
  @$pb.TagNumber(17)
  $fixnum.Int64 get privateChat => $_getI64(16);
  @$pb.TagNumber(17)
  set privateChat($fixnum.Int64 value) => $_setInt64(16, value);
  @$pb.TagNumber(17)
  $core.bool hasPrivateChat() => $_has(16);
  @$pb.TagNumber(17)
  void clearPrivateChat() => $_clearField(17);

  /// *
  /// 接单完成
  @$pb.TagNumber(18)
  $fixnum.Int64 get receivingOrders => $_getI64(17);
  @$pb.TagNumber(18)
  set receivingOrders($fixnum.Int64 value) => $_setInt64(17, value);
  @$pb.TagNumber(18)
  $core.bool hasReceivingOrders() => $_has(17);
  @$pb.TagNumber(18)
  void clearReceivingOrders() => $_clearField(18);

  /// *
  /// 获得酬劳
  @$pb.TagNumber(19)
  $core.String get getPaid => $_getSZ(18);
  @$pb.TagNumber(19)
  set getPaid($core.String value) => $_setString(18, value);
  @$pb.TagNumber(19)
  $core.bool hasGetPaid() => $_has(18);
  @$pb.TagNumber(19)
  void clearGetPaid() => $_clearField(19);
}

class GSListReq extends $pb.GeneratedMessage {
  factory GSListReq({
    $core.String? gsName,
    $core.String? groupName,
    $core.String? leaderName,
    $core.int? status,
    $fixnum.Int64? beginTime,
    $fixnum.Int64? endTime,
  }) {
    final result = create();
    if (gsName != null) result.gsName = gsName;
    if (groupName != null) result.groupName = groupName;
    if (leaderName != null) result.leaderName = leaderName;
    if (status != null) result.status = status;
    if (beginTime != null) result.beginTime = beginTime;
    if (endTime != null) result.endTime = endTime;
    return result;
  }

  GSListReq._();

  factory GSListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GSListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GSListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gsName')
    ..aOS(2, _omitFieldNames ? '' : 'groupName')
    ..aOS(3, _omitFieldNames ? '' : 'leaderName')
    ..aI(4, _omitFieldNames ? '' : 'status')
    ..aInt64(5, _omitFieldNames ? '' : 'beginTime')
    ..aInt64(6, _omitFieldNames ? '' : 'endTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSListReq copyWith(void Function(GSListReq) updates) =>
      super.copyWith((message) => updates(message as GSListReq)) as GSListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GSListReq create() => GSListReq._();
  @$core.override
  GSListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GSListReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GSListReq>(create);
  static GSListReq? _defaultInstance;

  /// *
  /// 嘉宾id or name
  @$pb.TagNumber(1)
  $core.String get gsName => $_getSZ(0);
  @$pb.TagNumber(1)
  set gsName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsName() => $_clearField(1);

  /// *
  /// 工会id or name
  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => $_clearField(2);

  /// *
  /// 会长id or name
  @$pb.TagNumber(3)
  $core.String get leaderName => $_getSZ(2);
  @$pb.TagNumber(3)
  set leaderName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLeaderName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeaderName() => $_clearField(3);

  /// *
  /// 状态
  /// 1 = 已结算
  /// 2 = 未结算
  @$pb.TagNumber(4)
  $core.int get status => $_getIZ(3);
  @$pb.TagNumber(4)
  set status($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  /// *
  /// 结算周期开始
  @$pb.TagNumber(5)
  $fixnum.Int64 get beginTime => $_getI64(4);
  @$pb.TagNumber(5)
  set beginTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBeginTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearBeginTime() => $_clearField(5);

  /// *
  /// 结算周期结束
  @$pb.TagNumber(6)
  $fixnum.Int64 get endTime => $_getI64(5);
  @$pb.TagNumber(6)
  set endTime($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEndTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearEndTime() => $_clearField(6);
}

class GSListResp extends $pb.GeneratedMessage {
  factory GSListResp({
    $core.Iterable<GSListItem>? item,
    $0.Pagination? page,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    if (page != null) result.page = page;
    return result;
  }

  GSListResp._();

  factory GSListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GSListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GSListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..pPM<GSListItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: GSListItem.create)
    ..aOM<$0.Pagination>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $0.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSListResp copyWith(void Function(GSListResp) updates) =>
      super.copyWith((message) => updates(message as GSListResp)) as GSListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GSListResp create() => GSListResp._();
  @$core.override
  GSListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GSListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GSListResp>(create);
  static GSListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GSListItem> get item => $_getList(0);

  @$pb.TagNumber(2)
  $0.Pagination get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($0.Pagination value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Pagination ensurePage() => $_ensure(1);
}

class GSListItem extends $pb.GeneratedMessage {
  factory GSListItem({
    $core.String? settlementPeriod,
    $core.String? gsId,
    $core.String? gsName,
    $core.int? group,
    $fixnum.Int64? leader,
    $fixnum.Int64? bill,
    $core.int? totalGearshift,
    $core.int? validGearshift,
    $core.int? validBusGearshift,
    $core.int? validFreeGearshift,
    $core.int? onlineDuration,
    $core.int? roomDuration,
    $core.int? privateVehicleNum,
    $core.String? rideOrder,
    $core.String? rideGood,
  }) {
    final result = create();
    if (settlementPeriod != null) result.settlementPeriod = settlementPeriod;
    if (gsId != null) result.gsId = gsId;
    if (gsName != null) result.gsName = gsName;
    if (group != null) result.group = group;
    if (leader != null) result.leader = leader;
    if (bill != null) result.bill = bill;
    if (totalGearshift != null) result.totalGearshift = totalGearshift;
    if (validGearshift != null) result.validGearshift = validGearshift;
    if (validBusGearshift != null) result.validBusGearshift = validBusGearshift;
    if (validFreeGearshift != null)
      result.validFreeGearshift = validFreeGearshift;
    if (onlineDuration != null) result.onlineDuration = onlineDuration;
    if (roomDuration != null) result.roomDuration = roomDuration;
    if (privateVehicleNum != null) result.privateVehicleNum = privateVehicleNum;
    if (rideOrder != null) result.rideOrder = rideOrder;
    if (rideGood != null) result.rideGood = rideGood;
    return result;
  }

  GSListItem._();

  factory GSListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GSListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GSListItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'settlementPeriod')
    ..aOS(2, _omitFieldNames ? '' : 'gsId')
    ..aOS(3, _omitFieldNames ? '' : 'gsName')
    ..aI(4, _omitFieldNames ? '' : 'group')
    ..aInt64(5, _omitFieldNames ? '' : 'leader')
    ..aInt64(6, _omitFieldNames ? '' : 'bill')
    ..aI(7, _omitFieldNames ? '' : 'totalGearshift')
    ..aI(8, _omitFieldNames ? '' : 'validGearshift')
    ..aI(9, _omitFieldNames ? '' : 'validBusGearshift')
    ..aI(10, _omitFieldNames ? '' : 'validFreeGearshift')
    ..aI(11, _omitFieldNames ? '' : 'onlineDuration')
    ..aI(12, _omitFieldNames ? '' : 'roomDuration')
    ..aI(13, _omitFieldNames ? '' : 'privateVehicleNum')
    ..aOS(14, _omitFieldNames ? '' : 'rideOrder')
    ..aOS(15, _omitFieldNames ? '' : 'rideGood')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSListItem copyWith(void Function(GSListItem) updates) =>
      super.copyWith((message) => updates(message as GSListItem)) as GSListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GSListItem create() => GSListItem._();
  @$core.override
  GSListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GSListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GSListItem>(create);
  static GSListItem? _defaultInstance;

  /// *
  /// 结算周期
  @$pb.TagNumber(1)
  $core.String get settlementPeriod => $_getSZ(0);
  @$pb.TagNumber(1)
  set settlementPeriod($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSettlementPeriod() => $_has(0);
  @$pb.TagNumber(1)
  void clearSettlementPeriod() => $_clearField(1);

  /// *
  /// 嘉宾id
  @$pb.TagNumber(2)
  $core.String get gsId => $_getSZ(1);
  @$pb.TagNumber(2)
  set gsId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGsId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGsId() => $_clearField(2);

  /// *
  /// 嘉宾昵称
  @$pb.TagNumber(3)
  $core.String get gsName => $_getSZ(2);
  @$pb.TagNumber(3)
  set gsName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGsName() => $_has(2);
  @$pb.TagNumber(3)
  void clearGsName() => $_clearField(3);

  /// *
  /// 工会
  @$pb.TagNumber(4)
  $core.int get group => $_getIZ(3);
  @$pb.TagNumber(4)
  set group($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGroup() => $_has(3);
  @$pb.TagNumber(4)
  void clearGroup() => $_clearField(4);

  /// *
  /// 会长
  @$pb.TagNumber(5)
  $fixnum.Int64 get leader => $_getI64(4);
  @$pb.TagNumber(5)
  set leader($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLeader() => $_has(4);
  @$pb.TagNumber(5)
  void clearLeader() => $_clearField(5);

  /// *
  /// 流水
  @$pb.TagNumber(6)
  $fixnum.Int64 get bill => $_getI64(5);
  @$pb.TagNumber(6)
  set bill($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBill() => $_has(5);
  @$pb.TagNumber(6)
  void clearBill() => $_clearField(6);

  /// *
  /// 总排挡
  @$pb.TagNumber(7)
  $core.int get totalGearshift => $_getIZ(6);
  @$pb.TagNumber(7)
  set totalGearshift($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTotalGearshift() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalGearshift() => $_clearField(7);

  /// *
  /// 有效排挡
  @$pb.TagNumber(8)
  $core.int get validGearshift => $_getIZ(7);
  @$pb.TagNumber(8)
  set validGearshift($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasValidGearshift() => $_has(7);
  @$pb.TagNumber(8)
  void clearValidGearshift() => $_clearField(8);

  /// *
  /// 有效业务排挡
  @$pb.TagNumber(9)
  $core.int get validBusGearshift => $_getIZ(8);
  @$pb.TagNumber(9)
  set validBusGearshift($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasValidBusGearshift() => $_has(8);
  @$pb.TagNumber(9)
  void clearValidBusGearshift() => $_clearField(9);

  /// *
  /// 有效自由排
  @$pb.TagNumber(10)
  $core.int get validFreeGearshift => $_getIZ(9);
  @$pb.TagNumber(10)
  set validFreeGearshift($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasValidFreeGearshift() => $_has(9);
  @$pb.TagNumber(10)
  void clearValidFreeGearshift() => $_clearField(10);

  /// *
  /// 在线时长
  @$pb.TagNumber(11)
  $core.int get onlineDuration => $_getIZ(10);
  @$pb.TagNumber(11)
  set onlineDuration($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasOnlineDuration() => $_has(10);
  @$pb.TagNumber(11)
  void clearOnlineDuration() => $_clearField(11);

  /// *
  /// 在房时长
  @$pb.TagNumber(12)
  $core.int get roomDuration => $_getIZ(11);
  @$pb.TagNumber(12)
  set roomDuration($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasRoomDuration() => $_has(11);
  @$pb.TagNumber(12)
  void clearRoomDuration() => $_clearField(12);

  /// *
  /// 私聊车手数
  @$pb.TagNumber(13)
  $core.int get privateVehicleNum => $_getIZ(12);
  @$pb.TagNumber(13)
  set privateVehicleNum($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasPrivateVehicleNum() => $_has(12);
  @$pb.TagNumber(13)
  void clearPrivateVehicleNum() => $_clearField(13);

  /// *
  /// 兜风单
  @$pb.TagNumber(14)
  $core.String get rideOrder => $_getSZ(13);
  @$pb.TagNumber(14)
  set rideOrder($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasRideOrder() => $_has(13);
  @$pb.TagNumber(14)
  void clearRideOrder() => $_clearField(14);

  /// *
  /// 兜风单好评
  @$pb.TagNumber(15)
  $core.String get rideGood => $_getSZ(14);
  @$pb.TagNumber(15)
  set rideGood($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasRideGood() => $_has(14);
  @$pb.TagNumber(15)
  void clearRideGood() => $_clearField(15);
}

class Settlement2GSWalletReq extends $pb.GeneratedMessage {
  factory Settlement2GSWalletReq() => create();

  Settlement2GSWalletReq._();

  factory Settlement2GSWalletReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Settlement2GSWalletReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Settlement2GSWalletReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Settlement2GSWalletReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Settlement2GSWalletReq copyWith(
          void Function(Settlement2GSWalletReq) updates) =>
      super.copyWith((message) => updates(message as Settlement2GSWalletReq))
          as Settlement2GSWalletReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Settlement2GSWalletReq create() => Settlement2GSWalletReq._();
  @$core.override
  Settlement2GSWalletReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Settlement2GSWalletReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Settlement2GSWalletReq>(create);
  static Settlement2GSWalletReq? _defaultInstance;
}

class BusRoomListReq extends $pb.GeneratedMessage {
  factory BusRoomListReq({
    $core.String? gsName,
    $core.String? groupName,
    $core.String? leaderName,
  }) {
    final result = create();
    if (gsName != null) result.gsName = gsName;
    if (groupName != null) result.groupName = groupName;
    if (leaderName != null) result.leaderName = leaderName;
    return result;
  }

  BusRoomListReq._();

  factory BusRoomListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BusRoomListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BusRoomListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gsName')
    ..aOS(2, _omitFieldNames ? '' : 'groupName')
    ..aOS(3, _omitFieldNames ? '' : 'leaderName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusRoomListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusRoomListReq copyWith(void Function(BusRoomListReq) updates) =>
      super.copyWith((message) => updates(message as BusRoomListReq))
          as BusRoomListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusRoomListReq create() => BusRoomListReq._();
  @$core.override
  BusRoomListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BusRoomListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BusRoomListReq>(create);
  static BusRoomListReq? _defaultInstance;

  /// *
  /// 嘉宾id or name
  @$pb.TagNumber(1)
  $core.String get gsName => $_getSZ(0);
  @$pb.TagNumber(1)
  set gsName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsName() => $_clearField(1);

  /// *
  /// 工会id or name
  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => $_clearField(2);

  /// *
  /// 会长id or name
  @$pb.TagNumber(3)
  $core.String get leaderName => $_getSZ(2);
  @$pb.TagNumber(3)
  set leaderName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLeaderName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeaderName() => $_clearField(3);
}

class BusRoomListResp extends $pb.GeneratedMessage {
  factory BusRoomListResp({
    $core.Iterable<BusRoomListItem>? item,
    $0.Pagination? page,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    if (page != null) result.page = page;
    return result;
  }

  BusRoomListResp._();

  factory BusRoomListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BusRoomListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BusRoomListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..pPM<BusRoomListItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: BusRoomListItem.create)
    ..aOM<$0.Pagination>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $0.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusRoomListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusRoomListResp copyWith(void Function(BusRoomListResp) updates) =>
      super.copyWith((message) => updates(message as BusRoomListResp))
          as BusRoomListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusRoomListResp create() => BusRoomListResp._();
  @$core.override
  BusRoomListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BusRoomListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BusRoomListResp>(create);
  static BusRoomListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BusRoomListItem> get item => $_getList(0);

  @$pb.TagNumber(2)
  $0.Pagination get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($0.Pagination value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Pagination ensurePage() => $_ensure(1);
}

class BusRoomListItem extends $pb.GeneratedMessage {
  factory BusRoomListItem({
    $fixnum.Int64? roomId,
    $core.String? roomName,
    $core.String? roomType,
    $core.String? business,
    $core.String? date,
    $core.int? timeInterval,
    $core.String? host,
    $core.String? bill,
    $core.int? roomVehicle,
    $core.int? wheatVehicle,
    $core.int? payVehicle,
    $core.int? achieveHundredsVehicle,
    $core.int? achieveHundredsNewVehicle,
    $core.int? wheatInteraction,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (roomName != null) result.roomName = roomName;
    if (roomType != null) result.roomType = roomType;
    if (business != null) result.business = business;
    if (date != null) result.date = date;
    if (timeInterval != null) result.timeInterval = timeInterval;
    if (host != null) result.host = host;
    if (bill != null) result.bill = bill;
    if (roomVehicle != null) result.roomVehicle = roomVehicle;
    if (wheatVehicle != null) result.wheatVehicle = wheatVehicle;
    if (payVehicle != null) result.payVehicle = payVehicle;
    if (achieveHundredsVehicle != null)
      result.achieveHundredsVehicle = achieveHundredsVehicle;
    if (achieveHundredsNewVehicle != null)
      result.achieveHundredsNewVehicle = achieveHundredsNewVehicle;
    if (wheatInteraction != null) result.wheatInteraction = wheatInteraction;
    return result;
  }

  BusRoomListItem._();

  factory BusRoomListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BusRoomListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BusRoomListItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aOS(2, _omitFieldNames ? '' : 'roomName')
    ..aOS(3, _omitFieldNames ? '' : 'roomType')
    ..aOS(4, _omitFieldNames ? '' : 'business')
    ..aOS(5, _omitFieldNames ? '' : 'date')
    ..aI(6, _omitFieldNames ? '' : 'timeInterval')
    ..aOS(7, _omitFieldNames ? '' : 'host')
    ..aOS(8, _omitFieldNames ? '' : 'bill')
    ..aI(9, _omitFieldNames ? '' : 'roomVehicle')
    ..aI(10, _omitFieldNames ? '' : 'wheatVehicle')
    ..aI(11, _omitFieldNames ? '' : 'payVehicle')
    ..aI(12, _omitFieldNames ? '' : 'achieveHundredsVehicle')
    ..aI(13, _omitFieldNames ? '' : 'achieveHundredsNewVehicle')
    ..aI(14, _omitFieldNames ? '' : 'wheatInteraction')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusRoomListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusRoomListItem copyWith(void Function(BusRoomListItem) updates) =>
      super.copyWith((message) => updates(message as BusRoomListItem))
          as BusRoomListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusRoomListItem create() => BusRoomListItem._();
  @$core.override
  BusRoomListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BusRoomListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BusRoomListItem>(create);
  static BusRoomListItem? _defaultInstance;

  /// *
  /// 房间ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  /// *
  /// 房间名称
  @$pb.TagNumber(2)
  $core.String get roomName => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomName() => $_clearField(2);

  /// *
  /// 房间类型
  @$pb.TagNumber(3)
  $core.String get roomType => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomType() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomType() => $_clearField(3);

  /// *
  /// 所属业务
  @$pb.TagNumber(4)
  $core.String get business => $_getSZ(3);
  @$pb.TagNumber(4)
  set business($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBusiness() => $_has(3);
  @$pb.TagNumber(4)
  void clearBusiness() => $_clearField(4);

  /// *
  /// 日期
  @$pb.TagNumber(5)
  $core.String get date => $_getSZ(4);
  @$pb.TagNumber(5)
  set date($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearDate() => $_clearField(5);

  /// *
  /// 时段
  @$pb.TagNumber(6)
  $core.int get timeInterval => $_getIZ(5);
  @$pb.TagNumber(6)
  set timeInterval($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTimeInterval() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimeInterval() => $_clearField(6);

  /// *
  /// 主持
  @$pb.TagNumber(7)
  $core.String get host => $_getSZ(6);
  @$pb.TagNumber(7)
  set host($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasHost() => $_has(6);
  @$pb.TagNumber(7)
  void clearHost() => $_clearField(7);

  /// *
  /// 流水
  @$pb.TagNumber(8)
  $core.String get bill => $_getSZ(7);
  @$pb.TagNumber(8)
  set bill($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasBill() => $_has(7);
  @$pb.TagNumber(8)
  void clearBill() => $_clearField(8);

  /// *
  /// 进房车手数
  @$pb.TagNumber(9)
  $core.int get roomVehicle => $_getIZ(8);
  @$pb.TagNumber(9)
  set roomVehicle($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasRoomVehicle() => $_has(8);
  @$pb.TagNumber(9)
  void clearRoomVehicle() => $_clearField(9);

  /// *
  /// 上麦车手数
  @$pb.TagNumber(10)
  $core.int get wheatVehicle => $_getIZ(9);
  @$pb.TagNumber(10)
  set wheatVehicle($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasWheatVehicle() => $_has(9);
  @$pb.TagNumber(10)
  void clearWheatVehicle() => $_clearField(10);

  /// *
  /// 付费车手数
  @$pb.TagNumber(11)
  $core.int get payVehicle => $_getIZ(10);
  @$pb.TagNumber(11)
  set payVehicle($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasPayVehicle() => $_has(10);
  @$pb.TagNumber(11)
  void clearPayVehicle() => $_clearField(11);

  /// *
  /// 破百车手数
  @$pb.TagNumber(12)
  $core.int get achieveHundredsVehicle => $_getIZ(11);
  @$pb.TagNumber(12)
  set achieveHundredsVehicle($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasAchieveHundredsVehicle() => $_has(11);
  @$pb.TagNumber(12)
  void clearAchieveHundredsVehicle() => $_clearField(12);

  /// *
  /// 破百新车手数
  @$pb.TagNumber(13)
  $core.int get achieveHundredsNewVehicle => $_getIZ(12);
  @$pb.TagNumber(13)
  set achieveHundredsNewVehicle($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasAchieveHundredsNewVehicle() => $_has(12);
  @$pb.TagNumber(13)
  void clearAchieveHundredsNewVehicle() => $_clearField(13);

  /// *
  /// 全麦互动数
  @$pb.TagNumber(14)
  $core.int get wheatInteraction => $_getIZ(13);
  @$pb.TagNumber(14)
  set wheatInteraction($core.int value) => $_setSignedInt32(13, value);
  @$pb.TagNumber(14)
  $core.bool hasWheatInteraction() => $_has(13);
  @$pb.TagNumber(14)
  void clearWheatInteraction() => $_clearField(14);
}

class GSStatisticsListReq extends $pb.GeneratedMessage {
  factory GSStatisticsListReq({
    $core.String? gsName,
    $core.String? groupName,
    $core.String? leaderName,
  }) {
    final result = create();
    if (gsName != null) result.gsName = gsName;
    if (groupName != null) result.groupName = groupName;
    if (leaderName != null) result.leaderName = leaderName;
    return result;
  }

  GSStatisticsListReq._();

  factory GSStatisticsListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GSStatisticsListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GSStatisticsListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gsName')
    ..aOS(2, _omitFieldNames ? '' : 'groupName')
    ..aOS(3, _omitFieldNames ? '' : 'leaderName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSStatisticsListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSStatisticsListReq copyWith(void Function(GSStatisticsListReq) updates) =>
      super.copyWith((message) => updates(message as GSStatisticsListReq))
          as GSStatisticsListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GSStatisticsListReq create() => GSStatisticsListReq._();
  @$core.override
  GSStatisticsListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GSStatisticsListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GSStatisticsListReq>(create);
  static GSStatisticsListReq? _defaultInstance;

  /// *
  /// 嘉宾id or name
  @$pb.TagNumber(1)
  $core.String get gsName => $_getSZ(0);
  @$pb.TagNumber(1)
  set gsName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsName() => $_clearField(1);

  /// *
  /// 工会id or name
  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => $_clearField(2);

  /// *
  /// 会长id or name
  @$pb.TagNumber(3)
  $core.String get leaderName => $_getSZ(2);
  @$pb.TagNumber(3)
  set leaderName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLeaderName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeaderName() => $_clearField(3);
}

class GSStatisticsListResp extends $pb.GeneratedMessage {
  factory GSStatisticsListResp({
    $core.Iterable<GSStatisticsListItem>? item,
    $0.Pagination? page,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    if (page != null) result.page = page;
    return result;
  }

  GSStatisticsListResp._();

  factory GSStatisticsListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GSStatisticsListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GSStatisticsListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..pPM<GSStatisticsListItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: GSStatisticsListItem.create)
    ..aOM<$0.Pagination>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $0.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSStatisticsListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSStatisticsListResp copyWith(void Function(GSStatisticsListResp) updates) =>
      super.copyWith((message) => updates(message as GSStatisticsListResp))
          as GSStatisticsListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GSStatisticsListResp create() => GSStatisticsListResp._();
  @$core.override
  GSStatisticsListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GSStatisticsListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GSStatisticsListResp>(create);
  static GSStatisticsListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GSStatisticsListItem> get item => $_getList(0);

  @$pb.TagNumber(2)
  $0.Pagination get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($0.Pagination value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Pagination ensurePage() => $_ensure(1);
}

class GSStatisticsListItem extends $pb.GeneratedMessage {
  factory GSStatisticsListItem({
    $core.String? gsId,
    $core.String? gdName,
    $core.String? group,
    $core.String? leader,
    $fixnum.Int64? vehicle,
    $core.String? lose,
    $core.String? consumptionHareIncome,
    $core.String? carBuyingHareIncome,
  }) {
    final result = create();
    if (gsId != null) result.gsId = gsId;
    if (gdName != null) result.gdName = gdName;
    if (group != null) result.group = group;
    if (leader != null) result.leader = leader;
    if (vehicle != null) result.vehicle = vehicle;
    if (lose != null) result.lose = lose;
    if (consumptionHareIncome != null)
      result.consumptionHareIncome = consumptionHareIncome;
    if (carBuyingHareIncome != null)
      result.carBuyingHareIncome = carBuyingHareIncome;
    return result;
  }

  GSStatisticsListItem._();

  factory GSStatisticsListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GSStatisticsListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GSStatisticsListItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gsId')
    ..aOS(2, _omitFieldNames ? '' : 'gdName')
    ..aOS(3, _omitFieldNames ? '' : 'group')
    ..aOS(4, _omitFieldNames ? '' : 'leader')
    ..aInt64(5, _omitFieldNames ? '' : 'vehicle')
    ..aOS(6, _omitFieldNames ? '' : 'lose')
    ..aOS(7, _omitFieldNames ? '' : 'consumptionHareIncome')
    ..aOS(8, _omitFieldNames ? '' : 'carBuyingHareIncome',
        protoName: 'car_Buying_hare_income')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSStatisticsListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSStatisticsListItem copyWith(void Function(GSStatisticsListItem) updates) =>
      super.copyWith((message) => updates(message as GSStatisticsListItem))
          as GSStatisticsListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GSStatisticsListItem create() => GSStatisticsListItem._();
  @$core.override
  GSStatisticsListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GSStatisticsListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GSStatisticsListItem>(create);
  static GSStatisticsListItem? _defaultInstance;

  /// *
  /// 陪伴师uid
  @$pb.TagNumber(1)
  $core.String get gsId => $_getSZ(0);
  @$pb.TagNumber(1)
  set gsId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsId() => $_clearField(1);

  /// *
  /// 昵称
  @$pb.TagNumber(2)
  $core.String get gdName => $_getSZ(1);
  @$pb.TagNumber(2)
  set gdName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGdName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGdName() => $_clearField(2);

  /// *
  /// 所属公会
  @$pb.TagNumber(3)
  $core.String get group => $_getSZ(2);
  @$pb.TagNumber(3)
  set group($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGroup() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroup() => $_clearField(3);

  /// *
  /// 所属会长
  @$pb.TagNumber(4)
  $core.String get leader => $_getSZ(3);
  @$pb.TagNumber(4)
  set leader($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLeader() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeader() => $_clearField(4);

  /// *
  /// 已分配车手
  @$pb.TagNumber(5)
  $fixnum.Int64 get vehicle => $_getI64(4);
  @$pb.TagNumber(5)
  set vehicle($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVehicle() => $_has(4);
  @$pb.TagNumber(5)
  void clearVehicle() => $_clearField(5);

  /// *
  /// 已丢单
  @$pb.TagNumber(6)
  $core.String get lose => $_getSZ(5);
  @$pb.TagNumber(6)
  set lose($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLose() => $_has(5);
  @$pb.TagNumber(6)
  void clearLose() => $_clearField(6);

  /// *
  /// 消费分成收益
  @$pb.TagNumber(7)
  $core.String get consumptionHareIncome => $_getSZ(6);
  @$pb.TagNumber(7)
  set consumptionHareIncome($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasConsumptionHareIncome() => $_has(6);
  @$pb.TagNumber(7)
  void clearConsumptionHareIncome() => $_clearField(7);

  /// *
  /// 购车分成收益
  @$pb.TagNumber(8)
  $core.String get carBuyingHareIncome => $_getSZ(7);
  @$pb.TagNumber(8)
  set carBuyingHareIncome($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCarBuyingHareIncome() => $_has(7);
  @$pb.TagNumber(8)
  void clearCarBuyingHareIncome() => $_clearField(8);
}

class GSVehicleDetailListReq extends $pb.GeneratedMessage {
  factory GSVehicleDetailListReq({
    $core.String? gsName,
    $core.String? groupName,
  }) {
    final result = create();
    if (gsName != null) result.gsName = gsName;
    if (groupName != null) result.groupName = groupName;
    return result;
  }

  GSVehicleDetailListReq._();

  factory GSVehicleDetailListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GSVehicleDetailListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GSVehicleDetailListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gsName')
    ..aOS(2, _omitFieldNames ? '' : 'groupName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSVehicleDetailListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSVehicleDetailListReq copyWith(
          void Function(GSVehicleDetailListReq) updates) =>
      super.copyWith((message) => updates(message as GSVehicleDetailListReq))
          as GSVehicleDetailListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GSVehicleDetailListReq create() => GSVehicleDetailListReq._();
  @$core.override
  GSVehicleDetailListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GSVehicleDetailListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GSVehicleDetailListReq>(create);
  static GSVehicleDetailListReq? _defaultInstance;

  /// *
  /// 嘉宾id or name
  @$pb.TagNumber(1)
  $core.String get gsName => $_getSZ(0);
  @$pb.TagNumber(1)
  set gsName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsName() => $_clearField(1);

  /// *
  /// 工会id or name
  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => $_clearField(2);
}

class GSVehicleDetailListResp extends $pb.GeneratedMessage {
  factory GSVehicleDetailListResp({
    $core.Iterable<GSVehicleDetailItem>? item,
    $0.Pagination? page,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    if (page != null) result.page = page;
    return result;
  }

  GSVehicleDetailListResp._();

  factory GSVehicleDetailListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GSVehicleDetailListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GSVehicleDetailListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..pPM<GSVehicleDetailItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: GSVehicleDetailItem.create)
    ..aOM<$0.Pagination>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $0.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSVehicleDetailListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSVehicleDetailListResp copyWith(
          void Function(GSVehicleDetailListResp) updates) =>
      super.copyWith((message) => updates(message as GSVehicleDetailListResp))
          as GSVehicleDetailListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GSVehicleDetailListResp create() => GSVehicleDetailListResp._();
  @$core.override
  GSVehicleDetailListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GSVehicleDetailListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GSVehicleDetailListResp>(create);
  static GSVehicleDetailListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GSVehicleDetailItem> get item => $_getList(0);

  @$pb.TagNumber(2)
  $0.Pagination get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($0.Pagination value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Pagination ensurePage() => $_ensure(1);
}

class GSVehicleDetailItem extends $pb.GeneratedMessage {
  factory GSVehicleDetailItem() => create();

  GSVehicleDetailItem._();

  factory GSVehicleDetailItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GSVehicleDetailItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GSVehicleDetailItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSVehicleDetailItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSVehicleDetailItem copyWith(void Function(GSVehicleDetailItem) updates) =>
      super.copyWith((message) => updates(message as GSVehicleDetailItem))
          as GSVehicleDetailItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GSVehicleDetailItem create() => GSVehicleDetailItem._();
  @$core.override
  GSVehicleDetailItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GSVehicleDetailItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GSVehicleDetailItem>(create);
  static GSVehicleDetailItem? _defaultInstance;
}

class GSVehicleDetailSettlement2GSWalletReq extends $pb.GeneratedMessage {
  factory GSVehicleDetailSettlement2GSWalletReq() => create();

  GSVehicleDetailSettlement2GSWalletReq._();

  factory GSVehicleDetailSettlement2GSWalletReq.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GSVehicleDetailSettlement2GSWalletReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GSVehicleDetailSettlement2GSWalletReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSVehicleDetailSettlement2GSWalletReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GSVehicleDetailSettlement2GSWalletReq copyWith(
          void Function(GSVehicleDetailSettlement2GSWalletReq) updates) =>
      super.copyWith((message) =>
              updates(message as GSVehicleDetailSettlement2GSWalletReq))
          as GSVehicleDetailSettlement2GSWalletReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GSVehicleDetailSettlement2GSWalletReq create() =>
      GSVehicleDetailSettlement2GSWalletReq._();
  @$core.override
  GSVehicleDetailSettlement2GSWalletReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GSVehicleDetailSettlement2GSWalletReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GSVehicleDetailSettlement2GSWalletReq>(create);
  static GSVehicleDetailSettlement2GSWalletReq? _defaultInstance;
}

class RideListReq extends $pb.GeneratedMessage {
  factory RideListReq({
    $core.String? gsName,
    $core.String? groupName,
  }) {
    final result = create();
    if (gsName != null) result.gsName = gsName;
    if (groupName != null) result.groupName = groupName;
    return result;
  }

  RideListReq._();

  factory RideListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gsName')
    ..aOS(2, _omitFieldNames ? '' : 'groupName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideListReq copyWith(void Function(RideListReq) updates) =>
      super.copyWith((message) => updates(message as RideListReq))
          as RideListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideListReq create() => RideListReq._();
  @$core.override
  RideListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideListReq>(create);
  static RideListReq? _defaultInstance;

  /// *
  /// 嘉宾id or name
  @$pb.TagNumber(1)
  $core.String get gsName => $_getSZ(0);
  @$pb.TagNumber(1)
  set gsName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsName() => $_clearField(1);

  /// *
  /// 工会id or name
  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => $_clearField(2);
}

class RideListResp extends $pb.GeneratedMessage {
  factory RideListResp({
    $core.Iterable<RideListItem>? item,
    $0.Pagination? page,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    if (page != null) result.page = page;
    return result;
  }

  RideListResp._();

  factory RideListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..pPM<RideListItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: RideListItem.create)
    ..aOM<$0.Pagination>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $0.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideListResp copyWith(void Function(RideListResp) updates) =>
      super.copyWith((message) => updates(message as RideListResp))
          as RideListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideListResp create() => RideListResp._();
  @$core.override
  RideListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideListResp>(create);
  static RideListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RideListItem> get item => $_getList(0);

  @$pb.TagNumber(2)
  $0.Pagination get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($0.Pagination value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Pagination ensurePage() => $_ensure(1);
}

class RideListItem extends $pb.GeneratedMessage {
  factory RideListItem() => create();

  RideListItem._();

  factory RideListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideListItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideListItem copyWith(void Function(RideListItem) updates) =>
      super.copyWith((message) => updates(message as RideListItem))
          as RideListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideListItem create() => RideListItem._();
  @$core.override
  RideListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideListItem>(create);
  static RideListItem? _defaultInstance;
}

class RideSettlement2GSWalletReq extends $pb.GeneratedMessage {
  factory RideSettlement2GSWalletReq() => create();

  RideSettlement2GSWalletReq._();

  factory RideSettlement2GSWalletReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideSettlement2GSWalletReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideSettlement2GSWalletReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group_manager'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideSettlement2GSWalletReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideSettlement2GSWalletReq copyWith(
          void Function(RideSettlement2GSWalletReq) updates) =>
      super.copyWith(
              (message) => updates(message as RideSettlement2GSWalletReq))
          as RideSettlement2GSWalletReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideSettlement2GSWalletReq create() => RideSettlement2GSWalletReq._();
  @$core.override
  RideSettlement2GSWalletReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideSettlement2GSWalletReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideSettlement2GSWalletReq>(create);
  static RideSettlement2GSWalletReq? _defaultInstance;
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

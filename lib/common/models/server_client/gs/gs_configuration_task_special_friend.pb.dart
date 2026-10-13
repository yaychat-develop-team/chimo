// This is a generated file - do not edit.
//
// Generated from server_client/gs/gs_configuration_task_special_friend.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'gs_configuration_task_special_friend.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'gs_configuration_task_special_friend.pbenum.dart';

/// 获取特别好友列表
class GetSpecialFriendListReq extends $pb.GeneratedMessage {
  factory GetSpecialFriendListReq({
    $core.int? pageIndex,
    $core.int? pageSize,
  }) {
    final result = create();
    if (pageIndex != null) result.pageIndex = pageIndex;
    if (pageSize != null) result.pageSize = pageSize;
    return result;
  }

  GetSpecialFriendListReq._();

  factory GetSpecialFriendListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSpecialFriendListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSpecialFriendListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'pageIndex')
    ..aI(2, _omitFieldNames ? '' : 'pageSize')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSpecialFriendListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSpecialFriendListReq copyWith(
          void Function(GetSpecialFriendListReq) updates) =>
      super.copyWith((message) => updates(message as GetSpecialFriendListReq))
          as GetSpecialFriendListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSpecialFriendListReq create() => GetSpecialFriendListReq._();
  @$core.override
  GetSpecialFriendListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSpecialFriendListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSpecialFriendListReq>(create);
  static GetSpecialFriendListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageIndex($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPageIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageIndex() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => $_clearField(2);
}

class GetSpecialFriendListRsp extends $pb.GeneratedMessage {
  factory GetSpecialFriendListRsp({
    $core.int? totalCount,
    $core.String? bindSuccessExtra,
    $core.Iterable<SpecialFriendTaskDetail>? taskDetailList,
    $core.Iterable<SpecialFriendItem>? bindUserList,
  }) {
    final result = create();
    if (totalCount != null) result.totalCount = totalCount;
    if (bindSuccessExtra != null) result.bindSuccessExtra = bindSuccessExtra;
    if (taskDetailList != null) result.taskDetailList.addAll(taskDetailList);
    if (bindUserList != null) result.bindUserList.addAll(bindUserList);
    return result;
  }

  GetSpecialFriendListRsp._();

  factory GetSpecialFriendListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSpecialFriendListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSpecialFriendListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'totalCount')
    ..aOS(2, _omitFieldNames ? '' : 'bindSuccessExtra')
    ..pPM<SpecialFriendTaskDetail>(3, _omitFieldNames ? '' : 'taskDetailList',
        subBuilder: SpecialFriendTaskDetail.create)
    ..pPM<SpecialFriendItem>(4, _omitFieldNames ? '' : 'bindUserList',
        subBuilder: SpecialFriendItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSpecialFriendListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSpecialFriendListRsp copyWith(
          void Function(GetSpecialFriendListRsp) updates) =>
      super.copyWith((message) => updates(message as GetSpecialFriendListRsp))
          as GetSpecialFriendListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSpecialFriendListRsp create() => GetSpecialFriendListRsp._();
  @$core.override
  GetSpecialFriendListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSpecialFriendListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSpecialFriendListRsp>(create);
  static GetSpecialFriendListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalCount($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get bindSuccessExtra => $_getSZ(1);
  @$pb.TagNumber(2)
  set bindSuccessExtra($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBindSuccessExtra() => $_has(1);
  @$pb.TagNumber(2)
  void clearBindSuccessExtra() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<SpecialFriendTaskDetail> get taskDetailList => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<SpecialFriendItem> get bindUserList => $_getList(3);
}

class SpecialFriendItem extends $pb.GeneratedMessage {
  factory SpecialFriendItem({
    SpecialFriendInfo? userInfo,
    $fixnum.Int64? bindTime,
    $fixnum.Int64? taskFinishFeature,
  }) {
    final result = create();
    if (userInfo != null) result.userInfo = userInfo;
    if (bindTime != null) result.bindTime = bindTime;
    if (taskFinishFeature != null) result.taskFinishFeature = taskFinishFeature;
    return result;
  }

  SpecialFriendItem._();

  factory SpecialFriendItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpecialFriendItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpecialFriendItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOM<SpecialFriendInfo>(1, _omitFieldNames ? '' : 'userInfo',
        subBuilder: SpecialFriendInfo.create)
    ..aInt64(2, _omitFieldNames ? '' : 'bindTime')
    ..aInt64(3, _omitFieldNames ? '' : 'taskFinishFeature')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpecialFriendItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpecialFriendItem copyWith(void Function(SpecialFriendItem) updates) =>
      super.copyWith((message) => updates(message as SpecialFriendItem))
          as SpecialFriendItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpecialFriendItem create() => SpecialFriendItem._();
  @$core.override
  SpecialFriendItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SpecialFriendItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpecialFriendItem>(create);
  static SpecialFriendItem? _defaultInstance;

  @$pb.TagNumber(1)
  SpecialFriendInfo get userInfo => $_getN(0);
  @$pb.TagNumber(1)
  set userInfo(SpecialFriendInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUserInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  SpecialFriendInfo ensureUserInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get bindTime => $_getI64(1);
  @$pb.TagNumber(2)
  set bindTime($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBindTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearBindTime() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get taskFinishFeature => $_getI64(2);
  @$pb.TagNumber(3)
  set taskFinishFeature($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTaskFinishFeature() => $_has(2);
  @$pb.TagNumber(3)
  void clearTaskFinishFeature() => $_clearField(3);
}

class SpecialFriendTaskDetail extends $pb.GeneratedMessage {
  factory SpecialFriendTaskDetail({
    $core.String? description,
  }) {
    final result = create();
    if (description != null) result.description = description;
    return result;
  }

  SpecialFriendTaskDetail._();

  factory SpecialFriendTaskDetail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpecialFriendTaskDetail.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpecialFriendTaskDetail',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpecialFriendTaskDetail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpecialFriendTaskDetail copyWith(
          void Function(SpecialFriendTaskDetail) updates) =>
      super.copyWith((message) => updates(message as SpecialFriendTaskDetail))
          as SpecialFriendTaskDetail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpecialFriendTaskDetail create() => SpecialFriendTaskDetail._();
  @$core.override
  SpecialFriendTaskDetail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SpecialFriendTaskDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpecialFriendTaskDetail>(create);
  static SpecialFriendTaskDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get description => $_getSZ(0);
  @$pb.TagNumber(1)
  set description($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearDescription() => $_clearField(1);
}

class SpecialFriendInfo extends $pb.GeneratedMessage {
  factory SpecialFriendInfo({
    $fixnum.Int64? uid,
    $core.String? name,
    $core.String? imUserId,
    $core.String? headerUri,
    SpecialFriendUserStatus? status,
    $core.String? extra,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (name != null) result.name = name;
    if (imUserId != null) result.imUserId = imUserId;
    if (headerUri != null) result.headerUri = headerUri;
    if (status != null) result.status = status;
    if (extra != null) result.extra = extra;
    return result;
  }

  SpecialFriendInfo._();

  factory SpecialFriendInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpecialFriendInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpecialFriendInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'imUserId')
    ..aOS(4, _omitFieldNames ? '' : 'headerUri')
    ..aE<SpecialFriendUserStatus>(5, _omitFieldNames ? '' : 'status',
        enumValues: SpecialFriendUserStatus.values)
    ..aOS(6, _omitFieldNames ? '' : 'extra')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpecialFriendInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpecialFriendInfo copyWith(void Function(SpecialFriendInfo) updates) =>
      super.copyWith((message) => updates(message as SpecialFriendInfo))
          as SpecialFriendInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpecialFriendInfo create() => SpecialFriendInfo._();
  @$core.override
  SpecialFriendInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SpecialFriendInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpecialFriendInfo>(create);
  static SpecialFriendInfo? _defaultInstance;

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
  $core.String get imUserId => $_getSZ(2);
  @$pb.TagNumber(3)
  set imUserId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasImUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearImUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get headerUri => $_getSZ(3);
  @$pb.TagNumber(4)
  set headerUri($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHeaderUri() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeaderUri() => $_clearField(4);

  @$pb.TagNumber(5)
  SpecialFriendUserStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(SpecialFriendUserStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get extra => $_getSZ(5);
  @$pb.TagNumber(6)
  set extra($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasExtra() => $_has(5);
  @$pb.TagNumber(6)
  void clearExtra() => $_clearField(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

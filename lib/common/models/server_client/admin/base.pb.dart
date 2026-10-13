// This is a generated file - do not edit.
//
// Generated from server_client/admin/base.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../base.pbenum.dart' as $2;
import '../common/car.pb.dart' as $1;
import '../user.pb.dart' as $0;
import 'base.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'base.pbenum.dart';

class LabelPermissionGroup extends $pb.GeneratedMessage {
  factory LabelPermissionGroup({
    $fixnum.Int64? id,
    $core.String? name,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    return result;
  }

  LabelPermissionGroup._();

  factory LabelPermissionGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LabelPermissionGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LabelPermissionGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminBase'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LabelPermissionGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LabelPermissionGroup copyWith(void Function(LabelPermissionGroup) updates) =>
      super.copyWith((message) => updates(message as LabelPermissionGroup))
          as LabelPermissionGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LabelPermissionGroup create() => LabelPermissionGroup._();
  @$core.override
  LabelPermissionGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LabelPermissionGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LabelPermissionGroup>(create);
  static LabelPermissionGroup? _defaultInstance;

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
}

class LabelDesc extends $pb.GeneratedMessage {
  factory LabelDesc({
    $fixnum.Int64? id,
    LabelDesc? parent,
    $core.String? name,
    $core.Iterable<LabelPermissionGroup>? permissionGroup,
    $2.Gender? gender,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (parent != null) result.parent = parent;
    if (name != null) result.name = name;
    if (permissionGroup != null) result.permissionGroup.addAll(permissionGroup);
    if (gender != null) result.gender = gender;
    return result;
  }

  LabelDesc._();

  factory LabelDesc.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LabelDesc.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LabelDesc',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminBase'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOM<LabelDesc>(2, _omitFieldNames ? '' : 'parent',
        subBuilder: LabelDesc.create)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..pPM<LabelPermissionGroup>(4, _omitFieldNames ? '' : 'permissionGroup',
        protoName: 'permissionGroup', subBuilder: LabelPermissionGroup.create)
    ..aE<$2.Gender>(5, _omitFieldNames ? '' : 'gender',
        enumValues: $2.Gender.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LabelDesc clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LabelDesc copyWith(void Function(LabelDesc) updates) =>
      super.copyWith((message) => updates(message as LabelDesc)) as LabelDesc;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LabelDesc create() => LabelDesc._();
  @$core.override
  LabelDesc createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LabelDesc getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LabelDesc>(create);
  static LabelDesc? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  LabelDesc get parent => $_getN(1);
  @$pb.TagNumber(2)
  set parent(LabelDesc value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasParent() => $_has(1);
  @$pb.TagNumber(2)
  void clearParent() => $_clearField(2);
  @$pb.TagNumber(2)
  LabelDesc ensureParent() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<LabelPermissionGroup> get permissionGroup => $_getList(3);

  @$pb.TagNumber(5)
  $2.Gender get gender => $_getN(4);
  @$pb.TagNumber(5)
  set gender($2.Gender value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasGender() => $_has(4);
  @$pb.TagNumber(5)
  void clearGender() => $_clearField(5);
}

/// t_device_info
class UserDeviceInfo extends $pb.GeneratedMessage {
  factory UserDeviceInfo({
    $core.String? deviceType,
    $core.String? deviceModel,
    $core.String? appVersion,
    $core.String? mac,
  }) {
    final result = create();
    if (deviceType != null) result.deviceType = deviceType;
    if (deviceModel != null) result.deviceModel = deviceModel;
    if (appVersion != null) result.appVersion = appVersion;
    if (mac != null) result.mac = mac;
    return result;
  }

  UserDeviceInfo._();

  factory UserDeviceInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserDeviceInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserDeviceInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminBase'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceType', protoName: 'deviceType')
    ..aOS(2, _omitFieldNames ? '' : 'deviceModel', protoName: 'deviceModel')
    ..aOS(3, _omitFieldNames ? '' : 'appVersion', protoName: 'appVersion')
    ..aOS(4, _omitFieldNames ? '' : 'mac')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserDeviceInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserDeviceInfo copyWith(void Function(UserDeviceInfo) updates) =>
      super.copyWith((message) => updates(message as UserDeviceInfo))
          as UserDeviceInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserDeviceInfo create() => UserDeviceInfo._();
  @$core.override
  UserDeviceInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserDeviceInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserDeviceInfo>(create);
  static UserDeviceInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceType => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceType() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceModel => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceModel($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeviceModel() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceModel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get appVersion => $_getSZ(2);
  @$pb.TagNumber(3)
  set appVersion($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAppVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearAppVersion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get mac => $_getSZ(3);
  @$pb.TagNumber(4)
  set mac($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMac() => $_has(3);
  @$pb.TagNumber(4)
  void clearMac() => $_clearField(4);
}

class UserStatus extends $pb.GeneratedMessage {
  factory UserStatus({
    $fixnum.Int64? latestOnlineTime,
    $fixnum.Int64? latestOnlineChannelId,
    $core.String? latestOnlineChannelName,
    $core.String? ipString,
    $core.String? ipProvince,
    $core.String? ipCity,
    UserDeviceInfo? deviceInfo,
    BlockLoginStatus? blockLoginStatus,
    BlockInteractiveStatus? blockInteractiveStatus,
  }) {
    final result = create();
    if (latestOnlineTime != null) result.latestOnlineTime = latestOnlineTime;
    if (latestOnlineChannelId != null)
      result.latestOnlineChannelId = latestOnlineChannelId;
    if (latestOnlineChannelName != null)
      result.latestOnlineChannelName = latestOnlineChannelName;
    if (ipString != null) result.ipString = ipString;
    if (ipProvince != null) result.ipProvince = ipProvince;
    if (ipCity != null) result.ipCity = ipCity;
    if (deviceInfo != null) result.deviceInfo = deviceInfo;
    if (blockLoginStatus != null) result.blockLoginStatus = blockLoginStatus;
    if (blockInteractiveStatus != null)
      result.blockInteractiveStatus = blockInteractiveStatus;
    return result;
  }

  UserStatus._();

  factory UserStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminBase'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'latestOnlineTime',
        protoName: 'latestOnlineTime')
    ..aInt64(2, _omitFieldNames ? '' : 'latestOnlineChannelId',
        protoName: 'latestOnlineChannelId')
    ..aOS(3, _omitFieldNames ? '' : 'latestOnlineChannelName',
        protoName: 'latestOnlineChannelName')
    ..aOS(4, _omitFieldNames ? '' : 'ipString', protoName: 'ipString')
    ..aOS(5, _omitFieldNames ? '' : 'ipProvince', protoName: 'ipProvince')
    ..aOS(6, _omitFieldNames ? '' : 'ipCity', protoName: 'ipCity')
    ..aOM<UserDeviceInfo>(7, _omitFieldNames ? '' : 'deviceInfo',
        protoName: 'deviceInfo', subBuilder: UserDeviceInfo.create)
    ..aE<BlockLoginStatus>(8, _omitFieldNames ? '' : 'blockLoginStatus',
        protoName: 'blockLoginStatus', enumValues: BlockLoginStatus.values)
    ..aE<BlockInteractiveStatus>(
        9, _omitFieldNames ? '' : 'blockInteractiveStatus',
        protoName: 'blockInteractiveStatus',
        enumValues: BlockInteractiveStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserStatus copyWith(void Function(UserStatus) updates) =>
      super.copyWith((message) => updates(message as UserStatus)) as UserStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserStatus create() => UserStatus._();
  @$core.override
  UserStatus createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserStatus>(create);
  static UserStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get latestOnlineTime => $_getI64(0);
  @$pb.TagNumber(1)
  set latestOnlineTime($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLatestOnlineTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatestOnlineTime() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get latestOnlineChannelId => $_getI64(1);
  @$pb.TagNumber(2)
  set latestOnlineChannelId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLatestOnlineChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatestOnlineChannelId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get latestOnlineChannelName => $_getSZ(2);
  @$pb.TagNumber(3)
  set latestOnlineChannelName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLatestOnlineChannelName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatestOnlineChannelName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get ipString => $_getSZ(3);
  @$pb.TagNumber(4)
  set ipString($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIpString() => $_has(3);
  @$pb.TagNumber(4)
  void clearIpString() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get ipProvince => $_getSZ(4);
  @$pb.TagNumber(5)
  set ipProvince($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIpProvince() => $_has(4);
  @$pb.TagNumber(5)
  void clearIpProvince() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get ipCity => $_getSZ(5);
  @$pb.TagNumber(6)
  set ipCity($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIpCity() => $_has(5);
  @$pb.TagNumber(6)
  void clearIpCity() => $_clearField(6);

  @$pb.TagNumber(7)
  UserDeviceInfo get deviceInfo => $_getN(6);
  @$pb.TagNumber(7)
  set deviceInfo(UserDeviceInfo value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasDeviceInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeviceInfo() => $_clearField(7);
  @$pb.TagNumber(7)
  UserDeviceInfo ensureDeviceInfo() => $_ensure(6);

  @$pb.TagNumber(8)
  BlockLoginStatus get blockLoginStatus => $_getN(7);
  @$pb.TagNumber(8)
  set blockLoginStatus(BlockLoginStatus value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasBlockLoginStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearBlockLoginStatus() => $_clearField(8);

  @$pb.TagNumber(9)
  BlockInteractiveStatus get blockInteractiveStatus => $_getN(8);
  @$pb.TagNumber(9)
  set blockInteractiveStatus(BlockInteractiveStatus value) =>
      $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasBlockInteractiveStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearBlockInteractiveStatus() => $_clearField(9);
}

class UserCompleteInfo extends $pb.GeneratedMessage {
  factory UserCompleteInfo({
    $0.User? user,
    $core.Iterable<LabelDesc>? labels,
    UserStatus? status,
    $1.CarMetaInfo? currentCar,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (labels != null) result.labels.addAll(labels);
    if (status != null) result.status = status;
    if (currentCar != null) result.currentCar = currentCar;
    return result;
  }

  UserCompleteInfo._();

  factory UserCompleteInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserCompleteInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserCompleteInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminBase'),
      createEmptyInstance: create)
    ..aOM<$0.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $0.User.create)
    ..pPM<LabelDesc>(2, _omitFieldNames ? '' : 'labels',
        subBuilder: LabelDesc.create)
    ..aOM<UserStatus>(3, _omitFieldNames ? '' : 'status',
        subBuilder: UserStatus.create)
    ..aOM<$1.CarMetaInfo>(4, _omitFieldNames ? '' : 'currentCar',
        protoName: 'currentCar', subBuilder: $1.CarMetaInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCompleteInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCompleteInfo copyWith(void Function(UserCompleteInfo) updates) =>
      super.copyWith((message) => updates(message as UserCompleteInfo))
          as UserCompleteInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserCompleteInfo create() => UserCompleteInfo._();
  @$core.override
  UserCompleteInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserCompleteInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserCompleteInfo>(create);
  static UserCompleteInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $0.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<LabelDesc> get labels => $_getList(1);

  @$pb.TagNumber(3)
  UserStatus get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(UserStatus value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);
  @$pb.TagNumber(3)
  UserStatus ensureStatus() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.CarMetaInfo get currentCar => $_getN(3);
  @$pb.TagNumber(4)
  set currentCar($1.CarMetaInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCurrentCar() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentCar() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.CarMetaInfo ensureCurrentCar() => $_ensure(3);
}

class AdminUser extends $pb.GeneratedMessage {
  factory AdminUser({
    $fixnum.Int64? id,
    $core.String? name,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    return result;
  }

  AdminUser._();

  factory AdminUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AdminUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AdminUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminBase'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AdminUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AdminUser copyWith(void Function(AdminUser) updates) =>
      super.copyWith((message) => updates(message as AdminUser)) as AdminUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdminUser create() => AdminUser._();
  @$core.override
  AdminUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AdminUser getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdminUser>(create);
  static AdminUser? _defaultInstance;

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
}

class SimpleAppUser extends $pb.GeneratedMessage {
  factory SimpleAppUser({
    $fixnum.Int64? userId,
    $core.String? nickName,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (nickName != null) result.nickName = nickName;
    return result;
  }

  SimpleAppUser._();

  factory SimpleAppUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SimpleAppUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SimpleAppUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminBase'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'nickName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleAppUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleAppUser copyWith(void Function(SimpleAppUser) updates) =>
      super.copyWith((message) => updates(message as SimpleAppUser))
          as SimpleAppUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SimpleAppUser create() => SimpleAppUser._();
  @$core.override
  SimpleAppUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SimpleAppUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SimpleAppUser>(create);
  static SimpleAppUser? _defaultInstance;

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
}

class SimpleGroup extends $pb.GeneratedMessage {
  factory SimpleGroup({
    $fixnum.Int64? groupId,
    $core.String? groupName,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    if (groupName != null) result.groupName = groupName;
    return result;
  }

  SimpleGroup._();

  factory SimpleGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SimpleGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SimpleGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminBase'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'groupId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'groupName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleGroup copyWith(void Function(SimpleGroup) updates) =>
      super.copyWith((message) => updates(message as SimpleGroup))
          as SimpleGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SimpleGroup create() => SimpleGroup._();
  @$core.override
  SimpleGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SimpleGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SimpleGroup>(create);
  static SimpleGroup? _defaultInstance;

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
}

class Pagination extends $pb.GeneratedMessage {
  factory Pagination({
    $fixnum.Int64? pageNo,
    $fixnum.Int64? pageSize,
    $fixnum.Int64? total,
  }) {
    final result = create();
    if (pageNo != null) result.pageNo = pageNo;
    if (pageSize != null) result.pageSize = pageSize;
    if (total != null) result.total = total;
    return result;
  }

  Pagination._();

  factory Pagination.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Pagination.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Pagination',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminBase'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'pageNo', protoName: 'pageNo')
    ..aInt64(2, _omitFieldNames ? '' : 'pageSize', protoName: 'pageSize')
    ..aInt64(3, _omitFieldNames ? '' : 'total')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Pagination clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Pagination copyWith(void Function(Pagination) updates) =>
      super.copyWith((message) => updates(message as Pagination)) as Pagination;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Pagination create() => Pagination._();
  @$core.override
  Pagination createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Pagination getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Pagination>(create);
  static Pagination? _defaultInstance;

  /// *
  ///  当前页
  @$pb.TagNumber(1)
  $fixnum.Int64 get pageNo => $_getI64(0);
  @$pb.TagNumber(1)
  set pageNo($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPageNo() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageNo() => $_clearField(1);

  /// *
  ///  总页数
  @$pb.TagNumber(2)
  $fixnum.Int64 get pageSize => $_getI64(1);
  @$pb.TagNumber(2)
  set pageSize($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => $_clearField(2);

  /// *
  ///  总条数
  @$pb.TagNumber(3)
  $fixnum.Int64 get total => $_getI64(2);
  @$pb.TagNumber(3)
  set total($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotal() => $_clearField(3);
}

class MentorRebate extends $pb.GeneratedMessage {
  factory MentorRebate({
    $fixnum.Int64? rebate,
  }) {
    final result = create();
    if (rebate != null) result.rebate = rebate;
    return result;
  }

  MentorRebate._();

  factory MentorRebate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorRebate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorRebate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminBase'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'rebate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorRebate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorRebate copyWith(void Function(MentorRebate) updates) =>
      super.copyWith((message) => updates(message as MentorRebate))
          as MentorRebate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorRebate create() => MentorRebate._();
  @$core.override
  MentorRebate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorRebate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorRebate>(create);
  static MentorRebate? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get rebate => $_getI64(0);
  @$pb.TagNumber(1)
  set rebate($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRebate() => $_has(0);
  @$pb.TagNumber(1)
  void clearRebate() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

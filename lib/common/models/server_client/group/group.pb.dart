// This is a generated file - do not edit.
//
// Generated from server_client/group/group.proto.

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

class GroupTypeList extends $pb.GeneratedMessage {
  factory GroupTypeList({
    $core.Iterable<$core.String>? typeList,
  }) {
    final result = create();
    if (typeList != null) result.typeList.addAll(typeList);
    return result;
  }

  GroupTypeList._();

  factory GroupTypeList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupTypeList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupTypeList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group.group'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'typeList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupTypeList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupTypeList copyWith(void Function(GroupTypeList) updates) =>
      super.copyWith((message) => updates(message as GroupTypeList))
          as GroupTypeList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupTypeList create() => GroupTypeList._();
  @$core.override
  GroupTypeList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupTypeList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupTypeList>(create);
  static GroupTypeList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get typeList => $_getList(0);
}

class GroupInfo extends $pb.GeneratedMessage {
  factory GroupInfo({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? avatar,
    $core.String? type,
    $core.int? level,
    $core.String? desc,
    $core.String? emGroupId,
    $fixnum.Int64? memberCount,
    $fixnum.Int64? picCount,
    $core.bool? isJoin,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (avatar != null) result.avatar = avatar;
    if (type != null) result.type = type;
    if (level != null) result.level = level;
    if (desc != null) result.desc = desc;
    if (emGroupId != null) result.emGroupId = emGroupId;
    if (memberCount != null) result.memberCount = memberCount;
    if (picCount != null) result.picCount = picCount;
    if (isJoin != null) result.isJoin = isJoin;
    return result;
  }

  GroupInfo._();

  factory GroupInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group.group'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..aI(5, _omitFieldNames ? '' : 'level')
    ..aOS(6, _omitFieldNames ? '' : 'desc')
    ..aOS(7, _omitFieldNames ? '' : 'emGroupId')
    ..a<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'memberCount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        9, _omitFieldNames ? '' : 'picCount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(10, _omitFieldNames ? '' : 'isJoin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupInfo copyWith(void Function(GroupInfo) updates) =>
      super.copyWith((message) => updates(message as GroupInfo)) as GroupInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupInfo create() => GroupInfo._();
  @$core.override
  GroupInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GroupInfo>(create);
  static GroupInfo? _defaultInstance;

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
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get level => $_getIZ(4);
  @$pb.TagNumber(5)
  set level($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLevel() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get emGroupId => $_getSZ(6);
  @$pb.TagNumber(7)
  set emGroupId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasEmGroupId() => $_has(6);
  @$pb.TagNumber(7)
  void clearEmGroupId() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get memberCount => $_getI64(7);
  @$pb.TagNumber(8)
  set memberCount($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasMemberCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearMemberCount() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get picCount => $_getI64(8);
  @$pb.TagNumber(9)
  set picCount($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasPicCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearPicCount() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isJoin => $_getBF(9);
  @$pb.TagNumber(10)
  set isJoin($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasIsJoin() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsJoin() => $_clearField(10);
}

class GroupListRsp extends $pb.GeneratedMessage {
  factory GroupListRsp({
    $core.Iterable<GroupInfo>? groupList,
  }) {
    final result = create();
    if (groupList != null) result.groupList.addAll(groupList);
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group.group'),
      createEmptyInstance: create)
    ..pPM<GroupInfo>(1, _omitFieldNames ? '' : 'groupList',
        subBuilder: GroupInfo.create)
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
  $pb.PbList<GroupInfo> get groupList => $_getList(0);
}

class GroupPhotoListRsp extends $pb.GeneratedMessage {
  factory GroupPhotoListRsp({
    $core.Iterable<GroupPhoto>? groupPhotoList,
  }) {
    final result = create();
    if (groupPhotoList != null) result.groupPhotoList.addAll(groupPhotoList);
    return result;
  }

  GroupPhotoListRsp._();

  factory GroupPhotoListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupPhotoListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupPhotoListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group.group'),
      createEmptyInstance: create)
    ..pPM<GroupPhoto>(1, _omitFieldNames ? '' : 'groupPhotoList',
        subBuilder: GroupPhoto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupPhotoListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupPhotoListRsp copyWith(void Function(GroupPhotoListRsp) updates) =>
      super.copyWith((message) => updates(message as GroupPhotoListRsp))
          as GroupPhotoListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupPhotoListRsp create() => GroupPhotoListRsp._();
  @$core.override
  GroupPhotoListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupPhotoListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupPhotoListRsp>(create);
  static GroupPhotoListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GroupPhoto> get groupPhotoList => $_getList(0);
}

class GroupPhoto extends $pb.GeneratedMessage {
  factory GroupPhoto({
    $core.String? periodName,
    $core.Iterable<$core.String>? photoList,
  }) {
    final result = create();
    if (periodName != null) result.periodName = periodName;
    if (photoList != null) result.photoList.addAll(photoList);
    return result;
  }

  GroupPhoto._();

  factory GroupPhoto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GroupPhoto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GroupPhoto',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group.group'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'periodName')
    ..pPS(2, _omitFieldNames ? '' : 'photoList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupPhoto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GroupPhoto copyWith(void Function(GroupPhoto) updates) =>
      super.copyWith((message) => updates(message as GroupPhoto)) as GroupPhoto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GroupPhoto create() => GroupPhoto._();
  @$core.override
  GroupPhoto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GroupPhoto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GroupPhoto>(create);
  static GroupPhoto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get periodName => $_getSZ(0);
  @$pb.TagNumber(1)
  set periodName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPeriodName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeriodName() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get photoList => $_getList(1);
}

class JoinGroupReq extends $pb.GeneratedMessage {
  factory JoinGroupReq({
    $core.Iterable<$core.String>? emGroupIdList,
  }) {
    final result = create();
    if (emGroupIdList != null) result.emGroupIdList.addAll(emGroupIdList);
    return result;
  }

  JoinGroupReq._();

  factory JoinGroupReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JoinGroupReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JoinGroupReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'group.group'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'emGroupIdList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinGroupReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinGroupReq copyWith(void Function(JoinGroupReq) updates) =>
      super.copyWith((message) => updates(message as JoinGroupReq))
          as JoinGroupReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinGroupReq create() => JoinGroupReq._();
  @$core.override
  JoinGroupReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JoinGroupReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinGroupReq>(create);
  static JoinGroupReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get emGroupIdList => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

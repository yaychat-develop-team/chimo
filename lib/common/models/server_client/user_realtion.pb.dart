// This is a generated file - do not edit.
//
// Generated from server_client/user_realtion.proto.

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

/// cp关系配置
class CPConfItemReq extends $pb.GeneratedMessage {
  factory CPConfItemReq() => create();

  CPConfItemReq._();

  factory CPConfItemReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CPConfItemReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CPConfItemReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPConfItemReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPConfItemReq copyWith(void Function(CPConfItemReq) updates) =>
      super.copyWith((message) => updates(message as CPConfItemReq))
          as CPConfItemReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CPConfItemReq create() => CPConfItemReq._();
  @$core.override
  CPConfItemReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CPConfItemReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CPConfItemReq>(create);
  static CPConfItemReq? _defaultInstance;
}

class CPConfItemResp extends $pb.GeneratedMessage {
  factory CPConfItemResp({
    $core.Iterable<CPConfItem>? configs,
  }) {
    final result = create();
    if (configs != null) result.configs.addAll(configs);
    return result;
  }

  CPConfItemResp._();

  factory CPConfItemResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CPConfItemResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CPConfItemResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..pPM<CPConfItem>(1, _omitFieldNames ? '' : 'configs',
        subBuilder: CPConfItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPConfItemResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPConfItemResp copyWith(void Function(CPConfItemResp) updates) =>
      super.copyWith((message) => updates(message as CPConfItemResp))
          as CPConfItemResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CPConfItemResp create() => CPConfItemResp._();
  @$core.override
  CPConfItemResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CPConfItemResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CPConfItemResp>(create);
  static CPConfItemResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CPConfItem> get configs => $_getList(0);
}

/// 关系列表
class UserRelationListReq extends $pb.GeneratedMessage {
  factory UserRelationListReq({
    $fixnum.Int64? targetId,
  }) {
    final result = create();
    if (targetId != null) result.targetId = targetId;
    return result;
  }

  UserRelationListReq._();

  factory UserRelationListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRelationListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRelationListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'targetId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationListReq copyWith(void Function(UserRelationListReq) updates) =>
      super.copyWith((message) => updates(message as UserRelationListReq))
          as UserRelationListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRelationListReq create() => UserRelationListReq._();
  @$core.override
  UserRelationListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRelationListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRelationListReq>(create);
  static UserRelationListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get targetId => $_getI64(0);
  @$pb.TagNumber(1)
  set targetId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTargetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetId() => $_clearField(1);
}

class UserRelationListResp extends $pb.GeneratedMessage {
  factory UserRelationListResp({
    $core.Iterable<UserRelationItem>? relationList,
  }) {
    final result = create();
    if (relationList != null) result.relationList.addAll(relationList);
    return result;
  }

  UserRelationListResp._();

  factory UserRelationListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRelationListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRelationListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..pPM<UserRelationItem>(1, _omitFieldNames ? '' : 'relationList',
        protoName: 'relationList', subBuilder: UserRelationItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationListResp copyWith(void Function(UserRelationListResp) updates) =>
      super.copyWith((message) => updates(message as UserRelationListResp))
          as UserRelationListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRelationListResp create() => UserRelationListResp._();
  @$core.override
  UserRelationListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRelationListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRelationListResp>(create);
  static UserRelationListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserRelationItem> get relationList => $_getList(0);
}

/// 用户卡片
class UserRelationCardReq extends $pb.GeneratedMessage {
  factory UserRelationCardReq({
    $fixnum.Int64? targetId,
  }) {
    final result = create();
    if (targetId != null) result.targetId = targetId;
    return result;
  }

  UserRelationCardReq._();

  factory UserRelationCardReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRelationCardReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRelationCardReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'targetId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationCardReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationCardReq copyWith(void Function(UserRelationCardReq) updates) =>
      super.copyWith((message) => updates(message as UserRelationCardReq))
          as UserRelationCardReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRelationCardReq create() => UserRelationCardReq._();
  @$core.override
  UserRelationCardReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRelationCardReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRelationCardReq>(create);
  static UserRelationCardReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get targetId => $_getI64(0);
  @$pb.TagNumber(1)
  set targetId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTargetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetId() => $_clearField(1);
}

class UserRelationCardResp extends $pb.GeneratedMessage {
  factory UserRelationCardResp({
    $core.int? relationNum,
    $core.Iterable<UserRelationItem>? relationList,
  }) {
    final result = create();
    if (relationNum != null) result.relationNum = relationNum;
    if (relationList != null) result.relationList.addAll(relationList);
    return result;
  }

  UserRelationCardResp._();

  factory UserRelationCardResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRelationCardResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRelationCardResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'relationNum', protoName: 'relationNum')
    ..pPM<UserRelationItem>(2, _omitFieldNames ? '' : 'relationList',
        protoName: 'relationList', subBuilder: UserRelationItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationCardResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationCardResp copyWith(void Function(UserRelationCardResp) updates) =>
      super.copyWith((message) => updates(message as UserRelationCardResp))
          as UserRelationCardResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRelationCardResp create() => UserRelationCardResp._();
  @$core.override
  UserRelationCardResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRelationCardResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRelationCardResp>(create);
  static UserRelationCardResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get relationNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set relationNum($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRelationNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearRelationNum() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<UserRelationItem> get relationList => $_getList(1);
}

class UserRelationStatusReq extends $pb.GeneratedMessage {
  factory UserRelationStatusReq({
    $fixnum.Int64? targetId,
    $core.int? hidden,
  }) {
    final result = create();
    if (targetId != null) result.targetId = targetId;
    if (hidden != null) result.hidden = hidden;
    return result;
  }

  UserRelationStatusReq._();

  factory UserRelationStatusReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRelationStatusReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRelationStatusReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'targetId')
    ..aI(2, _omitFieldNames ? '' : 'hidden')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationStatusReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationStatusReq copyWith(
          void Function(UserRelationStatusReq) updates) =>
      super.copyWith((message) => updates(message as UserRelationStatusReq))
          as UserRelationStatusReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRelationStatusReq create() => UserRelationStatusReq._();
  @$core.override
  UserRelationStatusReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRelationStatusReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRelationStatusReq>(create);
  static UserRelationStatusReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get targetId => $_getI64(0);
  @$pb.TagNumber(1)
  set targetId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTargetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get hidden => $_getIZ(1);
  @$pb.TagNumber(2)
  set hidden($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHidden() => $_has(1);
  @$pb.TagNumber(2)
  void clearHidden() => $_clearField(2);
}

class UserRelationLevelReq extends $pb.GeneratedMessage {
  factory UserRelationLevelReq({
    $fixnum.Int64? relationId,
    $fixnum.Int64? targetUid,
  }) {
    final result = create();
    if (relationId != null) result.relationId = relationId;
    if (targetUid != null) result.targetUid = targetUid;
    return result;
  }

  UserRelationLevelReq._();

  factory UserRelationLevelReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRelationLevelReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRelationLevelReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'relationId')
    ..aInt64(2, _omitFieldNames ? '' : 'targetUid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationLevelReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationLevelReq copyWith(void Function(UserRelationLevelReq) updates) =>
      super.copyWith((message) => updates(message as UserRelationLevelReq))
          as UserRelationLevelReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRelationLevelReq create() => UserRelationLevelReq._();
  @$core.override
  UserRelationLevelReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRelationLevelReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRelationLevelReq>(create);
  static UserRelationLevelReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get relationId => $_getI64(0);
  @$pb.TagNumber(1)
  set relationId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRelationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRelationId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get targetUid => $_getI64(1);
  @$pb.TagNumber(2)
  set targetUid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTargetUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetUid() => $_clearField(2);
}

class UserRelationLevelResp extends $pb.GeneratedMessage {
  factory UserRelationLevelResp({
    Relation? relation,
    $core.Iterable<UserRelationPrivilege>? privileges,
  }) {
    final result = create();
    if (relation != null) result.relation = relation;
    if (privileges != null) result.privileges.addAll(privileges);
    return result;
  }

  UserRelationLevelResp._();

  factory UserRelationLevelResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRelationLevelResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRelationLevelResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aOM<Relation>(1, _omitFieldNames ? '' : 'relation',
        subBuilder: Relation.create)
    ..pPM<UserRelationPrivilege>(2, _omitFieldNames ? '' : 'privileges',
        subBuilder: UserRelationPrivilege.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationLevelResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationLevelResp copyWith(
          void Function(UserRelationLevelResp) updates) =>
      super.copyWith((message) => updates(message as UserRelationLevelResp))
          as UserRelationLevelResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRelationLevelResp create() => UserRelationLevelResp._();
  @$core.override
  UserRelationLevelResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRelationLevelResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRelationLevelResp>(create);
  static UserRelationLevelResp? _defaultInstance;

  @$pb.TagNumber(1)
  Relation get relation => $_getN(0);
  @$pb.TagNumber(1)
  set relation(Relation value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRelation() => $_has(0);
  @$pb.TagNumber(1)
  void clearRelation() => $_clearField(1);
  @$pb.TagNumber(1)
  Relation ensureRelation() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<UserRelationPrivilege> get privileges => $_getList(1);
}

class RelationPrivilegeSwitchers extends $pb.GeneratedMessage {
  factory RelationPrivilegeSwitchers({
    $fixnum.Int64? relationId,
    $core.int? relationHidden,
    $core.Iterable<RelationPrivilegeSwitcher>? switchers,
  }) {
    final result = create();
    if (relationId != null) result.relationId = relationId;
    if (relationHidden != null) result.relationHidden = relationHidden;
    if (switchers != null) result.switchers.addAll(switchers);
    return result;
  }

  RelationPrivilegeSwitchers._();

  factory RelationPrivilegeSwitchers.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RelationPrivilegeSwitchers.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RelationPrivilegeSwitchers',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'relationId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(2, _omitFieldNames ? '' : 'relationHidden',
        fieldType: $pb.PbFieldType.OU3)
    ..pPM<RelationPrivilegeSwitcher>(3, _omitFieldNames ? '' : 'switchers',
        subBuilder: RelationPrivilegeSwitcher.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RelationPrivilegeSwitchers clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RelationPrivilegeSwitchers copyWith(
          void Function(RelationPrivilegeSwitchers) updates) =>
      super.copyWith(
              (message) => updates(message as RelationPrivilegeSwitchers))
          as RelationPrivilegeSwitchers;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RelationPrivilegeSwitchers create() => RelationPrivilegeSwitchers._();
  @$core.override
  RelationPrivilegeSwitchers createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RelationPrivilegeSwitchers getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RelationPrivilegeSwitchers>(create);
  static RelationPrivilegeSwitchers? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get relationId => $_getI64(0);
  @$pb.TagNumber(1)
  set relationId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRelationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRelationId() => $_clearField(1);

  /// 关系本身是否隐藏了，这里是直接取Relation对象的值
  /// 0-显示，1-隐藏
  /// 客户端0开关关闭，1开关打开
  @$pb.TagNumber(2)
  $core.int get relationHidden => $_getIZ(1);
  @$pb.TagNumber(2)
  set relationHidden($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRelationHidden() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelationHidden() => $_clearField(2);

  /// 权限的开关
  @$pb.TagNumber(3)
  $pb.PbList<RelationPrivilegeSwitcher> get switchers => $_getList(2);
}

class RelationPrivilegeSwitcher extends $pb.GeneratedMessage {
  factory RelationPrivilegeSwitcher({
    $core.int? privilegeId,
    $core.String? displayName,
    $core.int? status,
  }) {
    final result = create();
    if (privilegeId != null) result.privilegeId = privilegeId;
    if (displayName != null) result.displayName = displayName;
    if (status != null) result.status = status;
    return result;
  }

  RelationPrivilegeSwitcher._();

  factory RelationPrivilegeSwitcher.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RelationPrivilegeSwitcher.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RelationPrivilegeSwitcher',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'privilegeId',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'displayName')
    ..aI(3, _omitFieldNames ? '' : 'status', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RelationPrivilegeSwitcher clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RelationPrivilegeSwitcher copyWith(
          void Function(RelationPrivilegeSwitcher) updates) =>
      super.copyWith((message) => updates(message as RelationPrivilegeSwitcher))
          as RelationPrivilegeSwitcher;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RelationPrivilegeSwitcher create() => RelationPrivilegeSwitcher._();
  @$core.override
  RelationPrivilegeSwitcher createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RelationPrivilegeSwitcher getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RelationPrivilegeSwitcher>(create);
  static RelationPrivilegeSwitcher? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get privilegeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set privilegeId($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrivilegeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivilegeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get displayName => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDisplayName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayName() => $_clearField(2);

  ///  0-可用，1-不可用，2-等级未达到
  /// 客户端处理：0-开关关闭，1-开关打开，2-灰色不可用
  @$pb.TagNumber(3)
  $core.int get status => $_getIZ(2);
  @$pb.TagNumber(3)
  set status($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);
}

class UserRelationPrivilege extends $pb.GeneratedMessage {
  factory UserRelationPrivilege({
    $core.int? privilegeId,
    $core.String? displayName,
    $core.String? mainResource,
    $core.String? centerResource,
    $core.int? unlockLevel,
    $core.String? desc,
  }) {
    final result = create();
    if (privilegeId != null) result.privilegeId = privilegeId;
    if (displayName != null) result.displayName = displayName;
    if (mainResource != null) result.mainResource = mainResource;
    if (centerResource != null) result.centerResource = centerResource;
    if (unlockLevel != null) result.unlockLevel = unlockLevel;
    if (desc != null) result.desc = desc;
    return result;
  }

  UserRelationPrivilege._();

  factory UserRelationPrivilege.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRelationPrivilege.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRelationPrivilege',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'privilegeId')
    ..aOS(2, _omitFieldNames ? '' : 'displayName')
    ..aOS(3, _omitFieldNames ? '' : 'mainResource')
    ..aOS(4, _omitFieldNames ? '' : 'centerResource')
    ..aI(5, _omitFieldNames ? '' : 'unlockLevel',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'desc')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationPrivilege clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationPrivilege copyWith(
          void Function(UserRelationPrivilege) updates) =>
      super.copyWith((message) => updates(message as UserRelationPrivilege))
          as UserRelationPrivilege;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRelationPrivilege create() => UserRelationPrivilege._();
  @$core.override
  UserRelationPrivilege createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRelationPrivilege getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRelationPrivilege>(create);
  static UserRelationPrivilege? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get privilegeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set privilegeId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrivilegeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivilegeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get displayName => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDisplayName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get mainResource => $_getSZ(2);
  @$pb.TagNumber(3)
  set mainResource($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMainResource() => $_has(2);
  @$pb.TagNumber(3)
  void clearMainResource() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get centerResource => $_getSZ(3);
  @$pb.TagNumber(4)
  set centerResource($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCenterResource() => $_has(3);
  @$pb.TagNumber(4)
  void clearCenterResource() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get unlockLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set unlockLevel($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUnlockLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearUnlockLevel() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => $_clearField(6);
}

class RelationBadge extends $pb.GeneratedMessage {
  factory RelationBadge({
    $core.String? resource,
    $core.int? leftDistance,
    $core.String? targetUserName,
  }) {
    final result = create();
    if (resource != null) result.resource = resource;
    if (leftDistance != null) result.leftDistance = leftDistance;
    if (targetUserName != null) result.targetUserName = targetUserName;
    return result;
  }

  RelationBadge._();

  factory RelationBadge.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RelationBadge.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RelationBadge',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'resource')
    ..aI(2, _omitFieldNames ? '' : 'leftDistance',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'targetUserName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RelationBadge clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RelationBadge copyWith(void Function(RelationBadge) updates) =>
      super.copyWith((message) => updates(message as RelationBadge))
          as RelationBadge;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RelationBadge create() => RelationBadge._();
  @$core.override
  RelationBadge createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RelationBadge getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RelationBadge>(create);
  static RelationBadge? _defaultInstance;

  /// 资源地址
  @$pb.TagNumber(1)
  $core.String get resource => $_getSZ(0);
  @$pb.TagNumber(1)
  set resource($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasResource() => $_has(0);
  @$pb.TagNumber(1)
  void clearResource() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get leftDistance => $_getIZ(1);
  @$pb.TagNumber(2)
  set leftDistance($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLeftDistance() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeftDistance() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get targetUserName => $_getSZ(2);
  @$pb.TagNumber(3)
  set targetUserName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTargetUserName() => $_has(2);
  @$pb.TagNumber(3)
  void clearTargetUserName() => $_clearField(3);
}

/// cp基础信息
class CPConfItem extends $pb.GeneratedMessage {
  factory CPConfItem({
    $core.int? id,
    $core.String? name,
    $core.String? icon,
    $core.String? bgColor,
    $core.Iterable<$core.String>? colors,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (bgColor != null) result.bgColor = bgColor;
    if (colors != null) result.colors.addAll(colors);
    return result;
  }

  CPConfItem._();

  factory CPConfItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CPConfItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CPConfItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aOS(4, _omitFieldNames ? '' : 'bgColor')
    ..pPS(5, _omitFieldNames ? '' : 'colors')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPConfItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPConfItem copyWith(void Function(CPConfItem) updates) =>
      super.copyWith((message) => updates(message as CPConfItem)) as CPConfItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CPConfItem create() => CPConfItem._();
  @$core.override
  CPConfItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CPConfItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CPConfItem>(create);
  static CPConfItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
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
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get bgColor => $_getSZ(3);
  @$pb.TagNumber(4)
  set bgColor($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBgColor() => $_has(3);
  @$pb.TagNumber(4)
  void clearBgColor() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get colors => $_getList(4);
}

class UserRelationTopItem extends $pb.GeneratedMessage {
  factory UserRelationTopItem({
    UserRelationItem? relationItem,
  }) {
    final result = create();
    if (relationItem != null) result.relationItem = relationItem;
    return result;
  }

  UserRelationTopItem._();

  factory UserRelationTopItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRelationTopItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRelationTopItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aOM<UserRelationItem>(1, _omitFieldNames ? '' : 'relationItem',
        protoName: 'relationItem', subBuilder: UserRelationItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationTopItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationTopItem copyWith(void Function(UserRelationTopItem) updates) =>
      super.copyWith((message) => updates(message as UserRelationTopItem))
          as UserRelationTopItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRelationTopItem create() => UserRelationTopItem._();
  @$core.override
  UserRelationTopItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRelationTopItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRelationTopItem>(create);
  static UserRelationTopItem? _defaultInstance;

  @$pb.TagNumber(1)
  UserRelationItem get relationItem => $_getN(0);
  @$pb.TagNumber(1)
  set relationItem(UserRelationItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRelationItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearRelationItem() => $_clearField(1);
  @$pb.TagNumber(1)
  UserRelationItem ensureRelationItem() => $_ensure(0);
}

/// cp基础信息
class UserRelationItem extends $pb.GeneratedMessage {
  factory UserRelationItem({
    $core.int? type,
    $core.String? name,
    $core.String? icon,
    $core.String? bgColor,
    $core.Iterable<$core.String>? colors,
    UserRelationUser? toUser,
    $fixnum.Int64? heartValue,
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
    $core.int? hidden,
    $fixnum.Int64? id,
    $core.int? level,
    LoveHouse? loveHouse,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (bgColor != null) result.bgColor = bgColor;
    if (colors != null) result.colors.addAll(colors);
    if (toUser != null) result.toUser = toUser;
    if (heartValue != null) result.heartValue = heartValue;
    if (startTime != null) result.startTime = startTime;
    if (endTime != null) result.endTime = endTime;
    if (hidden != null) result.hidden = hidden;
    if (id != null) result.id = id;
    if (level != null) result.level = level;
    if (loveHouse != null) result.loveHouse = loveHouse;
    return result;
  }

  UserRelationItem._();

  factory UserRelationItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRelationItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRelationItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'type')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aOS(4, _omitFieldNames ? '' : 'bgColor')
    ..pPS(5, _omitFieldNames ? '' : 'colors')
    ..aOM<UserRelationUser>(6, _omitFieldNames ? '' : 'toUser',
        subBuilder: UserRelationUser.create)
    ..aInt64(7, _omitFieldNames ? '' : 'heartValue')
    ..aInt64(8, _omitFieldNames ? '' : 'startTime')
    ..aInt64(9, _omitFieldNames ? '' : 'endTime')
    ..aI(10, _omitFieldNames ? '' : 'hidden')
    ..aInt64(11, _omitFieldNames ? '' : 'id')
    ..aI(12, _omitFieldNames ? '' : 'level')
    ..aOM<LoveHouse>(13, _omitFieldNames ? '' : 'loveHouse',
        subBuilder: LoveHouse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationItem copyWith(void Function(UserRelationItem) updates) =>
      super.copyWith((message) => updates(message as UserRelationItem))
          as UserRelationItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRelationItem create() => UserRelationItem._();
  @$core.override
  UserRelationItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRelationItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRelationItem>(create);
  static UserRelationItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get bgColor => $_getSZ(3);
  @$pb.TagNumber(4)
  set bgColor($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBgColor() => $_has(3);
  @$pb.TagNumber(4)
  void clearBgColor() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get colors => $_getList(4);

  @$pb.TagNumber(6)
  UserRelationUser get toUser => $_getN(5);
  @$pb.TagNumber(6)
  set toUser(UserRelationUser value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasToUser() => $_has(5);
  @$pb.TagNumber(6)
  void clearToUser() => $_clearField(6);
  @$pb.TagNumber(6)
  UserRelationUser ensureToUser() => $_ensure(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get heartValue => $_getI64(6);
  @$pb.TagNumber(7)
  set heartValue($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasHeartValue() => $_has(6);
  @$pb.TagNumber(7)
  void clearHeartValue() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get startTime => $_getI64(7);
  @$pb.TagNumber(8)
  set startTime($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasStartTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearStartTime() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get endTime => $_getI64(8);
  @$pb.TagNumber(9)
  set endTime($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasEndTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearEndTime() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get hidden => $_getIZ(9);
  @$pb.TagNumber(10)
  set hidden($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasHidden() => $_has(9);
  @$pb.TagNumber(10)
  void clearHidden() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get id => $_getI64(10);
  @$pb.TagNumber(11)
  set id($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasId() => $_has(10);
  @$pb.TagNumber(11)
  void clearId() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get level => $_getIZ(11);
  @$pb.TagNumber(12)
  set level($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasLevel() => $_has(11);
  @$pb.TagNumber(12)
  void clearLevel() => $_clearField(12);

  @$pb.TagNumber(13)
  LoveHouse get loveHouse => $_getN(12);
  @$pb.TagNumber(13)
  set loveHouse(LoveHouse value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasLoveHouse() => $_has(12);
  @$pb.TagNumber(13)
  void clearLoveHouse() => $_clearField(13);
  @$pb.TagNumber(13)
  LoveHouse ensureLoveHouse() => $_ensure(12);
}

class HouseSettingReq extends $pb.GeneratedMessage {
  factory HouseSettingReq({
    $core.bool? isVisible,
    $fixnum.Int64? houseId,
    $fixnum.Int64? relationId,
  }) {
    final result = create();
    if (isVisible != null) result.isVisible = isVisible;
    if (houseId != null) result.houseId = houseId;
    if (relationId != null) result.relationId = relationId;
    return result;
  }

  HouseSettingReq._();

  factory HouseSettingReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HouseSettingReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HouseSettingReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isVisible')
    ..aInt64(2, _omitFieldNames ? '' : 'houseId')
    ..aInt64(3, _omitFieldNames ? '' : 'relationId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HouseSettingReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HouseSettingReq copyWith(void Function(HouseSettingReq) updates) =>
      super.copyWith((message) => updates(message as HouseSettingReq))
          as HouseSettingReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HouseSettingReq create() => HouseSettingReq._();
  @$core.override
  HouseSettingReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HouseSettingReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HouseSettingReq>(create);
  static HouseSettingReq? _defaultInstance;

  /// 是否可见
  @$pb.TagNumber(1)
  $core.bool get isVisible => $_getBF(0);
  @$pb.TagNumber(1)
  set isVisible($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsVisible() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsVisible() => $_clearField(1);

  /// 小屋id
  @$pb.TagNumber(2)
  $fixnum.Int64 get houseId => $_getI64(1);
  @$pb.TagNumber(2)
  set houseId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHouseId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHouseId() => $_clearField(2);

  /// 关系id
  @$pb.TagNumber(3)
  $fixnum.Int64 get relationId => $_getI64(2);
  @$pb.TagNumber(3)
  set relationId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRelationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRelationId() => $_clearField(3);
}

class UserRelationsReq extends $pb.GeneratedMessage {
  factory UserRelationsReq({
    $fixnum.Int64? targetId,
  }) {
    final result = create();
    if (targetId != null) result.targetId = targetId;
    return result;
  }

  UserRelationsReq._();

  factory UserRelationsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRelationsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRelationsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'targetId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationsReq copyWith(void Function(UserRelationsReq) updates) =>
      super.copyWith((message) => updates(message as UserRelationsReq))
          as UserRelationsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRelationsReq create() => UserRelationsReq._();
  @$core.override
  UserRelationsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRelationsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRelationsReq>(create);
  static UserRelationsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get targetId => $_getI64(0);
  @$pb.TagNumber(1)
  set targetId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTargetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetId() => $_clearField(1);
}

class UserRelationsRsp extends $pb.GeneratedMessage {
  factory UserRelationsRsp({
    $core.Iterable<RelationGroup>? relationGroups,
  }) {
    final result = create();
    if (relationGroups != null) result.relationGroups.addAll(relationGroups);
    return result;
  }

  UserRelationsRsp._();

  factory UserRelationsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRelationsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRelationsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..pPM<RelationGroup>(1, _omitFieldNames ? '' : 'relationGroups',
        subBuilder: RelationGroup.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationsRsp copyWith(void Function(UserRelationsRsp) updates) =>
      super.copyWith((message) => updates(message as UserRelationsRsp))
          as UserRelationsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRelationsRsp create() => UserRelationsRsp._();
  @$core.override
  UserRelationsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRelationsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRelationsRsp>(create);
  static UserRelationsRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RelationGroup> get relationGroups => $_getList(0);
}

class BuyHouseReq extends $pb.GeneratedMessage {
  factory BuyHouseReq({
    $fixnum.Int64? id,
    $fixnum.Int64? relationId,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (relationId != null) result.relationId = relationId;
    return result;
  }

  BuyHouseReq._();

  factory BuyHouseReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BuyHouseReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BuyHouseReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(3, _omitFieldNames ? '' : 'relationId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuyHouseReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuyHouseReq copyWith(void Function(BuyHouseReq) updates) =>
      super.copyWith((message) => updates(message as BuyHouseReq))
          as BuyHouseReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuyHouseReq create() => BuyHouseReq._();
  @$core.override
  BuyHouseReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BuyHouseReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BuyHouseReq>(create);
  static BuyHouseReq? _defaultInstance;

  /// 小屋id
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 关系id
  @$pb.TagNumber(3)
  $fixnum.Int64 get relationId => $_getI64(1);
  @$pb.TagNumber(3)
  set relationId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(3)
  $core.bool hasRelationId() => $_has(1);
  @$pb.TagNumber(3)
  void clearRelationId() => $_clearField(3);
}

class BuyDecorationReq extends $pb.GeneratedMessage {
  factory BuyDecorationReq({
    $fixnum.Int64? id,
    $fixnum.Int64? houseId,
    $fixnum.Int64? relationId,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (houseId != null) result.houseId = houseId;
    if (relationId != null) result.relationId = relationId;
    return result;
  }

  BuyDecorationReq._();

  factory BuyDecorationReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BuyDecorationReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BuyDecorationReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'houseId')
    ..aInt64(3, _omitFieldNames ? '' : 'relationId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuyDecorationReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuyDecorationReq copyWith(void Function(BuyDecorationReq) updates) =>
      super.copyWith((message) => updates(message as BuyDecorationReq))
          as BuyDecorationReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuyDecorationReq create() => BuyDecorationReq._();
  @$core.override
  BuyDecorationReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BuyDecorationReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BuyDecorationReq>(create);
  static BuyDecorationReq? _defaultInstance;

  /// 装饰id
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 小屋id
  @$pb.TagNumber(2)
  $fixnum.Int64 get houseId => $_getI64(1);
  @$pb.TagNumber(2)
  set houseId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHouseId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHouseId() => $_clearField(2);

  /// 关系id
  @$pb.TagNumber(3)
  $fixnum.Int64 get relationId => $_getI64(2);
  @$pb.TagNumber(3)
  set relationId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRelationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRelationId() => $_clearField(3);
}

class UseDecorationReq extends $pb.GeneratedMessage {
  factory UseDecorationReq({
    $fixnum.Int64? id,
    $fixnum.Int64? houseId,
    $fixnum.Int64? relationId,
    $core.int? operation,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (houseId != null) result.houseId = houseId;
    if (relationId != null) result.relationId = relationId;
    if (operation != null) result.operation = operation;
    return result;
  }

  UseDecorationReq._();

  factory UseDecorationReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UseDecorationReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UseDecorationReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'houseId')
    ..aInt64(3, _omitFieldNames ? '' : 'relationId')
    ..aI(4, _omitFieldNames ? '' : 'operation')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UseDecorationReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UseDecorationReq copyWith(void Function(UseDecorationReq) updates) =>
      super.copyWith((message) => updates(message as UseDecorationReq))
          as UseDecorationReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UseDecorationReq create() => UseDecorationReq._();
  @$core.override
  UseDecorationReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UseDecorationReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UseDecorationReq>(create);
  static UseDecorationReq? _defaultInstance;

  /// 装饰id
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 小屋id
  @$pb.TagNumber(2)
  $fixnum.Int64 get houseId => $_getI64(1);
  @$pb.TagNumber(2)
  set houseId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHouseId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHouseId() => $_clearField(2);

  /// 关系id
  @$pb.TagNumber(3)
  $fixnum.Int64 get relationId => $_getI64(2);
  @$pb.TagNumber(3)
  set relationId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRelationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRelationId() => $_clearField(3);

  /// 操作：1-穿戴，2-取消穿戴
  @$pb.TagNumber(4)
  $core.int get operation => $_getIZ(3);
  @$pb.TagNumber(4)
  set operation($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOperation() => $_has(3);
  @$pb.TagNumber(4)
  void clearOperation() => $_clearField(4);
}

class DecorationsRsp extends $pb.GeneratedMessage {
  factory DecorationsRsp({
    $core.String? decorationGroupName,
    $core.Iterable<Decoration>? decorations,
  }) {
    final result = create();
    if (decorationGroupName != null)
      result.decorationGroupName = decorationGroupName;
    if (decorations != null) result.decorations.addAll(decorations);
    return result;
  }

  DecorationsRsp._();

  factory DecorationsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DecorationsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DecorationsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'decorationGroupName')
    ..pPM<Decoration>(2, _omitFieldNames ? '' : 'decorations',
        subBuilder: Decoration.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DecorationsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DecorationsRsp copyWith(void Function(DecorationsRsp) updates) =>
      super.copyWith((message) => updates(message as DecorationsRsp))
          as DecorationsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DecorationsRsp create() => DecorationsRsp._();
  @$core.override
  DecorationsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DecorationsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DecorationsRsp>(create);
  static DecorationsRsp? _defaultInstance;

  /// 装扮组名称
  @$pb.TagNumber(1)
  $core.String get decorationGroupName => $_getSZ(0);
  @$pb.TagNumber(1)
  set decorationGroupName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDecorationGroupName() => $_has(0);
  @$pb.TagNumber(1)
  void clearDecorationGroupName() => $_clearField(1);

  /// 装扮列表
  @$pb.TagNumber(2)
  $pb.PbList<Decoration> get decorations => $_getList(1);
}

class RelationDetailRsp extends $pb.GeneratedMessage {
  factory RelationDetailRsp({
    Relation? relation,
    $core.Iterable<LoveHouse>? loveHouses,
  }) {
    final result = create();
    if (relation != null) result.relation = relation;
    if (loveHouses != null) result.loveHouses.addAll(loveHouses);
    return result;
  }

  RelationDetailRsp._();

  factory RelationDetailRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RelationDetailRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RelationDetailRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aOM<Relation>(1, _omitFieldNames ? '' : 'relation',
        subBuilder: Relation.create)
    ..pPM<LoveHouse>(2, _omitFieldNames ? '' : 'loveHouses',
        subBuilder: LoveHouse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RelationDetailRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RelationDetailRsp copyWith(void Function(RelationDetailRsp) updates) =>
      super.copyWith((message) => updates(message as RelationDetailRsp))
          as RelationDetailRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RelationDetailRsp create() => RelationDetailRsp._();
  @$core.override
  RelationDetailRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RelationDetailRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RelationDetailRsp>(create);
  static RelationDetailRsp? _defaultInstance;

  /// 关系
  @$pb.TagNumber(1)
  Relation get relation => $_getN(0);
  @$pb.TagNumber(1)
  set relation(Relation value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRelation() => $_has(0);
  @$pb.TagNumber(1)
  void clearRelation() => $_clearField(1);
  @$pb.TagNumber(1)
  Relation ensureRelation() => $_ensure(0);

  /// 情感小屋列表
  @$pb.TagNumber(2)
  $pb.PbList<LoveHouse> get loveHouses => $_getList(1);
}

class RelationGroup extends $pb.GeneratedMessage {
  factory RelationGroup({
    $fixnum.Int64? groupId,
    $core.String? groupName,
    $core.String? groupIcon,
    $core.Iterable<Relation>? relations,
  }) {
    final result = create();
    if (groupId != null) result.groupId = groupId;
    if (groupName != null) result.groupName = groupName;
    if (groupIcon != null) result.groupIcon = groupIcon;
    if (relations != null) result.relations.addAll(relations);
    return result;
  }

  RelationGroup._();

  factory RelationGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RelationGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RelationGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'groupId')
    ..aOS(2, _omitFieldNames ? '' : 'groupName')
    ..aOS(3, _omitFieldNames ? '' : 'groupIcon')
    ..pPM<Relation>(4, _omitFieldNames ? '' : 'relations',
        subBuilder: Relation.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RelationGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RelationGroup copyWith(void Function(RelationGroup) updates) =>
      super.copyWith((message) => updates(message as RelationGroup))
          as RelationGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RelationGroup create() => RelationGroup._();
  @$core.override
  RelationGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RelationGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RelationGroup>(create);
  static RelationGroup? _defaultInstance;

  /// 关系组id
  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => $_clearField(1);

  /// 关系组名称
  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => $_clearField(2);

  /// 关系组图标(可选)
  @$pb.TagNumber(3)
  $core.String get groupIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set groupIcon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGroupIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupIcon() => $_clearField(3);

  /// 关系列表
  @$pb.TagNumber(4)
  $pb.PbList<Relation> get relations => $_getList(3);
}

class Relation extends $pb.GeneratedMessage {
  factory Relation({
    $fixnum.Int64? id,
    $core.int? type,
    $core.String? name,
    $core.String? icon,
    UserRelationUser? fromUser,
    UserRelationUser? toUser,
    $core.int? level,
    $fixnum.Int64? heartValue,
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
    $core.String? bgColor,
    $core.Iterable<$core.String>? colors,
    LoveHouse? loveHouse,
    $core.String? backgroundImage,
    $core.int? hidden,
    $fixnum.Int64? progressValue,
    $fixnum.Int64? progressMax,
    $core.String? fontColor,
    $core.String? progressImage,
    $core.String? jumpLink,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (fromUser != null) result.fromUser = fromUser;
    if (toUser != null) result.toUser = toUser;
    if (level != null) result.level = level;
    if (heartValue != null) result.heartValue = heartValue;
    if (startTime != null) result.startTime = startTime;
    if (endTime != null) result.endTime = endTime;
    if (bgColor != null) result.bgColor = bgColor;
    if (colors != null) result.colors.addAll(colors);
    if (loveHouse != null) result.loveHouse = loveHouse;
    if (backgroundImage != null) result.backgroundImage = backgroundImage;
    if (hidden != null) result.hidden = hidden;
    if (progressValue != null) result.progressValue = progressValue;
    if (progressMax != null) result.progressMax = progressMax;
    if (fontColor != null) result.fontColor = fontColor;
    if (progressImage != null) result.progressImage = progressImage;
    if (jumpLink != null) result.jumpLink = jumpLink;
    return result;
  }

  Relation._();

  factory Relation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Relation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Relation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aI(2, _omitFieldNames ? '' : 'type')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'icon')
    ..aOM<UserRelationUser>(5, _omitFieldNames ? '' : 'fromUser',
        subBuilder: UserRelationUser.create)
    ..aOM<UserRelationUser>(6, _omitFieldNames ? '' : 'toUser',
        subBuilder: UserRelationUser.create)
    ..aI(7, _omitFieldNames ? '' : 'level')
    ..aInt64(8, _omitFieldNames ? '' : 'heartValue')
    ..aInt64(9, _omitFieldNames ? '' : 'startTime')
    ..aInt64(10, _omitFieldNames ? '' : 'endTime')
    ..aOS(11, _omitFieldNames ? '' : 'bgColor')
    ..pPS(12, _omitFieldNames ? '' : 'colors')
    ..aOM<LoveHouse>(13, _omitFieldNames ? '' : 'loveHouse',
        subBuilder: LoveHouse.create)
    ..aOS(14, _omitFieldNames ? '' : 'backgroundImage')
    ..aI(15, _omitFieldNames ? '' : 'hidden')
    ..aInt64(16, _omitFieldNames ? '' : 'progressValue')
    ..aInt64(17, _omitFieldNames ? '' : 'progressMax')
    ..aOS(18, _omitFieldNames ? '' : 'fontColor')
    ..aOS(19, _omitFieldNames ? '' : 'progressImage')
    ..aOS(20, _omitFieldNames ? '' : 'jumpLink')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Relation clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Relation copyWith(void Function(Relation) updates) =>
      super.copyWith((message) => updates(message as Relation)) as Relation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Relation create() => Relation._();
  @$core.override
  Relation createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Relation getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Relation>(create);
  static Relation? _defaultInstance;

  /// 关系id
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 关系类型
  @$pb.TagNumber(2)
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  /// 关系名称
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  /// 关系图标
  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => $_clearField(4);

  /// 用户1(左),belove关系才有
  @$pb.TagNumber(5)
  UserRelationUser get fromUser => $_getN(4);
  @$pb.TagNumber(5)
  set fromUser(UserRelationUser value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasFromUser() => $_has(4);
  @$pb.TagNumber(5)
  void clearFromUser() => $_clearField(5);
  @$pb.TagNumber(5)
  UserRelationUser ensureFromUser() => $_ensure(4);

  /// 用户2(右)
  @$pb.TagNumber(6)
  UserRelationUser get toUser => $_getN(5);
  @$pb.TagNumber(6)
  set toUser(UserRelationUser value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasToUser() => $_has(5);
  @$pb.TagNumber(6)
  void clearToUser() => $_clearField(6);
  @$pb.TagNumber(6)
  UserRelationUser ensureToUser() => $_ensure(5);

  /// 关系等级
  @$pb.TagNumber(7)
  $core.int get level => $_getIZ(6);
  @$pb.TagNumber(7)
  set level($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearLevel() => $_clearField(7);

  /// 守护值
  @$pb.TagNumber(8)
  $fixnum.Int64 get heartValue => $_getI64(7);
  @$pb.TagNumber(8)
  set heartValue($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasHeartValue() => $_has(7);
  @$pb.TagNumber(8)
  void clearHeartValue() => $_clearField(8);

  /// 创建时间
  @$pb.TagNumber(9)
  $fixnum.Int64 get startTime => $_getI64(8);
  @$pb.TagNumber(9)
  set startTime($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasStartTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearStartTime() => $_clearField(9);

  /// 到期时间
  @$pb.TagNumber(10)
  $fixnum.Int64 get endTime => $_getI64(9);
  @$pb.TagNumber(10)
  set endTime($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasEndTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearEndTime() => $_clearField(10);

  /// 背景色
  @$pb.TagNumber(11)
  $core.String get bgColor => $_getSZ(10);
  @$pb.TagNumber(11)
  set bgColor($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasBgColor() => $_has(10);
  @$pb.TagNumber(11)
  void clearBgColor() => $_clearField(11);

  /// 渐变色
  @$pb.TagNumber(12)
  $pb.PbList<$core.String> get colors => $_getList(11);

  /// 情感小屋,belove关系才有
  @$pb.TagNumber(13)
  LoveHouse get loveHouse => $_getN(12);
  @$pb.TagNumber(13)
  set loveHouse(LoveHouse value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasLoveHouse() => $_has(12);
  @$pb.TagNumber(13)
  void clearLoveHouse() => $_clearField(13);
  @$pb.TagNumber(13)
  LoveHouse ensureLoveHouse() => $_ensure(12);

  /// 背景图
  @$pb.TagNumber(14)
  $core.String get backgroundImage => $_getSZ(13);
  @$pb.TagNumber(14)
  set backgroundImage($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasBackgroundImage() => $_has(13);
  @$pb.TagNumber(14)
  void clearBackgroundImage() => $_clearField(14);

  /// 是否隐藏 0 显示 1 隐藏
  @$pb.TagNumber(15)
  $core.int get hidden => $_getIZ(14);
  @$pb.TagNumber(15)
  set hidden($core.int value) => $_setSignedInt32(14, value);
  @$pb.TagNumber(15)
  $core.bool hasHidden() => $_has(14);
  @$pb.TagNumber(15)
  void clearHidden() => $_clearField(15);

  /// 进度条当前值
  @$pb.TagNumber(16)
  $fixnum.Int64 get progressValue => $_getI64(15);
  @$pb.TagNumber(16)
  set progressValue($fixnum.Int64 value) => $_setInt64(15, value);
  @$pb.TagNumber(16)
  $core.bool hasProgressValue() => $_has(15);
  @$pb.TagNumber(16)
  void clearProgressValue() => $_clearField(16);

  /// 进度条最大值
  @$pb.TagNumber(17)
  $fixnum.Int64 get progressMax => $_getI64(16);
  @$pb.TagNumber(17)
  set progressMax($fixnum.Int64 value) => $_setInt64(16, value);
  @$pb.TagNumber(17)
  $core.bool hasProgressMax() => $_has(16);
  @$pb.TagNumber(17)
  void clearProgressMax() => $_clearField(17);

  /// 字体颜色
  @$pb.TagNumber(18)
  $core.String get fontColor => $_getSZ(17);
  @$pb.TagNumber(18)
  set fontColor($core.String value) => $_setString(17, value);
  @$pb.TagNumber(18)
  $core.bool hasFontColor() => $_has(17);
  @$pb.TagNumber(18)
  void clearFontColor() => $_clearField(18);

  /// 进度条图片
  @$pb.TagNumber(19)
  $core.String get progressImage => $_getSZ(18);
  @$pb.TagNumber(19)
  set progressImage($core.String value) => $_setString(18, value);
  @$pb.TagNumber(19)
  $core.bool hasProgressImage() => $_has(18);
  @$pb.TagNumber(19)
  void clearProgressImage() => $_clearField(19);

  /// 跳转链接
  @$pb.TagNumber(20)
  $core.String get jumpLink => $_getSZ(19);
  @$pb.TagNumber(20)
  set jumpLink($core.String value) => $_setString(19, value);
  @$pb.TagNumber(20)
  $core.bool hasJumpLink() => $_has(19);
  @$pb.TagNumber(20)
  void clearJumpLink() => $_clearField(20);
}

class LoveHouse extends $pb.GeneratedMessage {
  factory LoveHouse({
    $fixnum.Int64? id,
    $core.int? level,
    $core.String? name,
    $core.String? icon,
    $core.String? background,
    $core.String? desc,
    $core.Iterable<Decoration>? decorations,
    $fixnum.Int64? price,
    $core.bool? isVisible,
    $core.bool? unlock,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (level != null) result.level = level;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (background != null) result.background = background;
    if (desc != null) result.desc = desc;
    if (decorations != null) result.decorations.addAll(decorations);
    if (price != null) result.price = price;
    if (isVisible != null) result.isVisible = isVisible;
    if (unlock != null) result.unlock = unlock;
    return result;
  }

  LoveHouse._();

  factory LoveHouse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoveHouse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoveHouse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aI(2, _omitFieldNames ? '' : 'level')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'icon')
    ..aOS(5, _omitFieldNames ? '' : 'background')
    ..aOS(6, _omitFieldNames ? '' : 'desc')
    ..pPM<Decoration>(7, _omitFieldNames ? '' : 'decorations',
        subBuilder: Decoration.create)
    ..aInt64(8, _omitFieldNames ? '' : 'price')
    ..aOB(9, _omitFieldNames ? '' : 'isVisible')
    ..aOB(10, _omitFieldNames ? '' : 'unlock')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoveHouse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoveHouse copyWith(void Function(LoveHouse) updates) =>
      super.copyWith((message) => updates(message as LoveHouse)) as LoveHouse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoveHouse create() => LoveHouse._();
  @$core.override
  LoveHouse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoveHouse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoveHouse>(create);
  static LoveHouse? _defaultInstance;

  /// 小屋id
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 等级
  @$pb.TagNumber(2)
  $core.int get level => $_getIZ(1);
  @$pb.TagNumber(2)
  set level($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => $_clearField(2);

  /// 名称
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  /// 图标
  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => $_clearField(4);

  /// 背景
  @$pb.TagNumber(5)
  $core.String get background => $_getSZ(4);
  @$pb.TagNumber(5)
  set background($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBackground() => $_has(4);
  @$pb.TagNumber(5)
  void clearBackground() => $_clearField(5);

  /// 描述
  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => $_clearField(6);

  /// 装饰物
  @$pb.TagNumber(7)
  $pb.PbList<Decoration> get decorations => $_getList(6);

  /// 价格
  @$pb.TagNumber(8)
  $fixnum.Int64 get price => $_getI64(7);
  @$pb.TagNumber(8)
  set price($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearPrice() => $_clearField(8);

  /// 是否可见
  @$pb.TagNumber(9)
  $core.bool get isVisible => $_getBF(8);
  @$pb.TagNumber(9)
  set isVisible($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasIsVisible() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsVisible() => $_clearField(9);

  /// 是否解锁
  @$pb.TagNumber(10)
  $core.bool get unlock => $_getBF(9);
  @$pb.TagNumber(10)
  set unlock($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasUnlock() => $_has(9);
  @$pb.TagNumber(10)
  void clearUnlock() => $_clearField(10);
}

class Decoration extends $pb.GeneratedMessage {
  factory Decoration({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? icon,
    $fixnum.Int64? coin,
    $core.String? desc,
    $core.int? x,
    $core.int? y,
    $core.int? status,
    $core.int? resourceType,
    $core.String? res,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (coin != null) result.coin = coin;
    if (desc != null) result.desc = desc;
    if (x != null) result.x = x;
    if (y != null) result.y = y;
    if (status != null) result.status = status;
    if (resourceType != null) result.resourceType = resourceType;
    if (res != null) result.res = res;
    return result;
  }

  Decoration._();

  factory Decoration.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Decoration.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Decoration',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aInt64(4, _omitFieldNames ? '' : 'coin')
    ..aOS(5, _omitFieldNames ? '' : 'desc')
    ..aI(6, _omitFieldNames ? '' : 'x')
    ..aI(7, _omitFieldNames ? '' : 'y')
    ..aI(8, _omitFieldNames ? '' : 'status')
    ..aI(9, _omitFieldNames ? '' : 'resourceType')
    ..aOS(10, _omitFieldNames ? '' : 'res')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Decoration clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Decoration copyWith(void Function(Decoration) updates) =>
      super.copyWith((message) => updates(message as Decoration)) as Decoration;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Decoration create() => Decoration._();
  @$core.override
  Decoration createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Decoration getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Decoration>(create);
  static Decoration? _defaultInstance;

  /// 装饰id
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 名称
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// 图标
  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  /// 价格
  @$pb.TagNumber(4)
  $fixnum.Int64 get coin => $_getI64(3);
  @$pb.TagNumber(4)
  set coin($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCoin() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoin() => $_clearField(4);

  /// 描述
  @$pb.TagNumber(5)
  $core.String get desc => $_getSZ(4);
  @$pb.TagNumber(5)
  set desc($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDesc() => $_has(4);
  @$pb.TagNumber(5)
  void clearDesc() => $_clearField(5);

  /// 坐标使用千分比整数
  /// x坐标
  @$pb.TagNumber(6)
  $core.int get x => $_getIZ(5);
  @$pb.TagNumber(6)
  set x($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasX() => $_has(5);
  @$pb.TagNumber(6)
  void clearX() => $_clearField(6);

  /// y坐标
  @$pb.TagNumber(7)
  $core.int get y => $_getIZ(6);
  @$pb.TagNumber(7)
  set y($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasY() => $_has(6);
  @$pb.TagNumber(7)
  void clearY() => $_clearField(7);

  /// 状态 0-未购买，1-已购买，2-已使用
  @$pb.TagNumber(8)
  $core.int get status => $_getIZ(7);
  @$pb.TagNumber(8)
  set status($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => $_clearField(8);

  /// 资源类型,0-静态图 1-动态图
  @$pb.TagNumber(9)
  $core.int get resourceType => $_getIZ(8);
  @$pb.TagNumber(9)
  set resourceType($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasResourceType() => $_has(8);
  @$pb.TagNumber(9)
  void clearResourceType() => $_clearField(9);

  /// 装饰资源字段
  @$pb.TagNumber(10)
  $core.String get res => $_getSZ(9);
  @$pb.TagNumber(10)
  set res($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasRes() => $_has(9);
  @$pb.TagNumber(10)
  void clearRes() => $_clearField(10);
}

class UserRelationUser extends $pb.GeneratedMessage {
  factory UserRelationUser({
    $fixnum.Int64? id,
    $core.String? nickname,
    $core.String? avatar,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    return result;
  }

  UserRelationUser._();

  factory UserRelationUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserRelationUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserRelationUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'nickname')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserRelationUser copyWith(void Function(UserRelationUser) updates) =>
      super.copyWith((message) => updates(message as UserRelationUser))
          as UserRelationUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserRelationUser create() => UserRelationUser._();
  @$core.override
  UserRelationUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserRelationUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRelationUser>(create);
  static UserRelationUser? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(3)
  set nickname($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(3)
  void clearNickname() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(4)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(4)
  void clearAvatar() => $_clearField(4);
}

class UserInviteRoomReq extends $pb.GeneratedMessage {
  factory UserInviteRoomReq({
    $fixnum.Int64? roomId,
    $fixnum.Int64? toUid,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (toUid != null) result.toUid = toUid;
    return result;
  }

  UserInviteRoomReq._();

  factory UserInviteRoomReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserInviteRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserInviteRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user_relation'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'toUid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInviteRoomReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInviteRoomReq copyWith(void Function(UserInviteRoomReq) updates) =>
      super.copyWith((message) => updates(message as UserInviteRoomReq))
          as UserInviteRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInviteRoomReq create() => UserInviteRoomReq._();
  @$core.override
  UserInviteRoomReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserInviteRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserInviteRoomReq>(create);
  static UserInviteRoomReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get toUid => $_getI64(1);
  @$pb.TagNumber(2)
  set toUid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearToUid() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

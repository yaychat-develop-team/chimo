// This is a generated file - do not edit.
//
// Generated from server_client/admin/audit.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../base.pb.dart' as $1;
import 'audit.pbenum.dart';
import 'base.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'audit.pbenum.dart';

class BaseAudit extends $pb.GeneratedMessage {
  factory BaseAudit({
    $fixnum.Int64? id,
    AuditResult? machineAuditResult,
    AuditResult? auditResult,
    $fixnum.Int64? creatTime,
    $fixnum.Int64? updateTime,
    $0.AdminUser? operator,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (machineAuditResult != null)
      result.machineAuditResult = machineAuditResult;
    if (auditResult != null) result.auditResult = auditResult;
    if (creatTime != null) result.creatTime = creatTime;
    if (updateTime != null) result.updateTime = updateTime;
    if (operator != null) result.operator = operator;
    return result;
  }

  BaseAudit._();

  factory BaseAudit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BaseAudit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BaseAudit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aE<AuditResult>(2, _omitFieldNames ? '' : 'machineAuditResult',
        protoName: 'machineAuditResult', enumValues: AuditResult.values)
    ..aE<AuditResult>(3, _omitFieldNames ? '' : 'auditResult',
        protoName: 'auditResult', enumValues: AuditResult.values)
    ..aInt64(4, _omitFieldNames ? '' : 'creatTime', protoName: 'creatTime')
    ..aInt64(5, _omitFieldNames ? '' : 'updateTime', protoName: 'updateTime')
    ..aOM<$0.AdminUser>(6, _omitFieldNames ? '' : 'operator',
        subBuilder: $0.AdminUser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BaseAudit clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BaseAudit copyWith(void Function(BaseAudit) updates) =>
      super.copyWith((message) => updates(message as BaseAudit)) as BaseAudit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BaseAudit create() => BaseAudit._();
  @$core.override
  BaseAudit createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BaseAudit getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BaseAudit>(create);
  static BaseAudit? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  AuditResult get machineAuditResult => $_getN(1);
  @$pb.TagNumber(2)
  set machineAuditResult(AuditResult value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMachineAuditResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearMachineAuditResult() => $_clearField(2);

  @$pb.TagNumber(3)
  AuditResult get auditResult => $_getN(2);
  @$pb.TagNumber(3)
  set auditResult(AuditResult value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAuditResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuditResult() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get creatTime => $_getI64(3);
  @$pb.TagNumber(4)
  set creatTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreatTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatTime() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get updateTime => $_getI64(4);
  @$pb.TagNumber(5)
  set updateTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUpdateTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdateTime() => $_clearField(5);

  @$pb.TagNumber(6)
  $0.AdminUser get operator => $_getN(5);
  @$pb.TagNumber(6)
  set operator($0.AdminUser value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasOperator() => $_has(5);
  @$pb.TagNumber(6)
  void clearOperator() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.AdminUser ensureOperator() => $_ensure(5);
}

class UserFieldAudit extends $pb.GeneratedMessage {
  factory UserFieldAudit({
    BaseAudit? base,
    $fixnum.Int64? uid,
    $core.String? nickName,
    $core.String? avatarUrl,
    $core.String? personalSignature,
    $core.String? voiceUrl,
    $core.Iterable<$core.String>? pic,
    $core.Iterable<$core.String>? video,
    UserFieldAuditField? field_9,
    UserFieldAuditFailedReason? failedReason,
  }) {
    final result = create();
    if (base != null) result.base = base;
    if (uid != null) result.uid = uid;
    if (nickName != null) result.nickName = nickName;
    if (avatarUrl != null) result.avatarUrl = avatarUrl;
    if (personalSignature != null) result.personalSignature = personalSignature;
    if (voiceUrl != null) result.voiceUrl = voiceUrl;
    if (pic != null) result.pic.addAll(pic);
    if (video != null) result.video.addAll(video);
    if (field_9 != null) result.field_9 = field_9;
    if (failedReason != null) result.failedReason = failedReason;
    return result;
  }

  UserFieldAudit._();

  factory UserFieldAudit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserFieldAudit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserFieldAudit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..aOM<BaseAudit>(1, _omitFieldNames ? '' : 'base',
        subBuilder: BaseAudit.create)
    ..aInt64(2, _omitFieldNames ? '' : 'uid')
    ..aOS(3, _omitFieldNames ? '' : 'nickName', protoName: 'nickName')
    ..aOS(4, _omitFieldNames ? '' : 'avatarUrl', protoName: 'avatarUrl')
    ..aOS(5, _omitFieldNames ? '' : 'personalSignature',
        protoName: 'personalSignature')
    ..aOS(6, _omitFieldNames ? '' : 'voiceUrl', protoName: 'voiceUrl')
    ..pPS(7, _omitFieldNames ? '' : 'pic')
    ..pPS(8, _omitFieldNames ? '' : 'video')
    ..aE<UserFieldAuditField>(9, _omitFieldNames ? '' : 'field',
        enumValues: UserFieldAuditField.values)
    ..aE<UserFieldAuditFailedReason>(10, _omitFieldNames ? '' : 'failedReason',
        protoName: 'failedReason',
        enumValues: UserFieldAuditFailedReason.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserFieldAudit clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserFieldAudit copyWith(void Function(UserFieldAudit) updates) =>
      super.copyWith((message) => updates(message as UserFieldAudit))
          as UserFieldAudit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserFieldAudit create() => UserFieldAudit._();
  @$core.override
  UserFieldAudit createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserFieldAudit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserFieldAudit>(create);
  static UserFieldAudit? _defaultInstance;

  @$pb.TagNumber(1)
  BaseAudit get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(BaseAudit value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => $_clearField(1);
  @$pb.TagNumber(1)
  BaseAudit ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickName => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickName() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatarUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatarUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAvatarUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatarUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get personalSignature => $_getSZ(4);
  @$pb.TagNumber(5)
  set personalSignature($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPersonalSignature() => $_has(4);
  @$pb.TagNumber(5)
  void clearPersonalSignature() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get voiceUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set voiceUrl($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasVoiceUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearVoiceUrl() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get pic => $_getList(6);

  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get video => $_getList(7);

  @$pb.TagNumber(9)
  UserFieldAuditField get field_9 => $_getN(8);
  @$pb.TagNumber(9)
  set field_9(UserFieldAuditField value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasField_9() => $_has(8);
  @$pb.TagNumber(9)
  void clearField_9() => $_clearField(9);

  @$pb.TagNumber(10)
  UserFieldAuditFailedReason get failedReason => $_getN(9);
  @$pb.TagNumber(10)
  set failedReason(UserFieldAuditFailedReason value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasFailedReason() => $_has(9);
  @$pb.TagNumber(10)
  void clearFailedReason() => $_clearField(10);
}

/// *
///  根据 uid 搜索审核记录
///  post /user-field/searchById
///  body = SearchAuditByIdReq
///  resp = BaseRsp(body = UserFieldAuditRsp)
class SearchAuditByIdReq extends $pb.GeneratedMessage {
  factory SearchAuditByIdReq({
    $core.Iterable<$fixnum.Int64>? uid,
  }) {
    final result = create();
    if (uid != null) result.uid.addAll(uid);
    return result;
  }

  SearchAuditByIdReq._();

  factory SearchAuditByIdReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchAuditByIdReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchAuditByIdReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.K6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchAuditByIdReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchAuditByIdReq copyWith(void Function(SearchAuditByIdReq) updates) =>
      super.copyWith((message) => updates(message as SearchAuditByIdReq))
          as SearchAuditByIdReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchAuditByIdReq create() => SearchAuditByIdReq._();
  @$core.override
  SearchAuditByIdReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchAuditByIdReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchAuditByIdReq>(create);
  static SearchAuditByIdReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get uid => $_getList(0);
}

/// *
///  根据筛选项搜索审核记录
///  post /user-field/search
///  body = SearchUserFieldAuditReq
///  resp = BaseRsp(body = UserFieldAuditRsp)
class SearchUserFieldAuditReq extends $pb.GeneratedMessage {
  factory SearchUserFieldAuditReq({
    UserFieldAuditField? field_1,
    AuditResult? result,
    $fixnum.Int64? operatorUid,
    $fixnum.Int64? createTimeFrom,
    $fixnum.Int64? createTimeTo,
  }) {
    final result$ = create();
    if (field_1 != null) result$.field_1 = field_1;
    if (result != null) result$.result = result;
    if (operatorUid != null) result$.operatorUid = operatorUid;
    if (createTimeFrom != null) result$.createTimeFrom = createTimeFrom;
    if (createTimeTo != null) result$.createTimeTo = createTimeTo;
    return result$;
  }

  SearchUserFieldAuditReq._();

  factory SearchUserFieldAuditReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchUserFieldAuditReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchUserFieldAuditReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..aE<UserFieldAuditField>(1, _omitFieldNames ? '' : 'field',
        enumValues: UserFieldAuditField.values)
    ..aE<AuditResult>(2, _omitFieldNames ? '' : 'result',
        enumValues: AuditResult.values)
    ..aInt64(3, _omitFieldNames ? '' : 'operatorUid', protoName: 'operatorUid')
    ..aInt64(4, _omitFieldNames ? '' : 'createTimeFrom',
        protoName: 'createTimeFrom')
    ..aInt64(5, _omitFieldNames ? '' : 'createTimeTo',
        protoName: 'createTimeTo')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchUserFieldAuditReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchUserFieldAuditReq copyWith(
          void Function(SearchUserFieldAuditReq) updates) =>
      super.copyWith((message) => updates(message as SearchUserFieldAuditReq))
          as SearchUserFieldAuditReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchUserFieldAuditReq create() => SearchUserFieldAuditReq._();
  @$core.override
  SearchUserFieldAuditReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchUserFieldAuditReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchUserFieldAuditReq>(create);
  static SearchUserFieldAuditReq? _defaultInstance;

  @$pb.TagNumber(1)
  UserFieldAuditField get field_1 => $_getN(0);
  @$pb.TagNumber(1)
  set field_1(UserFieldAuditField value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasField_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearField_1() => $_clearField(1);

  @$pb.TagNumber(2)
  AuditResult get result => $_getN(1);
  @$pb.TagNumber(2)
  set result(AuditResult value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get operatorUid => $_getI64(2);
  @$pb.TagNumber(3)
  set operatorUid($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOperatorUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearOperatorUid() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get createTimeFrom => $_getI64(3);
  @$pb.TagNumber(4)
  set createTimeFrom($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreateTimeFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreateTimeFrom() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get createTimeTo => $_getI64(4);
  @$pb.TagNumber(5)
  set createTimeTo($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreateTimeTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateTimeTo() => $_clearField(5);
}

class UserFieldAuditRsp extends $pb.GeneratedMessage {
  factory UserFieldAuditRsp({
    $1.Page? page,
    $core.Iterable<UserFieldAudit>? item,
  }) {
    final result = create();
    if (page != null) result.page = page;
    if (item != null) result.item.addAll(item);
    return result;
  }

  UserFieldAuditRsp._();

  factory UserFieldAuditRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserFieldAuditRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserFieldAuditRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..aOM<$1.Page>(1, _omitFieldNames ? '' : 'page', subBuilder: $1.Page.create)
    ..pPM<UserFieldAudit>(2, _omitFieldNames ? '' : 'item',
        subBuilder: UserFieldAudit.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserFieldAuditRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserFieldAuditRsp copyWith(void Function(UserFieldAuditRsp) updates) =>
      super.copyWith((message) => updates(message as UserFieldAuditRsp))
          as UserFieldAuditRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserFieldAuditRsp create() => UserFieldAuditRsp._();
  @$core.override
  UserFieldAuditRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserFieldAuditRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserFieldAuditRsp>(create);
  static UserFieldAuditRsp? _defaultInstance;

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
  $pb.PbList<UserFieldAudit> get item => $_getList(1);
}

/// *
///  设置审核结果
///  post /user-field/audit
///  body = UserFieldAuditReq
///  resp = BaseRsp
class UserFieldAuditReq extends $pb.GeneratedMessage {
  factory UserFieldAuditReq({
    $core.Iterable<$fixnum.Int64>? id,
    AuditResult? result,
    UserFieldAuditFailedReason? failedReason,
  }) {
    final result$ = create();
    if (id != null) result$.id.addAll(id);
    if (result != null) result$.result = result;
    if (failedReason != null) result$.failedReason = failedReason;
    return result$;
  }

  UserFieldAuditReq._();

  factory UserFieldAuditReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserFieldAuditReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserFieldAuditReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.K6)
    ..aE<AuditResult>(2, _omitFieldNames ? '' : 'result',
        enumValues: AuditResult.values)
    ..aE<UserFieldAuditFailedReason>(3, _omitFieldNames ? '' : 'failedReason',
        protoName: 'failedReason',
        enumValues: UserFieldAuditFailedReason.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserFieldAuditReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserFieldAuditReq copyWith(void Function(UserFieldAuditReq) updates) =>
      super.copyWith((message) => updates(message as UserFieldAuditReq))
          as UserFieldAuditReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserFieldAuditReq create() => UserFieldAuditReq._();
  @$core.override
  UserFieldAuditReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserFieldAuditReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserFieldAuditReq>(create);
  static UserFieldAuditReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get id => $_getList(0);

  @$pb.TagNumber(2)
  AuditResult get result => $_getN(1);
  @$pb.TagNumber(2)
  set result(AuditResult value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => $_clearField(2);

  @$pb.TagNumber(3)
  UserFieldAuditFailedReason get failedReason => $_getN(2);
  @$pb.TagNumber(3)
  set failedReason(UserFieldAuditFailedReason value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFailedReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearFailedReason() => $_clearField(3);
}

class GsRegisterAudit extends $pb.GeneratedMessage {
  factory GsRegisterAudit({
    BaseAudit? base,
    $fixnum.Int64? uid,
    $core.String? nickName,
    $core.String? gender,
    $core.String? avatar,
    $core.String? ipCity,
    $core.String? introductionUrl,
    $core.String? talendShowUrl,
    $core.String? videoAuthURl,
    $core.String? otherAccounts,
    $core.String? homePageUrl,
    $core.Iterable<$0.LabelDesc>? label,
  }) {
    final result = create();
    if (base != null) result.base = base;
    if (uid != null) result.uid = uid;
    if (nickName != null) result.nickName = nickName;
    if (gender != null) result.gender = gender;
    if (avatar != null) result.avatar = avatar;
    if (ipCity != null) result.ipCity = ipCity;
    if (introductionUrl != null) result.introductionUrl = introductionUrl;
    if (talendShowUrl != null) result.talendShowUrl = talendShowUrl;
    if (videoAuthURl != null) result.videoAuthURl = videoAuthURl;
    if (otherAccounts != null) result.otherAccounts = otherAccounts;
    if (homePageUrl != null) result.homePageUrl = homePageUrl;
    if (label != null) result.label.addAll(label);
    return result;
  }

  GsRegisterAudit._();

  factory GsRegisterAudit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsRegisterAudit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsRegisterAudit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..aOM<BaseAudit>(1, _omitFieldNames ? '' : 'base',
        subBuilder: BaseAudit.create)
    ..aInt64(2, _omitFieldNames ? '' : 'uid')
    ..aOS(3, _omitFieldNames ? '' : 'nickName', protoName: 'nickName')
    ..aOS(4, _omitFieldNames ? '' : 'gender')
    ..aOS(5, _omitFieldNames ? '' : 'avatar')
    ..aOS(6, _omitFieldNames ? '' : 'ipCity', protoName: 'ipCity')
    ..aOS(7, _omitFieldNames ? '' : 'introductionUrl',
        protoName: 'introductionUrl')
    ..aOS(8, _omitFieldNames ? '' : 'talendShowUrl', protoName: 'talendShowUrl')
    ..aOS(9, _omitFieldNames ? '' : 'videoAuthURl', protoName: 'videoAuthURl')
    ..aOS(10, _omitFieldNames ? '' : 'otherAccounts',
        protoName: 'otherAccounts')
    ..aOS(11, _omitFieldNames ? '' : 'homePageUrl', protoName: 'homePageUrl')
    ..pPM<$0.LabelDesc>(12, _omitFieldNames ? '' : 'label',
        subBuilder: $0.LabelDesc.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsRegisterAudit clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsRegisterAudit copyWith(void Function(GsRegisterAudit) updates) =>
      super.copyWith((message) => updates(message as GsRegisterAudit))
          as GsRegisterAudit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsRegisterAudit create() => GsRegisterAudit._();
  @$core.override
  GsRegisterAudit createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsRegisterAudit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsRegisterAudit>(create);
  static GsRegisterAudit? _defaultInstance;

  @$pb.TagNumber(1)
  BaseAudit get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(BaseAudit value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => $_clearField(1);
  @$pb.TagNumber(1)
  BaseAudit ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickName => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickName() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get gender => $_getSZ(3);
  @$pb.TagNumber(4)
  set gender($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get avatar => $_getSZ(4);
  @$pb.TagNumber(5)
  set avatar($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAvatar() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvatar() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get ipCity => $_getSZ(5);
  @$pb.TagNumber(6)
  set ipCity($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIpCity() => $_has(5);
  @$pb.TagNumber(6)
  void clearIpCity() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get introductionUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set introductionUrl($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasIntroductionUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearIntroductionUrl() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get talendShowUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set talendShowUrl($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTalendShowUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearTalendShowUrl() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get videoAuthURl => $_getSZ(8);
  @$pb.TagNumber(9)
  set videoAuthURl($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasVideoAuthURl() => $_has(8);
  @$pb.TagNumber(9)
  void clearVideoAuthURl() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get otherAccounts => $_getSZ(9);
  @$pb.TagNumber(10)
  set otherAccounts($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasOtherAccounts() => $_has(9);
  @$pb.TagNumber(10)
  void clearOtherAccounts() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get homePageUrl => $_getSZ(10);
  @$pb.TagNumber(11)
  set homePageUrl($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasHomePageUrl() => $_has(10);
  @$pb.TagNumber(11)
  void clearHomePageUrl() => $_clearField(11);

  @$pb.TagNumber(12)
  $pb.PbList<$0.LabelDesc> get label => $_getList(11);
}

/// *
///  根据 uid 搜索审核记录
///  post /gs/searchById
///  body = SearchAuditByIdReq
///  resp = BaseRsp(body = GsRegisterAuditRsp)
class GsRegisterAuditRsp extends $pb.GeneratedMessage {
  factory GsRegisterAuditRsp({
    $1.Page? page,
    $core.Iterable<GsRegisterAudit>? item,
  }) {
    final result = create();
    if (page != null) result.page = page;
    if (item != null) result.item.addAll(item);
    return result;
  }

  GsRegisterAuditRsp._();

  factory GsRegisterAuditRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsRegisterAuditRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsRegisterAuditRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..aOM<$1.Page>(1, _omitFieldNames ? '' : 'page', subBuilder: $1.Page.create)
    ..pPM<GsRegisterAudit>(2, _omitFieldNames ? '' : 'item',
        subBuilder: GsRegisterAudit.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsRegisterAuditRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsRegisterAuditRsp copyWith(void Function(GsRegisterAuditRsp) updates) =>
      super.copyWith((message) => updates(message as GsRegisterAuditRsp))
          as GsRegisterAuditRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsRegisterAuditRsp create() => GsRegisterAuditRsp._();
  @$core.override
  GsRegisterAuditRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsRegisterAuditRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsRegisterAuditRsp>(create);
  static GsRegisterAuditRsp? _defaultInstance;

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
  $pb.PbList<GsRegisterAudit> get item => $_getList(1);
}

/// *
///  根据筛选项搜索审核记录
///  post /gs/search
///  body = SearchGsAuditReq
///  resp = BaseRsp(body = UserFieldAuditRsp)
class SearchGsAuditReq extends $pb.GeneratedMessage {
  factory SearchGsAuditReq({
    $core.String? gender,
    AuditResult? result,
    $fixnum.Int64? operatorUid,
    $fixnum.Int64? createTimeFrom,
    $fixnum.Int64? createTimeTo,
  }) {
    final result$ = create();
    if (gender != null) result$.gender = gender;
    if (result != null) result$.result = result;
    if (operatorUid != null) result$.operatorUid = operatorUid;
    if (createTimeFrom != null) result$.createTimeFrom = createTimeFrom;
    if (createTimeTo != null) result$.createTimeTo = createTimeTo;
    return result$;
  }

  SearchGsAuditReq._();

  factory SearchGsAuditReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchGsAuditReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchGsAuditReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gender')
    ..aE<AuditResult>(2, _omitFieldNames ? '' : 'result',
        enumValues: AuditResult.values)
    ..aInt64(3, _omitFieldNames ? '' : 'operatorUid', protoName: 'operatorUid')
    ..aInt64(4, _omitFieldNames ? '' : 'createTimeFrom',
        protoName: 'createTimeFrom')
    ..aInt64(5, _omitFieldNames ? '' : 'createTimeTo',
        protoName: 'createTimeTo')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchGsAuditReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchGsAuditReq copyWith(void Function(SearchGsAuditReq) updates) =>
      super.copyWith((message) => updates(message as SearchGsAuditReq))
          as SearchGsAuditReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchGsAuditReq create() => SearchGsAuditReq._();
  @$core.override
  SearchGsAuditReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchGsAuditReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchGsAuditReq>(create);
  static SearchGsAuditReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gender => $_getSZ(0);
  @$pb.TagNumber(1)
  set gender($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGender() => $_has(0);
  @$pb.TagNumber(1)
  void clearGender() => $_clearField(1);

  @$pb.TagNumber(2)
  AuditResult get result => $_getN(1);
  @$pb.TagNumber(2)
  set result(AuditResult value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get operatorUid => $_getI64(2);
  @$pb.TagNumber(3)
  set operatorUid($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOperatorUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearOperatorUid() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get createTimeFrom => $_getI64(3);
  @$pb.TagNumber(4)
  set createTimeFrom($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreateTimeFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreateTimeFrom() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get createTimeTo => $_getI64(4);
  @$pb.TagNumber(5)
  set createTimeTo($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreateTimeTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateTimeTo() => $_clearField(5);
}

/// *
///  设置审核结果
///  post /gs/audit
///  body = UserFieldAuditReq
///  resp = BaseRsp
class GsRegisterAuditReq extends $pb.GeneratedMessage {
  factory GsRegisterAuditReq({
    $core.Iterable<$fixnum.Int64>? id,
    AuditResult? result,
    $fixnum.Int64? labelId,
  }) {
    final result$ = create();
    if (id != null) result$.id.addAll(id);
    if (result != null) result$.result = result;
    if (labelId != null) result$.labelId = labelId;
    return result$;
  }

  GsRegisterAuditReq._();

  factory GsRegisterAuditReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsRegisterAuditReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsRegisterAuditReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.K6)
    ..aE<AuditResult>(2, _omitFieldNames ? '' : 'result',
        enumValues: AuditResult.values)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'labelId', $pb.PbFieldType.OU6,
        protoName: 'labelId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsRegisterAuditReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsRegisterAuditReq copyWith(void Function(GsRegisterAuditReq) updates) =>
      super.copyWith((message) => updates(message as GsRegisterAuditReq))
          as GsRegisterAuditReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsRegisterAuditReq create() => GsRegisterAuditReq._();
  @$core.override
  GsRegisterAuditReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsRegisterAuditReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsRegisterAuditReq>(create);
  static GsRegisterAuditReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get id => $_getList(0);

  @$pb.TagNumber(2)
  AuditResult get result => $_getN(1);
  @$pb.TagNumber(2)
  set result(AuditResult value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get labelId => $_getI64(2);
  @$pb.TagNumber(3)
  set labelId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLabelId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLabelId() => $_clearField(3);
}

class CarOwnerAudit extends $pb.GeneratedMessage {
  factory CarOwnerAudit({
    BaseAudit? base,
    $fixnum.Int64? uid,
    $core.String? nickName,
    $core.String? gender,
    $core.String? ipCity,
    $core.String? carBrand,
    $core.int? carGuidePrice,
    $core.Iterable<$core.String>? driverLicensePic,
    $core.String? idName,
  }) {
    final result = create();
    if (base != null) result.base = base;
    if (uid != null) result.uid = uid;
    if (nickName != null) result.nickName = nickName;
    if (gender != null) result.gender = gender;
    if (ipCity != null) result.ipCity = ipCity;
    if (carBrand != null) result.carBrand = carBrand;
    if (carGuidePrice != null) result.carGuidePrice = carGuidePrice;
    if (driverLicensePic != null)
      result.driverLicensePic.addAll(driverLicensePic);
    if (idName != null) result.idName = idName;
    return result;
  }

  CarOwnerAudit._();

  factory CarOwnerAudit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarOwnerAudit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarOwnerAudit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..aOM<BaseAudit>(1, _omitFieldNames ? '' : 'base',
        subBuilder: BaseAudit.create)
    ..aInt64(2, _omitFieldNames ? '' : 'uid')
    ..aOS(3, _omitFieldNames ? '' : 'nickName', protoName: 'nickName')
    ..aOS(4, _omitFieldNames ? '' : 'gender')
    ..aOS(5, _omitFieldNames ? '' : 'ipCity', protoName: 'ipCity')
    ..aOS(6, _omitFieldNames ? '' : 'carBrand', protoName: 'carBrand')
    ..aI(7, _omitFieldNames ? '' : 'carGuidePrice', protoName: 'carGuidePrice')
    ..pPS(8, _omitFieldNames ? '' : 'driverLicensePic',
        protoName: 'driverLicensePic')
    ..aOS(9, _omitFieldNames ? '' : 'idName', protoName: 'idName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarOwnerAudit clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarOwnerAudit copyWith(void Function(CarOwnerAudit) updates) =>
      super.copyWith((message) => updates(message as CarOwnerAudit))
          as CarOwnerAudit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarOwnerAudit create() => CarOwnerAudit._();
  @$core.override
  CarOwnerAudit createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarOwnerAudit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarOwnerAudit>(create);
  static CarOwnerAudit? _defaultInstance;

  @$pb.TagNumber(1)
  BaseAudit get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(BaseAudit value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => $_clearField(1);
  @$pb.TagNumber(1)
  BaseAudit ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickName => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickName() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get gender => $_getSZ(3);
  @$pb.TagNumber(4)
  set gender($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get ipCity => $_getSZ(4);
  @$pb.TagNumber(5)
  set ipCity($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIpCity() => $_has(4);
  @$pb.TagNumber(5)
  void clearIpCity() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get carBrand => $_getSZ(5);
  @$pb.TagNumber(6)
  set carBrand($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCarBrand() => $_has(5);
  @$pb.TagNumber(6)
  void clearCarBrand() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get carGuidePrice => $_getIZ(6);
  @$pb.TagNumber(7)
  set carGuidePrice($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCarGuidePrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearCarGuidePrice() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get driverLicensePic => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get idName => $_getSZ(8);
  @$pb.TagNumber(9)
  set idName($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasIdName() => $_has(8);
  @$pb.TagNumber(9)
  void clearIdName() => $_clearField(9);
}

/// *
///  根据 uid 搜索审核记录
///  post /car-owner/searchById
///  body = SearchAuditByIdReq
///  resp = BaseRsp(body = CarOwnerAuditRsp)
class CarOwnerAuditRsp extends $pb.GeneratedMessage {
  factory CarOwnerAuditRsp({
    $1.Page? page,
    $core.Iterable<CarOwnerAudit>? item,
  }) {
    final result = create();
    if (page != null) result.page = page;
    if (item != null) result.item.addAll(item);
    return result;
  }

  CarOwnerAuditRsp._();

  factory CarOwnerAuditRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarOwnerAuditRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarOwnerAuditRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..aOM<$1.Page>(1, _omitFieldNames ? '' : 'page', subBuilder: $1.Page.create)
    ..pPM<CarOwnerAudit>(2, _omitFieldNames ? '' : 'item',
        subBuilder: CarOwnerAudit.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarOwnerAuditRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarOwnerAuditRsp copyWith(void Function(CarOwnerAuditRsp) updates) =>
      super.copyWith((message) => updates(message as CarOwnerAuditRsp))
          as CarOwnerAuditRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarOwnerAuditRsp create() => CarOwnerAuditRsp._();
  @$core.override
  CarOwnerAuditRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarOwnerAuditRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarOwnerAuditRsp>(create);
  static CarOwnerAuditRsp? _defaultInstance;

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
  $pb.PbList<CarOwnerAudit> get item => $_getList(1);
}

/// *
///  根据筛选项搜索审核记录
///  post /car-owner/search
///  body = SearchCarOwnerAuditReq
///  resp = BaseRsp(body = UserFieldAuditRsp)
class SearchCarOwnerAuditReq extends $pb.GeneratedMessage {
  factory SearchCarOwnerAuditReq({
    AuditResult? result,
    $core.String? carBrand,
    $fixnum.Int64? carGuidePriceFrom,
    $fixnum.Int64? carGuidePriceTo,
    $fixnum.Int64? operatorUid,
    $fixnum.Int64? createTimeFrom,
    $fixnum.Int64? createTimeTo,
  }) {
    final result$ = create();
    if (result != null) result$.result = result;
    if (carBrand != null) result$.carBrand = carBrand;
    if (carGuidePriceFrom != null)
      result$.carGuidePriceFrom = carGuidePriceFrom;
    if (carGuidePriceTo != null) result$.carGuidePriceTo = carGuidePriceTo;
    if (operatorUid != null) result$.operatorUid = operatorUid;
    if (createTimeFrom != null) result$.createTimeFrom = createTimeFrom;
    if (createTimeTo != null) result$.createTimeTo = createTimeTo;
    return result$;
  }

  SearchCarOwnerAuditReq._();

  factory SearchCarOwnerAuditReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchCarOwnerAuditReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchCarOwnerAuditReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..aE<AuditResult>(1, _omitFieldNames ? '' : 'result',
        enumValues: AuditResult.values)
    ..aOS(2, _omitFieldNames ? '' : 'carBrand', protoName: 'carBrand')
    ..aInt64(3, _omitFieldNames ? '' : 'carGuidePriceFrom',
        protoName: 'carGuidePriceFrom')
    ..aInt64(4, _omitFieldNames ? '' : 'carGuidePriceTo',
        protoName: 'carGuidePriceTo')
    ..aInt64(5, _omitFieldNames ? '' : 'operatorUid', protoName: 'operatorUid')
    ..aInt64(6, _omitFieldNames ? '' : 'createTimeFrom',
        protoName: 'createTimeFrom')
    ..aInt64(7, _omitFieldNames ? '' : 'createTimeTo',
        protoName: 'createTimeTo')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchCarOwnerAuditReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchCarOwnerAuditReq copyWith(
          void Function(SearchCarOwnerAuditReq) updates) =>
      super.copyWith((message) => updates(message as SearchCarOwnerAuditReq))
          as SearchCarOwnerAuditReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchCarOwnerAuditReq create() => SearchCarOwnerAuditReq._();
  @$core.override
  SearchCarOwnerAuditReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchCarOwnerAuditReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchCarOwnerAuditReq>(create);
  static SearchCarOwnerAuditReq? _defaultInstance;

  @$pb.TagNumber(1)
  AuditResult get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(AuditResult value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get carBrand => $_getSZ(1);
  @$pb.TagNumber(2)
  set carBrand($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCarBrand() => $_has(1);
  @$pb.TagNumber(2)
  void clearCarBrand() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get carGuidePriceFrom => $_getI64(2);
  @$pb.TagNumber(3)
  set carGuidePriceFrom($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCarGuidePriceFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearCarGuidePriceFrom() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get carGuidePriceTo => $_getI64(3);
  @$pb.TagNumber(4)
  set carGuidePriceTo($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCarGuidePriceTo() => $_has(3);
  @$pb.TagNumber(4)
  void clearCarGuidePriceTo() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get operatorUid => $_getI64(4);
  @$pb.TagNumber(5)
  set operatorUid($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOperatorUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearOperatorUid() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get createTimeFrom => $_getI64(5);
  @$pb.TagNumber(6)
  set createTimeFrom($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreateTimeFrom() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTimeFrom() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get createTimeTo => $_getI64(6);
  @$pb.TagNumber(7)
  set createTimeTo($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCreateTimeTo() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreateTimeTo() => $_clearField(7);
}

/// *
///  设置审核结果
///  post /car-owner/audit
///  body = CarOwnerAuditReq
///  resp = BaseRsp
class CarOwnerAuditReq extends $pb.GeneratedMessage {
  factory CarOwnerAuditReq({
    $core.Iterable<$fixnum.Int64>? id,
    AuditResult? result,
    $core.String? carBrand,
    $fixnum.Int64? carGuidePrice,
  }) {
    final result$ = create();
    if (id != null) result$.id.addAll(id);
    if (result != null) result$.result = result;
    if (carBrand != null) result$.carBrand = carBrand;
    if (carGuidePrice != null) result$.carGuidePrice = carGuidePrice;
    return result$;
  }

  CarOwnerAuditReq._();

  factory CarOwnerAuditReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CarOwnerAuditReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CarOwnerAuditReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.K6)
    ..aE<AuditResult>(2, _omitFieldNames ? '' : 'result',
        enumValues: AuditResult.values)
    ..aOS(3, _omitFieldNames ? '' : 'carBrand', protoName: 'carBrand')
    ..aInt64(4, _omitFieldNames ? '' : 'carGuidePrice',
        protoName: 'carGuidePrice')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarOwnerAuditReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CarOwnerAuditReq copyWith(void Function(CarOwnerAuditReq) updates) =>
      super.copyWith((message) => updates(message as CarOwnerAuditReq))
          as CarOwnerAuditReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CarOwnerAuditReq create() => CarOwnerAuditReq._();
  @$core.override
  CarOwnerAuditReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CarOwnerAuditReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CarOwnerAuditReq>(create);
  static CarOwnerAuditReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get id => $_getList(0);

  @$pb.TagNumber(2)
  AuditResult get result => $_getN(1);
  @$pb.TagNumber(2)
  set result(AuditResult value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get carBrand => $_getSZ(2);
  @$pb.TagNumber(3)
  set carBrand($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCarBrand() => $_has(2);
  @$pb.TagNumber(3)
  void clearCarBrand() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get carGuidePrice => $_getI64(3);
  @$pb.TagNumber(4)
  set carGuidePrice($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCarGuidePrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearCarGuidePrice() => $_clearField(4);
}

class ChannelAudit extends $pb.GeneratedMessage {
  factory ChannelAudit({
    BaseAudit? base,
    $fixnum.Int64? channelId,
    ChannelAuditField? field_3,
    $core.String? title,
    $core.String? cover,
    $core.String? notice,
  }) {
    final result = create();
    if (base != null) result.base = base;
    if (channelId != null) result.channelId = channelId;
    if (field_3 != null) result.field_3 = field_3;
    if (title != null) result.title = title;
    if (cover != null) result.cover = cover;
    if (notice != null) result.notice = notice;
    return result;
  }

  ChannelAudit._();

  factory ChannelAudit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelAudit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelAudit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..aOM<BaseAudit>(1, _omitFieldNames ? '' : 'base',
        subBuilder: BaseAudit.create)
    ..aInt64(2, _omitFieldNames ? '' : 'channelId', protoName: 'channelId')
    ..aE<ChannelAuditField>(3, _omitFieldNames ? '' : 'field',
        enumValues: ChannelAuditField.values)
    ..aOS(4, _omitFieldNames ? '' : 'title')
    ..aOS(5, _omitFieldNames ? '' : 'cover')
    ..aOS(6, _omitFieldNames ? '' : 'notice')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelAudit clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelAudit copyWith(void Function(ChannelAudit) updates) =>
      super.copyWith((message) => updates(message as ChannelAudit))
          as ChannelAudit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelAudit create() => ChannelAudit._();
  @$core.override
  ChannelAudit createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelAudit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelAudit>(create);
  static ChannelAudit? _defaultInstance;

  @$pb.TagNumber(1)
  BaseAudit get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(BaseAudit value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => $_clearField(1);
  @$pb.TagNumber(1)
  BaseAudit ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get channelId => $_getI64(1);
  @$pb.TagNumber(2)
  set channelId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => $_clearField(2);

  @$pb.TagNumber(3)
  ChannelAuditField get field_3 => $_getN(2);
  @$pb.TagNumber(3)
  set field_3(ChannelAuditField value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasField_3() => $_has(2);
  @$pb.TagNumber(3)
  void clearField_3() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get cover => $_getSZ(4);
  @$pb.TagNumber(5)
  set cover($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCover() => $_has(4);
  @$pb.TagNumber(5)
  void clearCover() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get notice => $_getSZ(5);
  @$pb.TagNumber(6)
  set notice($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNotice() => $_has(5);
  @$pb.TagNumber(6)
  void clearNotice() => $_clearField(6);
}

/// *
///  根据 uid 搜索审核记录
///  post /channel/searchById
///  body = SearchAuditByIdReq
///  resp = BaseRsp(body = ChannelAuditRsp)
class ChannelAuditRsp extends $pb.GeneratedMessage {
  factory ChannelAuditRsp({
    $1.Page? page,
    $core.Iterable<ChannelAudit>? item,
  }) {
    final result = create();
    if (page != null) result.page = page;
    if (item != null) result.item.addAll(item);
    return result;
  }

  ChannelAuditRsp._();

  factory ChannelAuditRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelAuditRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelAuditRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..aOM<$1.Page>(1, _omitFieldNames ? '' : 'page', subBuilder: $1.Page.create)
    ..pPM<ChannelAudit>(2, _omitFieldNames ? '' : 'item',
        subBuilder: ChannelAudit.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelAuditRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelAuditRsp copyWith(void Function(ChannelAuditRsp) updates) =>
      super.copyWith((message) => updates(message as ChannelAuditRsp))
          as ChannelAuditRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelAuditRsp create() => ChannelAuditRsp._();
  @$core.override
  ChannelAuditRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelAuditRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelAuditRsp>(create);
  static ChannelAuditRsp? _defaultInstance;

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
  $pb.PbList<ChannelAudit> get item => $_getList(1);
}

/// *
///  根据筛选项搜索审核记录
///  post /car-owner/search
///  body = SearchCarOwnerAuditReq
///  resp = BaseRsp(body = ChannelAuditRsp)
class SearchChannelAuditReq extends $pb.GeneratedMessage {
  factory SearchChannelAuditReq({
    AuditResult? result,
    $fixnum.Int64? operatorId,
    ChannelAuditField? field_3,
    $fixnum.Int64? createTimeFrom,
    $fixnum.Int64? createTimeTo,
  }) {
    final result$ = create();
    if (result != null) result$.result = result;
    if (operatorId != null) result$.operatorId = operatorId;
    if (field_3 != null) result$.field_3 = field_3;
    if (createTimeFrom != null) result$.createTimeFrom = createTimeFrom;
    if (createTimeTo != null) result$.createTimeTo = createTimeTo;
    return result$;
  }

  SearchChannelAuditReq._();

  factory SearchChannelAuditReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchChannelAuditReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchChannelAuditReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..aE<AuditResult>(1, _omitFieldNames ? '' : 'result',
        enumValues: AuditResult.values)
    ..aInt64(2, _omitFieldNames ? '' : 'operatorId', protoName: 'operatorId')
    ..aE<ChannelAuditField>(3, _omitFieldNames ? '' : 'field',
        enumValues: ChannelAuditField.values)
    ..aInt64(4, _omitFieldNames ? '' : 'createTimeFrom',
        protoName: 'createTimeFrom')
    ..aInt64(5, _omitFieldNames ? '' : 'createTimeTo',
        protoName: 'createTimeTo')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchChannelAuditReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchChannelAuditReq copyWith(
          void Function(SearchChannelAuditReq) updates) =>
      super.copyWith((message) => updates(message as SearchChannelAuditReq))
          as SearchChannelAuditReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchChannelAuditReq create() => SearchChannelAuditReq._();
  @$core.override
  SearchChannelAuditReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchChannelAuditReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchChannelAuditReq>(create);
  static SearchChannelAuditReq? _defaultInstance;

  @$pb.TagNumber(1)
  AuditResult get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(AuditResult value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get operatorId => $_getI64(1);
  @$pb.TagNumber(2)
  set operatorId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOperatorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperatorId() => $_clearField(2);

  @$pb.TagNumber(3)
  ChannelAuditField get field_3 => $_getN(2);
  @$pb.TagNumber(3)
  set field_3(ChannelAuditField value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasField_3() => $_has(2);
  @$pb.TagNumber(3)
  void clearField_3() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get createTimeFrom => $_getI64(3);
  @$pb.TagNumber(4)
  set createTimeFrom($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreateTimeFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreateTimeFrom() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get createTimeTo => $_getI64(4);
  @$pb.TagNumber(5)
  set createTimeTo($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreateTimeTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateTimeTo() => $_clearField(5);
}

/// *
///  设置审核结果
///  post /channel/audit
///  body = ChannelAuditReq
///  resp = BaseRsp
class ChannelAuditReq extends $pb.GeneratedMessage {
  factory ChannelAuditReq({
    $core.Iterable<$fixnum.Int64>? id,
    AuditResult? result,
  }) {
    final result$ = create();
    if (id != null) result$.id.addAll(id);
    if (result != null) result$.result = result;
    return result$;
  }

  ChannelAuditReq._();

  factory ChannelAuditReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelAuditReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelAuditReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminAudio'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.K6)
    ..aE<AuditResult>(2, _omitFieldNames ? '' : 'result',
        enumValues: AuditResult.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelAuditReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelAuditReq copyWith(void Function(ChannelAuditReq) updates) =>
      super.copyWith((message) => updates(message as ChannelAuditReq))
          as ChannelAuditReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelAuditReq create() => ChannelAuditReq._();
  @$core.override
  ChannelAuditReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelAuditReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelAuditReq>(create);
  static ChannelAuditReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get id => $_getList(0);

  @$pb.TagNumber(2)
  AuditResult get result => $_getN(1);
  @$pb.TagNumber(2)
  set result(AuditResult value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

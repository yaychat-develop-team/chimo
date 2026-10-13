// This is a generated file - do not edit.
//
// Generated from server_client/leader.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GetLeaderResp extends $pb.GeneratedMessage {
  factory GetLeaderResp({
    $fixnum.Int64? leaderId,
    $core.String? nickName,
    $core.String? url,
    $fixnum.Int64? userId,
    $core.int? status,
  }) {
    final result = create();
    if (leaderId != null) result.leaderId = leaderId;
    if (nickName != null) result.nickName = nickName;
    if (url != null) result.url = url;
    if (userId != null) result.userId = userId;
    if (status != null) result.status = status;
    return result;
  }

  GetLeaderResp._();

  factory GetLeaderResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetLeaderResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetLeaderResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'leader'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'leaderId')
    ..aOS(2, _omitFieldNames ? '' : 'nickName')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(5, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLeaderResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLeaderResp copyWith(void Function(GetLeaderResp) updates) =>
      super.copyWith((message) => updates(message as GetLeaderResp))
          as GetLeaderResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLeaderResp create() => GetLeaderResp._();
  @$core.override
  GetLeaderResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetLeaderResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLeaderResp>(create);
  static GetLeaderResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get leaderId => $_getI64(0);
  @$pb.TagNumber(1)
  set leaderId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLeaderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeaderId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickName() => $_clearField(2);

  /// *
  /// 头像
  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get userId => $_getI64(3);
  @$pb.TagNumber(4)
  set userId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => $_clearField(4);

  /// *
  /// 该分配记录状态
  /// 0=预分配
  /// 1=GS已确认
  @$pb.TagNumber(5)
  $core.int get status => $_getIZ(4);
  @$pb.TagNumber(5)
  set status($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);
}

class SetLeaderReq extends $pb.GeneratedMessage {
  factory SetLeaderReq({
    $fixnum.Int64? leaderId,
  }) {
    final result = create();
    if (leaderId != null) result.leaderId = leaderId;
    return result;
  }

  SetLeaderReq._();

  factory SetLeaderReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetLeaderReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetLeaderReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'leader'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'leaderId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetLeaderReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetLeaderReq copyWith(void Function(SetLeaderReq) updates) =>
      super.copyWith((message) => updates(message as SetLeaderReq))
          as SetLeaderReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetLeaderReq create() => SetLeaderReq._();
  @$core.override
  SetLeaderReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetLeaderReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetLeaderReq>(create);
  static SetLeaderReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get leaderId => $_getI64(0);
  @$pb.TagNumber(1)
  set leaderId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLeaderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeaderId() => $_clearField(1);
}

class GetSubordinateGsListResp extends $pb.GeneratedMessage {
  factory GetSubordinateGsListResp({
    $core.Iterable<SubordinateGs>? gsList,
    $fixnum.Int64? totalGiftCoin,
  }) {
    final result = create();
    if (gsList != null) result.gsList.addAll(gsList);
    if (totalGiftCoin != null) result.totalGiftCoin = totalGiftCoin;
    return result;
  }

  GetSubordinateGsListResp._();

  factory GetSubordinateGsListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSubordinateGsListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSubordinateGsListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'leader'),
      createEmptyInstance: create)
    ..pPM<SubordinateGs>(1, _omitFieldNames ? '' : 'gsList',
        subBuilder: SubordinateGs.create)
    ..aInt64(2, _omitFieldNames ? '' : 'totalGiftCoin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSubordinateGsListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSubordinateGsListResp copyWith(
          void Function(GetSubordinateGsListResp) updates) =>
      super.copyWith((message) => updates(message as GetSubordinateGsListResp))
          as GetSubordinateGsListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSubordinateGsListResp create() => GetSubordinateGsListResp._();
  @$core.override
  GetSubordinateGsListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSubordinateGsListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSubordinateGsListResp>(create);
  static GetSubordinateGsListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SubordinateGs> get gsList => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalGiftCoin => $_getI64(1);
  @$pb.TagNumber(2)
  set totalGiftCoin($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalGiftCoin() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalGiftCoin() => $_clearField(2);
}

class SubordinateGs extends $pb.GeneratedMessage {
  factory SubordinateGs({
    $0.MsgListUserItem? gs,
    $fixnum.Int64? receiveGiftCoin,
  }) {
    final result = create();
    if (gs != null) result.gs = gs;
    if (receiveGiftCoin != null) result.receiveGiftCoin = receiveGiftCoin;
    return result;
  }

  SubordinateGs._();

  factory SubordinateGs.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubordinateGs.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubordinateGs',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'leader'),
      createEmptyInstance: create)
    ..aOM<$0.MsgListUserItem>(1, _omitFieldNames ? '' : 'gs',
        subBuilder: $0.MsgListUserItem.create)
    ..aInt64(2, _omitFieldNames ? '' : 'receiveGiftCoin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubordinateGs clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubordinateGs copyWith(void Function(SubordinateGs) updates) =>
      super.copyWith((message) => updates(message as SubordinateGs))
          as SubordinateGs;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubordinateGs create() => SubordinateGs._();
  @$core.override
  SubordinateGs createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubordinateGs getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubordinateGs>(create);
  static SubordinateGs? _defaultInstance;

  @$pb.TagNumber(1)
  $0.MsgListUserItem get gs => $_getN(0);
  @$pb.TagNumber(1)
  set gs($0.MsgListUserItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGs() => $_has(0);
  @$pb.TagNumber(1)
  void clearGs() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.MsgListUserItem ensureGs() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get receiveGiftCoin => $_getI64(1);
  @$pb.TagNumber(2)
  set receiveGiftCoin($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReceiveGiftCoin() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiveGiftCoin() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

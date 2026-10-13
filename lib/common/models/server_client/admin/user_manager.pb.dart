// This is a generated file - do not edit.
//
// Generated from server_client/admin/user_manager.proto.

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
import 'base.pb.dart' as $0;
import 'user_manager.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'user_manager.pbenum.dart';

class SearchUserConditionsReq extends $pb.GeneratedMessage {
  factory SearchUserConditionsReq({
    $fixnum.Int64? registerTimeFrom,
    $fixnum.Int64? registerTimeTo,
    $fixnum.Int64? latestLoginTimeFrom,
    $fixnum.Int64? latestLoginTimeTo,
    $core.Iterable<$fixnum.Int64>? labelIdList,
    $core.Iterable<$core.String>? gender,
    $core.Iterable<$fixnum.Int64>? vipLevelFrom,
    $core.Iterable<$fixnum.Int64>? vipLevelTo,
    $core.Iterable<$core.String>? carLevelList,
    $core.Iterable<$fixnum.Int64>? cityName,
    $core.Iterable<$core.String>? channel,
    $core.Iterable<$0.BlockLoginStatus>? blockLoginStatus,
    $core.Iterable<$0.BlockInteractiveStatus>? blockInteractiveList,
    $core.Iterable<SearchScope>? scopes,
  }) {
    final result = create();
    if (registerTimeFrom != null) result.registerTimeFrom = registerTimeFrom;
    if (registerTimeTo != null) result.registerTimeTo = registerTimeTo;
    if (latestLoginTimeFrom != null)
      result.latestLoginTimeFrom = latestLoginTimeFrom;
    if (latestLoginTimeTo != null) result.latestLoginTimeTo = latestLoginTimeTo;
    if (labelIdList != null) result.labelIdList.addAll(labelIdList);
    if (gender != null) result.gender.addAll(gender);
    if (vipLevelFrom != null) result.vipLevelFrom.addAll(vipLevelFrom);
    if (vipLevelTo != null) result.vipLevelTo.addAll(vipLevelTo);
    if (carLevelList != null) result.carLevelList.addAll(carLevelList);
    if (cityName != null) result.cityName.addAll(cityName);
    if (channel != null) result.channel.addAll(channel);
    if (blockLoginStatus != null)
      result.blockLoginStatus.addAll(blockLoginStatus);
    if (blockInteractiveList != null)
      result.blockInteractiveList.addAll(blockInteractiveList);
    if (scopes != null) result.scopes.addAll(scopes);
    return result;
  }

  SearchUserConditionsReq._();

  factory SearchUserConditionsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchUserConditionsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchUserConditionsReq',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'adminUserManager'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'registerTimeFrom',
        protoName: 'registerTimeFrom')
    ..aInt64(2, _omitFieldNames ? '' : 'registerTimeTo',
        protoName: 'registerTimeTo')
    ..aInt64(3, _omitFieldNames ? '' : 'latestLoginTimeFrom',
        protoName: 'latestLoginTimeFrom')
    ..aInt64(4, _omitFieldNames ? '' : 'latestLoginTimeTo',
        protoName: 'latestLoginTimeTo')
    ..p<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'labelIdList', $pb.PbFieldType.K6,
        protoName: 'labelIdList')
    ..pPS(6, _omitFieldNames ? '' : 'gender')
    ..p<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'vipLevelFrom', $pb.PbFieldType.K6,
        protoName: 'vipLevelFrom')
    ..p<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'vipLevelTo', $pb.PbFieldType.K6,
        protoName: 'vipLevelTo')
    ..pPS(9, _omitFieldNames ? '' : 'carLevelList', protoName: 'carLevelList')
    ..p<$fixnum.Int64>(
        10, _omitFieldNames ? '' : 'cityName', $pb.PbFieldType.K6,
        protoName: 'cityName')
    ..pPS(11, _omitFieldNames ? '' : 'channel')
    ..pc<$0.BlockLoginStatus>(
        12, _omitFieldNames ? '' : 'blockLoginStatus', $pb.PbFieldType.KE,
        protoName: 'blockLoginStatus',
        valueOf: $0.BlockLoginStatus.valueOf,
        enumValues: $0.BlockLoginStatus.values,
        defaultEnumValue: $0.BlockLoginStatus.BLOCK_ACCOUNT)
    ..pc<$0.BlockInteractiveStatus>(
        13, _omitFieldNames ? '' : 'blockInteractiveList', $pb.PbFieldType.KE,
        protoName: 'blockInteractiveList',
        valueOf: $0.BlockInteractiveStatus.valueOf,
        enumValues: $0.BlockInteractiveStatus.values,
        defaultEnumValue: $0.BlockInteractiveStatus.BLOCK_CHANNEL_PUBLISH)
    ..pc<SearchScope>(14, _omitFieldNames ? '' : 'scopes', $pb.PbFieldType.KE,
        valueOf: SearchScope.valueOf,
        enumValues: SearchScope.values,
        defaultEnumValue: SearchScope.ALL)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchUserConditionsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchUserConditionsReq copyWith(
          void Function(SearchUserConditionsReq) updates) =>
      super.copyWith((message) => updates(message as SearchUserConditionsReq))
          as SearchUserConditionsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchUserConditionsReq create() => SearchUserConditionsReq._();
  @$core.override
  SearchUserConditionsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchUserConditionsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchUserConditionsReq>(create);
  static SearchUserConditionsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get registerTimeFrom => $_getI64(0);
  @$pb.TagNumber(1)
  set registerTimeFrom($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRegisterTimeFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegisterTimeFrom() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get registerTimeTo => $_getI64(1);
  @$pb.TagNumber(2)
  set registerTimeTo($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRegisterTimeTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearRegisterTimeTo() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get latestLoginTimeFrom => $_getI64(2);
  @$pb.TagNumber(3)
  set latestLoginTimeFrom($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLatestLoginTimeFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatestLoginTimeFrom() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get latestLoginTimeTo => $_getI64(3);
  @$pb.TagNumber(4)
  set latestLoginTimeTo($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLatestLoginTimeTo() => $_has(3);
  @$pb.TagNumber(4)
  void clearLatestLoginTimeTo() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$fixnum.Int64> get labelIdList => $_getList(4);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get gender => $_getList(5);

  @$pb.TagNumber(7)
  $pb.PbList<$fixnum.Int64> get vipLevelFrom => $_getList(6);

  @$pb.TagNumber(8)
  $pb.PbList<$fixnum.Int64> get vipLevelTo => $_getList(7);

  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get carLevelList => $_getList(8);

  @$pb.TagNumber(10)
  $pb.PbList<$fixnum.Int64> get cityName => $_getList(9);

  @$pb.TagNumber(11)
  $pb.PbList<$core.String> get channel => $_getList(10);

  @$pb.TagNumber(12)
  $pb.PbList<$0.BlockLoginStatus> get blockLoginStatus => $_getList(11);

  @$pb.TagNumber(13)
  $pb.PbList<$0.BlockInteractiveStatus> get blockInteractiveList =>
      $_getList(12);

  @$pb.TagNumber(14)
  $pb.PbList<SearchScope> get scopes => $_getList(13);
}

class SearchUserRsp extends $pb.GeneratedMessage {
  factory SearchUserRsp({
    $core.Iterable<$0.UserCompleteInfo>? userList,
    $1.Page? page,
  }) {
    final result = create();
    if (userList != null) result.userList.addAll(userList);
    if (page != null) result.page = page;
    return result;
  }

  SearchUserRsp._();

  factory SearchUserRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchUserRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchUserRsp',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'adminUserManager'),
      createEmptyInstance: create)
    ..pPM<$0.UserCompleteInfo>(1, _omitFieldNames ? '' : 'userList',
        protoName: 'userList', subBuilder: $0.UserCompleteInfo.create)
    ..aOM<$1.Page>(2, _omitFieldNames ? '' : 'page', subBuilder: $1.Page.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchUserRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchUserRsp copyWith(void Function(SearchUserRsp) updates) =>
      super.copyWith((message) => updates(message as SearchUserRsp))
          as SearchUserRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchUserRsp create() => SearchUserRsp._();
  @$core.override
  SearchUserRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchUserRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchUserRsp>(create);
  static SearchUserRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.UserCompleteInfo> get userList => $_getList(0);

  @$pb.TagNumber(2)
  $1.Page get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($1.Page value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Page ensurePage() => $_ensure(1);
}

class FillScopeReq extends $pb.GeneratedMessage {
  factory FillScopeReq({
    $core.Iterable<SearchScope>? scopes,
    $core.Iterable<$fixnum.Int64>? uidList,
  }) {
    final result = create();
    if (scopes != null) result.scopes.addAll(scopes);
    if (uidList != null) result.uidList.addAll(uidList);
    return result;
  }

  FillScopeReq._();

  factory FillScopeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FillScopeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FillScopeReq',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'adminUserManager'),
      createEmptyInstance: create)
    ..pc<SearchScope>(1, _omitFieldNames ? '' : 'scopes', $pb.PbFieldType.KE,
        valueOf: SearchScope.valueOf,
        enumValues: SearchScope.values,
        defaultEnumValue: SearchScope.ALL)
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : 'uidList', $pb.PbFieldType.K6,
        protoName: 'uidList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FillScopeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FillScopeReq copyWith(void Function(FillScopeReq) updates) =>
      super.copyWith((message) => updates(message as FillScopeReq))
          as FillScopeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FillScopeReq create() => FillScopeReq._();
  @$core.override
  FillScopeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FillScopeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FillScopeReq>(create);
  static FillScopeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SearchScope> get scopes => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$fixnum.Int64> get uidList => $_getList(1);
}

class FillScopeRsp extends $pb.GeneratedMessage {
  factory FillScopeRsp({
    $core.Iterable<$0.UserCompleteInfo>? userList,
  }) {
    final result = create();
    if (userList != null) result.userList.addAll(userList);
    return result;
  }

  FillScopeRsp._();

  factory FillScopeRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FillScopeRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FillScopeRsp',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'adminUserManager'),
      createEmptyInstance: create)
    ..pPM<$0.UserCompleteInfo>(1, _omitFieldNames ? '' : 'userList',
        protoName: 'userList', subBuilder: $0.UserCompleteInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FillScopeRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FillScopeRsp copyWith(void Function(FillScopeRsp) updates) =>
      super.copyWith((message) => updates(message as FillScopeRsp))
          as FillScopeRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FillScopeRsp create() => FillScopeRsp._();
  @$core.override
  FillScopeRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FillScopeRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FillScopeRsp>(create);
  static FillScopeRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.UserCompleteInfo> get userList => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

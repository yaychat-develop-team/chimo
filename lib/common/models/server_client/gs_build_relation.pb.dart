// This is a generated file - do not edit.
//
// Generated from server_client/gs_build_relation.proto.

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
import 'user.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'gs_build_relation.pbenum.dart';

class SetCoreCrowdReq extends $pb.GeneratedMessage {
  factory SetCoreCrowdReq({
    $fixnum.Int64? customerId,
    $core.bool? isRemove,
  }) {
    final result = create();
    if (customerId != null) result.customerId = customerId;
    if (isRemove != null) result.isRemove = isRemove;
    return result;
  }

  SetCoreCrowdReq._();

  factory SetCoreCrowdReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetCoreCrowdReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetCoreCrowdReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'customerId')
    ..aOB(2, _omitFieldNames ? '' : 'isRemove')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetCoreCrowdReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetCoreCrowdReq copyWith(void Function(SetCoreCrowdReq) updates) =>
      super.copyWith((message) => updates(message as SetCoreCrowdReq))
          as SetCoreCrowdReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetCoreCrowdReq create() => SetCoreCrowdReq._();
  @$core.override
  SetCoreCrowdReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetCoreCrowdReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetCoreCrowdReq>(create);
  static SetCoreCrowdReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get customerId => $_getI64(0);
  @$pb.TagNumber(1)
  set customerId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCustomerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustomerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isRemove => $_getBF(1);
  @$pb.TagNumber(2)
  set isRemove($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsRemove() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsRemove() => $_clearField(2);
}

class CustomerListRsp extends $pb.GeneratedMessage {
  factory CustomerListRsp({
    $core.Iterable<CustomerItem>? list,
    $0.Page? page,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (page != null) result.page = page;
    return result;
  }

  CustomerListRsp._();

  factory CustomerListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CustomerListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CustomerListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..pPM<CustomerItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: CustomerItem.create)
    ..aOM<$0.Page>(2, _omitFieldNames ? '' : 'page', subBuilder: $0.Page.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomerListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomerListRsp copyWith(void Function(CustomerListRsp) updates) =>
      super.copyWith((message) => updates(message as CustomerListRsp))
          as CustomerListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomerListRsp create() => CustomerListRsp._();
  @$core.override
  CustomerListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CustomerListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CustomerListRsp>(create);
  static CustomerListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CustomerItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $0.Page get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($0.Page value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Page ensurePage() => $_ensure(1);
}

class CustomerItemRsp extends $pb.GeneratedMessage {
  factory CustomerItemRsp({
    CustomerItem? item,
  }) {
    final result = create();
    if (item != null) result.item = item;
    return result;
  }

  CustomerItemRsp._();

  factory CustomerItemRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CustomerItemRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CustomerItemRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOM<CustomerItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: CustomerItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomerItemRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomerItemRsp copyWith(void Function(CustomerItemRsp) updates) =>
      super.copyWith((message) => updates(message as CustomerItemRsp))
          as CustomerItemRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomerItemRsp create() => CustomerItemRsp._();
  @$core.override
  CustomerItemRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CustomerItemRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CustomerItemRsp>(create);
  static CustomerItemRsp? _defaultInstance;

  @$pb.TagNumber(1)
  CustomerItem get item => $_getN(0);
  @$pb.TagNumber(1)
  set item(CustomerItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearItem() => $_clearField(1);
  @$pb.TagNumber(1)
  CustomerItem ensureItem() => $_ensure(0);
}

class CustomerItem extends $pb.GeneratedMessage {
  factory CustomerItem({
    $1.MsgListUserItem? user,
    $core.Iterable<InteractiveInfo>? taskList,
    $core.bool? isCoreCrowd,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (taskList != null) result.taskList.addAll(taskList);
    if (isCoreCrowd != null) result.isCoreCrowd = isCoreCrowd;
    return result;
  }

  CustomerItem._();

  factory CustomerItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CustomerItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CustomerItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOM<$1.MsgListUserItem>(1, _omitFieldNames ? '' : 'user',
        subBuilder: $1.MsgListUserItem.create)
    ..pPM<InteractiveInfo>(2, _omitFieldNames ? '' : 'taskList',
        subBuilder: InteractiveInfo.create)
    ..aOB(3, _omitFieldNames ? '' : 'isCoreCrowd')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomerItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomerItem copyWith(void Function(CustomerItem) updates) =>
      super.copyWith((message) => updates(message as CustomerItem))
          as CustomerItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomerItem create() => CustomerItem._();
  @$core.override
  CustomerItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CustomerItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CustomerItem>(create);
  static CustomerItem? _defaultInstance;

  @$pb.TagNumber(1)
  $1.MsgListUserItem get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($1.MsgListUserItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.MsgListUserItem ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<InteractiveInfo> get taskList => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get isCoreCrowd => $_getBF(2);
  @$pb.TagNumber(3)
  set isCoreCrowd($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsCoreCrowd() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsCoreCrowd() => $_clearField(3);
}

class InteractiveInfo extends $pb.GeneratedMessage {
  factory InteractiveInfo({
    $core.String? taskNo,
    $core.int? totalCount,
    $core.int? finishedCount,
  }) {
    final result = create();
    if (taskNo != null) result.taskNo = taskNo;
    if (totalCount != null) result.totalCount = totalCount;
    if (finishedCount != null) result.finishedCount = finishedCount;
    return result;
  }

  InteractiveInfo._();

  factory InteractiveInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InteractiveInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InteractiveInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskNo')
    ..aI(2, _omitFieldNames ? '' : 'totalCount')
    ..aI(3, _omitFieldNames ? '' : 'finishedCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InteractiveInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InteractiveInfo copyWith(void Function(InteractiveInfo) updates) =>
      super.copyWith((message) => updates(message as InteractiveInfo))
          as InteractiveInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InteractiveInfo create() => InteractiveInfo._();
  @$core.override
  InteractiveInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InteractiveInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InteractiveInfo>(create);
  static InteractiveInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskNo => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskNo($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskNo() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskNo() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get finishedCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set finishedCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFinishedCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearFinishedCount() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

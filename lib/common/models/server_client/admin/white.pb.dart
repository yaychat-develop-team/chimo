// This is a generated file - do not edit.
//
// Generated from server_client/admin/white.proto.

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

class SearchWhiteReq extends $pb.GeneratedMessage {
  factory SearchWhiteReq({
    $core.String? name,
    $core.int? type,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    return result;
  }

  SearchWhiteReq._();

  factory SearchWhiteReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchWhiteReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchWhiteReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'white'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aI(2, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchWhiteReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchWhiteReq copyWith(void Function(SearchWhiteReq) updates) =>
      super.copyWith((message) => updates(message as SearchWhiteReq))
          as SearchWhiteReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchWhiteReq create() => SearchWhiteReq._();
  @$core.override
  SearchWhiteReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchWhiteReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchWhiteReq>(create);
  static SearchWhiteReq? _defaultInstance;

  /// *
  /// 名字或者id
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// *
  /// 白名单类型
  @$pb.TagNumber(2)
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);
}

class WhiteTypeResp extends $pb.GeneratedMessage {
  factory WhiteTypeResp({
    $core.Iterable<WhiteTypeList>? item,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    return result;
  }

  WhiteTypeResp._();

  factory WhiteTypeResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WhiteTypeResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WhiteTypeResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'white'),
      createEmptyInstance: create)
    ..pPM<WhiteTypeList>(1, _omitFieldNames ? '' : 'item',
        subBuilder: WhiteTypeList.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhiteTypeResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhiteTypeResp copyWith(void Function(WhiteTypeResp) updates) =>
      super.copyWith((message) => updates(message as WhiteTypeResp))
          as WhiteTypeResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhiteTypeResp create() => WhiteTypeResp._();
  @$core.override
  WhiteTypeResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WhiteTypeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WhiteTypeResp>(create);
  static WhiteTypeResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WhiteTypeList> get item => $_getList(0);
}

class WhiteTypeList extends $pb.GeneratedMessage {
  factory WhiteTypeList({
    $fixnum.Int64? id,
    $core.String? name,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    return result;
  }

  WhiteTypeList._();

  factory WhiteTypeList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WhiteTypeList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WhiteTypeList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'white'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhiteTypeList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhiteTypeList copyWith(void Function(WhiteTypeList) updates) =>
      super.copyWith((message) => updates(message as WhiteTypeList))
          as WhiteTypeList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhiteTypeList create() => WhiteTypeList._();
  @$core.override
  WhiteTypeList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WhiteTypeList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WhiteTypeList>(create);
  static WhiteTypeList? _defaultInstance;

  /// *
  /// 白名单id
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// *
  /// 白名单类型名
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);
}

class SearchWhiteResp extends $pb.GeneratedMessage {
  factory SearchWhiteResp({
    $core.Iterable<SearchWhiteList>? item,
    $0.Pagination? page,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    if (page != null) result.page = page;
    return result;
  }

  SearchWhiteResp._();

  factory SearchWhiteResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchWhiteResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchWhiteResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'white'),
      createEmptyInstance: create)
    ..pPM<SearchWhiteList>(1, _omitFieldNames ? '' : 'item',
        subBuilder: SearchWhiteList.create)
    ..aOM<$0.Pagination>(2, _omitFieldNames ? '' : 'page',
        subBuilder: $0.Pagination.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchWhiteResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchWhiteResp copyWith(void Function(SearchWhiteResp) updates) =>
      super.copyWith((message) => updates(message as SearchWhiteResp))
          as SearchWhiteResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchWhiteResp create() => SearchWhiteResp._();
  @$core.override
  SearchWhiteResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchWhiteResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchWhiteResp>(create);
  static SearchWhiteResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SearchWhiteList> get item => $_getList(0);

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

class SearchWhiteList extends $pb.GeneratedMessage {
  factory SearchWhiteList({
    $core.String? type,
    $fixnum.Int64? id,
    $fixnum.Int64? uid,
    $core.String? userName,
    $fixnum.Int64? createTime,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (id != null) result.id = id;
    if (uid != null) result.uid = uid;
    if (userName != null) result.userName = userName;
    if (createTime != null) result.createTime = createTime;
    return result;
  }

  SearchWhiteList._();

  factory SearchWhiteList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchWhiteList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchWhiteList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'white'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..aInt64(2, _omitFieldNames ? '' : 'id')
    ..aInt64(3, _omitFieldNames ? '' : 'uid')
    ..aOS(4, _omitFieldNames ? '' : 'userName')
    ..aInt64(5, _omitFieldNames ? '' : 'createTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchWhiteList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchWhiteList copyWith(void Function(SearchWhiteList) updates) =>
      super.copyWith((message) => updates(message as SearchWhiteList))
          as SearchWhiteList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchWhiteList create() => SearchWhiteList._();
  @$core.override
  SearchWhiteList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchWhiteList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchWhiteList>(create);
  static SearchWhiteList? _defaultInstance;

  /// *
  /// 白名单类型
  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  /// *
  /// 白名单id
  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  /// *
  /// 用户id
  @$pb.TagNumber(3)
  $fixnum.Int64 get uid => $_getI64(2);
  @$pb.TagNumber(3)
  set uid($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => $_clearField(3);

  /// *
  /// 用户名
  @$pb.TagNumber(4)
  $core.String get userName => $_getSZ(3);
  @$pb.TagNumber(4)
  set userName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserName() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserName() => $_clearField(4);

  /// *
  /// 添加时间
  @$pb.TagNumber(5)
  $fixnum.Int64 get createTime => $_getI64(4);
  @$pb.TagNumber(5)
  set createTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreateTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateTime() => $_clearField(5);
}

class AddWhiteTypeReq extends $pb.GeneratedMessage {
  factory AddWhiteTypeReq({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  AddWhiteTypeReq._();

  factory AddWhiteTypeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddWhiteTypeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddWhiteTypeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'white'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddWhiteTypeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddWhiteTypeReq copyWith(void Function(AddWhiteTypeReq) updates) =>
      super.copyWith((message) => updates(message as AddWhiteTypeReq))
          as AddWhiteTypeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddWhiteTypeReq create() => AddWhiteTypeReq._();
  @$core.override
  AddWhiteTypeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddWhiteTypeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddWhiteTypeReq>(create);
  static AddWhiteTypeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

class AddWhiteReq extends $pb.GeneratedMessage {
  factory AddWhiteReq({
    $fixnum.Int64? typeId,
    $core.Iterable<$fixnum.Int64>? userId,
  }) {
    final result = create();
    if (typeId != null) result.typeId = typeId;
    if (userId != null) result.userId.addAll(userId);
    return result;
  }

  AddWhiteReq._();

  factory AddWhiteReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddWhiteReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddWhiteReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'white'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'typeId')
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.K6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddWhiteReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddWhiteReq copyWith(void Function(AddWhiteReq) updates) =>
      super.copyWith((message) => updates(message as AddWhiteReq))
          as AddWhiteReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddWhiteReq create() => AddWhiteReq._();
  @$core.override
  AddWhiteReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddWhiteReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddWhiteReq>(create);
  static AddWhiteReq? _defaultInstance;

  /// *
  /// 白名单类型id
  @$pb.TagNumber(1)
  $fixnum.Int64 get typeId => $_getI64(0);
  @$pb.TagNumber(1)
  set typeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTypeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTypeId() => $_clearField(1);

  /// *
  /// 用户id
  @$pb.TagNumber(2)
  $pb.PbList<$fixnum.Int64> get userId => $_getList(1);
}

class DeleteWhiteTypeReq extends $pb.GeneratedMessage {
  factory DeleteWhiteTypeReq({
    $core.Iterable<$fixnum.Int64>? id,
  }) {
    final result = create();
    if (id != null) result.id.addAll(id);
    return result;
  }

  DeleteWhiteTypeReq._();

  factory DeleteWhiteTypeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteWhiteTypeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteWhiteTypeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'white'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.K6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteWhiteTypeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteWhiteTypeReq copyWith(void Function(DeleteWhiteTypeReq) updates) =>
      super.copyWith((message) => updates(message as DeleteWhiteTypeReq))
          as DeleteWhiteTypeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteWhiteTypeReq create() => DeleteWhiteTypeReq._();
  @$core.override
  DeleteWhiteTypeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteWhiteTypeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteWhiteTypeReq>(create);
  static DeleteWhiteTypeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get id => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

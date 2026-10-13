// This is a generated file - do not edit.
//
// Generated from server_client/merch/forge.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../commodity.pbenum.dart' as $1;
import 'merch.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ForgeBaseInfo extends $pb.GeneratedMessage {
  factory ForgeBaseInfo({
    $core.Iterable<$core.int>? slotStatusList,
    $fixnum.Int64? coalNum,
  }) {
    final result = create();
    if (slotStatusList != null) result.slotStatusList.addAll(slotStatusList);
    if (coalNum != null) result.coalNum = coalNum;
    return result;
  }

  ForgeBaseInfo._();

  factory ForgeBaseInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ForgeBaseInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ForgeBaseInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.forge'),
      createEmptyInstance: create)
    ..p<$core.int>(
        1, _omitFieldNames ? '' : 'slotStatusList', $pb.PbFieldType.K3)
    ..aInt64(2, _omitFieldNames ? '' : 'coalNum')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeBaseInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeBaseInfo copyWith(void Function(ForgeBaseInfo) updates) =>
      super.copyWith((message) => updates(message as ForgeBaseInfo))
          as ForgeBaseInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForgeBaseInfo create() => ForgeBaseInfo._();
  @$core.override
  ForgeBaseInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ForgeBaseInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ForgeBaseInfo>(create);
  static ForgeBaseInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.int> get slotStatusList => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get coalNum => $_getI64(1);
  @$pb.TagNumber(2)
  set coalNum($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCoalNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoalNum() => $_clearField(2);
}

class ForgeItemInfo extends $pb.GeneratedMessage {
  factory ForgeItemInfo({
    $core.Iterable<$0.ItemInfo>? itemList,
  }) {
    final result = create();
    if (itemList != null) result.itemList.addAll(itemList);
    return result;
  }

  ForgeItemInfo._();

  factory ForgeItemInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ForgeItemInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ForgeItemInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.forge'),
      createEmptyInstance: create)
    ..pPM<$0.ItemInfo>(1, _omitFieldNames ? '' : 'itemList',
        subBuilder: $0.ItemInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeItemInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeItemInfo copyWith(void Function(ForgeItemInfo) updates) =>
      super.copyWith((message) => updates(message as ForgeItemInfo))
          as ForgeItemInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForgeItemInfo create() => ForgeItemInfo._();
  @$core.override
  ForgeItemInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ForgeItemInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ForgeItemInfo>(create);
  static ForgeItemInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.ItemInfo> get itemList => $_getList(0);
}

class ForgeRequest extends $pb.GeneratedMessage {
  factory ForgeRequest({
    $1.CommodityType? type,
    $core.int? level,
    $core.Iterable<$core.String>? itemIdList,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (level != null) result.level = level;
    if (itemIdList != null) result.itemIdList.addAll(itemIdList);
    return result;
  }

  ForgeRequest._();

  factory ForgeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ForgeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ForgeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.forge'),
      createEmptyInstance: create)
    ..aE<$1.CommodityType>(1, _omitFieldNames ? '' : 'type',
        enumValues: $1.CommodityType.values)
    ..aI(2, _omitFieldNames ? '' : 'level')
    ..pPS(3, _omitFieldNames ? '' : 'itemIdList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeRequest copyWith(void Function(ForgeRequest) updates) =>
      super.copyWith((message) => updates(message as ForgeRequest))
          as ForgeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForgeRequest create() => ForgeRequest._();
  @$core.override
  ForgeRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ForgeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ForgeRequest>(create);
  static ForgeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.CommodityType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type($1.CommodityType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get level => $_getIZ(1);
  @$pb.TagNumber(2)
  set level($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get itemIdList => $_getList(2);
}

class ForgeResponse extends $pb.GeneratedMessage {
  factory ForgeResponse({
    $core.bool? success,
    $0.ItemInfo? item,
    $fixnum.Int64? gachaNum,
    $core.bool? custom,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (item != null) result.item = item;
    if (gachaNum != null) result.gachaNum = gachaNum;
    if (custom != null) result.custom = custom;
    return result;
  }

  ForgeResponse._();

  factory ForgeResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ForgeResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ForgeResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.forge'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<$0.ItemInfo>(2, _omitFieldNames ? '' : 'item',
        subBuilder: $0.ItemInfo.create)
    ..aInt64(3, _omitFieldNames ? '' : 'gachaNum')
    ..aOB(4, _omitFieldNames ? '' : 'custom')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeResponse copyWith(void Function(ForgeResponse) updates) =>
      super.copyWith((message) => updates(message as ForgeResponse))
          as ForgeResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForgeResponse create() => ForgeResponse._();
  @$core.override
  ForgeResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ForgeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ForgeResponse>(create);
  static ForgeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.ItemInfo get item => $_getN(1);
  @$pb.TagNumber(2)
  set item($0.ItemInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasItem() => $_has(1);
  @$pb.TagNumber(2)
  void clearItem() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.ItemInfo ensureItem() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get gachaNum => $_getI64(2);
  @$pb.TagNumber(3)
  set gachaNum($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGachaNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearGachaNum() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get custom => $_getBF(3);
  @$pb.TagNumber(4)
  set custom($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCustom() => $_has(3);
  @$pb.TagNumber(4)
  void clearCustom() => $_clearField(4);
}

class ForgeRecordRsp extends $pb.GeneratedMessage {
  factory ForgeRecordRsp({
    $core.Iterable<ForgeRecord>? recordList,
  }) {
    final result = create();
    if (recordList != null) result.recordList.addAll(recordList);
    return result;
  }

  ForgeRecordRsp._();

  factory ForgeRecordRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ForgeRecordRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ForgeRecordRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.forge'),
      createEmptyInstance: create)
    ..pPM<ForgeRecord>(1, _omitFieldNames ? '' : 'recordList',
        subBuilder: ForgeRecord.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeRecordRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeRecordRsp copyWith(void Function(ForgeRecordRsp) updates) =>
      super.copyWith((message) => updates(message as ForgeRecordRsp))
          as ForgeRecordRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForgeRecordRsp create() => ForgeRecordRsp._();
  @$core.override
  ForgeRecordRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ForgeRecordRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ForgeRecordRsp>(create);
  static ForgeRecordRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ForgeRecord> get recordList => $_getList(0);
}

class ForgeRecord extends $pb.GeneratedMessage {
  factory ForgeRecord({
    $fixnum.Int64? id,
    $core.bool? success,
    $1.CommodityType? type,
    $0.ItemInfo? item,
    $fixnum.Int64? gachaNum,
    $core.bool? custom,
    $fixnum.Int64? eta,
    $core.int? customStatus,
    $fixnum.Int64? forgeTime,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (success != null) result.success = success;
    if (type != null) result.type = type;
    if (item != null) result.item = item;
    if (gachaNum != null) result.gachaNum = gachaNum;
    if (custom != null) result.custom = custom;
    if (eta != null) result.eta = eta;
    if (customStatus != null) result.customStatus = customStatus;
    if (forgeTime != null) result.forgeTime = forgeTime;
    return result;
  }

  ForgeRecord._();

  factory ForgeRecord.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ForgeRecord.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ForgeRecord',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.forge'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOB(2, _omitFieldNames ? '' : 'success')
    ..aE<$1.CommodityType>(3, _omitFieldNames ? '' : 'type',
        enumValues: $1.CommodityType.values)
    ..aOM<$0.ItemInfo>(4, _omitFieldNames ? '' : 'item',
        subBuilder: $0.ItemInfo.create)
    ..aInt64(5, _omitFieldNames ? '' : 'gachaNum')
    ..aOB(6, _omitFieldNames ? '' : 'custom')
    ..aInt64(7, _omitFieldNames ? '' : 'eta')
    ..aI(8, _omitFieldNames ? '' : 'customStatus')
    ..aInt64(9, _omitFieldNames ? '' : 'forgeTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeRecord clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgeRecord copyWith(void Function(ForgeRecord) updates) =>
      super.copyWith((message) => updates(message as ForgeRecord))
          as ForgeRecord;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForgeRecord create() => ForgeRecord._();
  @$core.override
  ForgeRecord createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ForgeRecord getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ForgeRecord>(create);
  static ForgeRecord? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.CommodityType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type($1.CommodityType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.ItemInfo get item => $_getN(3);
  @$pb.TagNumber(4)
  set item($0.ItemInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasItem() => $_has(3);
  @$pb.TagNumber(4)
  void clearItem() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.ItemInfo ensureItem() => $_ensure(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get gachaNum => $_getI64(4);
  @$pb.TagNumber(5)
  set gachaNum($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGachaNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearGachaNum() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get custom => $_getBF(5);
  @$pb.TagNumber(6)
  set custom($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCustom() => $_has(5);
  @$pb.TagNumber(6)
  void clearCustom() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get eta => $_getI64(6);
  @$pb.TagNumber(7)
  set eta($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasEta() => $_has(6);
  @$pb.TagNumber(7)
  void clearEta() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get customStatus => $_getIZ(7);
  @$pb.TagNumber(8)
  set customStatus($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCustomStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearCustomStatus() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get forgeTime => $_getI64(8);
  @$pb.TagNumber(9)
  set forgeTime($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasForgeTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearForgeTime() => $_clearField(9);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

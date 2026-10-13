// This is a generated file - do not edit.
//
// Generated from server_client/gs_wanted_item.proto.

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

class WantedItem extends $pb.GeneratedMessage {
  factory WantedItem({
    $fixnum.Int64? itemId,
    $fixnum.Int64? wantedCount,
    $fixnum.Int64? receivedCount,
    $core.int? no,
    $core.String? name,
    $core.String? iconUrl,
  }) {
    final result = create();
    if (itemId != null) result.itemId = itemId;
    if (wantedCount != null) result.wantedCount = wantedCount;
    if (receivedCount != null) result.receivedCount = receivedCount;
    if (no != null) result.no = no;
    if (name != null) result.name = name;
    if (iconUrl != null) result.iconUrl = iconUrl;
    return result;
  }

  WantedItem._();

  factory WantedItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WantedItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WantedItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wanted_item'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'itemId')
    ..aInt64(2, _omitFieldNames ? '' : 'wantedCount')
    ..aInt64(3, _omitFieldNames ? '' : 'receivedCount')
    ..aI(4, _omitFieldNames ? '' : 'no')
    ..aOS(5, _omitFieldNames ? '' : 'name')
    ..aOS(6, _omitFieldNames ? '' : 'iconUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WantedItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WantedItem copyWith(void Function(WantedItem) updates) =>
      super.copyWith((message) => updates(message as WantedItem)) as WantedItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WantedItem create() => WantedItem._();
  @$core.override
  WantedItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WantedItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WantedItem>(create);
  static WantedItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get itemId => $_getI64(0);
  @$pb.TagNumber(1)
  set itemId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItemId() => $_has(0);
  @$pb.TagNumber(1)
  void clearItemId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get wantedCount => $_getI64(1);
  @$pb.TagNumber(2)
  set wantedCount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWantedCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearWantedCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get receivedCount => $_getI64(2);
  @$pb.TagNumber(3)
  set receivedCount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReceivedCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceivedCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get no => $_getIZ(3);
  @$pb.TagNumber(4)
  set no($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNo() => $_has(3);
  @$pb.TagNumber(4)
  void clearNo() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get iconUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set iconUrl($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIconUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearIconUrl() => $_clearField(6);
}

class GetWantedItemResp extends $pb.GeneratedMessage {
  factory GetWantedItemResp({
    $core.bool? success,
    $core.String? message,
    $core.Iterable<WantedItem>? wantedItems,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (wantedItems != null) result.wantedItems.addAll(wantedItems);
    return result;
  }

  GetWantedItemResp._();

  factory GetWantedItemResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetWantedItemResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetWantedItemResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wanted_item'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..pPM<WantedItem>(3, _omitFieldNames ? '' : 'wantedItems',
        subBuilder: WantedItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetWantedItemResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetWantedItemResp copyWith(void Function(GetWantedItemResp) updates) =>
      super.copyWith((message) => updates(message as GetWantedItemResp))
          as GetWantedItemResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetWantedItemResp create() => GetWantedItemResp._();
  @$core.override
  GetWantedItemResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetWantedItemResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetWantedItemResp>(create);
  static GetWantedItemResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<WantedItem> get wantedItems => $_getList(2);
}

class SetWantedItemReq extends $pb.GeneratedMessage {
  factory SetWantedItemReq({
    $core.Iterable<WantedItem>? wantedItems,
  }) {
    final result = create();
    if (wantedItems != null) result.wantedItems.addAll(wantedItems);
    return result;
  }

  SetWantedItemReq._();

  factory SetWantedItemReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetWantedItemReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetWantedItemReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'wanted_item'),
      createEmptyInstance: create)
    ..pPM<WantedItem>(1, _omitFieldNames ? '' : 'wantedItems',
        subBuilder: WantedItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetWantedItemReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetWantedItemReq copyWith(void Function(SetWantedItemReq) updates) =>
      super.copyWith((message) => updates(message as SetWantedItemReq))
          as SetWantedItemReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetWantedItemReq create() => SetWantedItemReq._();
  @$core.override
  SetWantedItemReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetWantedItemReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetWantedItemReq>(create);
  static SetWantedItemReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WantedItem> get wantedItems => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

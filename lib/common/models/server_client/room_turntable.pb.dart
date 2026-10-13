// This is a generated file - do not edit.
//
// Generated from server_client/room_turntable.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 转盘内容项
class TurntableItem extends $pb.GeneratedMessage {
  factory TurntableItem({
    $core.int? id,
    $core.String? name,
    $core.String? desc,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (desc != null) result.desc = desc;
    return result;
  }

  TurntableItem._();

  factory TurntableItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TurntableItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TurntableItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_turntable'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'desc')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TurntableItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TurntableItem copyWith(void Function(TurntableItem) updates) =>
      super.copyWith((message) => updates(message as TurntableItem))
          as TurntableItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TurntableItem create() => TurntableItem._();
  @$core.override
  TurntableItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TurntableItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TurntableItem>(create);
  static TurntableItem? _defaultInstance;

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
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => $_clearField(3);
}

class TurntableInfo extends $pb.GeneratedMessage {
  factory TurntableInfo({
    $core.int? stopId,
    $core.Iterable<TurntableItem>? items,
  }) {
    final result = create();
    if (stopId != null) result.stopId = stopId;
    if (items != null) result.items.addAll(items);
    return result;
  }

  TurntableInfo._();

  factory TurntableInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TurntableInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TurntableInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_turntable'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'stopId')
    ..pPM<TurntableItem>(2, _omitFieldNames ? '' : 'items',
        subBuilder: TurntableItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TurntableInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TurntableInfo copyWith(void Function(TurntableInfo) updates) =>
      super.copyWith((message) => updates(message as TurntableInfo))
          as TurntableInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TurntableInfo create() => TurntableInfo._();
  @$core.override
  TurntableInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TurntableInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TurntableInfo>(create);
  static TurntableInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get stopId => $_getIZ(0);
  @$pb.TagNumber(1)
  set stopId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStopId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStopId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<TurntableItem> get items => $_getList(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

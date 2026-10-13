// This is a generated file - do not edit.
//
// Generated from server_client/emote.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// *
/// 表情包集合
class EmoticonsListResp extends $pb.GeneratedMessage {
  factory EmoticonsListResp({
    $core.Iterable<Emoticons>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  EmoticonsListResp._();

  factory EmoticonsListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmoticonsListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmoticonsListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'emote'),
      createEmptyInstance: create)
    ..pPM<Emoticons>(1, _omitFieldNames ? '' : 'list',
        subBuilder: Emoticons.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmoticonsListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmoticonsListResp copyWith(void Function(EmoticonsListResp) updates) =>
      super.copyWith((message) => updates(message as EmoticonsListResp))
          as EmoticonsListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmoticonsListResp create() => EmoticonsListResp._();
  @$core.override
  EmoticonsListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EmoticonsListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmoticonsListResp>(create);
  static EmoticonsListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Emoticons> get list => $_getList(0);
}

/// *
/// 表情包信息
class Emoticons extends $pb.GeneratedMessage {
  factory Emoticons({
    $core.String? id,
    $core.String? name,
    $core.String? cover,
    $core.String? type,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (cover != null) result.cover = cover;
    if (type != null) result.type = type;
    return result;
  }

  Emoticons._();

  factory Emoticons.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Emoticons.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Emoticons',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'emote'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'cover')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Emoticons clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Emoticons copyWith(void Function(Emoticons) updates) =>
      super.copyWith((message) => updates(message as Emoticons)) as Emoticons;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Emoticons create() => Emoticons._();
  @$core.override
  Emoticons createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Emoticons getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Emoticons>(create);
  static Emoticons? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
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
  $core.String get cover => $_getSZ(2);
  @$pb.TagNumber(3)
  set cover($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCover() => $_has(2);
  @$pb.TagNumber(3)
  void clearCover() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);
}

/// *
/// 表情集合
class EmoteItemList extends $pb.GeneratedMessage {
  factory EmoteItemList({
    $core.Iterable<EmoteItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  EmoteItemList._();

  factory EmoteItemList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmoteItemList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmoteItemList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'emote'),
      createEmptyInstance: create)
    ..pPM<EmoteItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: EmoteItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmoteItemList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmoteItemList copyWith(void Function(EmoteItemList) updates) =>
      super.copyWith((message) => updates(message as EmoteItemList))
          as EmoteItemList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmoteItemList create() => EmoteItemList._();
  @$core.override
  EmoteItemList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EmoteItemList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmoteItemList>(create);
  static EmoteItemList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<EmoteItem> get items => $_getList(0);
}

/// *
/// 单个表情信息
class EmoteItem extends $pb.GeneratedMessage {
  factory EmoteItem({
    $core.String? id,
    $core.String? name,
    $core.String? url,
    $core.String? showUrl,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (url != null) result.url = url;
    if (showUrl != null) result.showUrl = showUrl;
    return result;
  }

  EmoteItem._();

  factory EmoteItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmoteItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmoteItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'emote'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..aOS(4, _omitFieldNames ? '' : 'showUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmoteItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmoteItem copyWith(void Function(EmoteItem) updates) =>
      super.copyWith((message) => updates(message as EmoteItem)) as EmoteItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmoteItem create() => EmoteItem._();
  @$core.override
  EmoteItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EmoteItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmoteItem>(create);
  static EmoteItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
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
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get showUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set showUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasShowUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearShowUrl() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

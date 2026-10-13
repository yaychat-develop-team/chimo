// This is a generated file - do not edit.
//
// Generated from server_client/banner.proto.

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

/// *
/// banner 集合
class BannerListResp extends $pb.GeneratedMessage {
  factory BannerListResp({
    $core.Iterable<BannerItem>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  BannerListResp._();

  factory BannerListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BannerListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BannerListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'banner'),
      createEmptyInstance: create)
    ..pPM<BannerItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: BannerItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BannerListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BannerListResp copyWith(void Function(BannerListResp) updates) =>
      super.copyWith((message) => updates(message as BannerListResp))
          as BannerListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BannerListResp create() => BannerListResp._();
  @$core.override
  BannerListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BannerListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BannerListResp>(create);
  static BannerListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BannerItem> get list => $_getList(0);
}

/// *
/// banner信息
class BannerItem extends $pb.GeneratedMessage {
  factory BannerItem({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? desc,
    $core.String? img,
    $core.String? jumpLink,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (desc != null) result.desc = desc;
    if (img != null) result.img = img;
    if (jumpLink != null) result.jumpLink = jumpLink;
    return result;
  }

  BannerItem._();

  factory BannerItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BannerItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BannerItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'banner'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'desc')
    ..aOS(4, _omitFieldNames ? '' : 'img')
    ..aOS(5, _omitFieldNames ? '' : 'jumpLink')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BannerItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BannerItem copyWith(void Function(BannerItem) updates) =>
      super.copyWith((message) => updates(message as BannerItem)) as BannerItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BannerItem create() => BannerItem._();
  @$core.override
  BannerItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BannerItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BannerItem>(create);
  static BannerItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
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

  @$pb.TagNumber(4)
  $core.String get img => $_getSZ(3);
  @$pb.TagNumber(4)
  set img($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasImg() => $_has(3);
  @$pb.TagNumber(4)
  void clearImg() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get jumpLink => $_getSZ(4);
  @$pb.TagNumber(5)
  set jumpLink($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasJumpLink() => $_has(4);
  @$pb.TagNumber(5)
  void clearJumpLink() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

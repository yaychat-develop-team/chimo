// This is a generated file - do not edit.
//
// Generated from server_client/gs_activity.proto.

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

class ActivityListRsp extends $pb.GeneratedMessage {
  factory ActivityListRsp({
    $core.Iterable<ActivityItem>? list,
    $0.Page? page,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (page != null) result.page = page;
    return result;
  }

  ActivityListRsp._();

  factory ActivityListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ActivityListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActivityListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..pPM<ActivityItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: ActivityItem.create)
    ..aOM<$0.Page>(2, _omitFieldNames ? '' : 'page', subBuilder: $0.Page.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityListRsp copyWith(void Function(ActivityListRsp) updates) =>
      super.copyWith((message) => updates(message as ActivityListRsp))
          as ActivityListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActivityListRsp create() => ActivityListRsp._();
  @$core.override
  ActivityListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ActivityListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActivityListRsp>(create);
  static ActivityListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ActivityItem> get list => $_getList(0);

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

class ActivityItem extends $pb.GeneratedMessage {
  factory ActivityItem({
    $fixnum.Int64? id,
    $core.String? bannerUrl,
    $core.String? jumpLink,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (bannerUrl != null) result.bannerUrl = bannerUrl;
    if (jumpLink != null) result.jumpLink = jumpLink;
    return result;
  }

  ActivityItem._();

  factory ActivityItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ActivityItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ActivityItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'base'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'bannerUrl')
    ..aOS(3, _omitFieldNames ? '' : 'jumpLink')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ActivityItem copyWith(void Function(ActivityItem) updates) =>
      super.copyWith((message) => updates(message as ActivityItem))
          as ActivityItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActivityItem create() => ActivityItem._();
  @$core.override
  ActivityItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ActivityItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActivityItem>(create);
  static ActivityItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get bannerUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set bannerUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBannerUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearBannerUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get jumpLink => $_getSZ(2);
  @$pb.TagNumber(3)
  set jumpLink($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasJumpLink() => $_has(2);
  @$pb.TagNumber(3)
  void clearJumpLink() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

// This is a generated file - do not edit.
//
// Generated from server_client/recharge_magic_portal.proto.

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

class RechargeMagicPortalChatReq extends $pb.GeneratedMessage {
  factory RechargeMagicPortalChatReq({
    $fixnum.Int64? toUid,
  }) {
    final result = create();
    if (toUid != null) result.toUid = toUid;
    return result;
  }

  RechargeMagicPortalChatReq._();

  factory RechargeMagicPortalChatReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RechargeMagicPortalChatReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RechargeMagicPortalChatReq',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'recharge_magic_portal'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'toUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RechargeMagicPortalChatReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RechargeMagicPortalChatReq copyWith(
          void Function(RechargeMagicPortalChatReq) updates) =>
      super.copyWith(
              (message) => updates(message as RechargeMagicPortalChatReq))
          as RechargeMagicPortalChatReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RechargeMagicPortalChatReq create() => RechargeMagicPortalChatReq._();
  @$core.override
  RechargeMagicPortalChatReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RechargeMagicPortalChatReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RechargeMagicPortalChatReq>(create);
  static RechargeMagicPortalChatReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get toUid => $_getI64(0);
  @$pb.TagNumber(1)
  set toUid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUid() => $_clearField(1);
}

/// *
/// 卡片内容
class RechargeMagicPortalCardContent extends $pb.GeneratedMessage {
  factory RechargeMagicPortalCardContent({
    $core.String? styleType,
    $core.String? title,
    $core.String? content,
    $core.String? imageUrl,
    $core.String? link,
  }) {
    final result = create();
    if (styleType != null) result.styleType = styleType;
    if (title != null) result.title = title;
    if (content != null) result.content = content;
    if (imageUrl != null) result.imageUrl = imageUrl;
    if (link != null) result.link = link;
    return result;
  }

  RechargeMagicPortalCardContent._();

  factory RechargeMagicPortalCardContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RechargeMagicPortalCardContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RechargeMagicPortalCardContent',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'recharge_magic_portal'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'styleType')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..aOS(4, _omitFieldNames ? '' : 'imageUrl')
    ..aOS(5, _omitFieldNames ? '' : 'link')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RechargeMagicPortalCardContent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RechargeMagicPortalCardContent copyWith(
          void Function(RechargeMagicPortalCardContent) updates) =>
      super.copyWith(
              (message) => updates(message as RechargeMagicPortalCardContent))
          as RechargeMagicPortalCardContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RechargeMagicPortalCardContent create() =>
      RechargeMagicPortalCardContent._();
  @$core.override
  RechargeMagicPortalCardContent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RechargeMagicPortalCardContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RechargeMagicPortalCardContent>(create);
  static RechargeMagicPortalCardContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get styleType => $_getSZ(0);
  @$pb.TagNumber(1)
  set styleType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStyleType() => $_has(0);
  @$pb.TagNumber(1)
  void clearStyleType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get imageUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set imageUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasImageUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearImageUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get link => $_getSZ(4);
  @$pb.TagNumber(5)
  set link($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLink() => $_has(4);
  @$pb.TagNumber(5)
  void clearLink() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

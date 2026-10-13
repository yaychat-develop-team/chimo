// This is a generated file - do not edit.
//
// Generated from server_client/gs_train_group.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GsTrainSelectRoleReq extends $pb.GeneratedMessage {
  factory GsTrainSelectRoleReq({
    $core.String? role,
  }) {
    final result = create();
    if (role != null) result.role = role;
    return result;
  }

  GsTrainSelectRoleReq._();

  factory GsTrainSelectRoleReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsTrainSelectRoleReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsTrainSelectRoleReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_train_group'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'role')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsTrainSelectRoleReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsTrainSelectRoleReq copyWith(void Function(GsTrainSelectRoleReq) updates) =>
      super.copyWith((message) => updates(message as GsTrainSelectRoleReq))
          as GsTrainSelectRoleReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsTrainSelectRoleReq create() => GsTrainSelectRoleReq._();
  @$core.override
  GsTrainSelectRoleReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsTrainSelectRoleReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsTrainSelectRoleReq>(create);
  static GsTrainSelectRoleReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get role => $_getSZ(0);
  @$pb.TagNumber(1)
  set role($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearRole() => $_clearField(1);
}

class GsTrainGuideInfo extends $pb.GeneratedMessage {
  factory GsTrainGuideInfo({
    $core.String? name,
    $core.String? text,
    $core.String? audio,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (text != null) result.text = text;
    if (audio != null) result.audio = audio;
    return result;
  }

  GsTrainGuideInfo._();

  factory GsTrainGuideInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsTrainGuideInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsTrainGuideInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_train_group'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..aOS(3, _omitFieldNames ? '' : 'audio')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsTrainGuideInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsTrainGuideInfo copyWith(void Function(GsTrainGuideInfo) updates) =>
      super.copyWith((message) => updates(message as GsTrainGuideInfo))
          as GsTrainGuideInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsTrainGuideInfo create() => GsTrainGuideInfo._();
  @$core.override
  GsTrainGuideInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsTrainGuideInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsTrainGuideInfo>(create);
  static GsTrainGuideInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get audio => $_getSZ(2);
  @$pb.TagNumber(3)
  set audio($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAudio() => $_has(2);
  @$pb.TagNumber(3)
  void clearAudio() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

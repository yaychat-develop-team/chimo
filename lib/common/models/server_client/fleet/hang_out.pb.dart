// This is a generated file - do not edit.
//
// Generated from server_client/fleet/hang_out.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'hang_out.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'hang_out.pbenum.dart';

class PetHangOutInfo extends $pb.GeneratedMessage {
  factory PetHangOutInfo({
    HangOutScene? scene,
    $core.String? dynamicUrl,
    $core.String? stayStaticUrl,
    $core.String? stayDynamicUrl,
    $core.String? copyWriting,
    PetInfo? petInfo,
  }) {
    final result = create();
    if (scene != null) result.scene = scene;
    if (dynamicUrl != null) result.dynamicUrl = dynamicUrl;
    if (stayStaticUrl != null) result.stayStaticUrl = stayStaticUrl;
    if (stayDynamicUrl != null) result.stayDynamicUrl = stayDynamicUrl;
    if (copyWriting != null) result.copyWriting = copyWriting;
    if (petInfo != null) result.petInfo = petInfo;
    return result;
  }

  PetHangOutInfo._();

  factory PetHangOutInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PetHangOutInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PetHangOutInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'hang_out'),
      createEmptyInstance: create)
    ..aE<HangOutScene>(1, _omitFieldNames ? '' : 'scene',
        enumValues: HangOutScene.values)
    ..aOS(2, _omitFieldNames ? '' : 'dynamicUrl')
    ..aOS(3, _omitFieldNames ? '' : 'stayStaticUrl')
    ..aOS(4, _omitFieldNames ? '' : 'stayDynamicUrl')
    ..aOS(5, _omitFieldNames ? '' : 'copyWriting', protoName: 'copyWriting')
    ..aOM<PetInfo>(6, _omitFieldNames ? '' : 'petInfo',
        subBuilder: PetInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PetHangOutInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PetHangOutInfo copyWith(void Function(PetHangOutInfo) updates) =>
      super.copyWith((message) => updates(message as PetHangOutInfo))
          as PetHangOutInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PetHangOutInfo create() => PetHangOutInfo._();
  @$core.override
  PetHangOutInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PetHangOutInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PetHangOutInfo>(create);
  static PetHangOutInfo? _defaultInstance;

  @$pb.TagNumber(1)
  HangOutScene get scene => $_getN(0);
  @$pb.TagNumber(1)
  set scene(HangOutScene value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasScene() => $_has(0);
  @$pb.TagNumber(1)
  void clearScene() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get dynamicUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set dynamicUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDynamicUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearDynamicUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get stayStaticUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set stayStaticUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStayStaticUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearStayStaticUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get stayDynamicUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set stayDynamicUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStayDynamicUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearStayDynamicUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get copyWriting => $_getSZ(4);
  @$pb.TagNumber(5)
  set copyWriting($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCopyWriting() => $_has(4);
  @$pb.TagNumber(5)
  void clearCopyWriting() => $_clearField(5);

  @$pb.TagNumber(6)
  PetInfo get petInfo => $_getN(5);
  @$pb.TagNumber(6)
  set petInfo(PetInfo value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasPetInfo() => $_has(5);
  @$pb.TagNumber(6)
  void clearPetInfo() => $_clearField(6);
  @$pb.TagNumber(6)
  PetInfo ensurePetInfo() => $_ensure(5);
}

class PetChatMsgInfo extends $pb.GeneratedMessage {
  factory PetChatMsgInfo({
    $core.String? petName,
    $core.String? icon,
    $core.String? tag,
    $core.String? copyWriting,
    $fixnum.Int64? userId,
  }) {
    final result = create();
    if (petName != null) result.petName = petName;
    if (icon != null) result.icon = icon;
    if (tag != null) result.tag = tag;
    if (copyWriting != null) result.copyWriting = copyWriting;
    if (userId != null) result.userId = userId;
    return result;
  }

  PetChatMsgInfo._();

  factory PetChatMsgInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PetChatMsgInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PetChatMsgInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'hang_out'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'petName')
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..aOS(3, _omitFieldNames ? '' : 'tag')
    ..aOS(4, _omitFieldNames ? '' : 'copyWriting', protoName: 'copyWriting')
    ..aInt64(5, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PetChatMsgInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PetChatMsgInfo copyWith(void Function(PetChatMsgInfo) updates) =>
      super.copyWith((message) => updates(message as PetChatMsgInfo))
          as PetChatMsgInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PetChatMsgInfo create() => PetChatMsgInfo._();
  @$core.override
  PetChatMsgInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PetChatMsgInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PetChatMsgInfo>(create);
  static PetChatMsgInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get petName => $_getSZ(0);
  @$pb.TagNumber(1)
  set petName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPetName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPetName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get tag => $_getSZ(2);
  @$pb.TagNumber(3)
  set tag($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTag() => $_has(2);
  @$pb.TagNumber(3)
  void clearTag() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get copyWriting => $_getSZ(3);
  @$pb.TagNumber(4)
  set copyWriting($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCopyWriting() => $_has(3);
  @$pb.TagNumber(4)
  void clearCopyWriting() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get userId => $_getI64(4);
  @$pb.TagNumber(5)
  set userId($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserId() => $_clearField(5);
}

class PetInfo extends $pb.GeneratedMessage {
  factory PetInfo({
    $core.String? petName,
    $fixnum.Int64? petId,
    $core.String? icon,
    $fixnum.Int64? userId,
    $core.String? userName,
  }) {
    final result = create();
    if (petName != null) result.petName = petName;
    if (petId != null) result.petId = petId;
    if (icon != null) result.icon = icon;
    if (userId != null) result.userId = userId;
    if (userName != null) result.userName = userName;
    return result;
  }

  PetInfo._();

  factory PetInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PetInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PetInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'hang_out'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'petName')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'petId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aInt64(4, _omitFieldNames ? '' : 'userId')
    ..aOS(5, _omitFieldNames ? '' : 'userName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PetInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PetInfo copyWith(void Function(PetInfo) updates) =>
      super.copyWith((message) => updates(message as PetInfo)) as PetInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PetInfo create() => PetInfo._();
  @$core.override
  PetInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PetInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PetInfo>(create);
  static PetInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get petName => $_getSZ(0);
  @$pb.TagNumber(1)
  set petName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPetName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPetName() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get petId => $_getI64(1);
  @$pb.TagNumber(2)
  set petId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPetId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get userId => $_getI64(3);
  @$pb.TagNumber(4)
  set userId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get userName => $_getSZ(4);
  @$pb.TagNumber(5)
  set userName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUserName() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserName() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

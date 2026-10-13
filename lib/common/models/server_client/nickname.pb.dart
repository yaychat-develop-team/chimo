// This is a generated file - do not edit.
//
// Generated from server_client/nickname.proto.

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

/// 色值预设：彩色=单项，炫彩=多项渐变
class ColorPreset extends $pb.GeneratedMessage {
  factory ColorPreset({
    $core.Iterable<$core.String>? values,
  }) {
    final result = create();
    if (values != null) result.values.addAll(values);
    return result;
  }

  ColorPreset._();

  factory ColorPreset.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ColorPreset.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ColorPreset',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'nickname'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'values')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ColorPreset clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ColorPreset copyWith(void Function(ColorPreset) updates) =>
      super.copyWith((message) => updates(message as ColorPreset))
          as ColorPreset;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ColorPreset create() => ColorPreset._();
  @$core.override
  ColorPreset createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ColorPreset getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ColorPreset>(create);
  static ColorPreset? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get values => $_getList(0);
}

class NicknameStyleOptionsRsp extends $pb.GeneratedMessage {
  factory NicknameStyleOptionsRsp({
    $core.Iterable<ColorPreset>? colorOptions,
    $core.Iterable<ColorPreset>? rainbowOptions,
    $core.int? validityDays,
    $core.int? colorCardRemainCount,
    $core.int? rainbowCardRemainCount,
  }) {
    final result = create();
    if (colorOptions != null) result.colorOptions.addAll(colorOptions);
    if (rainbowOptions != null) result.rainbowOptions.addAll(rainbowOptions);
    if (validityDays != null) result.validityDays = validityDays;
    if (colorCardRemainCount != null)
      result.colorCardRemainCount = colorCardRemainCount;
    if (rainbowCardRemainCount != null)
      result.rainbowCardRemainCount = rainbowCardRemainCount;
    return result;
  }

  NicknameStyleOptionsRsp._();

  factory NicknameStyleOptionsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NicknameStyleOptionsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NicknameStyleOptionsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'nickname'),
      createEmptyInstance: create)
    ..pPM<ColorPreset>(1, _omitFieldNames ? '' : 'colorOptions',
        subBuilder: ColorPreset.create)
    ..pPM<ColorPreset>(2, _omitFieldNames ? '' : 'rainbowOptions',
        subBuilder: ColorPreset.create)
    ..aI(3, _omitFieldNames ? '' : 'validityDays')
    ..aI(4, _omitFieldNames ? '' : 'colorCardRemainCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'rainbowCardRemainCount',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NicknameStyleOptionsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NicknameStyleOptionsRsp copyWith(
          void Function(NicknameStyleOptionsRsp) updates) =>
      super.copyWith((message) => updates(message as NicknameStyleOptionsRsp))
          as NicknameStyleOptionsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NicknameStyleOptionsRsp create() => NicknameStyleOptionsRsp._();
  @$core.override
  NicknameStyleOptionsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NicknameStyleOptionsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NicknameStyleOptionsRsp>(create);
  static NicknameStyleOptionsRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ColorPreset> get colorOptions => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<ColorPreset> get rainbowOptions => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get validityDays => $_getIZ(2);
  @$pb.TagNumber(3)
  set validityDays($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValidityDays() => $_has(2);
  @$pb.TagNumber(3)
  void clearValidityDays() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get colorCardRemainCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set colorCardRemainCount($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasColorCardRemainCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearColorCardRemainCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get rainbowCardRemainCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set rainbowCardRemainCount($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRainbowCardRemainCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearRainbowCardRemainCount() => $_clearField(5);
}

/// 使用昵称权益卡请求
class UseNicknameCardReq extends $pb.GeneratedMessage {
  factory UseNicknameCardReq({
    $core.int? subType,
    $core.Iterable<$core.String>? colorValue,
  }) {
    final result = create();
    if (subType != null) result.subType = subType;
    if (colorValue != null) result.colorValue.addAll(colorValue);
    return result;
  }

  UseNicknameCardReq._();

  factory UseNicknameCardReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UseNicknameCardReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UseNicknameCardReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'nickname'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'subType')
    ..pPS(2, _omitFieldNames ? '' : 'colorValue')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UseNicknameCardReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UseNicknameCardReq copyWith(void Function(UseNicknameCardReq) updates) =>
      super.copyWith((message) => updates(message as UseNicknameCardReq))
          as UseNicknameCardReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UseNicknameCardReq create() => UseNicknameCardReq._();
  @$core.override
  UseNicknameCardReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UseNicknameCardReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UseNicknameCardReq>(create);
  static UseNicknameCardReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get subType => $_getIZ(0);
  @$pb.TagNumber(1)
  set subType($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSubType() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubType() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get colorValue => $_getList(1);
}

/// 切换昵称展示样式请求
class SwitchNicknameActiveReq extends $pb.GeneratedMessage {
  factory SwitchNicknameActiveReq({
    $core.int? activeType,
  }) {
    final result = create();
    if (activeType != null) result.activeType = activeType;
    return result;
  }

  SwitchNicknameActiveReq._();

  factory SwitchNicknameActiveReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SwitchNicknameActiveReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SwitchNicknameActiveReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'nickname'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'activeType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SwitchNicknameActiveReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SwitchNicknameActiveReq copyWith(
          void Function(SwitchNicknameActiveReq) updates) =>
      super.copyWith((message) => updates(message as SwitchNicknameActiveReq))
          as SwitchNicknameActiveReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SwitchNicknameActiveReq create() => SwitchNicknameActiveReq._();
  @$core.override
  SwitchNicknameActiveReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SwitchNicknameActiveReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SwitchNicknameActiveReq>(create);
  static SwitchNicknameActiveReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get activeType => $_getIZ(0);
  @$pb.TagNumber(1)
  set activeType($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActiveType() => $_has(0);
  @$pb.TagNumber(1)
  void clearActiveType() => $_clearField(1);
}

/// 昵称特效状态
class NicknameStatusRsp extends $pb.GeneratedMessage {
  factory NicknameStatusRsp({
    $core.int? activeType,
    $core.Iterable<$core.String>? colorValue,
    $fixnum.Int64? colorExpireTime,
    $core.Iterable<$core.String>? rainbowValue,
    $fixnum.Int64? rainbowExpireTime,
    $core.Iterable<NicknameObtainEntry>? obtainEntries,
  }) {
    final result = create();
    if (activeType != null) result.activeType = activeType;
    if (colorValue != null) result.colorValue.addAll(colorValue);
    if (colorExpireTime != null) result.colorExpireTime = colorExpireTime;
    if (rainbowValue != null) result.rainbowValue.addAll(rainbowValue);
    if (rainbowExpireTime != null) result.rainbowExpireTime = rainbowExpireTime;
    if (obtainEntries != null) result.obtainEntries.addAll(obtainEntries);
    return result;
  }

  NicknameStatusRsp._();

  factory NicknameStatusRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NicknameStatusRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NicknameStatusRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'nickname'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'activeType')
    ..pPS(2, _omitFieldNames ? '' : 'colorValue')
    ..aInt64(3, _omitFieldNames ? '' : 'colorExpireTime')
    ..pPS(4, _omitFieldNames ? '' : 'rainbowValue')
    ..aInt64(5, _omitFieldNames ? '' : 'rainbowExpireTime')
    ..pPM<NicknameObtainEntry>(6, _omitFieldNames ? '' : 'obtainEntries',
        subBuilder: NicknameObtainEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NicknameStatusRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NicknameStatusRsp copyWith(void Function(NicknameStatusRsp) updates) =>
      super.copyWith((message) => updates(message as NicknameStatusRsp))
          as NicknameStatusRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NicknameStatusRsp create() => NicknameStatusRsp._();
  @$core.override
  NicknameStatusRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NicknameStatusRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NicknameStatusRsp>(create);
  static NicknameStatusRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get activeType => $_getIZ(0);
  @$pb.TagNumber(1)
  set activeType($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActiveType() => $_has(0);
  @$pb.TagNumber(1)
  void clearActiveType() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get colorValue => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get colorExpireTime => $_getI64(2);
  @$pb.TagNumber(3)
  set colorExpireTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasColorExpireTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearColorExpireTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get rainbowValue => $_getList(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get rainbowExpireTime => $_getI64(4);
  @$pb.TagNumber(5)
  set rainbowExpireTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRainbowExpireTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearRainbowExpireTime() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<NicknameObtainEntry> get obtainEntries => $_getList(5);
}

/// 权益卡获取入口（活动）
class NicknameObtainEntry extends $pb.GeneratedMessage {
  factory NicknameObtainEntry({
    $fixnum.Int64? activityId,
    $core.String? name,
    $core.String? description,
    $core.String? cardImageUrl,
    $core.String? jumpLink,
  }) {
    final result = create();
    if (activityId != null) result.activityId = activityId;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (cardImageUrl != null) result.cardImageUrl = cardImageUrl;
    if (jumpLink != null) result.jumpLink = jumpLink;
    return result;
  }

  NicknameObtainEntry._();

  factory NicknameObtainEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NicknameObtainEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NicknameObtainEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'nickname'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'activityId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'cardImageUrl')
    ..aOS(5, _omitFieldNames ? '' : 'jumpLink')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NicknameObtainEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NicknameObtainEntry copyWith(void Function(NicknameObtainEntry) updates) =>
      super.copyWith((message) => updates(message as NicknameObtainEntry))
          as NicknameObtainEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NicknameObtainEntry create() => NicknameObtainEntry._();
  @$core.override
  NicknameObtainEntry createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NicknameObtainEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NicknameObtainEntry>(create);
  static NicknameObtainEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get activityId => $_getI64(0);
  @$pb.TagNumber(1)
  set activityId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActivityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get cardImageUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set cardImageUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCardImageUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearCardImageUrl() => $_clearField(4);

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

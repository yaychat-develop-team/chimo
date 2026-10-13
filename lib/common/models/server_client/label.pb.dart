// This is a generated file - do not edit.
//
// Generated from server_client/label.proto.

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
/// 冷启动
///
///
///   所有接口均以 /api/v1/label 开头
///
///  get /companion-party-distribute?ownerId={ownerId}
/// return CompanionPartyDistributeLabelResp
/// 服务分发标签
///
///  get /room-distribute
/// return RoomDistributeLabelResp
/// 房间工具箱-分发标签
///
///  get /ride
/// return RideLabelResp
/// 兜风广场标签
///
/// POST /set
/// body SetLabelsReq
/// return BaseRsp
/// 保存交友心愿标签
class RoomDistributeLabelResp extends $pb.GeneratedMessage {
  factory RoomDistributeLabelResp({
    $core.Iterable<LabelItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  RoomDistributeLabelResp._();

  factory RoomDistributeLabelResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomDistributeLabelResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomDistributeLabelResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'label'),
      createEmptyInstance: create)
    ..pPM<LabelItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: LabelItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomDistributeLabelResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomDistributeLabelResp copyWith(
          void Function(RoomDistributeLabelResp) updates) =>
      super.copyWith((message) => updates(message as RoomDistributeLabelResp))
          as RoomDistributeLabelResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomDistributeLabelResp create() => RoomDistributeLabelResp._();
  @$core.override
  RoomDistributeLabelResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomDistributeLabelResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomDistributeLabelResp>(create);
  static RoomDistributeLabelResp? _defaultInstance;

  /// *
  /// 标签列表
  @$pb.TagNumber(1)
  $pb.PbList<LabelItem> get items => $_getList(0);
}

class CompanionPartyDistributeLabelResp extends $pb.GeneratedMessage {
  factory CompanionPartyDistributeLabelResp({
    $core.Iterable<LabelItem>? typeCodes,
    $core.Iterable<LabelItem>? technicalCodes,
  }) {
    final result = create();
    if (typeCodes != null) result.typeCodes.addAll(typeCodes);
    if (technicalCodes != null) result.technicalCodes.addAll(technicalCodes);
    return result;
  }

  CompanionPartyDistributeLabelResp._();

  factory CompanionPartyDistributeLabelResp.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionPartyDistributeLabelResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionPartyDistributeLabelResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'label'),
      createEmptyInstance: create)
    ..pPM<LabelItem>(1, _omitFieldNames ? '' : 'typeCodes',
        subBuilder: LabelItem.create)
    ..pPM<LabelItem>(2, _omitFieldNames ? '' : 'technicalCodes',
        subBuilder: LabelItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionPartyDistributeLabelResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionPartyDistributeLabelResp copyWith(
          void Function(CompanionPartyDistributeLabelResp) updates) =>
      super.copyWith((message) =>
              updates(message as CompanionPartyDistributeLabelResp))
          as CompanionPartyDistributeLabelResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionPartyDistributeLabelResp create() =>
      CompanionPartyDistributeLabelResp._();
  @$core.override
  CompanionPartyDistributeLabelResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionPartyDistributeLabelResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionPartyDistributeLabelResp>(
          create);
  static CompanionPartyDistributeLabelResp? _defaultInstance;

  /// *
  /// 类型codes
  @$pb.TagNumber(1)
  $pb.PbList<LabelItem> get typeCodes => $_getList(0);

  /// *
  /// 技能codes
  @$pb.TagNumber(2)
  $pb.PbList<LabelItem> get technicalCodes => $_getList(1);
}

class LabelItem extends $pb.GeneratedMessage {
  factory LabelItem({
    $core.String? name,
    $fixnum.Int64? id,
    $core.String? icon,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (id != null) result.id = id;
    if (icon != null) result.icon = icon;
    return result;
  }

  LabelItem._();

  factory LabelItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LabelItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LabelItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'label'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aInt64(2, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LabelItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LabelItem copyWith(void Function(LabelItem) updates) =>
      super.copyWith((message) => updates(message as LabelItem)) as LabelItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LabelItem create() => LabelItem._();
  @$core.override
  LabelItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LabelItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LabelItem>(create);
  static LabelItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);
}

class RideLabelResp extends $pb.GeneratedMessage {
  factory RideLabelResp({
    $core.Iterable<LabelItem>? like,
    $core.Iterable<LabelItem>? lookFor,
    $core.Iterable<LabelItem>? want,
  }) {
    final result = create();
    if (like != null) result.like.addAll(like);
    if (lookFor != null) result.lookFor.addAll(lookFor);
    if (want != null) result.want.addAll(want);
    return result;
  }

  RideLabelResp._();

  factory RideLabelResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RideLabelResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RideLabelResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'label'),
      createEmptyInstance: create)
    ..pPM<LabelItem>(1, _omitFieldNames ? '' : 'like',
        subBuilder: LabelItem.create)
    ..pPM<LabelItem>(2, _omitFieldNames ? '' : 'lookFor',
        subBuilder: LabelItem.create)
    ..pPM<LabelItem>(3, _omitFieldNames ? '' : 'want',
        subBuilder: LabelItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideLabelResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RideLabelResp copyWith(void Function(RideLabelResp) updates) =>
      super.copyWith((message) => updates(message as RideLabelResp))
          as RideLabelResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RideLabelResp create() => RideLabelResp._();
  @$core.override
  RideLabelResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RideLabelResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RideLabelResp>(create);
  static RideLabelResp? _defaultInstance;

  /// *
  /// 喜欢
  @$pb.TagNumber(1)
  $pb.PbList<LabelItem> get like => $_getList(0);

  /// *
  /// 想找
  @$pb.TagNumber(2)
  $pb.PbList<LabelItem> get lookFor => $_getList(1);

  /// *
  /// 想要
  @$pb.TagNumber(3)
  $pb.PbList<LabelItem> get want => $_getList(2);
}

class SetLabelsReq extends $pb.GeneratedMessage {
  factory SetLabelsReq({
    $core.Iterable<$fixnum.Int64>? likeLabels,
    $core.Iterable<$fixnum.Int64>? wantLabels,
  }) {
    final result = create();
    if (likeLabels != null) result.likeLabels.addAll(likeLabels);
    if (wantLabels != null) result.wantLabels.addAll(wantLabels);
    return result;
  }

  SetLabelsReq._();

  factory SetLabelsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetLabelsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetLabelsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'label'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'likeLabels', $pb.PbFieldType.K6)
    ..p<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'wantLabels', $pb.PbFieldType.K6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetLabelsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetLabelsReq copyWith(void Function(SetLabelsReq) updates) =>
      super.copyWith((message) => updates(message as SetLabelsReq))
          as SetLabelsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetLabelsReq create() => SetLabelsReq._();
  @$core.override
  SetLabelsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetLabelsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetLabelsReq>(create);
  static SetLabelsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get likeLabels => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$fixnum.Int64> get wantLabels => $_getList(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

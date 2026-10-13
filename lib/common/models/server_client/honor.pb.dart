// This is a generated file - do not edit.
//
// Generated from server_client/honor.proto.

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

class HonorItem extends $pb.GeneratedMessage {
  factory HonorItem({
    $fixnum.Int64? hid,
    $core.String? name,
    $core.String? icon,
    $core.String? image,
    $core.bool? wear,
    $core.bool? forever,
    $fixnum.Int64? expireTime,
    $fixnum.Int64? lastActiveTime,
    $fixnum.Int64? firstActiveTime,
    $core.String? content,
    $core.int? targetCount,
    $core.int? currentCount,
    $core.int? rewardDays,
    $core.String? colors,
  }) {
    final result = create();
    if (hid != null) result.hid = hid;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (image != null) result.image = image;
    if (wear != null) result.wear = wear;
    if (forever != null) result.forever = forever;
    if (expireTime != null) result.expireTime = expireTime;
    if (lastActiveTime != null) result.lastActiveTime = lastActiveTime;
    if (firstActiveTime != null) result.firstActiveTime = firstActiveTime;
    if (content != null) result.content = content;
    if (targetCount != null) result.targetCount = targetCount;
    if (currentCount != null) result.currentCount = currentCount;
    if (rewardDays != null) result.rewardDays = rewardDays;
    if (colors != null) result.colors = colors;
    return result;
  }

  HonorItem._();

  factory HonorItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HonorItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HonorItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'honor'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'hid')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aOS(4, _omitFieldNames ? '' : 'image')
    ..aOB(5, _omitFieldNames ? '' : 'wear')
    ..aOB(6, _omitFieldNames ? '' : 'forever')
    ..aInt64(7, _omitFieldNames ? '' : 'expireTime')
    ..aInt64(8, _omitFieldNames ? '' : 'lastActiveTime')
    ..aInt64(9, _omitFieldNames ? '' : 'firstActiveTime')
    ..aOS(10, _omitFieldNames ? '' : 'content')
    ..aI(11, _omitFieldNames ? '' : 'targetCount')
    ..aI(12, _omitFieldNames ? '' : 'currentCount')
    ..aI(13, _omitFieldNames ? '' : 'rewardDays')
    ..aOS(14, _omitFieldNames ? '' : 'colors')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonorItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonorItem copyWith(void Function(HonorItem) updates) =>
      super.copyWith((message) => updates(message as HonorItem)) as HonorItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HonorItem create() => HonorItem._();
  @$core.override
  HonorItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HonorItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HonorItem>(create);
  static HonorItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get hid => $_getI64(0);
  @$pb.TagNumber(1)
  set hid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHid() => $_has(0);
  @$pb.TagNumber(1)
  void clearHid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get image => $_getSZ(3);
  @$pb.TagNumber(4)
  set image($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearImage() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get wear => $_getBF(4);
  @$pb.TagNumber(5)
  set wear($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasWear() => $_has(4);
  @$pb.TagNumber(5)
  void clearWear() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get forever => $_getBF(5);
  @$pb.TagNumber(6)
  set forever($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasForever() => $_has(5);
  @$pb.TagNumber(6)
  void clearForever() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get expireTime => $_getI64(6);
  @$pb.TagNumber(7)
  set expireTime($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasExpireTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearExpireTime() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get lastActiveTime => $_getI64(7);
  @$pb.TagNumber(8)
  set lastActiveTime($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLastActiveTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastActiveTime() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get firstActiveTime => $_getI64(8);
  @$pb.TagNumber(9)
  set firstActiveTime($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasFirstActiveTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearFirstActiveTime() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get content => $_getSZ(9);
  @$pb.TagNumber(10)
  set content($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasContent() => $_has(9);
  @$pb.TagNumber(10)
  void clearContent() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get targetCount => $_getIZ(10);
  @$pb.TagNumber(11)
  set targetCount($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasTargetCount() => $_has(10);
  @$pb.TagNumber(11)
  void clearTargetCount() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get currentCount => $_getIZ(11);
  @$pb.TagNumber(12)
  set currentCount($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasCurrentCount() => $_has(11);
  @$pb.TagNumber(12)
  void clearCurrentCount() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get rewardDays => $_getIZ(12);
  @$pb.TagNumber(13)
  set rewardDays($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasRewardDays() => $_has(12);
  @$pb.TagNumber(13)
  void clearRewardDays() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get colors => $_getSZ(13);
  @$pb.TagNumber(14)
  set colors($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasColors() => $_has(13);
  @$pb.TagNumber(14)
  void clearColors() => $_clearField(14);
}

class HonorItemListRsp extends $pb.GeneratedMessage {
  factory HonorItemListRsp({
    $core.Iterable<HonorItem>? activeList,
    $core.Iterable<HonorItem>? targetList,
  }) {
    final result = create();
    if (activeList != null) result.activeList.addAll(activeList);
    if (targetList != null) result.targetList.addAll(targetList);
    return result;
  }

  HonorItemListRsp._();

  factory HonorItemListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HonorItemListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HonorItemListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'honor'),
      createEmptyInstance: create)
    ..pPM<HonorItem>(1, _omitFieldNames ? '' : 'activeList',
        subBuilder: HonorItem.create)
    ..pPM<HonorItem>(2, _omitFieldNames ? '' : 'targetList',
        subBuilder: HonorItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonorItemListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonorItemListRsp copyWith(void Function(HonorItemListRsp) updates) =>
      super.copyWith((message) => updates(message as HonorItemListRsp))
          as HonorItemListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HonorItemListRsp create() => HonorItemListRsp._();
  @$core.override
  HonorItemListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HonorItemListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HonorItemListRsp>(create);
  static HonorItemListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<HonorItem> get activeList => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<HonorItem> get targetList => $_getList(1);
}

class HonorWearReq extends $pb.GeneratedMessage {
  factory HonorWearReq({
    $fixnum.Int64? hid,
    $core.bool? wear,
  }) {
    final result = create();
    if (hid != null) result.hid = hid;
    if (wear != null) result.wear = wear;
    return result;
  }

  HonorWearReq._();

  factory HonorWearReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HonorWearReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HonorWearReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'honor'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'hid')
    ..aOB(2, _omitFieldNames ? '' : 'wear')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonorWearReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonorWearReq copyWith(void Function(HonorWearReq) updates) =>
      super.copyWith((message) => updates(message as HonorWearReq))
          as HonorWearReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HonorWearReq create() => HonorWearReq._();
  @$core.override
  HonorWearReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HonorWearReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HonorWearReq>(create);
  static HonorWearReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get hid => $_getI64(0);
  @$pb.TagNumber(1)
  set hid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHid() => $_has(0);
  @$pb.TagNumber(1)
  void clearHid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get wear => $_getBF(1);
  @$pb.TagNumber(2)
  set wear($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWear() => $_has(1);
  @$pb.TagNumber(2)
  void clearWear() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

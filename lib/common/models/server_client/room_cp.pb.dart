// This is a generated file - do not edit.
//
// Generated from server_client/room_cp.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'room_cp.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'room_cp.pbenum.dart';

class CpRoomOpReq extends $pb.GeneratedMessage {
  factory CpRoomOpReq({
    CPStage? stage,
    $fixnum.Int64? roomId,
    $core.int? relationId,
  }) {
    final result = create();
    if (stage != null) result.stage = stage;
    if (roomId != null) result.roomId = roomId;
    if (relationId != null) result.relationId = relationId;
    return result;
  }

  CpRoomOpReq._();

  factory CpRoomOpReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CpRoomOpReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CpRoomOpReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aE<CPStage>(1, _omitFieldNames ? '' : 'stage', enumValues: CPStage.values)
    ..aInt64(2, _omitFieldNames ? '' : 'roomId')
    ..aI(3, _omitFieldNames ? '' : 'relationId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpRoomOpReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpRoomOpReq copyWith(void Function(CpRoomOpReq) updates) =>
      super.copyWith((message) => updates(message as CpRoomOpReq))
          as CpRoomOpReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CpRoomOpReq create() => CpRoomOpReq._();
  @$core.override
  CpRoomOpReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CpRoomOpReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CpRoomOpReq>(create);
  static CpRoomOpReq? _defaultInstance;

  @$pb.TagNumber(1)
  CPStage get stage => $_getN(0);
  @$pb.TagNumber(1)
  set stage(CPStage value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStage() => $_has(0);
  @$pb.TagNumber(1)
  void clearStage() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roomId => $_getI64(1);
  @$pb.TagNumber(2)
  set roomId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get relationId => $_getIZ(2);
  @$pb.TagNumber(3)
  set relationId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRelationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRelationId() => $_clearField(3);
}

class CpRoomManualReq extends $pb.GeneratedMessage {
  factory CpRoomManualReq({
    $fixnum.Int64? roomId,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  CpRoomManualReq._();

  factory CpRoomManualReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CpRoomManualReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CpRoomManualReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpRoomManualReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpRoomManualReq copyWith(void Function(CpRoomManualReq) updates) =>
      super.copyWith((message) => updates(message as CpRoomManualReq))
          as CpRoomManualReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CpRoomManualReq create() => CpRoomManualReq._();
  @$core.override
  CpRoomManualReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CpRoomManualReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CpRoomManualReq>(create);
  static CpRoomManualReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);
}

class CpRoomManualResp extends $pb.GeneratedMessage {
  factory CpRoomManualResp() => create();

  CpRoomManualResp._();

  factory CpRoomManualResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CpRoomManualResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CpRoomManualResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpRoomManualResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpRoomManualResp copyWith(void Function(CpRoomManualResp) updates) =>
      super.copyWith((message) => updates(message as CpRoomManualResp))
          as CpRoomManualResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CpRoomManualResp create() => CpRoomManualResp._();
  @$core.override
  CpRoomManualResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CpRoomManualResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CpRoomManualResp>(create);
  static CpRoomManualResp? _defaultInstance;
}

class CPInfo extends $pb.GeneratedMessage {
  factory CPInfo({
    CPStage? stage,
    CPHotInfo? hotInfo,
    CPChooseInfo? chooseInfo,
    CPHandsInfo? handsInfo,
    CPEndInfo? endInfo,
  }) {
    final result = create();
    if (stage != null) result.stage = stage;
    if (hotInfo != null) result.hotInfo = hotInfo;
    if (chooseInfo != null) result.chooseInfo = chooseInfo;
    if (handsInfo != null) result.handsInfo = handsInfo;
    if (endInfo != null) result.endInfo = endInfo;
    return result;
  }

  CPInfo._();

  factory CPInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CPInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CPInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aE<CPStage>(1, _omitFieldNames ? '' : 'stage', enumValues: CPStage.values)
    ..aOM<CPHotInfo>(3, _omitFieldNames ? '' : 'hotInfo',
        subBuilder: CPHotInfo.create)
    ..aOM<CPChooseInfo>(4, _omitFieldNames ? '' : 'chooseInfo',
        subBuilder: CPChooseInfo.create)
    ..aOM<CPHandsInfo>(5, _omitFieldNames ? '' : 'handsInfo',
        subBuilder: CPHandsInfo.create)
    ..aOM<CPEndInfo>(6, _omitFieldNames ? '' : 'endInfo',
        subBuilder: CPEndInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPInfo copyWith(void Function(CPInfo) updates) =>
      super.copyWith((message) => updates(message as CPInfo)) as CPInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CPInfo create() => CPInfo._();
  @$core.override
  CPInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CPInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CPInfo>(create);
  static CPInfo? _defaultInstance;

  @$pb.TagNumber(1)
  CPStage get stage => $_getN(0);
  @$pb.TagNumber(1)
  set stage(CPStage value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStage() => $_has(0);
  @$pb.TagNumber(1)
  void clearStage() => $_clearField(1);

  @$pb.TagNumber(3)
  CPHotInfo get hotInfo => $_getN(1);
  @$pb.TagNumber(3)
  set hotInfo(CPHotInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasHotInfo() => $_has(1);
  @$pb.TagNumber(3)
  void clearHotInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  CPHotInfo ensureHotInfo() => $_ensure(1);

  @$pb.TagNumber(4)
  CPChooseInfo get chooseInfo => $_getN(2);
  @$pb.TagNumber(4)
  set chooseInfo(CPChooseInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasChooseInfo() => $_has(2);
  @$pb.TagNumber(4)
  void clearChooseInfo() => $_clearField(4);
  @$pb.TagNumber(4)
  CPChooseInfo ensureChooseInfo() => $_ensure(2);

  @$pb.TagNumber(5)
  CPHandsInfo get handsInfo => $_getN(3);
  @$pb.TagNumber(5)
  set handsInfo(CPHandsInfo value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasHandsInfo() => $_has(3);
  @$pb.TagNumber(5)
  void clearHandsInfo() => $_clearField(5);
  @$pb.TagNumber(5)
  CPHandsInfo ensureHandsInfo() => $_ensure(3);

  @$pb.TagNumber(6)
  CPEndInfo get endInfo => $_getN(4);
  @$pb.TagNumber(6)
  set endInfo(CPEndInfo value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasEndInfo() => $_has(4);
  @$pb.TagNumber(6)
  void clearEndInfo() => $_clearField(6);
  @$pb.TagNumber(6)
  CPEndInfo ensureEndInfo() => $_ensure(4);
}

class CPHotInfo extends $pb.GeneratedMessage {
  factory CPHotInfo({
    $core.Iterable<CPHotItem>? items,
    $core.Iterable<CPNewHotItem>? newItems,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    if (newItems != null) result.newItems.addAll(newItems);
    return result;
  }

  CPHotInfo._();

  factory CPHotInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CPHotInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CPHotInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..pPM<CPHotItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: CPHotItem.create)
    ..pPM<CPNewHotItem>(2, _omitFieldNames ? '' : 'newItems',
        subBuilder: CPNewHotItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPHotInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPHotInfo copyWith(void Function(CPHotInfo) updates) =>
      super.copyWith((message) => updates(message as CPHotInfo)) as CPHotInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CPHotInfo create() => CPHotInfo._();
  @$core.override
  CPHotInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CPHotInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CPHotInfo>(create);
  static CPHotInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CPHotItem> get items => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<CPNewHotItem> get newItems => $_getList(1);
}

class CPHotItem extends $pb.GeneratedMessage {
  factory CPHotItem({
    $fixnum.Int64? uid,
    $fixnum.Int64? heart,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (heart != null) result.heart = heart;
    return result;
  }

  CPHotItem._();

  factory CPHotItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CPHotItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CPHotItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aInt64(2, _omitFieldNames ? '' : 'heart')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPHotItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPHotItem copyWith(void Function(CPHotItem) updates) =>
      super.copyWith((message) => updates(message as CPHotItem)) as CPHotItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CPHotItem create() => CPHotItem._();
  @$core.override
  CPHotItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CPHotItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CPHotItem>(create);
  static CPHotItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get heart => $_getI64(1);
  @$pb.TagNumber(2)
  set heart($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHeart() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeart() => $_clearField(2);
}

class CPNewHotItem extends $pb.GeneratedMessage {
  factory CPNewHotItem({
    $fixnum.Int64? heart,
  }) {
    final result = create();
    if (heart != null) result.heart = heart;
    return result;
  }

  CPNewHotItem._();

  factory CPNewHotItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CPNewHotItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CPNewHotItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'heart')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPNewHotItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPNewHotItem copyWith(void Function(CPNewHotItem) updates) =>
      super.copyWith((message) => updates(message as CPNewHotItem))
          as CPNewHotItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CPNewHotItem create() => CPNewHotItem._();
  @$core.override
  CPNewHotItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CPNewHotItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CPNewHotItem>(create);
  static CPNewHotItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get heart => $_getI64(0);
  @$pb.TagNumber(1)
  set heart($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHeart() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeart() => $_clearField(1);
}

class CPChooseInfo extends $pb.GeneratedMessage {
  factory CPChooseInfo({
    $core.Iterable<CPChooseItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  CPChooseInfo._();

  factory CPChooseInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CPChooseInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CPChooseInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..pPM<CPChooseItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: CPChooseItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPChooseInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPChooseInfo copyWith(void Function(CPChooseInfo) updates) =>
      super.copyWith((message) => updates(message as CPChooseInfo))
          as CPChooseInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CPChooseInfo create() => CPChooseInfo._();
  @$core.override
  CPChooseInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CPChooseInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CPChooseInfo>(create);
  static CPChooseInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CPChooseItem> get items => $_getList(0);
}

class CPChooseItem extends $pb.GeneratedMessage {
  factory CPChooseItem({
    $fixnum.Int64? uid1,
    $fixnum.Int64? uid2,
    $fixnum.Int64? heart,
  }) {
    final result = create();
    if (uid1 != null) result.uid1 = uid1;
    if (uid2 != null) result.uid2 = uid2;
    if (heart != null) result.heart = heart;
    return result;
  }

  CPChooseItem._();

  factory CPChooseItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CPChooseItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CPChooseItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid1')
    ..aInt64(2, _omitFieldNames ? '' : 'uid2')
    ..aInt64(3, _omitFieldNames ? '' : 'heart')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPChooseItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPChooseItem copyWith(void Function(CPChooseItem) updates) =>
      super.copyWith((message) => updates(message as CPChooseItem))
          as CPChooseItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CPChooseItem create() => CPChooseItem._();
  @$core.override
  CPChooseItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CPChooseItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CPChooseItem>(create);
  static CPChooseItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid1 => $_getI64(0);
  @$pb.TagNumber(1)
  set uid1($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid1() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid1() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid2 => $_getI64(1);
  @$pb.TagNumber(2)
  set uid2($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid2() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid2() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get heart => $_getI64(2);
  @$pb.TagNumber(3)
  set heart($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHeart() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeart() => $_clearField(3);
}

class CPProgressItem extends $pb.GeneratedMessage {
  factory CPProgressItem({
    $core.int? progress,
    $core.String? icon,
    $core.String? iconDynamic,
    $core.String? dynamicStyle,
  }) {
    final result = create();
    if (progress != null) result.progress = progress;
    if (icon != null) result.icon = icon;
    if (iconDynamic != null) result.iconDynamic = iconDynamic;
    if (dynamicStyle != null) result.dynamicStyle = dynamicStyle;
    return result;
  }

  CPProgressItem._();

  factory CPProgressItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CPProgressItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CPProgressItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'progress')
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..aOS(3, _omitFieldNames ? '' : 'iconDynamic')
    ..aOS(4, _omitFieldNames ? '' : 'dynamicStyle')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPProgressItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPProgressItem copyWith(void Function(CPProgressItem) updates) =>
      super.copyWith((message) => updates(message as CPProgressItem))
          as CPProgressItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CPProgressItem create() => CPProgressItem._();
  @$core.override
  CPProgressItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CPProgressItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CPProgressItem>(create);
  static CPProgressItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get progress => $_getIZ(0);
  @$pb.TagNumber(1)
  set progress($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProgress() => $_has(0);
  @$pb.TagNumber(1)
  void clearProgress() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get iconDynamic => $_getSZ(2);
  @$pb.TagNumber(3)
  set iconDynamic($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIconDynamic() => $_has(2);
  @$pb.TagNumber(3)
  void clearIconDynamic() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get dynamicStyle => $_getSZ(3);
  @$pb.TagNumber(4)
  set dynamicStyle($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDynamicStyle() => $_has(3);
  @$pb.TagNumber(4)
  void clearDynamicStyle() => $_clearField(4);
}

class CPHandsInfo extends $pb.GeneratedMessage {
  factory CPHandsInfo({
    $core.String? currentTitle,
    $fixnum.Int64? uid1,
    $fixnum.Int64? uid2,
    $fixnum.Int64? totalProgress,
    $fixnum.Int64? currentProgress,
    $core.String? progressDesc,
    $core.Iterable<CPProgressItem>? progressItems,
  }) {
    final result = create();
    if (currentTitle != null) result.currentTitle = currentTitle;
    if (uid1 != null) result.uid1 = uid1;
    if (uid2 != null) result.uid2 = uid2;
    if (totalProgress != null) result.totalProgress = totalProgress;
    if (currentProgress != null) result.currentProgress = currentProgress;
    if (progressDesc != null) result.progressDesc = progressDesc;
    if (progressItems != null) result.progressItems.addAll(progressItems);
    return result;
  }

  CPHandsInfo._();

  factory CPHandsInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CPHandsInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CPHandsInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'currentTitle')
    ..aInt64(2, _omitFieldNames ? '' : 'uid1')
    ..aInt64(3, _omitFieldNames ? '' : 'uid2')
    ..aInt64(4, _omitFieldNames ? '' : 'totalProgress')
    ..aInt64(5, _omitFieldNames ? '' : 'currentProgress')
    ..aOS(6, _omitFieldNames ? '' : 'progressDesc')
    ..pPM<CPProgressItem>(7, _omitFieldNames ? '' : 'progressItems',
        subBuilder: CPProgressItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPHandsInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPHandsInfo copyWith(void Function(CPHandsInfo) updates) =>
      super.copyWith((message) => updates(message as CPHandsInfo))
          as CPHandsInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CPHandsInfo create() => CPHandsInfo._();
  @$core.override
  CPHandsInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CPHandsInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CPHandsInfo>(create);
  static CPHandsInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get currentTitle => $_getSZ(0);
  @$pb.TagNumber(1)
  set currentTitle($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCurrentTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid1 => $_getI64(1);
  @$pb.TagNumber(2)
  set uid1($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid1() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid1() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get uid2 => $_getI64(2);
  @$pb.TagNumber(3)
  set uid2($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUid2() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid2() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalProgress => $_getI64(3);
  @$pb.TagNumber(4)
  set totalProgress($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalProgress() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalProgress() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get currentProgress => $_getI64(4);
  @$pb.TagNumber(5)
  set currentProgress($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCurrentProgress() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentProgress() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get progressDesc => $_getSZ(5);
  @$pb.TagNumber(6)
  set progressDesc($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasProgressDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearProgressDesc() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<CPProgressItem> get progressItems => $_getList(6);
}

class CPHandsHeartChangeInfo extends $pb.GeneratedMessage {
  factory CPHandsHeartChangeInfo({
    $fixnum.Int64? currentProgress,
    $core.String? progressDesc,
    $core.String? currentTitle,
  }) {
    final result = create();
    if (currentProgress != null) result.currentProgress = currentProgress;
    if (progressDesc != null) result.progressDesc = progressDesc;
    if (currentTitle != null) result.currentTitle = currentTitle;
    return result;
  }

  CPHandsHeartChangeInfo._();

  factory CPHandsHeartChangeInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CPHandsHeartChangeInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CPHandsHeartChangeInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'currentProgress')
    ..aOS(2, _omitFieldNames ? '' : 'progressDesc')
    ..aOS(3, _omitFieldNames ? '' : 'currentTitle')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPHandsHeartChangeInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPHandsHeartChangeInfo copyWith(
          void Function(CPHandsHeartChangeInfo) updates) =>
      super.copyWith((message) => updates(message as CPHandsHeartChangeInfo))
          as CPHandsHeartChangeInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CPHandsHeartChangeInfo create() => CPHandsHeartChangeInfo._();
  @$core.override
  CPHandsHeartChangeInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CPHandsHeartChangeInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CPHandsHeartChangeInfo>(create);
  static CPHandsHeartChangeInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get currentProgress => $_getI64(0);
  @$pb.TagNumber(1)
  set currentProgress($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCurrentProgress() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentProgress() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get progressDesc => $_getSZ(1);
  @$pb.TagNumber(2)
  set progressDesc($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProgressDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearProgressDesc() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get currentTitle => $_getSZ(2);
  @$pb.TagNumber(3)
  set currentTitle($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCurrentTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentTitle() => $_clearField(3);
}

class CPEndInfo extends $pb.GeneratedMessage {
  factory CPEndInfo({
    $core.String? icon1,
    $core.String? icon2,
    $core.String? name1,
    $core.String? name2,
    $core.String? url,
    $core.String? desc,
  }) {
    final result = create();
    if (icon1 != null) result.icon1 = icon1;
    if (icon2 != null) result.icon2 = icon2;
    if (name1 != null) result.name1 = name1;
    if (name2 != null) result.name2 = name2;
    if (url != null) result.url = url;
    if (desc != null) result.desc = desc;
    return result;
  }

  CPEndInfo._();

  factory CPEndInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CPEndInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CPEndInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'icon1')
    ..aOS(2, _omitFieldNames ? '' : 'icon2')
    ..aOS(3, _omitFieldNames ? '' : 'name1')
    ..aOS(4, _omitFieldNames ? '' : 'name2')
    ..aOS(5, _omitFieldNames ? '' : 'url')
    ..aOS(6, _omitFieldNames ? '' : 'desc')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPEndInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPEndInfo copyWith(void Function(CPEndInfo) updates) =>
      super.copyWith((message) => updates(message as CPEndInfo)) as CPEndInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CPEndInfo create() => CPEndInfo._();
  @$core.override
  CPEndInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CPEndInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CPEndInfo>(create);
  static CPEndInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon1 => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon1($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIcon1() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon1() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon2 => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon2($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon2() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon2() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name1 => $_getSZ(2);
  @$pb.TagNumber(3)
  set name1($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName1() => $_has(2);
  @$pb.TagNumber(3)
  void clearName1() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get name2 => $_getSZ(3);
  @$pb.TagNumber(4)
  set name2($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasName2() => $_has(3);
  @$pb.TagNumber(4)
  void clearName2() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get url => $_getSZ(4);
  @$pb.TagNumber(5)
  set url($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearUrl() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => $_clearField(6);
}

/// cp心动榜信息
class CpRoomHeartRankReq extends $pb.GeneratedMessage {
  factory CpRoomHeartRankReq() => create();

  CpRoomHeartRankReq._();

  factory CpRoomHeartRankReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CpRoomHeartRankReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CpRoomHeartRankReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpRoomHeartRankReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpRoomHeartRankReq copyWith(void Function(CpRoomHeartRankReq) updates) =>
      super.copyWith((message) => updates(message as CpRoomHeartRankReq))
          as CpRoomHeartRankReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CpRoomHeartRankReq create() => CpRoomHeartRankReq._();
  @$core.override
  CpRoomHeartRankReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CpRoomHeartRankReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CpRoomHeartRankReq>(create);
  static CpRoomHeartRankReq? _defaultInstance;
}

class CpRoomHeartRankResp extends $pb.GeneratedMessage {
  factory CpRoomHeartRankResp({
    $core.Iterable<CPHeartRankItem>? rankList,
  }) {
    final result = create();
    if (rankList != null) result.rankList.addAll(rankList);
    return result;
  }

  CpRoomHeartRankResp._();

  factory CpRoomHeartRankResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CpRoomHeartRankResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CpRoomHeartRankResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..pPM<CPHeartRankItem>(1, _omitFieldNames ? '' : 'rankList',
        subBuilder: CPHeartRankItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpRoomHeartRankResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpRoomHeartRankResp copyWith(void Function(CpRoomHeartRankResp) updates) =>
      super.copyWith((message) => updates(message as CpRoomHeartRankResp))
          as CpRoomHeartRankResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CpRoomHeartRankResp create() => CpRoomHeartRankResp._();
  @$core.override
  CpRoomHeartRankResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CpRoomHeartRankResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CpRoomHeartRankResp>(create);
  static CpRoomHeartRankResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CPHeartRankItem> get rankList => $_getList(0);
}

class CpRoomOtherHeartReq extends $pb.GeneratedMessage {
  factory CpRoomOtherHeartReq({
    $fixnum.Int64? roomId,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  CpRoomOtherHeartReq._();

  factory CpRoomOtherHeartReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CpRoomOtherHeartReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CpRoomOtherHeartReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpRoomOtherHeartReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpRoomOtherHeartReq copyWith(void Function(CpRoomOtherHeartReq) updates) =>
      super.copyWith((message) => updates(message as CpRoomOtherHeartReq))
          as CpRoomOtherHeartReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CpRoomOtherHeartReq create() => CpRoomOtherHeartReq._();
  @$core.override
  CpRoomOtherHeartReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CpRoomOtherHeartReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CpRoomOtherHeartReq>(create);
  static CpRoomOtherHeartReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);
}

class CpRoomOtherHeartResp extends $pb.GeneratedMessage {
  factory CpRoomOtherHeartResp({
    $core.Iterable<OtherHeartItem>? heartList,
  }) {
    final result = create();
    if (heartList != null) result.heartList.addAll(heartList);
    return result;
  }

  CpRoomOtherHeartResp._();

  factory CpRoomOtherHeartResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CpRoomOtherHeartResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CpRoomOtherHeartResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..pPM<OtherHeartItem>(1, _omitFieldNames ? '' : 'heartList',
        protoName: 'heartList', subBuilder: OtherHeartItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpRoomOtherHeartResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpRoomOtherHeartResp copyWith(void Function(CpRoomOtherHeartResp) updates) =>
      super.copyWith((message) => updates(message as CpRoomOtherHeartResp))
          as CpRoomOtherHeartResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CpRoomOtherHeartResp create() => CpRoomOtherHeartResp._();
  @$core.override
  CpRoomOtherHeartResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CpRoomOtherHeartResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CpRoomOtherHeartResp>(create);
  static CpRoomOtherHeartResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<OtherHeartItem> get heartList => $_getList(0);
}

class OtherHeartItem extends $pb.GeneratedMessage {
  factory OtherHeartItem({
    $fixnum.Int64? uid,
    $fixnum.Int64? heart,
    $core.String? avatar,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (heart != null) result.heart = heart;
    if (avatar != null) result.avatar = avatar;
    return result;
  }

  OtherHeartItem._();

  factory OtherHeartItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OtherHeartItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OtherHeartItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aInt64(2, _omitFieldNames ? '' : 'heart')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OtherHeartItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OtherHeartItem copyWith(void Function(OtherHeartItem) updates) =>
      super.copyWith((message) => updates(message as OtherHeartItem))
          as OtherHeartItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OtherHeartItem create() => OtherHeartItem._();
  @$core.override
  OtherHeartItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OtherHeartItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OtherHeartItem>(create);
  static OtherHeartItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get heart => $_getI64(1);
  @$pb.TagNumber(2)
  set heart($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHeart() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeart() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);
}

class CPHeartRankItem extends $pb.GeneratedMessage {
  factory CPHeartRankItem({
    $core.int? rank,
    RankUser? from,
    RankUser? to,
    $fixnum.Int64? heart,
  }) {
    final result = create();
    if (rank != null) result.rank = rank;
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (heart != null) result.heart = heart;
    return result;
  }

  CPHeartRankItem._();

  factory CPHeartRankItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CPHeartRankItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CPHeartRankItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'rank')
    ..aOM<RankUser>(2, _omitFieldNames ? '' : 'from',
        subBuilder: RankUser.create)
    ..aOM<RankUser>(3, _omitFieldNames ? '' : 'to', subBuilder: RankUser.create)
    ..aInt64(4, _omitFieldNames ? '' : 'heart')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPHeartRankItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CPHeartRankItem copyWith(void Function(CPHeartRankItem) updates) =>
      super.copyWith((message) => updates(message as CPHeartRankItem))
          as CPHeartRankItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CPHeartRankItem create() => CPHeartRankItem._();
  @$core.override
  CPHeartRankItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CPHeartRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CPHeartRankItem>(create);
  static CPHeartRankItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rank => $_getIZ(0);
  @$pb.TagNumber(1)
  set rank($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearRank() => $_clearField(1);

  @$pb.TagNumber(2)
  RankUser get from => $_getN(1);
  @$pb.TagNumber(2)
  set from(RankUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => $_clearField(2);
  @$pb.TagNumber(2)
  RankUser ensureFrom() => $_ensure(1);

  @$pb.TagNumber(3)
  RankUser get to => $_getN(2);
  @$pb.TagNumber(3)
  set to(RankUser value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => $_clearField(3);
  @$pb.TagNumber(3)
  RankUser ensureTo() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get heart => $_getI64(3);
  @$pb.TagNumber(4)
  set heart($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHeart() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeart() => $_clearField(4);
}

class RankUser extends $pb.GeneratedMessage {
  factory RankUser({
    $fixnum.Int64? id,
    $core.String? gender,
    $core.String? nickname,
    $core.String? avatar,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (gender != null) result.gender = gender;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    return result;
  }

  RankUser._();

  factory RankUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RankUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RankUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'gender')
    ..aOS(3, _omitFieldNames ? '' : 'nickname')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RankUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RankUser copyWith(void Function(RankUser) updates) =>
      super.copyWith((message) => updates(message as RankUser)) as RankUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RankUser create() => RankUser._();
  @$core.override
  RankUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RankUser getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RankUser>(create);
  static RankUser? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get gender => $_getSZ(1);
  @$pb.TagNumber(2)
  set gender($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGender() => $_has(1);
  @$pb.TagNumber(2)
  void clearGender() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickname($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickname() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatar($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatar() => $_clearField(4);
}

/// CP配对变更
class CpPairChange extends $pb.GeneratedMessage {
  factory CpPairChange({
    $core.String? fromNickName,
    $core.String? toNickName,
    $core.int? type,
    $core.String? desc,
    $core.String? avatar,
  }) {
    final result = create();
    if (fromNickName != null) result.fromNickName = fromNickName;
    if (toNickName != null) result.toNickName = toNickName;
    if (type != null) result.type = type;
    if (desc != null) result.desc = desc;
    if (avatar != null) result.avatar = avatar;
    return result;
  }

  CpPairChange._();

  factory CpPairChange.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CpPairChange.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CpPairChange',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_cp'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fromNickName', protoName: 'fromNickName')
    ..aOS(2, _omitFieldNames ? '' : 'toNickName', protoName: 'toNickName')
    ..aI(3, _omitFieldNames ? '' : 'type')
    ..aOS(4, _omitFieldNames ? '' : 'desc')
    ..aOS(5, _omitFieldNames ? '' : 'avatar')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpPairChange clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CpPairChange copyWith(void Function(CpPairChange) updates) =>
      super.copyWith((message) => updates(message as CpPairChange))
          as CpPairChange;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CpPairChange create() => CpPairChange._();
  @$core.override
  CpPairChange createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CpPairChange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CpPairChange>(create);
  static CpPairChange? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fromNickName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromNickName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFromNickName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromNickName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get toNickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set toNickName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearToNickName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get type => $_getIZ(2);
  @$pb.TagNumber(3)
  set type($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get avatar => $_getSZ(4);
  @$pb.TagNumber(5)
  set avatar($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAvatar() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvatar() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

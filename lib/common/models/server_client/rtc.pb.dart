// This is a generated file - do not edit.
//
// Generated from server_client/rtc.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'auction.pb.dart' as $4;
import 'base.pb.dart' as $1;
import 'common/car.pb.dart' as $0;
import 'fleet/hang_out.pb.dart' as $5;
import 'room_cp.pb.dart' as $2;
import 'room_turntable.pb.dart' as $3;
import 'rtc.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'rtc.pbenum.dart';

class RoomInteractionDetailRsp extends $pb.GeneratedMessage {
  factory RoomInteractionDetailRsp({
    $fixnum.Int64? id,
    $core.String? tittle,
    $core.String? icon,
    $core.String? desc,
    $core.Iterable<PriceItem>? priceDescItems,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (tittle != null) result.tittle = tittle;
    if (icon != null) result.icon = icon;
    if (desc != null) result.desc = desc;
    if (priceDescItems != null) result.priceDescItems.addAll(priceDescItems);
    return result;
  }

  RoomInteractionDetailRsp._();

  factory RoomInteractionDetailRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomInteractionDetailRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomInteractionDetailRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'tittle')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aOS(4, _omitFieldNames ? '' : 'desc')
    ..pPM<PriceItem>(5, _omitFieldNames ? '' : 'priceDescItems',
        subBuilder: PriceItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomInteractionDetailRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomInteractionDetailRsp copyWith(
          void Function(RoomInteractionDetailRsp) updates) =>
      super.copyWith((message) => updates(message as RoomInteractionDetailRsp))
          as RoomInteractionDetailRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomInteractionDetailRsp create() => RoomInteractionDetailRsp._();
  @$core.override
  RoomInteractionDetailRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomInteractionDetailRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInteractionDetailRsp>(create);
  static RoomInteractionDetailRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tittle => $_getSZ(1);
  @$pb.TagNumber(2)
  set tittle($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTittle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTittle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<PriceItem> get priceDescItems => $_getList(4);
}

class RoomInteractionListRsp extends $pb.GeneratedMessage {
  factory RoomInteractionListRsp({
    $core.Iterable<InteractionItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  RoomInteractionListRsp._();

  factory RoomInteractionListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomInteractionListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomInteractionListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pPM<InteractionItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: InteractionItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomInteractionListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomInteractionListRsp copyWith(
          void Function(RoomInteractionListRsp) updates) =>
      super.copyWith((message) => updates(message as RoomInteractionListRsp))
          as RoomInteractionListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomInteractionListRsp create() => RoomInteractionListRsp._();
  @$core.override
  RoomInteractionListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomInteractionListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInteractionListRsp>(create);
  static RoomInteractionListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<InteractionItem> get items => $_getList(0);
}

class InteractionItem extends $pb.GeneratedMessage {
  factory InteractionItem({
    $fixnum.Int64? id,
    $core.String? tittle,
    $core.String? icon,
    $core.String? desc,
    PriceItem? priceDesc,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (tittle != null) result.tittle = tittle;
    if (icon != null) result.icon = icon;
    if (desc != null) result.desc = desc;
    if (priceDesc != null) result.priceDesc = priceDesc;
    return result;
  }

  InteractionItem._();

  factory InteractionItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InteractionItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InteractionItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'tittle')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aOS(4, _omitFieldNames ? '' : 'desc')
    ..aOM<PriceItem>(5, _omitFieldNames ? '' : 'priceDesc',
        subBuilder: PriceItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InteractionItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InteractionItem copyWith(void Function(InteractionItem) updates) =>
      super.copyWith((message) => updates(message as InteractionItem))
          as InteractionItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InteractionItem create() => InteractionItem._();
  @$core.override
  InteractionItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InteractionItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InteractionItem>(create);
  static InteractionItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tittle => $_getSZ(1);
  @$pb.TagNumber(2)
  set tittle($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTittle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTittle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => $_clearField(4);

  @$pb.TagNumber(5)
  PriceItem get priceDesc => $_getN(4);
  @$pb.TagNumber(5)
  set priceDesc(PriceItem value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPriceDesc() => $_has(4);
  @$pb.TagNumber(5)
  void clearPriceDesc() => $_clearField(5);
  @$pb.TagNumber(5)
  PriceItem ensurePriceDesc() => $_ensure(4);
}

class PriceItem extends $pb.GeneratedMessage {
  factory PriceItem({
    $core.String? prefix,
    $core.int? price,
    $core.String? suffix,
  }) {
    final result = create();
    if (prefix != null) result.prefix = prefix;
    if (price != null) result.price = price;
    if (suffix != null) result.suffix = suffix;
    return result;
  }

  PriceItem._();

  factory PriceItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PriceItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PriceItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'prefix')
    ..aI(2, _omitFieldNames ? '' : 'price', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'suffix')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PriceItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PriceItem copyWith(void Function(PriceItem) updates) =>
      super.copyWith((message) => updates(message as PriceItem)) as PriceItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PriceItem create() => PriceItem._();
  @$core.override
  PriceItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PriceItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PriceItem>(create);
  static PriceItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get prefix => $_getSZ(0);
  @$pb.TagNumber(1)
  set prefix($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPrefix() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrefix() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get price => $_getIZ(1);
  @$pb.TagNumber(2)
  set price($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get suffix => $_getSZ(2);
  @$pb.TagNumber(3)
  set suffix($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSuffix() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuffix() => $_clearField(3);
}

class RoomInteractionTabRsp extends $pb.GeneratedMessage {
  factory RoomInteractionTabRsp({
    $core.Iterable<InteractionTab>? tabs,
  }) {
    final result = create();
    if (tabs != null) result.tabs.addAll(tabs);
    return result;
  }

  RoomInteractionTabRsp._();

  factory RoomInteractionTabRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomInteractionTabRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomInteractionTabRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pPM<InteractionTab>(1, _omitFieldNames ? '' : 'tabs',
        subBuilder: InteractionTab.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomInteractionTabRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomInteractionTabRsp copyWith(
          void Function(RoomInteractionTabRsp) updates) =>
      super.copyWith((message) => updates(message as RoomInteractionTabRsp))
          as RoomInteractionTabRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomInteractionTabRsp create() => RoomInteractionTabRsp._();
  @$core.override
  RoomInteractionTabRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomInteractionTabRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomInteractionTabRsp>(create);
  static RoomInteractionTabRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<InteractionTab> get tabs => $_getList(0);
}

class InteractionTab extends $pb.GeneratedMessage {
  factory InteractionTab({
    $fixnum.Int64? id,
    $core.String? name,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    return result;
  }

  InteractionTab._();

  factory InteractionTab.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InteractionTab.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InteractionTab',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InteractionTab clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InteractionTab copyWith(void Function(InteractionTab) updates) =>
      super.copyWith((message) => updates(message as InteractionTab))
          as InteractionTab;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InteractionTab create() => InteractionTab._();
  @$core.override
  InteractionTab createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InteractionTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InteractionTab>(create);
  static InteractionTab? _defaultInstance;

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
}

class RoomsByLabelData extends $pb.GeneratedMessage {
  factory RoomsByLabelData({
    $core.Iterable<Channel>? room,
    $core.String? snapshotId,
    $fixnum.Int64? offset,
    $core.bool? hasMore,
  }) {
    final result = create();
    if (room != null) result.room.addAll(room);
    if (snapshotId != null) result.snapshotId = snapshotId;
    if (offset != null) result.offset = offset;
    if (hasMore != null) result.hasMore = hasMore;
    return result;
  }

  RoomsByLabelData._();

  factory RoomsByLabelData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomsByLabelData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomsByLabelData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pPM<Channel>(1, _omitFieldNames ? '' : 'room', subBuilder: Channel.create)
    ..aOS(2, _omitFieldNames ? '' : 'snapshotId')
    ..aInt64(3, _omitFieldNames ? '' : 'offset')
    ..aOB(4, _omitFieldNames ? '' : 'hasMore')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomsByLabelData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomsByLabelData copyWith(void Function(RoomsByLabelData) updates) =>
      super.copyWith((message) => updates(message as RoomsByLabelData))
          as RoomsByLabelData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomsByLabelData create() => RoomsByLabelData._();
  @$core.override
  RoomsByLabelData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomsByLabelData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomsByLabelData>(create);
  static RoomsByLabelData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Channel> get room => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get snapshotId => $_getSZ(1);
  @$pb.TagNumber(2)
  set snapshotId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSnapshotId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSnapshotId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get offset => $_getI64(2);
  @$pb.TagNumber(3)
  set offset($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get hasMore => $_getBF(3);
  @$pb.TagNumber(4)
  set hasMore($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHasMore() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasMore() => $_clearField(4);
}

class CheckActiveRoomsData extends $pb.GeneratedMessage {
  factory CheckActiveRoomsData({
    $core.bool? result,
  }) {
    final result$ = create();
    if (result != null) result$.result = result;
    return result$;
  }

  CheckActiveRoomsData._();

  factory CheckActiveRoomsData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckActiveRoomsData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckActiveRoomsData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'result')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckActiveRoomsData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckActiveRoomsData copyWith(void Function(CheckActiveRoomsData) updates) =>
      super.copyWith((message) => updates(message as CheckActiveRoomsData))
          as CheckActiveRoomsData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckActiveRoomsData create() => CheckActiveRoomsData._();
  @$core.override
  CheckActiveRoomsData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckActiveRoomsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckActiveRoomsData>(create);
  static CheckActiveRoomsData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => $_clearField(1);
}

class SubscribeProgramReq extends $pb.GeneratedMessage {
  factory SubscribeProgramReq({
    $fixnum.Int64? programId,
  }) {
    final result = create();
    if (programId != null) result.programId = programId;
    return result;
  }

  SubscribeProgramReq._();

  factory SubscribeProgramReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubscribeProgramReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubscribeProgramReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'programId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscribeProgramReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscribeProgramReq copyWith(void Function(SubscribeProgramReq) updates) =>
      super.copyWith((message) => updates(message as SubscribeProgramReq))
          as SubscribeProgramReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeProgramReq create() => SubscribeProgramReq._();
  @$core.override
  SubscribeProgramReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubscribeProgramReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscribeProgramReq>(create);
  static SubscribeProgramReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get programId => $_getI64(0);
  @$pb.TagNumber(1)
  set programId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProgramId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProgramId() => $_clearField(1);
}

class CancelProgramReq extends $pb.GeneratedMessage {
  factory CancelProgramReq({
    $fixnum.Int64? programId,
  }) {
    final result = create();
    if (programId != null) result.programId = programId;
    return result;
  }

  CancelProgramReq._();

  factory CancelProgramReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelProgramReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelProgramReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'programId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelProgramReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelProgramReq copyWith(void Function(CancelProgramReq) updates) =>
      super.copyWith((message) => updates(message as CancelProgramReq))
          as CancelProgramReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelProgramReq create() => CancelProgramReq._();
  @$core.override
  CancelProgramReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CancelProgramReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelProgramReq>(create);
  static CancelProgramReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get programId => $_getI64(0);
  @$pb.TagNumber(1)
  set programId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProgramId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProgramId() => $_clearField(1);
}

class RenewProgramReq extends $pb.GeneratedMessage {
  factory RenewProgramReq({
    $fixnum.Int64? programId,
  }) {
    final result = create();
    if (programId != null) result.programId = programId;
    return result;
  }

  RenewProgramReq._();

  factory RenewProgramReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RenewProgramReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RenewProgramReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'programId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewProgramReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RenewProgramReq copyWith(void Function(RenewProgramReq) updates) =>
      super.copyWith((message) => updates(message as RenewProgramReq))
          as RenewProgramReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RenewProgramReq create() => RenewProgramReq._();
  @$core.override
  RenewProgramReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RenewProgramReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RenewProgramReq>(create);
  static RenewProgramReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get programId => $_getI64(0);
  @$pb.TagNumber(1)
  set programId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProgramId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProgramId() => $_clearField(1);
}

class StartProgramReq extends $pb.GeneratedMessage {
  factory StartProgramReq({
    $fixnum.Int64? programId,
  }) {
    final result = create();
    if (programId != null) result.programId = programId;
    return result;
  }

  StartProgramReq._();

  factory StartProgramReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartProgramReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartProgramReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'programId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartProgramReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartProgramReq copyWith(void Function(StartProgramReq) updates) =>
      super.copyWith((message) => updates(message as StartProgramReq))
          as StartProgramReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartProgramReq create() => StartProgramReq._();
  @$core.override
  StartProgramReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartProgramReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartProgramReq>(create);
  static StartProgramReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get programId => $_getI64(0);
  @$pb.TagNumber(1)
  set programId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProgramId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProgramId() => $_clearField(1);
}

class EndProgramReq extends $pb.GeneratedMessage {
  factory EndProgramReq({
    $fixnum.Int64? programId,
  }) {
    final result = create();
    if (programId != null) result.programId = programId;
    return result;
  }

  EndProgramReq._();

  factory EndProgramReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EndProgramReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EndProgramReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'programId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndProgramReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndProgramReq copyWith(void Function(EndProgramReq) updates) =>
      super.copyWith((message) => updates(message as EndProgramReq))
          as EndProgramReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndProgramReq create() => EndProgramReq._();
  @$core.override
  EndProgramReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EndProgramReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EndProgramReq>(create);
  static EndProgramReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get programId => $_getI64(0);
  @$pb.TagNumber(1)
  set programId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProgramId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProgramId() => $_clearField(1);
}

class ChannelProgramsData extends $pb.GeneratedMessage {
  factory ChannelProgramsData({
    $core.Iterable<ChannelProgramItem>? programItem,
    $core.int? minSubscribeNumber,
  }) {
    final result = create();
    if (programItem != null) result.programItem.addAll(programItem);
    if (minSubscribeNumber != null)
      result.minSubscribeNumber = minSubscribeNumber;
    return result;
  }

  ChannelProgramsData._();

  factory ChannelProgramsData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelProgramsData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelProgramsData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pPM<ChannelProgramItem>(1, _omitFieldNames ? '' : 'programItem',
        subBuilder: ChannelProgramItem.create)
    ..aI(2, _omitFieldNames ? '' : 'minSubscribeNumber',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelProgramsData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelProgramsData copyWith(void Function(ChannelProgramsData) updates) =>
      super.copyWith((message) => updates(message as ChannelProgramsData))
          as ChannelProgramsData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelProgramsData create() => ChannelProgramsData._();
  @$core.override
  ChannelProgramsData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelProgramsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelProgramsData>(create);
  static ChannelProgramsData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ChannelProgramItem> get programItem => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get minSubscribeNumber => $_getIZ(1);
  @$pb.TagNumber(2)
  set minSubscribeNumber($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMinSubscribeNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinSubscribeNumber() => $_clearField(2);
}

class ChannelProgramItem extends $pb.GeneratedMessage {
  factory ChannelProgramItem({
    $core.String? startTime,
    $core.int? startTimeSeconds,
    $core.String? topic,
    $fixnum.Int64? programId,
    ProgramStatus? status,
    $core.int? subscribeNumber,
    $core.String? desc,
    $core.String? date,
    $fixnum.Int64? dateStamp,
    $core.bool? subscribed,
  }) {
    final result = create();
    if (startTime != null) result.startTime = startTime;
    if (startTimeSeconds != null) result.startTimeSeconds = startTimeSeconds;
    if (topic != null) result.topic = topic;
    if (programId != null) result.programId = programId;
    if (status != null) result.status = status;
    if (subscribeNumber != null) result.subscribeNumber = subscribeNumber;
    if (desc != null) result.desc = desc;
    if (date != null) result.date = date;
    if (dateStamp != null) result.dateStamp = dateStamp;
    if (subscribed != null) result.subscribed = subscribed;
    return result;
  }

  ChannelProgramItem._();

  factory ChannelProgramItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelProgramItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelProgramItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'startTime')
    ..aI(2, _omitFieldNames ? '' : 'startTimeSeconds',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'topic')
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'programId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<ProgramStatus>(5, _omitFieldNames ? '' : 'status',
        enumValues: ProgramStatus.values)
    ..aI(7, _omitFieldNames ? '' : 'subscribeNumber',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(8, _omitFieldNames ? '' : 'desc')
    ..aOS(9, _omitFieldNames ? '' : 'date')
    ..a<$fixnum.Int64>(
        10, _omitFieldNames ? '' : 'dateStamp', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(11, _omitFieldNames ? '' : 'subscribed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelProgramItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelProgramItem copyWith(void Function(ChannelProgramItem) updates) =>
      super.copyWith((message) => updates(message as ChannelProgramItem))
          as ChannelProgramItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelProgramItem create() => ChannelProgramItem._();
  @$core.override
  ChannelProgramItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelProgramItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelProgramItem>(create);
  static ChannelProgramItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get startTime => $_getSZ(0);
  @$pb.TagNumber(1)
  set startTime($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStartTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartTime() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get startTimeSeconds => $_getIZ(1);
  @$pb.TagNumber(2)
  set startTimeSeconds($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartTimeSeconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTimeSeconds() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get topic => $_getSZ(2);
  @$pb.TagNumber(3)
  set topic($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTopic() => $_has(2);
  @$pb.TagNumber(3)
  void clearTopic() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get programId => $_getI64(3);
  @$pb.TagNumber(4)
  set programId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasProgramId() => $_has(3);
  @$pb.TagNumber(4)
  void clearProgramId() => $_clearField(4);

  @$pb.TagNumber(5)
  ProgramStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(ProgramStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  /// uint32 min_subscribe_number = 6; // 最小预约人数
  @$pb.TagNumber(7)
  $core.int get subscribeNumber => $_getIZ(5);
  @$pb.TagNumber(7)
  set subscribeNumber($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(7)
  $core.bool hasSubscribeNumber() => $_has(5);
  @$pb.TagNumber(7)
  void clearSubscribeNumber() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get desc => $_getSZ(6);
  @$pb.TagNumber(8)
  set desc($core.String value) => $_setString(6, value);
  @$pb.TagNumber(8)
  $core.bool hasDesc() => $_has(6);
  @$pb.TagNumber(8)
  void clearDesc() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get date => $_getSZ(7);
  @$pb.TagNumber(9)
  set date($core.String value) => $_setString(7, value);
  @$pb.TagNumber(9)
  $core.bool hasDate() => $_has(7);
  @$pb.TagNumber(9)
  void clearDate() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get dateStamp => $_getI64(8);
  @$pb.TagNumber(10)
  set dateStamp($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(10)
  $core.bool hasDateStamp() => $_has(8);
  @$pb.TagNumber(10)
  void clearDateStamp() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get subscribed => $_getBF(9);
  @$pb.TagNumber(11)
  set subscribed($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(11)
  $core.bool hasSubscribed() => $_has(9);
  @$pb.TagNumber(11)
  void clearSubscribed() => $_clearField(11);
}

class MicContributionRankData extends $pb.GeneratedMessage {
  factory MicContributionRankData({
    SimpleChannelUser? micUser,
    $core.Iterable<SimpleChannelUser>? rankItem,
  }) {
    final result = create();
    if (micUser != null) result.micUser = micUser;
    if (rankItem != null) result.rankItem.addAll(rankItem);
    return result;
  }

  MicContributionRankData._();

  factory MicContributionRankData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MicContributionRankData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MicContributionRankData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOM<SimpleChannelUser>(1, _omitFieldNames ? '' : 'micUser',
        subBuilder: SimpleChannelUser.create)
    ..pPM<SimpleChannelUser>(2, _omitFieldNames ? '' : 'rankItem',
        protoName: 'rankItem', subBuilder: SimpleChannelUser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicContributionRankData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicContributionRankData copyWith(
          void Function(MicContributionRankData) updates) =>
      super.copyWith((message) => updates(message as MicContributionRankData))
          as MicContributionRankData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MicContributionRankData create() => MicContributionRankData._();
  @$core.override
  MicContributionRankData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MicContributionRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MicContributionRankData>(create);
  static MicContributionRankData? _defaultInstance;

  @$pb.TagNumber(1)
  SimpleChannelUser get micUser => $_getN(0);
  @$pb.TagNumber(1)
  set micUser(SimpleChannelUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMicUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearMicUser() => $_clearField(1);
  @$pb.TagNumber(1)
  SimpleChannelUser ensureMicUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<SimpleChannelUser> get rankItem => $_getList(1);
}

class SetMicResourceReq extends $pb.GeneratedMessage {
  factory SetMicResourceReq({
    $fixnum.Int64? channelId,
    $core.Iterable<MicSettingItem>? settingItem,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    if (settingItem != null) result.settingItem.addAll(settingItem);
    return result;
  }

  SetMicResourceReq._();

  factory SetMicResourceReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetMicResourceReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetMicResourceReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<MicSettingItem>(2, _omitFieldNames ? '' : 'settingItem',
        subBuilder: MicSettingItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetMicResourceReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetMicResourceReq copyWith(void Function(SetMicResourceReq) updates) =>
      super.copyWith((message) => updates(message as SetMicResourceReq))
          as SetMicResourceReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetMicResourceReq create() => SetMicResourceReq._();
  @$core.override
  SetMicResourceReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetMicResourceReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetMicResourceReq>(create);
  static SetMicResourceReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(1)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<MicSettingItem> get settingItem => $_getList(1);
}

class MicSettingItem extends $pb.GeneratedMessage {
  factory MicSettingItem({
    $core.int? position,
    $fixnum.Int64? resourceId,
  }) {
    final result = create();
    if (position != null) result.position = position;
    if (resourceId != null) result.resourceId = resourceId;
    return result;
  }

  MicSettingItem._();

  factory MicSettingItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MicSettingItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MicSettingItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'position', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'resourceId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicSettingItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicSettingItem copyWith(void Function(MicSettingItem) updates) =>
      super.copyWith((message) => updates(message as MicSettingItem))
          as MicSettingItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MicSettingItem create() => MicSettingItem._();
  @$core.override
  MicSettingItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MicSettingItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MicSettingItem>(create);
  static MicSettingItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get resourceId => $_getI64(1);
  @$pb.TagNumber(2)
  set resourceId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasResourceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearResourceId() => $_clearField(2);
}

class MicResourceConfigData extends $pb.GeneratedMessage {
  factory MicResourceConfigData({
    $core.Iterable<MicResourceConfigItem>? configItem,
  }) {
    final result = create();
    if (configItem != null) result.configItem.addAll(configItem);
    return result;
  }

  MicResourceConfigData._();

  factory MicResourceConfigData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MicResourceConfigData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MicResourceConfigData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pPM<MicResourceConfigItem>(1, _omitFieldNames ? '' : 'configItem',
        subBuilder: MicResourceConfigItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicResourceConfigData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicResourceConfigData copyWith(
          void Function(MicResourceConfigData) updates) =>
      super.copyWith((message) => updates(message as MicResourceConfigData))
          as MicResourceConfigData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MicResourceConfigData create() => MicResourceConfigData._();
  @$core.override
  MicResourceConfigData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MicResourceConfigData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MicResourceConfigData>(create);
  static MicResourceConfigData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MicResourceConfigItem> get configItem => $_getList(0);
}

class MicResourceConfigItem extends $pb.GeneratedMessage {
  factory MicResourceConfigItem({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? url,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (url != null) result.url = url;
    return result;
  }

  MicResourceConfigItem._();

  factory MicResourceConfigItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MicResourceConfigItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MicResourceConfigItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicResourceConfigItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicResourceConfigItem copyWith(
          void Function(MicResourceConfigItem) updates) =>
      super.copyWith((message) => updates(message as MicResourceConfigItem))
          as MicResourceConfigItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MicResourceConfigItem create() => MicResourceConfigItem._();
  @$core.override
  MicResourceConfigItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MicResourceConfigItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MicResourceConfigItem>(create);
  static MicResourceConfigItem? _defaultInstance;

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
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => $_clearField(3);
}

class SimpleChannelUser extends $pb.GeneratedMessage {
  factory SimpleChannelUser({
    $fixnum.Int64? id,
    $core.String? nickname,
    $core.String? avatar,
    RtcUserRole? role,
    $core.String? birthday,
    $core.String? gender,
    $fixnum.Int64? gsGroupId,
    $core.bool? isForceTurnOffMicrophone,
    $0.UserCar? car,
    $core.int? vipLevel,
    $core.int? contributionValue,
    $core.String? emUsername,
    $core.int? rank,
    $core.Iterable<$core.String>? icons,
    $core.int? age,
    $core.int? days,
    $core.bool? scheduleIng,
    $core.String? personalSignature,
    $1.RelationType? relationType,
    $core.int? voiceDuration,
    $core.String? voice,
    $0.CarMetaInfo? tmpCarMetaInfo,
    $1.Job? job,
    $1.UserVipLevelIcons? vipIcons,
    $core.bool? isShowNumCard,
    $core.String? avatarFrame,
    $core.String? micEffect,
    $core.int? offline,
    $core.String? knightIcon,
    $core.int? secretUser,
    $core.String? knightInfoCard,
    $core.bool? robot,
    $core.String? luckyBuffEffect,
    $core.Iterable<$core.String>? tags,
    $core.int? heartLinkCardStatus,
    $core.bool? kickOutPermission,
    $core.bool? showQuiz,
    $core.Iterable<$core.String>? nicknameColor,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    if (role != null) result.role = role;
    if (birthday != null) result.birthday = birthday;
    if (gender != null) result.gender = gender;
    if (gsGroupId != null) result.gsGroupId = gsGroupId;
    if (isForceTurnOffMicrophone != null)
      result.isForceTurnOffMicrophone = isForceTurnOffMicrophone;
    if (car != null) result.car = car;
    if (vipLevel != null) result.vipLevel = vipLevel;
    if (contributionValue != null) result.contributionValue = contributionValue;
    if (emUsername != null) result.emUsername = emUsername;
    if (rank != null) result.rank = rank;
    if (icons != null) result.icons.addAll(icons);
    if (age != null) result.age = age;
    if (days != null) result.days = days;
    if (scheduleIng != null) result.scheduleIng = scheduleIng;
    if (personalSignature != null) result.personalSignature = personalSignature;
    if (relationType != null) result.relationType = relationType;
    if (voiceDuration != null) result.voiceDuration = voiceDuration;
    if (voice != null) result.voice = voice;
    if (tmpCarMetaInfo != null) result.tmpCarMetaInfo = tmpCarMetaInfo;
    if (job != null) result.job = job;
    if (vipIcons != null) result.vipIcons = vipIcons;
    if (isShowNumCard != null) result.isShowNumCard = isShowNumCard;
    if (avatarFrame != null) result.avatarFrame = avatarFrame;
    if (micEffect != null) result.micEffect = micEffect;
    if (offline != null) result.offline = offline;
    if (knightIcon != null) result.knightIcon = knightIcon;
    if (secretUser != null) result.secretUser = secretUser;
    if (knightInfoCard != null) result.knightInfoCard = knightInfoCard;
    if (robot != null) result.robot = robot;
    if (luckyBuffEffect != null) result.luckyBuffEffect = luckyBuffEffect;
    if (tags != null) result.tags.addAll(tags);
    if (heartLinkCardStatus != null)
      result.heartLinkCardStatus = heartLinkCardStatus;
    if (kickOutPermission != null) result.kickOutPermission = kickOutPermission;
    if (showQuiz != null) result.showQuiz = showQuiz;
    if (nicknameColor != null) result.nicknameColor.addAll(nicknameColor);
    return result;
  }

  SimpleChannelUser._();

  factory SimpleChannelUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SimpleChannelUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SimpleChannelUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aE<RtcUserRole>(4, _omitFieldNames ? '' : 'role',
        enumValues: RtcUserRole.values)
    ..aOS(5, _omitFieldNames ? '' : 'birthday')
    ..aOS(6, _omitFieldNames ? '' : 'gender')
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'gsGroupId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(8, _omitFieldNames ? '' : 'isForceTurnOffMicrophone')
    ..aOM<$0.UserCar>(9, _omitFieldNames ? '' : 'car',
        subBuilder: $0.UserCar.create)
    ..aI(10, _omitFieldNames ? '' : 'vipLevel')
    ..aI(11, _omitFieldNames ? '' : 'contributionValue')
    ..aOS(12, _omitFieldNames ? '' : 'emUsername')
    ..aI(13, _omitFieldNames ? '' : 'rank')
    ..pPS(15, _omitFieldNames ? '' : 'icons')
    ..aI(16, _omitFieldNames ? '' : 'age')
    ..aI(17, _omitFieldNames ? '' : 'days')
    ..aOB(18, _omitFieldNames ? '' : 'scheduleIng')
    ..aOS(19, _omitFieldNames ? '' : 'personalSignature')
    ..aE<$1.RelationType>(20, _omitFieldNames ? '' : 'relationType',
        enumValues: $1.RelationType.values)
    ..aI(21, _omitFieldNames ? '' : 'voiceDuration')
    ..aOS(22, _omitFieldNames ? '' : 'voice')
    ..aOM<$0.CarMetaInfo>(23, _omitFieldNames ? '' : 'tmpCarMetaInfo',
        protoName: 'tmpCarMetaInfo', subBuilder: $0.CarMetaInfo.create)
    ..aE<$1.Job>(24, _omitFieldNames ? '' : 'job', enumValues: $1.Job.values)
    ..aOM<$1.UserVipLevelIcons>(25, _omitFieldNames ? '' : 'vipIcons',
        subBuilder: $1.UserVipLevelIcons.create)
    ..aOB(26, _omitFieldNames ? '' : 'isShowNumCard')
    ..aOS(27, _omitFieldNames ? '' : 'avatarFrame')
    ..aOS(28, _omitFieldNames ? '' : 'micEffect')
    ..aI(29, _omitFieldNames ? '' : 'offline')
    ..aOS(30, _omitFieldNames ? '' : 'knightIcon')
    ..aI(31, _omitFieldNames ? '' : 'secretUser')
    ..aOS(32, _omitFieldNames ? '' : 'knightInfoCard')
    ..aOB(33, _omitFieldNames ? '' : 'robot')
    ..aOS(34, _omitFieldNames ? '' : 'luckyBuffEffect')
    ..pPS(35, _omitFieldNames ? '' : 'tags')
    ..aI(96, _omitFieldNames ? '' : 'heartLinkCardStatus')
    ..aOB(97, _omitFieldNames ? '' : 'kickOutPermission')
    ..aOB(98, _omitFieldNames ? '' : 'showQuiz')
    ..pPS(99, _omitFieldNames ? '' : 'nicknameColor')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleChannelUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleChannelUser copyWith(void Function(SimpleChannelUser) updates) =>
      super.copyWith((message) => updates(message as SimpleChannelUser))
          as SimpleChannelUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SimpleChannelUser create() => SimpleChannelUser._();
  @$core.override
  SimpleChannelUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SimpleChannelUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SimpleChannelUser>(create);
  static SimpleChannelUser? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);

  @$pb.TagNumber(4)
  RtcUserRole get role => $_getN(3);
  @$pb.TagNumber(4)
  set role(RtcUserRole value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get birthday => $_getSZ(4);
  @$pb.TagNumber(5)
  set birthday($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBirthday() => $_has(4);
  @$pb.TagNumber(5)
  void clearBirthday() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get gender => $_getSZ(5);
  @$pb.TagNumber(6)
  set gender($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGender() => $_has(5);
  @$pb.TagNumber(6)
  void clearGender() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get gsGroupId => $_getI64(6);
  @$pb.TagNumber(7)
  set gsGroupId($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasGsGroupId() => $_has(6);
  @$pb.TagNumber(7)
  void clearGsGroupId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isForceTurnOffMicrophone => $_getBF(7);
  @$pb.TagNumber(8)
  set isForceTurnOffMicrophone($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIsForceTurnOffMicrophone() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsForceTurnOffMicrophone() => $_clearField(8);

  @$pb.TagNumber(9)
  $0.UserCar get car => $_getN(8);
  @$pb.TagNumber(9)
  set car($0.UserCar value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasCar() => $_has(8);
  @$pb.TagNumber(9)
  void clearCar() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.UserCar ensureCar() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.int get vipLevel => $_getIZ(9);
  @$pb.TagNumber(10)
  set vipLevel($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasVipLevel() => $_has(9);
  @$pb.TagNumber(10)
  void clearVipLevel() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get contributionValue => $_getIZ(10);
  @$pb.TagNumber(11)
  set contributionValue($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasContributionValue() => $_has(10);
  @$pb.TagNumber(11)
  void clearContributionValue() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get emUsername => $_getSZ(11);
  @$pb.TagNumber(12)
  set emUsername($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasEmUsername() => $_has(11);
  @$pb.TagNumber(12)
  void clearEmUsername() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get rank => $_getIZ(12);
  @$pb.TagNumber(13)
  set rank($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasRank() => $_has(12);
  @$pb.TagNumber(13)
  void clearRank() => $_clearField(13);

  @$pb.TagNumber(15)
  $pb.PbList<$core.String> get icons => $_getList(13);

  @$pb.TagNumber(16)
  $core.int get age => $_getIZ(14);
  @$pb.TagNumber(16)
  set age($core.int value) => $_setSignedInt32(14, value);
  @$pb.TagNumber(16)
  $core.bool hasAge() => $_has(14);
  @$pb.TagNumber(16)
  void clearAge() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.int get days => $_getIZ(15);
  @$pb.TagNumber(17)
  set days($core.int value) => $_setSignedInt32(15, value);
  @$pb.TagNumber(17)
  $core.bool hasDays() => $_has(15);
  @$pb.TagNumber(17)
  void clearDays() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.bool get scheduleIng => $_getBF(16);
  @$pb.TagNumber(18)
  set scheduleIng($core.bool value) => $_setBool(16, value);
  @$pb.TagNumber(18)
  $core.bool hasScheduleIng() => $_has(16);
  @$pb.TagNumber(18)
  void clearScheduleIng() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.String get personalSignature => $_getSZ(17);
  @$pb.TagNumber(19)
  set personalSignature($core.String value) => $_setString(17, value);
  @$pb.TagNumber(19)
  $core.bool hasPersonalSignature() => $_has(17);
  @$pb.TagNumber(19)
  void clearPersonalSignature() => $_clearField(19);

  @$pb.TagNumber(20)
  $1.RelationType get relationType => $_getN(18);
  @$pb.TagNumber(20)
  set relationType($1.RelationType value) => $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasRelationType() => $_has(18);
  @$pb.TagNumber(20)
  void clearRelationType() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.int get voiceDuration => $_getIZ(19);
  @$pb.TagNumber(21)
  set voiceDuration($core.int value) => $_setSignedInt32(19, value);
  @$pb.TagNumber(21)
  $core.bool hasVoiceDuration() => $_has(19);
  @$pb.TagNumber(21)
  void clearVoiceDuration() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.String get voice => $_getSZ(20);
  @$pb.TagNumber(22)
  set voice($core.String value) => $_setString(20, value);
  @$pb.TagNumber(22)
  $core.bool hasVoice() => $_has(20);
  @$pb.TagNumber(22)
  void clearVoice() => $_clearField(22);

  @$pb.TagNumber(23)
  $0.CarMetaInfo get tmpCarMetaInfo => $_getN(21);
  @$pb.TagNumber(23)
  set tmpCarMetaInfo($0.CarMetaInfo value) => $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasTmpCarMetaInfo() => $_has(21);
  @$pb.TagNumber(23)
  void clearTmpCarMetaInfo() => $_clearField(23);
  @$pb.TagNumber(23)
  $0.CarMetaInfo ensureTmpCarMetaInfo() => $_ensure(21);

  @$pb.TagNumber(24)
  $1.Job get job => $_getN(22);
  @$pb.TagNumber(24)
  set job($1.Job value) => $_setField(24, value);
  @$pb.TagNumber(24)
  $core.bool hasJob() => $_has(22);
  @$pb.TagNumber(24)
  void clearJob() => $_clearField(24);

  @$pb.TagNumber(25)
  $1.UserVipLevelIcons get vipIcons => $_getN(23);
  @$pb.TagNumber(25)
  set vipIcons($1.UserVipLevelIcons value) => $_setField(25, value);
  @$pb.TagNumber(25)
  $core.bool hasVipIcons() => $_has(23);
  @$pb.TagNumber(25)
  void clearVipIcons() => $_clearField(25);
  @$pb.TagNumber(25)
  $1.UserVipLevelIcons ensureVipIcons() => $_ensure(23);

  @$pb.TagNumber(26)
  $core.bool get isShowNumCard => $_getBF(24);
  @$pb.TagNumber(26)
  set isShowNumCard($core.bool value) => $_setBool(24, value);
  @$pb.TagNumber(26)
  $core.bool hasIsShowNumCard() => $_has(24);
  @$pb.TagNumber(26)
  void clearIsShowNumCard() => $_clearField(26);

  @$pb.TagNumber(27)
  $core.String get avatarFrame => $_getSZ(25);
  @$pb.TagNumber(27)
  set avatarFrame($core.String value) => $_setString(25, value);
  @$pb.TagNumber(27)
  $core.bool hasAvatarFrame() => $_has(25);
  @$pb.TagNumber(27)
  void clearAvatarFrame() => $_clearField(27);

  @$pb.TagNumber(28)
  $core.String get micEffect => $_getSZ(26);
  @$pb.TagNumber(28)
  set micEffect($core.String value) => $_setString(26, value);
  @$pb.TagNumber(28)
  $core.bool hasMicEffect() => $_has(26);
  @$pb.TagNumber(28)
  void clearMicEffect() => $_clearField(28);

  @$pb.TagNumber(29)
  $core.int get offline => $_getIZ(27);
  @$pb.TagNumber(29)
  set offline($core.int value) => $_setSignedInt32(27, value);
  @$pb.TagNumber(29)
  $core.bool hasOffline() => $_has(27);
  @$pb.TagNumber(29)
  void clearOffline() => $_clearField(29);

  @$pb.TagNumber(30)
  $core.String get knightIcon => $_getSZ(28);
  @$pb.TagNumber(30)
  set knightIcon($core.String value) => $_setString(28, value);
  @$pb.TagNumber(30)
  $core.bool hasKnightIcon() => $_has(28);
  @$pb.TagNumber(30)
  void clearKnightIcon() => $_clearField(30);

  @$pb.TagNumber(31)
  $core.int get secretUser => $_getIZ(29);
  @$pb.TagNumber(31)
  set secretUser($core.int value) => $_setSignedInt32(29, value);
  @$pb.TagNumber(31)
  $core.bool hasSecretUser() => $_has(29);
  @$pb.TagNumber(31)
  void clearSecretUser() => $_clearField(31);

  @$pb.TagNumber(32)
  $core.String get knightInfoCard => $_getSZ(30);
  @$pb.TagNumber(32)
  set knightInfoCard($core.String value) => $_setString(30, value);
  @$pb.TagNumber(32)
  $core.bool hasKnightInfoCard() => $_has(30);
  @$pb.TagNumber(32)
  void clearKnightInfoCard() => $_clearField(32);

  @$pb.TagNumber(33)
  $core.bool get robot => $_getBF(31);
  @$pb.TagNumber(33)
  set robot($core.bool value) => $_setBool(31, value);
  @$pb.TagNumber(33)
  $core.bool hasRobot() => $_has(31);
  @$pb.TagNumber(33)
  void clearRobot() => $_clearField(33);

  @$pb.TagNumber(34)
  $core.String get luckyBuffEffect => $_getSZ(32);
  @$pb.TagNumber(34)
  set luckyBuffEffect($core.String value) => $_setString(32, value);
  @$pb.TagNumber(34)
  $core.bool hasLuckyBuffEffect() => $_has(32);
  @$pb.TagNumber(34)
  void clearLuckyBuffEffect() => $_clearField(34);

  @$pb.TagNumber(35)
  $pb.PbList<$core.String> get tags => $_getList(33);

  @$pb.TagNumber(96)
  $core.int get heartLinkCardStatus => $_getIZ(34);
  @$pb.TagNumber(96)
  set heartLinkCardStatus($core.int value) => $_setSignedInt32(34, value);
  @$pb.TagNumber(96)
  $core.bool hasHeartLinkCardStatus() => $_has(34);
  @$pb.TagNumber(96)
  void clearHeartLinkCardStatus() => $_clearField(96);

  @$pb.TagNumber(97)
  $core.bool get kickOutPermission => $_getBF(35);
  @$pb.TagNumber(97)
  set kickOutPermission($core.bool value) => $_setBool(35, value);
  @$pb.TagNumber(97)
  $core.bool hasKickOutPermission() => $_has(35);
  @$pb.TagNumber(97)
  void clearKickOutPermission() => $_clearField(97);

  @$pb.TagNumber(98)
  $core.bool get showQuiz => $_getBF(36);
  @$pb.TagNumber(98)
  set showQuiz($core.bool value) => $_setBool(36, value);
  @$pb.TagNumber(98)
  $core.bool hasShowQuiz() => $_has(36);
  @$pb.TagNumber(98)
  void clearShowQuiz() => $_clearField(98);

  @$pb.TagNumber(99)
  $pb.PbList<$core.String> get nicknameColor => $_getList(37);
}

class SimpleChannelUserSlot extends $pb.GeneratedMessage {
  factory SimpleChannelUserSlot({
    $core.Iterable<RtcUserRole>? permissionRole,
    SimpleChannelUser? user,
    MicStatus? micStatus,
    $fixnum.Int64? contributionValue,
    $core.String? micFrameUrl,
    MicTypeEnum? micType,
    $core.int? micNo,
    $core.bool? audition,
    $core.int? counterTimestamp,
    $core.String? wheatStyleUrl,
    $core.int? online,
    $core.int? offline,
    $core.int? secretUser,
    TrickyData? trickyData,
    $core.int? downMicTimestamp,
    $core.int? heartLinkCardStatus,
  }) {
    final result = create();
    if (permissionRole != null) result.permissionRole.addAll(permissionRole);
    if (user != null) result.user = user;
    if (micStatus != null) result.micStatus = micStatus;
    if (contributionValue != null) result.contributionValue = contributionValue;
    if (micFrameUrl != null) result.micFrameUrl = micFrameUrl;
    if (micType != null) result.micType = micType;
    if (micNo != null) result.micNo = micNo;
    if (audition != null) result.audition = audition;
    if (counterTimestamp != null) result.counterTimestamp = counterTimestamp;
    if (wheatStyleUrl != null) result.wheatStyleUrl = wheatStyleUrl;
    if (online != null) result.online = online;
    if (offline != null) result.offline = offline;
    if (secretUser != null) result.secretUser = secretUser;
    if (trickyData != null) result.trickyData = trickyData;
    if (downMicTimestamp != null) result.downMicTimestamp = downMicTimestamp;
    if (heartLinkCardStatus != null)
      result.heartLinkCardStatus = heartLinkCardStatus;
    return result;
  }

  SimpleChannelUserSlot._();

  factory SimpleChannelUserSlot.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SimpleChannelUserSlot.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SimpleChannelUserSlot',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pc<RtcUserRole>(
        1, _omitFieldNames ? '' : 'permissionRole', $pb.PbFieldType.KE,
        valueOf: RtcUserRole.valueOf,
        enumValues: RtcUserRole.values,
        defaultEnumValue: RtcUserRole.Guest)
    ..aOM<SimpleChannelUser>(2, _omitFieldNames ? '' : 'user',
        subBuilder: SimpleChannelUser.create)
    ..aE<MicStatus>(3, _omitFieldNames ? '' : 'micStatus',
        enumValues: MicStatus.values)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'contributionValue', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, _omitFieldNames ? '' : 'micFrameUrl')
    ..aE<MicTypeEnum>(6, _omitFieldNames ? '' : 'micType',
        enumValues: MicTypeEnum.values)
    ..aI(7, _omitFieldNames ? '' : 'micNo', fieldType: $pb.PbFieldType.OU3)
    ..aOB(8, _omitFieldNames ? '' : 'audition')
    ..aI(9, _omitFieldNames ? '' : 'counterTimestamp',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(10, _omitFieldNames ? '' : 'wheatStyleUrl')
    ..aI(11, _omitFieldNames ? '' : 'online')
    ..aI(12, _omitFieldNames ? '' : 'offline')
    ..aI(13, _omitFieldNames ? '' : 'secretUser')
    ..aOM<TrickyData>(14, _omitFieldNames ? '' : 'trickyData',
        subBuilder: TrickyData.create)
    ..aI(15, _omitFieldNames ? '' : 'downMicTimestamp',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(16, _omitFieldNames ? '' : 'heartLinkCardStatus')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleChannelUserSlot clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleChannelUserSlot copyWith(
          void Function(SimpleChannelUserSlot) updates) =>
      super.copyWith((message) => updates(message as SimpleChannelUserSlot))
          as SimpleChannelUserSlot;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SimpleChannelUserSlot create() => SimpleChannelUserSlot._();
  @$core.override
  SimpleChannelUserSlot createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SimpleChannelUserSlot getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SimpleChannelUserSlot>(create);
  static SimpleChannelUserSlot? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RtcUserRole> get permissionRole => $_getList(0);

  @$pb.TagNumber(2)
  SimpleChannelUser get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(SimpleChannelUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => $_clearField(2);
  @$pb.TagNumber(2)
  SimpleChannelUser ensureUser() => $_ensure(1);

  @$pb.TagNumber(3)
  MicStatus get micStatus => $_getN(2);
  @$pb.TagNumber(3)
  set micStatus(MicStatus value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMicStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearMicStatus() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get contributionValue => $_getI64(3);
  @$pb.TagNumber(4)
  set contributionValue($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasContributionValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearContributionValue() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get micFrameUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set micFrameUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMicFrameUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearMicFrameUrl() => $_clearField(5);

  @$pb.TagNumber(6)
  MicTypeEnum get micType => $_getN(5);
  @$pb.TagNumber(6)
  set micType(MicTypeEnum value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasMicType() => $_has(5);
  @$pb.TagNumber(6)
  void clearMicType() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get micNo => $_getIZ(6);
  @$pb.TagNumber(7)
  set micNo($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMicNo() => $_has(6);
  @$pb.TagNumber(7)
  void clearMicNo() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get audition => $_getBF(7);
  @$pb.TagNumber(8)
  set audition($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAudition() => $_has(7);
  @$pb.TagNumber(8)
  void clearAudition() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get counterTimestamp => $_getIZ(8);
  @$pb.TagNumber(9)
  set counterTimestamp($core.int value) => $_setUnsignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCounterTimestamp() => $_has(8);
  @$pb.TagNumber(9)
  void clearCounterTimestamp() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get wheatStyleUrl => $_getSZ(9);
  @$pb.TagNumber(10)
  set wheatStyleUrl($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasWheatStyleUrl() => $_has(9);
  @$pb.TagNumber(10)
  void clearWheatStyleUrl() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get online => $_getIZ(10);
  @$pb.TagNumber(11)
  set online($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasOnline() => $_has(10);
  @$pb.TagNumber(11)
  void clearOnline() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get offline => $_getIZ(11);
  @$pb.TagNumber(12)
  set offline($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasOffline() => $_has(11);
  @$pb.TagNumber(12)
  void clearOffline() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get secretUser => $_getIZ(12);
  @$pb.TagNumber(13)
  set secretUser($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasSecretUser() => $_has(12);
  @$pb.TagNumber(13)
  void clearSecretUser() => $_clearField(13);

  @$pb.TagNumber(14)
  TrickyData get trickyData => $_getN(13);
  @$pb.TagNumber(14)
  set trickyData(TrickyData value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasTrickyData() => $_has(13);
  @$pb.TagNumber(14)
  void clearTrickyData() => $_clearField(14);
  @$pb.TagNumber(14)
  TrickyData ensureTrickyData() => $_ensure(13);

  @$pb.TagNumber(15)
  $core.int get downMicTimestamp => $_getIZ(14);
  @$pb.TagNumber(15)
  set downMicTimestamp($core.int value) => $_setUnsignedInt32(14, value);
  @$pb.TagNumber(15)
  $core.bool hasDownMicTimestamp() => $_has(14);
  @$pb.TagNumber(15)
  void clearDownMicTimestamp() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.int get heartLinkCardStatus => $_getIZ(15);
  @$pb.TagNumber(16)
  set heartLinkCardStatus($core.int value) => $_setSignedInt32(15, value);
  @$pb.TagNumber(16)
  $core.bool hasHeartLinkCardStatus() => $_has(15);
  @$pb.TagNumber(16)
  void clearHeartLinkCardStatus() => $_clearField(16);
}

class TrickyData extends $pb.GeneratedMessage {
  factory TrickyData({
    $core.String? avatar,
    VoiceProfile? voiceProfile,
  }) {
    final result = create();
    if (avatar != null) result.avatar = avatar;
    if (voiceProfile != null) result.voiceProfile = voiceProfile;
    return result;
  }

  TrickyData._();

  factory TrickyData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrickyData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrickyData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'avatar')
    ..aOM<VoiceProfile>(2, _omitFieldNames ? '' : 'voiceProfile',
        subBuilder: VoiceProfile.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrickyData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrickyData copyWith(void Function(TrickyData) updates) =>
      super.copyWith((message) => updates(message as TrickyData)) as TrickyData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrickyData create() => TrickyData._();
  @$core.override
  TrickyData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TrickyData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrickyData>(create);
  static TrickyData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get avatar => $_getSZ(0);
  @$pb.TagNumber(1)
  set avatar($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAvatar() => $_has(0);
  @$pb.TagNumber(1)
  void clearAvatar() => $_clearField(1);

  @$pb.TagNumber(2)
  VoiceProfile get voiceProfile => $_getN(1);
  @$pb.TagNumber(2)
  set voiceProfile(VoiceProfile value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasVoiceProfile() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoiceProfile() => $_clearField(2);
  @$pb.TagNumber(2)
  VoiceProfile ensureVoiceProfile() => $_ensure(1);
}

class VoiceProfile extends $pb.GeneratedMessage {
  factory VoiceProfile({
    $core.String? name,
    $core.double? pitch,
    $core.double? formant,
    $core.Iterable<$core.double>? equalization,
    $fixnum.Int64? expireTime,
    $core.int? txVoiceChangeType,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (pitch != null) result.pitch = pitch;
    if (formant != null) result.formant = formant;
    if (equalization != null) result.equalization.addAll(equalization);
    if (expireTime != null) result.expireTime = expireTime;
    if (txVoiceChangeType != null) result.txVoiceChangeType = txVoiceChangeType;
    return result;
  }

  VoiceProfile._();

  factory VoiceProfile.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VoiceProfile.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VoiceProfile',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aD(2, _omitFieldNames ? '' : 'pitch')
    ..aD(3, _omitFieldNames ? '' : 'formant')
    ..p<$core.double>(
        4, _omitFieldNames ? '' : 'equalization', $pb.PbFieldType.KD)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'expireTime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(6, _omitFieldNames ? '' : 'txVoiceChangeType',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoiceProfile clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoiceProfile copyWith(void Function(VoiceProfile) updates) =>
      super.copyWith((message) => updates(message as VoiceProfile))
          as VoiceProfile;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoiceProfile create() => VoiceProfile._();
  @$core.override
  VoiceProfile createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VoiceProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoiceProfile>(create);
  static VoiceProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get pitch => $_getN(1);
  @$pb.TagNumber(2)
  set pitch($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPitch() => $_has(1);
  @$pb.TagNumber(2)
  void clearPitch() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get formant => $_getN(2);
  @$pb.TagNumber(3)
  set formant($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFormant() => $_has(2);
  @$pb.TagNumber(3)
  void clearFormant() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.double> get equalization => $_getList(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get expireTime => $_getI64(4);
  @$pb.TagNumber(5)
  set expireTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExpireTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpireTime() => $_clearField(5);

  /// https://cloud.tencent.com/document/product/647/79623#e6f03d6a29abd12b6ecc056432e40cc8
  @$pb.TagNumber(6)
  $core.int get txVoiceChangeType => $_getIZ(5);
  @$pb.TagNumber(6)
  set txVoiceChangeType($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTxVoiceChangeType() => $_has(5);
  @$pb.TagNumber(6)
  void clearTxVoiceChangeType() => $_clearField(6);
}

class Channel extends $pb.GeneratedMessage {
  factory Channel({
    $fixnum.Int64? channelId,
    $core.String? agoraChannelId,
    $core.String? emChatroomId,
    RtcUserRole? role,
    SimpleChannelUser? owner,
    $core.int? currentUserCount,
    $core.Iterable<SimpleChannelUser>? userList,
    $core.Iterable<SimpleChannelUserSlot>? manager,
    $core.Iterable<SimpleChannelUserSlot>? broadcaster,
    $core.Iterable<SimpleChannelUserSlot>? waitQueue,
    $core.Iterable<SimpleChannelUserSlot>? carOwnerMicQueue,
    $core.bool? freePub,
    $core.String? title,
    $core.bool? hasPassword,
    $core.bool? isPrivacy,
    $core.String? theme,
    $core.String? backgroundUrl,
    $core.String? notice,
    KtvSongList? songList,
    $fixnum.Int64? auditionUid,
    $core.bool? inMyCollection,
    ProgramInfo? program,
    RoomTypeObj? roomTypeObj,
    $core.Iterable<SimpleChannelUser>? giftRank,
    $fixnum.Int64? hotValue,
    $core.Iterable<SimpleChannelUser>? vipPark,
    $core.bool? giftValueCountSwitch,
    ChannelLabel? roomLabel,
    $core.String? roomLabelDesc,
    $core.String? status,
    $core.String? icon,
    $core.bool? freePublicChat,
    $core.Iterable<OffMicUser>? offMicUser,
    RoomUsage? usage,
    $core.bool? inProcessOfSchedule,
    $core.bool? showRoomOwner,
    $core.bool? joinRoomExtSwitch,
    $core.bool? agoraLowLatency,
    $core.int? countDownTimestamp,
    $core.String? roomLabelIcon,
    $core.Iterable<$core.String>? roomLabelColor,
    $core.int? giftPanelVersion,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    if (agoraChannelId != null) result.agoraChannelId = agoraChannelId;
    if (emChatroomId != null) result.emChatroomId = emChatroomId;
    if (role != null) result.role = role;
    if (owner != null) result.owner = owner;
    if (currentUserCount != null) result.currentUserCount = currentUserCount;
    if (userList != null) result.userList.addAll(userList);
    if (manager != null) result.manager.addAll(manager);
    if (broadcaster != null) result.broadcaster.addAll(broadcaster);
    if (waitQueue != null) result.waitQueue.addAll(waitQueue);
    if (carOwnerMicQueue != null)
      result.carOwnerMicQueue.addAll(carOwnerMicQueue);
    if (freePub != null) result.freePub = freePub;
    if (title != null) result.title = title;
    if (hasPassword != null) result.hasPassword = hasPassword;
    if (isPrivacy != null) result.isPrivacy = isPrivacy;
    if (theme != null) result.theme = theme;
    if (backgroundUrl != null) result.backgroundUrl = backgroundUrl;
    if (notice != null) result.notice = notice;
    if (songList != null) result.songList = songList;
    if (auditionUid != null) result.auditionUid = auditionUid;
    if (inMyCollection != null) result.inMyCollection = inMyCollection;
    if (program != null) result.program = program;
    if (roomTypeObj != null) result.roomTypeObj = roomTypeObj;
    if (giftRank != null) result.giftRank.addAll(giftRank);
    if (hotValue != null) result.hotValue = hotValue;
    if (vipPark != null) result.vipPark.addAll(vipPark);
    if (giftValueCountSwitch != null)
      result.giftValueCountSwitch = giftValueCountSwitch;
    if (roomLabel != null) result.roomLabel = roomLabel;
    if (roomLabelDesc != null) result.roomLabelDesc = roomLabelDesc;
    if (status != null) result.status = status;
    if (icon != null) result.icon = icon;
    if (freePublicChat != null) result.freePublicChat = freePublicChat;
    if (offMicUser != null) result.offMicUser.addAll(offMicUser);
    if (usage != null) result.usage = usage;
    if (inProcessOfSchedule != null)
      result.inProcessOfSchedule = inProcessOfSchedule;
    if (showRoomOwner != null) result.showRoomOwner = showRoomOwner;
    if (joinRoomExtSwitch != null) result.joinRoomExtSwitch = joinRoomExtSwitch;
    if (agoraLowLatency != null) result.agoraLowLatency = agoraLowLatency;
    if (countDownTimestamp != null)
      result.countDownTimestamp = countDownTimestamp;
    if (roomLabelIcon != null) result.roomLabelIcon = roomLabelIcon;
    if (roomLabelColor != null) result.roomLabelColor.addAll(roomLabelColor);
    if (giftPanelVersion != null) result.giftPanelVersion = giftPanelVersion;
    return result;
  }

  Channel._();

  factory Channel.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Channel.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Channel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'agoraChannelId')
    ..aOS(3, _omitFieldNames ? '' : 'emChatroomId')
    ..aE<RtcUserRole>(4, _omitFieldNames ? '' : 'role',
        enumValues: RtcUserRole.values)
    ..aOM<SimpleChannelUser>(5, _omitFieldNames ? '' : 'owner',
        subBuilder: SimpleChannelUser.create)
    ..aI(6, _omitFieldNames ? '' : 'currentUserCount',
        fieldType: $pb.PbFieldType.OU3)
    ..pPM<SimpleChannelUser>(7, _omitFieldNames ? '' : 'userList',
        subBuilder: SimpleChannelUser.create)
    ..pPM<SimpleChannelUserSlot>(8, _omitFieldNames ? '' : 'manager',
        subBuilder: SimpleChannelUserSlot.create)
    ..pPM<SimpleChannelUserSlot>(9, _omitFieldNames ? '' : 'broadcaster',
        subBuilder: SimpleChannelUserSlot.create)
    ..pPM<SimpleChannelUserSlot>(10, _omitFieldNames ? '' : 'waitQueue',
        subBuilder: SimpleChannelUserSlot.create)
    ..pPM<SimpleChannelUserSlot>(11, _omitFieldNames ? '' : 'carOwnerMicQueue',
        subBuilder: SimpleChannelUserSlot.create)
    ..aOB(12, _omitFieldNames ? '' : 'freePub')
    ..aOS(13, _omitFieldNames ? '' : 'title')
    ..aOB(14, _omitFieldNames ? '' : 'hasPassword')
    ..aOB(15, _omitFieldNames ? '' : 'isPrivacy')
    ..aOS(16, _omitFieldNames ? '' : 'theme')
    ..aOS(17, _omitFieldNames ? '' : 'backgroundUrl')
    ..aOS(18, _omitFieldNames ? '' : 'notice')
    ..aOM<KtvSongList>(19, _omitFieldNames ? '' : 'songList',
        subBuilder: KtvSongList.create)
    ..a<$fixnum.Int64>(
        20, _omitFieldNames ? '' : 'auditionUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(21, _omitFieldNames ? '' : 'inMyCollection')
    ..aOM<ProgramInfo>(22, _omitFieldNames ? '' : 'program',
        subBuilder: ProgramInfo.create)
    ..aOM<RoomTypeObj>(23, _omitFieldNames ? '' : 'roomTypeObj',
        subBuilder: RoomTypeObj.create)
    ..pPM<SimpleChannelUser>(24, _omitFieldNames ? '' : 'giftRank',
        subBuilder: SimpleChannelUser.create)
    ..a<$fixnum.Int64>(
        25, _omitFieldNames ? '' : 'hotValue', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<SimpleChannelUser>(26, _omitFieldNames ? '' : 'vipPark',
        subBuilder: SimpleChannelUser.create)
    ..aOB(27, _omitFieldNames ? '' : 'giftValueCountSwitch')
    ..aE<ChannelLabel>(28, _omitFieldNames ? '' : 'roomLabel',
        enumValues: ChannelLabel.values)
    ..aOS(29, _omitFieldNames ? '' : 'roomLabelDesc')
    ..aOS(30, _omitFieldNames ? '' : 'status')
    ..aOS(31, _omitFieldNames ? '' : 'icon')
    ..aOB(32, _omitFieldNames ? '' : 'freePublicChat')
    ..pPM<OffMicUser>(33, _omitFieldNames ? '' : 'offMicUser',
        subBuilder: OffMicUser.create)
    ..aE<RoomUsage>(34, _omitFieldNames ? '' : 'usage',
        enumValues: RoomUsage.values)
    ..aOB(35, _omitFieldNames ? '' : 'inProcessOfSchedule')
    ..aOB(36, _omitFieldNames ? '' : 'showRoomOwner')
    ..aOB(37, _omitFieldNames ? '' : 'joinRoomExtSwitch')
    ..aOB(38, _omitFieldNames ? '' : 'agoraLowLatency')
    ..aI(39, _omitFieldNames ? '' : 'countDownTimestamp',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(40, _omitFieldNames ? '' : 'roomLabelIcon')
    ..pPS(41, _omitFieldNames ? '' : 'roomLabelColor')
    ..aI(42, _omitFieldNames ? '' : 'giftPanelVersion',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Channel clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Channel copyWith(void Function(Channel) updates) =>
      super.copyWith((message) => updates(message as Channel)) as Channel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Channel create() => Channel._();
  @$core.override
  Channel createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Channel getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Channel>(create);
  static Channel? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(1)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get agoraChannelId => $_getSZ(1);
  @$pb.TagNumber(2)
  set agoraChannelId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAgoraChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgoraChannelId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get emChatroomId => $_getSZ(2);
  @$pb.TagNumber(3)
  set emChatroomId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEmChatroomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmChatroomId() => $_clearField(3);

  @$pb.TagNumber(4)
  RtcUserRole get role => $_getN(3);
  @$pb.TagNumber(4)
  set role(RtcUserRole value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole() => $_clearField(4);

  @$pb.TagNumber(5)
  SimpleChannelUser get owner => $_getN(4);
  @$pb.TagNumber(5)
  set owner(SimpleChannelUser value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasOwner() => $_has(4);
  @$pb.TagNumber(5)
  void clearOwner() => $_clearField(5);
  @$pb.TagNumber(5)
  SimpleChannelUser ensureOwner() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get currentUserCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set currentUserCount($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCurrentUserCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurrentUserCount() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<SimpleChannelUser> get userList => $_getList(6);

  @$pb.TagNumber(8)
  $pb.PbList<SimpleChannelUserSlot> get manager => $_getList(7);

  @$pb.TagNumber(9)
  $pb.PbList<SimpleChannelUserSlot> get broadcaster => $_getList(8);

  @$pb.TagNumber(10)
  $pb.PbList<SimpleChannelUserSlot> get waitQueue => $_getList(9);

  @$pb.TagNumber(11)
  $pb.PbList<SimpleChannelUserSlot> get carOwnerMicQueue => $_getList(10);

  /// 以下为客户端设置的
  @$pb.TagNumber(12)
  $core.bool get freePub => $_getBF(11);
  @$pb.TagNumber(12)
  set freePub($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasFreePub() => $_has(11);
  @$pb.TagNumber(12)
  void clearFreePub() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get title => $_getSZ(12);
  @$pb.TagNumber(13)
  set title($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasTitle() => $_has(12);
  @$pb.TagNumber(13)
  void clearTitle() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.bool get hasPassword => $_getBF(13);
  @$pb.TagNumber(14)
  set hasPassword($core.bool value) => $_setBool(13, value);
  @$pb.TagNumber(14)
  $core.bool hasHasPassword() => $_has(13);
  @$pb.TagNumber(14)
  void clearHasPassword() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.bool get isPrivacy => $_getBF(14);
  @$pb.TagNumber(15)
  set isPrivacy($core.bool value) => $_setBool(14, value);
  @$pb.TagNumber(15)
  $core.bool hasIsPrivacy() => $_has(14);
  @$pb.TagNumber(15)
  void clearIsPrivacy() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get theme => $_getSZ(15);
  @$pb.TagNumber(16)
  set theme($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasTheme() => $_has(15);
  @$pb.TagNumber(16)
  void clearTheme() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.String get backgroundUrl => $_getSZ(16);
  @$pb.TagNumber(17)
  set backgroundUrl($core.String value) => $_setString(16, value);
  @$pb.TagNumber(17)
  $core.bool hasBackgroundUrl() => $_has(16);
  @$pb.TagNumber(17)
  void clearBackgroundUrl() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.String get notice => $_getSZ(17);
  @$pb.TagNumber(18)
  set notice($core.String value) => $_setString(17, value);
  @$pb.TagNumber(18)
  $core.bool hasNotice() => $_has(17);
  @$pb.TagNumber(18)
  void clearNotice() => $_clearField(18);

  @$pb.TagNumber(19)
  KtvSongList get songList => $_getN(18);
  @$pb.TagNumber(19)
  set songList(KtvSongList value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasSongList() => $_has(18);
  @$pb.TagNumber(19)
  void clearSongList() => $_clearField(19);
  @$pb.TagNumber(19)
  KtvSongList ensureSongList() => $_ensure(18);

  @$pb.TagNumber(20)
  $fixnum.Int64 get auditionUid => $_getI64(19);
  @$pb.TagNumber(20)
  set auditionUid($fixnum.Int64 value) => $_setInt64(19, value);
  @$pb.TagNumber(20)
  $core.bool hasAuditionUid() => $_has(19);
  @$pb.TagNumber(20)
  void clearAuditionUid() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.bool get inMyCollection => $_getBF(20);
  @$pb.TagNumber(21)
  set inMyCollection($core.bool value) => $_setBool(20, value);
  @$pb.TagNumber(21)
  $core.bool hasInMyCollection() => $_has(20);
  @$pb.TagNumber(21)
  void clearInMyCollection() => $_clearField(21);

  @$pb.TagNumber(22)
  ProgramInfo get program => $_getN(21);
  @$pb.TagNumber(22)
  set program(ProgramInfo value) => $_setField(22, value);
  @$pb.TagNumber(22)
  $core.bool hasProgram() => $_has(21);
  @$pb.TagNumber(22)
  void clearProgram() => $_clearField(22);
  @$pb.TagNumber(22)
  ProgramInfo ensureProgram() => $_ensure(21);

  @$pb.TagNumber(23)
  RoomTypeObj get roomTypeObj => $_getN(22);
  @$pb.TagNumber(23)
  set roomTypeObj(RoomTypeObj value) => $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasRoomTypeObj() => $_has(22);
  @$pb.TagNumber(23)
  void clearRoomTypeObj() => $_clearField(23);
  @$pb.TagNumber(23)
  RoomTypeObj ensureRoomTypeObj() => $_ensure(22);

  @$pb.TagNumber(24)
  $pb.PbList<SimpleChannelUser> get giftRank => $_getList(23);

  @$pb.TagNumber(25)
  $fixnum.Int64 get hotValue => $_getI64(24);
  @$pb.TagNumber(25)
  set hotValue($fixnum.Int64 value) => $_setInt64(24, value);
  @$pb.TagNumber(25)
  $core.bool hasHotValue() => $_has(24);
  @$pb.TagNumber(25)
  void clearHotValue() => $_clearField(25);

  @$pb.TagNumber(26)
  $pb.PbList<SimpleChannelUser> get vipPark => $_getList(25);

  @$pb.TagNumber(27)
  $core.bool get giftValueCountSwitch => $_getBF(26);
  @$pb.TagNumber(27)
  set giftValueCountSwitch($core.bool value) => $_setBool(26, value);
  @$pb.TagNumber(27)
  $core.bool hasGiftValueCountSwitch() => $_has(26);
  @$pb.TagNumber(27)
  void clearGiftValueCountSwitch() => $_clearField(27);

  @$pb.TagNumber(28)
  ChannelLabel get roomLabel => $_getN(27);
  @$pb.TagNumber(28)
  set roomLabel(ChannelLabel value) => $_setField(28, value);
  @$pb.TagNumber(28)
  $core.bool hasRoomLabel() => $_has(27);
  @$pb.TagNumber(28)
  void clearRoomLabel() => $_clearField(28);

  @$pb.TagNumber(29)
  $core.String get roomLabelDesc => $_getSZ(28);
  @$pb.TagNumber(29)
  set roomLabelDesc($core.String value) => $_setString(28, value);
  @$pb.TagNumber(29)
  $core.bool hasRoomLabelDesc() => $_has(28);
  @$pb.TagNumber(29)
  void clearRoomLabelDesc() => $_clearField(29);

  @$pb.TagNumber(30)
  $core.String get status => $_getSZ(29);
  @$pb.TagNumber(30)
  set status($core.String value) => $_setString(29, value);
  @$pb.TagNumber(30)
  $core.bool hasStatus() => $_has(29);
  @$pb.TagNumber(30)
  void clearStatus() => $_clearField(30);

  @$pb.TagNumber(31)
  $core.String get icon => $_getSZ(30);
  @$pb.TagNumber(31)
  set icon($core.String value) => $_setString(30, value);
  @$pb.TagNumber(31)
  $core.bool hasIcon() => $_has(30);
  @$pb.TagNumber(31)
  void clearIcon() => $_clearField(31);

  @$pb.TagNumber(32)
  $core.bool get freePublicChat => $_getBF(31);
  @$pb.TagNumber(32)
  set freePublicChat($core.bool value) => $_setBool(31, value);
  @$pb.TagNumber(32)
  $core.bool hasFreePublicChat() => $_has(31);
  @$pb.TagNumber(32)
  void clearFreePublicChat() => $_clearField(32);

  @$pb.TagNumber(33)
  $pb.PbList<OffMicUser> get offMicUser => $_getList(32);

  @$pb.TagNumber(34)
  RoomUsage get usage => $_getN(33);
  @$pb.TagNumber(34)
  set usage(RoomUsage value) => $_setField(34, value);
  @$pb.TagNumber(34)
  $core.bool hasUsage() => $_has(33);
  @$pb.TagNumber(34)
  void clearUsage() => $_clearField(34);

  @$pb.TagNumber(35)
  $core.bool get inProcessOfSchedule => $_getBF(34);
  @$pb.TagNumber(35)
  set inProcessOfSchedule($core.bool value) => $_setBool(34, value);
  @$pb.TagNumber(35)
  $core.bool hasInProcessOfSchedule() => $_has(34);
  @$pb.TagNumber(35)
  void clearInProcessOfSchedule() => $_clearField(35);

  @$pb.TagNumber(36)
  $core.bool get showRoomOwner => $_getBF(35);
  @$pb.TagNumber(36)
  set showRoomOwner($core.bool value) => $_setBool(35, value);
  @$pb.TagNumber(36)
  $core.bool hasShowRoomOwner() => $_has(35);
  @$pb.TagNumber(36)
  void clearShowRoomOwner() => $_clearField(36);

  @$pb.TagNumber(37)
  $core.bool get joinRoomExtSwitch => $_getBF(36);
  @$pb.TagNumber(37)
  set joinRoomExtSwitch($core.bool value) => $_setBool(36, value);
  @$pb.TagNumber(37)
  $core.bool hasJoinRoomExtSwitch() => $_has(36);
  @$pb.TagNumber(37)
  void clearJoinRoomExtSwitch() => $_clearField(37);

  @$pb.TagNumber(38)
  $core.bool get agoraLowLatency => $_getBF(37);
  @$pb.TagNumber(38)
  set agoraLowLatency($core.bool value) => $_setBool(37, value);
  @$pb.TagNumber(38)
  $core.bool hasAgoraLowLatency() => $_has(37);
  @$pb.TagNumber(38)
  void clearAgoraLowLatency() => $_clearField(38);

  @$pb.TagNumber(39)
  $core.int get countDownTimestamp => $_getIZ(38);
  @$pb.TagNumber(39)
  set countDownTimestamp($core.int value) => $_setUnsignedInt32(38, value);
  @$pb.TagNumber(39)
  $core.bool hasCountDownTimestamp() => $_has(38);
  @$pb.TagNumber(39)
  void clearCountDownTimestamp() => $_clearField(39);

  @$pb.TagNumber(40)
  $core.String get roomLabelIcon => $_getSZ(39);
  @$pb.TagNumber(40)
  set roomLabelIcon($core.String value) => $_setString(39, value);
  @$pb.TagNumber(40)
  $core.bool hasRoomLabelIcon() => $_has(39);
  @$pb.TagNumber(40)
  void clearRoomLabelIcon() => $_clearField(40);

  @$pb.TagNumber(41)
  $pb.PbList<$core.String> get roomLabelColor => $_getList(40);

  @$pb.TagNumber(42)
  $core.int get giftPanelVersion => $_getIZ(41);
  @$pb.TagNumber(42)
  set giftPanelVersion($core.int value) => $_setUnsignedInt32(41, value);
  @$pb.TagNumber(42)
  $core.bool hasGiftPanelVersion() => $_has(41);
  @$pb.TagNumber(42)
  void clearGiftPanelVersion() => $_clearField(42);
}

class RoomTypeObj extends $pb.GeneratedMessage {
  factory RoomTypeObj({
    $core.int? id,
    $core.String? name,
    RoomType? type,
    $core.Iterable<$core.String>? frameColor,
    $core.Iterable<MicTypeEnum>? mics,
    MicLayoutEnum? layout,
    $core.String? layoutName,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    if (frameColor != null) result.frameColor.addAll(frameColor);
    if (mics != null) result.mics.addAll(mics);
    if (layout != null) result.layout = layout;
    if (layoutName != null) result.layoutName = layoutName;
    return result;
  }

  RoomTypeObj._();

  factory RoomTypeObj.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomTypeObj.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomTypeObj',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id', fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aE<RoomType>(3, _omitFieldNames ? '' : 'type',
        enumValues: RoomType.values)
    ..pPS(4, _omitFieldNames ? '' : 'frameColor')
    ..pc<MicTypeEnum>(5, _omitFieldNames ? '' : 'mics', $pb.PbFieldType.KE,
        valueOf: MicTypeEnum.valueOf,
        enumValues: MicTypeEnum.values,
        defaultEnumValue: MicTypeEnum.HOST_MIC)
    ..aE<MicLayoutEnum>(6, _omitFieldNames ? '' : 'layout',
        enumValues: MicLayoutEnum.values)
    ..aOS(7, _omitFieldNames ? '' : 'layoutName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomTypeObj clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomTypeObj copyWith(void Function(RoomTypeObj) updates) =>
      super.copyWith((message) => updates(message as RoomTypeObj))
          as RoomTypeObj;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomTypeObj create() => RoomTypeObj._();
  @$core.override
  RoomTypeObj createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomTypeObj getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomTypeObj>(create);
  static RoomTypeObj? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
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
  RoomType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(RoomType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get frameColor => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<MicTypeEnum> get mics => $_getList(4);

  @$pb.TagNumber(6)
  MicLayoutEnum get layout => $_getN(5);
  @$pb.TagNumber(6)
  set layout(MicLayoutEnum value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasLayout() => $_has(5);
  @$pb.TagNumber(6)
  void clearLayout() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get layoutName => $_getSZ(6);
  @$pb.TagNumber(7)
  set layoutName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLayoutName() => $_has(6);
  @$pb.TagNumber(7)
  void clearLayoutName() => $_clearField(7);
}

class SetMicLayoutReq extends $pb.GeneratedMessage {
  factory SetMicLayoutReq({
    $fixnum.Int64? channelId,
    MicLayoutEnum? layout,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    if (layout != null) result.layout = layout;
    return result;
  }

  SetMicLayoutReq._();

  factory SetMicLayoutReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetMicLayoutReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetMicLayoutReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<MicLayoutEnum>(2, _omitFieldNames ? '' : 'layout',
        enumValues: MicLayoutEnum.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetMicLayoutReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetMicLayoutReq copyWith(void Function(SetMicLayoutReq) updates) =>
      super.copyWith((message) => updates(message as SetMicLayoutReq))
          as SetMicLayoutReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetMicLayoutReq create() => SetMicLayoutReq._();
  @$core.override
  SetMicLayoutReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetMicLayoutReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetMicLayoutReq>(create);
  static SetMicLayoutReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(1)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => $_clearField(1);

  @$pb.TagNumber(2)
  MicLayoutEnum get layout => $_getN(1);
  @$pb.TagNumber(2)
  set layout(MicLayoutEnum value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLayout() => $_has(1);
  @$pb.TagNumber(2)
  void clearLayout() => $_clearField(2);
}

class MicLayoutData extends $pb.GeneratedMessage {
  factory MicLayoutData({
    $core.Iterable<MicLayoutItem>? layoutItem,
  }) {
    final result = create();
    if (layoutItem != null) result.layoutItem.addAll(layoutItem);
    return result;
  }

  MicLayoutData._();

  factory MicLayoutData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MicLayoutData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MicLayoutData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pPM<MicLayoutItem>(1, _omitFieldNames ? '' : 'layoutItem',
        subBuilder: MicLayoutItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicLayoutData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicLayoutData copyWith(void Function(MicLayoutData) updates) =>
      super.copyWith((message) => updates(message as MicLayoutData))
          as MicLayoutData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MicLayoutData create() => MicLayoutData._();
  @$core.override
  MicLayoutData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MicLayoutData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MicLayoutData>(create);
  static MicLayoutData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MicLayoutItem> get layoutItem => $_getList(0);
}

class MicLayoutItem extends $pb.GeneratedMessage {
  factory MicLayoutItem({
    $core.Iterable<MicTypeEnum>? mics,
    MicLayoutEnum? layout,
    $core.String? layoutName,
  }) {
    final result = create();
    if (mics != null) result.mics.addAll(mics);
    if (layout != null) result.layout = layout;
    if (layoutName != null) result.layoutName = layoutName;
    return result;
  }

  MicLayoutItem._();

  factory MicLayoutItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MicLayoutItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MicLayoutItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pc<MicTypeEnum>(1, _omitFieldNames ? '' : 'mics', $pb.PbFieldType.KE,
        valueOf: MicTypeEnum.valueOf,
        enumValues: MicTypeEnum.values,
        defaultEnumValue: MicTypeEnum.HOST_MIC)
    ..aE<MicLayoutEnum>(2, _omitFieldNames ? '' : 'layout',
        enumValues: MicLayoutEnum.values)
    ..aOS(3, _omitFieldNames ? '' : 'layoutName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicLayoutItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicLayoutItem copyWith(void Function(MicLayoutItem) updates) =>
      super.copyWith((message) => updates(message as MicLayoutItem))
          as MicLayoutItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MicLayoutItem create() => MicLayoutItem._();
  @$core.override
  MicLayoutItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MicLayoutItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MicLayoutItem>(create);
  static MicLayoutItem? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MicTypeEnum> get mics => $_getList(0);

  @$pb.TagNumber(2)
  MicLayoutEnum get layout => $_getN(1);
  @$pb.TagNumber(2)
  set layout(MicLayoutEnum value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLayout() => $_has(1);
  @$pb.TagNumber(2)
  void clearLayout() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get layoutName => $_getSZ(2);
  @$pb.TagNumber(3)
  set layoutName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLayoutName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLayoutName() => $_clearField(3);
}

class GetLobbyListRsp extends $pb.GeneratedMessage {
  factory GetLobbyListRsp({
    $core.bool? success,
    $core.String? message,
    $core.Iterable<Channel>? lobbyList,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (lobbyList != null) result.lobbyList.addAll(lobbyList);
    return result;
  }

  GetLobbyListRsp._();

  factory GetLobbyListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetLobbyListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetLobbyListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..pPM<Channel>(3, _omitFieldNames ? '' : 'lobbyList',
        subBuilder: Channel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLobbyListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLobbyListRsp copyWith(void Function(GetLobbyListRsp) updates) =>
      super.copyWith((message) => updates(message as GetLobbyListRsp))
          as GetLobbyListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLobbyListRsp create() => GetLobbyListRsp._();
  @$core.override
  GetLobbyListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetLobbyListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLobbyListRsp>(create);
  static GetLobbyListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<Channel> get lobbyList => $_getList(2);
}

class GetLobbyRoomListRsp extends $pb.GeneratedMessage {
  factory GetLobbyRoomListRsp({
    $core.bool? success,
    $core.String? message,
    $core.Iterable<Channel>? roomList,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (roomList != null) result.roomList.addAll(roomList);
    return result;
  }

  GetLobbyRoomListRsp._();

  factory GetLobbyRoomListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetLobbyRoomListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetLobbyRoomListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..pPM<Channel>(3, _omitFieldNames ? '' : 'roomList',
        subBuilder: Channel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLobbyRoomListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLobbyRoomListRsp copyWith(void Function(GetLobbyRoomListRsp) updates) =>
      super.copyWith((message) => updates(message as GetLobbyRoomListRsp))
          as GetLobbyRoomListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLobbyRoomListRsp create() => GetLobbyRoomListRsp._();
  @$core.override
  GetLobbyRoomListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetLobbyRoomListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLobbyRoomListRsp>(create);
  static GetLobbyRoomListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<Channel> get roomList => $_getList(2);
}

class GetChannelInfoRsp extends $pb.GeneratedMessage {
  factory GetChannelInfoRsp({
    $core.bool? success,
    $core.String? message,
    Channel? channel,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (channel != null) result.channel = channel;
    return result;
  }

  GetChannelInfoRsp._();

  factory GetChannelInfoRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetChannelInfoRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetChannelInfoRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<Channel>(3, _omitFieldNames ? '' : 'channel',
        subBuilder: Channel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChannelInfoRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChannelInfoRsp copyWith(void Function(GetChannelInfoRsp) updates) =>
      super.copyWith((message) => updates(message as GetChannelInfoRsp))
          as GetChannelInfoRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChannelInfoRsp create() => GetChannelInfoRsp._();
  @$core.override
  GetChannelInfoRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetChannelInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetChannelInfoRsp>(create);
  static GetChannelInfoRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  Channel get channel => $_getN(2);
  @$pb.TagNumber(3)
  set channel(Channel value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasChannel() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannel() => $_clearField(3);
  @$pb.TagNumber(3)
  Channel ensureChannel() => $_ensure(2);
}

class RequestTokenReq extends $pb.GeneratedMessage {
  factory RequestTokenReq({
    $fixnum.Int64? channelId,
    $core.String? password,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    if (password != null) result.password = password;
    return result;
  }

  RequestTokenReq._();

  factory RequestTokenReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestTokenReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestTokenReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestTokenReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestTokenReq copyWith(void Function(RequestTokenReq) updates) =>
      super.copyWith((message) => updates(message as RequestTokenReq))
          as RequestTokenReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestTokenReq create() => RequestTokenReq._();
  @$core.override
  RequestTokenReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestTokenReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestTokenReq>(create);
  static RequestTokenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(1)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);
}

class RequestTokenRsp extends $pb.GeneratedMessage {
  factory RequestTokenRsp({
    $core.bool? success,
    $core.String? message,
    $core.String? token,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (token != null) result.token = token;
    return result;
  }

  RequestTokenRsp._();

  factory RequestTokenRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestTokenRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestTokenRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestTokenRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestTokenRsp copyWith(void Function(RequestTokenRsp) updates) =>
      super.copyWith((message) => updates(message as RequestTokenRsp))
          as RequestTokenRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestTokenRsp create() => RequestTokenRsp._();
  @$core.override
  RequestTokenRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestTokenRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestTokenRsp>(create);
  static RequestTokenRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => $_clearField(3);
}

class CreateChannelReq extends $pb.GeneratedMessage {
  factory CreateChannelReq({
    $core.String? title,
    $core.String? theme,
    $core.String? password,
    $core.bool? isPrivacy,
    $core.String? notice,
    ChannelLabel? label,
    $core.String? sudGameId,
    $core.String? roomType,
    $core.String? storyName,
    $core.String? characterName,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (theme != null) result.theme = theme;
    if (password != null) result.password = password;
    if (isPrivacy != null) result.isPrivacy = isPrivacy;
    if (notice != null) result.notice = notice;
    if (label != null) result.label = label;
    if (sudGameId != null) result.sudGameId = sudGameId;
    if (roomType != null) result.roomType = roomType;
    if (storyName != null) result.storyName = storyName;
    if (characterName != null) result.characterName = characterName;
    return result;
  }

  CreateChannelReq._();

  factory CreateChannelReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateChannelReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateChannelReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'theme')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..aOB(4, _omitFieldNames ? '' : 'isPrivacy')
    ..aOS(5, _omitFieldNames ? '' : 'notice')
    ..aE<ChannelLabel>(6, _omitFieldNames ? '' : 'label',
        enumValues: ChannelLabel.values)
    ..aOS(7, _omitFieldNames ? '' : 'sudGameId')
    ..aOS(8, _omitFieldNames ? '' : 'roomType')
    ..aOS(9, _omitFieldNames ? '' : 'storyName')
    ..aOS(10, _omitFieldNames ? '' : 'characterName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateChannelReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateChannelReq copyWith(void Function(CreateChannelReq) updates) =>
      super.copyWith((message) => updates(message as CreateChannelReq))
          as CreateChannelReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChannelReq create() => CreateChannelReq._();
  @$core.override
  CreateChannelReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateChannelReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateChannelReq>(create);
  static CreateChannelReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get theme => $_getSZ(1);
  @$pb.TagNumber(2)
  set theme($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTheme() => $_has(1);
  @$pb.TagNumber(2)
  void clearTheme() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isPrivacy => $_getBF(3);
  @$pb.TagNumber(4)
  set isPrivacy($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsPrivacy() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsPrivacy() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get notice => $_getSZ(4);
  @$pb.TagNumber(5)
  set notice($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNotice() => $_has(4);
  @$pb.TagNumber(5)
  void clearNotice() => $_clearField(5);

  @$pb.TagNumber(6)
  ChannelLabel get label => $_getN(5);
  @$pb.TagNumber(6)
  set label(ChannelLabel value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasLabel() => $_has(5);
  @$pb.TagNumber(6)
  void clearLabel() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get sudGameId => $_getSZ(6);
  @$pb.TagNumber(7)
  set sudGameId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSudGameId() => $_has(6);
  @$pb.TagNumber(7)
  void clearSudGameId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get roomType => $_getSZ(7);
  @$pb.TagNumber(8)
  set roomType($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRoomType() => $_has(7);
  @$pb.TagNumber(8)
  void clearRoomType() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get storyName => $_getSZ(8);
  @$pb.TagNumber(9)
  set storyName($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasStoryName() => $_has(8);
  @$pb.TagNumber(9)
  void clearStoryName() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get characterName => $_getSZ(9);
  @$pb.TagNumber(10)
  set characterName($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCharacterName() => $_has(9);
  @$pb.TagNumber(10)
  void clearCharacterName() => $_clearField(10);
}

class CreateChannelRsp extends $pb.GeneratedMessage {
  factory CreateChannelRsp({
    $core.bool? success,
    $core.String? message,
    Channel? channel,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (channel != null) result.channel = channel;
    return result;
  }

  CreateChannelRsp._();

  factory CreateChannelRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateChannelRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateChannelRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<Channel>(3, _omitFieldNames ? '' : 'channel',
        subBuilder: Channel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateChannelRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateChannelRsp copyWith(void Function(CreateChannelRsp) updates) =>
      super.copyWith((message) => updates(message as CreateChannelRsp))
          as CreateChannelRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChannelRsp create() => CreateChannelRsp._();
  @$core.override
  CreateChannelRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateChannelRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateChannelRsp>(create);
  static CreateChannelRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  Channel get channel => $_getN(2);
  @$pb.TagNumber(3)
  set channel(Channel value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasChannel() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannel() => $_clearField(3);
  @$pb.TagNumber(3)
  Channel ensureChannel() => $_ensure(2);
}

class DropChannelReq extends $pb.GeneratedMessage {
  factory DropChannelReq({
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  DropChannelReq._();

  factory DropChannelReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DropChannelReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DropChannelReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DropChannelReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DropChannelReq copyWith(void Function(DropChannelReq) updates) =>
      super.copyWith((message) => updates(message as DropChannelReq))
          as DropChannelReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DropChannelReq create() => DropChannelReq._();
  @$core.override
  DropChannelReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DropChannelReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DropChannelReq>(create);
  static DropChannelReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(1)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => $_clearField(1);
}

class DropChannelRsp extends $pb.GeneratedMessage {
  factory DropChannelRsp({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  DropChannelRsp._();

  factory DropChannelRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DropChannelRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DropChannelRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DropChannelRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DropChannelRsp copyWith(void Function(DropChannelRsp) updates) =>
      super.copyWith((message) => updates(message as DropChannelRsp))
          as DropChannelRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DropChannelRsp create() => DropChannelRsp._();
  @$core.override
  DropChannelRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DropChannelRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DropChannelRsp>(create);
  static DropChannelRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class PublishReq extends $pb.GeneratedMessage {
  factory PublishReq() => create();

  PublishReq._();

  factory PublishReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PublishReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PublishReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublishReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublishReq copyWith(void Function(PublishReq) updates) =>
      super.copyWith((message) => updates(message as PublishReq)) as PublishReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublishReq create() => PublishReq._();
  @$core.override
  PublishReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PublishReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PublishReq>(create);
  static PublishReq? _defaultInstance;
}

class PublishRsp extends $pb.GeneratedMessage {
  factory PublishRsp({
    $core.bool? success,
    $core.String? message,
    $core.bool? grant,
    $core.bool? inQueue,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (grant != null) result.grant = grant;
    if (inQueue != null) result.inQueue = inQueue;
    return result;
  }

  PublishRsp._();

  factory PublishRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PublishRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PublishRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOB(3, _omitFieldNames ? '' : 'grant')
    ..aOB(4, _omitFieldNames ? '' : 'inQueue')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublishRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PublishRsp copyWith(void Function(PublishRsp) updates) =>
      super.copyWith((message) => updates(message as PublishRsp)) as PublishRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublishRsp create() => PublishRsp._();
  @$core.override
  PublishRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PublishRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PublishRsp>(create);
  static PublishRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get grant => $_getBF(2);
  @$pb.TagNumber(3)
  set grant($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGrant() => $_has(2);
  @$pb.TagNumber(3)
  void clearGrant() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get inQueue => $_getBF(3);
  @$pb.TagNumber(4)
  set inQueue($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasInQueue() => $_has(3);
  @$pb.TagNumber(4)
  void clearInQueue() => $_clearField(4);
}

enum ChannelUpdate_Operation {
  kick,
  fields,
  changeRole,
  changeAudition,
  grantUpMic,
  upMic,
  grantDownMic,
  downMic,
  managerOpenMic,
  openMic,
  managerCloseMic,
  closeMic,
  cancelQueueMic,
  changeStatus,
  forbidWord,
  notSet
}

class ChannelUpdate extends $pb.GeneratedMessage {
  factory ChannelUpdate({
    $fixnum.Int64? channel,
    ChannelKickUser? kick,
    ChannelFields? fields,
    ChannelChangeRole? changeRole,
    ChannelChangeAudition? changeAudition,
    ChannelGrantUpMic? grantUpMic,
    ChannelUpMic? upMic,
    ChannelGrantDownMic? grantDownMic,
    ChannelDownMic? downMic,
    ChannelManagerOpenMic? managerOpenMic,
    ChannelOpenMic? openMic,
    ChannelManagerCloseMic? managerCloseMic,
    ChannelCloseMic? closeMic,
    ChannelCancelQueueMic? cancelQueueMic,
    ChannelChangeStatus? changeStatus,
    ChannelForbidWord? forbidWord,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (kick != null) result.kick = kick;
    if (fields != null) result.fields = fields;
    if (changeRole != null) result.changeRole = changeRole;
    if (changeAudition != null) result.changeAudition = changeAudition;
    if (grantUpMic != null) result.grantUpMic = grantUpMic;
    if (upMic != null) result.upMic = upMic;
    if (grantDownMic != null) result.grantDownMic = grantDownMic;
    if (downMic != null) result.downMic = downMic;
    if (managerOpenMic != null) result.managerOpenMic = managerOpenMic;
    if (openMic != null) result.openMic = openMic;
    if (managerCloseMic != null) result.managerCloseMic = managerCloseMic;
    if (closeMic != null) result.closeMic = closeMic;
    if (cancelQueueMic != null) result.cancelQueueMic = cancelQueueMic;
    if (changeStatus != null) result.changeStatus = changeStatus;
    if (forbidWord != null) result.forbidWord = forbidWord;
    return result;
  }

  ChannelUpdate._();

  factory ChannelUpdate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelUpdate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ChannelUpdate_Operation>
      _ChannelUpdate_OperationByTag = {
    2: ChannelUpdate_Operation.kick,
    3: ChannelUpdate_Operation.fields,
    4: ChannelUpdate_Operation.changeRole,
    5: ChannelUpdate_Operation.changeAudition,
    6: ChannelUpdate_Operation.grantUpMic,
    7: ChannelUpdate_Operation.upMic,
    8: ChannelUpdate_Operation.grantDownMic,
    9: ChannelUpdate_Operation.downMic,
    10: ChannelUpdate_Operation.managerOpenMic,
    11: ChannelUpdate_Operation.openMic,
    12: ChannelUpdate_Operation.managerCloseMic,
    13: ChannelUpdate_Operation.closeMic,
    14: ChannelUpdate_Operation.cancelQueueMic,
    15: ChannelUpdate_Operation.changeStatus,
    16: ChannelUpdate_Operation.forbidWord,
    0: ChannelUpdate_Operation.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelUpdate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16])
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<ChannelKickUser>(2, _omitFieldNames ? '' : 'kick',
        subBuilder: ChannelKickUser.create)
    ..aOM<ChannelFields>(3, _omitFieldNames ? '' : 'fields',
        subBuilder: ChannelFields.create)
    ..aOM<ChannelChangeRole>(4, _omitFieldNames ? '' : 'changeRole',
        subBuilder: ChannelChangeRole.create)
    ..aOM<ChannelChangeAudition>(5, _omitFieldNames ? '' : 'changeAudition',
        subBuilder: ChannelChangeAudition.create)
    ..aOM<ChannelGrantUpMic>(6, _omitFieldNames ? '' : 'grantUpMic',
        subBuilder: ChannelGrantUpMic.create)
    ..aOM<ChannelUpMic>(7, _omitFieldNames ? '' : 'upMic',
        subBuilder: ChannelUpMic.create)
    ..aOM<ChannelGrantDownMic>(8, _omitFieldNames ? '' : 'grantDownMic',
        subBuilder: ChannelGrantDownMic.create)
    ..aOM<ChannelDownMic>(9, _omitFieldNames ? '' : 'downMic',
        subBuilder: ChannelDownMic.create)
    ..aOM<ChannelManagerOpenMic>(10, _omitFieldNames ? '' : 'managerOpenMic',
        subBuilder: ChannelManagerOpenMic.create)
    ..aOM<ChannelOpenMic>(11, _omitFieldNames ? '' : 'openMic',
        subBuilder: ChannelOpenMic.create)
    ..aOM<ChannelManagerCloseMic>(12, _omitFieldNames ? '' : 'managerCloseMic',
        subBuilder: ChannelManagerCloseMic.create)
    ..aOM<ChannelCloseMic>(13, _omitFieldNames ? '' : 'closeMic',
        subBuilder: ChannelCloseMic.create)
    ..aOM<ChannelCancelQueueMic>(14, _omitFieldNames ? '' : 'cancelQueueMic',
        subBuilder: ChannelCancelQueueMic.create)
    ..aOM<ChannelChangeStatus>(15, _omitFieldNames ? '' : 'changeStatus',
        subBuilder: ChannelChangeStatus.create)
    ..aOM<ChannelForbidWord>(16, _omitFieldNames ? '' : 'forbidWord',
        subBuilder: ChannelForbidWord.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelUpdate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelUpdate copyWith(void Function(ChannelUpdate) updates) =>
      super.copyWith((message) => updates(message as ChannelUpdate))
          as ChannelUpdate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelUpdate create() => ChannelUpdate._();
  @$core.override
  ChannelUpdate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelUpdate>(create);
  static ChannelUpdate? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  ChannelUpdate_Operation whichOperation() =>
      _ChannelUpdate_OperationByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  @$pb.TagNumber(11)
  @$pb.TagNumber(12)
  @$pb.TagNumber(13)
  @$pb.TagNumber(14)
  @$pb.TagNumber(15)
  @$pb.TagNumber(16)
  void clearOperation() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  ChannelKickUser get kick => $_getN(1);
  @$pb.TagNumber(2)
  set kick(ChannelKickUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasKick() => $_has(1);
  @$pb.TagNumber(2)
  void clearKick() => $_clearField(2);
  @$pb.TagNumber(2)
  ChannelKickUser ensureKick() => $_ensure(1);

  @$pb.TagNumber(3)
  ChannelFields get fields => $_getN(2);
  @$pb.TagNumber(3)
  set fields(ChannelFields value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasFields() => $_has(2);
  @$pb.TagNumber(3)
  void clearFields() => $_clearField(3);
  @$pb.TagNumber(3)
  ChannelFields ensureFields() => $_ensure(2);

  @$pb.TagNumber(4)
  ChannelChangeRole get changeRole => $_getN(3);
  @$pb.TagNumber(4)
  set changeRole(ChannelChangeRole value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasChangeRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearChangeRole() => $_clearField(4);
  @$pb.TagNumber(4)
  ChannelChangeRole ensureChangeRole() => $_ensure(3);

  @$pb.TagNumber(5)
  ChannelChangeAudition get changeAudition => $_getN(4);
  @$pb.TagNumber(5)
  set changeAudition(ChannelChangeAudition value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasChangeAudition() => $_has(4);
  @$pb.TagNumber(5)
  void clearChangeAudition() => $_clearField(5);
  @$pb.TagNumber(5)
  ChannelChangeAudition ensureChangeAudition() => $_ensure(4);

  @$pb.TagNumber(6)
  ChannelGrantUpMic get grantUpMic => $_getN(5);
  @$pb.TagNumber(6)
  set grantUpMic(ChannelGrantUpMic value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasGrantUpMic() => $_has(5);
  @$pb.TagNumber(6)
  void clearGrantUpMic() => $_clearField(6);
  @$pb.TagNumber(6)
  ChannelGrantUpMic ensureGrantUpMic() => $_ensure(5);

  @$pb.TagNumber(7)
  ChannelUpMic get upMic => $_getN(6);
  @$pb.TagNumber(7)
  set upMic(ChannelUpMic value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasUpMic() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpMic() => $_clearField(7);
  @$pb.TagNumber(7)
  ChannelUpMic ensureUpMic() => $_ensure(6);

  @$pb.TagNumber(8)
  ChannelGrantDownMic get grantDownMic => $_getN(7);
  @$pb.TagNumber(8)
  set grantDownMic(ChannelGrantDownMic value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasGrantDownMic() => $_has(7);
  @$pb.TagNumber(8)
  void clearGrantDownMic() => $_clearField(8);
  @$pb.TagNumber(8)
  ChannelGrantDownMic ensureGrantDownMic() => $_ensure(7);

  @$pb.TagNumber(9)
  ChannelDownMic get downMic => $_getN(8);
  @$pb.TagNumber(9)
  set downMic(ChannelDownMic value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasDownMic() => $_has(8);
  @$pb.TagNumber(9)
  void clearDownMic() => $_clearField(9);
  @$pb.TagNumber(9)
  ChannelDownMic ensureDownMic() => $_ensure(8);

  @$pb.TagNumber(10)
  ChannelManagerOpenMic get managerOpenMic => $_getN(9);
  @$pb.TagNumber(10)
  set managerOpenMic(ChannelManagerOpenMic value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasManagerOpenMic() => $_has(9);
  @$pb.TagNumber(10)
  void clearManagerOpenMic() => $_clearField(10);
  @$pb.TagNumber(10)
  ChannelManagerOpenMic ensureManagerOpenMic() => $_ensure(9);

  @$pb.TagNumber(11)
  ChannelOpenMic get openMic => $_getN(10);
  @$pb.TagNumber(11)
  set openMic(ChannelOpenMic value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasOpenMic() => $_has(10);
  @$pb.TagNumber(11)
  void clearOpenMic() => $_clearField(11);
  @$pb.TagNumber(11)
  ChannelOpenMic ensureOpenMic() => $_ensure(10);

  @$pb.TagNumber(12)
  ChannelManagerCloseMic get managerCloseMic => $_getN(11);
  @$pb.TagNumber(12)
  set managerCloseMic(ChannelManagerCloseMic value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasManagerCloseMic() => $_has(11);
  @$pb.TagNumber(12)
  void clearManagerCloseMic() => $_clearField(12);
  @$pb.TagNumber(12)
  ChannelManagerCloseMic ensureManagerCloseMic() => $_ensure(11);

  @$pb.TagNumber(13)
  ChannelCloseMic get closeMic => $_getN(12);
  @$pb.TagNumber(13)
  set closeMic(ChannelCloseMic value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasCloseMic() => $_has(12);
  @$pb.TagNumber(13)
  void clearCloseMic() => $_clearField(13);
  @$pb.TagNumber(13)
  ChannelCloseMic ensureCloseMic() => $_ensure(12);

  @$pb.TagNumber(14)
  ChannelCancelQueueMic get cancelQueueMic => $_getN(13);
  @$pb.TagNumber(14)
  set cancelQueueMic(ChannelCancelQueueMic value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasCancelQueueMic() => $_has(13);
  @$pb.TagNumber(14)
  void clearCancelQueueMic() => $_clearField(14);
  @$pb.TagNumber(14)
  ChannelCancelQueueMic ensureCancelQueueMic() => $_ensure(13);

  @$pb.TagNumber(15)
  ChannelChangeStatus get changeStatus => $_getN(14);
  @$pb.TagNumber(15)
  set changeStatus(ChannelChangeStatus value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasChangeStatus() => $_has(14);
  @$pb.TagNumber(15)
  void clearChangeStatus() => $_clearField(15);
  @$pb.TagNumber(15)
  ChannelChangeStatus ensureChangeStatus() => $_ensure(14);

  @$pb.TagNumber(16)
  ChannelForbidWord get forbidWord => $_getN(15);
  @$pb.TagNumber(16)
  set forbidWord(ChannelForbidWord value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasForbidWord() => $_has(15);
  @$pb.TagNumber(16)
  void clearForbidWord() => $_clearField(16);
  @$pb.TagNumber(16)
  ChannelForbidWord ensureForbidWord() => $_ensure(15);
}

class ChannelChangeStatus extends $pb.GeneratedMessage {
  factory ChannelChangeStatus({
    RoomStatusEnum? status,
  }) {
    final result = create();
    if (status != null) result.status = status;
    return result;
  }

  ChannelChangeStatus._();

  factory ChannelChangeStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelChangeStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelChangeStatus',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aE<RoomStatusEnum>(1, _omitFieldNames ? '' : 'status',
        enumValues: RoomStatusEnum.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelChangeStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelChangeStatus copyWith(void Function(ChannelChangeStatus) updates) =>
      super.copyWith((message) => updates(message as ChannelChangeStatus))
          as ChannelChangeStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelChangeStatus create() => ChannelChangeStatus._();
  @$core.override
  ChannelChangeStatus createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelChangeStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelChangeStatus>(create);
  static ChannelChangeStatus? _defaultInstance;

  @$pb.TagNumber(1)
  RoomStatusEnum get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(RoomStatusEnum value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);
}

class ChannelCancelQueueMic extends $pb.GeneratedMessage {
  factory ChannelCancelQueueMic({
    QueueType? queueType,
  }) {
    final result = create();
    if (queueType != null) result.queueType = queueType;
    return result;
  }

  ChannelCancelQueueMic._();

  factory ChannelCancelQueueMic.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelCancelQueueMic.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelCancelQueueMic',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aE<QueueType>(1, _omitFieldNames ? '' : 'queueType',
        enumValues: QueueType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelCancelQueueMic clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelCancelQueueMic copyWith(
          void Function(ChannelCancelQueueMic) updates) =>
      super.copyWith((message) => updates(message as ChannelCancelQueueMic))
          as ChannelCancelQueueMic;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelCancelQueueMic create() => ChannelCancelQueueMic._();
  @$core.override
  ChannelCancelQueueMic createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelCancelQueueMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelCancelQueueMic>(create);
  static ChannelCancelQueueMic? _defaultInstance;

  @$pb.TagNumber(1)
  QueueType get queueType => $_getN(0);
  @$pb.TagNumber(1)
  set queueType(QueueType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasQueueType() => $_has(0);
  @$pb.TagNumber(1)
  void clearQueueType() => $_clearField(1);
}

class ChannelOpenMic extends $pb.GeneratedMessage {
  factory ChannelOpenMic({
    $fixnum.Int64? uid,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    return result;
  }

  ChannelOpenMic._();

  factory ChannelOpenMic.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelOpenMic.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelOpenMic',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelOpenMic clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelOpenMic copyWith(void Function(ChannelOpenMic) updates) =>
      super.copyWith((message) => updates(message as ChannelOpenMic))
          as ChannelOpenMic;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelOpenMic create() => ChannelOpenMic._();
  @$core.override
  ChannelOpenMic createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelOpenMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelOpenMic>(create);
  static ChannelOpenMic? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);
}

class ChannelCloseMic extends $pb.GeneratedMessage {
  factory ChannelCloseMic({
    $fixnum.Int64? uid,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    return result;
  }

  ChannelCloseMic._();

  factory ChannelCloseMic.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelCloseMic.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelCloseMic',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelCloseMic clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelCloseMic copyWith(void Function(ChannelCloseMic) updates) =>
      super.copyWith((message) => updates(message as ChannelCloseMic))
          as ChannelCloseMic;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelCloseMic create() => ChannelCloseMic._();
  @$core.override
  ChannelCloseMic createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelCloseMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelCloseMic>(create);
  static ChannelCloseMic? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);
}

class ChannelUpMic extends $pb.GeneratedMessage {
  factory ChannelUpMic({
    UpMicMode? mode,
    $core.int? position,
    QueueType? queueType,
    $core.bool? anonymousUp,
  }) {
    final result = create();
    if (mode != null) result.mode = mode;
    if (position != null) result.position = position;
    if (queueType != null) result.queueType = queueType;
    if (anonymousUp != null) result.anonymousUp = anonymousUp;
    return result;
  }

  ChannelUpMic._();

  factory ChannelUpMic.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelUpMic.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelUpMic',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aE<UpMicMode>(1, _omitFieldNames ? '' : 'mode',
        enumValues: UpMicMode.values)
    ..aI(2, _omitFieldNames ? '' : 'position', fieldType: $pb.PbFieldType.OU3)
    ..aE<QueueType>(3, _omitFieldNames ? '' : 'queueType',
        enumValues: QueueType.values)
    ..aOB(4, _omitFieldNames ? '' : 'anonymousUp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelUpMic clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelUpMic copyWith(void Function(ChannelUpMic) updates) =>
      super.copyWith((message) => updates(message as ChannelUpMic))
          as ChannelUpMic;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelUpMic create() => ChannelUpMic._();
  @$core.override
  ChannelUpMic createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelUpMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelUpMic>(create);
  static ChannelUpMic? _defaultInstance;

  @$pb.TagNumber(1)
  UpMicMode get mode => $_getN(0);
  @$pb.TagNumber(1)
  set mode(UpMicMode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearMode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get position => $_getIZ(1);
  @$pb.TagNumber(2)
  set position($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => $_clearField(2);

  @$pb.TagNumber(3)
  QueueType get queueType => $_getN(2);
  @$pb.TagNumber(3)
  set queueType(QueueType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasQueueType() => $_has(2);
  @$pb.TagNumber(3)
  void clearQueueType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get anonymousUp => $_getBF(3);
  @$pb.TagNumber(4)
  set anonymousUp($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAnonymousUp() => $_has(3);
  @$pb.TagNumber(4)
  void clearAnonymousUp() => $_clearField(4);
}

class ChannelDownMic extends $pb.GeneratedMessage {
  factory ChannelDownMic() => create();

  ChannelDownMic._();

  factory ChannelDownMic.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelDownMic.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelDownMic',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelDownMic clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelDownMic copyWith(void Function(ChannelDownMic) updates) =>
      super.copyWith((message) => updates(message as ChannelDownMic))
          as ChannelDownMic;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelDownMic create() => ChannelDownMic._();
  @$core.override
  ChannelDownMic createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelDownMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelDownMic>(create);
  static ChannelDownMic? _defaultInstance;
}

class ChannelGrantDownMic extends $pb.GeneratedMessage {
  factory ChannelGrantDownMic({
    $core.int? position,
    $fixnum.Int64? uid,
  }) {
    final result = create();
    if (position != null) result.position = position;
    if (uid != null) result.uid = uid;
    return result;
  }

  ChannelGrantDownMic._();

  factory ChannelGrantDownMic.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelGrantDownMic.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelGrantDownMic',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'position', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelGrantDownMic clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelGrantDownMic copyWith(void Function(ChannelGrantDownMic) updates) =>
      super.copyWith((message) => updates(message as ChannelGrantDownMic))
          as ChannelGrantDownMic;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelGrantDownMic create() => ChannelGrantDownMic._();
  @$core.override
  ChannelGrantDownMic createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelGrantDownMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelGrantDownMic>(create);
  static ChannelGrantDownMic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);
}

class ChannelKickUser extends $pb.GeneratedMessage {
  factory ChannelKickUser({
    $fixnum.Int64? uid,
    $core.int? leaveTimeInSeconds,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (leaveTimeInSeconds != null)
      result.leaveTimeInSeconds = leaveTimeInSeconds;
    return result;
  }

  ChannelKickUser._();

  factory ChannelKickUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelKickUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelKickUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(2, _omitFieldNames ? '' : 'leaveTimeInSeconds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelKickUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelKickUser copyWith(void Function(ChannelKickUser) updates) =>
      super.copyWith((message) => updates(message as ChannelKickUser))
          as ChannelKickUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelKickUser create() => ChannelKickUser._();
  @$core.override
  ChannelKickUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelKickUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelKickUser>(create);
  static ChannelKickUser? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get leaveTimeInSeconds => $_getIZ(1);
  @$pb.TagNumber(2)
  set leaveTimeInSeconds($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLeaveTimeInSeconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeaveTimeInSeconds() => $_clearField(2);
}

class ChannelForbidWord extends $pb.GeneratedMessage {
  factory ChannelForbidWord({
    $fixnum.Int64? uid,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    return result;
  }

  ChannelForbidWord._();

  factory ChannelForbidWord.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelForbidWord.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelForbidWord',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelForbidWord clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelForbidWord copyWith(void Function(ChannelForbidWord) updates) =>
      super.copyWith((message) => updates(message as ChannelForbidWord))
          as ChannelForbidWord;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelForbidWord create() => ChannelForbidWord._();
  @$core.override
  ChannelForbidWord createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelForbidWord getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelForbidWord>(create);
  static ChannelForbidWord? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);
}

class ChannelGrantUpMic extends $pb.GeneratedMessage {
  factory ChannelGrantUpMic({
    $fixnum.Int64? uid,
    $core.int? position,
    $core.bool? anonymousUp,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (position != null) result.position = position;
    if (anonymousUp != null) result.anonymousUp = anonymousUp;
    return result;
  }

  ChannelGrantUpMic._();

  factory ChannelGrantUpMic.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelGrantUpMic.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelGrantUpMic',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(2, _omitFieldNames ? '' : 'position', fieldType: $pb.PbFieldType.OU3)
    ..aOB(3, _omitFieldNames ? '' : 'anonymousUp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelGrantUpMic clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelGrantUpMic copyWith(void Function(ChannelGrantUpMic) updates) =>
      super.copyWith((message) => updates(message as ChannelGrantUpMic))
          as ChannelGrantUpMic;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelGrantUpMic create() => ChannelGrantUpMic._();
  @$core.override
  ChannelGrantUpMic createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelGrantUpMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelGrantUpMic>(create);
  static ChannelGrantUpMic? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get position => $_getIZ(1);
  @$pb.TagNumber(2)
  set position($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get anonymousUp => $_getBF(2);
  @$pb.TagNumber(3)
  set anonymousUp($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAnonymousUp() => $_has(2);
  @$pb.TagNumber(3)
  void clearAnonymousUp() => $_clearField(3);
}

class ChannelRequestManage extends $pb.GeneratedMessage {
  factory ChannelRequestManage({
    $core.int? position,
  }) {
    final result = create();
    if (position != null) result.position = position;
    return result;
  }

  ChannelRequestManage._();

  factory ChannelRequestManage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelRequestManage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelRequestManage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'position', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelRequestManage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelRequestManage copyWith(void Function(ChannelRequestManage) updates) =>
      super.copyWith((message) => updates(message as ChannelRequestManage))
          as ChannelRequestManage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelRequestManage create() => ChannelRequestManage._();
  @$core.override
  ChannelRequestManage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelRequestManage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelRequestManage>(create);
  static ChannelRequestManage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => $_clearField(1);
}

class ChannelRequestPublish extends $pb.GeneratedMessage {
  factory ChannelRequestPublish({
    $core.int? position,
  }) {
    final result = create();
    if (position != null) result.position = position;
    return result;
  }

  ChannelRequestPublish._();

  factory ChannelRequestPublish.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelRequestPublish.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelRequestPublish',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'position', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelRequestPublish clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelRequestPublish copyWith(
          void Function(ChannelRequestPublish) updates) =>
      super.copyWith((message) => updates(message as ChannelRequestPublish))
          as ChannelRequestPublish;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelRequestPublish create() => ChannelRequestPublish._();
  @$core.override
  ChannelRequestPublish createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelRequestPublish getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelRequestPublish>(create);
  static ChannelRequestPublish? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => $_clearField(1);
}

class ChannelRequestQueue extends $pb.GeneratedMessage {
  factory ChannelRequestQueue() => create();

  ChannelRequestQueue._();

  factory ChannelRequestQueue.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelRequestQueue.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelRequestQueue',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelRequestQueue clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelRequestQueue copyWith(void Function(ChannelRequestQueue) updates) =>
      super.copyWith((message) => updates(message as ChannelRequestQueue))
          as ChannelRequestQueue;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelRequestQueue create() => ChannelRequestQueue._();
  @$core.override
  ChannelRequestQueue createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelRequestQueue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelRequestQueue>(create);
  static ChannelRequestQueue? _defaultInstance;
}

class ChannelLeaveStage extends $pb.GeneratedMessage {
  factory ChannelLeaveStage({
    $fixnum.Int64? uid,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    return result;
  }

  ChannelLeaveStage._();

  factory ChannelLeaveStage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelLeaveStage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelLeaveStage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelLeaveStage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelLeaveStage copyWith(void Function(ChannelLeaveStage) updates) =>
      super.copyWith((message) => updates(message as ChannelLeaveStage))
          as ChannelLeaveStage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelLeaveStage create() => ChannelLeaveStage._();
  @$core.override
  ChannelLeaveStage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelLeaveStage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelLeaveStage>(create);
  static ChannelLeaveStage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);
}

class ChannelFields extends $pb.GeneratedMessage {
  factory ChannelFields({
    $core.bool? freePub,
    $core.String? title,
    $core.String? password,
    $core.bool? isPrivacy,
    $core.String? theme,
    $core.String? notice,
    $fixnum.Int64? backgroundId,
    $core.bool? giftValueCountSwitch,
    ChannelLabel? label,
    $core.bool? freePublicChat,
    MicLayoutEnum? layout,
    $core.bool? openRoomOwnerShow,
  }) {
    final result = create();
    if (freePub != null) result.freePub = freePub;
    if (title != null) result.title = title;
    if (password != null) result.password = password;
    if (isPrivacy != null) result.isPrivacy = isPrivacy;
    if (theme != null) result.theme = theme;
    if (notice != null) result.notice = notice;
    if (backgroundId != null) result.backgroundId = backgroundId;
    if (giftValueCountSwitch != null)
      result.giftValueCountSwitch = giftValueCountSwitch;
    if (label != null) result.label = label;
    if (freePublicChat != null) result.freePublicChat = freePublicChat;
    if (layout != null) result.layout = layout;
    if (openRoomOwnerShow != null) result.openRoomOwnerShow = openRoomOwnerShow;
    return result;
  }

  ChannelFields._();

  factory ChannelFields.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelFields.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelFields',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'freePub')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..aOB(4, _omitFieldNames ? '' : 'isPrivacy')
    ..aOS(5, _omitFieldNames ? '' : 'theme')
    ..aOS(6, _omitFieldNames ? '' : 'notice')
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'backgroundId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(8, _omitFieldNames ? '' : 'giftValueCountSwitch')
    ..aE<ChannelLabel>(9, _omitFieldNames ? '' : 'label',
        enumValues: ChannelLabel.values)
    ..aOB(10, _omitFieldNames ? '' : 'freePublicChat')
    ..aE<MicLayoutEnum>(11, _omitFieldNames ? '' : 'layout',
        enumValues: MicLayoutEnum.values)
    ..aOB(12, _omitFieldNames ? '' : 'openRoomOwnerShow')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelFields clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelFields copyWith(void Function(ChannelFields) updates) =>
      super.copyWith((message) => updates(message as ChannelFields))
          as ChannelFields;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelFields create() => ChannelFields._();
  @$core.override
  ChannelFields createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelFields getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelFields>(create);
  static ChannelFields? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get freePub => $_getBF(0);
  @$pb.TagNumber(1)
  set freePub($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFreePub() => $_has(0);
  @$pb.TagNumber(1)
  void clearFreePub() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isPrivacy => $_getBF(3);
  @$pb.TagNumber(4)
  set isPrivacy($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsPrivacy() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsPrivacy() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get theme => $_getSZ(4);
  @$pb.TagNumber(5)
  set theme($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTheme() => $_has(4);
  @$pb.TagNumber(5)
  void clearTheme() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get notice => $_getSZ(5);
  @$pb.TagNumber(6)
  set notice($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNotice() => $_has(5);
  @$pb.TagNumber(6)
  void clearNotice() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get backgroundId => $_getI64(6);
  @$pb.TagNumber(7)
  set backgroundId($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBackgroundId() => $_has(6);
  @$pb.TagNumber(7)
  void clearBackgroundId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get giftValueCountSwitch => $_getBF(7);
  @$pb.TagNumber(8)
  set giftValueCountSwitch($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasGiftValueCountSwitch() => $_has(7);
  @$pb.TagNumber(8)
  void clearGiftValueCountSwitch() => $_clearField(8);

  @$pb.TagNumber(9)
  ChannelLabel get label => $_getN(8);
  @$pb.TagNumber(9)
  set label(ChannelLabel value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasLabel() => $_has(8);
  @$pb.TagNumber(9)
  void clearLabel() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get freePublicChat => $_getBF(9);
  @$pb.TagNumber(10)
  set freePublicChat($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasFreePublicChat() => $_has(9);
  @$pb.TagNumber(10)
  void clearFreePublicChat() => $_clearField(10);

  @$pb.TagNumber(11)
  MicLayoutEnum get layout => $_getN(10);
  @$pb.TagNumber(11)
  set layout(MicLayoutEnum value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasLayout() => $_has(10);
  @$pb.TagNumber(11)
  void clearLayout() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get openRoomOwnerShow => $_getBF(11);
  @$pb.TagNumber(12)
  set openRoomOwnerShow($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasOpenRoomOwnerShow() => $_has(11);
  @$pb.TagNumber(12)
  void clearOpenRoomOwnerShow() => $_clearField(12);
}

class SongDetail extends $pb.GeneratedMessage {
  factory SongDetail({
    $fixnum.Int64? uid,
    $core.String? songCode,
    $core.String? singer,
    $core.int? durationInSeconds,
    $core.String? coverUrl,
    $core.int? index,
    $core.String? name,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (songCode != null) result.songCode = songCode;
    if (singer != null) result.singer = singer;
    if (durationInSeconds != null) result.durationInSeconds = durationInSeconds;
    if (coverUrl != null) result.coverUrl = coverUrl;
    if (index != null) result.index = index;
    if (name != null) result.name = name;
    return result;
  }

  SongDetail._();

  factory SongDetail.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SongDetail.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SongDetail',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'songCode')
    ..aOS(3, _omitFieldNames ? '' : 'singer')
    ..aI(4, _omitFieldNames ? '' : 'durationInSeconds')
    ..aOS(5, _omitFieldNames ? '' : 'coverUrl')
    ..aI(6, _omitFieldNames ? '' : 'index')
    ..aOS(7, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SongDetail clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SongDetail copyWith(void Function(SongDetail) updates) =>
      super.copyWith((message) => updates(message as SongDetail)) as SongDetail;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SongDetail create() => SongDetail._();
  @$core.override
  SongDetail createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SongDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SongDetail>(create);
  static SongDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get songCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set songCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSongCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearSongCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get singer => $_getSZ(2);
  @$pb.TagNumber(3)
  set singer($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSinger() => $_has(2);
  @$pb.TagNumber(3)
  void clearSinger() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get durationInSeconds => $_getIZ(3);
  @$pb.TagNumber(4)
  set durationInSeconds($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDurationInSeconds() => $_has(3);
  @$pb.TagNumber(4)
  void clearDurationInSeconds() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get coverUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set coverUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCoverUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearCoverUrl() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get index => $_getIZ(5);
  @$pb.TagNumber(6)
  set index($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIndex() => $_has(5);
  @$pb.TagNumber(6)
  void clearIndex() => $_clearField(6);

  /// 客户端有其他信息补充下来
  @$pb.TagNumber(7)
  $core.String get name => $_getSZ(6);
  @$pb.TagNumber(7)
  set name($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasName() => $_has(6);
  @$pb.TagNumber(7)
  void clearName() => $_clearField(7);
}

class ChannelChangeRole extends $pb.GeneratedMessage {
  factory ChannelChangeRole({
    $fixnum.Int64? uid,
    RtcUserRole? role,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (role != null) result.role = role;
    return result;
  }

  ChannelChangeRole._();

  factory ChannelChangeRole.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelChangeRole.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelChangeRole',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aE<RtcUserRole>(2, _omitFieldNames ? '' : 'role',
        enumValues: RtcUserRole.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelChangeRole clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelChangeRole copyWith(void Function(ChannelChangeRole) updates) =>
      super.copyWith((message) => updates(message as ChannelChangeRole))
          as ChannelChangeRole;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelChangeRole create() => ChannelChangeRole._();
  @$core.override
  ChannelChangeRole createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelChangeRole getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelChangeRole>(create);
  static ChannelChangeRole? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  RtcUserRole get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(RtcUserRole value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => $_clearField(2);
}

class ChannelManagerCloseMic extends $pb.GeneratedMessage {
  factory ChannelManagerCloseMic({
    $fixnum.Int64? uid,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    return result;
  }

  ChannelManagerCloseMic._();

  factory ChannelManagerCloseMic.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelManagerCloseMic.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelManagerCloseMic',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelManagerCloseMic clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelManagerCloseMic copyWith(
          void Function(ChannelManagerCloseMic) updates) =>
      super.copyWith((message) => updates(message as ChannelManagerCloseMic))
          as ChannelManagerCloseMic;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelManagerCloseMic create() => ChannelManagerCloseMic._();
  @$core.override
  ChannelManagerCloseMic createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelManagerCloseMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelManagerCloseMic>(create);
  static ChannelManagerCloseMic? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);
}

class ChannelManagerOpenMic extends $pb.GeneratedMessage {
  factory ChannelManagerOpenMic({
    $fixnum.Int64? uid,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    return result;
  }

  ChannelManagerOpenMic._();

  factory ChannelManagerOpenMic.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelManagerOpenMic.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelManagerOpenMic',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelManagerOpenMic clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelManagerOpenMic copyWith(
          void Function(ChannelManagerOpenMic) updates) =>
      super.copyWith((message) => updates(message as ChannelManagerOpenMic))
          as ChannelManagerOpenMic;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelManagerOpenMic create() => ChannelManagerOpenMic._();
  @$core.override
  ChannelManagerOpenMic createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelManagerOpenMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelManagerOpenMic>(create);
  static ChannelManagerOpenMic? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);
}

class ChannelChangeAudition extends $pb.GeneratedMessage {
  factory ChannelChangeAudition({
    $fixnum.Int64? uid,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    return result;
  }

  ChannelChangeAudition._();

  factory ChannelChangeAudition.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelChangeAudition.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelChangeAudition',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelChangeAudition clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelChangeAudition copyWith(
          void Function(ChannelChangeAudition) updates) =>
      super.copyWith((message) => updates(message as ChannelChangeAudition))
          as ChannelChangeAudition;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelChangeAudition create() => ChannelChangeAudition._();
  @$core.override
  ChannelChangeAudition createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelChangeAudition getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelChangeAudition>(create);
  static ChannelChangeAudition? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);
}

class ChannelUpdateRsp extends $pb.GeneratedMessage {
  factory ChannelUpdateRsp({
    $core.bool? success,
    $core.String? message,
    Channel? info,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (info != null) result.info = info;
    return result;
  }

  ChannelUpdateRsp._();

  factory ChannelUpdateRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelUpdateRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelUpdateRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<Channel>(3, _omitFieldNames ? '' : 'info', subBuilder: Channel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelUpdateRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelUpdateRsp copyWith(void Function(ChannelUpdateRsp) updates) =>
      super.copyWith((message) => updates(message as ChannelUpdateRsp))
          as ChannelUpdateRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelUpdateRsp create() => ChannelUpdateRsp._();
  @$core.override
  ChannelUpdateRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelUpdateRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelUpdateRsp>(create);
  static ChannelUpdateRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  Channel get info => $_getN(2);
  @$pb.TagNumber(3)
  set info(Channel value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  Channel ensureInfo() => $_ensure(2);
}

class ChannelUserListRsp extends $pb.GeneratedMessage {
  factory ChannelUserListRsp({
    $core.bool? success,
    $core.String? message,
    $core.int? offset,
    $core.int? count,
    $core.int? total,
    $core.Iterable<SimpleChannelUser>? users,
    SimpleChannelUser? myself,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (offset != null) result.offset = offset;
    if (count != null) result.count = count;
    if (total != null) result.total = total;
    if (users != null) result.users.addAll(users);
    if (myself != null) result.myself = myself;
    return result;
  }

  ChannelUserListRsp._();

  factory ChannelUserListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelUserListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelUserListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aI(3, _omitFieldNames ? '' : 'offset', fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'total', fieldType: $pb.PbFieldType.OU3)
    ..pPM<SimpleChannelUser>(6, _omitFieldNames ? '' : 'users',
        subBuilder: SimpleChannelUser.create)
    ..aOM<SimpleChannelUser>(7, _omitFieldNames ? '' : 'myself',
        subBuilder: SimpleChannelUser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelUserListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelUserListRsp copyWith(void Function(ChannelUserListRsp) updates) =>
      super.copyWith((message) => updates(message as ChannelUserListRsp))
          as ChannelUserListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelUserListRsp create() => ChannelUserListRsp._();
  @$core.override
  ChannelUserListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelUserListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelUserListRsp>(create);
  static ChannelUserListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get total => $_getIZ(4);
  @$pb.TagNumber(5)
  set total($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotal() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotal() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<SimpleChannelUser> get users => $_getList(5);

  @$pb.TagNumber(7)
  SimpleChannelUser get myself => $_getN(6);
  @$pb.TagNumber(7)
  set myself(SimpleChannelUser value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasMyself() => $_has(6);
  @$pb.TagNumber(7)
  void clearMyself() => $_clearField(7);
  @$pb.TagNumber(7)
  SimpleChannelUser ensureMyself() => $_ensure(6);
}

class ProgramInfo extends $pb.GeneratedMessage {
  factory ProgramInfo({
    $core.String? startTime,
    $core.int? startTimeSeconds,
    $core.String? topic,
    $fixnum.Int64? programId,
    $core.String? desc,
    $core.String? date,
    $fixnum.Int64? dateStamp,
  }) {
    final result = create();
    if (startTime != null) result.startTime = startTime;
    if (startTimeSeconds != null) result.startTimeSeconds = startTimeSeconds;
    if (topic != null) result.topic = topic;
    if (programId != null) result.programId = programId;
    if (desc != null) result.desc = desc;
    if (date != null) result.date = date;
    if (dateStamp != null) result.dateStamp = dateStamp;
    return result;
  }

  ProgramInfo._();

  factory ProgramInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProgramInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProgramInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'startTime')
    ..aI(2, _omitFieldNames ? '' : 'startTimeSeconds',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'topic')
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'programId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, _omitFieldNames ? '' : 'desc')
    ..aOS(6, _omitFieldNames ? '' : 'date')
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'dateStamp', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProgramInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProgramInfo copyWith(void Function(ProgramInfo) updates) =>
      super.copyWith((message) => updates(message as ProgramInfo))
          as ProgramInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProgramInfo create() => ProgramInfo._();
  @$core.override
  ProgramInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProgramInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProgramInfo>(create);
  static ProgramInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get startTime => $_getSZ(0);
  @$pb.TagNumber(1)
  set startTime($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStartTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartTime() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get startTimeSeconds => $_getIZ(1);
  @$pb.TagNumber(2)
  set startTimeSeconds($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartTimeSeconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartTimeSeconds() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get topic => $_getSZ(2);
  @$pb.TagNumber(3)
  set topic($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTopic() => $_has(2);
  @$pb.TagNumber(3)
  void clearTopic() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get programId => $_getI64(3);
  @$pb.TagNumber(4)
  set programId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasProgramId() => $_has(3);
  @$pb.TagNumber(4)
  void clearProgramId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get desc => $_getSZ(4);
  @$pb.TagNumber(5)
  set desc($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDesc() => $_has(4);
  @$pb.TagNumber(5)
  void clearDesc() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get date => $_getSZ(5);
  @$pb.TagNumber(6)
  set date($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearDate() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get dateStamp => $_getI64(6);
  @$pb.TagNumber(7)
  set dateStamp($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDateStamp() => $_has(6);
  @$pb.TagNumber(7)
  void clearDateStamp() => $_clearField(7);
}

class SimpleRankItem extends $pb.GeneratedMessage {
  factory SimpleRankItem({
    $fixnum.Int64? userId,
    $core.String? gender,
    $core.String? nickname,
    $core.String? avatar,
    $fixnum.Int64? contributionValue,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (gender != null) result.gender = gender;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    if (contributionValue != null) result.contributionValue = contributionValue;
    return result;
  }

  SimpleRankItem._();

  factory SimpleRankItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SimpleRankItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SimpleRankItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'gender')
    ..aOS(3, _omitFieldNames ? '' : 'nickname')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'contributionValue', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleRankItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleRankItem copyWith(void Function(SimpleRankItem) updates) =>
      super.copyWith((message) => updates(message as SimpleRankItem))
          as SimpleRankItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SimpleRankItem create() => SimpleRankItem._();
  @$core.override
  SimpleRankItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SimpleRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SimpleRankItem>(create);
  static SimpleRankItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

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

  @$pb.TagNumber(5)
  $fixnum.Int64 get contributionValue => $_getI64(4);
  @$pb.TagNumber(5)
  set contributionValue($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasContributionValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearContributionValue() => $_clearField(5);
}

enum SideBar_Side { name, notSet }

class SideBar extends $pb.GeneratedMessage {
  factory SideBar({
    $core.String? name,
    $core.Iterable<Channel>? channelList,
    $1.Page? page,
    $core.String? snapshotId,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (channelList != null) result.channelList.addAll(channelList);
    if (page != null) result.page = page;
    if (snapshotId != null) result.snapshotId = snapshotId;
    return result;
  }

  SideBar._();

  factory SideBar.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SideBar.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SideBar_Side> _SideBar_SideByTag = {
    2: SideBar_Side.name,
    0: SideBar_Side.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SideBar',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..oo(0, [2])
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..pPM<Channel>(3, _omitFieldNames ? '' : 'channelList',
        subBuilder: Channel.create)
    ..aOM<$1.Page>(4, _omitFieldNames ? '' : 'page', subBuilder: $1.Page.create)
    ..aOS(5, _omitFieldNames ? '' : 'snapshotId', protoName: 'snapshotId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SideBar clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SideBar copyWith(void Function(SideBar) updates) =>
      super.copyWith((message) => updates(message as SideBar)) as SideBar;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SideBar create() => SideBar._();
  @$core.override
  SideBar createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SideBar getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SideBar>(create);
  static SideBar? _defaultInstance;

  @$pb.TagNumber(2)
  SideBar_Side whichSide() => _SideBar_SideByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  void clearSide() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<Channel> get channelList => $_getList(1);

  @$pb.TagNumber(4)
  $1.Page get page => $_getN(2);
  @$pb.TagNumber(4)
  set page($1.Page value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(4)
  void clearPage() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Page ensurePage() => $_ensure(2);

  @$pb.TagNumber(5)
  $core.String get snapshotId => $_getSZ(3);
  @$pb.TagNumber(5)
  set snapshotId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(5)
  $core.bool hasSnapshotId() => $_has(3);
  @$pb.TagNumber(5)
  void clearSnapshotId() => $_clearField(5);
}

class RtcAllSidebarRsp extends $pb.GeneratedMessage {
  factory RtcAllSidebarRsp({
    $core.bool? success,
    $core.String? message,
    $core.Iterable<SideBar>? sidebarList,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (sidebarList != null) result.sidebarList.addAll(sidebarList);
    return result;
  }

  RtcAllSidebarRsp._();

  factory RtcAllSidebarRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RtcAllSidebarRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RtcAllSidebarRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..pPM<SideBar>(3, _omitFieldNames ? '' : 'sidebarList',
        subBuilder: SideBar.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RtcAllSidebarRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RtcAllSidebarRsp copyWith(void Function(RtcAllSidebarRsp) updates) =>
      super.copyWith((message) => updates(message as RtcAllSidebarRsp))
          as RtcAllSidebarRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RtcAllSidebarRsp create() => RtcAllSidebarRsp._();
  @$core.override
  RtcAllSidebarRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RtcAllSidebarRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RtcAllSidebarRsp>(create);
  static RtcAllSidebarRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<SideBar> get sidebarList => $_getList(2);
}

class RtcSidebarRsp extends $pb.GeneratedMessage {
  factory RtcSidebarRsp({
    $core.bool? success,
    $core.String? message,
    SideBar? sidebar,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (sidebar != null) result.sidebar = sidebar;
    return result;
  }

  RtcSidebarRsp._();

  factory RtcSidebarRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RtcSidebarRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RtcSidebarRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<SideBar>(3, _omitFieldNames ? '' : 'sidebar',
        subBuilder: SideBar.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RtcSidebarRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RtcSidebarRsp copyWith(void Function(RtcSidebarRsp) updates) =>
      super.copyWith((message) => updates(message as RtcSidebarRsp))
          as RtcSidebarRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RtcSidebarRsp create() => RtcSidebarRsp._();
  @$core.override
  RtcSidebarRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RtcSidebarRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RtcSidebarRsp>(create);
  static RtcSidebarRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  SideBar get sidebar => $_getN(2);
  @$pb.TagNumber(3)
  set sidebar(SideBar value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSidebar() => $_has(2);
  @$pb.TagNumber(3)
  void clearSidebar() => $_clearField(3);
  @$pb.TagNumber(3)
  SideBar ensureSidebar() => $_ensure(2);
}

class RtcTemplateBgUrl extends $pb.GeneratedMessage {
  factory RtcTemplateBgUrl({
    $fixnum.Int64? id,
    $core.String? bgUrl,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (bgUrl != null) result.bgUrl = bgUrl;
    return result;
  }

  RtcTemplateBgUrl._();

  factory RtcTemplateBgUrl.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RtcTemplateBgUrl.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RtcTemplateBgUrl',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'bgUrl', protoName: 'bgUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RtcTemplateBgUrl clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RtcTemplateBgUrl copyWith(void Function(RtcTemplateBgUrl) updates) =>
      super.copyWith((message) => updates(message as RtcTemplateBgUrl))
          as RtcTemplateBgUrl;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RtcTemplateBgUrl create() => RtcTemplateBgUrl._();
  @$core.override
  RtcTemplateBgUrl createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RtcTemplateBgUrl getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RtcTemplateBgUrl>(create);
  static RtcTemplateBgUrl? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get bgUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set bgUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBgUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearBgUrl() => $_clearField(2);
}

class RtcTemplateBgUrlListRsp extends $pb.GeneratedMessage {
  factory RtcTemplateBgUrlListRsp({
    $core.bool? success,
    $core.String? message,
    $core.Iterable<RtcTemplateBgUrl>? urlList,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (urlList != null) result.urlList.addAll(urlList);
    return result;
  }

  RtcTemplateBgUrlListRsp._();

  factory RtcTemplateBgUrlListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RtcTemplateBgUrlListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RtcTemplateBgUrlListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..pPM<RtcTemplateBgUrl>(3, _omitFieldNames ? '' : 'urlList',
        protoName: 'urlList', subBuilder: RtcTemplateBgUrl.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RtcTemplateBgUrlListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RtcTemplateBgUrlListRsp copyWith(
          void Function(RtcTemplateBgUrlListRsp) updates) =>
      super.copyWith((message) => updates(message as RtcTemplateBgUrlListRsp))
          as RtcTemplateBgUrlListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RtcTemplateBgUrlListRsp create() => RtcTemplateBgUrlListRsp._();
  @$core.override
  RtcTemplateBgUrlListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RtcTemplateBgUrlListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RtcTemplateBgUrlListRsp>(create);
  static RtcTemplateBgUrlListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<RtcTemplateBgUrl> get urlList => $_getList(2);
}

class RtcTokenRsp extends $pb.GeneratedMessage {
  factory RtcTokenRsp({
    $core.String? token,
  }) {
    final result = create();
    if (token != null) result.token = token;
    return result;
  }

  RtcTokenRsp._();

  factory RtcTokenRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RtcTokenRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RtcTokenRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RtcTokenRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RtcTokenRsp copyWith(void Function(RtcTokenRsp) updates) =>
      super.copyWith((message) => updates(message as RtcTokenRsp))
          as RtcTokenRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RtcTokenRsp create() => RtcTokenRsp._();
  @$core.override
  RtcTokenRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RtcTokenRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RtcTokenRsp>(create);
  static RtcTokenRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);
}

class RtcDispatchOrderReq extends $pb.GeneratedMessage {
  factory RtcDispatchOrderReq({
    $fixnum.Int64? channelId,
    $core.String? gender,
    $core.int? count,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    if (gender != null) result.gender = gender;
    if (count != null) result.count = count;
    return result;
  }

  RtcDispatchOrderReq._();

  factory RtcDispatchOrderReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RtcDispatchOrderReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RtcDispatchOrderReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'gender')
    ..aI(3, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RtcDispatchOrderReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RtcDispatchOrderReq copyWith(void Function(RtcDispatchOrderReq) updates) =>
      super.copyWith((message) => updates(message as RtcDispatchOrderReq))
          as RtcDispatchOrderReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RtcDispatchOrderReq create() => RtcDispatchOrderReq._();
  @$core.override
  RtcDispatchOrderReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RtcDispatchOrderReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RtcDispatchOrderReq>(create);
  static RtcDispatchOrderReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(1)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get gender => $_getSZ(1);
  @$pb.TagNumber(2)
  set gender($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGender() => $_has(1);
  @$pb.TagNumber(2)
  void clearGender() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => $_clearField(3);
}

class JoinChannelReq extends $pb.GeneratedMessage {
  factory JoinChannelReq({
    $fixnum.Int64? channelId,
    JoinSource? joinSource,
    $fixnum.Int64? followUid,
    $core.String? password,
    $core.int? reconnect,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    if (joinSource != null) result.joinSource = joinSource;
    if (followUid != null) result.followUid = followUid;
    if (password != null) result.password = password;
    if (reconnect != null) result.reconnect = reconnect;
    return result;
  }

  JoinChannelReq._();

  factory JoinChannelReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JoinChannelReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JoinChannelReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<JoinSource>(2, _omitFieldNames ? '' : 'joinSource',
        enumValues: JoinSource.values)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'followUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'password')
    ..aI(5, _omitFieldNames ? '' : 'reconnect', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinChannelReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinChannelReq copyWith(void Function(JoinChannelReq) updates) =>
      super.copyWith((message) => updates(message as JoinChannelReq))
          as JoinChannelReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinChannelReq create() => JoinChannelReq._();
  @$core.override
  JoinChannelReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JoinChannelReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinChannelReq>(create);
  static JoinChannelReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(1)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => $_clearField(1);

  @$pb.TagNumber(2)
  JoinSource get joinSource => $_getN(1);
  @$pb.TagNumber(2)
  set joinSource(JoinSource value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasJoinSource() => $_has(1);
  @$pb.TagNumber(2)
  void clearJoinSource() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get followUid => $_getI64(2);
  @$pb.TagNumber(3)
  set followUid($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFollowUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearFollowUid() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get password => $_getSZ(3);
  @$pb.TagNumber(4)
  set password($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPassword() => $_has(3);
  @$pb.TagNumber(4)
  void clearPassword() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get reconnect => $_getIZ(4);
  @$pb.TagNumber(5)
  set reconnect($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReconnect() => $_has(4);
  @$pb.TagNumber(5)
  void clearReconnect() => $_clearField(5);
}

class LeaveChannelReq extends $pb.GeneratedMessage {
  factory LeaveChannelReq({
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  LeaveChannelReq._();

  factory LeaveChannelReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LeaveChannelReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LeaveChannelReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LeaveChannelReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LeaveChannelReq copyWith(void Function(LeaveChannelReq) updates) =>
      super.copyWith((message) => updates(message as LeaveChannelReq))
          as LeaveChannelReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaveChannelReq create() => LeaveChannelReq._();
  @$core.override
  LeaveChannelReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LeaveChannelReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeaveChannelReq>(create);
  static LeaveChannelReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(1)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => $_clearField(1);
}

enum JoinChannelRsp_Ext { gameInfo, notSet }

class JoinChannelRsp extends $pb.GeneratedMessage {
  factory JoinChannelRsp({
    $core.String? token,
    Channel? channel,
    $core.String? rtmToken,
    $core.String? wsUrl,
    GameInfo? gameInfo,
    $core.int? rtcType,
    $core.bool? autoMic,
    $core.int? position,
    RtcConfig? rtcConfig,
    $core.int? openMic,
    $core.int? micCountDown,
    $core.bool? showHeartfeltWords,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (channel != null) result.channel = channel;
    if (rtmToken != null) result.rtmToken = rtmToken;
    if (wsUrl != null) result.wsUrl = wsUrl;
    if (gameInfo != null) result.gameInfo = gameInfo;
    if (rtcType != null) result.rtcType = rtcType;
    if (autoMic != null) result.autoMic = autoMic;
    if (position != null) result.position = position;
    if (rtcConfig != null) result.rtcConfig = rtcConfig;
    if (openMic != null) result.openMic = openMic;
    if (micCountDown != null) result.micCountDown = micCountDown;
    if (showHeartfeltWords != null)
      result.showHeartfeltWords = showHeartfeltWords;
    return result;
  }

  JoinChannelRsp._();

  factory JoinChannelRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JoinChannelRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, JoinChannelRsp_Ext>
      _JoinChannelRsp_ExtByTag = {
    5: JoinChannelRsp_Ext.gameInfo,
    0: JoinChannelRsp_Ext.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JoinChannelRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..oo(0, [5])
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOM<Channel>(2, _omitFieldNames ? '' : 'channel',
        subBuilder: Channel.create)
    ..aOS(3, _omitFieldNames ? '' : 'rtmToken', protoName: 'rtmToken')
    ..aOS(4, _omitFieldNames ? '' : 'wsUrl')
    ..aOM<GameInfo>(5, _omitFieldNames ? '' : 'gameInfo',
        subBuilder: GameInfo.create)
    ..aI(6, _omitFieldNames ? '' : 'rtcType', fieldType: $pb.PbFieldType.OU3)
    ..aOB(7, _omitFieldNames ? '' : 'autoMic')
    ..aI(8, _omitFieldNames ? '' : 'position')
    ..aOM<RtcConfig>(9, _omitFieldNames ? '' : 'rtcConfig',
        subBuilder: RtcConfig.create)
    ..aI(10, _omitFieldNames ? '' : 'openMic')
    ..aI(11, _omitFieldNames ? '' : 'micCountDown')
    ..aOB(12, _omitFieldNames ? '' : 'showHeartfeltWords')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinChannelRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinChannelRsp copyWith(void Function(JoinChannelRsp) updates) =>
      super.copyWith((message) => updates(message as JoinChannelRsp))
          as JoinChannelRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinChannelRsp create() => JoinChannelRsp._();
  @$core.override
  JoinChannelRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JoinChannelRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinChannelRsp>(create);
  static JoinChannelRsp? _defaultInstance;

  @$pb.TagNumber(5)
  JoinChannelRsp_Ext whichExt() => _JoinChannelRsp_ExtByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(5)
  void clearExt() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);

  @$pb.TagNumber(2)
  Channel get channel => $_getN(1);
  @$pb.TagNumber(2)
  set channel(Channel value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasChannel() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannel() => $_clearField(2);
  @$pb.TagNumber(2)
  Channel ensureChannel() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get rtmToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set rtmToken($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRtmToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearRtmToken() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get wsUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set wsUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWsUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearWsUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  GameInfo get gameInfo => $_getN(4);
  @$pb.TagNumber(5)
  set gameInfo(GameInfo value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasGameInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearGameInfo() => $_clearField(5);
  @$pb.TagNumber(5)
  GameInfo ensureGameInfo() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get rtcType => $_getIZ(5);
  @$pb.TagNumber(6)
  set rtcType($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRtcType() => $_has(5);
  @$pb.TagNumber(6)
  void clearRtcType() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get autoMic => $_getBF(6);
  @$pb.TagNumber(7)
  set autoMic($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAutoMic() => $_has(6);
  @$pb.TagNumber(7)
  void clearAutoMic() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get position => $_getIZ(7);
  @$pb.TagNumber(8)
  set position($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPosition() => $_has(7);
  @$pb.TagNumber(8)
  void clearPosition() => $_clearField(8);

  @$pb.TagNumber(9)
  RtcConfig get rtcConfig => $_getN(8);
  @$pb.TagNumber(9)
  set rtcConfig(RtcConfig value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasRtcConfig() => $_has(8);
  @$pb.TagNumber(9)
  void clearRtcConfig() => $_clearField(9);
  @$pb.TagNumber(9)
  RtcConfig ensureRtcConfig() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.int get openMic => $_getIZ(9);
  @$pb.TagNumber(10)
  set openMic($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasOpenMic() => $_has(9);
  @$pb.TagNumber(10)
  void clearOpenMic() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get micCountDown => $_getIZ(10);
  @$pb.TagNumber(11)
  set micCountDown($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasMicCountDown() => $_has(10);
  @$pb.TagNumber(11)
  void clearMicCountDown() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get showHeartfeltWords => $_getBF(11);
  @$pb.TagNumber(12)
  set showHeartfeltWords($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasShowHeartfeltWords() => $_has(11);
  @$pb.TagNumber(12)
  void clearShowHeartfeltWords() => $_clearField(12);
}

class RtcConfig extends $pb.GeneratedMessage {
  factory RtcConfig({
    RtcConfig_Type? type,
    AgoraConfig? agoraConfig,
    TencentConfig? tencentConfig,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (agoraConfig != null) result.agoraConfig = agoraConfig;
    if (tencentConfig != null) result.tencentConfig = tencentConfig;
    return result;
  }

  RtcConfig._();

  factory RtcConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RtcConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RtcConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aE<RtcConfig_Type>(1, _omitFieldNames ? '' : 'type',
        enumValues: RtcConfig_Type.values)
    ..aOM<AgoraConfig>(2, _omitFieldNames ? '' : 'agoraConfig',
        subBuilder: AgoraConfig.create)
    ..aOM<TencentConfig>(3, _omitFieldNames ? '' : 'tencentConfig',
        subBuilder: TencentConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RtcConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RtcConfig copyWith(void Function(RtcConfig) updates) =>
      super.copyWith((message) => updates(message as RtcConfig)) as RtcConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RtcConfig create() => RtcConfig._();
  @$core.override
  RtcConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RtcConfig getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RtcConfig>(create);
  static RtcConfig? _defaultInstance;

  @$pb.TagNumber(1)
  RtcConfig_Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(RtcConfig_Type value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  AgoraConfig get agoraConfig => $_getN(1);
  @$pb.TagNumber(2)
  set agoraConfig(AgoraConfig value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAgoraConfig() => $_has(1);
  @$pb.TagNumber(2)
  void clearAgoraConfig() => $_clearField(2);
  @$pb.TagNumber(2)
  AgoraConfig ensureAgoraConfig() => $_ensure(1);

  @$pb.TagNumber(3)
  TencentConfig get tencentConfig => $_getN(2);
  @$pb.TagNumber(3)
  set tencentConfig(TencentConfig value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTencentConfig() => $_has(2);
  @$pb.TagNumber(3)
  void clearTencentConfig() => $_clearField(3);
  @$pb.TagNumber(3)
  TencentConfig ensureTencentConfig() => $_ensure(2);
}

class AgoraConfig extends $pb.GeneratedMessage {
  factory AgoraConfig({
    $core.String? appId,
    $core.String? token,
    $fixnum.Int64? rid,
    $core.String? channelId,
    $core.String? rtmToken,
    $core.bool? lowLatency,
  }) {
    final result = create();
    if (appId != null) result.appId = appId;
    if (token != null) result.token = token;
    if (rid != null) result.rid = rid;
    if (channelId != null) result.channelId = channelId;
    if (rtmToken != null) result.rtmToken = rtmToken;
    if (lowLatency != null) result.lowLatency = lowLatency;
    return result;
  }

  AgoraConfig._();

  factory AgoraConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgoraConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgoraConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'appId')
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'rid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'channelId')
    ..aOS(5, _omitFieldNames ? '' : 'rtmToken')
    ..aOB(6, _omitFieldNames ? '' : 'lowLatency')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgoraConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgoraConfig copyWith(void Function(AgoraConfig) updates) =>
      super.copyWith((message) => updates(message as AgoraConfig))
          as AgoraConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgoraConfig create() => AgoraConfig._();
  @$core.override
  AgoraConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgoraConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AgoraConfig>(create);
  static AgoraConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get appId => $_getSZ(0);
  @$pb.TagNumber(1)
  set appId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAppId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get rid => $_getI64(2);
  @$pb.TagNumber(3)
  set rid($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRid() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get channelId => $_getSZ(3);
  @$pb.TagNumber(4)
  set channelId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChannelId() => $_has(3);
  @$pb.TagNumber(4)
  void clearChannelId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get rtmToken => $_getSZ(4);
  @$pb.TagNumber(5)
  set rtmToken($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRtmToken() => $_has(4);
  @$pb.TagNumber(5)
  void clearRtmToken() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get lowLatency => $_getBF(5);
  @$pb.TagNumber(6)
  set lowLatency($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLowLatency() => $_has(5);
  @$pb.TagNumber(6)
  void clearLowLatency() => $_clearField(6);
}

class TencentConfig extends $pb.GeneratedMessage {
  factory TencentConfig({
    $fixnum.Int64? appId,
    $core.String? token,
    $fixnum.Int64? rid,
  }) {
    final result = create();
    if (appId != null) result.appId = appId;
    if (token != null) result.token = token;
    if (rid != null) result.rid = rid;
    return result;
  }

  TencentConfig._();

  factory TencentConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TencentConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TencentConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'appId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'rid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TencentConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TencentConfig copyWith(void Function(TencentConfig) updates) =>
      super.copyWith((message) => updates(message as TencentConfig))
          as TencentConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TencentConfig create() => TencentConfig._();
  @$core.override
  TencentConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TencentConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TencentConfig>(create);
  static TencentConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get appId => $_getI64(0);
  @$pb.TagNumber(1)
  set appId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAppId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get rid => $_getI64(2);
  @$pb.TagNumber(3)
  set rid($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRid() => $_clearField(3);
}

class ChannelTagsData extends $pb.GeneratedMessage {
  factory ChannelTagsData({
    $core.Iterable<ChannelTagItem>? tag,
  }) {
    final result = create();
    if (tag != null) result.tag.addAll(tag);
    return result;
  }

  ChannelTagsData._();

  factory ChannelTagsData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelTagsData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelTagsData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pPM<ChannelTagItem>(1, _omitFieldNames ? '' : 'tag',
        subBuilder: ChannelTagItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelTagsData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelTagsData copyWith(void Function(ChannelTagsData) updates) =>
      super.copyWith((message) => updates(message as ChannelTagsData))
          as ChannelTagsData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelTagsData create() => ChannelTagsData._();
  @$core.override
  ChannelTagsData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelTagsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelTagsData>(create);
  static ChannelTagsData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ChannelTagItem> get tag => $_getList(0);
}

class ChannelTagItem extends $pb.GeneratedMessage {
  factory ChannelTagItem({
    $core.String? tagId,
    $core.String? tagName,
  }) {
    final result = create();
    if (tagId != null) result.tagId = tagId;
    if (tagName != null) result.tagName = tagName;
    return result;
  }

  ChannelTagItem._();

  factory ChannelTagItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelTagItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelTagItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tagId')
    ..aOS(2, _omitFieldNames ? '' : 'tagName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelTagItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelTagItem copyWith(void Function(ChannelTagItem) updates) =>
      super.copyWith((message) => updates(message as ChannelTagItem))
          as ChannelTagItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelTagItem create() => ChannelTagItem._();
  @$core.override
  ChannelTagItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelTagItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelTagItem>(create);
  static ChannelTagItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tagId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tagId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tagName => $_getSZ(1);
  @$pb.TagNumber(2)
  set tagName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTagName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTagName() => $_clearField(2);
}

class HomePageCarsData extends $pb.GeneratedMessage {
  factory HomePageCarsData({
    $core.Iterable<HomePageLabelCarItem>? item,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    return result;
  }

  HomePageCarsData._();

  factory HomePageCarsData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomePageCarsData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomePageCarsData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pPM<HomePageLabelCarItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: HomePageLabelCarItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageCarsData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageCarsData copyWith(void Function(HomePageCarsData) updates) =>
      super.copyWith((message) => updates(message as HomePageCarsData))
          as HomePageCarsData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomePageCarsData create() => HomePageCarsData._();
  @$core.override
  HomePageCarsData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomePageCarsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomePageCarsData>(create);
  static HomePageCarsData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<HomePageLabelCarItem> get item => $_getList(0);
}

class HomePageLabelCarItem extends $pb.GeneratedMessage {
  factory HomePageLabelCarItem({
    $core.String? label,
    $core.Iterable<HomePageCarItem>? carItem,
    $fixnum.Int64? hotHallId,
  }) {
    final result = create();
    if (label != null) result.label = label;
    if (carItem != null) result.carItem.addAll(carItem);
    if (hotHallId != null) result.hotHallId = hotHallId;
    return result;
  }

  HomePageLabelCarItem._();

  factory HomePageLabelCarItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomePageLabelCarItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomePageLabelCarItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'label')
    ..pPM<HomePageCarItem>(2, _omitFieldNames ? '' : 'carItem',
        subBuilder: HomePageCarItem.create)
    ..aInt64(3, _omitFieldNames ? '' : 'hotHallId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageLabelCarItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageLabelCarItem copyWith(void Function(HomePageLabelCarItem) updates) =>
      super.copyWith((message) => updates(message as HomePageLabelCarItem))
          as HomePageLabelCarItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomePageLabelCarItem create() => HomePageLabelCarItem._();
  @$core.override
  HomePageLabelCarItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomePageLabelCarItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomePageLabelCarItem>(create);
  static HomePageLabelCarItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<HomePageCarItem> get carItem => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get hotHallId => $_getI64(2);
  @$pb.TagNumber(3)
  set hotHallId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHotHallId() => $_has(2);
  @$pb.TagNumber(3)
  void clearHotHallId() => $_clearField(3);
}

class HomePageCarItem extends $pb.GeneratedMessage {
  factory HomePageCarItem({
    $0.UserCar? car,
    $fixnum.Int64? uid,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (car != null) result.car = car;
    if (uid != null) result.uid = uid;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  HomePageCarItem._();

  factory HomePageCarItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomePageCarItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomePageCarItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOM<$0.UserCar>(1, _omitFieldNames ? '' : 'car',
        subBuilder: $0.UserCar.create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageCarItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageCarItem copyWith(void Function(HomePageCarItem) updates) =>
      super.copyWith((message) => updates(message as HomePageCarItem))
          as HomePageCarItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomePageCarItem create() => HomePageCarItem._();
  @$core.override
  HomePageCarItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomePageCarItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomePageCarItem>(create);
  static HomePageCarItem? _defaultInstance;

  @$pb.TagNumber(1)
  $0.UserCar get car => $_getN(0);
  @$pb.TagNumber(1)
  set car($0.UserCar value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCar() => $_has(0);
  @$pb.TagNumber(1)
  void clearCar() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.UserCar ensureCar() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get channelId => $_getI64(2);
  @$pb.TagNumber(3)
  set channelId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChannelId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannelId() => $_clearField(3);
}

class BackgroundData extends $pb.GeneratedMessage {
  factory BackgroundData({
    $core.Iterable<BackgroundItem>? backgrounds,
  }) {
    final result = create();
    if (backgrounds != null) result.backgrounds.addAll(backgrounds);
    return result;
  }

  BackgroundData._();

  factory BackgroundData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BackgroundData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BackgroundData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pPM<BackgroundItem>(1, _omitFieldNames ? '' : 'backgrounds',
        subBuilder: BackgroundItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BackgroundData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BackgroundData copyWith(void Function(BackgroundData) updates) =>
      super.copyWith((message) => updates(message as BackgroundData))
          as BackgroundData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BackgroundData create() => BackgroundData._();
  @$core.override
  BackgroundData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BackgroundData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BackgroundData>(create);
  static BackgroundData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BackgroundItem> get backgrounds => $_getList(0);
}

class BackgroundItem extends $pb.GeneratedMessage {
  factory BackgroundItem({
    $fixnum.Int64? id,
    BackgroundType? type,
    $core.String? url,
    $core.String? knightIcon,
    $core.String? knightLimit,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (url != null) result.url = url;
    if (knightIcon != null) result.knightIcon = knightIcon;
    if (knightLimit != null) result.knightLimit = knightLimit;
    return result;
  }

  BackgroundItem._();

  factory BackgroundItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BackgroundItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BackgroundItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<BackgroundType>(2, _omitFieldNames ? '' : 'type',
        enumValues: BackgroundType.values)
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..aOS(4, _omitFieldNames ? '' : 'knightIcon')
    ..aOS(5, _omitFieldNames ? '' : 'knightLimit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BackgroundItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BackgroundItem copyWith(void Function(BackgroundItem) updates) =>
      super.copyWith((message) => updates(message as BackgroundItem))
          as BackgroundItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BackgroundItem create() => BackgroundItem._();
  @$core.override
  BackgroundItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BackgroundItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BackgroundItem>(create);
  static BackgroundItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  BackgroundType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(BackgroundType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get knightIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set knightIcon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasKnightIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearKnightIcon() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get knightLimit => $_getSZ(4);
  @$pb.TagNumber(5)
  set knightLimit($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasKnightLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearKnightLimit() => $_clearField(5);
}

class ButtonPermissionData extends $pb.GeneratedMessage {
  factory ButtonPermissionData({
    RtcUserRole? role,
    $core.bool? inProcessOfSchedule,
    $core.String? password,
  }) {
    final result = create();
    if (role != null) result.role = role;
    if (inProcessOfSchedule != null)
      result.inProcessOfSchedule = inProcessOfSchedule;
    if (password != null) result.password = password;
    return result;
  }

  ButtonPermissionData._();

  factory ButtonPermissionData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ButtonPermissionData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ButtonPermissionData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aE<RtcUserRole>(1, _omitFieldNames ? '' : 'role',
        enumValues: RtcUserRole.values)
    ..aOB(2, _omitFieldNames ? '' : 'inProcessOfSchedule')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ButtonPermissionData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ButtonPermissionData copyWith(void Function(ButtonPermissionData) updates) =>
      super.copyWith((message) => updates(message as ButtonPermissionData))
          as ButtonPermissionData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ButtonPermissionData create() => ButtonPermissionData._();
  @$core.override
  ButtonPermissionData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ButtonPermissionData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ButtonPermissionData>(create);
  static ButtonPermissionData? _defaultInstance;

  @$pb.TagNumber(1)
  RtcUserRole get role => $_getN(0);
  @$pb.TagNumber(1)
  set role(RtcUserRole value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearRole() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get inProcessOfSchedule => $_getBF(1);
  @$pb.TagNumber(2)
  set inProcessOfSchedule($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasInProcessOfSchedule() => $_has(1);
  @$pb.TagNumber(2)
  void clearInProcessOfSchedule() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => $_clearField(3);
}

/// KTV 房间歌单详情
class KtvSongList extends $pb.GeneratedMessage {
  factory KtvSongList({
    $core.Iterable<SongDetail>? list,
    SongDetail? singSong,
    $fixnum.Int64? singBeginTime,
    $fixnum.Int64? waitBeginTime,
    KtvState? state,
    $fixnum.Int64? stateModifyAt,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (singSong != null) result.singSong = singSong;
    if (singBeginTime != null) result.singBeginTime = singBeginTime;
    if (waitBeginTime != null) result.waitBeginTime = waitBeginTime;
    if (state != null) result.state = state;
    if (stateModifyAt != null) result.stateModifyAt = stateModifyAt;
    return result;
  }

  KtvSongList._();

  factory KtvSongList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KtvSongList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KtvSongList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pPM<SongDetail>(1, _omitFieldNames ? '' : 'list',
        subBuilder: SongDetail.create)
    ..aOM<SongDetail>(2, _omitFieldNames ? '' : 'singSong',
        subBuilder: SongDetail.create)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'singBeginTime', $pb.PbFieldType.OU6,
        protoName: 'sing_beginTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'waitBeginTime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<KtvState>(5, _omitFieldNames ? '' : 'state',
        enumValues: KtvState.values)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'stateModifyAt', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KtvSongList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KtvSongList copyWith(void Function(KtvSongList) updates) =>
      super.copyWith((message) => updates(message as KtvSongList))
          as KtvSongList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KtvSongList create() => KtvSongList._();
  @$core.override
  KtvSongList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KtvSongList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KtvSongList>(create);
  static KtvSongList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SongDetail> get list => $_getList(0);

  @$pb.TagNumber(2)
  SongDetail get singSong => $_getN(1);
  @$pb.TagNumber(2)
  set singSong(SongDetail value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSingSong() => $_has(1);
  @$pb.TagNumber(2)
  void clearSingSong() => $_clearField(2);
  @$pb.TagNumber(2)
  SongDetail ensureSingSong() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get singBeginTime => $_getI64(2);
  @$pb.TagNumber(3)
  set singBeginTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSingBeginTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearSingBeginTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get waitBeginTime => $_getI64(3);
  @$pb.TagNumber(4)
  set waitBeginTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWaitBeginTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearWaitBeginTime() => $_clearField(4);

  @$pb.TagNumber(5)
  KtvState get state => $_getN(4);
  @$pb.TagNumber(5)
  set state(KtvState value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get stateModifyAt => $_getI64(5);
  @$pb.TagNumber(6)
  set stateModifyAt($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStateModifyAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearStateModifyAt() => $_clearField(6);
}

class ChannelKtvAddSong extends $pb.GeneratedMessage {
  factory ChannelKtvAddSong({
    SongDetail? song,
  }) {
    final result = create();
    if (song != null) result.song = song;
    return result;
  }

  ChannelKtvAddSong._();

  factory ChannelKtvAddSong.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelKtvAddSong.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelKtvAddSong',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOM<SongDetail>(1, _omitFieldNames ? '' : 'song',
        subBuilder: SongDetail.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelKtvAddSong clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelKtvAddSong copyWith(void Function(ChannelKtvAddSong) updates) =>
      super.copyWith((message) => updates(message as ChannelKtvAddSong))
          as ChannelKtvAddSong;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelKtvAddSong create() => ChannelKtvAddSong._();
  @$core.override
  ChannelKtvAddSong createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelKtvAddSong getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelKtvAddSong>(create);
  static ChannelKtvAddSong? _defaultInstance;

  @$pb.TagNumber(1)
  SongDetail get song => $_getN(0);
  @$pb.TagNumber(1)
  set song(SongDetail value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSong() => $_has(0);
  @$pb.TagNumber(1)
  void clearSong() => $_clearField(1);
  @$pb.TagNumber(1)
  SongDetail ensureSong() => $_ensure(0);
}

class ChannelKtvRemoveSong extends $pb.GeneratedMessage {
  factory ChannelKtvRemoveSong({
    $core.int? index,
  }) {
    final result = create();
    if (index != null) result.index = index;
    return result;
  }

  ChannelKtvRemoveSong._();

  factory ChannelKtvRemoveSong.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelKtvRemoveSong.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelKtvRemoveSong',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'index')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelKtvRemoveSong clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelKtvRemoveSong copyWith(void Function(ChannelKtvRemoveSong) updates) =>
      super.copyWith((message) => updates(message as ChannelKtvRemoveSong))
          as ChannelKtvRemoveSong;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelKtvRemoveSong create() => ChannelKtvRemoveSong._();
  @$core.override
  ChannelKtvRemoveSong createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelKtvRemoveSong getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelKtvRemoveSong>(create);
  static ChannelKtvRemoveSong? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => $_clearField(1);
}

class ChannelKtvCancelWait extends $pb.GeneratedMessage {
  factory ChannelKtvCancelWait() => create();

  ChannelKtvCancelWait._();

  factory ChannelKtvCancelWait.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelKtvCancelWait.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelKtvCancelWait',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelKtvCancelWait clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelKtvCancelWait copyWith(void Function(ChannelKtvCancelWait) updates) =>
      super.copyWith((message) => updates(message as ChannelKtvCancelWait))
          as ChannelKtvCancelWait;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelKtvCancelWait create() => ChannelKtvCancelWait._();
  @$core.override
  ChannelKtvCancelWait createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelKtvCancelWait getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelKtvCancelWait>(create);
  static ChannelKtvCancelWait? _defaultInstance;
}

class ChannelKtvBeginSing extends $pb.GeneratedMessage {
  factory ChannelKtvBeginSing() => create();

  ChannelKtvBeginSing._();

  factory ChannelKtvBeginSing.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelKtvBeginSing.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelKtvBeginSing',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelKtvBeginSing clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelKtvBeginSing copyWith(void Function(ChannelKtvBeginSing) updates) =>
      super.copyWith((message) => updates(message as ChannelKtvBeginSing))
          as ChannelKtvBeginSing;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelKtvBeginSing create() => ChannelKtvBeginSing._();
  @$core.override
  ChannelKtvBeginSing createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelKtvBeginSing getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelKtvBeginSing>(create);
  static ChannelKtvBeginSing? _defaultInstance;
}

class ChannelKtvEndSing extends $pb.GeneratedMessage {
  factory ChannelKtvEndSing({
    $core.bool? reachSongEnd,
  }) {
    final result = create();
    if (reachSongEnd != null) result.reachSongEnd = reachSongEnd;
    return result;
  }

  ChannelKtvEndSing._();

  factory ChannelKtvEndSing.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelKtvEndSing.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelKtvEndSing',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'reachSongEnd')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelKtvEndSing clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelKtvEndSing copyWith(void Function(ChannelKtvEndSing) updates) =>
      super.copyWith((message) => updates(message as ChannelKtvEndSing))
          as ChannelKtvEndSing;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelKtvEndSing create() => ChannelKtvEndSing._();
  @$core.override
  ChannelKtvEndSing createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelKtvEndSing getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelKtvEndSing>(create);
  static ChannelKtvEndSing? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get reachSongEnd => $_getBF(0);
  @$pb.TagNumber(1)
  set reachSongEnd($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReachSongEnd() => $_has(0);
  @$pb.TagNumber(1)
  void clearReachSongEnd() => $_clearField(1);
}

class RecommendRoomReq extends $pb.GeneratedMessage {
  factory RecommendRoomReq({
    $fixnum.Int64? roomId,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  RecommendRoomReq._();

  factory RecommendRoomReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecommendRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecommendRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecommendRoomReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecommendRoomReq copyWith(void Function(RecommendRoomReq) updates) =>
      super.copyWith((message) => updates(message as RecommendRoomReq))
          as RecommendRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecommendRoomReq create() => RecommendRoomReq._();
  @$core.override
  RecommendRoomReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RecommendRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecommendRoomReq>(create);
  static RecommendRoomReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);
}

class GetRecommendableRoomsResp extends $pb.GeneratedMessage {
  factory GetRecommendableRoomsResp({
    $core.bool? success,
    $core.String? message,
    $core.Iterable<Channel>? rooms,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (rooms != null) result.rooms.addAll(rooms);
    return result;
  }

  GetRecommendableRoomsResp._();

  factory GetRecommendableRoomsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRecommendableRoomsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRecommendableRoomsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..pPM<Channel>(3, _omitFieldNames ? '' : 'rooms',
        subBuilder: Channel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRecommendableRoomsResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRecommendableRoomsResp copyWith(
          void Function(GetRecommendableRoomsResp) updates) =>
      super.copyWith((message) => updates(message as GetRecommendableRoomsResp))
          as GetRecommendableRoomsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRecommendableRoomsResp create() => GetRecommendableRoomsResp._();
  @$core.override
  GetRecommendableRoomsResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetRecommendableRoomsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRecommendableRoomsResp>(create);
  static GetRecommendableRoomsResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<Channel> get rooms => $_getList(2);
}

class SimpleRoom extends $pb.GeneratedMessage {
  factory SimpleRoom({
    $fixnum.Int64? id,
    $core.String? icon,
    $core.String? title,
    $core.String? description,
    $core.int? onlineMemberCount,
    $core.String? label,
    $core.String? labelDesc,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (icon != null) result.icon = icon;
    if (title != null) result.title = title;
    if (description != null) result.description = description;
    if (onlineMemberCount != null) result.onlineMemberCount = onlineMemberCount;
    if (label != null) result.label = label;
    if (labelDesc != null) result.labelDesc = labelDesc;
    return result;
  }

  SimpleRoom._();

  factory SimpleRoom.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SimpleRoom.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SimpleRoom',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aI(5, _omitFieldNames ? '' : 'onlineMemberCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'label')
    ..aOS(7, _omitFieldNames ? '' : 'labelDesc')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleRoom clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleRoom copyWith(void Function(SimpleRoom) updates) =>
      super.copyWith((message) => updates(message as SimpleRoom)) as SimpleRoom;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SimpleRoom create() => SimpleRoom._();
  @$core.override
  SimpleRoom createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SimpleRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SimpleRoom>(create);
  static SimpleRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get onlineMemberCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set onlineMemberCount($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOnlineMemberCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineMemberCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get label => $_getSZ(5);
  @$pb.TagNumber(6)
  set label($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLabel() => $_has(5);
  @$pb.TagNumber(6)
  void clearLabel() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get labelDesc => $_getSZ(6);
  @$pb.TagNumber(7)
  set labelDesc($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLabelDesc() => $_has(6);
  @$pb.TagNumber(7)
  void clearLabelDesc() => $_clearField(7);
}

class OffMicUser extends $pb.GeneratedMessage {
  factory OffMicUser({
    $fixnum.Int64? uid,
    $core.String? icon,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (icon != null) result.icon = icon;
    return result;
  }

  OffMicUser._();

  factory OffMicUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OffMicUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OffMicUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OffMicUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OffMicUser copyWith(void Function(OffMicUser) updates) =>
      super.copyWith((message) => updates(message as OffMicUser)) as OffMicUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OffMicUser create() => OffMicUser._();
  @$core.override
  OffMicUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OffMicUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OffMicUser>(create);
  static OffMicUser? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);
}

class HomePageRoomData extends $pb.GeneratedMessage {
  factory HomePageRoomData({
    $fixnum.Int64? roomId,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  HomePageRoomData._();

  factory HomePageRoomData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomePageRoomData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomePageRoomData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageRoomData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageRoomData copyWith(void Function(HomePageRoomData) updates) =>
      super.copyWith((message) => updates(message as HomePageRoomData))
          as HomePageRoomData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomePageRoomData create() => HomePageRoomData._();
  @$core.override
  HomePageRoomData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomePageRoomData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomePageRoomData>(create);
  static HomePageRoomData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);
}

class GameInfo extends $pb.GeneratedMessage {
  factory GameInfo({
    $core.String? gameId,
    $core.String? appId,
    $core.String? appKey,
    $core.String? gameCode,
    $core.String? gameName,
    $core.String? gameIconBig,
    $core.String? gameIconSmall,
    $core.String? webGameUrl,
  }) {
    final result = create();
    if (gameId != null) result.gameId = gameId;
    if (appId != null) result.appId = appId;
    if (appKey != null) result.appKey = appKey;
    if (gameCode != null) result.gameCode = gameCode;
    if (gameName != null) result.gameName = gameName;
    if (gameIconBig != null) result.gameIconBig = gameIconBig;
    if (gameIconSmall != null) result.gameIconSmall = gameIconSmall;
    if (webGameUrl != null) result.webGameUrl = webGameUrl;
    return result;
  }

  GameInfo._();

  factory GameInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GameInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GameInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gameId')
    ..aOS(2, _omitFieldNames ? '' : 'appId')
    ..aOS(3, _omitFieldNames ? '' : 'appKey')
    ..aOS(4, _omitFieldNames ? '' : 'gameCode')
    ..aOS(5, _omitFieldNames ? '' : 'gameName')
    ..aOS(6, _omitFieldNames ? '' : 'gameIconBig')
    ..aOS(7, _omitFieldNames ? '' : 'gameIconSmall')
    ..aOS(8, _omitFieldNames ? '' : 'webGameUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GameInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GameInfo copyWith(void Function(GameInfo) updates) =>
      super.copyWith((message) => updates(message as GameInfo)) as GameInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GameInfo create() => GameInfo._();
  @$core.override
  GameInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GameInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameInfo>(create);
  static GameInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gameId => $_getSZ(0);
  @$pb.TagNumber(1)
  set gameId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get appId => $_getSZ(1);
  @$pb.TagNumber(2)
  set appId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAppId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAppId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get appKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set appKey($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAppKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearAppKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get gameCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set gameCode($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGameCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearGameCode() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get gameName => $_getSZ(4);
  @$pb.TagNumber(5)
  set gameName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGameName() => $_has(4);
  @$pb.TagNumber(5)
  void clearGameName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get gameIconBig => $_getSZ(5);
  @$pb.TagNumber(6)
  set gameIconBig($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGameIconBig() => $_has(5);
  @$pb.TagNumber(6)
  void clearGameIconBig() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get gameIconSmall => $_getSZ(6);
  @$pb.TagNumber(7)
  set gameIconSmall($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasGameIconSmall() => $_has(6);
  @$pb.TagNumber(7)
  void clearGameIconSmall() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get webGameUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set webGameUrl($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasWebGameUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearWebGameUrl() => $_clearField(8);
}

class RoomBanner extends $pb.GeneratedMessage {
  factory RoomBanner({
    $core.String? icon,
    $core.String? link,
  }) {
    final result = create();
    if (icon != null) result.icon = icon;
    if (link != null) result.link = link;
    return result;
  }

  RoomBanner._();

  factory RoomBanner.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomBanner.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomBanner',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'icon')
    ..aOS(2, _omitFieldNames ? '' : 'link')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomBanner clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomBanner copyWith(void Function(RoomBanner) updates) =>
      super.copyWith((message) => updates(message as RoomBanner)) as RoomBanner;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomBanner create() => RoomBanner._();
  @$core.override
  RoomBanner createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomBanner getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomBanner>(create);
  static RoomBanner? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get link => $_getSZ(1);
  @$pb.TagNumber(2)
  set link($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLink() => $_has(1);
  @$pb.TagNumber(2)
  void clearLink() => $_clearField(2);
}

class RoomExtConfigInfo extends $pb.GeneratedMessage {
  factory RoomExtConfigInfo({
    $core.Iterable<RoomBanner>? banners,
  }) {
    final result = create();
    if (banners != null) result.banners.addAll(banners);
    return result;
  }

  RoomExtConfigInfo._();

  factory RoomExtConfigInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomExtConfigInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomExtConfigInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pPM<RoomBanner>(1, _omitFieldNames ? '' : 'banners',
        subBuilder: RoomBanner.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomExtConfigInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomExtConfigInfo copyWith(void Function(RoomExtConfigInfo) updates) =>
      super.copyWith((message) => updates(message as RoomExtConfigInfo))
          as RoomExtConfigInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomExtConfigInfo create() => RoomExtConfigInfo._();
  @$core.override
  RoomExtConfigInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomExtConfigInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomExtConfigInfo>(create);
  static RoomExtConfigInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RoomBanner> get banners => $_getList(0);
}

/// 房间幸运积分
class RoomLuckyPoints extends $pb.GeneratedMessage {
  factory RoomLuckyPoints({
    $fixnum.Int64? curPoints,
    $fixnum.Int64? luckyPoints,
    $fixnum.Int64? roomCrystalId,
  }) {
    final result = create();
    if (curPoints != null) result.curPoints = curPoints;
    if (luckyPoints != null) result.luckyPoints = luckyPoints;
    if (roomCrystalId != null) result.roomCrystalId = roomCrystalId;
    return result;
  }

  RoomLuckyPoints._();

  factory RoomLuckyPoints.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomLuckyPoints.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomLuckyPoints',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'curPoints')
    ..aInt64(2, _omitFieldNames ? '' : 'luckyPoints')
    ..aInt64(3, _omitFieldNames ? '' : 'roomCrystalId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomLuckyPoints clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomLuckyPoints copyWith(void Function(RoomLuckyPoints) updates) =>
      super.copyWith((message) => updates(message as RoomLuckyPoints))
          as RoomLuckyPoints;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomLuckyPoints create() => RoomLuckyPoints._();
  @$core.override
  RoomLuckyPoints createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomLuckyPoints getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomLuckyPoints>(create);
  static RoomLuckyPoints? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get curPoints => $_getI64(0);
  @$pb.TagNumber(1)
  set curPoints($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCurPoints() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurPoints() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get luckyPoints => $_getI64(1);
  @$pb.TagNumber(2)
  set luckyPoints($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLuckyPoints() => $_has(1);
  @$pb.TagNumber(2)
  void clearLuckyPoints() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get roomCrystalId => $_getI64(2);
  @$pb.TagNumber(3)
  set roomCrystalId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomCrystalId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomCrystalId() => $_clearField(3);
}

/// 房间额外信息
class JoinChannelExtendRsp extends $pb.GeneratedMessage {
  factory JoinChannelExtendRsp({
    GameInfo? gameInfo,
    $2.CPInfo? cpInfo,
    $3.TurntableInfo? turntableInfo,
    RoomExtConfigInfo? extConfigInfo,
    RoomLuckyPoints? luckyPoints,
    RoomFleetInfo? fleetInfo,
    RoomHeartLinkInfo? heartLinkInfo,
    $4.Auction? auctionInfo,
    RoomStoryInfo? storyInfo,
    $5.PetHangOutInfo? petInfo,
    $core.bool? quizRoom,
  }) {
    final result = create();
    if (gameInfo != null) result.gameInfo = gameInfo;
    if (cpInfo != null) result.cpInfo = cpInfo;
    if (turntableInfo != null) result.turntableInfo = turntableInfo;
    if (extConfigInfo != null) result.extConfigInfo = extConfigInfo;
    if (luckyPoints != null) result.luckyPoints = luckyPoints;
    if (fleetInfo != null) result.fleetInfo = fleetInfo;
    if (heartLinkInfo != null) result.heartLinkInfo = heartLinkInfo;
    if (auctionInfo != null) result.auctionInfo = auctionInfo;
    if (storyInfo != null) result.storyInfo = storyInfo;
    if (petInfo != null) result.petInfo = petInfo;
    if (quizRoom != null) result.quizRoom = quizRoom;
    return result;
  }

  JoinChannelExtendRsp._();

  factory JoinChannelExtendRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JoinChannelExtendRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JoinChannelExtendRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOM<GameInfo>(1, _omitFieldNames ? '' : 'gameInfo',
        subBuilder: GameInfo.create)
    ..aOM<$2.CPInfo>(2, _omitFieldNames ? '' : 'cpInfo',
        protoName: 'cpInfo', subBuilder: $2.CPInfo.create)
    ..aOM<$3.TurntableInfo>(3, _omitFieldNames ? '' : 'turntableInfo',
        protoName: 'turntableInfo', subBuilder: $3.TurntableInfo.create)
    ..aOM<RoomExtConfigInfo>(4, _omitFieldNames ? '' : 'extConfigInfo',
        protoName: 'extConfigInfo', subBuilder: RoomExtConfigInfo.create)
    ..aOM<RoomLuckyPoints>(5, _omitFieldNames ? '' : 'luckyPoints',
        protoName: 'luckyPoints', subBuilder: RoomLuckyPoints.create)
    ..aOM<RoomFleetInfo>(6, _omitFieldNames ? '' : 'fleetInfo',
        subBuilder: RoomFleetInfo.create)
    ..aOM<RoomHeartLinkInfo>(7, _omitFieldNames ? '' : 'heartLinkInfo',
        subBuilder: RoomHeartLinkInfo.create)
    ..aOM<$4.Auction>(8, _omitFieldNames ? '' : 'auctionInfo',
        subBuilder: $4.Auction.create)
    ..aOM<RoomStoryInfo>(9, _omitFieldNames ? '' : 'storyInfo',
        subBuilder: RoomStoryInfo.create)
    ..aOM<$5.PetHangOutInfo>(10, _omitFieldNames ? '' : 'petInfo',
        subBuilder: $5.PetHangOutInfo.create)
    ..aOB(11, _omitFieldNames ? '' : 'quizRoom')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinChannelExtendRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinChannelExtendRsp copyWith(void Function(JoinChannelExtendRsp) updates) =>
      super.copyWith((message) => updates(message as JoinChannelExtendRsp))
          as JoinChannelExtendRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinChannelExtendRsp create() => JoinChannelExtendRsp._();
  @$core.override
  JoinChannelExtendRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JoinChannelExtendRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinChannelExtendRsp>(create);
  static JoinChannelExtendRsp? _defaultInstance;

  @$pb.TagNumber(1)
  GameInfo get gameInfo => $_getN(0);
  @$pb.TagNumber(1)
  set gameInfo(GameInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGameInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  GameInfo ensureGameInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.CPInfo get cpInfo => $_getN(1);
  @$pb.TagNumber(2)
  set cpInfo($2.CPInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCpInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearCpInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.CPInfo ensureCpInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  $3.TurntableInfo get turntableInfo => $_getN(2);
  @$pb.TagNumber(3)
  set turntableInfo($3.TurntableInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTurntableInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTurntableInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  $3.TurntableInfo ensureTurntableInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  RoomExtConfigInfo get extConfigInfo => $_getN(3);
  @$pb.TagNumber(4)
  set extConfigInfo(RoomExtConfigInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasExtConfigInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearExtConfigInfo() => $_clearField(4);
  @$pb.TagNumber(4)
  RoomExtConfigInfo ensureExtConfigInfo() => $_ensure(3);

  @$pb.TagNumber(5)
  RoomLuckyPoints get luckyPoints => $_getN(4);
  @$pb.TagNumber(5)
  set luckyPoints(RoomLuckyPoints value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasLuckyPoints() => $_has(4);
  @$pb.TagNumber(5)
  void clearLuckyPoints() => $_clearField(5);
  @$pb.TagNumber(5)
  RoomLuckyPoints ensureLuckyPoints() => $_ensure(4);

  @$pb.TagNumber(6)
  RoomFleetInfo get fleetInfo => $_getN(5);
  @$pb.TagNumber(6)
  set fleetInfo(RoomFleetInfo value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasFleetInfo() => $_has(5);
  @$pb.TagNumber(6)
  void clearFleetInfo() => $_clearField(6);
  @$pb.TagNumber(6)
  RoomFleetInfo ensureFleetInfo() => $_ensure(5);

  @$pb.TagNumber(7)
  RoomHeartLinkInfo get heartLinkInfo => $_getN(6);
  @$pb.TagNumber(7)
  set heartLinkInfo(RoomHeartLinkInfo value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasHeartLinkInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearHeartLinkInfo() => $_clearField(7);
  @$pb.TagNumber(7)
  RoomHeartLinkInfo ensureHeartLinkInfo() => $_ensure(6);

  @$pb.TagNumber(8)
  $4.Auction get auctionInfo => $_getN(7);
  @$pb.TagNumber(8)
  set auctionInfo($4.Auction value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasAuctionInfo() => $_has(7);
  @$pb.TagNumber(8)
  void clearAuctionInfo() => $_clearField(8);
  @$pb.TagNumber(8)
  $4.Auction ensureAuctionInfo() => $_ensure(7);

  @$pb.TagNumber(9)
  RoomStoryInfo get storyInfo => $_getN(8);
  @$pb.TagNumber(9)
  set storyInfo(RoomStoryInfo value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasStoryInfo() => $_has(8);
  @$pb.TagNumber(9)
  void clearStoryInfo() => $_clearField(9);
  @$pb.TagNumber(9)
  RoomStoryInfo ensureStoryInfo() => $_ensure(8);

  @$pb.TagNumber(10)
  $5.PetHangOutInfo get petInfo => $_getN(9);
  @$pb.TagNumber(10)
  set petInfo($5.PetHangOutInfo value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasPetInfo() => $_has(9);
  @$pb.TagNumber(10)
  void clearPetInfo() => $_clearField(10);
  @$pb.TagNumber(10)
  $5.PetHangOutInfo ensurePetInfo() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.bool get quizRoom => $_getBF(10);
  @$pb.TagNumber(11)
  set quizRoom($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasQuizRoom() => $_has(10);
  @$pb.TagNumber(11)
  void clearQuizRoom() => $_clearField(11);
}

class RoomStoryInfo extends $pb.GeneratedMessage {
  factory RoomStoryInfo({
    $core.String? name,
    $core.String? introduction,
    $core.String? roomBackground,
    $core.Iterable<CharacterInfo>? characterList,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (introduction != null) result.introduction = introduction;
    if (roomBackground != null) result.roomBackground = roomBackground;
    if (characterList != null) result.characterList.addAll(characterList);
    return result;
  }

  RoomStoryInfo._();

  factory RoomStoryInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomStoryInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomStoryInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'introduction')
    ..aOS(3, _omitFieldNames ? '' : 'roomBackground')
    ..pPM<CharacterInfo>(4, _omitFieldNames ? '' : 'characterList',
        subBuilder: CharacterInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomStoryInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomStoryInfo copyWith(void Function(RoomStoryInfo) updates) =>
      super.copyWith((message) => updates(message as RoomStoryInfo))
          as RoomStoryInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomStoryInfo create() => RoomStoryInfo._();
  @$core.override
  RoomStoryInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomStoryInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomStoryInfo>(create);
  static RoomStoryInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get introduction => $_getSZ(1);
  @$pb.TagNumber(2)
  set introduction($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIntroduction() => $_has(1);
  @$pb.TagNumber(2)
  void clearIntroduction() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomBackground => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomBackground($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomBackground() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomBackground() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<CharacterInfo> get characterList => $_getList(3);
}

class CharacterInfo extends $pb.GeneratedMessage {
  factory CharacterInfo({
    $core.String? name,
    $core.String? image,
    $core.String? introduction,
    $core.Iterable<$core.String>? personalityList,
    $core.Iterable<$core.String>? voiceList,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (image != null) result.image = image;
    if (introduction != null) result.introduction = introduction;
    if (personalityList != null) result.personalityList.addAll(personalityList);
    if (voiceList != null) result.voiceList.addAll(voiceList);
    return result;
  }

  CharacterInfo._();

  factory CharacterInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CharacterInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CharacterInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'image')
    ..aOS(3, _omitFieldNames ? '' : 'introduction')
    ..pPS(4, _omitFieldNames ? '' : 'personalityList')
    ..pPS(5, _omitFieldNames ? '' : 'voiceList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CharacterInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CharacterInfo copyWith(void Function(CharacterInfo) updates) =>
      super.copyWith((message) => updates(message as CharacterInfo))
          as CharacterInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CharacterInfo create() => CharacterInfo._();
  @$core.override
  CharacterInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CharacterInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CharacterInfo>(create);
  static CharacterInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(2)
  set image($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get introduction => $_getSZ(2);
  @$pb.TagNumber(3)
  set introduction($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIntroduction() => $_has(2);
  @$pb.TagNumber(3)
  void clearIntroduction() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get personalityList => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get voiceList => $_getList(4);
}

class StoryListRsp extends $pb.GeneratedMessage {
  factory StoryListRsp({
    $core.Iterable<StoryInfo>? storyList,
  }) {
    final result = create();
    if (storyList != null) result.storyList.addAll(storyList);
    return result;
  }

  StoryListRsp._();

  factory StoryListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StoryListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StoryListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pPM<StoryInfo>(1, _omitFieldNames ? '' : 'storyList',
        subBuilder: StoryInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoryListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoryListRsp copyWith(void Function(StoryListRsp) updates) =>
      super.copyWith((message) => updates(message as StoryListRsp))
          as StoryListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StoryListRsp create() => StoryListRsp._();
  @$core.override
  StoryListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StoryListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoryListRsp>(create);
  static StoryListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<StoryInfo> get storyList => $_getList(0);
}

class StoryInfo extends $pb.GeneratedMessage {
  factory StoryInfo({
    $core.String? name,
    $core.String? introduction,
    $core.String? hotCover,
    $core.String? indexCover,
    $core.String? listCover,
    $core.String? detailBackground,
    $core.String? roomBackground,
    $core.Iterable<CharacterInfo>? characterList,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (introduction != null) result.introduction = introduction;
    if (hotCover != null) result.hotCover = hotCover;
    if (indexCover != null) result.indexCover = indexCover;
    if (listCover != null) result.listCover = listCover;
    if (detailBackground != null) result.detailBackground = detailBackground;
    if (roomBackground != null) result.roomBackground = roomBackground;
    if (characterList != null) result.characterList.addAll(characterList);
    return result;
  }

  StoryInfo._();

  factory StoryInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StoryInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StoryInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'introduction')
    ..aOS(3, _omitFieldNames ? '' : 'hotCover')
    ..aOS(4, _omitFieldNames ? '' : 'indexCover')
    ..aOS(5, _omitFieldNames ? '' : 'listCover')
    ..aOS(6, _omitFieldNames ? '' : 'detailBackground')
    ..aOS(7, _omitFieldNames ? '' : 'roomBackground')
    ..pPM<CharacterInfo>(8, _omitFieldNames ? '' : 'characterList',
        subBuilder: CharacterInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoryInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoryInfo copyWith(void Function(StoryInfo) updates) =>
      super.copyWith((message) => updates(message as StoryInfo)) as StoryInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StoryInfo create() => StoryInfo._();
  @$core.override
  StoryInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StoryInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StoryInfo>(create);
  static StoryInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get introduction => $_getSZ(1);
  @$pb.TagNumber(2)
  set introduction($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIntroduction() => $_has(1);
  @$pb.TagNumber(2)
  void clearIntroduction() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get hotCover => $_getSZ(2);
  @$pb.TagNumber(3)
  set hotCover($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHotCover() => $_has(2);
  @$pb.TagNumber(3)
  void clearHotCover() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get indexCover => $_getSZ(3);
  @$pb.TagNumber(4)
  set indexCover($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIndexCover() => $_has(3);
  @$pb.TagNumber(4)
  void clearIndexCover() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get listCover => $_getSZ(4);
  @$pb.TagNumber(5)
  set listCover($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasListCover() => $_has(4);
  @$pb.TagNumber(5)
  void clearListCover() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get detailBackground => $_getSZ(5);
  @$pb.TagNumber(6)
  set detailBackground($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDetailBackground() => $_has(5);
  @$pb.TagNumber(6)
  void clearDetailBackground() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get roomBackground => $_getSZ(6);
  @$pb.TagNumber(7)
  set roomBackground($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRoomBackground() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoomBackground() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<CharacterInfo> get characterList => $_getList(7);
}

class HotStoryRsp extends $pb.GeneratedMessage {
  factory HotStoryRsp({
    $core.Iterable<HotStoryInfo>? hotStoryList,
  }) {
    final result = create();
    if (hotStoryList != null) result.hotStoryList.addAll(hotStoryList);
    return result;
  }

  HotStoryRsp._();

  factory HotStoryRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HotStoryRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HotStoryRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pPM<HotStoryInfo>(1, _omitFieldNames ? '' : 'hotStoryList',
        subBuilder: HotStoryInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HotStoryRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HotStoryRsp copyWith(void Function(HotStoryRsp) updates) =>
      super.copyWith((message) => updates(message as HotStoryRsp))
          as HotStoryRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HotStoryRsp create() => HotStoryRsp._();
  @$core.override
  HotStoryRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HotStoryRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HotStoryRsp>(create);
  static HotStoryRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<HotStoryInfo> get hotStoryList => $_getList(0);
}

class HotStoryInfo extends $pb.GeneratedMessage {
  factory HotStoryInfo({
    $core.String? name,
    $core.String? cover,
    $core.int? joinCount,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (cover != null) result.cover = cover;
    if (joinCount != null) result.joinCount = joinCount;
    return result;
  }

  HotStoryInfo._();

  factory HotStoryInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HotStoryInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HotStoryInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'cover')
    ..aI(3, _omitFieldNames ? '' : 'joinCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HotStoryInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HotStoryInfo copyWith(void Function(HotStoryInfo) updates) =>
      super.copyWith((message) => updates(message as HotStoryInfo))
          as HotStoryInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HotStoryInfo create() => HotStoryInfo._();
  @$core.override
  HotStoryInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HotStoryInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HotStoryInfo>(create);
  static HotStoryInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get cover => $_getSZ(1);
  @$pb.TagNumber(2)
  set cover($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCover() => $_has(1);
  @$pb.TagNumber(2)
  void clearCover() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get joinCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set joinCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasJoinCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearJoinCount() => $_clearField(3);
}

class RoomHeartLinkInfo extends $pb.GeneratedMessage {
  factory RoomHeartLinkInfo({
    $fixnum.Int64? itemId,
    $core.String? itemName,
    $core.String? itemIcon,
    $fixnum.Int64? itemPrice,
    $core.bool? showShareButton,
  }) {
    final result = create();
    if (itemId != null) result.itemId = itemId;
    if (itemName != null) result.itemName = itemName;
    if (itemIcon != null) result.itemIcon = itemIcon;
    if (itemPrice != null) result.itemPrice = itemPrice;
    if (showShareButton != null) result.showShareButton = showShareButton;
    return result;
  }

  RoomHeartLinkInfo._();

  factory RoomHeartLinkInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomHeartLinkInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomHeartLinkInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'itemId')
    ..aOS(2, _omitFieldNames ? '' : 'itemName')
    ..aOS(3, _omitFieldNames ? '' : 'itemIcon')
    ..aInt64(4, _omitFieldNames ? '' : 'itemPrice')
    ..aOB(5, _omitFieldNames ? '' : 'showShareButton')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomHeartLinkInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomHeartLinkInfo copyWith(void Function(RoomHeartLinkInfo) updates) =>
      super.copyWith((message) => updates(message as RoomHeartLinkInfo))
          as RoomHeartLinkInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomHeartLinkInfo create() => RoomHeartLinkInfo._();
  @$core.override
  RoomHeartLinkInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomHeartLinkInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomHeartLinkInfo>(create);
  static RoomHeartLinkInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get itemId => $_getI64(0);
  @$pb.TagNumber(1)
  set itemId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItemId() => $_has(0);
  @$pb.TagNumber(1)
  void clearItemId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get itemName => $_getSZ(1);
  @$pb.TagNumber(2)
  set itemName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasItemName() => $_has(1);
  @$pb.TagNumber(2)
  void clearItemName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get itemIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set itemIcon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasItemIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearItemIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get itemPrice => $_getI64(3);
  @$pb.TagNumber(4)
  set itemPrice($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasItemPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearItemPrice() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get showShareButton => $_getBF(4);
  @$pb.TagNumber(5)
  set showShareButton($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasShowShareButton() => $_has(4);
  @$pb.TagNumber(5)
  void clearShowShareButton() => $_clearField(5);
}

class RoomFleetInfo extends $pb.GeneratedMessage {
  factory RoomFleetInfo({
    $fixnum.Int64? fleetId,
    $core.int? fleetLevel,
    $core.double? expProgress,
    $core.int? countdownSeconds,
  }) {
    final result = create();
    if (fleetId != null) result.fleetId = fleetId;
    if (fleetLevel != null) result.fleetLevel = fleetLevel;
    if (expProgress != null) result.expProgress = expProgress;
    if (countdownSeconds != null) result.countdownSeconds = countdownSeconds;
    return result;
  }

  RoomFleetInfo._();

  factory RoomFleetInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomFleetInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomFleetInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'fleetId')
    ..aI(2, _omitFieldNames ? '' : 'fleetLevel')
    ..aD(3, _omitFieldNames ? '' : 'expProgress')
    ..aI(4, _omitFieldNames ? '' : 'countdownSeconds',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomFleetInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomFleetInfo copyWith(void Function(RoomFleetInfo) updates) =>
      super.copyWith((message) => updates(message as RoomFleetInfo))
          as RoomFleetInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomFleetInfo create() => RoomFleetInfo._();
  @$core.override
  RoomFleetInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomFleetInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomFleetInfo>(create);
  static RoomFleetInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get fleetId => $_getI64(0);
  @$pb.TagNumber(1)
  set fleetId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFleetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFleetId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get fleetLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set fleetLevel($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFleetLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearFleetLevel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get expProgress => $_getN(2);
  @$pb.TagNumber(3)
  set expProgress($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpProgress() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpProgress() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get countdownSeconds => $_getIZ(3);
  @$pb.TagNumber(4)
  set countdownSeconds($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCountdownSeconds() => $_has(3);
  @$pb.TagNumber(4)
  void clearCountdownSeconds() => $_clearField(4);
}

class RoomList extends $pb.GeneratedMessage {
  factory RoomList({
    $core.Iterable<Channel>? rooms,
  }) {
    final result = create();
    if (rooms != null) result.rooms.addAll(rooms);
    return result;
  }

  RoomList._();

  factory RoomList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'rtc'),
      createEmptyInstance: create)
    ..pPM<Channel>(1, _omitFieldNames ? '' : 'rooms',
        subBuilder: Channel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomList copyWith(void Function(RoomList) updates) =>
      super.copyWith((message) => updates(message as RoomList)) as RoomList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomList create() => RoomList._();
  @$core.override
  RoomList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomList>(create);
  static RoomList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Channel> get rooms => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

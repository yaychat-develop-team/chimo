// This is a generated file - do not edit.
//
// Generated from server_client/admin/room_manage.proto.

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

export 'room_manage.pbenum.dart';

class CreateRoomReq extends $pb.GeneratedMessage {
  factory CreateRoomReq({
    $core.String? name,
    $core.String? theme,
    $fixnum.Int64? ownerId,
    $core.String? roomType,
    $core.String? bizType,
    $core.String? publicAttr,
    $core.String? roomStatus,
    $core.String? cover,
    $core.String? usage,
    $fixnum.Int64? adminId,
    $core.bool? autoSettle,
    $core.String? region,
    $core.String? cardBackgroundUrl,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (theme != null) result.theme = theme;
    if (ownerId != null) result.ownerId = ownerId;
    if (roomType != null) result.roomType = roomType;
    if (bizType != null) result.bizType = bizType;
    if (publicAttr != null) result.publicAttr = publicAttr;
    if (roomStatus != null) result.roomStatus = roomStatus;
    if (cover != null) result.cover = cover;
    if (usage != null) result.usage = usage;
    if (adminId != null) result.adminId = adminId;
    if (autoSettle != null) result.autoSettle = autoSettle;
    if (region != null) result.region = region;
    if (cardBackgroundUrl != null) result.cardBackgroundUrl = cardBackgroundUrl;
    return result;
  }

  CreateRoomReq._();

  factory CreateRoomReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminRoom'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'theme')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'ownerId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'roomType')
    ..aOS(5, _omitFieldNames ? '' : 'bizType')
    ..aOS(6, _omitFieldNames ? '' : 'publicAttr')
    ..aOS(7, _omitFieldNames ? '' : 'roomStatus')
    ..aOS(8, _omitFieldNames ? '' : 'cover')
    ..aOS(9, _omitFieldNames ? '' : 'usage')
    ..a<$fixnum.Int64>(
        10, _omitFieldNames ? '' : 'adminId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(11, _omitFieldNames ? '' : 'autoSettle')
    ..aOS(12, _omitFieldNames ? '' : 'region')
    ..aOS(13, _omitFieldNames ? '' : 'cardBackgroundUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateRoomReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateRoomReq copyWith(void Function(CreateRoomReq) updates) =>
      super.copyWith((message) => updates(message as CreateRoomReq))
          as CreateRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRoomReq create() => CreateRoomReq._();
  @$core.override
  CreateRoomReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateRoomReq>(create);
  static CreateRoomReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get theme => $_getSZ(1);
  @$pb.TagNumber(2)
  set theme($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTheme() => $_has(1);
  @$pb.TagNumber(2)
  void clearTheme() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get ownerId => $_getI64(2);
  @$pb.TagNumber(3)
  set ownerId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOwnerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearOwnerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomType => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomType() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get bizType => $_getSZ(4);
  @$pb.TagNumber(5)
  set bizType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBizType() => $_has(4);
  @$pb.TagNumber(5)
  void clearBizType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get publicAttr => $_getSZ(5);
  @$pb.TagNumber(6)
  set publicAttr($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPublicAttr() => $_has(5);
  @$pb.TagNumber(6)
  void clearPublicAttr() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get roomStatus => $_getSZ(6);
  @$pb.TagNumber(7)
  set roomStatus($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRoomStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoomStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get cover => $_getSZ(7);
  @$pb.TagNumber(8)
  set cover($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCover() => $_has(7);
  @$pb.TagNumber(8)
  void clearCover() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get usage => $_getSZ(8);
  @$pb.TagNumber(9)
  set usage($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasUsage() => $_has(8);
  @$pb.TagNumber(9)
  void clearUsage() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get adminId => $_getI64(9);
  @$pb.TagNumber(10)
  set adminId($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasAdminId() => $_has(9);
  @$pb.TagNumber(10)
  void clearAdminId() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get autoSettle => $_getBF(10);
  @$pb.TagNumber(11)
  set autoSettle($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasAutoSettle() => $_has(10);
  @$pb.TagNumber(11)
  void clearAutoSettle() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get region => $_getSZ(11);
  @$pb.TagNumber(12)
  set region($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasRegion() => $_has(11);
  @$pb.TagNumber(12)
  void clearRegion() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get cardBackgroundUrl => $_getSZ(12);
  @$pb.TagNumber(13)
  set cardBackgroundUrl($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasCardBackgroundUrl() => $_has(12);
  @$pb.TagNumber(13)
  void clearCardBackgroundUrl() => $_clearField(13);
}

class UpdateRoomReq extends $pb.GeneratedMessage {
  factory UpdateRoomReq({
    $core.String? name,
    $core.String? theme,
    $core.String? roomType,
    $core.String? bizType,
    $core.String? publicAttr,
    $core.String? roomStatus,
    $fixnum.Int64? id,
    $core.String? cover,
    $core.String? usage,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (theme != null) result.theme = theme;
    if (roomType != null) result.roomType = roomType;
    if (bizType != null) result.bizType = bizType;
    if (publicAttr != null) result.publicAttr = publicAttr;
    if (roomStatus != null) result.roomStatus = roomStatus;
    if (id != null) result.id = id;
    if (cover != null) result.cover = cover;
    if (usage != null) result.usage = usage;
    return result;
  }

  UpdateRoomReq._();

  factory UpdateRoomReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminRoom'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'theme')
    ..aOS(3, _omitFieldNames ? '' : 'roomType')
    ..aOS(4, _omitFieldNames ? '' : 'bizType')
    ..aOS(5, _omitFieldNames ? '' : 'publicAttr')
    ..aOS(6, _omitFieldNames ? '' : 'roomStatus')
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(8, _omitFieldNames ? '' : 'cover')
    ..aOS(9, _omitFieldNames ? '' : 'usage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateRoomReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateRoomReq copyWith(void Function(UpdateRoomReq) updates) =>
      super.copyWith((message) => updates(message as UpdateRoomReq))
          as UpdateRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateRoomReq create() => UpdateRoomReq._();
  @$core.override
  UpdateRoomReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateRoomReq>(create);
  static UpdateRoomReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get theme => $_getSZ(1);
  @$pb.TagNumber(2)
  set theme($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTheme() => $_has(1);
  @$pb.TagNumber(2)
  void clearTheme() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomType => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomType() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get bizType => $_getSZ(3);
  @$pb.TagNumber(4)
  set bizType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBizType() => $_has(3);
  @$pb.TagNumber(4)
  void clearBizType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get publicAttr => $_getSZ(4);
  @$pb.TagNumber(5)
  set publicAttr($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPublicAttr() => $_has(4);
  @$pb.TagNumber(5)
  void clearPublicAttr() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get roomStatus => $_getSZ(5);
  @$pb.TagNumber(6)
  set roomStatus($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRoomStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get id => $_getI64(6);
  @$pb.TagNumber(7)
  set id($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasId() => $_has(6);
  @$pb.TagNumber(7)
  void clearId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get cover => $_getSZ(7);
  @$pb.TagNumber(8)
  set cover($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCover() => $_has(7);
  @$pb.TagNumber(8)
  void clearCover() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get usage => $_getSZ(8);
  @$pb.TagNumber(9)
  set usage($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasUsage() => $_has(8);
  @$pb.TagNumber(9)
  void clearUsage() => $_clearField(9);
}

class RoomListData extends $pb.GeneratedMessage {
  factory RoomListData({
    $core.Iterable<RoomItem>? room,
  }) {
    final result = create();
    if (room != null) result.room.addAll(room);
    return result;
  }

  RoomListData._();

  factory RoomListData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomListData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomListData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminRoom'),
      createEmptyInstance: create)
    ..pPM<RoomItem>(1, _omitFieldNames ? '' : 'room',
        subBuilder: RoomItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomListData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomListData copyWith(void Function(RoomListData) updates) =>
      super.copyWith((message) => updates(message as RoomListData))
          as RoomListData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomListData create() => RoomListData._();
  @$core.override
  RoomListData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomListData>(create);
  static RoomListData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RoomItem> get room => $_getList(0);
}

class RoomItem extends $pb.GeneratedMessage {
  factory RoomItem({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? theme,
    $core.String? roomType,
    $core.String? bizType,
    $core.String? publicAttr,
    $core.String? roomStatus,
    $0.SimpleAppUser? owner,
    $0.SimpleGroup? group,
    $fixnum.Int64? createTime,
    $fixnum.Int64? updateTime,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (theme != null) result.theme = theme;
    if (roomType != null) result.roomType = roomType;
    if (bizType != null) result.bizType = bizType;
    if (publicAttr != null) result.publicAttr = publicAttr;
    if (roomStatus != null) result.roomStatus = roomStatus;
    if (owner != null) result.owner = owner;
    if (group != null) result.group = group;
    if (createTime != null) result.createTime = createTime;
    if (updateTime != null) result.updateTime = updateTime;
    return result;
  }

  RoomItem._();

  factory RoomItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminRoom'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'theme')
    ..aOS(4, _omitFieldNames ? '' : 'roomType')
    ..aOS(5, _omitFieldNames ? '' : 'bizType')
    ..aOS(6, _omitFieldNames ? '' : 'publicAttr')
    ..aOS(7, _omitFieldNames ? '' : 'roomStatus')
    ..aOM<$0.SimpleAppUser>(8, _omitFieldNames ? '' : 'owner',
        subBuilder: $0.SimpleAppUser.create)
    ..aOM<$0.SimpleGroup>(9, _omitFieldNames ? '' : 'group',
        subBuilder: $0.SimpleGroup.create)
    ..a<$fixnum.Int64>(
        10, _omitFieldNames ? '' : 'createTime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        11, _omitFieldNames ? '' : 'updateTime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomItem copyWith(void Function(RoomItem) updates) =>
      super.copyWith((message) => updates(message as RoomItem)) as RoomItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomItem create() => RoomItem._();
  @$core.override
  RoomItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomItem>(create);
  static RoomItem? _defaultInstance;

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
  $core.String get theme => $_getSZ(2);
  @$pb.TagNumber(3)
  set theme($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTheme() => $_has(2);
  @$pb.TagNumber(3)
  void clearTheme() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomType => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomType() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get bizType => $_getSZ(4);
  @$pb.TagNumber(5)
  set bizType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBizType() => $_has(4);
  @$pb.TagNumber(5)
  void clearBizType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get publicAttr => $_getSZ(5);
  @$pb.TagNumber(6)
  set publicAttr($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPublicAttr() => $_has(5);
  @$pb.TagNumber(6)
  void clearPublicAttr() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get roomStatus => $_getSZ(6);
  @$pb.TagNumber(7)
  set roomStatus($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRoomStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoomStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  $0.SimpleAppUser get owner => $_getN(7);
  @$pb.TagNumber(8)
  set owner($0.SimpleAppUser value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasOwner() => $_has(7);
  @$pb.TagNumber(8)
  void clearOwner() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.SimpleAppUser ensureOwner() => $_ensure(7);

  @$pb.TagNumber(9)
  $0.SimpleGroup get group => $_getN(8);
  @$pb.TagNumber(9)
  set group($0.SimpleGroup value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasGroup() => $_has(8);
  @$pb.TagNumber(9)
  void clearGroup() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.SimpleGroup ensureGroup() => $_ensure(8);

  @$pb.TagNumber(10)
  $fixnum.Int64 get createTime => $_getI64(9);
  @$pb.TagNumber(10)
  set createTime($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCreateTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreateTime() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get updateTime => $_getI64(10);
  @$pb.TagNumber(11)
  set updateTime($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasUpdateTime() => $_has(10);
  @$pb.TagNumber(11)
  void clearUpdateTime() => $_clearField(11);
}

class ShowListData extends $pb.GeneratedMessage {
  factory ShowListData({
    $core.Iterable<ShowListItem>? showItem,
  }) {
    final result = create();
    if (showItem != null) result.showItem.addAll(showItem);
    return result;
  }

  ShowListData._();

  factory ShowListData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShowListData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShowListData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminRoom'),
      createEmptyInstance: create)
    ..pPM<ShowListItem>(1, _omitFieldNames ? '' : 'showItem',
        subBuilder: ShowListItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShowListData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShowListData copyWith(void Function(ShowListData) updates) =>
      super.copyWith((message) => updates(message as ShowListData))
          as ShowListData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShowListData create() => ShowListData._();
  @$core.override
  ShowListData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShowListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShowListData>(create);
  static ShowListData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ShowListItem> get showItem => $_getList(0);
}

class ShowListItem extends $pb.GeneratedMessage {
  factory ShowListItem({
    $core.String? id,
    $core.String? showText,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (showText != null) result.showText = showText;
    return result;
  }

  ShowListItem._();

  factory ShowListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShowListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShowListItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminRoom'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'showText')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShowListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShowListItem copyWith(void Function(ShowListItem) updates) =>
      super.copyWith((message) => updates(message as ShowListItem))
          as ShowListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShowListItem create() => ShowListItem._();
  @$core.override
  ShowListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShowListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShowListItem>(create);
  static ShowListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get showText => $_getSZ(1);
  @$pb.TagNumber(2)
  set showText($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasShowText() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowText() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

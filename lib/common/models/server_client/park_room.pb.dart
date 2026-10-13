// This is a generated file - do not edit.
//
// Generated from server_client/park_room.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ParkRoomsRsp extends $pb.GeneratedMessage {
  factory ParkRoomsRsp({
    $core.Iterable<ParkRoomChannel>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  ParkRoomsRsp._();

  factory ParkRoomsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParkRoomsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParkRoomsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'park_room'),
      createEmptyInstance: create)
    ..pPM<ParkRoomChannel>(1, _omitFieldNames ? '' : 'list',
        subBuilder: ParkRoomChannel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParkRoomsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParkRoomsRsp copyWith(void Function(ParkRoomsRsp) updates) =>
      super.copyWith((message) => updates(message as ParkRoomsRsp))
          as ParkRoomsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParkRoomsRsp create() => ParkRoomsRsp._();
  @$core.override
  ParkRoomsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParkRoomsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkRoomsRsp>(create);
  static ParkRoomsRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ParkRoomChannel> get list => $_getList(0);
}

class ParkRoomChannel extends $pb.GeneratedMessage {
  factory ParkRoomChannel({
    $core.String? title,
    $core.Iterable<ParkRoomItem>? list,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (list != null) result.list.addAll(list);
    return result;
  }

  ParkRoomChannel._();

  factory ParkRoomChannel.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParkRoomChannel.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParkRoomChannel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'park_room'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..pPM<ParkRoomItem>(2, _omitFieldNames ? '' : 'list',
        subBuilder: ParkRoomItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParkRoomChannel clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParkRoomChannel copyWith(void Function(ParkRoomChannel) updates) =>
      super.copyWith((message) => updates(message as ParkRoomChannel))
          as ParkRoomChannel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParkRoomChannel create() => ParkRoomChannel._();
  @$core.override
  ParkRoomChannel createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParkRoomChannel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkRoomChannel>(create);
  static ParkRoomChannel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<ParkRoomItem> get list => $_getList(1);
}

class ParkRoomItem extends $pb.GeneratedMessage {
  factory ParkRoomItem({
    $core.String? title,
    $core.String? imgUrl,
    $core.String? desc,
    $core.String? roomType,
    $core.int? onlineNum,
    $core.Iterable<$core.String>? thumbList,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (imgUrl != null) result.imgUrl = imgUrl;
    if (desc != null) result.desc = desc;
    if (roomType != null) result.roomType = roomType;
    if (onlineNum != null) result.onlineNum = onlineNum;
    if (thumbList != null) result.thumbList.addAll(thumbList);
    return result;
  }

  ParkRoomItem._();

  factory ParkRoomItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParkRoomItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParkRoomItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'park_room'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'imgUrl', protoName: 'imgUrl')
    ..aOS(3, _omitFieldNames ? '' : 'desc')
    ..aOS(4, _omitFieldNames ? '' : 'roomType', protoName: 'roomType')
    ..aI(5, _omitFieldNames ? '' : 'onlineNum', protoName: 'onlineNum')
    ..pPS(6, _omitFieldNames ? '' : 'thumbList', protoName: 'thumbList')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParkRoomItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParkRoomItem copyWith(void Function(ParkRoomItem) updates) =>
      super.copyWith((message) => updates(message as ParkRoomItem))
          as ParkRoomItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParkRoomItem create() => ParkRoomItem._();
  @$core.override
  ParkRoomItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParkRoomItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParkRoomItem>(create);
  static ParkRoomItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get imgUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set imgUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasImgUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearImgUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get roomType => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomType() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get onlineNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set onlineNum($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOnlineNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineNum() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get thumbList => $_getList(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

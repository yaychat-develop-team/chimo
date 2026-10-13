// This is a generated file - do not edit.
//
// Generated from server_client/room_vip.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class RoomVipListRsp extends $pb.GeneratedMessage {
  factory RoomVipListRsp({
    $core.Iterable<RoomVipItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  RoomVipListRsp._();

  factory RoomVipListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomVipListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomVipListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_vip'),
      createEmptyInstance: create)
    ..pPM<RoomVipItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: RoomVipItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomVipListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomVipListRsp copyWith(void Function(RoomVipListRsp) updates) =>
      super.copyWith((message) => updates(message as RoomVipListRsp))
          as RoomVipListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomVipListRsp create() => RoomVipListRsp._();
  @$core.override
  RoomVipListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomVipListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomVipListRsp>(create);
  static RoomVipListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RoomVipItem> get items => $_getList(0);
}

class RoomVipItem extends $pb.GeneratedMessage {
  factory RoomVipItem({
    $0.SimpleUser? user,
    $core.int? duration,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (duration != null) result.duration = duration;
    return result;
  }

  RoomVipItem._();

  factory RoomVipItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomVipItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomVipItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room_vip'),
      createEmptyInstance: create)
    ..aOM<$0.SimpleUser>(1, _omitFieldNames ? '' : 'user',
        subBuilder: $0.SimpleUser.create)
    ..aI(2, _omitFieldNames ? '' : 'duration', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomVipItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomVipItem copyWith(void Function(RoomVipItem) updates) =>
      super.copyWith((message) => updates(message as RoomVipItem))
          as RoomVipItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomVipItem create() => RoomVipItem._();
  @$core.override
  RoomVipItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomVipItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomVipItem>(create);
  static RoomVipItem? _defaultInstance;

  @$pb.TagNumber(1)
  $0.SimpleUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.SimpleUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.SimpleUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get duration => $_getIZ(1);
  @$pb.TagNumber(2)
  set duration($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

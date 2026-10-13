// This is a generated file - do not edit.
//
// Generated from server_client/knight.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'knight.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'knight.pbenum.dart';

class UserKnightInfo extends $pb.GeneratedMessage {
  factory UserKnightInfo({
    $core.int? level,
    $core.bool? invisibleEnterRoom,
    $core.bool? invisibleVisit,
    $core.bool? invisibleRank,
  }) {
    final result = create();
    if (level != null) result.level = level;
    if (invisibleEnterRoom != null)
      result.invisibleEnterRoom = invisibleEnterRoom;
    if (invisibleVisit != null) result.invisibleVisit = invisibleVisit;
    if (invisibleRank != null) result.invisibleRank = invisibleRank;
    return result;
  }

  UserKnightInfo._();

  factory UserKnightInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserKnightInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserKnightInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'knight'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'level')
    ..aOB(2, _omitFieldNames ? '' : 'invisibleEnterRoom')
    ..aOB(3, _omitFieldNames ? '' : 'invisibleVisit')
    ..aOB(4, _omitFieldNames ? '' : 'invisibleRank')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserKnightInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserKnightInfo copyWith(void Function(UserKnightInfo) updates) =>
      super.copyWith((message) => updates(message as UserKnightInfo))
          as UserKnightInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserKnightInfo create() => UserKnightInfo._();
  @$core.override
  UserKnightInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserKnightInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserKnightInfo>(create);
  static UserKnightInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get invisibleEnterRoom => $_getBF(1);
  @$pb.TagNumber(2)
  set invisibleEnterRoom($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasInvisibleEnterRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearInvisibleEnterRoom() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get invisibleVisit => $_getBF(2);
  @$pb.TagNumber(3)
  set invisibleVisit($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasInvisibleVisit() => $_has(2);
  @$pb.TagNumber(3)
  void clearInvisibleVisit() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get invisibleRank => $_getBF(3);
  @$pb.TagNumber(4)
  set invisibleRank($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasInvisibleRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearInvisibleRank() => $_clearField(4);
}

class KnightConfigResp extends $pb.GeneratedMessage {
  factory KnightConfigResp({
    $core.Iterable<KnightConfigLevelItem>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  KnightConfigResp._();

  factory KnightConfigResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KnightConfigResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KnightConfigResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'knight'),
      createEmptyInstance: create)
    ..pPM<KnightConfigLevelItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: KnightConfigLevelItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KnightConfigResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KnightConfigResp copyWith(void Function(KnightConfigResp) updates) =>
      super.copyWith((message) => updates(message as KnightConfigResp))
          as KnightConfigResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KnightConfigResp create() => KnightConfigResp._();
  @$core.override
  KnightConfigResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KnightConfigResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KnightConfigResp>(create);
  static KnightConfigResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<KnightConfigLevelItem> get list => $_getList(0);
}

class KnightConfigLevelItem extends $pb.GeneratedMessage {
  factory KnightConfigLevelItem({
    $core.Iterable<KnightPrivilegeItem>? list,
    $core.String? conditionMessage,
    $core.String? title,
    $core.String? icon,
    $core.int? level,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (conditionMessage != null) result.conditionMessage = conditionMessage;
    if (title != null) result.title = title;
    if (icon != null) result.icon = icon;
    if (level != null) result.level = level;
    return result;
  }

  KnightConfigLevelItem._();

  factory KnightConfigLevelItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KnightConfigLevelItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KnightConfigLevelItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'knight'),
      createEmptyInstance: create)
    ..pPM<KnightPrivilegeItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: KnightPrivilegeItem.create)
    ..aOS(2, _omitFieldNames ? '' : 'conditionMessage',
        protoName: 'conditionMessage')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'icon')
    ..aI(5, _omitFieldNames ? '' : 'level')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KnightConfigLevelItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KnightConfigLevelItem copyWith(
          void Function(KnightConfigLevelItem) updates) =>
      super.copyWith((message) => updates(message as KnightConfigLevelItem))
          as KnightConfigLevelItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KnightConfigLevelItem create() => KnightConfigLevelItem._();
  @$core.override
  KnightConfigLevelItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KnightConfigLevelItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KnightConfigLevelItem>(create);
  static KnightConfigLevelItem? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<KnightPrivilegeItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get conditionMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set conditionMessage($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConditionMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearConditionMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get level => $_getIZ(4);
  @$pb.TagNumber(5)
  set level($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLevel() => $_clearField(5);
}

class KnightPrivilegeItem extends $pb.GeneratedMessage {
  factory KnightPrivilegeItem({
    KnightPrivilegeType? type,
    $core.bool? privilegeActive,
    $core.int? privilegeValue,
    $core.String? shortMessage,
    $core.String? contentMessage,
    $core.String? descMessage,
    $core.String? icon,
    $core.String? image,
    $core.String? activeMinLevelMessage,
    $core.bool? open,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (privilegeActive != null) result.privilegeActive = privilegeActive;
    if (privilegeValue != null) result.privilegeValue = privilegeValue;
    if (shortMessage != null) result.shortMessage = shortMessage;
    if (contentMessage != null) result.contentMessage = contentMessage;
    if (descMessage != null) result.descMessage = descMessage;
    if (icon != null) result.icon = icon;
    if (image != null) result.image = image;
    if (activeMinLevelMessage != null)
      result.activeMinLevelMessage = activeMinLevelMessage;
    if (open != null) result.open = open;
    return result;
  }

  KnightPrivilegeItem._();

  factory KnightPrivilegeItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KnightPrivilegeItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KnightPrivilegeItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'knight'),
      createEmptyInstance: create)
    ..aE<KnightPrivilegeType>(1, _omitFieldNames ? '' : 'type',
        enumValues: KnightPrivilegeType.values)
    ..aOB(2, _omitFieldNames ? '' : 'privilegeActive',
        protoName: 'privilegeActive')
    ..aI(3, _omitFieldNames ? '' : 'privilegeValue',
        protoName: 'privilegeValue')
    ..aOS(4, _omitFieldNames ? '' : 'shortMessage', protoName: 'shortMessage')
    ..aOS(5, _omitFieldNames ? '' : 'contentMessage',
        protoName: 'contentMessage')
    ..aOS(6, _omitFieldNames ? '' : 'descMessage', protoName: 'descMessage')
    ..aOS(7, _omitFieldNames ? '' : 'icon')
    ..aOS(8, _omitFieldNames ? '' : 'image')
    ..aOS(9, _omitFieldNames ? '' : 'activeMinLevelMessage',
        protoName: 'activeMinLevelMessage')
    ..aOB(10, _omitFieldNames ? '' : 'open')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KnightPrivilegeItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KnightPrivilegeItem copyWith(void Function(KnightPrivilegeItem) updates) =>
      super.copyWith((message) => updates(message as KnightPrivilegeItem))
          as KnightPrivilegeItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KnightPrivilegeItem create() => KnightPrivilegeItem._();
  @$core.override
  KnightPrivilegeItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KnightPrivilegeItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KnightPrivilegeItem>(create);
  static KnightPrivilegeItem? _defaultInstance;

  @$pb.TagNumber(1)
  KnightPrivilegeType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(KnightPrivilegeType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get privilegeActive => $_getBF(1);
  @$pb.TagNumber(2)
  set privilegeActive($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrivilegeActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrivilegeActive() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get privilegeValue => $_getIZ(2);
  @$pb.TagNumber(3)
  set privilegeValue($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPrivilegeValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrivilegeValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get shortMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set shortMessage($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasShortMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearShortMessage() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get contentMessage => $_getSZ(4);
  @$pb.TagNumber(5)
  set contentMessage($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasContentMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearContentMessage() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get descMessage => $_getSZ(5);
  @$pb.TagNumber(6)
  set descMessage($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDescMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescMessage() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get icon => $_getSZ(6);
  @$pb.TagNumber(7)
  set icon($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearIcon() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get image => $_getSZ(7);
  @$pb.TagNumber(8)
  set image($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasImage() => $_has(7);
  @$pb.TagNumber(8)
  void clearImage() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get activeMinLevelMessage => $_getSZ(8);
  @$pb.TagNumber(9)
  set activeMinLevelMessage($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasActiveMinLevelMessage() => $_has(8);
  @$pb.TagNumber(9)
  void clearActiveMinLevelMessage() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get open => $_getBF(9);
  @$pb.TagNumber(10)
  set open($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasOpen() => $_has(9);
  @$pb.TagNumber(10)
  void clearOpen() => $_clearField(10);
}

class KnightAddHotReq extends $pb.GeneratedMessage {
  factory KnightAddHotReq({
    $fixnum.Int64? roomId,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  KnightAddHotReq._();

  factory KnightAddHotReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KnightAddHotReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KnightAddHotReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'knight'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId', protoName: 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KnightAddHotReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KnightAddHotReq copyWith(void Function(KnightAddHotReq) updates) =>
      super.copyWith((message) => updates(message as KnightAddHotReq))
          as KnightAddHotReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KnightAddHotReq create() => KnightAddHotReq._();
  @$core.override
  KnightAddHotReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KnightAddHotReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KnightAddHotReq>(create);
  static KnightAddHotReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);
}

class KnightLevelChangeResp extends $pb.GeneratedMessage {
  factory KnightLevelChangeResp({
    $core.int? level,
  }) {
    final result = create();
    if (level != null) result.level = level;
    return result;
  }

  KnightLevelChangeResp._();

  factory KnightLevelChangeResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KnightLevelChangeResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KnightLevelChangeResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'knight'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'level')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KnightLevelChangeResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KnightLevelChangeResp copyWith(
          void Function(KnightLevelChangeResp) updates) =>
      super.copyWith((message) => updates(message as KnightLevelChangeResp))
          as KnightLevelChangeResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KnightLevelChangeResp create() => KnightLevelChangeResp._();
  @$core.override
  KnightLevelChangeResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KnightLevelChangeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KnightLevelChangeResp>(create);
  static KnightLevelChangeResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => $_clearField(1);
}

class KnightHotChangeResp extends $pb.GeneratedMessage {
  factory KnightHotChangeResp({
    $fixnum.Int64? heat,
  }) {
    final result = create();
    if (heat != null) result.heat = heat;
    return result;
  }

  KnightHotChangeResp._();

  factory KnightHotChangeResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KnightHotChangeResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KnightHotChangeResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'knight'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'heat')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KnightHotChangeResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KnightHotChangeResp copyWith(void Function(KnightHotChangeResp) updates) =>
      super.copyWith((message) => updates(message as KnightHotChangeResp))
          as KnightHotChangeResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KnightHotChangeResp create() => KnightHotChangeResp._();
  @$core.override
  KnightHotChangeResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KnightHotChangeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KnightHotChangeResp>(create);
  static KnightHotChangeResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get heat => $_getI64(0);
  @$pb.TagNumber(1)
  set heat($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHeat() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeat() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

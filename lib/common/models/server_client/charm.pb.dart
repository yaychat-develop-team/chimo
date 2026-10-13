// This is a generated file - do not edit.
//
// Generated from server_client/charm.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CharmLevelRsp extends $pb.GeneratedMessage {
  factory CharmLevelRsp({
    $0.User? user,
    $core.int? charmLevel,
    $core.String? levelIcon,
    $core.String? namePlate,
    $fixnum.Int64? charmPoint,
    $fixnum.Int64? nextLevelPoint,
    $core.Iterable<CharmRewardLevel>? levels,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (charmLevel != null) result.charmLevel = charmLevel;
    if (levelIcon != null) result.levelIcon = levelIcon;
    if (namePlate != null) result.namePlate = namePlate;
    if (charmPoint != null) result.charmPoint = charmPoint;
    if (nextLevelPoint != null) result.nextLevelPoint = nextLevelPoint;
    if (levels != null) result.levels.addAll(levels);
    return result;
  }

  CharmLevelRsp._();

  factory CharmLevelRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CharmLevelRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CharmLevelRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'charm'),
      createEmptyInstance: create)
    ..aOM<$0.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $0.User.create)
    ..aI(2, _omitFieldNames ? '' : 'charmLevel')
    ..aOS(3, _omitFieldNames ? '' : 'levelIcon')
    ..aOS(4, _omitFieldNames ? '' : 'namePlate')
    ..aInt64(5, _omitFieldNames ? '' : 'charmPoint')
    ..aInt64(6, _omitFieldNames ? '' : 'nextLevelPoint')
    ..pPM<CharmRewardLevel>(9, _omitFieldNames ? '' : 'levels',
        subBuilder: CharmRewardLevel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CharmLevelRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CharmLevelRsp copyWith(void Function(CharmLevelRsp) updates) =>
      super.copyWith((message) => updates(message as CharmLevelRsp))
          as CharmLevelRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CharmLevelRsp create() => CharmLevelRsp._();
  @$core.override
  CharmLevelRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CharmLevelRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CharmLevelRsp>(create);
  static CharmLevelRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $0.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get charmLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set charmLevel($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCharmLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearCharmLevel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get levelIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set levelIcon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLevelIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevelIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get namePlate => $_getSZ(3);
  @$pb.TagNumber(4)
  set namePlate($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNamePlate() => $_has(3);
  @$pb.TagNumber(4)
  void clearNamePlate() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get charmPoint => $_getI64(4);
  @$pb.TagNumber(5)
  set charmPoint($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCharmPoint() => $_has(4);
  @$pb.TagNumber(5)
  void clearCharmPoint() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get nextLevelPoint => $_getI64(5);
  @$pb.TagNumber(6)
  set nextLevelPoint($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNextLevelPoint() => $_has(5);
  @$pb.TagNumber(6)
  void clearNextLevelPoint() => $_clearField(6);

  @$pb.TagNumber(9)
  $pb.PbList<CharmRewardLevel> get levels => $_getList(6);
}

class CharmRewardLevel extends $pb.GeneratedMessage {
  factory CharmRewardLevel({
    $core.int? level,
    $core.bool? unlocked,
    $core.Iterable<CharmRewardItem>? items,
  }) {
    final result = create();
    if (level != null) result.level = level;
    if (unlocked != null) result.unlocked = unlocked;
    if (items != null) result.items.addAll(items);
    return result;
  }

  CharmRewardLevel._();

  factory CharmRewardLevel.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CharmRewardLevel.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CharmRewardLevel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'charm'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'level')
    ..aOB(2, _omitFieldNames ? '' : 'unlocked')
    ..pPM<CharmRewardItem>(3, _omitFieldNames ? '' : 'items',
        subBuilder: CharmRewardItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CharmRewardLevel clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CharmRewardLevel copyWith(void Function(CharmRewardLevel) updates) =>
      super.copyWith((message) => updates(message as CharmRewardLevel))
          as CharmRewardLevel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CharmRewardLevel create() => CharmRewardLevel._();
  @$core.override
  CharmRewardLevel createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CharmRewardLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CharmRewardLevel>(create);
  static CharmRewardLevel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get unlocked => $_getBF(1);
  @$pb.TagNumber(2)
  set unlocked($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUnlocked() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnlocked() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<CharmRewardItem> get items => $_getList(2);
}

class CharmRewardItem extends $pb.GeneratedMessage {
  factory CharmRewardItem({
    $core.String? typeName,
    $core.String? icon,
  }) {
    final result = create();
    if (typeName != null) result.typeName = typeName;
    if (icon != null) result.icon = icon;
    return result;
  }

  CharmRewardItem._();

  factory CharmRewardItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CharmRewardItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CharmRewardItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'charm'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'typeName', protoName: 'typeName')
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CharmRewardItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CharmRewardItem copyWith(void Function(CharmRewardItem) updates) =>
      super.copyWith((message) => updates(message as CharmRewardItem))
          as CharmRewardItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CharmRewardItem create() => CharmRewardItem._();
  @$core.override
  CharmRewardItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CharmRewardItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CharmRewardItem>(create);
  static CharmRewardItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get typeName => $_getSZ(0);
  @$pb.TagNumber(1)
  set typeName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTypeName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTypeName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

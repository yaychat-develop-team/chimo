// This is a generated file - do not edit.
//
// Generated from server_client/cmd.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart' as $0;

import 'cmd.pbenum.dart';
import 'commodity.pb.dart' as $1;
import 'user.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'cmd.pbenum.dart';

class EaseCmdPush extends $pb.GeneratedMessage {
  factory EaseCmdPush({
    EaseCmdPushType? type,
    $0.Any? content,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (content != null) result.content = content;
    return result;
  }

  EaseCmdPush._();

  factory EaseCmdPush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EaseCmdPush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EaseCmdPush',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aE<EaseCmdPushType>(1, _omitFieldNames ? '' : 'type',
        enumValues: EaseCmdPushType.values)
    ..aOM<$0.Any>(2, _omitFieldNames ? '' : 'content',
        subBuilder: $0.Any.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EaseCmdPush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EaseCmdPush copyWith(void Function(EaseCmdPush) updates) =>
      super.copyWith((message) => updates(message as EaseCmdPush))
          as EaseCmdPush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EaseCmdPush create() => EaseCmdPush._();
  @$core.override
  EaseCmdPush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EaseCmdPush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EaseCmdPush>(create);
  static EaseCmdPush? _defaultInstance;

  @$pb.TagNumber(1)
  EaseCmdPushType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(EaseCmdPushType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Any get content => $_getN(1);
  @$pb.TagNumber(2)
  set content($0.Any value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Any ensureContent() => $_ensure(1);
}

/// *
///  应用内弹窗
class PopWindow extends $pb.GeneratedMessage {
  factory PopWindow({
    PopWindowType? type,
    $core.String? title,
    $core.String? content,
    $core.String? icon,
    $core.String? btnText,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (title != null) result.title = title;
    if (content != null) result.content = content;
    if (icon != null) result.icon = icon;
    if (btnText != null) result.btnText = btnText;
    return result;
  }

  PopWindow._();

  factory PopWindow.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PopWindow.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PopWindow',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aE<PopWindowType>(1, _omitFieldNames ? '' : 'type',
        enumValues: PopWindowType.values)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..aOS(4, _omitFieldNames ? '' : 'icon')
    ..aOS(5, _omitFieldNames ? '' : 'btnText')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PopWindow clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PopWindow copyWith(void Function(PopWindow) updates) =>
      super.copyWith((message) => updates(message as PopWindow)) as PopWindow;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PopWindow create() => PopWindow._();
  @$core.override
  PopWindow createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PopWindow getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PopWindow>(create);
  static PopWindow? _defaultInstance;

  @$pb.TagNumber(1)
  PopWindowType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(PopWindowType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get btnText => $_getSZ(4);
  @$pb.TagNumber(5)
  set btnText($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBtnText() => $_has(4);
  @$pb.TagNumber(5)
  void clearBtnText() => $_clearField(5);
}

/// 亲密度升级
class IntimacyUpgrade extends $pb.GeneratedMessage {
  factory IntimacyUpgrade({
    $core.String? effectUrl,
    $core.double? intimacyPercent,
    $fixnum.Int64? uid,
    $core.String? emUsername,
    $core.bool? fullUpgrade,
  }) {
    final result = create();
    if (effectUrl != null) result.effectUrl = effectUrl;
    if (intimacyPercent != null) result.intimacyPercent = intimacyPercent;
    if (uid != null) result.uid = uid;
    if (emUsername != null) result.emUsername = emUsername;
    if (fullUpgrade != null) result.fullUpgrade = fullUpgrade;
    return result;
  }

  IntimacyUpgrade._();

  factory IntimacyUpgrade.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IntimacyUpgrade.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IntimacyUpgrade',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'effectUrl')
    ..aD(2, _omitFieldNames ? '' : 'intimacyPercent')
    ..aInt64(3, _omitFieldNames ? '' : 'uid')
    ..aOS(4, _omitFieldNames ? '' : 'emUsername')
    ..aOB(5, _omitFieldNames ? '' : 'fullUpgrade')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IntimacyUpgrade clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IntimacyUpgrade copyWith(void Function(IntimacyUpgrade) updates) =>
      super.copyWith((message) => updates(message as IntimacyUpgrade))
          as IntimacyUpgrade;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IntimacyUpgrade create() => IntimacyUpgrade._();
  @$core.override
  IntimacyUpgrade createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IntimacyUpgrade getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IntimacyUpgrade>(create);
  static IntimacyUpgrade? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get effectUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set effectUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEffectUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearEffectUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get intimacyPercent => $_getN(1);
  @$pb.TagNumber(2)
  set intimacyPercent($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIntimacyPercent() => $_has(1);
  @$pb.TagNumber(2)
  void clearIntimacyPercent() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get uid => $_getI64(2);
  @$pb.TagNumber(3)
  set uid($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get emUsername => $_getSZ(3);
  @$pb.TagNumber(4)
  set emUsername($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmUsername() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmUsername() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get fullUpgrade => $_getBF(4);
  @$pb.TagNumber(5)
  set fullUpgrade($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFullUpgrade() => $_has(4);
  @$pb.TagNumber(5)
  void clearFullUpgrade() => $_clearField(5);
}

/// 主播魅力等级升级
class CharmLevelUp extends $pb.GeneratedMessage {
  factory CharmLevelUp({
    $fixnum.Int64? uid,
    $core.int? level,
    $core.String? icon,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (level != null) result.level = level;
    if (icon != null) result.icon = icon;
    return result;
  }

  CharmLevelUp._();

  factory CharmLevelUp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CharmLevelUp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CharmLevelUp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aI(2, _omitFieldNames ? '' : 'level')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CharmLevelUp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CharmLevelUp copyWith(void Function(CharmLevelUp) updates) =>
      super.copyWith((message) => updates(message as CharmLevelUp))
          as CharmLevelUp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CharmLevelUp create() => CharmLevelUp._();
  @$core.override
  CharmLevelUp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CharmLevelUp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CharmLevelUp>(create);
  static CharmLevelUp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get level => $_getIZ(1);
  @$pb.TagNumber(2)
  set level($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);
}

/// 心愿卡
class GiftWishCardMsg extends $pb.GeneratedMessage {
  factory GiftWishCardMsg({
    $core.String? msgId,
    $core.int? state,
  }) {
    final result = create();
    if (msgId != null) result.msgId = msgId;
    if (state != null) result.state = state;
    return result;
  }

  GiftWishCardMsg._();

  factory GiftWishCardMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GiftWishCardMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GiftWishCardMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'msgId', protoName: 'msgId')
    ..aI(2, _omitFieldNames ? '' : 'state', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftWishCardMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftWishCardMsg copyWith(void Function(GiftWishCardMsg) updates) =>
      super.copyWith((message) => updates(message as GiftWishCardMsg))
          as GiftWishCardMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GiftWishCardMsg create() => GiftWishCardMsg._();
  @$core.override
  GiftWishCardMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GiftWishCardMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWishCardMsg>(create);
  static GiftWishCardMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msgId => $_getSZ(0);
  @$pb.TagNumber(1)
  set msgId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMsgId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsgId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get state => $_getIZ(1);
  @$pb.TagNumber(2)
  set state($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => $_clearField(2);
}

/// 通用的cmd消息
class CommonCmdMsg extends $pb.GeneratedMessage {
  factory CommonCmdMsg({
    $core.String? cmd,
    $core.String? extra,
  }) {
    final result = create();
    if (cmd != null) result.cmd = cmd;
    if (extra != null) result.extra = extra;
    return result;
  }

  CommonCmdMsg._();

  factory CommonCmdMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommonCmdMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommonCmdMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cmd')
    ..aOS(2, _omitFieldNames ? '' : 'extra')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommonCmdMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommonCmdMsg copyWith(void Function(CommonCmdMsg) updates) =>
      super.copyWith((message) => updates(message as CommonCmdMsg))
          as CommonCmdMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommonCmdMsg create() => CommonCmdMsg._();
  @$core.override
  CommonCmdMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommonCmdMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonCmdMsg>(create);
  static CommonCmdMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cmd => $_getSZ(0);
  @$pb.TagNumber(1)
  set cmd($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCmd() => $_has(0);
  @$pb.TagNumber(1)
  void clearCmd() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get extra => $_getSZ(1);
  @$pb.TagNumber(2)
  set extra($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExtra() => $_has(1);
  @$pb.TagNumber(2)
  void clearExtra() => $_clearField(2);
}

/// 新用户分发消息
class NewUserDispatchMsg extends $pb.GeneratedMessage {
  factory NewUserDispatchMsg({
    $fixnum.Int64? uid,
    $core.String? emUsername,
    $core.String? avatar,
    $core.String? nickname,
    $core.int? age,
    $core.String? gender,
    $core.String? desc,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (emUsername != null) result.emUsername = emUsername;
    if (avatar != null) result.avatar = avatar;
    if (nickname != null) result.nickname = nickname;
    if (age != null) result.age = age;
    if (gender != null) result.gender = gender;
    if (desc != null) result.desc = desc;
    return result;
  }

  NewUserDispatchMsg._();

  factory NewUserDispatchMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewUserDispatchMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewUserDispatchMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'emUsername')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'nickname')
    ..aI(5, _omitFieldNames ? '' : 'age')
    ..aOS(6, _omitFieldNames ? '' : 'gender')
    ..aOS(7, _omitFieldNames ? '' : 'desc')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewUserDispatchMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewUserDispatchMsg copyWith(void Function(NewUserDispatchMsg) updates) =>
      super.copyWith((message) => updates(message as NewUserDispatchMsg))
          as NewUserDispatchMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewUserDispatchMsg create() => NewUserDispatchMsg._();
  @$core.override
  NewUserDispatchMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewUserDispatchMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewUserDispatchMsg>(create);
  static NewUserDispatchMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get emUsername => $_getSZ(1);
  @$pb.TagNumber(2)
  set emUsername($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEmUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmUsername() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get nickname => $_getSZ(3);
  @$pb.TagNumber(4)
  set nickname($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNickname() => $_has(3);
  @$pb.TagNumber(4)
  void clearNickname() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get age => $_getIZ(4);
  @$pb.TagNumber(5)
  set age($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAge() => $_has(4);
  @$pb.TagNumber(5)
  void clearAge() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get gender => $_getSZ(5);
  @$pb.TagNumber(6)
  set gender($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGender() => $_has(5);
  @$pb.TagNumber(6)
  void clearGender() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get desc => $_getSZ(6);
  @$pb.TagNumber(7)
  set desc($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDesc() => $_has(6);
  @$pb.TagNumber(7)
  void clearDesc() => $_clearField(7);
}

/// 定时用户分发消息
class TimerUserDispatchMsg extends $pb.GeneratedMessage {
  factory TimerUserDispatchMsg({
    NewUserDispatchMsg? user,
    $core.String? progress,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (progress != null) result.progress = progress;
    return result;
  }

  TimerUserDispatchMsg._();

  factory TimerUserDispatchMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TimerUserDispatchMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TimerUserDispatchMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aOM<NewUserDispatchMsg>(1, _omitFieldNames ? '' : 'user',
        subBuilder: NewUserDispatchMsg.create)
    ..aOS(2, _omitFieldNames ? '' : 'progress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TimerUserDispatchMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TimerUserDispatchMsg copyWith(void Function(TimerUserDispatchMsg) updates) =>
      super.copyWith((message) => updates(message as TimerUserDispatchMsg))
          as TimerUserDispatchMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimerUserDispatchMsg create() => TimerUserDispatchMsg._();
  @$core.override
  TimerUserDispatchMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TimerUserDispatchMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TimerUserDispatchMsg>(create);
  static TimerUserDispatchMsg? _defaultInstance;

  @$pb.TagNumber(1)
  NewUserDispatchMsg get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(NewUserDispatchMsg value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  NewUserDispatchMsg ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get progress => $_getSZ(1);
  @$pb.TagNumber(2)
  set progress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProgress() => $_has(1);
  @$pb.TagNumber(2)
  void clearProgress() => $_clearField(2);
}

class CrystalDropMsg extends $pb.GeneratedMessage {
  factory CrystalDropMsg({
    $core.int? count,
  }) {
    final result = create();
    if (count != null) result.count = count;
    return result;
  }

  CrystalDropMsg._();

  factory CrystalDropMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CrystalDropMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CrystalDropMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrystalDropMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CrystalDropMsg copyWith(void Function(CrystalDropMsg) updates) =>
      super.copyWith((message) => updates(message as CrystalDropMsg))
          as CrystalDropMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CrystalDropMsg create() => CrystalDropMsg._();
  @$core.override
  CrystalDropMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CrystalDropMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CrystalDropMsg>(create);
  static CrystalDropMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);
}

/// 用户回归礼包消息
class UserBackPackagesMsg extends $pb.GeneratedMessage {
  factory UserBackPackagesMsg({
    $core.String? welcome,
    $core.Iterable<$1.CommodityItem>? items,
  }) {
    final result = create();
    if (welcome != null) result.welcome = welcome;
    if (items != null) result.items.addAll(items);
    return result;
  }

  UserBackPackagesMsg._();

  factory UserBackPackagesMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserBackPackagesMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserBackPackagesMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'welcome')
    ..pPM<$1.CommodityItem>(2, _omitFieldNames ? '' : 'items',
        subBuilder: $1.CommodityItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserBackPackagesMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserBackPackagesMsg copyWith(void Function(UserBackPackagesMsg) updates) =>
      super.copyWith((message) => updates(message as UserBackPackagesMsg))
          as UserBackPackagesMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserBackPackagesMsg create() => UserBackPackagesMsg._();
  @$core.override
  UserBackPackagesMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserBackPackagesMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserBackPackagesMsg>(create);
  static UserBackPackagesMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get welcome => $_getSZ(0);
  @$pb.TagNumber(1)
  set welcome($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWelcome() => $_has(0);
  @$pb.TagNumber(1)
  void clearWelcome() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$1.CommodityItem> get items => $_getList(1);
}

class HonorReceiveMsg extends $pb.GeneratedMessage {
  factory HonorReceiveMsg({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? img,
    $core.String? content,
    $fixnum.Int64? days,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (img != null) result.img = img;
    if (content != null) result.content = content;
    if (days != null) result.days = days;
    return result;
  }

  HonorReceiveMsg._();

  factory HonorReceiveMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HonorReceiveMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HonorReceiveMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'img')
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..aInt64(5, _omitFieldNames ? '' : 'days')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonorReceiveMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonorReceiveMsg copyWith(void Function(HonorReceiveMsg) updates) =>
      super.copyWith((message) => updates(message as HonorReceiveMsg))
          as HonorReceiveMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HonorReceiveMsg create() => HonorReceiveMsg._();
  @$core.override
  HonorReceiveMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HonorReceiveMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HonorReceiveMsg>(create);
  static HonorReceiveMsg? _defaultInstance;

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
  $core.String get img => $_getSZ(2);
  @$pb.TagNumber(3)
  set img($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasImg() => $_has(2);
  @$pb.TagNumber(3)
  void clearImg() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get days => $_getI64(4);
  @$pb.TagNumber(5)
  set days($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDays() => $_has(4);
  @$pb.TagNumber(5)
  void clearDays() => $_clearField(5);
}

class AgentCallMsg extends $pb.GeneratedMessage {
  factory AgentCallMsg({
    AgentCallMsg_Status? status,
    $fixnum.Int64? gsUid,
    $core.String? name,
    $core.String? avatar,
    $fixnum.Int64? agentUid,
    $fixnum.Int64? rid,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (gsUid != null) result.gsUid = gsUid;
    if (name != null) result.name = name;
    if (avatar != null) result.avatar = avatar;
    if (agentUid != null) result.agentUid = agentUid;
    if (rid != null) result.rid = rid;
    return result;
  }

  AgentCallMsg._();

  factory AgentCallMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AgentCallMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AgentCallMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aE<AgentCallMsg_Status>(1, _omitFieldNames ? '' : 'status',
        enumValues: AgentCallMsg_Status.values)
    ..aInt64(2, _omitFieldNames ? '' : 'gsUid')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..aInt64(5, _omitFieldNames ? '' : 'agentUid')
    ..aInt64(6, _omitFieldNames ? '' : 'rid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentCallMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AgentCallMsg copyWith(void Function(AgentCallMsg) updates) =>
      super.copyWith((message) => updates(message as AgentCallMsg))
          as AgentCallMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AgentCallMsg create() => AgentCallMsg._();
  @$core.override
  AgentCallMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AgentCallMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AgentCallMsg>(create);
  static AgentCallMsg? _defaultInstance;

  @$pb.TagNumber(1)
  AgentCallMsg_Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(AgentCallMsg_Status value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get gsUid => $_getI64(1);
  @$pb.TagNumber(2)
  set gsUid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGsUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearGsUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatar($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatar() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get agentUid => $_getI64(4);
  @$pb.TagNumber(5)
  set agentUid($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAgentUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearAgentUid() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get rid => $_getI64(5);
  @$pb.TagNumber(6)
  set rid($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRid() => $_has(5);
  @$pb.TagNumber(6)
  void clearRid() => $_clearField(6);
}

/// 游戏物品掉落
class GameItemDropMsg extends $pb.GeneratedMessage {
  factory GameItemDropMsg({
    $core.String? icon,
    $core.int? quantity,
    $core.String? effect,
  }) {
    final result = create();
    if (icon != null) result.icon = icon;
    if (quantity != null) result.quantity = quantity;
    if (effect != null) result.effect = effect;
    return result;
  }

  GameItemDropMsg._();

  factory GameItemDropMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GameItemDropMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GameItemDropMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'icon')
    ..aI(2, _omitFieldNames ? '' : 'quantity', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'effect')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GameItemDropMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GameItemDropMsg copyWith(void Function(GameItemDropMsg) updates) =>
      super.copyWith((message) => updates(message as GameItemDropMsg))
          as GameItemDropMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GameItemDropMsg create() => GameItemDropMsg._();
  @$core.override
  GameItemDropMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GameItemDropMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GameItemDropMsg>(create);
  static GameItemDropMsg? _defaultInstance;

  /// 图标
  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => $_clearField(1);

  /// 数量
  @$pb.TagNumber(2)
  $core.int get quantity => $_getIZ(1);
  @$pb.TagNumber(2)
  set quantity($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => $_clearField(2);

  /// 动效
  @$pb.TagNumber(3)
  $core.String get effect => $_getSZ(2);
  @$pb.TagNumber(3)
  set effect($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEffect() => $_has(2);
  @$pb.TagNumber(3)
  void clearEffect() => $_clearField(3);
}

class JoinGroupMessage extends $pb.GeneratedMessage {
  factory JoinGroupMessage({
    $fixnum.Int64? uid,
    $core.String? name,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (name != null) result.name = name;
    return result;
  }

  JoinGroupMessage._();

  factory JoinGroupMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JoinGroupMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JoinGroupMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinGroupMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JoinGroupMessage copyWith(void Function(JoinGroupMessage) updates) =>
      super.copyWith((message) => updates(message as JoinGroupMessage))
          as JoinGroupMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinGroupMessage create() => JoinGroupMessage._();
  @$core.override
  JoinGroupMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JoinGroupMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinGroupMessage>(create);
  static JoinGroupMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);
}

class QuizChipsMessage extends $pb.GeneratedMessage {
  factory QuizChipsMessage({
    $2.User? user,
  }) {
    final result = create();
    if (user != null) result.user = user;
    return result;
  }

  QuizChipsMessage._();

  factory QuizChipsMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizChipsMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizChipsMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aOM<$2.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $2.User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizChipsMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizChipsMessage copyWith(void Function(QuizChipsMessage) updates) =>
      super.copyWith((message) => updates(message as QuizChipsMessage))
          as QuizChipsMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizChipsMessage create() => QuizChipsMessage._();
  @$core.override
  QuizChipsMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizChipsMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizChipsMessage>(create);
  static QuizChipsMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $2.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($2.User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $2.User ensureUser() => $_ensure(0);
}

class StrangerGreetQuota extends $pb.GeneratedMessage {
  factory StrangerGreetQuota({
    $core.int? remaining,
    $core.bool? unlimited,
    $core.int? chatCardCount,
  }) {
    final result = create();
    if (remaining != null) result.remaining = remaining;
    if (unlimited != null) result.unlimited = unlimited;
    if (chatCardCount != null) result.chatCardCount = chatCardCount;
    return result;
  }

  StrangerGreetQuota._();

  factory StrangerGreetQuota.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StrangerGreetQuota.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StrangerGreetQuota',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'remaining')
    ..aOB(2, _omitFieldNames ? '' : 'unlimited')
    ..aI(3, _omitFieldNames ? '' : 'chatCardCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StrangerGreetQuota clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StrangerGreetQuota copyWith(void Function(StrangerGreetQuota) updates) =>
      super.copyWith((message) => updates(message as StrangerGreetQuota))
          as StrangerGreetQuota;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StrangerGreetQuota create() => StrangerGreetQuota._();
  @$core.override
  StrangerGreetQuota createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StrangerGreetQuota getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StrangerGreetQuota>(create);
  static StrangerGreetQuota? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get remaining => $_getIZ(0);
  @$pb.TagNumber(1)
  set remaining($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRemaining() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemaining() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get unlimited => $_getBF(1);
  @$pb.TagNumber(2)
  set unlimited($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUnlimited() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnlimited() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get chatCardCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set chatCardCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChatCardCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatCardCount() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

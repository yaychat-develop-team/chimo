// This is a generated file - do not edit.
//
// Generated from server_client/gold_couple.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GoldCoupleGetCodeRsp extends $pb.GeneratedMessage {
  factory GoldCoupleGetCodeRsp({
    $core.String? code,
  }) {
    final result = create();
    if (code != null) result.code = code;
    return result;
  }

  GoldCoupleGetCodeRsp._();

  factory GoldCoupleGetCodeRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GoldCoupleGetCodeRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GoldCoupleGetCodeRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gold_couple'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GoldCoupleGetCodeRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GoldCoupleGetCodeRsp copyWith(void Function(GoldCoupleGetCodeRsp) updates) =>
      super.copyWith((message) => updates(message as GoldCoupleGetCodeRsp))
          as GoldCoupleGetCodeRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GoldCoupleGetCodeRsp create() => GoldCoupleGetCodeRsp._();
  @$core.override
  GoldCoupleGetCodeRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GoldCoupleGetCodeRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GoldCoupleGetCodeRsp>(create);
  static GoldCoupleGetCodeRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);
}

/// *
///  IM 单聊里的 GoldCouple 邀请卡片，两种卡片共用一个 body。
/// 单聊自定义消息 type：GoldCoupleCpInvite（CP 邀请）、GoldCoupleGameInvite（游戏邀请）
class GoldCoupleInviteCard extends $pb.GeneratedMessage {
  factory GoldCoupleInviteCard({
    $core.String? appName,
    $core.String? appIcon,
    $core.String? tag,
    $core.String? cover,
    $core.String? title,
    $core.String? desc,
    $core.String? url,
  }) {
    final result = create();
    if (appName != null) result.appName = appName;
    if (appIcon != null) result.appIcon = appIcon;
    if (tag != null) result.tag = tag;
    if (cover != null) result.cover = cover;
    if (title != null) result.title = title;
    if (desc != null) result.desc = desc;
    if (url != null) result.url = url;
    return result;
  }

  GoldCoupleInviteCard._();

  factory GoldCoupleInviteCard.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GoldCoupleInviteCard.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GoldCoupleInviteCard',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gold_couple'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'appName')
    ..aOS(2, _omitFieldNames ? '' : 'appIcon')
    ..aOS(3, _omitFieldNames ? '' : 'tag')
    ..aOS(4, _omitFieldNames ? '' : 'cover')
    ..aOS(5, _omitFieldNames ? '' : 'title')
    ..aOS(6, _omitFieldNames ? '' : 'desc')
    ..aOS(7, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GoldCoupleInviteCard clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GoldCoupleInviteCard copyWith(void Function(GoldCoupleInviteCard) updates) =>
      super.copyWith((message) => updates(message as GoldCoupleInviteCard))
          as GoldCoupleInviteCard;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GoldCoupleInviteCard create() => GoldCoupleInviteCard._();
  @$core.override
  GoldCoupleInviteCard createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GoldCoupleInviteCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GoldCoupleInviteCard>(create);
  static GoldCoupleInviteCard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get appName => $_getSZ(0);
  @$pb.TagNumber(1)
  set appName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAppName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get appIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set appIcon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAppIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearAppIcon() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get tag => $_getSZ(2);
  @$pb.TagNumber(3)
  set tag($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTag() => $_has(2);
  @$pb.TagNumber(3)
  void clearTag() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get cover => $_getSZ(3);
  @$pb.TagNumber(4)
  set cover($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCover() => $_has(3);
  @$pb.TagNumber(4)
  void clearCover() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(5)
  set title($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get url => $_getSZ(6);
  @$pb.TagNumber(7)
  set url($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearUrl() => $_clearField(7);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

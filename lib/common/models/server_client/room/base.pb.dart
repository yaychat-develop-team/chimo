// This is a generated file - do not edit.
//
// Generated from server_client/room/base.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'base.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'base.pbenum.dart';

class CheckMsgLinkItem extends $pb.GeneratedMessage {
  factory CheckMsgLinkItem({
    $core.String? linkContent,
    $core.String? linkColor,
    $core.String? linkSchema,
  }) {
    final result = create();
    if (linkContent != null) result.linkContent = linkContent;
    if (linkColor != null) result.linkColor = linkColor;
    if (linkSchema != null) result.linkSchema = linkSchema;
    return result;
  }

  CheckMsgLinkItem._();

  factory CheckMsgLinkItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckMsgLinkItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckMsgLinkItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'linkContent')
    ..aOS(2, _omitFieldNames ? '' : 'linkColor')
    ..aOS(3, _omitFieldNames ? '' : 'linkSchema')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckMsgLinkItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckMsgLinkItem copyWith(void Function(CheckMsgLinkItem) updates) =>
      super.copyWith((message) => updates(message as CheckMsgLinkItem))
          as CheckMsgLinkItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckMsgLinkItem create() => CheckMsgLinkItem._();
  @$core.override
  CheckMsgLinkItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckMsgLinkItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckMsgLinkItem>(create);
  static CheckMsgLinkItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get linkContent => $_getSZ(0);
  @$pb.TagNumber(1)
  set linkContent($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLinkContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearLinkContent() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get linkColor => $_getSZ(1);
  @$pb.TagNumber(2)
  set linkColor($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLinkColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearLinkColor() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get linkSchema => $_getSZ(2);
  @$pb.TagNumber(3)
  set linkSchema($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLinkSchema() => $_has(2);
  @$pb.TagNumber(3)
  void clearLinkSchema() => $_clearField(3);
}

class CheckMsgItem extends $pb.GeneratedMessage {
  factory CheckMsgItem({
    $core.String? icon,
    $core.String? title,
    $core.String? content,
    $core.Iterable<CheckMsgLinkItem>? linkList,
  }) {
    final result = create();
    if (icon != null) result.icon = icon;
    if (title != null) result.title = title;
    if (content != null) result.content = content;
    if (linkList != null) result.linkList.addAll(linkList);
    return result;
  }

  CheckMsgItem._();

  factory CheckMsgItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckMsgItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckMsgItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'icon')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..pPM<CheckMsgLinkItem>(4, _omitFieldNames ? '' : 'linkList',
        subBuilder: CheckMsgLinkItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckMsgItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckMsgItem copyWith(void Function(CheckMsgItem) updates) =>
      super.copyWith((message) => updates(message as CheckMsgItem))
          as CheckMsgItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckMsgItem create() => CheckMsgItem._();
  @$core.override
  CheckMsgItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckMsgItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckMsgItem>(create);
  static CheckMsgItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => $_clearField(1);

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
  $pb.PbList<CheckMsgLinkItem> get linkList => $_getList(3);
}

class ButtonInfoItem extends $pb.GeneratedMessage {
  factory ButtonInfoItem({
    $core.String? title,
    $core.String? linkSchema,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (linkSchema != null) result.linkSchema = linkSchema;
    return result;
  }

  ButtonInfoItem._();

  factory ButtonInfoItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ButtonInfoItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ButtonInfoItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'linkSchema')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ButtonInfoItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ButtonInfoItem copyWith(void Function(ButtonInfoItem) updates) =>
      super.copyWith((message) => updates(message as ButtonInfoItem))
          as ButtonInfoItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ButtonInfoItem create() => ButtonInfoItem._();
  @$core.override
  ButtonInfoItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ButtonInfoItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ButtonInfoItem>(create);
  static ButtonInfoItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get linkSchema => $_getSZ(1);
  @$pb.TagNumber(2)
  set linkSchema($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLinkSchema() => $_has(1);
  @$pb.TagNumber(2)
  void clearLinkSchema() => $_clearField(2);
}

/// *
/// /api/v1/rtc/check-list
class RoomCheckItem extends $pb.GeneratedMessage {
  factory RoomCheckItem({
    CreateType? createType,
    $fixnum.Int64? rid,
    $core.bool? checkResult,
    CheckMsgItem? checkMsg,
    ButtonInfoItem? btn,
  }) {
    final result = create();
    if (createType != null) result.createType = createType;
    if (rid != null) result.rid = rid;
    if (checkResult != null) result.checkResult = checkResult;
    if (checkMsg != null) result.checkMsg = checkMsg;
    if (btn != null) result.btn = btn;
    return result;
  }

  RoomCheckItem._();

  factory RoomCheckItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomCheckItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomCheckItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'room'),
      createEmptyInstance: create)
    ..aE<CreateType>(1, _omitFieldNames ? '' : 'createType',
        enumValues: CreateType.values)
    ..aInt64(2, _omitFieldNames ? '' : 'rid')
    ..aOB(3, _omitFieldNames ? '' : 'checkResult')
    ..aOM<CheckMsgItem>(4, _omitFieldNames ? '' : 'checkMsg',
        subBuilder: CheckMsgItem.create)
    ..aOM<ButtonInfoItem>(5, _omitFieldNames ? '' : 'btn',
        subBuilder: ButtonInfoItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomCheckItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomCheckItem copyWith(void Function(RoomCheckItem) updates) =>
      super.copyWith((message) => updates(message as RoomCheckItem))
          as RoomCheckItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomCheckItem create() => RoomCheckItem._();
  @$core.override
  RoomCheckItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomCheckItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCheckItem>(create);
  static RoomCheckItem? _defaultInstance;

  @$pb.TagNumber(1)
  CreateType get createType => $_getN(0);
  @$pb.TagNumber(1)
  set createType(CreateType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCreateType() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreateType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get rid => $_getI64(1);
  @$pb.TagNumber(2)
  set rid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get checkResult => $_getBF(2);
  @$pb.TagNumber(3)
  set checkResult($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCheckResult() => $_has(2);
  @$pb.TagNumber(3)
  void clearCheckResult() => $_clearField(3);

  @$pb.TagNumber(4)
  CheckMsgItem get checkMsg => $_getN(3);
  @$pb.TagNumber(4)
  set checkMsg(CheckMsgItem value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCheckMsg() => $_has(3);
  @$pb.TagNumber(4)
  void clearCheckMsg() => $_clearField(4);
  @$pb.TagNumber(4)
  CheckMsgItem ensureCheckMsg() => $_ensure(3);

  @$pb.TagNumber(5)
  ButtonInfoItem get btn => $_getN(4);
  @$pb.TagNumber(5)
  set btn(ButtonInfoItem value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasBtn() => $_has(4);
  @$pb.TagNumber(5)
  void clearBtn() => $_clearField(5);
  @$pb.TagNumber(5)
  ButtonInfoItem ensureBtn() => $_ensure(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

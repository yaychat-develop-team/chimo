// This is a generated file - do not edit.
//
// Generated from server_client/message_api.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'message.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

enum SendToRoomReq_Content { chat, card, notSet }

class SendToRoomReq extends $pb.GeneratedMessage {
  factory SendToRoomReq({
    $0.ChatContent? chat,
    $0.CardChatContent? card,
    $fixnum.Int64? toRoomId,
  }) {
    final result = create();
    if (chat != null) result.chat = chat;
    if (card != null) result.card = card;
    if (toRoomId != null) result.toRoomId = toRoomId;
    return result;
  }

  SendToRoomReq._();

  factory SendToRoomReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendToRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SendToRoomReq_Content>
      _SendToRoomReq_ContentByTag = {
    1: SendToRoomReq_Content.chat,
    2: SendToRoomReq_Content.card,
    0: SendToRoomReq_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendToRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'msg'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$0.ChatContent>(1, _omitFieldNames ? '' : 'chat',
        subBuilder: $0.ChatContent.create)
    ..aOM<$0.CardChatContent>(2, _omitFieldNames ? '' : 'card',
        subBuilder: $0.CardChatContent.create)
    ..aInt64(3, _omitFieldNames ? '' : 'toRoomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendToRoomReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendToRoomReq copyWith(void Function(SendToRoomReq) updates) =>
      super.copyWith((message) => updates(message as SendToRoomReq))
          as SendToRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendToRoomReq create() => SendToRoomReq._();
  @$core.override
  SendToRoomReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendToRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendToRoomReq>(create);
  static SendToRoomReq? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  SendToRoomReq_Content whichContent() =>
      _SendToRoomReq_ContentByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearContent() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $0.ChatContent get chat => $_getN(0);
  @$pb.TagNumber(1)
  set chat($0.ChatContent value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasChat() => $_has(0);
  @$pb.TagNumber(1)
  void clearChat() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.ChatContent ensureChat() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.CardChatContent get card => $_getN(1);
  @$pb.TagNumber(2)
  set card($0.CardChatContent value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCard() => $_has(1);
  @$pb.TagNumber(2)
  void clearCard() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.CardChatContent ensureCard() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get toRoomId => $_getI64(2);
  @$pb.TagNumber(3)
  set toRoomId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasToRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearToRoomId() => $_clearField(3);
}

class TextCheckReq extends $pb.GeneratedMessage {
  factory TextCheckReq({
    $core.String? text,
  }) {
    final result = create();
    if (text != null) result.text = text;
    return result;
  }

  TextCheckReq._();

  factory TextCheckReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextCheckReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextCheckReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'msg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextCheckReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextCheckReq copyWith(void Function(TextCheckReq) updates) =>
      super.copyWith((message) => updates(message as TextCheckReq))
          as TextCheckReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextCheckReq create() => TextCheckReq._();
  @$core.override
  TextCheckReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TextCheckReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextCheckReq>(create);
  static TextCheckReq? _defaultInstance;

  /// *
  /// 图片连接
  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => $_clearField(1);
}

class CheckResp extends $pb.GeneratedMessage {
  factory CheckResp({
    $core.bool? ok,
  }) {
    final result = create();
    if (ok != null) result.ok = ok;
    return result;
  }

  CheckResp._();

  factory CheckResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'msg'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'ok')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckResp copyWith(void Function(CheckResp) updates) =>
      super.copyWith((message) => updates(message as CheckResp)) as CheckResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckResp create() => CheckResp._();
  @$core.override
  CheckResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckResp>(create);
  static CheckResp? _defaultInstance;

  /// *
  /// true = 通过
  /// false = 不通过
  @$pb.TagNumber(1)
  $core.bool get ok => $_getBF(0);
  @$pb.TagNumber(1)
  set ok($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => $_clearField(1);
}

class ImgCheckReq extends $pb.GeneratedMessage {
  factory ImgCheckReq({
    $core.String? url,
  }) {
    final result = create();
    if (url != null) result.url = url;
    return result;
  }

  ImgCheckReq._();

  factory ImgCheckReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ImgCheckReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ImgCheckReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'msg'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImgCheckReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImgCheckReq copyWith(void Function(ImgCheckReq) updates) =>
      super.copyWith((message) => updates(message as ImgCheckReq))
          as ImgCheckReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImgCheckReq create() => ImgCheckReq._();
  @$core.override
  ImgCheckReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ImgCheckReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImgCheckReq>(create);
  static ImgCheckReq? _defaultInstance;

  /// *
  /// 图片连接
  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

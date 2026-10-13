// This is a generated file - do not edit.
//
// Generated from server_client/room_float_msg.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 发送房间飘屏请求报文
class SendRoomFloatMsgReq extends $pb.GeneratedMessage {
  factory SendRoomFloatMsgReq({
    $fixnum.Int64? channel,
    $core.String? content,
  }) {
    final result = create();
    if (channel != null) result.channel = channel;
    if (content != null) result.content = content;
    return result;
  }

  SendRoomFloatMsgReq._();

  factory SendRoomFloatMsgReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendRoomFloatMsgReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendRoomFloatMsgReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'roomFloatMsg'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendRoomFloatMsgReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendRoomFloatMsgReq copyWith(void Function(SendRoomFloatMsgReq) updates) =>
      super.copyWith((message) => updates(message as SendRoomFloatMsgReq))
          as SendRoomFloatMsgReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendRoomFloatMsgReq create() => SendRoomFloatMsgReq._();
  @$core.override
  SendRoomFloatMsgReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendRoomFloatMsgReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendRoomFloatMsgReq>(create);
  static SendRoomFloatMsgReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channel => $_getI64(0);
  @$pb.TagNumber(1)
  set channel($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);
}

/// 发送房间飘屏响应报文
class SendRoomFloatMsgRsp extends $pb.GeneratedMessage {
  factory SendRoomFloatMsgRsp({
    $core.int? remainCardCount,
  }) {
    final result = create();
    if (remainCardCount != null) result.remainCardCount = remainCardCount;
    return result;
  }

  SendRoomFloatMsgRsp._();

  factory SendRoomFloatMsgRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendRoomFloatMsgRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendRoomFloatMsgRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'roomFloatMsg'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'remainCardCount',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendRoomFloatMsgRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendRoomFloatMsgRsp copyWith(void Function(SendRoomFloatMsgRsp) updates) =>
      super.copyWith((message) => updates(message as SendRoomFloatMsgRsp))
          as SendRoomFloatMsgRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendRoomFloatMsgRsp create() => SendRoomFloatMsgRsp._();
  @$core.override
  SendRoomFloatMsgRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendRoomFloatMsgRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendRoomFloatMsgRsp>(create);
  static SendRoomFloatMsgRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get remainCardCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set remainCardCount($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRemainCardCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemainCardCount() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

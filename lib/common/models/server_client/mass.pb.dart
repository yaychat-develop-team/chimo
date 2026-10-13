// This is a generated file - do not edit.
//
// Generated from server_client/mass.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'rtc.pb.dart' as $1;
import 'user.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class DispatchResponse extends $pb.GeneratedMessage {
  factory DispatchResponse({
    $fixnum.Int64? dispatchId,
  }) {
    final result = create();
    if (dispatchId != null) result.dispatchId = dispatchId;
    return result;
  }

  DispatchResponse._();

  factory DispatchResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DispatchResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DispatchResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mass'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'dispatchId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DispatchResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DispatchResponse copyWith(void Function(DispatchResponse) updates) =>
      super.copyWith((message) => updates(message as DispatchResponse))
          as DispatchResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DispatchResponse create() => DispatchResponse._();
  @$core.override
  DispatchResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DispatchResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DispatchResponse>(create);
  static DispatchResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get dispatchId => $_getI64(0);
  @$pb.TagNumber(1)
  set dispatchId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDispatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDispatchId() => $_clearField(1);
}

class HandleDispatchReq extends $pb.GeneratedMessage {
  factory HandleDispatchReq({
    $core.int? result,
    $fixnum.Int64? dispatchId,
  }) {
    final result$ = create();
    if (result != null) result$.result = result;
    if (dispatchId != null) result$.dispatchId = dispatchId;
    return result$;
  }

  HandleDispatchReq._();

  factory HandleDispatchReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HandleDispatchReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HandleDispatchReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mass'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'result')
    ..aInt64(2, _omitFieldNames ? '' : 'dispatchId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HandleDispatchReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HandleDispatchReq copyWith(void Function(HandleDispatchReq) updates) =>
      super.copyWith((message) => updates(message as HandleDispatchReq))
          as HandleDispatchReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HandleDispatchReq create() => HandleDispatchReq._();
  @$core.override
  HandleDispatchReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HandleDispatchReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HandleDispatchReq>(create);
  static HandleDispatchReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(1)
  set result($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get dispatchId => $_getI64(1);
  @$pb.TagNumber(2)
  set dispatchId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDispatchId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDispatchId() => $_clearField(2);
}

class InviteInfo extends $pb.GeneratedMessage {
  factory InviteInfo({
    $fixnum.Int64? roomId,
    $0.User? inviter,
    $1.ChannelGrantUpMic? grantUpMic,
    $fixnum.Int64? dispatchId,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (inviter != null) result.inviter = inviter;
    if (grantUpMic != null) result.grantUpMic = grantUpMic;
    if (dispatchId != null) result.dispatchId = dispatchId;
    return result;
  }

  InviteInfo._();

  factory InviteInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mass'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aOM<$0.User>(2, _omitFieldNames ? '' : 'inviter',
        subBuilder: $0.User.create)
    ..aOM<$1.ChannelGrantUpMic>(3, _omitFieldNames ? '' : 'grantUpMic',
        subBuilder: $1.ChannelGrantUpMic.create)
    ..aInt64(4, _omitFieldNames ? '' : 'dispatchId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteInfo copyWith(void Function(InviteInfo) updates) =>
      super.copyWith((message) => updates(message as InviteInfo)) as InviteInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteInfo create() => InviteInfo._();
  @$core.override
  InviteInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InviteInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteInfo>(create);
  static InviteInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.User get inviter => $_getN(1);
  @$pb.TagNumber(2)
  set inviter($0.User value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasInviter() => $_has(1);
  @$pb.TagNumber(2)
  void clearInviter() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.User ensureInviter() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.ChannelGrantUpMic get grantUpMic => $_getN(2);
  @$pb.TagNumber(3)
  set grantUpMic($1.ChannelGrantUpMic value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasGrantUpMic() => $_has(2);
  @$pb.TagNumber(3)
  void clearGrantUpMic() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.ChannelGrantUpMic ensureGrantUpMic() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get dispatchId => $_getI64(3);
  @$pb.TagNumber(4)
  set dispatchId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDispatchId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDispatchId() => $_clearField(4);
}

class HandleUpMicReq extends $pb.GeneratedMessage {
  factory HandleUpMicReq({
    $core.int? result,
    $1.ChannelGrantUpMic? grantUpMic,
  }) {
    final result$ = create();
    if (result != null) result$.result = result;
    if (grantUpMic != null) result$.grantUpMic = grantUpMic;
    return result$;
  }

  HandleUpMicReq._();

  factory HandleUpMicReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HandleUpMicReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HandleUpMicReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mass'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'result')
    ..aOM<$1.ChannelGrantUpMic>(2, _omitFieldNames ? '' : 'grantUpMic',
        subBuilder: $1.ChannelGrantUpMic.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HandleUpMicReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HandleUpMicReq copyWith(void Function(HandleUpMicReq) updates) =>
      super.copyWith((message) => updates(message as HandleUpMicReq))
          as HandleUpMicReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HandleUpMicReq create() => HandleUpMicReq._();
  @$core.override
  HandleUpMicReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HandleUpMicReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HandleUpMicReq>(create);
  static HandleUpMicReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(1)
  set result($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => $_clearField(1);

  @$pb.TagNumber(2)
  $1.ChannelGrantUpMic get grantUpMic => $_getN(1);
  @$pb.TagNumber(2)
  set grantUpMic($1.ChannelGrantUpMic value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasGrantUpMic() => $_has(1);
  @$pb.TagNumber(2)
  void clearGrantUpMic() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.ChannelGrantUpMic ensureGrantUpMic() => $_ensure(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

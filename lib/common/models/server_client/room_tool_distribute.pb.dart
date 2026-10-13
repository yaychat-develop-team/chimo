// This is a generated file - do not edit.
//
// Generated from server_client/room_tool_distribute.proto.

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

class ReleaseDistributeReq extends $pb.GeneratedMessage {
  factory ReleaseDistributeReq({
    $core.Iterable<$core.String>? codes,
    $core.int? cnt,
    $core.String? gender,
    $fixnum.Int64? roomId,
  }) {
    final result = create();
    if (codes != null) result.codes.addAll(codes);
    if (cnt != null) result.cnt = cnt;
    if (gender != null) result.gender = gender;
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  ReleaseDistributeReq._();

  factory ReleaseDistributeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReleaseDistributeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReleaseDistributeReq',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'room_tool_distribute'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'codes')
    ..aI(2, _omitFieldNames ? '' : 'cnt')
    ..aOS(3, _omitFieldNames ? '' : 'gender')
    ..aInt64(4, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReleaseDistributeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReleaseDistributeReq copyWith(void Function(ReleaseDistributeReq) updates) =>
      super.copyWith((message) => updates(message as ReleaseDistributeReq))
          as ReleaseDistributeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReleaseDistributeReq create() => ReleaseDistributeReq._();
  @$core.override
  ReleaseDistributeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReleaseDistributeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReleaseDistributeReq>(create);
  static ReleaseDistributeReq? _defaultInstance;

  /// *
  /// 标签code
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get codes => $_getList(0);

  /// *
  /// 派对人数
  @$pb.TagNumber(2)
  $core.int get cnt => $_getIZ(1);
  @$pb.TagNumber(2)
  set cnt($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCnt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCnt() => $_clearField(2);

  /// *
  /// 性别
  @$pb.TagNumber(3)
  $core.String get gender => $_getSZ(2);
  @$pb.TagNumber(3)
  set gender($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGender() => $_has(2);
  @$pb.TagNumber(3)
  void clearGender() => $_clearField(3);

  /// *
  /// 房间id
  @$pb.TagNumber(4)
  $fixnum.Int64 get roomId => $_getI64(3);
  @$pb.TagNumber(4)
  set roomId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => $_clearField(4);
}

class ReleaseDistributeResp extends $pb.GeneratedMessage {
  factory ReleaseDistributeResp({
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  ReleaseDistributeResp._();

  factory ReleaseDistributeResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReleaseDistributeResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReleaseDistributeResp',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'room_tool_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReleaseDistributeResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReleaseDistributeResp copyWith(
          void Function(ReleaseDistributeResp) updates) =>
      super.copyWith((message) => updates(message as ReleaseDistributeResp))
          as ReleaseDistributeResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReleaseDistributeResp create() => ReleaseDistributeResp._();
  @$core.override
  ReleaseDistributeResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReleaseDistributeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReleaseDistributeResp>(create);
  static ReleaseDistributeResp? _defaultInstance;

  /// *
  /// 派单id
  @$pb.TagNumber(1)
  $fixnum.Int64 get distributeId => $_getI64(0);
  @$pb.TagNumber(1)
  set distributeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDistributeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDistributeId() => $_clearField(1);
}

class GrabbingDistributeReq extends $pb.GeneratedMessage {
  factory GrabbingDistributeReq({
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  GrabbingDistributeReq._();

  factory GrabbingDistributeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GrabbingDistributeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GrabbingDistributeReq',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'room_tool_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GrabbingDistributeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GrabbingDistributeReq copyWith(
          void Function(GrabbingDistributeReq) updates) =>
      super.copyWith((message) => updates(message as GrabbingDistributeReq))
          as GrabbingDistributeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GrabbingDistributeReq create() => GrabbingDistributeReq._();
  @$core.override
  GrabbingDistributeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GrabbingDistributeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabbingDistributeReq>(create);
  static GrabbingDistributeReq? _defaultInstance;

  /// *
  /// 派单id
  @$pb.TagNumber(1)
  $fixnum.Int64 get distributeId => $_getI64(0);
  @$pb.TagNumber(1)
  set distributeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDistributeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDistributeId() => $_clearField(1);
}

class GrabbingDistributeResp extends $pb.GeneratedMessage {
  factory GrabbingDistributeResp({
    $fixnum.Int64? distributeId,
    $core.bool? ok,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    if (ok != null) result.ok = ok;
    return result;
  }

  GrabbingDistributeResp._();

  factory GrabbingDistributeResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GrabbingDistributeResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GrabbingDistributeResp',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'room_tool_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..aOB(2, _omitFieldNames ? '' : 'ok')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GrabbingDistributeResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GrabbingDistributeResp copyWith(
          void Function(GrabbingDistributeResp) updates) =>
      super.copyWith((message) => updates(message as GrabbingDistributeResp))
          as GrabbingDistributeResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GrabbingDistributeResp create() => GrabbingDistributeResp._();
  @$core.override
  GrabbingDistributeResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GrabbingDistributeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GrabbingDistributeResp>(create);
  static GrabbingDistributeResp? _defaultInstance;

  /// *
  /// 派单id
  @$pb.TagNumber(1)
  $fixnum.Int64 get distributeId => $_getI64(0);
  @$pb.TagNumber(1)
  set distributeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDistributeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDistributeId() => $_clearField(1);

  /// *
  /// 是否可进入房间
  @$pb.TagNumber(2)
  $core.bool get ok => $_getBF(1);
  @$pb.TagNumber(2)
  set ok($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOk() => $_has(1);
  @$pb.TagNumber(2)
  void clearOk() => $_clearField(2);
}

enum RoomToolDistributePush_Message { gsMessage, notSet }

class RoomToolDistributePush extends $pb.GeneratedMessage {
  factory RoomToolDistributePush({
    RoomToolGSMessage? gsMessage,
  }) {
    final result = create();
    if (gsMessage != null) result.gsMessage = gsMessage;
    return result;
  }

  RoomToolDistributePush._();

  factory RoomToolDistributePush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomToolDistributePush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, RoomToolDistributePush_Message>
      _RoomToolDistributePush_MessageByTag = {
    1: RoomToolDistributePush_Message.gsMessage,
    0: RoomToolDistributePush_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomToolDistributePush',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'room_tool_distribute'),
      createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<RoomToolGSMessage>(1, _omitFieldNames ? '' : 'gsMessage',
        subBuilder: RoomToolGSMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomToolDistributePush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomToolDistributePush copyWith(
          void Function(RoomToolDistributePush) updates) =>
      super.copyWith((message) => updates(message as RoomToolDistributePush))
          as RoomToolDistributePush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomToolDistributePush create() => RoomToolDistributePush._();
  @$core.override
  RoomToolDistributePush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomToolDistributePush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomToolDistributePush>(create);
  static RoomToolDistributePush? _defaultInstance;

  @$pb.TagNumber(1)
  RoomToolDistributePush_Message whichMessage() =>
      _RoomToolDistributePush_MessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField($_whichOneof(0));

  /// *
  /// 被邀请嘉宾收到通知
  @$pb.TagNumber(1)
  RoomToolGSMessage get gsMessage => $_getN(0);
  @$pb.TagNumber(1)
  set gsMessage(RoomToolGSMessage value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGsMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsMessage() => $_clearField(1);
  @$pb.TagNumber(1)
  RoomToolGSMessage ensureGsMessage() => $_ensure(0);
}

class RoomToolGSMessage_InviteUserInfo extends $pb.GeneratedMessage {
  factory RoomToolGSMessage_InviteUserInfo({
    $fixnum.Int64? uid,
    $core.String? name,
    $core.String? icon,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    return result;
  }

  RoomToolGSMessage_InviteUserInfo._();

  factory RoomToolGSMessage_InviteUserInfo.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomToolGSMessage_InviteUserInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomToolGSMessage.InviteUserInfo',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'room_tool_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomToolGSMessage_InviteUserInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomToolGSMessage_InviteUserInfo copyWith(
          void Function(RoomToolGSMessage_InviteUserInfo) updates) =>
      super.copyWith(
              (message) => updates(message as RoomToolGSMessage_InviteUserInfo))
          as RoomToolGSMessage_InviteUserInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomToolGSMessage_InviteUserInfo create() =>
      RoomToolGSMessage_InviteUserInfo._();
  @$core.override
  RoomToolGSMessage_InviteUserInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomToolGSMessage_InviteUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomToolGSMessage_InviteUserInfo>(
          create);
  static RoomToolGSMessage_InviteUserInfo? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);
}

class RoomToolGSMessage extends $pb.GeneratedMessage {
  factory RoomToolGSMessage({
    $fixnum.Int64? uid,
    $fixnum.Int64? roomId,
    $fixnum.Int64? endTime,
    $fixnum.Int64? distributeId,
    $core.String? password,
    RoomToolGSMessage_InviteUserInfo? inviteUser,
    $core.Iterable<$core.String>? label,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (roomId != null) result.roomId = roomId;
    if (endTime != null) result.endTime = endTime;
    if (distributeId != null) result.distributeId = distributeId;
    if (password != null) result.password = password;
    if (inviteUser != null) result.inviteUser = inviteUser;
    if (label != null) result.label.addAll(label);
    return result;
  }

  RoomToolGSMessage._();

  factory RoomToolGSMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RoomToolGSMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RoomToolGSMessage',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'room_tool_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aInt64(2, _omitFieldNames ? '' : 'roomId')
    ..aInt64(3, _omitFieldNames ? '' : 'endTime')
    ..aInt64(4, _omitFieldNames ? '' : 'distributeId')
    ..aOS(5, _omitFieldNames ? '' : 'password')
    ..aOM<RoomToolGSMessage_InviteUserInfo>(
        6, _omitFieldNames ? '' : 'inviteUser',
        protoName: 'inviteUser',
        subBuilder: RoomToolGSMessage_InviteUserInfo.create)
    ..pPS(7, _omitFieldNames ? '' : 'label')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomToolGSMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RoomToolGSMessage copyWith(void Function(RoomToolGSMessage) updates) =>
      super.copyWith((message) => updates(message as RoomToolGSMessage))
          as RoomToolGSMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomToolGSMessage create() => RoomToolGSMessage._();
  @$core.override
  RoomToolGSMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RoomToolGSMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomToolGSMessage>(create);
  static RoomToolGSMessage? _defaultInstance;

  /// *
  /// 发起邀请的uid
  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  /// *
  /// 房间id
  @$pb.TagNumber(2)
  $fixnum.Int64 get roomId => $_getI64(1);
  @$pb.TagNumber(2)
  set roomId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);

  /// *
  /// 邀请结束时间
  @$pb.TagNumber(3)
  $fixnum.Int64 get endTime => $_getI64(2);
  @$pb.TagNumber(3)
  set endTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => $_clearField(3);

  /// *
  /// 派单id
  @$pb.TagNumber(4)
  $fixnum.Int64 get distributeId => $_getI64(3);
  @$pb.TagNumber(4)
  set distributeId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDistributeId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDistributeId() => $_clearField(4);

  /// *
  /// 房间密码
  @$pb.TagNumber(5)
  $core.String get password => $_getSZ(4);
  @$pb.TagNumber(5)
  set password($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassword() => $_clearField(5);

  /// *
  /// 邀请用户信息
  @$pb.TagNumber(6)
  RoomToolGSMessage_InviteUserInfo get inviteUser => $_getN(5);
  @$pb.TagNumber(6)
  set inviteUser(RoomToolGSMessage_InviteUserInfo value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasInviteUser() => $_has(5);
  @$pb.TagNumber(6)
  void clearInviteUser() => $_clearField(6);
  @$pb.TagNumber(6)
  RoomToolGSMessage_InviteUserInfo ensureInviteUser() => $_ensure(5);

  /// *
  /// 标签列表
  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get label => $_getList(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

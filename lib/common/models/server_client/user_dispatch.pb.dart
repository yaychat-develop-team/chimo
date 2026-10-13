// This is a generated file - do not edit.
//
// Generated from server_client/user_dispatch.proto.

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

class UserDispatchListRsp extends $pb.GeneratedMessage {
  factory UserDispatchListRsp({
    $core.Iterable<UserDispatchData>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  UserDispatchListRsp._();

  factory UserDispatchListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserDispatchListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserDispatchListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'newcomer'),
      createEmptyInstance: create)
    ..pPM<UserDispatchData>(1, _omitFieldNames ? '' : 'list',
        subBuilder: UserDispatchData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserDispatchListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserDispatchListRsp copyWith(void Function(UserDispatchListRsp) updates) =>
      super.copyWith((message) => updates(message as UserDispatchListRsp))
          as UserDispatchListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserDispatchListRsp create() => UserDispatchListRsp._();
  @$core.override
  UserDispatchListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserDispatchListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserDispatchListRsp>(create);
  static UserDispatchListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserDispatchData> get list => $_getList(0);
}

class UserDispatchData extends $pb.GeneratedMessage {
  factory UserDispatchData({
    $fixnum.Int64? uid,
    $core.String? emUsername,
    $core.String? nickName,
    $core.int? age,
    $core.String? gender,
    $core.String? avatar,
    $core.int? onlineStatus,
    $fixnum.Int64? dispatchTime,
    $0.ChannelInfo? currentChannel,
    $core.int? receiveMsgCount,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (emUsername != null) result.emUsername = emUsername;
    if (nickName != null) result.nickName = nickName;
    if (age != null) result.age = age;
    if (gender != null) result.gender = gender;
    if (avatar != null) result.avatar = avatar;
    if (onlineStatus != null) result.onlineStatus = onlineStatus;
    if (dispatchTime != null) result.dispatchTime = dispatchTime;
    if (currentChannel != null) result.currentChannel = currentChannel;
    if (receiveMsgCount != null) result.receiveMsgCount = receiveMsgCount;
    return result;
  }

  UserDispatchData._();

  factory UserDispatchData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserDispatchData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserDispatchData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'newcomer'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'emUsername')
    ..aOS(3, _omitFieldNames ? '' : 'nickName')
    ..aI(4, _omitFieldNames ? '' : 'age', fieldType: $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'gender')
    ..aOS(6, _omitFieldNames ? '' : 'avatar')
    ..aI(7, _omitFieldNames ? '' : 'onlineStatus')
    ..aInt64(8, _omitFieldNames ? '' : 'dispatchTime')
    ..aOM<$0.ChannelInfo>(9, _omitFieldNames ? '' : 'currentChannel',
        subBuilder: $0.ChannelInfo.create)
    ..aI(10, _omitFieldNames ? '' : 'receiveMsgCount',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserDispatchData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserDispatchData copyWith(void Function(UserDispatchData) updates) =>
      super.copyWith((message) => updates(message as UserDispatchData))
          as UserDispatchData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserDispatchData create() => UserDispatchData._();
  @$core.override
  UserDispatchData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserDispatchData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserDispatchData>(create);
  static UserDispatchData? _defaultInstance;

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
  $core.String get nickName => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickName() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get age => $_getIZ(3);
  @$pb.TagNumber(4)
  set age($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAge() => $_has(3);
  @$pb.TagNumber(4)
  void clearAge() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get gender => $_getSZ(4);
  @$pb.TagNumber(5)
  set gender($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGender() => $_has(4);
  @$pb.TagNumber(5)
  void clearGender() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get avatar => $_getSZ(5);
  @$pb.TagNumber(6)
  set avatar($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAvatar() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvatar() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get onlineStatus => $_getIZ(6);
  @$pb.TagNumber(7)
  set onlineStatus($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasOnlineStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearOnlineStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get dispatchTime => $_getI64(7);
  @$pb.TagNumber(8)
  set dispatchTime($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDispatchTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearDispatchTime() => $_clearField(8);

  @$pb.TagNumber(9)
  $0.ChannelInfo get currentChannel => $_getN(8);
  @$pb.TagNumber(9)
  set currentChannel($0.ChannelInfo value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasCurrentChannel() => $_has(8);
  @$pb.TagNumber(9)
  void clearCurrentChannel() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.ChannelInfo ensureCurrentChannel() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.int get receiveMsgCount => $_getIZ(9);
  @$pb.TagNumber(10)
  set receiveMsgCount($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasReceiveMsgCount() => $_has(9);
  @$pb.TagNumber(10)
  void clearReceiveMsgCount() => $_clearField(10);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

// This is a generated file - do not edit.
//
// Generated from server_client/newcomer.proto.

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

class NewcomerListRsp extends $pb.GeneratedMessage {
  factory NewcomerListRsp({
    $core.Iterable<NewcomerData>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  NewcomerListRsp._();

  factory NewcomerListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewcomerListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewcomerListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'newcomer'),
      createEmptyInstance: create)
    ..pPM<NewcomerData>(1, _omitFieldNames ? '' : 'list',
        subBuilder: NewcomerData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewcomerListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewcomerListRsp copyWith(void Function(NewcomerListRsp) updates) =>
      super.copyWith((message) => updates(message as NewcomerListRsp))
          as NewcomerListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewcomerListRsp create() => NewcomerListRsp._();
  @$core.override
  NewcomerListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewcomerListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewcomerListRsp>(create);
  static NewcomerListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<NewcomerData> get list => $_getList(0);
}

class NewcomerData extends $pb.GeneratedMessage {
  factory NewcomerData({
    $fixnum.Int64? uid,
    $core.String? emUsername,
    $core.String? nickName,
    $core.int? age,
    $core.String? gender,
    $core.String? avatar,
    $core.int? vipLevel,
    $fixnum.Int64? registerTime,
    $core.String? deviceType,
    $core.String? deviceModel,
    $core.int? onlineStatus,
    $0.ChannelInfo? currentChannel,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (emUsername != null) result.emUsername = emUsername;
    if (nickName != null) result.nickName = nickName;
    if (age != null) result.age = age;
    if (gender != null) result.gender = gender;
    if (avatar != null) result.avatar = avatar;
    if (vipLevel != null) result.vipLevel = vipLevel;
    if (registerTime != null) result.registerTime = registerTime;
    if (deviceType != null) result.deviceType = deviceType;
    if (deviceModel != null) result.deviceModel = deviceModel;
    if (onlineStatus != null) result.onlineStatus = onlineStatus;
    if (currentChannel != null) result.currentChannel = currentChannel;
    return result;
  }

  NewcomerData._();

  factory NewcomerData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewcomerData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewcomerData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'newcomer'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'emUsername')
    ..aOS(3, _omitFieldNames ? '' : 'nickName')
    ..aI(4, _omitFieldNames ? '' : 'age', fieldType: $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'gender')
    ..aOS(6, _omitFieldNames ? '' : 'avatar')
    ..aI(7, _omitFieldNames ? '' : 'vipLevel', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(8, _omitFieldNames ? '' : 'registerTime')
    ..aOS(9, _omitFieldNames ? '' : 'deviceType')
    ..aOS(10, _omitFieldNames ? '' : 'deviceModel')
    ..aI(11, _omitFieldNames ? '' : 'onlineStatus')
    ..aOM<$0.ChannelInfo>(12, _omitFieldNames ? '' : 'currentChannel',
        subBuilder: $0.ChannelInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewcomerData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewcomerData copyWith(void Function(NewcomerData) updates) =>
      super.copyWith((message) => updates(message as NewcomerData))
          as NewcomerData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewcomerData create() => NewcomerData._();
  @$core.override
  NewcomerData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewcomerData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewcomerData>(create);
  static NewcomerData? _defaultInstance;

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
  $core.int get vipLevel => $_getIZ(6);
  @$pb.TagNumber(7)
  set vipLevel($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasVipLevel() => $_has(6);
  @$pb.TagNumber(7)
  void clearVipLevel() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get registerTime => $_getI64(7);
  @$pb.TagNumber(8)
  set registerTime($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRegisterTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearRegisterTime() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get deviceType => $_getSZ(8);
  @$pb.TagNumber(9)
  set deviceType($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDeviceType() => $_has(8);
  @$pb.TagNumber(9)
  void clearDeviceType() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get deviceModel => $_getSZ(9);
  @$pb.TagNumber(10)
  set deviceModel($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasDeviceModel() => $_has(9);
  @$pb.TagNumber(10)
  void clearDeviceModel() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get onlineStatus => $_getIZ(10);
  @$pb.TagNumber(11)
  set onlineStatus($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasOnlineStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearOnlineStatus() => $_clearField(11);

  @$pb.TagNumber(12)
  $0.ChannelInfo get currentChannel => $_getN(11);
  @$pb.TagNumber(12)
  set currentChannel($0.ChannelInfo value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasCurrentChannel() => $_has(11);
  @$pb.TagNumber(12)
  void clearCurrentChannel() => $_clearField(12);
  @$pb.TagNumber(12)
  $0.ChannelInfo ensureCurrentChannel() => $_ensure(11);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

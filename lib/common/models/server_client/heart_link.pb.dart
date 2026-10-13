// This is a generated file - do not edit.
//
// Generated from server_client/heart_link.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'heart_link.pbenum.dart';
import 'message.pb.dart' as $1;
import 'user.pb.dart' as $0;
import 'user_realtion.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'heart_link.pbenum.dart';

class HeartLinkInfo extends $pb.GeneratedMessage {
  factory HeartLinkInfo({
    $fixnum.Int64? uid1,
    $core.String? name1,
    $core.String? avatar1,
    $fixnum.Int64? uid2,
    $core.String? name2,
    $core.String? avatar2,
    $core.int? matchValue,
    $fixnum.Int64? rid,
    $core.String? ridName,
    $fixnum.Int64? expiredTime,
    $core.int? inviteResult,
    $core.String? emId,
  }) {
    final result = create();
    if (uid1 != null) result.uid1 = uid1;
    if (name1 != null) result.name1 = name1;
    if (avatar1 != null) result.avatar1 = avatar1;
    if (uid2 != null) result.uid2 = uid2;
    if (name2 != null) result.name2 = name2;
    if (avatar2 != null) result.avatar2 = avatar2;
    if (matchValue != null) result.matchValue = matchValue;
    if (rid != null) result.rid = rid;
    if (ridName != null) result.ridName = ridName;
    if (expiredTime != null) result.expiredTime = expiredTime;
    if (inviteResult != null) result.inviteResult = inviteResult;
    if (emId != null) result.emId = emId;
    return result;
  }

  HeartLinkInfo._();

  factory HeartLinkInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartLinkInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartLinkInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid1')
    ..aOS(2, _omitFieldNames ? '' : 'name1')
    ..aOS(3, _omitFieldNames ? '' : 'avatar1')
    ..aInt64(4, _omitFieldNames ? '' : 'uid2')
    ..aOS(5, _omitFieldNames ? '' : 'name2')
    ..aOS(6, _omitFieldNames ? '' : 'avatar2')
    ..aI(7, _omitFieldNames ? '' : 'matchValue')
    ..aInt64(8, _omitFieldNames ? '' : 'rid')
    ..aOS(9, _omitFieldNames ? '' : 'ridName')
    ..aInt64(10, _omitFieldNames ? '' : 'expiredTime')
    ..aI(11, _omitFieldNames ? '' : 'inviteResult')
    ..aOS(13, _omitFieldNames ? '' : 'emId', protoName: 'emId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkInfo copyWith(void Function(HeartLinkInfo) updates) =>
      super.copyWith((message) => updates(message as HeartLinkInfo))
          as HeartLinkInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartLinkInfo create() => HeartLinkInfo._();
  @$core.override
  HeartLinkInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartLinkInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartLinkInfo>(create);
  static HeartLinkInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid1 => $_getI64(0);
  @$pb.TagNumber(1)
  set uid1($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid1() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid1() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name1 => $_getSZ(1);
  @$pb.TagNumber(2)
  set name1($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName1() => $_has(1);
  @$pb.TagNumber(2)
  void clearName1() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar1 => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar1($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar1() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar1() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get uid2 => $_getI64(3);
  @$pb.TagNumber(4)
  set uid2($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUid2() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid2() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get name2 => $_getSZ(4);
  @$pb.TagNumber(5)
  set name2($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasName2() => $_has(4);
  @$pb.TagNumber(5)
  void clearName2() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get avatar2 => $_getSZ(5);
  @$pb.TagNumber(6)
  set avatar2($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAvatar2() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvatar2() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get matchValue => $_getIZ(6);
  @$pb.TagNumber(7)
  set matchValue($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMatchValue() => $_has(6);
  @$pb.TagNumber(7)
  void clearMatchValue() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get rid => $_getI64(7);
  @$pb.TagNumber(8)
  set rid($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRid() => $_has(7);
  @$pb.TagNumber(8)
  void clearRid() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get ridName => $_getSZ(8);
  @$pb.TagNumber(9)
  set ridName($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasRidName() => $_has(8);
  @$pb.TagNumber(9)
  void clearRidName() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get expiredTime => $_getI64(9);
  @$pb.TagNumber(10)
  set expiredTime($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasExpiredTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearExpiredTime() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get inviteResult => $_getIZ(10);
  @$pb.TagNumber(11)
  set inviteResult($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasInviteResult() => $_has(10);
  @$pb.TagNumber(11)
  void clearInviteResult() => $_clearField(11);

  @$pb.TagNumber(13)
  $core.String get emId => $_getSZ(11);
  @$pb.TagNumber(13)
  set emId($core.String value) => $_setString(11, value);
  @$pb.TagNumber(13)
  $core.bool hasEmId() => $_has(11);
  @$pb.TagNumber(13)
  void clearEmId() => $_clearField(13);
}

class HonestOpinion extends $pb.GeneratedMessage {
  factory HonestOpinion({
    $core.String? question,
    $core.String? answer,
  }) {
    final result = create();
    if (question != null) result.question = question;
    if (answer != null) result.answer = answer;
    return result;
  }

  HonestOpinion._();

  factory HonestOpinion.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HonestOpinion.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HonestOpinion',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'question')
    ..aOS(2, _omitFieldNames ? '' : 'answer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonestOpinion clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HonestOpinion copyWith(void Function(HonestOpinion) updates) =>
      super.copyWith((message) => updates(message as HonestOpinion))
          as HonestOpinion;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HonestOpinion create() => HonestOpinion._();
  @$core.override
  HonestOpinion createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HonestOpinion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HonestOpinion>(create);
  static HonestOpinion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get question => $_getSZ(0);
  @$pb.TagNumber(1)
  set question($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuestion() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get answer => $_getSZ(1);
  @$pb.TagNumber(2)
  set answer($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnswer() => $_clearField(2);
}

class HeartLinkCard extends $pb.GeneratedMessage {
  factory HeartLinkCard({
    $fixnum.Int64? id,
    $fixnum.Int64? createTime,
    $fixnum.Int64? updateTime,
    $fixnum.Int64? uid,
    $core.String? telegram,
    MediaItem? video,
    $core.Iterable<MediaItem>? photo,
    MediaItem? audio,
    $core.String? emotionalState,
    $core.String? occupation,
    $core.Iterable<$core.String>? interest,
    $0.User? user,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (createTime != null) result.createTime = createTime;
    if (updateTime != null) result.updateTime = updateTime;
    if (uid != null) result.uid = uid;
    if (telegram != null) result.telegram = telegram;
    if (video != null) result.video = video;
    if (photo != null) result.photo.addAll(photo);
    if (audio != null) result.audio = audio;
    if (emotionalState != null) result.emotionalState = emotionalState;
    if (occupation != null) result.occupation = occupation;
    if (interest != null) result.interest.addAll(interest);
    if (user != null) result.user = user;
    return result;
  }

  HeartLinkCard._();

  factory HeartLinkCard.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartLinkCard.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartLinkCard',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'createTime')
    ..aInt64(3, _omitFieldNames ? '' : 'updateTime')
    ..aInt64(4, _omitFieldNames ? '' : 'uid')
    ..aOS(5, _omitFieldNames ? '' : 'telegram')
    ..aOM<MediaItem>(6, _omitFieldNames ? '' : 'video',
        subBuilder: MediaItem.create)
    ..pPM<MediaItem>(7, _omitFieldNames ? '' : 'photo',
        subBuilder: MediaItem.create)
    ..aOM<MediaItem>(8, _omitFieldNames ? '' : 'audio',
        subBuilder: MediaItem.create)
    ..aOS(9, _omitFieldNames ? '' : 'emotionalState')
    ..aOS(10, _omitFieldNames ? '' : 'occupation')
    ..pPS(11, _omitFieldNames ? '' : 'interest')
    ..aOM<$0.User>(12, _omitFieldNames ? '' : 'user',
        subBuilder: $0.User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkCard clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkCard copyWith(void Function(HeartLinkCard) updates) =>
      super.copyWith((message) => updates(message as HeartLinkCard))
          as HeartLinkCard;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartLinkCard create() => HeartLinkCard._();
  @$core.override
  HeartLinkCard createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartLinkCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartLinkCard>(create);
  static HeartLinkCard? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get createTime => $_getI64(1);
  @$pb.TagNumber(2)
  set createTime($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreateTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreateTime() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get updateTime => $_getI64(2);
  @$pb.TagNumber(3)
  set updateTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get uid => $_getI64(3);
  @$pb.TagNumber(4)
  set uid($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get telegram => $_getSZ(4);
  @$pb.TagNumber(5)
  set telegram($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTelegram() => $_has(4);
  @$pb.TagNumber(5)
  void clearTelegram() => $_clearField(5);

  @$pb.TagNumber(6)
  MediaItem get video => $_getN(5);
  @$pb.TagNumber(6)
  set video(MediaItem value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasVideo() => $_has(5);
  @$pb.TagNumber(6)
  void clearVideo() => $_clearField(6);
  @$pb.TagNumber(6)
  MediaItem ensureVideo() => $_ensure(5);

  @$pb.TagNumber(7)
  $pb.PbList<MediaItem> get photo => $_getList(6);

  @$pb.TagNumber(8)
  MediaItem get audio => $_getN(7);
  @$pb.TagNumber(8)
  set audio(MediaItem value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasAudio() => $_has(7);
  @$pb.TagNumber(8)
  void clearAudio() => $_clearField(8);
  @$pb.TagNumber(8)
  MediaItem ensureAudio() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get emotionalState => $_getSZ(8);
  @$pb.TagNumber(9)
  set emotionalState($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasEmotionalState() => $_has(8);
  @$pb.TagNumber(9)
  void clearEmotionalState() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get occupation => $_getSZ(9);
  @$pb.TagNumber(10)
  set occupation($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasOccupation() => $_has(9);
  @$pb.TagNumber(10)
  void clearOccupation() => $_clearField(10);

  @$pb.TagNumber(11)
  $pb.PbList<$core.String> get interest => $_getList(10);

  @$pb.TagNumber(12)
  $0.User get user => $_getN(11);
  @$pb.TagNumber(12)
  set user($0.User value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasUser() => $_has(11);
  @$pb.TagNumber(12)
  void clearUser() => $_clearField(12);
  @$pb.TagNumber(12)
  $0.User ensureUser() => $_ensure(11);
}

class HeartLinkApplyRsp extends $pb.GeneratedMessage {
  factory HeartLinkApplyRsp({
    $core.bool? success,
    $core.String? message,
    HeartLinkCard? data,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (data != null) result.data = data;
    return result;
  }

  HeartLinkApplyRsp._();

  factory HeartLinkApplyRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartLinkApplyRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartLinkApplyRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<HeartLinkCard>(3, _omitFieldNames ? '' : 'data',
        subBuilder: HeartLinkCard.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkApplyRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkApplyRsp copyWith(void Function(HeartLinkApplyRsp) updates) =>
      super.copyWith((message) => updates(message as HeartLinkApplyRsp))
          as HeartLinkApplyRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartLinkApplyRsp create() => HeartLinkApplyRsp._();
  @$core.override
  HeartLinkApplyRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartLinkApplyRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartLinkApplyRsp>(create);
  static HeartLinkApplyRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  HeartLinkCard get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HeartLinkCard value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);
  @$pb.TagNumber(3)
  HeartLinkCard ensureData() => $_ensure(2);
}

class CreatePrivateRoomReq extends $pb.GeneratedMessage {
  factory CreatePrivateRoomReq({
    $fixnum.Int64? userId1,
    $fixnum.Int64? userId2,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (userId1 != null) result.userId1 = userId1;
    if (userId2 != null) result.userId2 = userId2;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  CreatePrivateRoomReq._();

  factory CreatePrivateRoomReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePrivateRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePrivateRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId1', protoName: 'userId_1')
    ..aInt64(2, _omitFieldNames ? '' : 'userId2', protoName: 'userId_2')
    ..aInt64(3, _omitFieldNames ? '' : 'channelId', protoName: 'channelId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePrivateRoomReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePrivateRoomReq copyWith(void Function(CreatePrivateRoomReq) updates) =>
      super.copyWith((message) => updates(message as CreatePrivateRoomReq))
          as CreatePrivateRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePrivateRoomReq create() => CreatePrivateRoomReq._();
  @$core.override
  CreatePrivateRoomReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreatePrivateRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePrivateRoomReq>(create);
  static CreatePrivateRoomReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId1 => $_getI64(0);
  @$pb.TagNumber(1)
  set userId1($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId1() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId1() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId2 => $_getI64(1);
  @$pb.TagNumber(2)
  set userId2($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId2() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId2() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get channelId => $_getI64(2);
  @$pb.TagNumber(3)
  set channelId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChannelId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannelId() => $_clearField(3);
}

class InviteViewCardReq extends $pb.GeneratedMessage {
  factory InviteViewCardReq({
    $fixnum.Int64? gsId,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (gsId != null) result.gsId = gsId;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  InviteViewCardReq._();

  factory InviteViewCardReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteViewCardReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteViewCardReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'gsId', protoName: 'gsId')
    ..aInt64(2, _omitFieldNames ? '' : 'channelId', protoName: 'channelId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteViewCardReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteViewCardReq copyWith(void Function(InviteViewCardReq) updates) =>
      super.copyWith((message) => updates(message as InviteViewCardReq))
          as InviteViewCardReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteViewCardReq create() => InviteViewCardReq._();
  @$core.override
  InviteViewCardReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InviteViewCardReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteViewCardReq>(create);
  static InviteViewCardReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get gsId => $_getI64(0);
  @$pb.TagNumber(1)
  set gsId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get channelId => $_getI64(1);
  @$pb.TagNumber(2)
  set channelId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => $_clearField(2);
}

class MediaItem extends $pb.GeneratedMessage {
  factory MediaItem({
    $core.String? url,
    $core.int? applyStatus,
    $core.int? duration,
    MediaTypeEnum? type,
    $core.String? cover,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (applyStatus != null) result.applyStatus = applyStatus;
    if (duration != null) result.duration = duration;
    if (type != null) result.type = type;
    if (cover != null) result.cover = cover;
    return result;
  }

  MediaItem._();

  factory MediaItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MediaItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MediaItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aI(2, _omitFieldNames ? '' : 'applyStatus',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'duration', fieldType: $pb.PbFieldType.OU3)
    ..aE<MediaTypeEnum>(4, _omitFieldNames ? '' : 'type',
        enumValues: MediaTypeEnum.values)
    ..aOS(5, _omitFieldNames ? '' : 'cover')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MediaItem copyWith(void Function(MediaItem) updates) =>
      super.copyWith((message) => updates(message as MediaItem)) as MediaItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediaItem create() => MediaItem._();
  @$core.override
  MediaItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MediaItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MediaItem>(create);
  static MediaItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get applyStatus => $_getIZ(1);
  @$pb.TagNumber(2)
  set applyStatus($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasApplyStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearApplyStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get duration => $_getIZ(2);
  @$pb.TagNumber(3)
  set duration($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => $_clearField(3);

  @$pb.TagNumber(4)
  MediaTypeEnum get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(MediaTypeEnum value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get cover => $_getSZ(4);
  @$pb.TagNumber(5)
  set cover($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCover() => $_has(4);
  @$pb.TagNumber(5)
  void clearCover() => $_clearField(5);
}

class HeartLinkCardUnlockReq extends $pb.GeneratedMessage {
  factory HeartLinkCardUnlockReq({
    $fixnum.Int64? gsId,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (gsId != null) result.gsId = gsId;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  HeartLinkCardUnlockReq._();

  factory HeartLinkCardUnlockReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartLinkCardUnlockReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartLinkCardUnlockReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'gsId')
    ..aInt64(2, _omitFieldNames ? '' : 'channelId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkCardUnlockReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkCardUnlockReq copyWith(
          void Function(HeartLinkCardUnlockReq) updates) =>
      super.copyWith((message) => updates(message as HeartLinkCardUnlockReq))
          as HeartLinkCardUnlockReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartLinkCardUnlockReq create() => HeartLinkCardUnlockReq._();
  @$core.override
  HeartLinkCardUnlockReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartLinkCardUnlockReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartLinkCardUnlockReq>(create);
  static HeartLinkCardUnlockReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get gsId => $_getI64(0);
  @$pb.TagNumber(1)
  set gsId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get channelId => $_getI64(1);
  @$pb.TagNumber(2)
  set channelId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => $_clearField(2);
}

class HeartLinkCardSaveReq extends $pb.GeneratedMessage {
  factory HeartLinkCardSaveReq({
    $core.String? telegram,
    $core.String? emotionalState,
    $core.String? occupation,
    $core.Iterable<$core.String>? interest,
    MediaItem? video,
    $core.Iterable<MediaItem>? photo,
    MediaItem? audio,
  }) {
    final result = create();
    if (telegram != null) result.telegram = telegram;
    if (emotionalState != null) result.emotionalState = emotionalState;
    if (occupation != null) result.occupation = occupation;
    if (interest != null) result.interest.addAll(interest);
    if (video != null) result.video = video;
    if (photo != null) result.photo.addAll(photo);
    if (audio != null) result.audio = audio;
    return result;
  }

  HeartLinkCardSaveReq._();

  factory HeartLinkCardSaveReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartLinkCardSaveReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartLinkCardSaveReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'telegram')
    ..aOS(2, _omitFieldNames ? '' : 'emotionalState')
    ..aOS(3, _omitFieldNames ? '' : 'occupation')
    ..pPS(4, _omitFieldNames ? '' : 'interest')
    ..aOM<MediaItem>(5, _omitFieldNames ? '' : 'video',
        subBuilder: MediaItem.create)
    ..pPM<MediaItem>(6, _omitFieldNames ? '' : 'photo',
        subBuilder: MediaItem.create)
    ..aOM<MediaItem>(7, _omitFieldNames ? '' : 'audio',
        subBuilder: MediaItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkCardSaveReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkCardSaveReq copyWith(void Function(HeartLinkCardSaveReq) updates) =>
      super.copyWith((message) => updates(message as HeartLinkCardSaveReq))
          as HeartLinkCardSaveReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartLinkCardSaveReq create() => HeartLinkCardSaveReq._();
  @$core.override
  HeartLinkCardSaveReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartLinkCardSaveReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartLinkCardSaveReq>(create);
  static HeartLinkCardSaveReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get telegram => $_getSZ(0);
  @$pb.TagNumber(1)
  set telegram($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTelegram() => $_has(0);
  @$pb.TagNumber(1)
  void clearTelegram() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get emotionalState => $_getSZ(1);
  @$pb.TagNumber(2)
  set emotionalState($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEmotionalState() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmotionalState() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get occupation => $_getSZ(2);
  @$pb.TagNumber(3)
  set occupation($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOccupation() => $_has(2);
  @$pb.TagNumber(3)
  void clearOccupation() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get interest => $_getList(3);

  /// 按下面最新修改来
  @$pb.TagNumber(5)
  MediaItem get video => $_getN(4);
  @$pb.TagNumber(5)
  set video(MediaItem value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasVideo() => $_has(4);
  @$pb.TagNumber(5)
  void clearVideo() => $_clearField(5);
  @$pb.TagNumber(5)
  MediaItem ensureVideo() => $_ensure(4);

  @$pb.TagNumber(6)
  $pb.PbList<MediaItem> get photo => $_getList(5);

  @$pb.TagNumber(7)
  MediaItem get audio => $_getN(6);
  @$pb.TagNumber(7)
  set audio(MediaItem value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasAudio() => $_has(6);
  @$pb.TagNumber(7)
  void clearAudio() => $_clearField(7);
  @$pb.TagNumber(7)
  MediaItem ensureAudio() => $_ensure(6);
}

class HeartLinkInviteReq extends $pb.GeneratedMessage {
  factory HeartLinkInviteReq({
    $fixnum.Int64? uid,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  HeartLinkInviteReq._();

  factory HeartLinkInviteReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartLinkInviteReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartLinkInviteReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aInt64(2, _omitFieldNames ? '' : 'channelId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkInviteReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkInviteReq copyWith(void Function(HeartLinkInviteReq) updates) =>
      super.copyWith((message) => updates(message as HeartLinkInviteReq))
          as HeartLinkInviteReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartLinkInviteReq create() => HeartLinkInviteReq._();
  @$core.override
  HeartLinkInviteReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartLinkInviteReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartLinkInviteReq>(create);
  static HeartLinkInviteReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get channelId => $_getI64(1);
  @$pb.TagNumber(2)
  set channelId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => $_clearField(2);
}

class UpdateInviteResultReq extends $pb.GeneratedMessage {
  factory UpdateInviteResultReq({
    $fixnum.Int64? channelId,
    $core.int? inviteResult,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    if (inviteResult != null) result.inviteResult = inviteResult;
    return result;
  }

  UpdateInviteResultReq._();

  factory UpdateInviteResultReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateInviteResultReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateInviteResultReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'channelId')
    ..aI(2, _omitFieldNames ? '' : 'inviteResult')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateInviteResultReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateInviteResultReq copyWith(
          void Function(UpdateInviteResultReq) updates) =>
      super.copyWith((message) => updates(message as UpdateInviteResultReq))
          as UpdateInviteResultReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInviteResultReq create() => UpdateInviteResultReq._();
  @$core.override
  UpdateInviteResultReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateInviteResultReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateInviteResultReq>(create);
  static UpdateInviteResultReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(1)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get inviteResult => $_getIZ(1);
  @$pb.TagNumber(2)
  set inviteResult($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasInviteResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearInviteResult() => $_clearField(2);
}

class HeartiesBaseRsp extends $pb.GeneratedMessage {
  factory HeartiesBaseRsp({
    $core.Iterable<$fixnum.Int64>? userId,
  }) {
    final result = create();
    if (userId != null) result.userId.addAll(userId);
    return result;
  }

  HeartiesBaseRsp._();

  factory HeartiesBaseRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartiesBaseRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartiesBaseRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(3, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.K6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartiesBaseRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartiesBaseRsp copyWith(void Function(HeartiesBaseRsp) updates) =>
      super.copyWith((message) => updates(message as HeartiesBaseRsp))
          as HeartiesBaseRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartiesBaseRsp create() => HeartiesBaseRsp._();
  @$core.override
  HeartiesBaseRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartiesBaseRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartiesBaseRsp>(create);
  static HeartiesBaseRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $pb.PbList<$fixnum.Int64> get userId => $_getList(0);
}

class HeartLinkBaseRsp extends $pb.GeneratedMessage {
  factory HeartLinkBaseRsp({
    $core.bool? result,
  }) {
    final result$ = create();
    if (result != null) result$.result = result;
    return result$;
  }

  HeartLinkBaseRsp._();

  factory HeartLinkBaseRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartLinkBaseRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartLinkBaseRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'result')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkBaseRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkBaseRsp copyWith(void Function(HeartLinkBaseRsp) updates) =>
      super.copyWith((message) => updates(message as HeartLinkBaseRsp))
          as HeartLinkBaseRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartLinkBaseRsp create() => HeartLinkBaseRsp._();
  @$core.override
  HeartLinkBaseRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartLinkBaseRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartLinkBaseRsp>(create);
  static HeartLinkBaseRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get result => $_getBF(0);
  @$pb.TagNumber(1)
  set result($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => $_clearField(1);
}

class HeartLinkUserListRsp extends $pb.GeneratedMessage {
  factory HeartLinkUserListRsp({
    $core.Iterable<HeartiesInfo>? result,
  }) {
    final result$ = create();
    if (result != null) result$.result.addAll(result);
    return result$;
  }

  HeartLinkUserListRsp._();

  factory HeartLinkUserListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartLinkUserListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartLinkUserListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..pPM<HeartiesInfo>(3, _omitFieldNames ? '' : 'result',
        subBuilder: HeartiesInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkUserListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkUserListRsp copyWith(void Function(HeartLinkUserListRsp) updates) =>
      super.copyWith((message) => updates(message as HeartLinkUserListRsp))
          as HeartLinkUserListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartLinkUserListRsp create() => HeartLinkUserListRsp._();
  @$core.override
  HeartLinkUserListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartLinkUserListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartLinkUserListRsp>(create);
  static HeartLinkUserListRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $pb.PbList<HeartiesInfo> get result => $_getList(0);
}

class HeartiesQueryRsp extends $pb.GeneratedMessage {
  factory HeartiesQueryRsp({
    $core.Iterable<HeartiesInfo>? hearties,
    HeartiesInfo? yourHearties,
  }) {
    final result = create();
    if (hearties != null) result.hearties.addAll(hearties);
    if (yourHearties != null) result.yourHearties = yourHearties;
    return result;
  }

  HeartiesQueryRsp._();

  factory HeartiesQueryRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartiesQueryRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartiesQueryRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..pPM<HeartiesInfo>(3, _omitFieldNames ? '' : 'hearties',
        subBuilder: HeartiesInfo.create)
    ..aOM<HeartiesInfo>(4, _omitFieldNames ? '' : 'yourHearties',
        subBuilder: HeartiesInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartiesQueryRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartiesQueryRsp copyWith(void Function(HeartiesQueryRsp) updates) =>
      super.copyWith((message) => updates(message as HeartiesQueryRsp))
          as HeartiesQueryRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartiesQueryRsp create() => HeartiesQueryRsp._();
  @$core.override
  HeartiesQueryRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartiesQueryRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartiesQueryRsp>(create);
  static HeartiesQueryRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $pb.PbList<HeartiesInfo> get hearties => $_getList(0);

  @$pb.TagNumber(4)
  HeartiesInfo get yourHearties => $_getN(1);
  @$pb.TagNumber(4)
  set yourHearties(HeartiesInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasYourHearties() => $_has(1);
  @$pb.TagNumber(4)
  void clearYourHearties() => $_clearField(4);
  @$pb.TagNumber(4)
  HeartiesInfo ensureYourHearties() => $_ensure(1);
}

class HeartiesInfo extends $pb.GeneratedMessage {
  factory HeartiesInfo({
    $0.User? user,
    $fixnum.Int64? joinTime,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (joinTime != null) result.joinTime = joinTime;
    return result;
  }

  HeartiesInfo._();

  factory HeartiesInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartiesInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartiesInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aOM<$0.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $0.User.create)
    ..aInt64(10, _omitFieldNames ? '' : 'joinTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartiesInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartiesInfo copyWith(void Function(HeartiesInfo) updates) =>
      super.copyWith((message) => updates(message as HeartiesInfo))
          as HeartiesInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartiesInfo create() => HeartiesInfo._();
  @$core.override
  HeartiesInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartiesInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartiesInfo>(create);
  static HeartiesInfo? _defaultInstance;

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

  @$pb.TagNumber(10)
  $fixnum.Int64 get joinTime => $_getI64(1);
  @$pb.TagNumber(10)
  set joinTime($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(10)
  $core.bool hasJoinTime() => $_has(1);
  @$pb.TagNumber(10)
  void clearJoinTime() => $_clearField(10);
}

class GsPoolSaveReq extends $pb.GeneratedMessage {
  factory GsPoolSaveReq({
    $core.Iterable<$fixnum.Int64>? gsId,
  }) {
    final result = create();
    if (gsId != null) result.gsId.addAll(gsId);
    return result;
  }

  GsPoolSaveReq._();

  factory GsPoolSaveReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsPoolSaveReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsPoolSaveReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'gsId', $pb.PbFieldType.K6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsPoolSaveReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsPoolSaveReq copyWith(void Function(GsPoolSaveReq) updates) =>
      super.copyWith((message) => updates(message as GsPoolSaveReq))
          as GsPoolSaveReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsPoolSaveReq create() => GsPoolSaveReq._();
  @$core.override
  GsPoolSaveReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsPoolSaveReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsPoolSaveReq>(create);
  static GsPoolSaveReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get gsId => $_getList(0);
}

class HeartLinkUserInfoRsp extends $pb.GeneratedMessage {
  factory HeartLinkUserInfoRsp({
    HeartiesInfo? gsMicUser,
    HeartiesInfo? bossMicUser,
    $core.Iterable<HeartiesInfo>? roomGs,
    $core.Iterable<HeartiesInfo>? roomUser,
    $core.Iterable<HeartiesInfo>? offRoomGs,
  }) {
    final result = create();
    if (gsMicUser != null) result.gsMicUser = gsMicUser;
    if (bossMicUser != null) result.bossMicUser = bossMicUser;
    if (roomGs != null) result.roomGs.addAll(roomGs);
    if (roomUser != null) result.roomUser.addAll(roomUser);
    if (offRoomGs != null) result.offRoomGs.addAll(offRoomGs);
    return result;
  }

  HeartLinkUserInfoRsp._();

  factory HeartLinkUserInfoRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartLinkUserInfoRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartLinkUserInfoRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aOM<HeartiesInfo>(1, _omitFieldNames ? '' : 'gsMicUser',
        subBuilder: HeartiesInfo.create)
    ..aOM<HeartiesInfo>(2, _omitFieldNames ? '' : 'bossMicUser',
        subBuilder: HeartiesInfo.create)
    ..pPM<HeartiesInfo>(3, _omitFieldNames ? '' : 'roomGs',
        subBuilder: HeartiesInfo.create)
    ..pPM<HeartiesInfo>(4, _omitFieldNames ? '' : 'roomUser',
        subBuilder: HeartiesInfo.create)
    ..pPM<HeartiesInfo>(5, _omitFieldNames ? '' : 'offRoomGs',
        subBuilder: HeartiesInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkUserInfoRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkUserInfoRsp copyWith(void Function(HeartLinkUserInfoRsp) updates) =>
      super.copyWith((message) => updates(message as HeartLinkUserInfoRsp))
          as HeartLinkUserInfoRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartLinkUserInfoRsp create() => HeartLinkUserInfoRsp._();
  @$core.override
  HeartLinkUserInfoRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartLinkUserInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartLinkUserInfoRsp>(create);
  static HeartLinkUserInfoRsp? _defaultInstance;

  @$pb.TagNumber(1)
  HeartiesInfo get gsMicUser => $_getN(0);
  @$pb.TagNumber(1)
  set gsMicUser(HeartiesInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGsMicUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsMicUser() => $_clearField(1);
  @$pb.TagNumber(1)
  HeartiesInfo ensureGsMicUser() => $_ensure(0);

  @$pb.TagNumber(2)
  HeartiesInfo get bossMicUser => $_getN(1);
  @$pb.TagNumber(2)
  set bossMicUser(HeartiesInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBossMicUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearBossMicUser() => $_clearField(2);
  @$pb.TagNumber(2)
  HeartiesInfo ensureBossMicUser() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbList<HeartiesInfo> get roomGs => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<HeartiesInfo> get roomUser => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<HeartiesInfo> get offRoomGs => $_getList(4);
}

class HeartLinkChatContent extends $pb.GeneratedMessage {
  factory HeartLinkChatContent({
    $0.SimpleUser? sender,
    $1.Message? quoteMsg,
    HeartLinkCard? cardInfo,
    $2.RelationBadge? relationBadge,
  }) {
    final result = create();
    if (sender != null) result.sender = sender;
    if (quoteMsg != null) result.quoteMsg = quoteMsg;
    if (cardInfo != null) result.cardInfo = cardInfo;
    if (relationBadge != null) result.relationBadge = relationBadge;
    return result;
  }

  HeartLinkChatContent._();

  factory HeartLinkChatContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartLinkChatContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartLinkChatContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aOM<$0.SimpleUser>(1, _omitFieldNames ? '' : 'sender',
        subBuilder: $0.SimpleUser.create)
    ..aOM<$1.Message>(2, _omitFieldNames ? '' : 'quoteMsg',
        subBuilder: $1.Message.create)
    ..aOM<HeartLinkCard>(3, _omitFieldNames ? '' : 'cardInfo',
        subBuilder: HeartLinkCard.create)
    ..aOM<$2.RelationBadge>(4, _omitFieldNames ? '' : 'relationBadge',
        subBuilder: $2.RelationBadge.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkChatContent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartLinkChatContent copyWith(void Function(HeartLinkChatContent) updates) =>
      super.copyWith((message) => updates(message as HeartLinkChatContent))
          as HeartLinkChatContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartLinkChatContent create() => HeartLinkChatContent._();
  @$core.override
  HeartLinkChatContent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartLinkChatContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartLinkChatContent>(create);
  static HeartLinkChatContent? _defaultInstance;

  @$pb.TagNumber(1)
  $0.SimpleUser get sender => $_getN(0);
  @$pb.TagNumber(1)
  set sender($0.SimpleUser value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.SimpleUser ensureSender() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Message get quoteMsg => $_getN(1);
  @$pb.TagNumber(2)
  set quoteMsg($1.Message value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasQuoteMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuoteMsg() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Message ensureQuoteMsg() => $_ensure(1);

  @$pb.TagNumber(3)
  HeartLinkCard get cardInfo => $_getN(2);
  @$pb.TagNumber(3)
  set cardInfo(HeartLinkCard value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCardInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearCardInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  HeartLinkCard ensureCardInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.RelationBadge get relationBadge => $_getN(3);
  @$pb.TagNumber(4)
  set relationBadge($2.RelationBadge value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRelationBadge() => $_has(3);
  @$pb.TagNumber(4)
  void clearRelationBadge() => $_clearField(4);
  @$pb.TagNumber(4)
  $2.RelationBadge ensureRelationBadge() => $_ensure(3);
}

class HeartfeltWordsRsp extends $pb.GeneratedMessage {
  factory HeartfeltWordsRsp({
    $core.int? id,
    $core.String? question,
    $core.Iterable<$core.String>? answer,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (question != null) result.question = question;
    if (answer != null) result.answer.addAll(answer);
    return result;
  }

  HeartfeltWordsRsp._();

  factory HeartfeltWordsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartfeltWordsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartfeltWordsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'question')
    ..pPS(3, _omitFieldNames ? '' : 'answer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartfeltWordsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartfeltWordsRsp copyWith(void Function(HeartfeltWordsRsp) updates) =>
      super.copyWith((message) => updates(message as HeartfeltWordsRsp))
          as HeartfeltWordsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartfeltWordsRsp create() => HeartfeltWordsRsp._();
  @$core.override
  HeartfeltWordsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartfeltWordsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartfeltWordsRsp>(create);
  static HeartfeltWordsRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get question => $_getSZ(1);
  @$pb.TagNumber(2)
  set question($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuestion() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestion() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get answer => $_getList(2);
}

class HeartfeltWordReq extends $pb.GeneratedMessage {
  factory HeartfeltWordReq({
    $fixnum.Int64? channelId,
    $core.int? questionId,
    $core.String? answer,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    if (questionId != null) result.questionId = questionId;
    if (answer != null) result.answer = answer;
    return result;
  }

  HeartfeltWordReq._();

  factory HeartfeltWordReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HeartfeltWordReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HeartfeltWordReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'heart_link'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'channelId')
    ..aI(2, _omitFieldNames ? '' : 'questionId', protoName: 'questionId')
    ..aOS(3, _omitFieldNames ? '' : 'answer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartfeltWordReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HeartfeltWordReq copyWith(void Function(HeartfeltWordReq) updates) =>
      super.copyWith((message) => updates(message as HeartfeltWordReq))
          as HeartfeltWordReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HeartfeltWordReq create() => HeartfeltWordReq._();
  @$core.override
  HeartfeltWordReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HeartfeltWordReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HeartfeltWordReq>(create);
  static HeartfeltWordReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(1)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get questionId => $_getIZ(1);
  @$pb.TagNumber(2)
  set questionId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuestionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestionId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get answer => $_getSZ(2);
  @$pb.TagNumber(3)
  set answer($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAnswer() => $_has(2);
  @$pb.TagNumber(3)
  void clearAnswer() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

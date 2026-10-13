// This is a generated file - do not edit.
//
// Generated from server_client/home_page/home_page_bean.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../user.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'home_page_bean.pbenum.dart';

class HomePageUserInfo extends $pb.GeneratedMessage {
  factory HomePageUserInfo({
    $fixnum.Int64? id,
    $core.String? name,
    $core.int? age,
    $core.String? audioUri,
    $core.Iterable<$core.String>? tags,
    $core.int? audioDuration,
    $fixnum.Int64? rid,
    $core.bool? followed,
    $core.String? gender,
    $core.String? emUsername,
    $core.String? headerUri,
    $core.String? signature,
    $core.int? yesterdayRank,
    $core.Iterable<$core.String>? roomLabelColor,
    $core.int? weight,
    $core.int? height,
    $core.String? birthday,
    $core.Iterable<$0.AuditItem>? picList,
    $0.ChannelInfo? currentChannel,
    $core.int? onlineStatus,
    $core.String? showReason,
    $core.Iterable<$core.String>? nicknameColor,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (age != null) result.age = age;
    if (audioUri != null) result.audioUri = audioUri;
    if (tags != null) result.tags.addAll(tags);
    if (audioDuration != null) result.audioDuration = audioDuration;
    if (rid != null) result.rid = rid;
    if (followed != null) result.followed = followed;
    if (gender != null) result.gender = gender;
    if (emUsername != null) result.emUsername = emUsername;
    if (headerUri != null) result.headerUri = headerUri;
    if (signature != null) result.signature = signature;
    if (yesterdayRank != null) result.yesterdayRank = yesterdayRank;
    if (roomLabelColor != null) result.roomLabelColor.addAll(roomLabelColor);
    if (weight != null) result.weight = weight;
    if (height != null) result.height = height;
    if (birthday != null) result.birthday = birthday;
    if (picList != null) result.picList.addAll(picList);
    if (currentChannel != null) result.currentChannel = currentChannel;
    if (onlineStatus != null) result.onlineStatus = onlineStatus;
    if (showReason != null) result.showReason = showReason;
    if (nicknameColor != null) result.nicknameColor.addAll(nicknameColor);
    return result;
  }

  HomePageUserInfo._();

  factory HomePageUserInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomePageUserInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomePageUserInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_bean'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aI(3, _omitFieldNames ? '' : 'age')
    ..aOS(4, _omitFieldNames ? '' : 'audioUri')
    ..pPS(5, _omitFieldNames ? '' : 'tags')
    ..aI(6, _omitFieldNames ? '' : 'audioDuration')
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'rid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(8, _omitFieldNames ? '' : 'followed')
    ..aOS(9, _omitFieldNames ? '' : 'gender')
    ..aOS(10, _omitFieldNames ? '' : 'emUsername')
    ..aOS(11, _omitFieldNames ? '' : 'headerUri')
    ..aOS(12, _omitFieldNames ? '' : 'signature')
    ..aI(13, _omitFieldNames ? '' : 'yesterdayRank')
    ..pPS(14, _omitFieldNames ? '' : 'roomLabelColor')
    ..aI(15, _omitFieldNames ? '' : 'weight')
    ..aI(16, _omitFieldNames ? '' : 'height')
    ..aOS(17, _omitFieldNames ? '' : 'birthday')
    ..pPM<$0.AuditItem>(18, _omitFieldNames ? '' : 'picList',
        subBuilder: $0.AuditItem.create)
    ..aOM<$0.ChannelInfo>(19, _omitFieldNames ? '' : 'currentChannel',
        subBuilder: $0.ChannelInfo.create)
    ..aI(20, _omitFieldNames ? '' : 'onlineStatus')
    ..aOS(21, _omitFieldNames ? '' : 'showReason')
    ..pPS(22, _omitFieldNames ? '' : 'nicknameColor')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageUserInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageUserInfo copyWith(void Function(HomePageUserInfo) updates) =>
      super.copyWith((message) => updates(message as HomePageUserInfo))
          as HomePageUserInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomePageUserInfo create() => HomePageUserInfo._();
  @$core.override
  HomePageUserInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomePageUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomePageUserInfo>(create);
  static HomePageUserInfo? _defaultInstance;

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
  $core.int get age => $_getIZ(2);
  @$pb.TagNumber(3)
  set age($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearAge() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get audioUri => $_getSZ(3);
  @$pb.TagNumber(4)
  set audioUri($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAudioUri() => $_has(3);
  @$pb.TagNumber(4)
  void clearAudioUri() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get tags => $_getList(4);

  @$pb.TagNumber(6)
  $core.int get audioDuration => $_getIZ(5);
  @$pb.TagNumber(6)
  set audioDuration($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAudioDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearAudioDuration() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get rid => $_getI64(6);
  @$pb.TagNumber(7)
  set rid($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRid() => $_has(6);
  @$pb.TagNumber(7)
  void clearRid() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get followed => $_getBF(7);
  @$pb.TagNumber(8)
  set followed($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasFollowed() => $_has(7);
  @$pb.TagNumber(8)
  void clearFollowed() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get gender => $_getSZ(8);
  @$pb.TagNumber(9)
  set gender($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasGender() => $_has(8);
  @$pb.TagNumber(9)
  void clearGender() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get emUsername => $_getSZ(9);
  @$pb.TagNumber(10)
  set emUsername($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasEmUsername() => $_has(9);
  @$pb.TagNumber(10)
  void clearEmUsername() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get headerUri => $_getSZ(10);
  @$pb.TagNumber(11)
  set headerUri($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasHeaderUri() => $_has(10);
  @$pb.TagNumber(11)
  void clearHeaderUri() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get signature => $_getSZ(11);
  @$pb.TagNumber(12)
  set signature($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasSignature() => $_has(11);
  @$pb.TagNumber(12)
  void clearSignature() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get yesterdayRank => $_getIZ(12);
  @$pb.TagNumber(13)
  set yesterdayRank($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasYesterdayRank() => $_has(12);
  @$pb.TagNumber(13)
  void clearYesterdayRank() => $_clearField(13);

  @$pb.TagNumber(14)
  $pb.PbList<$core.String> get roomLabelColor => $_getList(13);

  @$pb.TagNumber(15)
  $core.int get weight => $_getIZ(14);
  @$pb.TagNumber(15)
  set weight($core.int value) => $_setSignedInt32(14, value);
  @$pb.TagNumber(15)
  $core.bool hasWeight() => $_has(14);
  @$pb.TagNumber(15)
  void clearWeight() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.int get height => $_getIZ(15);
  @$pb.TagNumber(16)
  set height($core.int value) => $_setSignedInt32(15, value);
  @$pb.TagNumber(16)
  $core.bool hasHeight() => $_has(15);
  @$pb.TagNumber(16)
  void clearHeight() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.String get birthday => $_getSZ(16);
  @$pb.TagNumber(17)
  set birthday($core.String value) => $_setString(16, value);
  @$pb.TagNumber(17)
  $core.bool hasBirthday() => $_has(16);
  @$pb.TagNumber(17)
  void clearBirthday() => $_clearField(17);

  @$pb.TagNumber(18)
  $pb.PbList<$0.AuditItem> get picList => $_getList(17);

  @$pb.TagNumber(19)
  $0.ChannelInfo get currentChannel => $_getN(18);
  @$pb.TagNumber(19)
  set currentChannel($0.ChannelInfo value) => $_setField(19, value);
  @$pb.TagNumber(19)
  $core.bool hasCurrentChannel() => $_has(18);
  @$pb.TagNumber(19)
  void clearCurrentChannel() => $_clearField(19);
  @$pb.TagNumber(19)
  $0.ChannelInfo ensureCurrentChannel() => $_ensure(18);

  @$pb.TagNumber(20)
  $core.int get onlineStatus => $_getIZ(19);
  @$pb.TagNumber(20)
  set onlineStatus($core.int value) => $_setSignedInt32(19, value);
  @$pb.TagNumber(20)
  $core.bool hasOnlineStatus() => $_has(19);
  @$pb.TagNumber(20)
  void clearOnlineStatus() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.String get showReason => $_getSZ(20);
  @$pb.TagNumber(21)
  set showReason($core.String value) => $_setString(20, value);
  @$pb.TagNumber(21)
  $core.bool hasShowReason() => $_has(20);
  @$pb.TagNumber(21)
  void clearShowReason() => $_clearField(21);

  @$pb.TagNumber(22)
  $pb.PbList<$core.String> get nicknameColor => $_getList(21);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

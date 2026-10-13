// This is a generated file - do not edit.
//
// Generated from server_client/gs/auto_chat.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../user.pb.dart' as $1;
import 'gs_persona.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 查询助聊配置响应：是否开启助聊 + 人设背景信息
class AutoChatConfigRsp extends $pb.GeneratedMessage {
  factory AutoChatConfigRsp({
    $core.bool? openAutoChat,
    $0.BackgroundInfo? backgroundInfo,
  }) {
    final result = create();
    if (openAutoChat != null) result.openAutoChat = openAutoChat;
    if (backgroundInfo != null) result.backgroundInfo = backgroundInfo;
    return result;
  }

  AutoChatConfigRsp._();

  factory AutoChatConfigRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AutoChatConfigRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AutoChatConfigRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.auto_chat'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'openAutoChat')
    ..aOM<$0.BackgroundInfo>(2, _omitFieldNames ? '' : 'backgroundInfo',
        subBuilder: $0.BackgroundInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoChatConfigRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AutoChatConfigRsp copyWith(void Function(AutoChatConfigRsp) updates) =>
      super.copyWith((message) => updates(message as AutoChatConfigRsp))
          as AutoChatConfigRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AutoChatConfigRsp create() => AutoChatConfigRsp._();
  @$core.override
  AutoChatConfigRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AutoChatConfigRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AutoChatConfigRsp>(create);
  static AutoChatConfigRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get openAutoChat => $_getBF(0);
  @$pb.TagNumber(1)
  set openAutoChat($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOpenAutoChat() => $_has(0);
  @$pb.TagNumber(1)
  void clearOpenAutoChat() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.BackgroundInfo get backgroundInfo => $_getN(1);
  @$pb.TagNumber(2)
  set backgroundInfo($0.BackgroundInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBackgroundInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearBackgroundInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.BackgroundInfo ensureBackgroundInfo() => $_ensure(1);
}

/// 保存人设/个人信息请求
class SaveAutoChatInfoReq extends $pb.GeneratedMessage {
  factory SaveAutoChatInfoReq({
    $core.int? age,
    $core.String? name,
    $core.String? livingCity,
    $core.String? birthCity,
    $core.String? occupation,
    $core.String? hobbies,
  }) {
    final result = create();
    if (age != null) result.age = age;
    if (name != null) result.name = name;
    if (livingCity != null) result.livingCity = livingCity;
    if (birthCity != null) result.birthCity = birthCity;
    if (occupation != null) result.occupation = occupation;
    if (hobbies != null) result.hobbies = hobbies;
    return result;
  }

  SaveAutoChatInfoReq._();

  factory SaveAutoChatInfoReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SaveAutoChatInfoReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SaveAutoChatInfoReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.auto_chat'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'age', fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'livingCity')
    ..aOS(4, _omitFieldNames ? '' : 'birthCity')
    ..aOS(5, _omitFieldNames ? '' : 'occupation')
    ..aOS(6, _omitFieldNames ? '' : 'hobbies')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaveAutoChatInfoReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaveAutoChatInfoReq copyWith(void Function(SaveAutoChatInfoReq) updates) =>
      super.copyWith((message) => updates(message as SaveAutoChatInfoReq))
          as SaveAutoChatInfoReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaveAutoChatInfoReq create() => SaveAutoChatInfoReq._();
  @$core.override
  SaveAutoChatInfoReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SaveAutoChatInfoReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SaveAutoChatInfoReq>(create);
  static SaveAutoChatInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get age => $_getIZ(0);
  @$pb.TagNumber(1)
  set age($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAge() => $_has(0);
  @$pb.TagNumber(1)
  void clearAge() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get livingCity => $_getSZ(2);
  @$pb.TagNumber(3)
  set livingCity($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLivingCity() => $_has(2);
  @$pb.TagNumber(3)
  void clearLivingCity() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get birthCity => $_getSZ(3);
  @$pb.TagNumber(4)
  set birthCity($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBirthCity() => $_has(3);
  @$pb.TagNumber(4)
  void clearBirthCity() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get occupation => $_getSZ(4);
  @$pb.TagNumber(5)
  set occupation($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOccupation() => $_has(4);
  @$pb.TagNumber(5)
  void clearOccupation() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get hobbies => $_getSZ(5);
  @$pb.TagNumber(6)
  set hobbies($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasHobbies() => $_has(5);
  @$pb.TagNumber(6)
  void clearHobbies() => $_clearField(6);
}

class PromptContent extends $pb.GeneratedMessage {
  factory PromptContent({
    $1.User? user,
    $core.String? content,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (content != null) result.content = content;
    return result;
  }

  PromptContent._();

  factory PromptContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PromptContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PromptContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs.auto_chat'),
      createEmptyInstance: create)
    ..aOM<$1.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $1.User.create)
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PromptContent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PromptContent copyWith(void Function(PromptContent) updates) =>
      super.copyWith((message) => updates(message as PromptContent))
          as PromptContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PromptContent create() => PromptContent._();
  @$core.override
  PromptContent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PromptContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PromptContent>(create);
  static PromptContent? _defaultInstance;

  @$pb.TagNumber(1)
  $1.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($1.User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

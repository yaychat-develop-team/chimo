// This is a generated file - do not edit.
//
// Generated from server_client/invite_code.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'invite_code.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'invite_code.pbenum.dart';

class UseInviteCodeReq extends $pb.GeneratedMessage {
  factory UseInviteCodeReq({
    $core.String? code,
  }) {
    final result = create();
    if (code != null) result.code = code;
    return result;
  }

  UseInviteCodeReq._();

  factory UseInviteCodeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UseInviteCodeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UseInviteCodeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'invite_code'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UseInviteCodeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UseInviteCodeReq copyWith(void Function(UseInviteCodeReq) updates) =>
      super.copyWith((message) => updates(message as UseInviteCodeReq))
          as UseInviteCodeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UseInviteCodeReq create() => UseInviteCodeReq._();
  @$core.override
  UseInviteCodeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UseInviteCodeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UseInviteCodeReq>(create);
  static UseInviteCodeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);
}

class InviteCode extends $pb.GeneratedMessage {
  factory InviteCode({
    $core.String? code,
    $fixnum.Int64? userId,
    $core.String? avatar,
    $core.String? nickname,
    UserStatus? status,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (userId != null) result.userId = userId;
    if (avatar != null) result.avatar = avatar;
    if (nickname != null) result.nickname = nickname;
    if (status != null) result.status = status;
    return result;
  }

  InviteCode._();

  factory InviteCode.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteCode.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteCode',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'invite_code'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aInt64(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'nickname')
    ..aE<UserStatus>(5, _omitFieldNames ? '' : 'status',
        enumValues: UserStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteCode clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteCode copyWith(void Function(InviteCode) updates) =>
      super.copyWith((message) => updates(message as InviteCode)) as InviteCode;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteCode create() => InviteCode._();
  @$core.override
  InviteCode createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InviteCode getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteCode>(create);
  static InviteCode? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get nickname => $_getSZ(3);
  @$pb.TagNumber(4)
  set nickname($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNickname() => $_has(3);
  @$pb.TagNumber(4)
  void clearNickname() => $_clearField(4);

  @$pb.TagNumber(5)
  UserStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(UserStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);
}

class GetInviteCodeListResp extends $pb.GeneratedMessage {
  factory GetInviteCodeListResp({
    $core.Iterable<InviteCode>? codes,
  }) {
    final result = create();
    if (codes != null) result.codes.addAll(codes);
    return result;
  }

  GetInviteCodeListResp._();

  factory GetInviteCodeListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInviteCodeListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInviteCodeListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'invite_code'),
      createEmptyInstance: create)
    ..pPM<InviteCode>(1, _omitFieldNames ? '' : 'codes',
        subBuilder: InviteCode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInviteCodeListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInviteCodeListResp copyWith(
          void Function(GetInviteCodeListResp) updates) =>
      super.copyWith((message) => updates(message as GetInviteCodeListResp))
          as GetInviteCodeListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInviteCodeListResp create() => GetInviteCodeListResp._();
  @$core.override
  GetInviteCodeListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetInviteCodeListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInviteCodeListResp>(create);
  static GetInviteCodeListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<InviteCode> get codes => $_getList(0);
}

class GenerateTextReq extends $pb.GeneratedMessage {
  factory GenerateTextReq({
    $core.String? code,
  }) {
    final result = create();
    if (code != null) result.code = code;
    return result;
  }

  GenerateTextReq._();

  factory GenerateTextReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateTextReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateTextReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'invite_code'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateTextReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateTextReq copyWith(void Function(GenerateTextReq) updates) =>
      super.copyWith((message) => updates(message as GenerateTextReq))
          as GenerateTextReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateTextReq create() => GenerateTextReq._();
  @$core.override
  GenerateTextReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateTextReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateTextReq>(create);
  static GenerateTextReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);
}

class GenerateTextResp extends $pb.GeneratedMessage {
  factory GenerateTextResp({
    $core.String? text,
  }) {
    final result = create();
    if (text != null) result.text = text;
    return result;
  }

  GenerateTextResp._();

  factory GenerateTextResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateTextResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateTextResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'invite_code'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateTextResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateTextResp copyWith(void Function(GenerateTextResp) updates) =>
      super.copyWith((message) => updates(message as GenerateTextResp))
          as GenerateTextResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateTextResp create() => GenerateTextResp._();
  @$core.override
  GenerateTextResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateTextResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateTextResp>(create);
  static GenerateTextResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

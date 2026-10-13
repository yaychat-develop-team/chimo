// This is a generated file - do not edit.
//
// Generated from server_client/admin/admin_user.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// *
/// 登录发送验证码
/// post /login/send-captcha
/// body LoginSendCaptchaReq
/// return BaseRsp(data is null)
class LoginSendCaptchaReq extends $pb.GeneratedMessage {
  factory LoginSendCaptchaReq({
    $core.String? phone,
  }) {
    final result = create();
    if (phone != null) result.phone = phone;
    return result;
  }

  LoginSendCaptchaReq._();

  factory LoginSendCaptchaReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginSendCaptchaReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginSendCaptchaReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminUser'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'phone')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginSendCaptchaReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginSendCaptchaReq copyWith(void Function(LoginSendCaptchaReq) updates) =>
      super.copyWith((message) => updates(message as LoginSendCaptchaReq))
          as LoginSendCaptchaReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginSendCaptchaReq create() => LoginSendCaptchaReq._();
  @$core.override
  LoginSendCaptchaReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoginSendCaptchaReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginSendCaptchaReq>(create);
  static LoginSendCaptchaReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phone => $_getSZ(0);
  @$pb.TagNumber(1)
  set phone($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPhone() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhone() => $_clearField(1);
}

/// *
/// 登录
/// post /login
/// body LoginReq
/// return BaseRsp(data is LoginRspData)
class LoginReq extends $pb.GeneratedMessage {
  factory LoginReq({
    $core.String? phone,
    $core.String? captcha,
  }) {
    final result = create();
    if (phone != null) result.phone = phone;
    if (captcha != null) result.captcha = captcha;
    return result;
  }

  LoginReq._();

  factory LoginReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminUser'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'phone')
    ..aOS(2, _omitFieldNames ? '' : 'captcha')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginReq copyWith(void Function(LoginReq) updates) =>
      super.copyWith((message) => updates(message as LoginReq)) as LoginReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginReq create() => LoginReq._();
  @$core.override
  LoginReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoginReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginReq>(create);
  static LoginReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phone => $_getSZ(0);
  @$pb.TagNumber(1)
  set phone($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPhone() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhone() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get captcha => $_getSZ(1);
  @$pb.TagNumber(2)
  set captcha($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCaptcha() => $_has(1);
  @$pb.TagNumber(2)
  void clearCaptcha() => $_clearField(2);
}

class LoginRspData extends $pb.GeneratedMessage {
  factory LoginRspData({
    $core.String? token,
    $core.String? name,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (name != null) result.name = name;
    return result;
  }

  LoginRspData._();

  factory LoginRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminUser'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginRspData copyWith(void Function(LoginRspData) updates) =>
      super.copyWith((message) => updates(message as LoginRspData))
          as LoginRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginRspData create() => LoginRspData._();
  @$core.override
  LoginRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoginRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginRspData>(create);
  static LoginRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);
}

/// *
/// 登出
/// post /logout
/// body LogoutReq
/// return BaseRsp(data is null)
class LogoutReq extends $pb.GeneratedMessage {
  factory LogoutReq() => create();

  LogoutReq._();

  factory LogoutReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LogoutReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LogoutReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminUser'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LogoutReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LogoutReq copyWith(void Function(LogoutReq) updates) =>
      super.copyWith((message) => updates(message as LogoutReq)) as LogoutReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogoutReq create() => LogoutReq._();
  @$core.override
  LogoutReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LogoutReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogoutReq>(create);
  static LogoutReq? _defaultInstance;
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

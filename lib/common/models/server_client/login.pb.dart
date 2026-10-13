// This is a generated file - do not edit.
//
// Generated from server_client/login.proto.

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

class SendEmailCodeReq extends $pb.GeneratedMessage {
  factory SendEmailCodeReq({
    $core.String? email,
  }) {
    final result = create();
    if (email != null) result.email = email;
    return result;
  }

  SendEmailCodeReq._();

  factory SendEmailCodeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendEmailCodeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendEmailCodeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendEmailCodeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendEmailCodeReq copyWith(void Function(SendEmailCodeReq) updates) =>
      super.copyWith((message) => updates(message as SendEmailCodeReq))
          as SendEmailCodeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendEmailCodeReq create() => SendEmailCodeReq._();
  @$core.override
  SendEmailCodeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendEmailCodeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendEmailCodeReq>(create);
  static SendEmailCodeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);
}

class EmailAuthReq extends $pb.GeneratedMessage {
  factory EmailAuthReq({
    $core.String? email,
    $core.String? code,
    $core.String? channelName,
    $core.String? hlSign,
  }) {
    final result = create();
    if (email != null) result.email = email;
    if (code != null) result.code = code;
    if (channelName != null) result.channelName = channelName;
    if (hlSign != null) result.hlSign = hlSign;
    return result;
  }

  EmailAuthReq._();

  factory EmailAuthReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmailAuthReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmailAuthReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOS(3, _omitFieldNames ? '' : 'channelName')
    ..aOS(4, _omitFieldNames ? '' : 'hlSign')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmailAuthReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmailAuthReq copyWith(void Function(EmailAuthReq) updates) =>
      super.copyWith((message) => updates(message as EmailAuthReq))
          as EmailAuthReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmailAuthReq create() => EmailAuthReq._();
  @$core.override
  EmailAuthReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EmailAuthReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmailAuthReq>(create);
  static EmailAuthReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get channelName => $_getSZ(2);
  @$pb.TagNumber(3)
  set channelName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChannelName() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannelName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get hlSign => $_getSZ(3);
  @$pb.TagNumber(4)
  set hlSign($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHlSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearHlSign() => $_clearField(4);
}

class PhoneAuthReq extends $pb.GeneratedMessage {
  factory PhoneAuthReq({
    $core.String? phone,
    $core.String? code,
    $core.String? channelName,
    $core.String? hlSign,
  }) {
    final result = create();
    if (phone != null) result.phone = phone;
    if (code != null) result.code = code;
    if (channelName != null) result.channelName = channelName;
    if (hlSign != null) result.hlSign = hlSign;
    return result;
  }

  PhoneAuthReq._();

  factory PhoneAuthReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PhoneAuthReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PhoneAuthReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'phone')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOS(3, _omitFieldNames ? '' : 'channelName')
    ..aOS(4, _omitFieldNames ? '' : 'hlSign')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhoneAuthReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhoneAuthReq copyWith(void Function(PhoneAuthReq) updates) =>
      super.copyWith((message) => updates(message as PhoneAuthReq))
          as PhoneAuthReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhoneAuthReq create() => PhoneAuthReq._();
  @$core.override
  PhoneAuthReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PhoneAuthReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PhoneAuthReq>(create);
  static PhoneAuthReq? _defaultInstance;

  /// 必须与发送验证码时使用的手机号格式一致。服务端会先规范化为 E.164 格式。
  /// 推荐格式：+639171234567；菲律宾 6309171234567、+6309171234567、006309171234567
  /// 也会转换为 +639171234567。
  @$pb.TagNumber(1)
  $core.String get phone => $_getSZ(0);
  @$pb.TagNumber(1)
  set phone($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPhone() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhone() => $_clearField(1);

  /// 短信验证码，固定为 6 位数字。
  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get channelName => $_getSZ(2);
  @$pb.TagNumber(3)
  set channelName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChannelName() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannelName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get hlSign => $_getSZ(3);
  @$pb.TagNumber(4)
  set hlSign($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHlSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearHlSign() => $_clearField(4);
}

class RefreshTokenData extends $pb.GeneratedMessage {
  factory RefreshTokenData({
    $core.String? token,
    AuthRsp? authInfo,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (authInfo != null) result.authInfo = authInfo;
    return result;
  }

  RefreshTokenData._();

  factory RefreshTokenData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RefreshTokenData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RefreshTokenData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOM<AuthRsp>(2, _omitFieldNames ? '' : 'authInfo',
        subBuilder: AuthRsp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTokenData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RefreshTokenData copyWith(void Function(RefreshTokenData) updates) =>
      super.copyWith((message) => updates(message as RefreshTokenData))
          as RefreshTokenData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshTokenData create() => RefreshTokenData._();
  @$core.override
  RefreshTokenData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RefreshTokenData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshTokenData>(create);
  static RefreshTokenData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);

  @$pb.TagNumber(2)
  AuthRsp get authInfo => $_getN(1);
  @$pb.TagNumber(2)
  set authInfo(AuthRsp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAuthInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  AuthRsp ensureAuthInfo() => $_ensure(1);
}

class SmsSendReq extends $pb.GeneratedMessage {
  factory SmsSendReq({
    $core.String? phone,
  }) {
    final result = create();
    if (phone != null) result.phone = phone;
    return result;
  }

  SmsSendReq._();

  factory SmsSendReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SmsSendReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SmsSendReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'phone')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SmsSendReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SmsSendReq copyWith(void Function(SmsSendReq) updates) =>
      super.copyWith((message) => updates(message as SmsSendReq)) as SmsSendReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SmsSendReq create() => SmsSendReq._();
  @$core.override
  SmsSendReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SmsSendReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SmsSendReq>(create);
  static SmsSendReq? _defaultInstance;

  /// 手机号。推荐直接传 E.164 格式：+国家码+号码，例如 +639171234567。
  /// 菲律宾手机号也支持传 63 + 本地号码的形式：6309171234567、+6309171234567 或 006309171234567，
  /// 服务端会转换为 +639171234567 后再存储、限流并提交腾讯云短信。
  /// 仅传菲律宾本地号码 09171234567 时无法判断国家，服务端会拒绝；不要传 +1 作为菲律宾国家码。
  @$pb.TagNumber(1)
  $core.String get phone => $_getSZ(0);
  @$pb.TagNumber(1)
  set phone($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPhone() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhone() => $_clearField(1);
}

class SmsAuthReq extends $pb.GeneratedMessage {
  factory SmsAuthReq({
    $core.String? phone,
    $core.String? code,
    $core.String? userInfoKey,
  }) {
    final result = create();
    if (phone != null) result.phone = phone;
    if (code != null) result.code = code;
    if (userInfoKey != null) result.userInfoKey = userInfoKey;
    return result;
  }

  SmsAuthReq._();

  factory SmsAuthReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SmsAuthReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SmsAuthReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'phone')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOS(3, _omitFieldNames ? '' : 'userInfoKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SmsAuthReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SmsAuthReq copyWith(void Function(SmsAuthReq) updates) =>
      super.copyWith((message) => updates(message as SmsAuthReq)) as SmsAuthReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SmsAuthReq create() => SmsAuthReq._();
  @$core.override
  SmsAuthReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SmsAuthReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SmsAuthReq>(create);
  static SmsAuthReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phone => $_getSZ(0);
  @$pb.TagNumber(1)
  set phone($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPhone() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhone() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userInfoKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set userInfoKey($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserInfoKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserInfoKey() => $_clearField(3);
}

class FlashAuthReq extends $pb.GeneratedMessage {
  factory FlashAuthReq({
    $core.String? token,
    $core.String? userInfoKey,
    $core.bool? ios,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (userInfoKey != null) result.userInfoKey = userInfoKey;
    if (ios != null) result.ios = ios;
    return result;
  }

  FlashAuthReq._();

  factory FlashAuthReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FlashAuthReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FlashAuthReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOS(2, _omitFieldNames ? '' : 'userInfoKey')
    ..aOB(3, _omitFieldNames ? '' : 'ios')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FlashAuthReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FlashAuthReq copyWith(void Function(FlashAuthReq) updates) =>
      super.copyWith((message) => updates(message as FlashAuthReq))
          as FlashAuthReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FlashAuthReq create() => FlashAuthReq._();
  @$core.override
  FlashAuthReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FlashAuthReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FlashAuthReq>(create);
  static FlashAuthReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userInfoKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set userInfoKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserInfoKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserInfoKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get ios => $_getBF(2);
  @$pb.TagNumber(3)
  set ios($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIos() => $_has(2);
  @$pb.TagNumber(3)
  void clearIos() => $_clearField(3);
}

class AuthRsp extends $pb.GeneratedMessage {
  factory AuthRsp({
    $core.String? token,
    $core.String? avatar,
    $core.String? gender,
    $core.String? nickName,
    $core.bool? newUser,
    $core.String? emUsername,
    $core.String? emPwd,
    TencentImLoginInfo? tencentIm,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (avatar != null) result.avatar = avatar;
    if (gender != null) result.gender = gender;
    if (nickName != null) result.nickName = nickName;
    if (newUser != null) result.newUser = newUser;
    if (emUsername != null) result.emUsername = emUsername;
    if (emPwd != null) result.emPwd = emPwd;
    if (tencentIm != null) result.tencentIm = tencentIm;
    return result;
  }

  AuthRsp._();

  factory AuthRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuthRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..aOS(5, _omitFieldNames ? '' : 'gender')
    ..aOS(6, _omitFieldNames ? '' : 'nickName')
    ..aOB(7, _omitFieldNames ? '' : 'newUser')
    ..aOS(8, _omitFieldNames ? '' : 'emUsername')
    ..aOS(9, _omitFieldNames ? '' : 'emPwd')
    ..aOM<TencentImLoginInfo>(10, _omitFieldNames ? '' : 'tencentIm',
        subBuilder: TencentImLoginInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthRsp copyWith(void Function(AuthRsp) updates) =>
      super.copyWith((message) => updates(message as AuthRsp)) as AuthRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthRsp create() => AuthRsp._();
  @$core.override
  AuthRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuthRsp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthRsp>(create);
  static AuthRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(3)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(3)
  void clearToken() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(1);
  @$pb.TagNumber(4)
  set avatar($core.String value) => $_setString(1, value);
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(1);
  @$pb.TagNumber(4)
  void clearAvatar() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get gender => $_getSZ(2);
  @$pb.TagNumber(5)
  set gender($core.String value) => $_setString(2, value);
  @$pb.TagNumber(5)
  $core.bool hasGender() => $_has(2);
  @$pb.TagNumber(5)
  void clearGender() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get nickName => $_getSZ(3);
  @$pb.TagNumber(6)
  set nickName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(6)
  $core.bool hasNickName() => $_has(3);
  @$pb.TagNumber(6)
  void clearNickName() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get newUser => $_getBF(4);
  @$pb.TagNumber(7)
  set newUser($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(7)
  $core.bool hasNewUser() => $_has(4);
  @$pb.TagNumber(7)
  void clearNewUser() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get emUsername => $_getSZ(5);
  @$pb.TagNumber(8)
  set emUsername($core.String value) => $_setString(5, value);
  @$pb.TagNumber(8)
  $core.bool hasEmUsername() => $_has(5);
  @$pb.TagNumber(8)
  void clearEmUsername() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get emPwd => $_getSZ(6);
  @$pb.TagNumber(9)
  set emPwd($core.String value) => $_setString(6, value);
  @$pb.TagNumber(9)
  $core.bool hasEmPwd() => $_has(6);
  @$pb.TagNumber(9)
  void clearEmPwd() => $_clearField(9);

  @$pb.TagNumber(10)
  TencentImLoginInfo get tencentIm => $_getN(7);
  @$pb.TagNumber(10)
  set tencentIm(TencentImLoginInfo value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasTencentIm() => $_has(7);
  @$pb.TagNumber(10)
  void clearTencentIm() => $_clearField(10);
  @$pb.TagNumber(10)
  TencentImLoginInfo ensureTencentIm() => $_ensure(7);
}

/// 腾讯 IM 登录凭证。。
class TencentImLoginInfo extends $pb.GeneratedMessage {
  factory TencentImLoginInfo({
    $fixnum.Int64? sdkAppId,
    $core.String? userId,
    $core.String? userSig,
    $fixnum.Int64? expireAt,
  }) {
    final result = create();
    if (sdkAppId != null) result.sdkAppId = sdkAppId;
    if (userId != null) result.userId = userId;
    if (userSig != null) result.userSig = userSig;
    if (expireAt != null) result.expireAt = expireAt;
    return result;
  }

  TencentImLoginInfo._();

  factory TencentImLoginInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TencentImLoginInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TencentImLoginInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'sdkAppId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'userSig')
    ..aInt64(4, _omitFieldNames ? '' : 'expireAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TencentImLoginInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TencentImLoginInfo copyWith(void Function(TencentImLoginInfo) updates) =>
      super.copyWith((message) => updates(message as TencentImLoginInfo))
          as TencentImLoginInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TencentImLoginInfo create() => TencentImLoginInfo._();
  @$core.override
  TencentImLoginInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TencentImLoginInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TencentImLoginInfo>(create);
  static TencentImLoginInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sdkAppId => $_getI64(0);
  @$pb.TagNumber(1)
  set sdkAppId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSdkAppId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSdkAppId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userSig => $_getSZ(2);
  @$pb.TagNumber(3)
  set userSig($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserSig() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserSig() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get expireAt => $_getI64(3);
  @$pb.TagNumber(4)
  set expireAt($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpireAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpireAt() => $_clearField(4);
}

class WechatAuthReq extends $pb.GeneratedMessage {
  factory WechatAuthReq({
    $core.String? code,
  }) {
    final result = create();
    if (code != null) result.code = code;
    return result;
  }

  WechatAuthReq._();

  factory WechatAuthReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WechatAuthReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WechatAuthReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WechatAuthReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WechatAuthReq copyWith(void Function(WechatAuthReq) updates) =>
      super.copyWith((message) => updates(message as WechatAuthReq))
          as WechatAuthReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WechatAuthReq create() => WechatAuthReq._();
  @$core.override
  WechatAuthReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WechatAuthReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WechatAuthReq>(create);
  static WechatAuthReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);
}

class AppleAuthReq extends $pb.GeneratedMessage {
  factory AppleAuthReq({
    $core.String? idToken,
    $core.String? nickname,
    $core.String? channelName,
    $core.String? hlSign,
  }) {
    final result = create();
    if (idToken != null) result.idToken = idToken;
    if (nickname != null) result.nickname = nickname;
    if (channelName != null) result.channelName = channelName;
    if (hlSign != null) result.hlSign = hlSign;
    return result;
  }

  AppleAuthReq._();

  factory AppleAuthReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AppleAuthReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AppleAuthReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'idToken')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'channelName')
    ..aOS(4, _omitFieldNames ? '' : 'hlSign')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppleAuthReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppleAuthReq copyWith(void Function(AppleAuthReq) updates) =>
      super.copyWith((message) => updates(message as AppleAuthReq))
          as AppleAuthReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AppleAuthReq create() => AppleAuthReq._();
  @$core.override
  AppleAuthReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AppleAuthReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AppleAuthReq>(create);
  static AppleAuthReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get idToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set idToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get channelName => $_getSZ(2);
  @$pb.TagNumber(3)
  set channelName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChannelName() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannelName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get hlSign => $_getSZ(3);
  @$pb.TagNumber(4)
  set hlSign($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHlSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearHlSign() => $_clearField(4);
}

class QQAuthReq extends $pb.GeneratedMessage {
  factory QQAuthReq({
    $core.String? openId,
    $core.String? accessToken,
  }) {
    final result = create();
    if (openId != null) result.openId = openId;
    if (accessToken != null) result.accessToken = accessToken;
    return result;
  }

  QQAuthReq._();

  factory QQAuthReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QQAuthReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QQAuthReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'openId')
    ..aOS(2, _omitFieldNames ? '' : 'accessToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QQAuthReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QQAuthReq copyWith(void Function(QQAuthReq) updates) =>
      super.copyWith((message) => updates(message as QQAuthReq)) as QQAuthReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QQAuthReq create() => QQAuthReq._();
  @$core.override
  QQAuthReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QQAuthReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QQAuthReq>(create);
  static QQAuthReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get openId => $_getSZ(0);
  @$pb.TagNumber(1)
  set openId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOpenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOpenId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get accessToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set accessToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAccessToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccessToken() => $_clearField(2);
}

enum ExternalAuthRsp_Response { authed, newUserInfoKey, notSet }

class ExternalAuthRsp extends $pb.GeneratedMessage {
  factory ExternalAuthRsp({
    AuthRsp? authed,
    $core.String? newUserInfoKey,
  }) {
    final result = create();
    if (authed != null) result.authed = authed;
    if (newUserInfoKey != null) result.newUserInfoKey = newUserInfoKey;
    return result;
  }

  ExternalAuthRsp._();

  factory ExternalAuthRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExternalAuthRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ExternalAuthRsp_Response>
      _ExternalAuthRsp_ResponseByTag = {
    1: ExternalAuthRsp_Response.authed,
    2: ExternalAuthRsp_Response.newUserInfoKey,
    0: ExternalAuthRsp_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExternalAuthRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<AuthRsp>(1, _omitFieldNames ? '' : 'authed',
        subBuilder: AuthRsp.create)
    ..aOS(2, _omitFieldNames ? '' : 'newUserInfoKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExternalAuthRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExternalAuthRsp copyWith(void Function(ExternalAuthRsp) updates) =>
      super.copyWith((message) => updates(message as ExternalAuthRsp))
          as ExternalAuthRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExternalAuthRsp create() => ExternalAuthRsp._();
  @$core.override
  ExternalAuthRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExternalAuthRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExternalAuthRsp>(create);
  static ExternalAuthRsp? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  ExternalAuthRsp_Response whichResponse() =>
      _ExternalAuthRsp_ResponseByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearResponse() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  AuthRsp get authed => $_getN(0);
  @$pb.TagNumber(1)
  set authed(AuthRsp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAuthed() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthed() => $_clearField(1);
  @$pb.TagNumber(1)
  AuthRsp ensureAuthed() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get newUserInfoKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set newUserInfoKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNewUserInfoKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewUserInfoKey() => $_clearField(2);
}

class GoogleAuthReq extends $pb.GeneratedMessage {
  factory GoogleAuthReq({
    $core.String? accessToken,
    $core.String? idToken,
    $core.String? nickname,
    $core.String? email,
    $core.String? channelName,
    $core.String? hlSign,
  }) {
    final result = create();
    if (accessToken != null) result.accessToken = accessToken;
    if (idToken != null) result.idToken = idToken;
    if (nickname != null) result.nickname = nickname;
    if (email != null) result.email = email;
    if (channelName != null) result.channelName = channelName;
    if (hlSign != null) result.hlSign = hlSign;
    return result;
  }

  GoogleAuthReq._();

  factory GoogleAuthReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GoogleAuthReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GoogleAuthReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'idToken')
    ..aOS(3, _omitFieldNames ? '' : 'nickname')
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..aOS(5, _omitFieldNames ? '' : 'channelName')
    ..aOS(6, _omitFieldNames ? '' : 'hlSign')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GoogleAuthReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GoogleAuthReq copyWith(void Function(GoogleAuthReq) updates) =>
      super.copyWith((message) => updates(message as GoogleAuthReq))
          as GoogleAuthReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GoogleAuthReq create() => GoogleAuthReq._();
  @$core.override
  GoogleAuthReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GoogleAuthReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GoogleAuthReq>(create);
  static GoogleAuthReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get idToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set idToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickname($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickname() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get channelName => $_getSZ(4);
  @$pb.TagNumber(5)
  set channelName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasChannelName() => $_has(4);
  @$pb.TagNumber(5)
  void clearChannelName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get hlSign => $_getSZ(5);
  @$pb.TagNumber(6)
  set hlSign($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasHlSign() => $_has(5);
  @$pb.TagNumber(6)
  void clearHlSign() => $_clearField(6);
}

class FacebookAuthReq extends $pb.GeneratedMessage {
  factory FacebookAuthReq({
    $core.String? token,
    $core.String? channelName,
    $core.String? hlSign,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (channelName != null) result.channelName = channelName;
    if (hlSign != null) result.hlSign = hlSign;
    return result;
  }

  FacebookAuthReq._();

  factory FacebookAuthReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FacebookAuthReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FacebookAuthReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOS(2, _omitFieldNames ? '' : 'channelName')
    ..aOS(3, _omitFieldNames ? '' : 'hlSign')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FacebookAuthReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FacebookAuthReq copyWith(void Function(FacebookAuthReq) updates) =>
      super.copyWith((message) => updates(message as FacebookAuthReq))
          as FacebookAuthReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FacebookAuthReq create() => FacebookAuthReq._();
  @$core.override
  FacebookAuthReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FacebookAuthReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FacebookAuthReq>(create);
  static FacebookAuthReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get channelName => $_getSZ(1);
  @$pb.TagNumber(2)
  set channelName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChannelName() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get hlSign => $_getSZ(2);
  @$pb.TagNumber(3)
  set hlSign($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHlSign() => $_has(2);
  @$pb.TagNumber(3)
  void clearHlSign() => $_clearField(3);
}

class TiktokAuthReq extends $pb.GeneratedMessage {
  factory TiktokAuthReq({
    $core.String? code,
    $core.String? csrfState,
    $core.String? channelName,
    $core.String? hlSign,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (csrfState != null) result.csrfState = csrfState;
    if (channelName != null) result.channelName = channelName;
    if (hlSign != null) result.hlSign = hlSign;
    return result;
  }

  TiktokAuthReq._();

  factory TiktokAuthReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TiktokAuthReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TiktokAuthReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aOS(2, _omitFieldNames ? '' : 'csrfState')
    ..aOS(3, _omitFieldNames ? '' : 'channelName')
    ..aOS(4, _omitFieldNames ? '' : 'hlSign')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TiktokAuthReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TiktokAuthReq copyWith(void Function(TiktokAuthReq) updates) =>
      super.copyWith((message) => updates(message as TiktokAuthReq))
          as TiktokAuthReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TiktokAuthReq create() => TiktokAuthReq._();
  @$core.override
  TiktokAuthReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TiktokAuthReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TiktokAuthReq>(create);
  static TiktokAuthReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get csrfState => $_getSZ(1);
  @$pb.TagNumber(2)
  set csrfState($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCsrfState() => $_has(1);
  @$pb.TagNumber(2)
  void clearCsrfState() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get channelName => $_getSZ(2);
  @$pb.TagNumber(3)
  set channelName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChannelName() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannelName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get hlSign => $_getSZ(3);
  @$pb.TagNumber(4)
  set hlSign($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHlSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearHlSign() => $_clearField(4);
}

class LoginPlatformsRsp extends $pb.GeneratedMessage {
  factory LoginPlatformsRsp({
    $core.Iterable<$core.String>? mainPlatforms,
    $core.Iterable<$core.String>? subPlatforms,
  }) {
    final result = create();
    if (mainPlatforms != null) result.mainPlatforms.addAll(mainPlatforms);
    if (subPlatforms != null) result.subPlatforms.addAll(subPlatforms);
    return result;
  }

  LoginPlatformsRsp._();

  factory LoginPlatformsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginPlatformsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginPlatformsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'login'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'mainPlatforms')
    ..pPS(2, _omitFieldNames ? '' : 'subPlatforms')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginPlatformsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginPlatformsRsp copyWith(void Function(LoginPlatformsRsp) updates) =>
      super.copyWith((message) => updates(message as LoginPlatformsRsp))
          as LoginPlatformsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginPlatformsRsp create() => LoginPlatformsRsp._();
  @$core.override
  LoginPlatformsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoginPlatformsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginPlatformsRsp>(create);
  static LoginPlatformsRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get mainPlatforms => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get subPlatforms => $_getList(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

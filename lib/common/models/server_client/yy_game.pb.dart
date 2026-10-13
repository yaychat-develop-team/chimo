// This is a generated file - do not edit.
//
// Generated from server_client/yy_game.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'yy_game.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'yy_game.pbenum.dart';

class StartGameReq extends $pb.GeneratedMessage {
  factory StartGameReq({
    $core.String? account,
    $core.String? password,
    $core.String? ip,
    $core.int? subplatid,
    $core.String? language,
    $core.String? headimg,
    $core.int? sex,
    $core.String? nickname,
    $core.String? returnUrl,
    $core.String? exchangeUrl,
    $core.String? notifyUrl,
    $core.int? platid,
  }) {
    final result = create();
    if (account != null) result.account = account;
    if (password != null) result.password = password;
    if (ip != null) result.ip = ip;
    if (subplatid != null) result.subplatid = subplatid;
    if (language != null) result.language = language;
    if (headimg != null) result.headimg = headimg;
    if (sex != null) result.sex = sex;
    if (nickname != null) result.nickname = nickname;
    if (returnUrl != null) result.returnUrl = returnUrl;
    if (exchangeUrl != null) result.exchangeUrl = exchangeUrl;
    if (notifyUrl != null) result.notifyUrl = notifyUrl;
    if (platid != null) result.platid = platid;
    return result;
  }

  StartGameReq._();

  factory StartGameReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartGameReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartGameReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'yy_game'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'account')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..aOS(3, _omitFieldNames ? '' : 'ip')
    ..aI(4, _omitFieldNames ? '' : 'subplatid')
    ..aOS(5, _omitFieldNames ? '' : 'language')
    ..aOS(6, _omitFieldNames ? '' : 'headimg')
    ..aI(7, _omitFieldNames ? '' : 'sex')
    ..aOS(8, _omitFieldNames ? '' : 'nickname')
    ..aOS(9, _omitFieldNames ? '' : 'return_url')
    ..aOS(10, _omitFieldNames ? '' : 'exchange_url')
    ..aOS(11, _omitFieldNames ? '' : 'notify_url')
    ..aI(12, _omitFieldNames ? '' : 'platid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartGameReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartGameReq copyWith(void Function(StartGameReq) updates) =>
      super.copyWith((message) => updates(message as StartGameReq))
          as StartGameReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartGameReq create() => StartGameReq._();
  @$core.override
  StartGameReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartGameReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartGameReq>(create);
  static StartGameReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get ip => $_getSZ(2);
  @$pb.TagNumber(3)
  set ip($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIp() => $_has(2);
  @$pb.TagNumber(3)
  void clearIp() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get subplatid => $_getIZ(3);
  @$pb.TagNumber(4)
  set subplatid($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSubplatid() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubplatid() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get language => $_getSZ(4);
  @$pb.TagNumber(5)
  set language($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLanguage() => $_has(4);
  @$pb.TagNumber(5)
  void clearLanguage() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get headimg => $_getSZ(5);
  @$pb.TagNumber(6)
  set headimg($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasHeadimg() => $_has(5);
  @$pb.TagNumber(6)
  void clearHeadimg() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get sex => $_getIZ(6);
  @$pb.TagNumber(7)
  set sex($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSex() => $_has(6);
  @$pb.TagNumber(7)
  void clearSex() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get nickname => $_getSZ(7);
  @$pb.TagNumber(8)
  set nickname($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasNickname() => $_has(7);
  @$pb.TagNumber(8)
  void clearNickname() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get returnUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set returnUrl($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasReturnUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearReturnUrl() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get exchangeUrl => $_getSZ(9);
  @$pb.TagNumber(10)
  set exchangeUrl($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasExchangeUrl() => $_has(9);
  @$pb.TagNumber(10)
  void clearExchangeUrl() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get notifyUrl => $_getSZ(10);
  @$pb.TagNumber(11)
  set notifyUrl($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasNotifyUrl() => $_has(10);
  @$pb.TagNumber(11)
  void clearNotifyUrl() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get platid => $_getIZ(11);
  @$pb.TagNumber(12)
  set platid($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasPlatid() => $_has(11);
  @$pb.TagNumber(12)
  void clearPlatid() => $_clearField(12);
}

class StartGameRsp extends $pb.GeneratedMessage {
  factory StartGameRsp({
    $core.String? account,
    $core.int? userid,
    $core.String? token,
    $core.String? gameurl,
    $core.int? status,
    $core.String? desc,
    StartGameRsp_MoneyType? moneyType,
    $core.String? whatsappNo,
  }) {
    final result = create();
    if (account != null) result.account = account;
    if (userid != null) result.userid = userid;
    if (token != null) result.token = token;
    if (gameurl != null) result.gameurl = gameurl;
    if (status != null) result.status = status;
    if (desc != null) result.desc = desc;
    if (moneyType != null) result.moneyType = moneyType;
    if (whatsappNo != null) result.whatsappNo = whatsappNo;
    return result;
  }

  StartGameRsp._();

  factory StartGameRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartGameRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartGameRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'yy_game'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'account')
    ..aI(2, _omitFieldNames ? '' : 'userid')
    ..aOS(3, _omitFieldNames ? '' : 'token')
    ..aOS(4, _omitFieldNames ? '' : 'gameurl')
    ..aI(5, _omitFieldNames ? '' : 'status')
    ..aOS(6, _omitFieldNames ? '' : 'desc')
    ..aE<StartGameRsp_MoneyType>(7, _omitFieldNames ? '' : 'moneyType',
        enumValues: StartGameRsp_MoneyType.values)
    ..aOS(8, _omitFieldNames ? '' : 'whatsappNo')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartGameRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartGameRsp copyWith(void Function(StartGameRsp) updates) =>
      super.copyWith((message) => updates(message as StartGameRsp))
          as StartGameRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartGameRsp create() => StartGameRsp._();
  @$core.override
  StartGameRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartGameRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartGameRsp>(create);
  static StartGameRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get userid => $_getIZ(1);
  @$pb.TagNumber(2)
  set userid($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get gameurl => $_getSZ(3);
  @$pb.TagNumber(4)
  set gameurl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGameurl() => $_has(3);
  @$pb.TagNumber(4)
  void clearGameurl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get status => $_getIZ(4);
  @$pb.TagNumber(5)
  set status($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => $_clearField(6);

  @$pb.TagNumber(7)
  StartGameRsp_MoneyType get moneyType => $_getN(6);
  @$pb.TagNumber(7)
  set moneyType(StartGameRsp_MoneyType value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasMoneyType() => $_has(6);
  @$pb.TagNumber(7)
  void clearMoneyType() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get whatsappNo => $_getSZ(7);
  @$pb.TagNumber(8)
  set whatsappNo($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasWhatsappNo() => $_has(7);
  @$pb.TagNumber(8)
  void clearWhatsappNo() => $_clearField(8);
}

class ExchangeReq extends $pb.GeneratedMessage {
  factory ExchangeReq({
    ExchangeReq_Type? type,
    $core.int? gameId,
    $core.int? money,
    $core.int? platid,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (gameId != null) result.gameId = gameId;
    if (money != null) result.money = money;
    if (platid != null) result.platid = platid;
    return result;
  }

  ExchangeReq._();

  factory ExchangeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExchangeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExchangeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'yy_game'),
      createEmptyInstance: create)
    ..aE<ExchangeReq_Type>(1, _omitFieldNames ? '' : 'type',
        enumValues: ExchangeReq_Type.values)
    ..aI(2, _omitFieldNames ? '' : 'gameId', protoName: 'gameId')
    ..aI(5, _omitFieldNames ? '' : 'money')
    ..aI(6, _omitFieldNames ? '' : 'platid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExchangeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExchangeReq copyWith(void Function(ExchangeReq) updates) =>
      super.copyWith((message) => updates(message as ExchangeReq))
          as ExchangeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExchangeReq create() => ExchangeReq._();
  @$core.override
  ExchangeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExchangeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExchangeReq>(create);
  static ExchangeReq? _defaultInstance;

  @$pb.TagNumber(1)
  ExchangeReq_Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ExchangeReq_Type value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get gameId => $_getIZ(1);
  @$pb.TagNumber(2)
  set gameId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGameId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGameId() => $_clearField(2);

  @$pb.TagNumber(5)
  $core.int get money => $_getIZ(2);
  @$pb.TagNumber(5)
  set money($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(5)
  $core.bool hasMoney() => $_has(2);
  @$pb.TagNumber(5)
  void clearMoney() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get platid => $_getIZ(3);
  @$pb.TagNumber(6)
  set platid($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(6)
  $core.bool hasPlatid() => $_has(3);
  @$pb.TagNumber(6)
  void clearPlatid() => $_clearField(6);
}

class ExchangeRsp extends $pb.GeneratedMessage {
  factory ExchangeRsp({
    $core.int? status,
    $core.String? desc,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (desc != null) result.desc = desc;
    return result;
  }

  ExchangeRsp._();

  factory ExchangeRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExchangeRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExchangeRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'yy_game'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'desc')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExchangeRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExchangeRsp copyWith(void Function(ExchangeRsp) updates) =>
      super.copyWith((message) => updates(message as ExchangeRsp))
          as ExchangeRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExchangeRsp create() => ExchangeRsp._();
  @$core.override
  ExchangeRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExchangeRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExchangeRsp>(create);
  static ExchangeRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

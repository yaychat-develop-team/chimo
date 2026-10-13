// This is a generated file - do not edit.
//
// Generated from server_client/account_bind.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'account_bind.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'account_bind.pbenum.dart';

class BindPhoneCodeReq extends $pb.GeneratedMessage {
  factory BindPhoneCodeReq({
    $core.String? phone,
  }) {
    final result = create();
    if (phone != null) result.phone = phone;
    return result;
  }

  BindPhoneCodeReq._();

  factory BindPhoneCodeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BindPhoneCodeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BindPhoneCodeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'account_bind'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'phone')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindPhoneCodeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindPhoneCodeReq copyWith(void Function(BindPhoneCodeReq) updates) =>
      super.copyWith((message) => updates(message as BindPhoneCodeReq))
          as BindPhoneCodeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BindPhoneCodeReq create() => BindPhoneCodeReq._();
  @$core.override
  BindPhoneCodeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BindPhoneCodeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BindPhoneCodeReq>(create);
  static BindPhoneCodeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phone => $_getSZ(0);
  @$pb.TagNumber(1)
  set phone($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPhone() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhone() => $_clearField(1);
}

class BindEmailCodeReq extends $pb.GeneratedMessage {
  factory BindEmailCodeReq({
    $core.String? email,
  }) {
    final result = create();
    if (email != null) result.email = email;
    return result;
  }

  BindEmailCodeReq._();

  factory BindEmailCodeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BindEmailCodeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BindEmailCodeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'account_bind'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindEmailCodeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindEmailCodeReq copyWith(void Function(BindEmailCodeReq) updates) =>
      super.copyWith((message) => updates(message as BindEmailCodeReq))
          as BindEmailCodeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BindEmailCodeReq create() => BindEmailCodeReq._();
  @$core.override
  BindEmailCodeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BindEmailCodeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BindEmailCodeReq>(create);
  static BindEmailCodeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);
}

class AccountBindingItem extends $pb.GeneratedMessage {
  factory AccountBindingItem({
    AccountBindingType? type,
    $core.String? displayValue,
    $core.bool? isInitial,
    $fixnum.Int64? bindTime,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (displayValue != null) result.displayValue = displayValue;
    if (isInitial != null) result.isInitial = isInitial;
    if (bindTime != null) result.bindTime = bindTime;
    return result;
  }

  AccountBindingItem._();

  factory AccountBindingItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AccountBindingItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AccountBindingItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'account_bind'),
      createEmptyInstance: create)
    ..aE<AccountBindingType>(1, _omitFieldNames ? '' : 'type',
        enumValues: AccountBindingType.values)
    ..aOS(2, _omitFieldNames ? '' : 'displayValue')
    ..aOB(3, _omitFieldNames ? '' : 'isInitial')
    ..aInt64(4, _omitFieldNames ? '' : 'bindTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccountBindingItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccountBindingItem copyWith(void Function(AccountBindingItem) updates) =>
      super.copyWith((message) => updates(message as AccountBindingItem))
          as AccountBindingItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountBindingItem create() => AccountBindingItem._();
  @$core.override
  AccountBindingItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AccountBindingItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountBindingItem>(create);
  static AccountBindingItem? _defaultInstance;

  @$pb.TagNumber(1)
  AccountBindingType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(AccountBindingType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get displayValue => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayValue($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDisplayValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isInitial => $_getBF(2);
  @$pb.TagNumber(3)
  set isInitial($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsInitial() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsInitial() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get bindTime => $_getI64(3);
  @$pb.TagNumber(4)
  set bindTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBindTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearBindTime() => $_clearField(4);
}

class AccountBindings extends $pb.GeneratedMessage {
  factory AccountBindings({
    $core.Iterable<AccountBindingItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  AccountBindings._();

  factory AccountBindings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AccountBindings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AccountBindings',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'account_bind'),
      createEmptyInstance: create)
    ..pPM<AccountBindingItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: AccountBindingItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccountBindings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccountBindings copyWith(void Function(AccountBindings) updates) =>
      super.copyWith((message) => updates(message as AccountBindings))
          as AccountBindings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountBindings create() => AccountBindings._();
  @$core.override
  AccountBindings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AccountBindings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountBindings>(create);
  static AccountBindings? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<AccountBindingItem> get items => $_getList(0);
}

class BindAccountReq extends $pb.GeneratedMessage {
  factory BindAccountReq({
    AccountBindingType? type,
    $core.String? bindValue,
    $core.String? verifyCode,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (bindValue != null) result.bindValue = bindValue;
    if (verifyCode != null) result.verifyCode = verifyCode;
    return result;
  }

  BindAccountReq._();

  factory BindAccountReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BindAccountReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BindAccountReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'account_bind'),
      createEmptyInstance: create)
    ..aE<AccountBindingType>(1, _omitFieldNames ? '' : 'type',
        enumValues: AccountBindingType.values)
    ..aOS(2, _omitFieldNames ? '' : 'bindValue')
    ..aOS(3, _omitFieldNames ? '' : 'verifyCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindAccountReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindAccountReq copyWith(void Function(BindAccountReq) updates) =>
      super.copyWith((message) => updates(message as BindAccountReq))
          as BindAccountReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BindAccountReq create() => BindAccountReq._();
  @$core.override
  BindAccountReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BindAccountReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BindAccountReq>(create);
  static BindAccountReq? _defaultInstance;

  @$pb.TagNumber(1)
  AccountBindingType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(AccountBindingType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get bindValue => $_getSZ(1);
  @$pb.TagNumber(2)
  set bindValue($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBindValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearBindValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get verifyCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set verifyCode($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVerifyCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearVerifyCode() => $_clearField(3);
}

class UnbindAccountReq extends $pb.GeneratedMessage {
  factory UnbindAccountReq({
    AccountBindingType? type,
    $core.String? bindValue,
    $core.String? verifyCode,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (bindValue != null) result.bindValue = bindValue;
    if (verifyCode != null) result.verifyCode = verifyCode;
    return result;
  }

  UnbindAccountReq._();

  factory UnbindAccountReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnbindAccountReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnbindAccountReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'account_bind'),
      createEmptyInstance: create)
    ..aE<AccountBindingType>(1, _omitFieldNames ? '' : 'type',
        enumValues: AccountBindingType.values)
    ..aOS(2, _omitFieldNames ? '' : 'bindValue')
    ..aOS(3, _omitFieldNames ? '' : 'verifyCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnbindAccountReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnbindAccountReq copyWith(void Function(UnbindAccountReq) updates) =>
      super.copyWith((message) => updates(message as UnbindAccountReq))
          as UnbindAccountReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnbindAccountReq create() => UnbindAccountReq._();
  @$core.override
  UnbindAccountReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnbindAccountReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnbindAccountReq>(create);
  static UnbindAccountReq? _defaultInstance;

  @$pb.TagNumber(1)
  AccountBindingType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(AccountBindingType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get bindValue => $_getSZ(1);
  @$pb.TagNumber(2)
  set bindValue($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBindValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearBindValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get verifyCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set verifyCode($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVerifyCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearVerifyCode() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

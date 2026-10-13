// This is a generated file - do not edit.
//
// Generated from server_client/common/pay.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'pay.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'pay.pbenum.dart';

/// 支付请求信息
class PayReqInfo extends $pb.GeneratedMessage {
  factory PayReqInfo({
    PayItemType? type,
    $core.String? thirdReceipt,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (thirdReceipt != null) result.thirdReceipt = thirdReceipt;
    return result;
  }

  PayReqInfo._();

  factory PayReqInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayReqInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayReqInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonPay'),
      createEmptyInstance: create)
    ..aE<PayItemType>(1, _omitFieldNames ? '' : 'type',
        enumValues: PayItemType.values)
    ..aOS(2, _omitFieldNames ? '' : 'thirdReceipt', protoName: 'thirdReceipt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayReqInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayReqInfo copyWith(void Function(PayReqInfo) updates) =>
      super.copyWith((message) => updates(message as PayReqInfo)) as PayReqInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayReqInfo create() => PayReqInfo._();
  @$core.override
  PayReqInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayReqInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayReqInfo>(create);
  static PayReqInfo? _defaultInstance;

  @$pb.TagNumber(1)
  PayItemType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(PayItemType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get thirdReceipt => $_getSZ(1);
  @$pb.TagNumber(2)
  set thirdReceipt($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasThirdReceipt() => $_has(1);
  @$pb.TagNumber(2)
  void clearThirdReceipt() => $_clearField(2);
}

/// 支付单信息
class PayInfo extends $pb.GeneratedMessage {
  factory PayInfo({
    $fixnum.Int64? id,
    PayStatus? payStatus,
    PayItemInfo? payItemInfo,
    PayInfoExtraV2? payInfoExtra,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (payStatus != null) result.payStatus = payStatus;
    if (payItemInfo != null) result.payItemInfo = payItemInfo;
    if (payInfoExtra != null) result.payInfoExtra = payInfoExtra;
    return result;
  }

  PayInfo._();

  factory PayInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonPay'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<PayStatus>(2, _omitFieldNames ? '' : 'payStatus',
        protoName: 'payStatus', enumValues: PayStatus.values)
    ..aOM<PayItemInfo>(3, _omitFieldNames ? '' : 'payItemInfo',
        protoName: 'payItemInfo', subBuilder: PayItemInfo.create)
    ..aOM<PayInfoExtraV2>(4, _omitFieldNames ? '' : 'payInfoExtra',
        protoName: 'payInfoExtra', subBuilder: PayInfoExtraV2.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayInfo copyWith(void Function(PayInfo) updates) =>
      super.copyWith((message) => updates(message as PayInfo)) as PayInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayInfo create() => PayInfo._();
  @$core.override
  PayInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PayInfo>(create);
  static PayInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  PayStatus get payStatus => $_getN(1);
  @$pb.TagNumber(2)
  set payStatus(PayStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPayStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  PayItemInfo get payItemInfo => $_getN(2);
  @$pb.TagNumber(3)
  set payItemInfo(PayItemInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPayItemInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayItemInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  PayItemInfo ensurePayItemInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  PayInfoExtraV2 get payInfoExtra => $_getN(3);
  @$pb.TagNumber(4)
  set payInfoExtra(PayInfoExtraV2 value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPayInfoExtra() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayInfoExtra() => $_clearField(4);
  @$pb.TagNumber(4)
  PayInfoExtraV2 ensurePayInfoExtra() => $_ensure(3);
}

/// 支付子单信息
class PayItemInfo extends $pb.GeneratedMessage {
  factory PayItemInfo({
    $fixnum.Int64? id,
    PayItemType? type,
    $core.String? thirdPartyId,
    $core.String? thirdOrderStr,
    PayItemWechatExt? wechatExt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (thirdPartyId != null) result.thirdPartyId = thirdPartyId;
    if (thirdOrderStr != null) result.thirdOrderStr = thirdOrderStr;
    if (wechatExt != null) result.wechatExt = wechatExt;
    return result;
  }

  PayItemInfo._();

  factory PayItemInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayItemInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayItemInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonPay'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<PayItemType>(2, _omitFieldNames ? '' : 'type',
        enumValues: PayItemType.values)
    ..aOS(3, _omitFieldNames ? '' : 'thirdPartyId', protoName: 'thirdPartyId')
    ..aOS(4, _omitFieldNames ? '' : 'thirdOrderStr', protoName: 'thirdOrderStr')
    ..aOM<PayItemWechatExt>(5, _omitFieldNames ? '' : 'wechatExt',
        protoName: 'wechatExt', subBuilder: PayItemWechatExt.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayItemInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayItemInfo copyWith(void Function(PayItemInfo) updates) =>
      super.copyWith((message) => updates(message as PayItemInfo))
          as PayItemInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayItemInfo create() => PayItemInfo._();
  @$core.override
  PayItemInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayItemInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayItemInfo>(create);
  static PayItemInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  PayItemType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(PayItemType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get thirdPartyId => $_getSZ(2);
  @$pb.TagNumber(3)
  set thirdPartyId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasThirdPartyId() => $_has(2);
  @$pb.TagNumber(3)
  void clearThirdPartyId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get thirdOrderStr => $_getSZ(3);
  @$pb.TagNumber(4)
  set thirdOrderStr($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasThirdOrderStr() => $_has(3);
  @$pb.TagNumber(4)
  void clearThirdOrderStr() => $_clearField(4);

  @$pb.TagNumber(5)
  PayItemWechatExt get wechatExt => $_getN(4);
  @$pb.TagNumber(5)
  set wechatExt(PayItemWechatExt value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasWechatExt() => $_has(4);
  @$pb.TagNumber(5)
  void clearWechatExt() => $_clearField(5);
  @$pb.TagNumber(5)
  PayItemWechatExt ensureWechatExt() => $_ensure(4);
}

class PayInfoExtraV2 extends $pb.GeneratedMessage {
  factory PayInfoExtraV2({
    PayChannelAction? action,
    $core.String? payChannel,
    $core.String? payChannelName,
    $core.String? payExtra,
    $core.String? payCurrency,
    $fixnum.Int64? payAmount,
    $core.String? payDescription,
  }) {
    final result = create();
    if (action != null) result.action = action;
    if (payChannel != null) result.payChannel = payChannel;
    if (payChannelName != null) result.payChannelName = payChannelName;
    if (payExtra != null) result.payExtra = payExtra;
    if (payCurrency != null) result.payCurrency = payCurrency;
    if (payAmount != null) result.payAmount = payAmount;
    if (payDescription != null) result.payDescription = payDescription;
    return result;
  }

  PayInfoExtraV2._();

  factory PayInfoExtraV2.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayInfoExtraV2.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayInfoExtraV2',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonPay'),
      createEmptyInstance: create)
    ..aE<PayChannelAction>(1, _omitFieldNames ? '' : 'action',
        enumValues: PayChannelAction.values)
    ..aOS(2, _omitFieldNames ? '' : 'payChannel')
    ..aOS(3, _omitFieldNames ? '' : 'payChannelName')
    ..aOS(4, _omitFieldNames ? '' : 'payExtra')
    ..aOS(5, _omitFieldNames ? '' : 'payCurrency')
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'payAmount', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(7, _omitFieldNames ? '' : 'payDescription')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayInfoExtraV2 clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayInfoExtraV2 copyWith(void Function(PayInfoExtraV2) updates) =>
      super.copyWith((message) => updates(message as PayInfoExtraV2))
          as PayInfoExtraV2;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayInfoExtraV2 create() => PayInfoExtraV2._();
  @$core.override
  PayInfoExtraV2 createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayInfoExtraV2 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayInfoExtraV2>(create);
  static PayInfoExtraV2? _defaultInstance;

  @$pb.TagNumber(1)
  PayChannelAction get action => $_getN(0);
  @$pb.TagNumber(1)
  set action(PayChannelAction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get payChannel => $_getSZ(1);
  @$pb.TagNumber(2)
  set payChannel($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPayChannel() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayChannel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get payChannelName => $_getSZ(2);
  @$pb.TagNumber(3)
  set payChannelName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPayChannelName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayChannelName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get payExtra => $_getSZ(3);
  @$pb.TagNumber(4)
  set payExtra($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPayExtra() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayExtra() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get payCurrency => $_getSZ(4);
  @$pb.TagNumber(5)
  set payCurrency($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPayCurrency() => $_has(4);
  @$pb.TagNumber(5)
  void clearPayCurrency() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get payAmount => $_getI64(5);
  @$pb.TagNumber(6)
  set payAmount($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPayAmount() => $_has(5);
  @$pb.TagNumber(6)
  void clearPayAmount() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get payDescription => $_getSZ(6);
  @$pb.TagNumber(7)
  set payDescription($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPayDescription() => $_has(6);
  @$pb.TagNumber(7)
  void clearPayDescription() => $_clearField(7);
}

/// 支付子单微信扩展信息
class PayItemWechatExt extends $pb.GeneratedMessage {
  factory PayItemWechatExt({
    $core.String? appId,
    $core.String? merchantId,
    $core.String? prepayId,
    $core.String? package,
    $core.String? nonceStr,
    $core.String? timestamp,
    $core.String? sign,
    $core.String? h5Url,
  }) {
    final result = create();
    if (appId != null) result.appId = appId;
    if (merchantId != null) result.merchantId = merchantId;
    if (prepayId != null) result.prepayId = prepayId;
    if (package != null) result.package = package;
    if (nonceStr != null) result.nonceStr = nonceStr;
    if (timestamp != null) result.timestamp = timestamp;
    if (sign != null) result.sign = sign;
    if (h5Url != null) result.h5Url = h5Url;
    return result;
  }

  PayItemWechatExt._();

  factory PayItemWechatExt.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayItemWechatExt.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayItemWechatExt',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonPay'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'appId', protoName: 'appId')
    ..aOS(2, _omitFieldNames ? '' : 'merchantId', protoName: 'merchantId')
    ..aOS(3, _omitFieldNames ? '' : 'prepayId', protoName: 'prepayId')
    ..aOS(4, _omitFieldNames ? '' : 'package')
    ..aOS(5, _omitFieldNames ? '' : 'nonceStr', protoName: 'nonceStr')
    ..aOS(6, _omitFieldNames ? '' : 'timestamp')
    ..aOS(7, _omitFieldNames ? '' : 'sign')
    ..aOS(8, _omitFieldNames ? '' : 'h5Url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayItemWechatExt clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayItemWechatExt copyWith(void Function(PayItemWechatExt) updates) =>
      super.copyWith((message) => updates(message as PayItemWechatExt))
          as PayItemWechatExt;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayItemWechatExt create() => PayItemWechatExt._();
  @$core.override
  PayItemWechatExt createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayItemWechatExt getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayItemWechatExt>(create);
  static PayItemWechatExt? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get appId => $_getSZ(0);
  @$pb.TagNumber(1)
  set appId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAppId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get merchantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set merchantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMerchantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMerchantId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get prepayId => $_getSZ(2);
  @$pb.TagNumber(3)
  set prepayId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPrepayId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrepayId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get package => $_getSZ(3);
  @$pb.TagNumber(4)
  set package($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPackage() => $_has(3);
  @$pb.TagNumber(4)
  void clearPackage() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get nonceStr => $_getSZ(4);
  @$pb.TagNumber(5)
  set nonceStr($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNonceStr() => $_has(4);
  @$pb.TagNumber(5)
  void clearNonceStr() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get timestamp => $_getSZ(5);
  @$pb.TagNumber(6)
  set timestamp($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTimestamp() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimestamp() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get sign => $_getSZ(6);
  @$pb.TagNumber(7)
  set sign($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSign() => $_has(6);
  @$pb.TagNumber(7)
  void clearSign() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get h5Url => $_getSZ(7);
  @$pb.TagNumber(8)
  set h5Url($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasH5Url() => $_has(7);
  @$pb.TagNumber(8)
  void clearH5Url() => $_clearField(8);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

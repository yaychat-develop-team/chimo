// This is a generated file - do not edit.
//
// Generated from server_client/gem.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'gem.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'gem.pbenum.dart';

class SupportedChains extends $pb.GeneratedMessage {
  factory SupportedChains({
    $core.Iterable<$core.String>? chains,
  }) {
    final result = create();
    if (chains != null) result.chains.addAll(chains);
    return result;
  }

  SupportedChains._();

  factory SupportedChains.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportedChains.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportedChains',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gem'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'chains')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportedChains clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportedChains copyWith(void Function(SupportedChains) updates) =>
      super.copyWith((message) => updates(message as SupportedChains))
          as SupportedChains;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportedChains create() => SupportedChains._();
  @$core.override
  SupportedChains createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportedChains getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportedChains>(create);
  static SupportedChains? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get chains => $_getList(0);
}

class WithdrawMethods extends $pb.GeneratedMessage {
  factory WithdrawMethods({
    $core.Iterable<GemWithdrawType>? methods,
  }) {
    final result = create();
    if (methods != null) result.methods.addAll(methods);
    return result;
  }

  WithdrawMethods._();

  factory WithdrawMethods.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WithdrawMethods.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WithdrawMethods',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gem'),
      createEmptyInstance: create)
    ..pc<GemWithdrawType>(
        1, _omitFieldNames ? '' : 'methods', $pb.PbFieldType.KE,
        valueOf: GemWithdrawType.valueOf,
        enumValues: GemWithdrawType.values,
        defaultEnumValue: GemWithdrawType.UNSPECIFIED)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WithdrawMethods clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WithdrawMethods copyWith(void Function(WithdrawMethods) updates) =>
      super.copyWith((message) => updates(message as WithdrawMethods))
          as WithdrawMethods;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WithdrawMethods create() => WithdrawMethods._();
  @$core.override
  WithdrawMethods createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WithdrawMethods getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WithdrawMethods>(create);
  static WithdrawMethods? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GemWithdrawType> get methods => $_getList(0);
}

/// 用户申请提现, gems提现成USDT
class WithdrawReq extends $pb.GeneratedMessage {
  factory WithdrawReq({
    $fixnum.Int64? userId,
    $fixnum.Int64? gems,
    $core.String? chain,
    $core.String? address,
    GemWithdrawType? type,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (gems != null) result.gems = gems;
    if (chain != null) result.chain = chain;
    if (address != null) result.address = address;
    if (type != null) result.type = type;
    return result;
  }

  WithdrawReq._();

  factory WithdrawReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WithdrawReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WithdrawReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gem'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'gems', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'chain')
    ..aOS(4, _omitFieldNames ? '' : 'address')
    ..aE<GemWithdrawType>(5, _omitFieldNames ? '' : 'type',
        enumValues: GemWithdrawType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WithdrawReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WithdrawReq copyWith(void Function(WithdrawReq) updates) =>
      super.copyWith((message) => updates(message as WithdrawReq))
          as WithdrawReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WithdrawReq create() => WithdrawReq._();
  @$core.override
  WithdrawReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WithdrawReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WithdrawReq>(create);
  static WithdrawReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get gems => $_getI64(1);
  @$pb.TagNumber(2)
  set gems($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGems() => $_has(1);
  @$pb.TagNumber(2)
  void clearGems() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get chain => $_getSZ(2);
  @$pb.TagNumber(3)
  set chain($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChain() => $_has(2);
  @$pb.TagNumber(3)
  void clearChain() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddress() => $_clearField(4);

  @$pb.TagNumber(5)
  GemWithdrawType get type => $_getN(4);
  @$pb.TagNumber(5)
  set type(GemWithdrawType value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => $_clearField(5);
}

/// 用户提现历史记录
class WithdrawHistoryRes extends $pb.GeneratedMessage {
  factory WithdrawHistoryRes({
    $core.Iterable<WithdrawHistory>? item,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    return result;
  }

  WithdrawHistoryRes._();

  factory WithdrawHistoryRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WithdrawHistoryRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WithdrawHistoryRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gem'),
      createEmptyInstance: create)
    ..pPM<WithdrawHistory>(1, _omitFieldNames ? '' : 'item',
        subBuilder: WithdrawHistory.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WithdrawHistoryRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WithdrawHistoryRes copyWith(void Function(WithdrawHistoryRes) updates) =>
      super.copyWith((message) => updates(message as WithdrawHistoryRes))
          as WithdrawHistoryRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WithdrawHistoryRes create() => WithdrawHistoryRes._();
  @$core.override
  WithdrawHistoryRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WithdrawHistoryRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WithdrawHistoryRes>(create);
  static WithdrawHistoryRes? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WithdrawHistory> get item => $_getList(0);
}

class WithdrawHistory extends $pb.GeneratedMessage {
  factory WithdrawHistory({
    $fixnum.Int64? id,
    $fixnum.Int64? gems,
    $fixnum.Int64? usd,
    $core.String? chain,
    $core.String? address,
    $core.String? desc,
    $core.int? state,
    $fixnum.Int64? createTime,
    $fixnum.Int64? updateTime,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (gems != null) result.gems = gems;
    if (usd != null) result.usd = usd;
    if (chain != null) result.chain = chain;
    if (address != null) result.address = address;
    if (desc != null) result.desc = desc;
    if (state != null) result.state = state;
    if (createTime != null) result.createTime = createTime;
    if (updateTime != null) result.updateTime = updateTime;
    return result;
  }

  WithdrawHistory._();

  factory WithdrawHistory.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WithdrawHistory.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WithdrawHistory',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gem'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'gems', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'usd', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'chain')
    ..aOS(5, _omitFieldNames ? '' : 'address')
    ..aOS(6, _omitFieldNames ? '' : 'desc')
    ..aI(7, _omitFieldNames ? '' : 'state', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'createTime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        9, _omitFieldNames ? '' : 'updateTime', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WithdrawHistory clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WithdrawHistory copyWith(void Function(WithdrawHistory) updates) =>
      super.copyWith((message) => updates(message as WithdrawHistory))
          as WithdrawHistory;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WithdrawHistory create() => WithdrawHistory._();
  @$core.override
  WithdrawHistory createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WithdrawHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WithdrawHistory>(create);
  static WithdrawHistory? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get gems => $_getI64(1);
  @$pb.TagNumber(2)
  set gems($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGems() => $_has(1);
  @$pb.TagNumber(2)
  void clearGems() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get usd => $_getI64(2);
  @$pb.TagNumber(3)
  set usd($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUsd() => $_has(2);
  @$pb.TagNumber(3)
  void clearUsd() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get chain => $_getSZ(3);
  @$pb.TagNumber(4)
  set chain($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChain() => $_has(3);
  @$pb.TagNumber(4)
  void clearChain() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get address => $_getSZ(4);
  @$pb.TagNumber(5)
  set address($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAddress() => $_has(4);
  @$pb.TagNumber(5)
  void clearAddress() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get state => $_getIZ(6);
  @$pb.TagNumber(7)
  set state($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasState() => $_has(6);
  @$pb.TagNumber(7)
  void clearState() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get createTime => $_getI64(7);
  @$pb.TagNumber(8)
  set createTime($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCreateTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreateTime() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get updateTime => $_getI64(8);
  @$pb.TagNumber(9)
  set updateTime($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasUpdateTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpdateTime() => $_clearField(9);
}

/// 用户申请兑换,gems兑换成coins
class GemsExchangeReq extends $pb.GeneratedMessage {
  factory GemsExchangeReq({
    $fixnum.Int64? userId,
    $fixnum.Int64? coins,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (coins != null) result.coins = coins;
    return result;
  }

  GemsExchangeReq._();

  factory GemsExchangeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GemsExchangeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GemsExchangeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gem'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'coins', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GemsExchangeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GemsExchangeReq copyWith(void Function(GemsExchangeReq) updates) =>
      super.copyWith((message) => updates(message as GemsExchangeReq))
          as GemsExchangeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GemsExchangeReq create() => GemsExchangeReq._();
  @$core.override
  GemsExchangeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GemsExchangeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GemsExchangeReq>(create);
  static GemsExchangeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get coins => $_getI64(1);
  @$pb.TagNumber(2)
  set coins($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCoins() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoins() => $_clearField(2);
}

/// 宝石互赠请求
/// POST /api/v1/gem/transfer
/// 转出方 uid 由服务端从当前登录用户提取，不在请求体中暴露
class GemTransferReq extends $pb.GeneratedMessage {
  factory GemTransferReq({
    $fixnum.Int64? toUid,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (toUid != null) result.toUid = toUid;
    if (amount != null) result.amount = amount;
    return result;
  }

  GemTransferReq._();

  factory GemTransferReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GemTransferReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GemTransferReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gem'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'toUid')
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GemTransferReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GemTransferReq copyWith(void Function(GemTransferReq) updates) =>
      super.copyWith((message) => updates(message as GemTransferReq))
          as GemTransferReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GemTransferReq create() => GemTransferReq._();
  @$core.override
  GemTransferReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GemTransferReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GemTransferReq>(create);
  static GemTransferReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get toUid => $_getI64(0);
  @$pb.TagNumber(1)
  set toUid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
}

/// 宝石互赠响应
class GemTransferRsp extends $pb.GeneratedMessage {
  factory GemTransferRsp({
    $fixnum.Int64? afterBalance,
    $fixnum.Int64? transferId,
  }) {
    final result = create();
    if (afterBalance != null) result.afterBalance = afterBalance;
    if (transferId != null) result.transferId = transferId;
    return result;
  }

  GemTransferRsp._();

  factory GemTransferRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GemTransferRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GemTransferRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gem'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'afterBalance')
    ..aInt64(2, _omitFieldNames ? '' : 'transferId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GemTransferRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GemTransferRsp copyWith(void Function(GemTransferRsp) updates) =>
      super.copyWith((message) => updates(message as GemTransferRsp))
          as GemTransferRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GemTransferRsp create() => GemTransferRsp._();
  @$core.override
  GemTransferRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GemTransferRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GemTransferRsp>(create);
  static GemTransferRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get afterBalance => $_getI64(0);
  @$pb.TagNumber(1)
  set afterBalance($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAfterBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearAfterBalance() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get transferId => $_getI64(1);
  @$pb.TagNumber(2)
  set transferId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTransferId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransferId() => $_clearField(2);
}

/// 互赠页：余额 + 可选赠送金额
/// GET /api/v1/gem/transfer/options
class GemTransferOptionsRsp extends $pb.GeneratedMessage {
  factory GemTransferOptionsRsp({
    $fixnum.Int64? balance,
    $core.Iterable<$fixnum.Int64>? amounts,
    $core.String? icon,
  }) {
    final result = create();
    if (balance != null) result.balance = balance;
    if (amounts != null) result.amounts.addAll(amounts);
    if (icon != null) result.icon = icon;
    return result;
  }

  GemTransferOptionsRsp._();

  factory GemTransferOptionsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GemTransferOptionsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GemTransferOptionsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gem'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'balance')
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : 'amounts', $pb.PbFieldType.K6)
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GemTransferOptionsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GemTransferOptionsRsp copyWith(
          void Function(GemTransferOptionsRsp) updates) =>
      super.copyWith((message) => updates(message as GemTransferOptionsRsp))
          as GemTransferOptionsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GemTransferOptionsRsp create() => GemTransferOptionsRsp._();
  @$core.override
  GemTransferOptionsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GemTransferOptionsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GemTransferOptionsRsp>(create);
  static GemTransferOptionsRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get balance => $_getI64(0);
  @$pb.TagNumber(1)
  set balance($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalance() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$fixnum.Int64> get amounts => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);
}

/// 私聊自定义消息 SendGem 的 payload
class SendGemInfo extends $pb.GeneratedMessage {
  factory SendGemInfo({
    $core.String? icon,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (icon != null) result.icon = icon;
    if (amount != null) result.amount = amount;
    return result;
  }

  SendGemInfo._();

  factory SendGemInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendGemInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendGemInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gem'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'icon')
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendGemInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendGemInfo copyWith(void Function(SendGemInfo) updates) =>
      super.copyWith((message) => updates(message as SendGemInfo))
          as SendGemInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendGemInfo create() => SendGemInfo._();
  @$core.override
  SendGemInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendGemInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendGemInfo>(create);
  static SendGemInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

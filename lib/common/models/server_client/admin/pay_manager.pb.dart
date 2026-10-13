// This is a generated file - do not edit.
//
// Generated from server_client/admin/pay_manager.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../base.pb.dart' as $0;
import '../common/pay.pbenum.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// *
/// 获取支付分页列表
/// post /get-page-list
/// body PayPageListGetReq
/// return BaseRsp(data is PayPageListGetRspData)
class PayPageListGetReq extends $pb.GeneratedMessage {
  factory PayPageListGetReq({
    $fixnum.Int64? uid,
    $core.Iterable<$1.PayItemType>? payItemTypeList,
    $core.Iterable<$1.PayStatus>? payStatusList,
    $fixnum.Int64? minEQCreateTime,
    $fixnum.Int64? maxEQCreateTime,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (payItemTypeList != null) result.payItemTypeList.addAll(payItemTypeList);
    if (payStatusList != null) result.payStatusList.addAll(payStatusList);
    if (minEQCreateTime != null) result.minEQCreateTime = minEQCreateTime;
    if (maxEQCreateTime != null) result.maxEQCreateTime = maxEQCreateTime;
    return result;
  }

  PayPageListGetReq._();

  factory PayPageListGetReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayPageListGetReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayPageListGetReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminPay'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<$1.PayItemType>(
        2, _omitFieldNames ? '' : 'payItemTypeList', $pb.PbFieldType.KE,
        protoName: 'payItemTypeList',
        valueOf: $1.PayItemType.valueOf,
        enumValues: $1.PayItemType.values,
        defaultEnumValue: $1.PayItemType.PayItemType_UNKNOWN)
    ..pc<$1.PayStatus>(
        3, _omitFieldNames ? '' : 'payStatusList', $pb.PbFieldType.KE,
        protoName: 'payStatusList',
        valueOf: $1.PayStatus.valueOf,
        enumValues: $1.PayStatus.values,
        defaultEnumValue: $1.PayStatus.PayStatus_UNKNOWN)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'minEQCreateTime', $pb.PbFieldType.OU6,
        protoName: 'minEQCreateTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'maxEQCreateTime', $pb.PbFieldType.OU6,
        protoName: 'maxEQCreateTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayPageListGetReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayPageListGetReq copyWith(void Function(PayPageListGetReq) updates) =>
      super.copyWith((message) => updates(message as PayPageListGetReq))
          as PayPageListGetReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayPageListGetReq create() => PayPageListGetReq._();
  @$core.override
  PayPageListGetReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayPageListGetReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayPageListGetReq>(create);
  static PayPageListGetReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$1.PayItemType> get payItemTypeList => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$1.PayStatus> get payStatusList => $_getList(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get minEQCreateTime => $_getI64(3);
  @$pb.TagNumber(4)
  set minEQCreateTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMinEQCreateTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinEQCreateTime() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get maxEQCreateTime => $_getI64(4);
  @$pb.TagNumber(5)
  set maxEQCreateTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMaxEQCreateTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxEQCreateTime() => $_clearField(5);
}

class PayPageListGetRspData extends $pb.GeneratedMessage {
  factory PayPageListGetRspData({
    $0.Page? page,
    $core.Iterable<Pay>? payList,
  }) {
    final result = create();
    if (page != null) result.page = page;
    if (payList != null) result.payList.addAll(payList);
    return result;
  }

  PayPageListGetRspData._();

  factory PayPageListGetRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayPageListGetRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayPageListGetRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminPay'),
      createEmptyInstance: create)
    ..aOM<$0.Page>(1, _omitFieldNames ? '' : 'page', subBuilder: $0.Page.create)
    ..pPM<Pay>(2, _omitFieldNames ? '' : 'payList',
        protoName: 'payList', subBuilder: Pay.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayPageListGetRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayPageListGetRspData copyWith(
          void Function(PayPageListGetRspData) updates) =>
      super.copyWith((message) => updates(message as PayPageListGetRspData))
          as PayPageListGetRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayPageListGetRspData create() => PayPageListGetRspData._();
  @$core.override
  PayPageListGetRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayPageListGetRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayPageListGetRspData>(create);
  static PayPageListGetRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Page get page => $_getN(0);
  @$pb.TagNumber(1)
  set page($0.Page value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Page ensurePage() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<Pay> get payList => $_getList(1);
}

/// 支付单
class Pay extends $pb.GeneratedMessage {
  factory Pay({
    $fixnum.Int64? id,
    $fixnum.Int64? uid,
    $core.int? amount,
    $1.PayStatus? payStatus,
    PayItem? payItem,
    $fixnum.Int64? createTime,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (uid != null) result.uid = uid;
    if (amount != null) result.amount = amount;
    if (payStatus != null) result.payStatus = payStatus;
    if (payItem != null) result.payItem = payItem;
    if (createTime != null) result.createTime = createTime;
    return result;
  }

  Pay._();

  factory Pay.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Pay.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Pay',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminPay'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(3, _omitFieldNames ? '' : 'amount', fieldType: $pb.PbFieldType.OU3)
    ..aE<$1.PayStatus>(4, _omitFieldNames ? '' : 'payStatus',
        protoName: 'payStatus', enumValues: $1.PayStatus.values)
    ..aOM<PayItem>(5, _omitFieldNames ? '' : 'payItem',
        protoName: 'payItem', subBuilder: PayItem.create)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'createTime', $pb.PbFieldType.OU6,
        protoName: 'createTime', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Pay clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Pay copyWith(void Function(Pay) updates) =>
      super.copyWith((message) => updates(message as Pay)) as Pay;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Pay create() => Pay._();
  @$core.override
  Pay createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Pay getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Pay>(create);
  static Pay? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get amount => $_getIZ(2);
  @$pb.TagNumber(3)
  set amount($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);

  @$pb.TagNumber(4)
  $1.PayStatus get payStatus => $_getN(3);
  @$pb.TagNumber(4)
  set payStatus($1.PayStatus value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPayStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayStatus() => $_clearField(4);

  @$pb.TagNumber(5)
  PayItem get payItem => $_getN(4);
  @$pb.TagNumber(5)
  set payItem(PayItem value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPayItem() => $_has(4);
  @$pb.TagNumber(5)
  void clearPayItem() => $_clearField(5);
  @$pb.TagNumber(5)
  PayItem ensurePayItem() => $_ensure(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get createTime => $_getI64(5);
  @$pb.TagNumber(6)
  set createTime($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => $_clearField(6);
}

/// 支付子单
class PayItem extends $pb.GeneratedMessage {
  factory PayItem({
    $fixnum.Int64? id,
    $1.PayItemType? type,
    $core.String? thirdPartyId,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (thirdPartyId != null) result.thirdPartyId = thirdPartyId;
    return result;
  }

  PayItem._();

  factory PayItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminPay'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<$1.PayItemType>(2, _omitFieldNames ? '' : 'type',
        enumValues: $1.PayItemType.values)
    ..aOS(3, _omitFieldNames ? '' : 'thirdPartyId', protoName: 'thirdPartyId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayItem copyWith(void Function(PayItem) updates) =>
      super.copyWith((message) => updates(message as PayItem)) as PayItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayItem create() => PayItem._();
  @$core.override
  PayItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PayItem>(create);
  static PayItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $1.PayItemType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type($1.PayItemType value) => $_setField(2, value);
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
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

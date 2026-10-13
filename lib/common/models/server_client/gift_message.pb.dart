// This is a generated file - do not edit.
//
// Generated from server_client/gift_message.proto.

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

class PayGiftReceiveItem extends $pb.GeneratedMessage {
  factory PayGiftReceiveItem({
    $fixnum.Int64? receiverUid,
    $fixnum.Int64? sendUid,
    $fixnum.Int64? giftId,
    $fixnum.Int64? giftNum,
    $fixnum.Int64? realCoins,
    $fixnum.Int64? senderPerCoins,
  }) {
    final result = create();
    if (receiverUid != null) result.receiverUid = receiverUid;
    if (sendUid != null) result.sendUid = sendUid;
    if (giftId != null) result.giftId = giftId;
    if (giftNum != null) result.giftNum = giftNum;
    if (realCoins != null) result.realCoins = realCoins;
    if (senderPerCoins != null) result.senderPerCoins = senderPerCoins;
    return result;
  }

  PayGiftReceiveItem._();

  factory PayGiftReceiveItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayGiftReceiveItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayGiftReceiveItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pay'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'receiverUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'sendUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'giftId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'giftNum', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'realCoins', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'senderPerCoins', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayGiftReceiveItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayGiftReceiveItem copyWith(void Function(PayGiftReceiveItem) updates) =>
      super.copyWith((message) => updates(message as PayGiftReceiveItem))
          as PayGiftReceiveItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayGiftReceiveItem create() => PayGiftReceiveItem._();
  @$core.override
  PayGiftReceiveItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayGiftReceiveItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayGiftReceiveItem>(create);
  static PayGiftReceiveItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get receiverUid => $_getI64(0);
  @$pb.TagNumber(1)
  set receiverUid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReceiverUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearReceiverUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get sendUid => $_getI64(1);
  @$pb.TagNumber(2)
  set sendUid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSendUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearSendUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get giftId => $_getI64(2);
  @$pb.TagNumber(3)
  set giftId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGiftId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftId() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get giftNum => $_getI64(3);
  @$pb.TagNumber(4)
  set giftNum($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGiftNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftNum() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get realCoins => $_getI64(4);
  @$pb.TagNumber(5)
  set realCoins($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRealCoins() => $_has(4);
  @$pb.TagNumber(5)
  void clearRealCoins() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get senderPerCoins => $_getI64(5);
  @$pb.TagNumber(6)
  set senderPerCoins($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSenderPerCoins() => $_has(5);
  @$pb.TagNumber(6)
  void clearSenderPerCoins() => $_clearField(6);
}

class PayGiftSendItem extends $pb.GeneratedMessage {
  factory PayGiftSendItem({
    $fixnum.Int64? sendUid,
    $fixnum.Int64? payOriginCoins,
    $fixnum.Int64? payFinalCoins,
    $fixnum.Int64? costType,
    $fixnum.Int64? giftId,
    $fixnum.Int64? perGiftNum,
    $fixnum.Int64? totalGiftNum,
    $core.Iterable<PayGiftReceiveItem>? receiveInfos,
    $core.int? cashType,
    $fixnum.Int64? rid,
  }) {
    final result = create();
    if (sendUid != null) result.sendUid = sendUid;
    if (payOriginCoins != null) result.payOriginCoins = payOriginCoins;
    if (payFinalCoins != null) result.payFinalCoins = payFinalCoins;
    if (costType != null) result.costType = costType;
    if (giftId != null) result.giftId = giftId;
    if (perGiftNum != null) result.perGiftNum = perGiftNum;
    if (totalGiftNum != null) result.totalGiftNum = totalGiftNum;
    if (receiveInfos != null) result.receiveInfos.addAll(receiveInfos);
    if (cashType != null) result.cashType = cashType;
    if (rid != null) result.rid = rid;
    return result;
  }

  PayGiftSendItem._();

  factory PayGiftSendItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayGiftSendItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayGiftSendItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pay'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'sendUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'payOriginCoins', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'payFinalCoins', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'costType', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'giftId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'perGiftNum', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'totalGiftNum', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<PayGiftReceiveItem>(8, _omitFieldNames ? '' : 'receiveInfos',
        subBuilder: PayGiftReceiveItem.create)
    ..aI(9, _omitFieldNames ? '' : 'cashType', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(10, _omitFieldNames ? '' : 'rid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayGiftSendItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayGiftSendItem copyWith(void Function(PayGiftSendItem) updates) =>
      super.copyWith((message) => updates(message as PayGiftSendItem))
          as PayGiftSendItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayGiftSendItem create() => PayGiftSendItem._();
  @$core.override
  PayGiftSendItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayGiftSendItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayGiftSendItem>(create);
  static PayGiftSendItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sendUid => $_getI64(0);
  @$pb.TagNumber(1)
  set sendUid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSendUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearSendUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get payOriginCoins => $_getI64(1);
  @$pb.TagNumber(2)
  set payOriginCoins($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPayOriginCoins() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayOriginCoins() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get payFinalCoins => $_getI64(2);
  @$pb.TagNumber(3)
  set payFinalCoins($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPayFinalCoins() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayFinalCoins() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get costType => $_getI64(3);
  @$pb.TagNumber(4)
  set costType($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCostType() => $_has(3);
  @$pb.TagNumber(4)
  void clearCostType() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get giftId => $_getI64(4);
  @$pb.TagNumber(5)
  set giftId($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGiftId() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftId() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get perGiftNum => $_getI64(5);
  @$pb.TagNumber(6)
  set perGiftNum($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPerGiftNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearPerGiftNum() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get totalGiftNum => $_getI64(6);
  @$pb.TagNumber(7)
  set totalGiftNum($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTotalGiftNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalGiftNum() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<PayGiftReceiveItem> get receiveInfos => $_getList(7);

  @$pb.TagNumber(9)
  $core.int get cashType => $_getIZ(8);
  @$pb.TagNumber(9)
  set cashType($core.int value) => $_setUnsignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCashType() => $_has(8);
  @$pb.TagNumber(9)
  void clearCashType() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get rid => $_getI64(9);
  @$pb.TagNumber(10)
  set rid($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasRid() => $_has(9);
  @$pb.TagNumber(10)
  void clearRid() => $_clearField(10);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

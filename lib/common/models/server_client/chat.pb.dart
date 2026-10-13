// This is a generated file - do not edit.
//
// Generated from server_client/chat.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chat.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'chat.pbenum.dart';

class CustomWishCardContent extends $pb.GeneratedMessage {
  factory CustomWishCardContent({
    $fixnum.Int64? giftId,
    $core.String? giftName,
    $core.String? giftIcon,
    $core.int? state,
    $fixnum.Int64? price,
  }) {
    final result = create();
    if (giftId != null) result.giftId = giftId;
    if (giftName != null) result.giftName = giftName;
    if (giftIcon != null) result.giftIcon = giftIcon;
    if (state != null) result.state = state;
    if (price != null) result.price = price;
    return result;
  }

  CustomWishCardContent._();

  factory CustomWishCardContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CustomWishCardContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CustomWishCardContent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'giftId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'giftName')
    ..aOS(3, _omitFieldNames ? '' : 'giftIcon')
    ..aI(4, _omitFieldNames ? '' : 'state', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'price', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomWishCardContent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomWishCardContent copyWith(
          void Function(CustomWishCardContent) updates) =>
      super.copyWith((message) => updates(message as CustomWishCardContent))
          as CustomWishCardContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomWishCardContent create() => CustomWishCardContent._();
  @$core.override
  CustomWishCardContent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CustomWishCardContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CustomWishCardContent>(create);
  static CustomWishCardContent? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get giftId => $_getI64(0);
  @$pb.TagNumber(1)
  set giftId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get giftName => $_getSZ(1);
  @$pb.TagNumber(2)
  set giftName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGiftName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get giftIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set giftIcon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGiftIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get state => $_getIZ(3);
  @$pb.TagNumber(4)
  set state($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get price => $_getI64(4);
  @$pb.TagNumber(5)
  set price($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrice() => $_clearField(5);
}

class ChatCommonReq extends $pb.GeneratedMessage {
  factory ChatCommonReq({
    $fixnum.Int64? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  ChatCommonReq._();

  factory ChatCommonReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatCommonReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatCommonReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatCommonReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatCommonReq copyWith(void Function(ChatCommonReq) updates) =>
      super.copyWith((message) => updates(message as ChatCommonReq))
          as ChatCommonReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCommonReq create() => ChatCommonReq._();
  @$core.override
  ChatCommonReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatCommonReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatCommonReq>(create);
  static ChatCommonReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class ChatCheckRsp extends $pb.GeneratedMessage {
  factory ChatCheckRsp({
    CheckResult? result,
    $fixnum.Int64? costCoin,
    $fixnum.Int64? divideCoin,
  }) {
    final result$ = create();
    if (result != null) result$.result = result;
    if (costCoin != null) result$.costCoin = costCoin;
    if (divideCoin != null) result$.divideCoin = divideCoin;
    return result$;
  }

  ChatCheckRsp._();

  factory ChatCheckRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatCheckRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatCheckRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aE<CheckResult>(1, _omitFieldNames ? '' : 'result',
        enumValues: CheckResult.values)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'costCoin', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'divideCoin', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatCheckRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatCheckRsp copyWith(void Function(ChatCheckRsp) updates) =>
      super.copyWith((message) => updates(message as ChatCheckRsp))
          as ChatCheckRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCheckRsp create() => ChatCheckRsp._();
  @$core.override
  ChatCheckRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatCheckRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatCheckRsp>(create);
  static ChatCheckRsp? _defaultInstance;

  @$pb.TagNumber(1)
  CheckResult get result => $_getN(0);
  @$pb.TagNumber(1)
  set result(CheckResult value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get costCoin => $_getI64(1);
  @$pb.TagNumber(2)
  set costCoin($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCostCoin() => $_has(1);
  @$pb.TagNumber(2)
  void clearCostCoin() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get divideCoin => $_getI64(2);
  @$pb.TagNumber(3)
  set divideCoin($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDivideCoin() => $_has(2);
  @$pb.TagNumber(3)
  void clearDivideCoin() => $_clearField(3);
}

class ChatBuyMsgPackageReq extends $pb.GeneratedMessage {
  factory ChatBuyMsgPackageReq({
    MsgPackageType? type,
    $fixnum.Int64? chatUserId,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (chatUserId != null) result.chatUserId = chatUserId;
    return result;
  }

  ChatBuyMsgPackageReq._();

  factory ChatBuyMsgPackageReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatBuyMsgPackageReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatBuyMsgPackageReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aE<MsgPackageType>(1, _omitFieldNames ? '' : 'type',
        enumValues: MsgPackageType.values)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'chatUserId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatBuyMsgPackageReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatBuyMsgPackageReq copyWith(void Function(ChatBuyMsgPackageReq) updates) =>
      super.copyWith((message) => updates(message as ChatBuyMsgPackageReq))
          as ChatBuyMsgPackageReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatBuyMsgPackageReq create() => ChatBuyMsgPackageReq._();
  @$core.override
  ChatBuyMsgPackageReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatBuyMsgPackageReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatBuyMsgPackageReq>(create);
  static ChatBuyMsgPackageReq? _defaultInstance;

  @$pb.TagNumber(1)
  MsgPackageType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(MsgPackageType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get chatUserId => $_getI64(1);
  @$pb.TagNumber(2)
  set chatUserId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChatUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChatUserId() => $_clearField(2);
}

class ChatShowFollowRsp extends $pb.GeneratedMessage {
  factory ChatShowFollowRsp({
    $core.bool? show,
    $core.int? freeCount,
    $fixnum.Int64? costCoin,
    $core.int? valuePkgUnlockCount,
    $fixnum.Int64? valuePkgOriginPrice,
    $fixnum.Int64? valuePkgFinalPrice,
    $fixnum.Int64? unlimitedPkgOriginPrice,
    $fixnum.Int64? unlimitedPkgFinalPrice,
  }) {
    final result = create();
    if (show != null) result.show = show;
    if (freeCount != null) result.freeCount = freeCount;
    if (costCoin != null) result.costCoin = costCoin;
    if (valuePkgUnlockCount != null)
      result.valuePkgUnlockCount = valuePkgUnlockCount;
    if (valuePkgOriginPrice != null)
      result.valuePkgOriginPrice = valuePkgOriginPrice;
    if (valuePkgFinalPrice != null)
      result.valuePkgFinalPrice = valuePkgFinalPrice;
    if (unlimitedPkgOriginPrice != null)
      result.unlimitedPkgOriginPrice = unlimitedPkgOriginPrice;
    if (unlimitedPkgFinalPrice != null)
      result.unlimitedPkgFinalPrice = unlimitedPkgFinalPrice;
    return result;
  }

  ChatShowFollowRsp._();

  factory ChatShowFollowRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatShowFollowRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatShowFollowRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'show')
    ..aI(2, _omitFieldNames ? '' : 'freeCount', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'costCoin', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(4, _omitFieldNames ? '' : 'valuePkgUnlockCount',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'valuePkgOriginPrice', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        6, _omitFieldNames ? '' : 'valuePkgFinalPrice', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'unlimitedPkgOriginPrice',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        8, _omitFieldNames ? '' : 'unlimitedPkgFinalPrice', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatShowFollowRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatShowFollowRsp copyWith(void Function(ChatShowFollowRsp) updates) =>
      super.copyWith((message) => updates(message as ChatShowFollowRsp))
          as ChatShowFollowRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatShowFollowRsp create() => ChatShowFollowRsp._();
  @$core.override
  ChatShowFollowRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatShowFollowRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatShowFollowRsp>(create);
  static ChatShowFollowRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get show => $_getBF(0);
  @$pb.TagNumber(1)
  set show($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasShow() => $_has(0);
  @$pb.TagNumber(1)
  void clearShow() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get freeCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set freeCount($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFreeCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearFreeCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get costCoin => $_getI64(2);
  @$pb.TagNumber(3)
  set costCoin($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCostCoin() => $_has(2);
  @$pb.TagNumber(3)
  void clearCostCoin() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get valuePkgUnlockCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set valuePkgUnlockCount($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasValuePkgUnlockCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearValuePkgUnlockCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get valuePkgOriginPrice => $_getI64(4);
  @$pb.TagNumber(5)
  set valuePkgOriginPrice($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasValuePkgOriginPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearValuePkgOriginPrice() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get valuePkgFinalPrice => $_getI64(5);
  @$pb.TagNumber(6)
  set valuePkgFinalPrice($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasValuePkgFinalPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearValuePkgFinalPrice() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get unlimitedPkgOriginPrice => $_getI64(6);
  @$pb.TagNumber(7)
  set unlimitedPkgOriginPrice($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUnlimitedPkgOriginPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearUnlimitedPkgOriginPrice() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get unlimitedPkgFinalPrice => $_getI64(7);
  @$pb.TagNumber(8)
  set unlimitedPkgFinalPrice($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasUnlimitedPkgFinalPrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearUnlimitedPkgFinalPrice() => $_clearField(8);
}

class ChatCommonInfo extends $pb.GeneratedMessage {
  factory ChatCommonInfo({
    $core.int? freeCount,
  }) {
    final result = create();
    if (freeCount != null) result.freeCount = freeCount;
    return result;
  }

  ChatCommonInfo._();

  factory ChatCommonInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatCommonInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatCommonInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'freeCount', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatCommonInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatCommonInfo copyWith(void Function(ChatCommonInfo) updates) =>
      super.copyWith((message) => updates(message as ChatCommonInfo))
          as ChatCommonInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCommonInfo create() => ChatCommonInfo._();
  @$core.override
  ChatCommonInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatCommonInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatCommonInfo>(create);
  static ChatCommonInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get freeCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set freeCount($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFreeCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearFreeCount() => $_clearField(1);
}

class BuyChatCardReq extends $pb.GeneratedMessage {
  factory BuyChatCardReq({
    $core.int? count,
    $fixnum.Int64? coins,
  }) {
    final result = create();
    if (count != null) result.count = count;
    if (coins != null) result.coins = coins;
    return result;
  }

  BuyChatCardReq._();

  factory BuyChatCardReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BuyChatCardReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BuyChatCardReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'coins', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuyChatCardReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuyChatCardReq copyWith(void Function(BuyChatCardReq) updates) =>
      super.copyWith((message) => updates(message as BuyChatCardReq))
          as BuyChatCardReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuyChatCardReq create() => BuyChatCardReq._();
  @$core.override
  BuyChatCardReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BuyChatCardReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BuyChatCardReq>(create);
  static BuyChatCardReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get coins => $_getI64(1);
  @$pb.TagNumber(2)
  set coins($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCoins() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoins() => $_clearField(2);
}

class UseChatCardReq extends $pb.GeneratedMessage {
  factory UseChatCardReq({
    $fixnum.Int64? targetUid,
  }) {
    final result = create();
    if (targetUid != null) result.targetUid = targetUid;
    return result;
  }

  UseChatCardReq._();

  factory UseChatCardReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UseChatCardReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UseChatCardReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'targetUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UseChatCardReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UseChatCardReq copyWith(void Function(UseChatCardReq) updates) =>
      super.copyWith((message) => updates(message as UseChatCardReq))
          as UseChatCardReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UseChatCardReq create() => UseChatCardReq._();
  @$core.override
  UseChatCardReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UseChatCardReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UseChatCardReq>(create);
  static UseChatCardReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get targetUid => $_getI64(0);
  @$pb.TagNumber(1)
  set targetUid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTargetUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetUid() => $_clearField(1);
}

class ChatCardPackage extends $pb.GeneratedMessage {
  factory ChatCardPackage({
    $fixnum.Int64? coins,
    $core.String? url,
    $core.String? text,
    $core.int? count,
  }) {
    final result = create();
    if (coins != null) result.coins = coins;
    if (url != null) result.url = url;
    if (text != null) result.text = text;
    if (count != null) result.count = count;
    return result;
  }

  ChatCardPackage._();

  factory ChatCardPackage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatCardPackage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatCardPackage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'coins', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..aOS(3, _omitFieldNames ? '' : 'text')
    ..aI(4, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatCardPackage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatCardPackage copyWith(void Function(ChatCardPackage) updates) =>
      super.copyWith((message) => updates(message as ChatCardPackage))
          as ChatCardPackage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCardPackage create() => ChatCardPackage._();
  @$core.override
  ChatCardPackage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatCardPackage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatCardPackage>(create);
  static ChatCardPackage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get coins => $_getI64(0);
  @$pb.TagNumber(1)
  set coins($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCoins() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoins() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(2);
  @$pb.TagNumber(3)
  set text($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => $_clearField(4);
}

class ChatCardPackageListRsp extends $pb.GeneratedMessage {
  factory ChatCardPackageListRsp({
    $core.Iterable<ChatCardPackage>? packages,
  }) {
    final result = create();
    if (packages != null) result.packages.addAll(packages);
    return result;
  }

  ChatCardPackageListRsp._();

  factory ChatCardPackageListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatCardPackageListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatCardPackageListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..pPM<ChatCardPackage>(1, _omitFieldNames ? '' : 'packages',
        subBuilder: ChatCardPackage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatCardPackageListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatCardPackageListRsp copyWith(
          void Function(ChatCardPackageListRsp) updates) =>
      super.copyWith((message) => updates(message as ChatCardPackageListRsp))
          as ChatCardPackageListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCardPackageListRsp create() => ChatCardPackageListRsp._();
  @$core.override
  ChatCardPackageListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatCardPackageListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatCardPackageListRsp>(create);
  static ChatCardPackageListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ChatCardPackage> get packages => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

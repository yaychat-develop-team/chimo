// This is a generated file - do not edit.
//
// Generated from server_client/cash.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'cash.pbenum.dart';
import 'commodity.pbenum.dart' as $1;
import 'common/pay.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'cash.pbenum.dart';

class ConvertCoinReq extends $pb.GeneratedMessage {
  factory ConvertCoinReq({
    $core.int? convertType,
    $fixnum.Int64? coin,
  }) {
    final result = create();
    if (convertType != null) result.convertType = convertType;
    if (coin != null) result.coin = coin;
    return result;
  }

  ConvertCoinReq._();

  factory ConvertCoinReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConvertCoinReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConvertCoinReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'convertType',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'coin', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConvertCoinReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConvertCoinReq copyWith(void Function(ConvertCoinReq) updates) =>
      super.copyWith((message) => updates(message as ConvertCoinReq))
          as ConvertCoinReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConvertCoinReq create() => ConvertCoinReq._();
  @$core.override
  ConvertCoinReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConvertCoinReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertCoinReq>(create);
  static ConvertCoinReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get convertType => $_getIZ(0);
  @$pb.TagNumber(1)
  set convertType($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvertType() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvertType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get coin => $_getI64(1);
  @$pb.TagNumber(2)
  set coin($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCoin() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoin() => $_clearField(2);
}

class ConvertCoinData extends $pb.GeneratedMessage {
  factory ConvertCoinData({
    $fixnum.Int64? coin,
  }) {
    final result = create();
    if (coin != null) result.coin = coin;
    return result;
  }

  ConvertCoinData._();

  factory ConvertCoinData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConvertCoinData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConvertCoinData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'coin', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConvertCoinData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConvertCoinData copyWith(void Function(ConvertCoinData) updates) =>
      super.copyWith((message) => updates(message as ConvertCoinData))
          as ConvertCoinData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConvertCoinData create() => ConvertCoinData._();
  @$core.override
  ConvertCoinData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConvertCoinData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertCoinData>(create);
  static ConvertCoinData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get coin => $_getI64(0);
  @$pb.TagNumber(1)
  set coin($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCoin() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoin() => $_clearField(1);
}

class UserSignContractData extends $pb.GeneratedMessage {
  factory UserSignContractData({
    $core.String? title,
    $core.String? url,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (url != null) result.url = url;
    return result;
  }

  UserSignContractData._();

  factory UserSignContractData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserSignContractData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserSignContractData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserSignContractData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserSignContractData copyWith(void Function(UserSignContractData) updates) =>
      super.copyWith((message) => updates(message as UserSignContractData))
          as UserSignContractData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserSignContractData create() => UserSignContractData._();
  @$core.override
  UserSignContractData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserSignContractData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserSignContractData>(create);
  static UserSignContractData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => $_clearField(2);
}

class TaskCashBalanceData extends $pb.GeneratedMessage {
  factory TaskCashBalanceData({
    $core.String? balance,
  }) {
    final result = create();
    if (balance != null) result.balance = balance;
    return result;
  }

  TaskCashBalanceData._();

  factory TaskCashBalanceData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TaskCashBalanceData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TaskCashBalanceData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'balance')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskCashBalanceData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TaskCashBalanceData copyWith(void Function(TaskCashBalanceData) updates) =>
      super.copyWith((message) => updates(message as TaskCashBalanceData))
          as TaskCashBalanceData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskCashBalanceData create() => TaskCashBalanceData._();
  @$core.override
  TaskCashBalanceData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TaskCashBalanceData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TaskCashBalanceData>(create);
  static TaskCashBalanceData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get balance => $_getSZ(0);
  @$pb.TagNumber(1)
  set balance($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalance() => $_clearField(1);
}

class UserCheckReq extends $pb.GeneratedMessage {
  factory UserCheckReq({
    $fixnum.Int64? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  UserCheckReq._();

  factory UserCheckReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserCheckReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserCheckReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCheckReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCheckReq copyWith(void Function(UserCheckReq) updates) =>
      super.copyWith((message) => updates(message as UserCheckReq))
          as UserCheckReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserCheckReq create() => UserCheckReq._();
  @$core.override
  UserCheckReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserCheckReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserCheckReq>(create);
  static UserCheckReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class UserCheckData extends $pb.GeneratedMessage {
  factory UserCheckData({
    $fixnum.Int64? userId,
    $core.String? nickName,
    $core.String? avatar,
    $core.bool? isNewUser,
    $core.bool? isPaypalSandbox,
    $core.Iterable<$0.PayItemType>? supportedPayTypes,
    GemUserIdentity? userIdentity,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (nickName != null) result.nickName = nickName;
    if (avatar != null) result.avatar = avatar;
    if (isNewUser != null) result.isNewUser = isNewUser;
    if (isPaypalSandbox != null) result.isPaypalSandbox = isPaypalSandbox;
    if (supportedPayTypes != null)
      result.supportedPayTypes.addAll(supportedPayTypes);
    if (userIdentity != null) result.userIdentity = userIdentity;
    return result;
  }

  UserCheckData._();

  factory UserCheckData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserCheckData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserCheckData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'nickName')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOB(4, _omitFieldNames ? '' : 'isNewUser')
    ..aOB(5, _omitFieldNames ? '' : 'isPaypalSandbox')
    ..pc<$0.PayItemType>(
        6, _omitFieldNames ? '' : 'supportedPayTypes', $pb.PbFieldType.KE,
        valueOf: $0.PayItemType.valueOf,
        enumValues: $0.PayItemType.values,
        defaultEnumValue: $0.PayItemType.PayItemType_UNKNOWN)
    ..aE<GemUserIdentity>(7, _omitFieldNames ? '' : 'userIdentity',
        enumValues: GemUserIdentity.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCheckData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCheckData copyWith(void Function(UserCheckData) updates) =>
      super.copyWith((message) => updates(message as UserCheckData))
          as UserCheckData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserCheckData create() => UserCheckData._();
  @$core.override
  UserCheckData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserCheckData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserCheckData>(create);
  static UserCheckData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isNewUser => $_getBF(3);
  @$pb.TagNumber(4)
  set isNewUser($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsNewUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsNewUser() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isPaypalSandbox => $_getBF(4);
  @$pb.TagNumber(5)
  set isPaypalSandbox($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsPaypalSandbox() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsPaypalSandbox() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$0.PayItemType> get supportedPayTypes => $_getList(5);

  @$pb.TagNumber(7)
  GemUserIdentity get userIdentity => $_getN(6);
  @$pb.TagNumber(7)
  set userIdentity(GemUserIdentity value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasUserIdentity() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserIdentity() => $_clearField(7);
}

class UserCash extends $pb.GeneratedMessage {
  factory UserCash({
    $fixnum.Int64? coin,
    $core.Iterable<UserItem>? items,
    $fixnum.Int64? currentFundCoin,
    $core.String? showCoin,
    $fixnum.Int64? gems,
  }) {
    final result = create();
    if (coin != null) result.coin = coin;
    if (items != null) result.items.addAll(items);
    if (currentFundCoin != null) result.currentFundCoin = currentFundCoin;
    if (showCoin != null) result.showCoin = showCoin;
    if (gems != null) result.gems = gems;
    return result;
  }

  UserCash._();

  factory UserCash.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserCash.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserCash',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(3, _omitFieldNames ? '' : 'coin')
    ..pPM<UserItem>(4, _omitFieldNames ? '' : 'items',
        subBuilder: UserItem.create)
    ..aInt64(5, _omitFieldNames ? '' : 'currentFundCoin')
    ..aOS(6, _omitFieldNames ? '' : 'showCoin')
    ..aInt64(7, _omitFieldNames ? '' : 'gems')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCash clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCash copyWith(void Function(UserCash) updates) =>
      super.copyWith((message) => updates(message as UserCash)) as UserCash;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserCash create() => UserCash._();
  @$core.override
  UserCash createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserCash getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserCash>(create);
  static UserCash? _defaultInstance;

  @$pb.TagNumber(3)
  $fixnum.Int64 get coin => $_getI64(0);
  @$pb.TagNumber(3)
  set coin($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(3)
  $core.bool hasCoin() => $_has(0);
  @$pb.TagNumber(3)
  void clearCoin() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<UserItem> get items => $_getList(1);

  @$pb.TagNumber(5)
  $fixnum.Int64 get currentFundCoin => $_getI64(2);
  @$pb.TagNumber(5)
  set currentFundCoin($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(5)
  $core.bool hasCurrentFundCoin() => $_has(2);
  @$pb.TagNumber(5)
  void clearCurrentFundCoin() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get showCoin => $_getSZ(3);
  @$pb.TagNumber(6)
  set showCoin($core.String value) => $_setString(3, value);
  @$pb.TagNumber(6)
  $core.bool hasShowCoin() => $_has(3);
  @$pb.TagNumber(6)
  void clearShowCoin() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get gems => $_getI64(4);
  @$pb.TagNumber(7)
  set gems($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(7)
  $core.bool hasGems() => $_has(4);
  @$pb.TagNumber(7)
  void clearGems() => $_clearField(7);
}

class UserItem extends $pb.GeneratedMessage {
  factory UserItem({
    $fixnum.Int64? itemId,
    $fixnum.Int64? count,
  }) {
    final result = create();
    if (itemId != null) result.itemId = itemId;
    if (count != null) result.count = count;
    return result;
  }

  UserItem._();

  factory UserItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'itemId')
    ..aInt64(3, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserItem copyWith(void Function(UserItem) updates) =>
      super.copyWith((message) => updates(message as UserItem)) as UserItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserItem create() => UserItem._();
  @$core.override
  UserItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserItem>(create);
  static UserItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get itemId => $_getI64(0);
  @$pb.TagNumber(1)
  set itemId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItemId() => $_has(0);
  @$pb.TagNumber(1)
  void clearItemId() => $_clearField(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get count => $_getI64(1);
  @$pb.TagNumber(3)
  set count($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(3)
  void clearCount() => $_clearField(3);
}

class ItemInfo extends $pb.GeneratedMessage {
  factory ItemInfo({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? icon,
    $core.bool? canBuy,
    $fixnum.Int64? price,
    $core.String? description,
    $core.String? dynamicResource,
    $core.int? knightLevel,
    $core.String? knightName,
    $core.int? boxId,
    BoxMaxItem? boxMaxItem,
    TrickyConfig? trickyConfig,
    ItemInfo_Type? type,
    $core.String? corner,
    $core.String? micRes,
    $core.int? payCurrency,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (canBuy != null) result.canBuy = canBuy;
    if (price != null) result.price = price;
    if (description != null) result.description = description;
    if (dynamicResource != null) result.dynamicResource = dynamicResource;
    if (knightLevel != null) result.knightLevel = knightLevel;
    if (knightName != null) result.knightName = knightName;
    if (boxId != null) result.boxId = boxId;
    if (boxMaxItem != null) result.boxMaxItem = boxMaxItem;
    if (trickyConfig != null) result.trickyConfig = trickyConfig;
    if (type != null) result.type = type;
    if (corner != null) result.corner = corner;
    if (micRes != null) result.micRes = micRes;
    if (payCurrency != null) result.payCurrency = payCurrency;
    return result;
  }

  ItemInfo._();

  factory ItemInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ItemInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ItemInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aOB(4, _omitFieldNames ? '' : 'canBuy')
    ..aInt64(5, _omitFieldNames ? '' : 'price')
    ..aOS(6, _omitFieldNames ? '' : 'description')
    ..aOS(7, _omitFieldNames ? '' : 'dynamicResource')
    ..aI(8, _omitFieldNames ? '' : 'knightLevel')
    ..aOS(9, _omitFieldNames ? '' : 'knightName')
    ..aI(10, _omitFieldNames ? '' : 'boxId')
    ..aOM<BoxMaxItem>(11, _omitFieldNames ? '' : 'boxMaxItem',
        subBuilder: BoxMaxItem.create)
    ..aOM<TrickyConfig>(12, _omitFieldNames ? '' : 'trickyConfig',
        subBuilder: TrickyConfig.create)
    ..aE<ItemInfo_Type>(13, _omitFieldNames ? '' : 'type',
        enumValues: ItemInfo_Type.values)
    ..aOS(14, _omitFieldNames ? '' : 'corner')
    ..aOS(15, _omitFieldNames ? '' : 'micRes')
    ..aI(16, _omitFieldNames ? '' : 'payCurrency')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ItemInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ItemInfo copyWith(void Function(ItemInfo) updates) =>
      super.copyWith((message) => updates(message as ItemInfo)) as ItemInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ItemInfo create() => ItemInfo._();
  @$core.override
  ItemInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ItemInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ItemInfo>(create);
  static ItemInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get canBuy => $_getBF(3);
  @$pb.TagNumber(4)
  set canBuy($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCanBuy() => $_has(3);
  @$pb.TagNumber(4)
  void clearCanBuy() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get price => $_getI64(4);
  @$pb.TagNumber(5)
  set price($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrice() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get dynamicResource => $_getSZ(6);
  @$pb.TagNumber(7)
  set dynamicResource($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDynamicResource() => $_has(6);
  @$pb.TagNumber(7)
  void clearDynamicResource() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get knightLevel => $_getIZ(7);
  @$pb.TagNumber(8)
  set knightLevel($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasKnightLevel() => $_has(7);
  @$pb.TagNumber(8)
  void clearKnightLevel() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get knightName => $_getSZ(8);
  @$pb.TagNumber(9)
  set knightName($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasKnightName() => $_has(8);
  @$pb.TagNumber(9)
  void clearKnightName() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get boxId => $_getIZ(9);
  @$pb.TagNumber(10)
  set boxId($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasBoxId() => $_has(9);
  @$pb.TagNumber(10)
  void clearBoxId() => $_clearField(10);

  @$pb.TagNumber(11)
  BoxMaxItem get boxMaxItem => $_getN(10);
  @$pb.TagNumber(11)
  set boxMaxItem(BoxMaxItem value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasBoxMaxItem() => $_has(10);
  @$pb.TagNumber(11)
  void clearBoxMaxItem() => $_clearField(11);
  @$pb.TagNumber(11)
  BoxMaxItem ensureBoxMaxItem() => $_ensure(10);

  @$pb.TagNumber(12)
  TrickyConfig get trickyConfig => $_getN(11);
  @$pb.TagNumber(12)
  set trickyConfig(TrickyConfig value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasTrickyConfig() => $_has(11);
  @$pb.TagNumber(12)
  void clearTrickyConfig() => $_clearField(12);
  @$pb.TagNumber(12)
  TrickyConfig ensureTrickyConfig() => $_ensure(11);

  @$pb.TagNumber(13)
  ItemInfo_Type get type => $_getN(12);
  @$pb.TagNumber(13)
  set type(ItemInfo_Type value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasType() => $_has(12);
  @$pb.TagNumber(13)
  void clearType() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get corner => $_getSZ(13);
  @$pb.TagNumber(14)
  set corner($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasCorner() => $_has(13);
  @$pb.TagNumber(14)
  void clearCorner() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get micRes => $_getSZ(14);
  @$pb.TagNumber(15)
  set micRes($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasMicRes() => $_has(14);
  @$pb.TagNumber(15)
  void clearMicRes() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.int get payCurrency => $_getIZ(15);
  @$pb.TagNumber(16)
  set payCurrency($core.int value) => $_setSignedInt32(15, value);
  @$pb.TagNumber(16)
  $core.bool hasPayCurrency() => $_has(15);
  @$pb.TagNumber(16)
  void clearPayCurrency() => $_clearField(16);
}

class TrickyConfig extends $pb.GeneratedMessage {
  factory TrickyConfig({
    $core.String? icon,
    $core.Iterable<TrickyBannerItem>? items,
  }) {
    final result = create();
    if (icon != null) result.icon = icon;
    if (items != null) result.items.addAll(items);
    return result;
  }

  TrickyConfig._();

  factory TrickyConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrickyConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrickyConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'icon')
    ..pPM<TrickyBannerItem>(2, _omitFieldNames ? '' : 'items',
        subBuilder: TrickyBannerItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrickyConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrickyConfig copyWith(void Function(TrickyConfig) updates) =>
      super.copyWith((message) => updates(message as TrickyConfig))
          as TrickyConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrickyConfig create() => TrickyConfig._();
  @$core.override
  TrickyConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TrickyConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrickyConfig>(create);
  static TrickyConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<TrickyBannerItem> get items => $_getList(1);
}

class TrickyBannerItem extends $pb.GeneratedMessage {
  factory TrickyBannerItem({
    $core.String? text,
    $core.String? pic,
  }) {
    final result = create();
    if (text != null) result.text = text;
    if (pic != null) result.pic = pic;
    return result;
  }

  TrickyBannerItem._();

  factory TrickyBannerItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrickyBannerItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrickyBannerItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..aOS(2, _omitFieldNames ? '' : 'pic')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrickyBannerItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrickyBannerItem copyWith(void Function(TrickyBannerItem) updates) =>
      super.copyWith((message) => updates(message as TrickyBannerItem))
          as TrickyBannerItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrickyBannerItem create() => TrickyBannerItem._();
  @$core.override
  TrickyBannerItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TrickyBannerItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrickyBannerItem>(create);
  static TrickyBannerItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pic => $_getSZ(1);
  @$pb.TagNumber(2)
  set pic($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPic() => $_has(1);
  @$pb.TagNumber(2)
  void clearPic() => $_clearField(2);
}

class BoxMaxItem extends $pb.GeneratedMessage {
  factory BoxMaxItem({
    $fixnum.Int64? id,
    $core.String? icon,
    $core.String? name,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (icon != null) result.icon = icon;
    if (name != null) result.name = name;
    return result;
  }

  BoxMaxItem._();

  factory BoxMaxItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoxMaxItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoxMaxItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxMaxItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxMaxItem copyWith(void Function(BoxMaxItem) updates) =>
      super.copyWith((message) => updates(message as BoxMaxItem)) as BoxMaxItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoxMaxItem create() => BoxMaxItem._();
  @$core.override
  BoxMaxItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BoxMaxItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoxMaxItem>(create);
  static BoxMaxItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);
}

class ItemTab extends $pb.GeneratedMessage {
  factory ItemTab({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? description,
    $core.Iterable<ItemInfo>? item,
    $core.String? tabType,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (item != null) result.item.addAll(item);
    if (tabType != null) result.tabType = tabType;
    return result;
  }

  ItemTab._();

  factory ItemTab.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ItemTab.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ItemTab',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..pPM<ItemInfo>(4, _omitFieldNames ? '' : 'item',
        subBuilder: ItemInfo.create)
    ..aOS(5, _omitFieldNames ? '' : 'tabType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ItemTab clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ItemTab copyWith(void Function(ItemTab) updates) =>
      super.copyWith((message) => updates(message as ItemTab)) as ItemTab;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ItemTab create() => ItemTab._();
  @$core.override
  ItemTab createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ItemTab getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ItemTab>(create);
  static ItemTab? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<ItemInfo> get item => $_getList(3);

  /// 有两个取值 'normal' 和 'interactive'
  @$pb.TagNumber(5)
  $core.String get tabType => $_getSZ(4);
  @$pb.TagNumber(5)
  set tabType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTabType() => $_has(4);
  @$pb.TagNumber(5)
  void clearTabType() => $_clearField(5);
}

class ItemInfoRsp extends $pb.GeneratedMessage {
  factory ItemInfoRsp({
    $core.Iterable<ItemTab>? itemTab,
    $core.int? version,
  }) {
    final result = create();
    if (itemTab != null) result.itemTab.addAll(itemTab);
    if (version != null) result.version = version;
    return result;
  }

  ItemInfoRsp._();

  factory ItemInfoRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ItemInfoRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ItemInfoRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..pPM<ItemTab>(4, _omitFieldNames ? '' : 'itemTab',
        subBuilder: ItemTab.create)
    ..aI(5, _omitFieldNames ? '' : 'version', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ItemInfoRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ItemInfoRsp copyWith(void Function(ItemInfoRsp) updates) =>
      super.copyWith((message) => updates(message as ItemInfoRsp))
          as ItemInfoRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ItemInfoRsp create() => ItemInfoRsp._();
  @$core.override
  ItemInfoRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ItemInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ItemInfoRsp>(create);
  static ItemInfoRsp? _defaultInstance;

  @$pb.TagNumber(4)
  $pb.PbList<ItemTab> get itemTab => $_getList(0);

  @$pb.TagNumber(5)
  $core.int get version => $_getIZ(1);
  @$pb.TagNumber(5)
  set version($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(5)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(5)
  void clearVersion() => $_clearField(5);
}

class CashPurchaseReq extends $pb.GeneratedMessage {
  factory CashPurchaseReq({
    $fixnum.Int64? itemId,
    $fixnum.Int64? count,
  }) {
    final result = create();
    if (itemId != null) result.itemId = itemId;
    if (count != null) result.count = count;
    return result;
  }

  CashPurchaseReq._();

  factory CashPurchaseReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashPurchaseReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashPurchaseReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'itemId')
    ..aInt64(2, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashPurchaseReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashPurchaseReq copyWith(void Function(CashPurchaseReq) updates) =>
      super.copyWith((message) => updates(message as CashPurchaseReq))
          as CashPurchaseReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashPurchaseReq create() => CashPurchaseReq._();
  @$core.override
  CashPurchaseReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashPurchaseReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashPurchaseReq>(create);
  static CashPurchaseReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get itemId => $_getI64(0);
  @$pb.TagNumber(1)
  set itemId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItemId() => $_has(0);
  @$pb.TagNumber(1)
  void clearItemId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get count => $_getI64(1);
  @$pb.TagNumber(2)
  set count($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);
}

class CashPurchaseRsp extends $pb.GeneratedMessage {
  factory CashPurchaseRsp({
    $fixnum.Int64? price,
    UserCash? cash,
  }) {
    final result = create();
    if (price != null) result.price = price;
    if (cash != null) result.cash = cash;
    return result;
  }

  CashPurchaseRsp._();

  factory CashPurchaseRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashPurchaseRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashPurchaseRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(3, _omitFieldNames ? '' : 'price')
    ..aOM<UserCash>(4, _omitFieldNames ? '' : 'cash',
        subBuilder: UserCash.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashPurchaseRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashPurchaseRsp copyWith(void Function(CashPurchaseRsp) updates) =>
      super.copyWith((message) => updates(message as CashPurchaseRsp))
          as CashPurchaseRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashPurchaseRsp create() => CashPurchaseRsp._();
  @$core.override
  CashPurchaseRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashPurchaseRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashPurchaseRsp>(create);
  static CashPurchaseRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $fixnum.Int64 get price => $_getI64(0);
  @$pb.TagNumber(3)
  set price($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(0);
  @$pb.TagNumber(3)
  void clearPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  UserCash get cash => $_getN(1);
  @$pb.TagNumber(4)
  set cash(UserCash value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCash() => $_has(1);
  @$pb.TagNumber(4)
  void clearCash() => $_clearField(4);
  @$pb.TagNumber(4)
  UserCash ensureCash() => $_ensure(1);
}

class CashGiftReq extends $pb.GeneratedMessage {
  factory CashGiftReq({
    $core.Iterable<$fixnum.Int64>? receiverId,
    $fixnum.Int64? itemId,
    $fixnum.Int64? count,
    $fixnum.Int64? channel,
    $core.String? extra,
    $fixnum.Int64? petId,
    $fixnum.Int64? couponInstanceId,
  }) {
    final result = create();
    if (receiverId != null) result.receiverId.addAll(receiverId);
    if (itemId != null) result.itemId = itemId;
    if (count != null) result.count = count;
    if (channel != null) result.channel = channel;
    if (extra != null) result.extra = extra;
    if (petId != null) result.petId = petId;
    if (couponInstanceId != null) result.couponInstanceId = couponInstanceId;
    return result;
  }

  CashGiftReq._();

  factory CashGiftReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashGiftReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashGiftReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'receiverId', $pb.PbFieldType.K6)
    ..aInt64(2, _omitFieldNames ? '' : 'itemId')
    ..aInt64(3, _omitFieldNames ? '' : 'count')
    ..aInt64(4, _omitFieldNames ? '' : 'channel')
    ..aOS(5, _omitFieldNames ? '' : 'extra')
    ..aInt64(6, _omitFieldNames ? '' : 'petId')
    ..aInt64(7, _omitFieldNames ? '' : 'couponInstanceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashGiftReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashGiftReq copyWith(void Function(CashGiftReq) updates) =>
      super.copyWith((message) => updates(message as CashGiftReq))
          as CashGiftReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashGiftReq create() => CashGiftReq._();
  @$core.override
  CashGiftReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashGiftReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashGiftReq>(create);
  static CashGiftReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get receiverId => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get itemId => $_getI64(1);
  @$pb.TagNumber(2)
  set itemId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasItemId() => $_has(1);
  @$pb.TagNumber(2)
  void clearItemId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get count => $_getI64(2);
  @$pb.TagNumber(3)
  set count($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get channel => $_getI64(3);
  @$pb.TagNumber(4)
  set channel($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChannel() => $_has(3);
  @$pb.TagNumber(4)
  void clearChannel() => $_clearField(4);

  /// *
  ///  新增 type, relation_level_up,结构如下
  ///  {
  ///    "type": "relation_level_up",
  ///    "relationId":  1
  ///  }
  @$pb.TagNumber(5)
  $core.String get extra => $_getSZ(4);
  @$pb.TagNumber(5)
  set extra($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExtra() => $_has(4);
  @$pb.TagNumber(5)
  void clearExtra() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get petId => $_getI64(5);
  @$pb.TagNumber(6)
  set petId($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPetId() => $_has(5);
  @$pb.TagNumber(6)
  void clearPetId() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get couponInstanceId => $_getI64(6);
  @$pb.TagNumber(7)
  set couponInstanceId($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCouponInstanceId() => $_has(6);
  @$pb.TagNumber(7)
  void clearCouponInstanceId() => $_clearField(7);
}

class CashGiftRsp extends $pb.GeneratedMessage {
  factory CashGiftRsp({
    UserCash? userCash,
    $core.bool? insufficientFund,
    $fixnum.Int64? couponDiscountCoins,
  }) {
    final result = create();
    if (userCash != null) result.userCash = userCash;
    if (insufficientFund != null) result.insufficientFund = insufficientFund;
    if (couponDiscountCoins != null)
      result.couponDiscountCoins = couponDiscountCoins;
    return result;
  }

  CashGiftRsp._();

  factory CashGiftRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashGiftRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashGiftRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aOM<UserCash>(3, _omitFieldNames ? '' : 'userCash',
        subBuilder: UserCash.create)
    ..aOB(4, _omitFieldNames ? '' : 'insufficientFund')
    ..aInt64(5, _omitFieldNames ? '' : 'couponDiscountCoins')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashGiftRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashGiftRsp copyWith(void Function(CashGiftRsp) updates) =>
      super.copyWith((message) => updates(message as CashGiftRsp))
          as CashGiftRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashGiftRsp create() => CashGiftRsp._();
  @$core.override
  CashGiftRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashGiftRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashGiftRsp>(create);
  static CashGiftRsp? _defaultInstance;

  @$pb.TagNumber(3)
  UserCash get userCash => $_getN(0);
  @$pb.TagNumber(3)
  set userCash(UserCash value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUserCash() => $_has(0);
  @$pb.TagNumber(3)
  void clearUserCash() => $_clearField(3);
  @$pb.TagNumber(3)
  UserCash ensureUserCash() => $_ensure(0);

  @$pb.TagNumber(4)
  $core.bool get insufficientFund => $_getBF(1);
  @$pb.TagNumber(4)
  set insufficientFund($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(4)
  $core.bool hasInsufficientFund() => $_has(1);
  @$pb.TagNumber(4)
  void clearInsufficientFund() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get couponDiscountCoins => $_getI64(2);
  @$pb.TagNumber(5)
  set couponDiscountCoins($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(5)
  $core.bool hasCouponDiscountCoins() => $_has(2);
  @$pb.TagNumber(5)
  void clearCouponDiscountCoins() => $_clearField(5);
}

class ReceiveHistoryItem extends $pb.GeneratedMessage {
  factory ReceiveHistoryItem({
    $fixnum.Int64? itemId,
    $fixnum.Int64? count,
  }) {
    final result = create();
    if (itemId != null) result.itemId = itemId;
    if (count != null) result.count = count;
    return result;
  }

  ReceiveHistoryItem._();

  factory ReceiveHistoryItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReceiveHistoryItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReceiveHistoryItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'itemId')
    ..aInt64(2, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReceiveHistoryItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReceiveHistoryItem copyWith(void Function(ReceiveHistoryItem) updates) =>
      super.copyWith((message) => updates(message as ReceiveHistoryItem))
          as ReceiveHistoryItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveHistoryItem create() => ReceiveHistoryItem._();
  @$core.override
  ReceiveHistoryItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReceiveHistoryItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReceiveHistoryItem>(create);
  static ReceiveHistoryItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get itemId => $_getI64(0);
  @$pb.TagNumber(1)
  set itemId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItemId() => $_has(0);
  @$pb.TagNumber(1)
  void clearItemId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get count => $_getI64(1);
  @$pb.TagNumber(2)
  set count($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);
}

class ReceiveHistoryRsp extends $pb.GeneratedMessage {
  factory ReceiveHistoryRsp({
    $core.Iterable<ReceiveHistoryItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ReceiveHistoryRsp._();

  factory ReceiveHistoryRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReceiveHistoryRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReceiveHistoryRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..pPM<ReceiveHistoryItem>(3, _omitFieldNames ? '' : 'items',
        subBuilder: ReceiveHistoryItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReceiveHistoryRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReceiveHistoryRsp copyWith(void Function(ReceiveHistoryRsp) updates) =>
      super.copyWith((message) => updates(message as ReceiveHistoryRsp))
          as ReceiveHistoryRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiveHistoryRsp create() => ReceiveHistoryRsp._();
  @$core.override
  ReceiveHistoryRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReceiveHistoryRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReceiveHistoryRsp>(create);
  static ReceiveHistoryRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $pb.PbList<ReceiveHistoryItem> get items => $_getList(0);
}

class CashOpHistoryItem extends $pb.GeneratedMessage {
  factory CashOpHistoryItem({
    $fixnum.Int64? id,
    $core.String? title,
    $fixnum.Int64? timestamp,
    $core.String? coin,
    $fixnum.Int64? itemId,
    $fixnum.Int64? count,
    $core.String? type,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    if (timestamp != null) result.timestamp = timestamp;
    if (coin != null) result.coin = coin;
    if (itemId != null) result.itemId = itemId;
    if (count != null) result.count = count;
    if (type != null) result.type = type;
    return result;
  }

  CashOpHistoryItem._();

  factory CashOpHistoryItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashOpHistoryItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashOpHistoryItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aInt64(3, _omitFieldNames ? '' : 'timestamp')
    ..aOS(4, _omitFieldNames ? '' : 'coin')
    ..aInt64(5, _omitFieldNames ? '' : 'itemId')
    ..aInt64(6, _omitFieldNames ? '' : 'count')
    ..aOS(7, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashOpHistoryItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashOpHistoryItem copyWith(void Function(CashOpHistoryItem) updates) =>
      super.copyWith((message) => updates(message as CashOpHistoryItem))
          as CashOpHistoryItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashOpHistoryItem create() => CashOpHistoryItem._();
  @$core.override
  CashOpHistoryItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashOpHistoryItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashOpHistoryItem>(create);
  static CashOpHistoryItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get timestamp => $_getI64(2);
  @$pb.TagNumber(3)
  set timestamp($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get coin => $_getSZ(3);
  @$pb.TagNumber(4)
  set coin($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCoin() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoin() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get itemId => $_getI64(4);
  @$pb.TagNumber(5)
  set itemId($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasItemId() => $_has(4);
  @$pb.TagNumber(5)
  void clearItemId() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get count => $_getI64(5);
  @$pb.TagNumber(6)
  set count($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearCount() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get type => $_getSZ(6);
  @$pb.TagNumber(7)
  set type($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => $_clearField(7);
}

/// 时间戳用unix_timestamp 也就是utc时间1970-01-01至今的秒数
class CashOpHistoryReq extends $pb.GeneratedMessage {
  factory CashOpHistoryReq({
    $fixnum.Int64? beginTimestamp,
    $fixnum.Int64? endTimestamp,
    $fixnum.Int64? pageNum,
    $fixnum.Int64? pageSize,
  }) {
    final result = create();
    if (beginTimestamp != null) result.beginTimestamp = beginTimestamp;
    if (endTimestamp != null) result.endTimestamp = endTimestamp;
    if (pageNum != null) result.pageNum = pageNum;
    if (pageSize != null) result.pageSize = pageSize;
    return result;
  }

  CashOpHistoryReq._();

  factory CashOpHistoryReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashOpHistoryReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashOpHistoryReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'beginTimestamp')
    ..aInt64(2, _omitFieldNames ? '' : 'endTimestamp')
    ..aInt64(3, _omitFieldNames ? '' : 'pageNum')
    ..aInt64(4, _omitFieldNames ? '' : 'pageSize')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashOpHistoryReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashOpHistoryReq copyWith(void Function(CashOpHistoryReq) updates) =>
      super.copyWith((message) => updates(message as CashOpHistoryReq))
          as CashOpHistoryReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashOpHistoryReq create() => CashOpHistoryReq._();
  @$core.override
  CashOpHistoryReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashOpHistoryReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashOpHistoryReq>(create);
  static CashOpHistoryReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get beginTimestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set beginTimestamp($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBeginTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearBeginTimestamp() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endTimestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set endTimestamp($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEndTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndTimestamp() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get pageNum => $_getI64(2);
  @$pb.TagNumber(3)
  set pageNum($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPageNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageNum() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get pageSize => $_getI64(3);
  @$pb.TagNumber(4)
  set pageSize($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPageSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearPageSize() => $_clearField(4);
}

class CashOpHistoryRsp extends $pb.GeneratedMessage {
  factory CashOpHistoryRsp({
    $core.Iterable<CashOpHistoryItem>? items,
    $fixnum.Int64? total,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    if (total != null) result.total = total;
    return result;
  }

  CashOpHistoryRsp._();

  factory CashOpHistoryRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashOpHistoryRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashOpHistoryRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..pPM<CashOpHistoryItem>(3, _omitFieldNames ? '' : 'items',
        subBuilder: CashOpHistoryItem.create)
    ..aInt64(4, _omitFieldNames ? '' : 'total')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashOpHistoryRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashOpHistoryRsp copyWith(void Function(CashOpHistoryRsp) updates) =>
      super.copyWith((message) => updates(message as CashOpHistoryRsp))
          as CashOpHistoryRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashOpHistoryRsp create() => CashOpHistoryRsp._();
  @$core.override
  CashOpHistoryRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashOpHistoryRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashOpHistoryRsp>(create);
  static CashOpHistoryRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $pb.PbList<CashOpHistoryItem> get items => $_getList(0);

  @$pb.TagNumber(4)
  $fixnum.Int64 get total => $_getI64(1);
  @$pb.TagNumber(4)
  set total($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(4)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(4)
  void clearTotal() => $_clearField(4);
}

enum UserCashPush_Message { cash, notSet }

class UserCashPush extends $pb.GeneratedMessage {
  factory UserCashPush({
    UserCash? cash,
  }) {
    final result = create();
    if (cash != null) result.cash = cash;
    return result;
  }

  UserCashPush._();

  factory UserCashPush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserCashPush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, UserCashPush_Message>
      _UserCashPush_MessageByTag = {
    1: UserCashPush_Message.cash,
    0: UserCashPush_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserCashPush',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<UserCash>(1, _omitFieldNames ? '' : 'cash',
        subBuilder: UserCash.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCashPush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCashPush copyWith(void Function(UserCashPush) updates) =>
      super.copyWith((message) => updates(message as UserCashPush))
          as UserCashPush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserCashPush create() => UserCashPush._();
  @$core.override
  UserCashPush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserCashPush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserCashPush>(create);
  static UserCashPush? _defaultInstance;

  @$pb.TagNumber(1)
  UserCashPush_Message whichMessage() =>
      _UserCashPush_MessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  UserCash get cash => $_getN(0);
  @$pb.TagNumber(1)
  set cash(UserCash value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCash() => $_has(0);
  @$pb.TagNumber(1)
  void clearCash() => $_clearField(1);
  @$pb.TagNumber(1)
  UserCash ensureCash() => $_ensure(0);
}

class CashGoodsItem extends $pb.GeneratedMessage {
  factory CashGoodsItem({
    $fixnum.Int64? type,
    $core.String? desc,
    $core.String? goodsId,
    $fixnum.Int64? price,
    $core.String? saleGoodsId,
    $fixnum.Int64? salePrice,
    $fixnum.Int64? currencyType,
    $fixnum.Int64? coin,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (desc != null) result.desc = desc;
    if (goodsId != null) result.goodsId = goodsId;
    if (price != null) result.price = price;
    if (saleGoodsId != null) result.saleGoodsId = saleGoodsId;
    if (salePrice != null) result.salePrice = salePrice;
    if (currencyType != null) result.currencyType = currencyType;
    if (coin != null) result.coin = coin;
    return result;
  }

  CashGoodsItem._();

  factory CashGoodsItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashGoodsItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashGoodsItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'type')
    ..aOS(2, _omitFieldNames ? '' : 'desc')
    ..aOS(3, _omitFieldNames ? '' : 'goodsId')
    ..aInt64(4, _omitFieldNames ? '' : 'price')
    ..aOS(5, _omitFieldNames ? '' : 'saleGoodsId')
    ..aInt64(6, _omitFieldNames ? '' : 'salePrice')
    ..aInt64(7, _omitFieldNames ? '' : 'currencyType')
    ..aInt64(8, _omitFieldNames ? '' : 'coin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashGoodsItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashGoodsItem copyWith(void Function(CashGoodsItem) updates) =>
      super.copyWith((message) => updates(message as CashGoodsItem))
          as CashGoodsItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashGoodsItem create() => CashGoodsItem._();
  @$core.override
  CashGoodsItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashGoodsItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashGoodsItem>(create);
  static CashGoodsItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get type => $_getI64(0);
  @$pb.TagNumber(1)
  set type($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get goodsId => $_getSZ(2);
  @$pb.TagNumber(3)
  set goodsId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGoodsId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGoodsId() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get price => $_getI64(3);
  @$pb.TagNumber(4)
  set price($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get saleGoodsId => $_getSZ(4);
  @$pb.TagNumber(5)
  set saleGoodsId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSaleGoodsId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSaleGoodsId() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get salePrice => $_getI64(5);
  @$pb.TagNumber(6)
  set salePrice($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSalePrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearSalePrice() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get currencyType => $_getI64(6);
  @$pb.TagNumber(7)
  set currencyType($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCurrencyType() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurrencyType() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get coin => $_getI64(7);
  @$pb.TagNumber(8)
  set coin($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCoin() => $_has(7);
  @$pb.TagNumber(8)
  void clearCoin() => $_clearField(8);
}

class CashGoodsRsp extends $pb.GeneratedMessage {
  factory CashGoodsRsp({
    $core.Iterable<CashGoodsItem>? goodsList,
  }) {
    final result = create();
    if (goodsList != null) result.goodsList.addAll(goodsList);
    return result;
  }

  CashGoodsRsp._();

  factory CashGoodsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashGoodsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashGoodsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..pPM<CashGoodsItem>(3, _omitFieldNames ? '' : 'goodsList',
        subBuilder: CashGoodsItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashGoodsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashGoodsRsp copyWith(void Function(CashGoodsRsp) updates) =>
      super.copyWith((message) => updates(message as CashGoodsRsp))
          as CashGoodsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashGoodsRsp create() => CashGoodsRsp._();
  @$core.override
  CashGoodsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashGoodsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashGoodsRsp>(create);
  static CashGoodsRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $pb.PbList<CashGoodsItem> get goodsList => $_getList(0);
}

class CashChargeProductListItem extends $pb.GeneratedMessage {
  factory CashChargeProductListItem({
    $fixnum.Int64? id,
    $core.String? name,
    $fixnum.Int64? cent,
    $fixnum.Int64? coin,
    $core.String? goodsId,
    $core.bool? isCustomPay,
    $core.int? minCoin,
    $core.int? maxCoin,
    $core.bool? isNewUser,
    $core.String? localPrice,
    $core.String? countryCode,
    $core.String? currency,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (cent != null) result.cent = cent;
    if (coin != null) result.coin = coin;
    if (goodsId != null) result.goodsId = goodsId;
    if (isCustomPay != null) result.isCustomPay = isCustomPay;
    if (minCoin != null) result.minCoin = minCoin;
    if (maxCoin != null) result.maxCoin = maxCoin;
    if (isNewUser != null) result.isNewUser = isNewUser;
    if (localPrice != null) result.localPrice = localPrice;
    if (countryCode != null) result.countryCode = countryCode;
    if (currency != null) result.currency = currency;
    return result;
  }

  CashChargeProductListItem._();

  factory CashChargeProductListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashChargeProductListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashChargeProductListItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aInt64(3, _omitFieldNames ? '' : 'cent')
    ..aInt64(4, _omitFieldNames ? '' : 'coin')
    ..aOS(5, _omitFieldNames ? '' : 'goodsId')
    ..aOB(6, _omitFieldNames ? '' : 'isCustomPay')
    ..aI(7, _omitFieldNames ? '' : 'minCoin', fieldType: $pb.PbFieldType.OU3)
    ..aI(8, _omitFieldNames ? '' : 'maxCoin', fieldType: $pb.PbFieldType.OU3)
    ..aOB(9, _omitFieldNames ? '' : 'isNewUser')
    ..aOS(10, _omitFieldNames ? '' : 'localPrice')
    ..aOS(11, _omitFieldNames ? '' : 'countryCode')
    ..aOS(12, _omitFieldNames ? '' : 'currency')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashChargeProductListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashChargeProductListItem copyWith(
          void Function(CashChargeProductListItem) updates) =>
      super.copyWith((message) => updates(message as CashChargeProductListItem))
          as CashChargeProductListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashChargeProductListItem create() => CashChargeProductListItem._();
  @$core.override
  CashChargeProductListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashChargeProductListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashChargeProductListItem>(create);
  static CashChargeProductListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get cent => $_getI64(2);
  @$pb.TagNumber(3)
  set cent($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCent() => $_has(2);
  @$pb.TagNumber(3)
  void clearCent() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get coin => $_getI64(3);
  @$pb.TagNumber(4)
  set coin($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCoin() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoin() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get goodsId => $_getSZ(4);
  @$pb.TagNumber(5)
  set goodsId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGoodsId() => $_has(4);
  @$pb.TagNumber(5)
  void clearGoodsId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isCustomPay => $_getBF(5);
  @$pb.TagNumber(6)
  set isCustomPay($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsCustomPay() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsCustomPay() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get minCoin => $_getIZ(6);
  @$pb.TagNumber(7)
  set minCoin($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMinCoin() => $_has(6);
  @$pb.TagNumber(7)
  void clearMinCoin() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get maxCoin => $_getIZ(7);
  @$pb.TagNumber(8)
  set maxCoin($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasMaxCoin() => $_has(7);
  @$pb.TagNumber(8)
  void clearMaxCoin() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isNewUser => $_getBF(8);
  @$pb.TagNumber(9)
  set isNewUser($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasIsNewUser() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsNewUser() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get localPrice => $_getSZ(9);
  @$pb.TagNumber(10)
  set localPrice($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasLocalPrice() => $_has(9);
  @$pb.TagNumber(10)
  void clearLocalPrice() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get countryCode => $_getSZ(10);
  @$pb.TagNumber(11)
  set countryCode($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCountryCode() => $_has(10);
  @$pb.TagNumber(11)
  void clearCountryCode() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get currency => $_getSZ(11);
  @$pb.TagNumber(12)
  set currency($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasCurrency() => $_has(11);
  @$pb.TagNumber(12)
  void clearCurrency() => $_clearField(12);
}

class CashChargeProductListRsp extends $pb.GeneratedMessage {
  factory CashChargeProductListRsp({
    $core.Iterable<CashChargeProductListItem>? product,
    $fixnum.Int64? diffCoin,
    $fixnum.Int64? walletCoin,
    $core.Iterable<$0.PayItemType>? supportedPayTypes,
    $core.Iterable<KmaxCoupon>? kmaxCoupons,
  }) {
    final result = create();
    if (product != null) result.product.addAll(product);
    if (diffCoin != null) result.diffCoin = diffCoin;
    if (walletCoin != null) result.walletCoin = walletCoin;
    if (supportedPayTypes != null)
      result.supportedPayTypes.addAll(supportedPayTypes);
    if (kmaxCoupons != null) result.kmaxCoupons.addAll(kmaxCoupons);
    return result;
  }

  CashChargeProductListRsp._();

  factory CashChargeProductListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashChargeProductListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashChargeProductListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..pPM<CashChargeProductListItem>(3, _omitFieldNames ? '' : 'product',
        subBuilder: CashChargeProductListItem.create)
    ..aInt64(4, _omitFieldNames ? '' : 'diffCoin')
    ..aInt64(5, _omitFieldNames ? '' : 'walletCoin')
    ..pc<$0.PayItemType>(
        6, _omitFieldNames ? '' : 'supportedPayTypes', $pb.PbFieldType.KE,
        valueOf: $0.PayItemType.valueOf,
        enumValues: $0.PayItemType.values,
        defaultEnumValue: $0.PayItemType.PayItemType_UNKNOWN)
    ..pPM<KmaxCoupon>(7, _omitFieldNames ? '' : 'KmaxCoupons',
        protoName: 'KmaxCoupons', subBuilder: KmaxCoupon.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashChargeProductListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashChargeProductListRsp copyWith(
          void Function(CashChargeProductListRsp) updates) =>
      super.copyWith((message) => updates(message as CashChargeProductListRsp))
          as CashChargeProductListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashChargeProductListRsp create() => CashChargeProductListRsp._();
  @$core.override
  CashChargeProductListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashChargeProductListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashChargeProductListRsp>(create);
  static CashChargeProductListRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $pb.PbList<CashChargeProductListItem> get product => $_getList(0);

  @$pb.TagNumber(4)
  $fixnum.Int64 get diffCoin => $_getI64(1);
  @$pb.TagNumber(4)
  set diffCoin($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(4)
  $core.bool hasDiffCoin() => $_has(1);
  @$pb.TagNumber(4)
  void clearDiffCoin() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get walletCoin => $_getI64(2);
  @$pb.TagNumber(5)
  set walletCoin($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(5)
  $core.bool hasWalletCoin() => $_has(2);
  @$pb.TagNumber(5)
  void clearWalletCoin() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$0.PayItemType> get supportedPayTypes => $_getList(3);

  @$pb.TagNumber(7)
  $pb.PbList<KmaxCoupon> get kmaxCoupons => $_getList(4);
}

class KmaxCoupon extends $pb.GeneratedMessage {
  factory KmaxCoupon({
    $fixnum.Int64? amount,
    $core.String? currency,
    $core.String? issuedAt,
    $core.String? expiresAt,
    $core.String? text,
    $core.String? currencyKind,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    if (currency != null) result.currency = currency;
    if (issuedAt != null) result.issuedAt = issuedAt;
    if (expiresAt != null) result.expiresAt = expiresAt;
    if (text != null) result.text = text;
    if (currencyKind != null) result.currencyKind = currencyKind;
    return result;
  }

  KmaxCoupon._();

  factory KmaxCoupon.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KmaxCoupon.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KmaxCoupon',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'amount')
    ..aOS(2, _omitFieldNames ? '' : 'currency')
    ..aOS(3, _omitFieldNames ? '' : 'issuedAt')
    ..aOS(4, _omitFieldNames ? '' : 'expiresAt')
    ..aOS(5, _omitFieldNames ? '' : 'text')
    ..aOS(6, _omitFieldNames ? '' : 'currencyKind')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KmaxCoupon clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KmaxCoupon copyWith(void Function(KmaxCoupon) updates) =>
      super.copyWith((message) => updates(message as KmaxCoupon)) as KmaxCoupon;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KmaxCoupon create() => KmaxCoupon._();
  @$core.override
  KmaxCoupon createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KmaxCoupon getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KmaxCoupon>(create);
  static KmaxCoupon? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get currency => $_getSZ(1);
  @$pb.TagNumber(2)
  set currency($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCurrency() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrency() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get issuedAt => $_getSZ(2);
  @$pb.TagNumber(3)
  set issuedAt($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIssuedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearIssuedAt() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get expiresAt => $_getSZ(3);
  @$pb.TagNumber(4)
  set expiresAt($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpiresAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpiresAt() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get text => $_getSZ(4);
  @$pb.TagNumber(5)
  set text($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasText() => $_has(4);
  @$pb.TagNumber(5)
  void clearText() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get currencyKind => $_getSZ(5);
  @$pb.TagNumber(6)
  set currencyKind($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCurrencyKind() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurrencyKind() => $_clearField(6);
}

class CashChargeCreateReq extends $pb.GeneratedMessage {
  factory CashChargeCreateReq({
    $fixnum.Int64? productId,
    $0.PayItemType? payItemType,
    $fixnum.Int64? userId,
    $core.String? code,
    $core.int? coin,
    $core.bool? v2,
    $core.String? extra,
    $core.int? scene,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (payItemType != null) result.payItemType = payItemType;
    if (userId != null) result.userId = userId;
    if (code != null) result.code = code;
    if (coin != null) result.coin = coin;
    if (v2 != null) result.v2 = v2;
    if (extra != null) result.extra = extra;
    if (scene != null) result.scene = scene;
    return result;
  }

  CashChargeCreateReq._();

  factory CashChargeCreateReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashChargeCreateReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashChargeCreateReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'productId')
    ..aE<$0.PayItemType>(2, _omitFieldNames ? '' : 'payItemType',
        enumValues: $0.PayItemType.values)
    ..aInt64(3, _omitFieldNames ? '' : 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'code')
    ..aI(5, _omitFieldNames ? '' : 'coin', fieldType: $pb.PbFieldType.OU3)
    ..aOB(6, _omitFieldNames ? '' : 'v2')
    ..aOS(7, _omitFieldNames ? '' : 'extra')
    ..aI(8, _omitFieldNames ? '' : 'scene', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashChargeCreateReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashChargeCreateReq copyWith(void Function(CashChargeCreateReq) updates) =>
      super.copyWith((message) => updates(message as CashChargeCreateReq))
          as CashChargeCreateReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashChargeCreateReq create() => CashChargeCreateReq._();
  @$core.override
  CashChargeCreateReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashChargeCreateReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashChargeCreateReq>(create);
  static CashChargeCreateReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get productId => $_getI64(0);
  @$pb.TagNumber(1)
  set productId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.PayItemType get payItemType => $_getN(1);
  @$pb.TagNumber(2)
  set payItemType($0.PayItemType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPayItemType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayItemType() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get userId => $_getI64(2);
  @$pb.TagNumber(3)
  set userId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get code => $_getSZ(3);
  @$pb.TagNumber(4)
  set code($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearCode() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get coin => $_getIZ(4);
  @$pb.TagNumber(5)
  set coin($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCoin() => $_has(4);
  @$pb.TagNumber(5)
  void clearCoin() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get v2 => $_getBF(5);
  @$pb.TagNumber(6)
  set v2($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasV2() => $_has(5);
  @$pb.TagNumber(6)
  void clearV2() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get extra => $_getSZ(6);
  @$pb.TagNumber(7)
  set extra($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasExtra() => $_has(6);
  @$pb.TagNumber(7)
  void clearExtra() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get scene => $_getIZ(7);
  @$pb.TagNumber(8)
  set scene($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasScene() => $_has(7);
  @$pb.TagNumber(8)
  void clearScene() => $_clearField(8);
}

class CashChargeCreateRsp extends $pb.GeneratedMessage {
  factory CashChargeCreateRsp({
    $fixnum.Int64? orderId,
    $0.PayInfo? payInfo,
  }) {
    final result = create();
    if (orderId != null) result.orderId = orderId;
    if (payInfo != null) result.payInfo = payInfo;
    return result;
  }

  CashChargeCreateRsp._();

  factory CashChargeCreateRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashChargeCreateRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashChargeCreateRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(3, _omitFieldNames ? '' : 'orderId')
    ..aOM<$0.PayInfo>(4, _omitFieldNames ? '' : 'payInfo',
        subBuilder: $0.PayInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashChargeCreateRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashChargeCreateRsp copyWith(void Function(CashChargeCreateRsp) updates) =>
      super.copyWith((message) => updates(message as CashChargeCreateRsp))
          as CashChargeCreateRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashChargeCreateRsp create() => CashChargeCreateRsp._();
  @$core.override
  CashChargeCreateRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashChargeCreateRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashChargeCreateRsp>(create);
  static CashChargeCreateRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $fixnum.Int64 get orderId => $_getI64(0);
  @$pb.TagNumber(3)
  set orderId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(3)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(3)
  void clearOrderId() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.PayInfo get payInfo => $_getN(1);
  @$pb.TagNumber(4)
  set payInfo($0.PayInfo value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPayInfo() => $_has(1);
  @$pb.TagNumber(4)
  void clearPayInfo() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.PayInfo ensurePayInfo() => $_ensure(1);
}

class CashChargeCheckReq extends $pb.GeneratedMessage {
  factory CashChargeCheckReq({
    $fixnum.Int64? orderId,
    $core.String? receipt,
    $fixnum.Int64? userId,
    $core.String? transactionId,
    $core.String? extraJson,
  }) {
    final result = create();
    if (orderId != null) result.orderId = orderId;
    if (receipt != null) result.receipt = receipt;
    if (userId != null) result.userId = userId;
    if (transactionId != null) result.transactionId = transactionId;
    if (extraJson != null) result.extraJson = extraJson;
    return result;
  }

  CashChargeCheckReq._();

  factory CashChargeCheckReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashChargeCheckReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashChargeCheckReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'orderId')
    ..aOS(2, _omitFieldNames ? '' : 'receipt')
    ..aInt64(3, _omitFieldNames ? '' : 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'transactionId')
    ..aOS(5, _omitFieldNames ? '' : 'extraJson')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashChargeCheckReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashChargeCheckReq copyWith(void Function(CashChargeCheckReq) updates) =>
      super.copyWith((message) => updates(message as CashChargeCheckReq))
          as CashChargeCheckReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashChargeCheckReq create() => CashChargeCheckReq._();
  @$core.override
  CashChargeCheckReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashChargeCheckReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashChargeCheckReq>(create);
  static CashChargeCheckReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get orderId => $_getI64(0);
  @$pb.TagNumber(1)
  set orderId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get receipt => $_getSZ(1);
  @$pb.TagNumber(2)
  set receipt($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReceipt() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceipt() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get userId => $_getI64(2);
  @$pb.TagNumber(3)
  set userId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get transactionId => $_getSZ(3);
  @$pb.TagNumber(4)
  set transactionId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTransactionId() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransactionId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get extraJson => $_getSZ(4);
  @$pb.TagNumber(5)
  set extraJson($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExtraJson() => $_has(4);
  @$pb.TagNumber(5)
  void clearExtraJson() => $_clearField(5);
}

class CashChargeCheckItem extends $pb.GeneratedMessage {
  factory CashChargeCheckItem({
    $fixnum.Int64? orderId,
    $fixnum.Int64? payId,
    $fixnum.Int64? createAt,
    $0.PayStatus? payStatus,
  }) {
    final result = create();
    if (orderId != null) result.orderId = orderId;
    if (payId != null) result.payId = payId;
    if (createAt != null) result.createAt = createAt;
    if (payStatus != null) result.payStatus = payStatus;
    return result;
  }

  CashChargeCheckItem._();

  factory CashChargeCheckItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashChargeCheckItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashChargeCheckItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'orderId')
    ..aInt64(2, _omitFieldNames ? '' : 'payId')
    ..aInt64(3, _omitFieldNames ? '' : 'createAt')
    ..aE<$0.PayStatus>(4, _omitFieldNames ? '' : 'payStatus',
        protoName: 'payStatus', enumValues: $0.PayStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashChargeCheckItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashChargeCheckItem copyWith(void Function(CashChargeCheckItem) updates) =>
      super.copyWith((message) => updates(message as CashChargeCheckItem))
          as CashChargeCheckItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashChargeCheckItem create() => CashChargeCheckItem._();
  @$core.override
  CashChargeCheckItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashChargeCheckItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashChargeCheckItem>(create);
  static CashChargeCheckItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get orderId => $_getI64(0);
  @$pb.TagNumber(1)
  set orderId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get payId => $_getI64(1);
  @$pb.TagNumber(2)
  set payId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPayId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get createAt => $_getI64(2);
  @$pb.TagNumber(3)
  set createAt($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCreateAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreateAt() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.PayStatus get payStatus => $_getN(3);
  @$pb.TagNumber(4)
  set payStatus($0.PayStatus value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPayStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayStatus() => $_clearField(4);
}

class CashChargeCheckRsp extends $pb.GeneratedMessage {
  factory CashChargeCheckRsp({
    $core.Iterable<CashChargeCheckItem>? item,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    return result;
  }

  CashChargeCheckRsp._();

  factory CashChargeCheckRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashChargeCheckRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashChargeCheckRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..pPM<CashChargeCheckItem>(3, _omitFieldNames ? '' : 'item',
        subBuilder: CashChargeCheckItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashChargeCheckRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashChargeCheckRsp copyWith(void Function(CashChargeCheckRsp) updates) =>
      super.copyWith((message) => updates(message as CashChargeCheckRsp))
          as CashChargeCheckRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashChargeCheckRsp create() => CashChargeCheckRsp._();
  @$core.override
  CashChargeCheckRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CashChargeCheckRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashChargeCheckRsp>(create);
  static CashChargeCheckRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $pb.PbList<CashChargeCheckItem> get item => $_getList(0);
}

class TakeCashReq extends $pb.GeneratedMessage {
  factory TakeCashReq({
    $fixnum.Int64? accountId,
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (accountId != null) result.accountId = accountId;
    if (amount != null) result.amount = amount;
    return result;
  }

  TakeCashReq._();

  factory TakeCashReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TakeCashReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TakeCashReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'accountId', protoName: 'accountId')
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TakeCashReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TakeCashReq copyWith(void Function(TakeCashReq) updates) =>
      super.copyWith((message) => updates(message as TakeCashReq))
          as TakeCashReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TakeCashReq create() => TakeCashReq._();
  @$core.override
  TakeCashReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TakeCashReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TakeCashReq>(create);
  static TakeCashReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get accountId => $_getI64(0);
  @$pb.TagNumber(1)
  set accountId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
}

class TakeCashAccountReq extends $pb.GeneratedMessage {
  factory TakeCashAccountReq({
    AccountType? accountType,
    $core.String? account,
    $core.String? phone,
  }) {
    final result = create();
    if (accountType != null) result.accountType = accountType;
    if (account != null) result.account = account;
    if (phone != null) result.phone = phone;
    return result;
  }

  TakeCashAccountReq._();

  factory TakeCashAccountReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TakeCashAccountReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TakeCashAccountReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aE<AccountType>(1, _omitFieldNames ? '' : 'accountType',
        protoName: 'accountType', enumValues: AccountType.values)
    ..aOS(2, _omitFieldNames ? '' : 'account')
    ..aOS(3, _omitFieldNames ? '' : 'phone')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TakeCashAccountReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TakeCashAccountReq copyWith(void Function(TakeCashAccountReq) updates) =>
      super.copyWith((message) => updates(message as TakeCashAccountReq))
          as TakeCashAccountReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TakeCashAccountReq create() => TakeCashAccountReq._();
  @$core.override
  TakeCashAccountReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TakeCashAccountReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TakeCashAccountReq>(create);
  static TakeCashAccountReq? _defaultInstance;

  @$pb.TagNumber(1)
  AccountType get accountType => $_getN(0);
  @$pb.TagNumber(1)
  set accountType(AccountType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountType() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get account => $_getSZ(1);
  @$pb.TagNumber(2)
  set account($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAccount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get phone => $_getSZ(2);
  @$pb.TagNumber(3)
  set phone($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPhone() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhone() => $_clearField(3);
}

class TakeCashAccountData extends $pb.GeneratedMessage {
  factory TakeCashAccountData({
    $core.Iterable<TakeCashAccountItem>? account,
  }) {
    final result = create();
    if (account != null) result.account.addAll(account);
    return result;
  }

  TakeCashAccountData._();

  factory TakeCashAccountData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TakeCashAccountData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TakeCashAccountData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..pPM<TakeCashAccountItem>(1, _omitFieldNames ? '' : 'account',
        subBuilder: TakeCashAccountItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TakeCashAccountData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TakeCashAccountData copyWith(void Function(TakeCashAccountData) updates) =>
      super.copyWith((message) => updates(message as TakeCashAccountData))
          as TakeCashAccountData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TakeCashAccountData create() => TakeCashAccountData._();
  @$core.override
  TakeCashAccountData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TakeCashAccountData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TakeCashAccountData>(create);
  static TakeCashAccountData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TakeCashAccountItem> get account => $_getList(0);
}

class TakeCashAccountItem extends $pb.GeneratedMessage {
  factory TakeCashAccountItem({
    AccountType? accountType,
    $core.String? phone,
    $core.String? account,
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (accountType != null) result.accountType = accountType;
    if (phone != null) result.phone = phone;
    if (account != null) result.account = account;
    if (id != null) result.id = id;
    return result;
  }

  TakeCashAccountItem._();

  factory TakeCashAccountItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TakeCashAccountItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TakeCashAccountItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aE<AccountType>(1, _omitFieldNames ? '' : 'accountType',
        protoName: 'accountType', enumValues: AccountType.values)
    ..aOS(2, _omitFieldNames ? '' : 'phone')
    ..aOS(3, _omitFieldNames ? '' : 'account')
    ..aInt64(4, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TakeCashAccountItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TakeCashAccountItem copyWith(void Function(TakeCashAccountItem) updates) =>
      super.copyWith((message) => updates(message as TakeCashAccountItem))
          as TakeCashAccountItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TakeCashAccountItem create() => TakeCashAccountItem._();
  @$core.override
  TakeCashAccountItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TakeCashAccountItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TakeCashAccountItem>(create);
  static TakeCashAccountItem? _defaultInstance;

  @$pb.TagNumber(1)
  AccountType get accountType => $_getN(0);
  @$pb.TagNumber(1)
  set accountType(AccountType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAccountType() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get phone => $_getSZ(1);
  @$pb.TagNumber(2)
  set phone($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPhone() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhone() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get account => $_getSZ(2);
  @$pb.TagNumber(3)
  set account($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAccount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccount() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get id => $_getI64(3);
  @$pb.TagNumber(4)
  set id($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => $_clearField(4);
}

class LuckyBuffInfo extends $pb.GeneratedMessage {
  factory LuckyBuffInfo({
    $core.int? enable,
    $core.Iterable<WearItem>? wearItems,
    $core.Iterable<BoxGiftInfo>? boxInfo,
  }) {
    final result = create();
    if (enable != null) result.enable = enable;
    if (wearItems != null) result.wearItems.addAll(wearItems);
    if (boxInfo != null) result.boxInfo.addAll(boxInfo);
    return result;
  }

  LuckyBuffInfo._();

  factory LuckyBuffInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LuckyBuffInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LuckyBuffInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'enable', fieldType: $pb.PbFieldType.OU3)
    ..pPM<WearItem>(2, _omitFieldNames ? '' : 'wearItems',
        subBuilder: WearItem.create)
    ..pPM<BoxGiftInfo>(3, _omitFieldNames ? '' : 'boxInfo',
        subBuilder: BoxGiftInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LuckyBuffInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LuckyBuffInfo copyWith(void Function(LuckyBuffInfo) updates) =>
      super.copyWith((message) => updates(message as LuckyBuffInfo))
          as LuckyBuffInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LuckyBuffInfo create() => LuckyBuffInfo._();
  @$core.override
  LuckyBuffInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LuckyBuffInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LuckyBuffInfo>(create);
  static LuckyBuffInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get enable => $_getIZ(0);
  @$pb.TagNumber(1)
  set enable($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEnable() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnable() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<WearItem> get wearItems => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<BoxGiftInfo> get boxInfo => $_getList(2);
}

class WearItem extends $pb.GeneratedMessage {
  factory WearItem({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? url,
    $1.CommodityType? type,
    $fixnum.Int64? prize,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (url != null) result.url = url;
    if (type != null) result.type = type;
    if (prize != null) result.prize = prize;
    return result;
  }

  WearItem._();

  factory WearItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WearItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WearItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..aE<$1.CommodityType>(4, _omitFieldNames ? '' : 'type',
        enumValues: $1.CommodityType.values)
    ..aInt64(5, _omitFieldNames ? '' : 'prize')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WearItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WearItem copyWith(void Function(WearItem) updates) =>
      super.copyWith((message) => updates(message as WearItem)) as WearItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WearItem create() => WearItem._();
  @$core.override
  WearItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WearItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WearItem>(create);
  static WearItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $1.CommodityType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type($1.CommodityType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get prize => $_getI64(4);
  @$pb.TagNumber(5)
  set prize($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPrize() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrize() => $_clearField(5);
}

class BoxGiftInfo extends $pb.GeneratedMessage {
  factory BoxGiftInfo({
    $fixnum.Int64? id,
    $core.int? drawnTimes,
    $core.int? grandTimes,
    $core.Iterable<BoxBigGiftItem>? bigGifts,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (drawnTimes != null) result.drawnTimes = drawnTimes;
    if (grandTimes != null) result.grandTimes = grandTimes;
    if (bigGifts != null) result.bigGifts.addAll(bigGifts);
    return result;
  }

  BoxGiftInfo._();

  factory BoxGiftInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoxGiftInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoxGiftInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aI(2, _omitFieldNames ? '' : 'drawnTimes', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'grandTimes', fieldType: $pb.PbFieldType.OU3)
    ..pPM<BoxBigGiftItem>(4, _omitFieldNames ? '' : 'bigGifts',
        subBuilder: BoxBigGiftItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxGiftInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxGiftInfo copyWith(void Function(BoxGiftInfo) updates) =>
      super.copyWith((message) => updates(message as BoxGiftInfo))
          as BoxGiftInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoxGiftInfo create() => BoxGiftInfo._();
  @$core.override
  BoxGiftInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BoxGiftInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoxGiftInfo>(create);
  static BoxGiftInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get drawnTimes => $_getIZ(1);
  @$pb.TagNumber(2)
  set drawnTimes($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDrawnTimes() => $_has(1);
  @$pb.TagNumber(2)
  void clearDrawnTimes() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get grandTimes => $_getIZ(2);
  @$pb.TagNumber(3)
  set grandTimes($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGrandTimes() => $_has(2);
  @$pb.TagNumber(3)
  void clearGrandTimes() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<BoxBigGiftItem> get bigGifts => $_getList(3);
}

class BoxBigGiftItem extends $pb.GeneratedMessage {
  factory BoxBigGiftItem({
    $fixnum.Int64? id,
    $core.String? icon,
    $core.String? name,
    $fixnum.Int64? prize,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (icon != null) result.icon = icon;
    if (name != null) result.name = name;
    if (prize != null) result.prize = prize;
    return result;
  }

  BoxBigGiftItem._();

  factory BoxBigGiftItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoxBigGiftItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoxBigGiftItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aInt64(4, _omitFieldNames ? '' : 'prize')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxBigGiftItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxBigGiftItem copyWith(void Function(BoxBigGiftItem) updates) =>
      super.copyWith((message) => updates(message as BoxBigGiftItem))
          as BoxBigGiftItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoxBigGiftItem create() => BoxBigGiftItem._();
  @$core.override
  BoxBigGiftItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BoxBigGiftItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoxBigGiftItem>(create);
  static BoxBigGiftItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get prize => $_getI64(3);
  @$pb.TagNumber(4)
  set prize($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPrize() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrize() => $_clearField(4);
}

class CheckoutConfirmReq extends $pb.GeneratedMessage {
  factory CheckoutConfirmReq({
    $core.String? token,
    $core.String? extra,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (extra != null) result.extra = extra;
    return result;
  }

  CheckoutConfirmReq._();

  factory CheckoutConfirmReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckoutConfirmReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckoutConfirmReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOS(2, _omitFieldNames ? '' : 'extra')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckoutConfirmReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckoutConfirmReq copyWith(void Function(CheckoutConfirmReq) updates) =>
      super.copyWith((message) => updates(message as CheckoutConfirmReq))
          as CheckoutConfirmReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckoutConfirmReq create() => CheckoutConfirmReq._();
  @$core.override
  CheckoutConfirmReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckoutConfirmReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckoutConfirmReq>(create);
  static CheckoutConfirmReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get extra => $_getSZ(1);
  @$pb.TagNumber(2)
  set extra($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExtra() => $_has(1);
  @$pb.TagNumber(2)
  void clearExtra() => $_clearField(2);
}

class CheckoutResult extends $pb.GeneratedMessage {
  factory CheckoutResult({
    $core.bool? success,
    $core.int? status,
    $core.String? redirectUrl,
    $core.String? extra,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (status != null) result.status = status;
    if (redirectUrl != null) result.redirectUrl = redirectUrl;
    if (extra != null) result.extra = extra;
    return result;
  }

  CheckoutResult._();

  factory CheckoutResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckoutResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckoutResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aI(2, _omitFieldNames ? '' : 'status', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'redirectUrl')
    ..aOS(4, _omitFieldNames ? '' : 'extra')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckoutResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckoutResult copyWith(void Function(CheckoutResult) updates) =>
      super.copyWith((message) => updates(message as CheckoutResult))
          as CheckoutResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckoutResult create() => CheckoutResult._();
  @$core.override
  CheckoutResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckoutResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckoutResult>(create);
  static CheckoutResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(2)
  set status($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get redirectUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set redirectUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRedirectUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearRedirectUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get extra => $_getSZ(3);
  @$pb.TagNumber(4)
  set extra($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExtra() => $_has(3);
  @$pb.TagNumber(4)
  void clearExtra() => $_clearField(4);
}

class RechargePackageList extends $pb.GeneratedMessage {
  factory RechargePackageList({
    $core.Iterable<RechargePackageItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  RechargePackageList._();

  factory RechargePackageList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RechargePackageList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RechargePackageList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..pPM<RechargePackageItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: RechargePackageItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RechargePackageList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RechargePackageList copyWith(void Function(RechargePackageList) updates) =>
      super.copyWith((message) => updates(message as RechargePackageList))
          as RechargePackageList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RechargePackageList create() => RechargePackageList._();
  @$core.override
  RechargePackageList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RechargePackageList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RechargePackageList>(create);
  static RechargePackageList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RechargePackageItem> get items => $_getList(0);
}

class RechargePackageItem extends $pb.GeneratedMessage {
  factory RechargePackageItem({
    $core.bool? isPermanent,
    $core.String? name,
    $core.String? resourceUrl,
    $core.int? days,
    $1.CommodityType? type,
  }) {
    final result = create();
    if (isPermanent != null) result.isPermanent = isPermanent;
    if (name != null) result.name = name;
    if (resourceUrl != null) result.resourceUrl = resourceUrl;
    if (days != null) result.days = days;
    if (type != null) result.type = type;
    return result;
  }

  RechargePackageItem._();

  factory RechargePackageItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RechargePackageItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RechargePackageItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isPermanent')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'resourceUrl')
    ..aI(4, _omitFieldNames ? '' : 'days')
    ..aE<$1.CommodityType>(5, _omitFieldNames ? '' : 'type',
        enumValues: $1.CommodityType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RechargePackageItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RechargePackageItem copyWith(void Function(RechargePackageItem) updates) =>
      super.copyWith((message) => updates(message as RechargePackageItem))
          as RechargePackageItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RechargePackageItem create() => RechargePackageItem._();
  @$core.override
  RechargePackageItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RechargePackageItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RechargePackageItem>(create);
  static RechargePackageItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isPermanent => $_getBF(0);
  @$pb.TagNumber(1)
  set isPermanent($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsPermanent() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsPermanent() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get resourceUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set resourceUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasResourceUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearResourceUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get days => $_getIZ(3);
  @$pb.TagNumber(4)
  set days($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDays() => $_has(3);
  @$pb.TagNumber(4)
  void clearDays() => $_clearField(4);

  @$pb.TagNumber(5)
  $1.CommodityType get type => $_getN(4);
  @$pb.TagNumber(5)
  set type($1.CommodityType value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => $_clearField(5);
}

/// *
///  宝石充值商品列表
class GemRechargeProductListRsp extends $pb.GeneratedMessage {
  factory GemRechargeProductListRsp({
    $core.Iterable<GemRechargeProductItem>? product,
  }) {
    final result = create();
    if (product != null) result.product.addAll(product);
    return result;
  }

  GemRechargeProductListRsp._();

  factory GemRechargeProductListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GemRechargeProductListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GemRechargeProductListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..pPM<GemRechargeProductItem>(1, _omitFieldNames ? '' : 'product',
        subBuilder: GemRechargeProductItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GemRechargeProductListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GemRechargeProductListRsp copyWith(
          void Function(GemRechargeProductListRsp) updates) =>
      super.copyWith((message) => updates(message as GemRechargeProductListRsp))
          as GemRechargeProductListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GemRechargeProductListRsp create() => GemRechargeProductListRsp._();
  @$core.override
  GemRechargeProductListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GemRechargeProductListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GemRechargeProductListRsp>(create);
  static GemRechargeProductListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GemRechargeProductItem> get product => $_getList(0);
}

/// *
///  宝石充值商品
class GemRechargeProductItem extends $pb.GeneratedMessage {
  factory GemRechargeProductItem({
    $fixnum.Int64? id,
    $core.String? name,
    $fixnum.Int64? cent,
    $fixnum.Int64? gems,
    $0.PayItemType? supportedPayType,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (cent != null) result.cent = cent;
    if (gems != null) result.gems = gems;
    if (supportedPayType != null) result.supportedPayType = supportedPayType;
    return result;
  }

  GemRechargeProductItem._();

  factory GemRechargeProductItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GemRechargeProductItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GemRechargeProductItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aInt64(3, _omitFieldNames ? '' : 'cent')
    ..aInt64(4, _omitFieldNames ? '' : 'gems')
    ..aE<$0.PayItemType>(5, _omitFieldNames ? '' : 'supportedPayType',
        enumValues: $0.PayItemType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GemRechargeProductItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GemRechargeProductItem copyWith(
          void Function(GemRechargeProductItem) updates) =>
      super.copyWith((message) => updates(message as GemRechargeProductItem))
          as GemRechargeProductItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GemRechargeProductItem create() => GemRechargeProductItem._();
  @$core.override
  GemRechargeProductItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GemRechargeProductItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GemRechargeProductItem>(create);
  static GemRechargeProductItem? _defaultInstance;

  /// tb_charge_product.id
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 商品名称
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// 支付金额，单位美元
  @$pb.TagNumber(3)
  $fixnum.Int64 get cent => $_getI64(2);
  @$pb.TagNumber(3)
  set cent($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCent() => $_has(2);
  @$pb.TagNumber(3)
  void clearCent() => $_clearField(3);

  /// 获得的宝石数量，展示单位
  @$pb.TagNumber(4)
  $fixnum.Int64 get gems => $_getI64(3);
  @$pb.TagNumber(4)
  set gems($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGems() => $_has(3);
  @$pb.TagNumber(4)
  void clearGems() => $_clearField(4);

  /// 当前商品指定的支付类型
  @$pb.TagNumber(5)
  $0.PayItemType get supportedPayType => $_getN(4);
  @$pb.TagNumber(5)
  set supportedPayType($0.PayItemType value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasSupportedPayType() => $_has(4);
  @$pb.TagNumber(5)
  void clearSupportedPayType() => $_clearField(5);
}

/// 盲盒奖品池列表
class BoxRewardPoolListRsp extends $pb.GeneratedMessage {
  factory BoxRewardPoolListRsp({
    $core.Iterable<BoxRewardPoolInfo>? boxes,
  }) {
    final result = create();
    if (boxes != null) result.boxes.addAll(boxes);
    return result;
  }

  BoxRewardPoolListRsp._();

  factory BoxRewardPoolListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoxRewardPoolListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoxRewardPoolListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..pPM<BoxRewardPoolInfo>(1, _omitFieldNames ? '' : 'boxes',
        subBuilder: BoxRewardPoolInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxRewardPoolListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxRewardPoolListRsp copyWith(void Function(BoxRewardPoolListRsp) updates) =>
      super.copyWith((message) => updates(message as BoxRewardPoolListRsp))
          as BoxRewardPoolListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoxRewardPoolListRsp create() => BoxRewardPoolListRsp._();
  @$core.override
  BoxRewardPoolListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BoxRewardPoolListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoxRewardPoolListRsp>(create);
  static BoxRewardPoolListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BoxRewardPoolInfo> get boxes => $_getList(0);
}

/// 单个盲盒奖品池
class BoxRewardPoolInfo extends $pb.GeneratedMessage {
  factory BoxRewardPoolInfo({
    $core.int? boxId,
    $core.String? boxName,
    $core.Iterable<BoxRewardPoolGift>? gifts,
  }) {
    final result = create();
    if (boxId != null) result.boxId = boxId;
    if (boxName != null) result.boxName = boxName;
    if (gifts != null) result.gifts.addAll(gifts);
    return result;
  }

  BoxRewardPoolInfo._();

  factory BoxRewardPoolInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoxRewardPoolInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoxRewardPoolInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'boxId')
    ..aOS(2, _omitFieldNames ? '' : 'boxName')
    ..pPM<BoxRewardPoolGift>(3, _omitFieldNames ? '' : 'gifts',
        subBuilder: BoxRewardPoolGift.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxRewardPoolInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxRewardPoolInfo copyWith(void Function(BoxRewardPoolInfo) updates) =>
      super.copyWith((message) => updates(message as BoxRewardPoolInfo))
          as BoxRewardPoolInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoxRewardPoolInfo create() => BoxRewardPoolInfo._();
  @$core.override
  BoxRewardPoolInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BoxRewardPoolInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoxRewardPoolInfo>(create);
  static BoxRewardPoolInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get boxId => $_getIZ(0);
  @$pb.TagNumber(1)
  set boxId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBoxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoxId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get boxName => $_getSZ(1);
  @$pb.TagNumber(2)
  set boxName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBoxName() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoxName() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<BoxRewardPoolGift> get gifts => $_getList(2);
}

/// 奖品信息
class BoxRewardPoolGift extends $pb.GeneratedMessage {
  factory BoxRewardPoolGift({
    $core.String? giftName,
    $core.int? price,
    $core.bool? bigPrize,
  }) {
    final result = create();
    if (giftName != null) result.giftName = giftName;
    if (price != null) result.price = price;
    if (bigPrize != null) result.bigPrize = bigPrize;
    return result;
  }

  BoxRewardPoolGift._();

  factory BoxRewardPoolGift.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BoxRewardPoolGift.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BoxRewardPoolGift',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cash'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'giftName')
    ..aI(2, _omitFieldNames ? '' : 'price')
    ..aOB(3, _omitFieldNames ? '' : 'bigPrize')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxRewardPoolGift clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BoxRewardPoolGift copyWith(void Function(BoxRewardPoolGift) updates) =>
      super.copyWith((message) => updates(message as BoxRewardPoolGift))
          as BoxRewardPoolGift;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoxRewardPoolGift create() => BoxRewardPoolGift._();
  @$core.override
  BoxRewardPoolGift createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BoxRewardPoolGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BoxRewardPoolGift>(create);
  static BoxRewardPoolGift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get giftName => $_getSZ(0);
  @$pb.TagNumber(1)
  set giftName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGiftName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get price => $_getIZ(1);
  @$pb.TagNumber(2)
  set price($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get bigPrize => $_getBF(2);
  @$pb.TagNumber(3)
  set bigPrize($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBigPrize() => $_has(2);
  @$pb.TagNumber(3)
  void clearBigPrize() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

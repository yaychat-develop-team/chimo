// This is a generated file - do not edit.
//
// Generated from server_client/merch/merch.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../commodity.pbenum.dart' as $1;
import '../common/app.pbenum.dart' as $2;
import '../user.pb.dart' as $0;
import 'merch.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'merch.pbenum.dart';

class SaleCommodityReq extends $pb.GeneratedMessage {
  factory SaleCommodityReq({
    $core.String? id,
    $1.CommodityType? type,
    $core.int? validityPeriod,
    $fixnum.Int64? price,
    $core.int? count,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (validityPeriod != null) result.validityPeriod = validityPeriod;
    if (price != null) result.price = price;
    if (count != null) result.count = count;
    return result;
  }

  SaleCommodityReq._();

  factory SaleCommodityReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SaleCommodityReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SaleCommodityReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.merch'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aE<$1.CommodityType>(2, _omitFieldNames ? '' : 'type',
        enumValues: $1.CommodityType.values)
    ..aI(3, _omitFieldNames ? '' : 'validityPeriod',
        fieldType: $pb.PbFieldType.OU3)
    ..aInt64(4, _omitFieldNames ? '' : 'price')
    ..aI(5, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaleCommodityReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaleCommodityReq copyWith(void Function(SaleCommodityReq) updates) =>
      super.copyWith((message) => updates(message as SaleCommodityReq))
          as SaleCommodityReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaleCommodityReq create() => SaleCommodityReq._();
  @$core.override
  SaleCommodityReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SaleCommodityReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SaleCommodityReq>(create);
  static SaleCommodityReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $1.CommodityType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type($1.CommodityType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get validityPeriod => $_getIZ(2);
  @$pb.TagNumber(3)
  set validityPeriod($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasValidityPeriod() => $_has(2);
  @$pb.TagNumber(3)
  void clearValidityPeriod() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get price => $_getI64(3);
  @$pb.TagNumber(4)
  set price($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get count => $_getIZ(4);
  @$pb.TagNumber(5)
  set count($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearCount() => $_clearField(5);
}

class MerchItem extends $pb.GeneratedMessage {
  factory MerchItem({
    $fixnum.Int64? id,
    ItemInfo? itemInfo,
    $fixnum.Int64? price,
    $core.int? count,
    $core.int? period,
    MerchStatus? status,
    MerchFlag? flag,
    $0.User? seller,
    $fixnum.Int64? postTime,
    $core.int? feeRate,
    $2.GameCurrency? currency,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (itemInfo != null) result.itemInfo = itemInfo;
    if (price != null) result.price = price;
    if (count != null) result.count = count;
    if (period != null) result.period = period;
    if (status != null) result.status = status;
    if (flag != null) result.flag = flag;
    if (seller != null) result.seller = seller;
    if (postTime != null) result.postTime = postTime;
    if (feeRate != null) result.feeRate = feeRate;
    if (currency != null) result.currency = currency;
    return result;
  }

  MerchItem._();

  factory MerchItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MerchItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MerchItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.merch'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOM<ItemInfo>(2, _omitFieldNames ? '' : 'itemInfo',
        subBuilder: ItemInfo.create)
    ..aInt64(3, _omitFieldNames ? '' : 'price')
    ..aI(4, _omitFieldNames ? '' : 'count')
    ..aI(5, _omitFieldNames ? '' : 'period')
    ..aE<MerchStatus>(6, _omitFieldNames ? '' : 'status',
        enumValues: MerchStatus.values)
    ..aE<MerchFlag>(8, _omitFieldNames ? '' : 'flag',
        enumValues: MerchFlag.values)
    ..aOM<$0.User>(9, _omitFieldNames ? '' : 'seller',
        subBuilder: $0.User.create)
    ..aInt64(10, _omitFieldNames ? '' : 'postTime')
    ..aI(11, _omitFieldNames ? '' : 'feeRate')
    ..aE<$2.GameCurrency>(12, _omitFieldNames ? '' : 'currency',
        enumValues: $2.GameCurrency.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchItem copyWith(void Function(MerchItem) updates) =>
      super.copyWith((message) => updates(message as MerchItem)) as MerchItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MerchItem create() => MerchItem._();
  @$core.override
  MerchItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MerchItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MerchItem>(create);
  static MerchItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  ItemInfo get itemInfo => $_getN(1);
  @$pb.TagNumber(2)
  set itemInfo(ItemInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasItemInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearItemInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  ItemInfo ensureItemInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get price => $_getI64(2);
  @$pb.TagNumber(3)
  set price($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get period => $_getIZ(4);
  @$pb.TagNumber(5)
  set period($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPeriod() => $_has(4);
  @$pb.TagNumber(5)
  void clearPeriod() => $_clearField(5);

  @$pb.TagNumber(6)
  MerchStatus get status => $_getN(5);
  @$pb.TagNumber(6)
  set status(MerchStatus value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);

  @$pb.TagNumber(8)
  MerchFlag get flag => $_getN(6);
  @$pb.TagNumber(8)
  set flag(MerchFlag value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasFlag() => $_has(6);
  @$pb.TagNumber(8)
  void clearFlag() => $_clearField(8);

  @$pb.TagNumber(9)
  $0.User get seller => $_getN(7);
  @$pb.TagNumber(9)
  set seller($0.User value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasSeller() => $_has(7);
  @$pb.TagNumber(9)
  void clearSeller() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.User ensureSeller() => $_ensure(7);

  @$pb.TagNumber(10)
  $fixnum.Int64 get postTime => $_getI64(8);
  @$pb.TagNumber(10)
  set postTime($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(10)
  $core.bool hasPostTime() => $_has(8);
  @$pb.TagNumber(10)
  void clearPostTime() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get feeRate => $_getIZ(9);
  @$pb.TagNumber(11)
  set feeRate($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(11)
  $core.bool hasFeeRate() => $_has(9);
  @$pb.TagNumber(11)
  void clearFeeRate() => $_clearField(11);

  @$pb.TagNumber(12)
  $2.GameCurrency get currency => $_getN(10);
  @$pb.TagNumber(12)
  set currency($2.GameCurrency value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasCurrency() => $_has(10);
  @$pb.TagNumber(12)
  void clearCurrency() => $_clearField(12);
}

class ItemInfo extends $pb.GeneratedMessage {
  factory ItemInfo({
    $core.String? id,
    $1.CommodityType? type,
    $core.String? name,
    $core.String? url,
    $core.int? count,
    $core.int? period,
    $core.String? typeDesc,
    $core.int? level,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (name != null) result.name = name;
    if (url != null) result.url = url;
    if (count != null) result.count = count;
    if (period != null) result.period = period;
    if (typeDesc != null) result.typeDesc = typeDesc;
    if (level != null) result.level = level;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.merch'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aE<$1.CommodityType>(2, _omitFieldNames ? '' : 'type',
        enumValues: $1.CommodityType.values)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..aI(5, _omitFieldNames ? '' : 'count')
    ..aI(6, _omitFieldNames ? '' : 'period')
    ..aOS(7, _omitFieldNames ? '' : 'typeDesc')
    ..aI(8, _omitFieldNames ? '' : 'level')
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
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $1.CommodityType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type($1.CommodityType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get count => $_getIZ(4);
  @$pb.TagNumber(5)
  set count($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get period => $_getIZ(5);
  @$pb.TagNumber(6)
  set period($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPeriod() => $_has(5);
  @$pb.TagNumber(6)
  void clearPeriod() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get typeDesc => $_getSZ(6);
  @$pb.TagNumber(7)
  set typeDesc($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTypeDesc() => $_has(6);
  @$pb.TagNumber(7)
  void clearTypeDesc() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get level => $_getIZ(7);
  @$pb.TagNumber(8)
  set level($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLevel() => $_has(7);
  @$pb.TagNumber(8)
  void clearLevel() => $_clearField(8);
}

class MerchListRsp extends $pb.GeneratedMessage {
  factory MerchListRsp({
    $core.Iterable<MerchItem>? items,
    ListingOverview? overview,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    if (overview != null) result.overview = overview;
    return result;
  }

  MerchListRsp._();

  factory MerchListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MerchListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MerchListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.merch'),
      createEmptyInstance: create)
    ..pPM<MerchItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: MerchItem.create)
    ..aOM<ListingOverview>(2, _omitFieldNames ? '' : 'overview',
        subBuilder: ListingOverview.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchListRsp copyWith(void Function(MerchListRsp) updates) =>
      super.copyWith((message) => updates(message as MerchListRsp))
          as MerchListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MerchListRsp create() => MerchListRsp._();
  @$core.override
  MerchListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MerchListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MerchListRsp>(create);
  static MerchListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MerchItem> get items => $_getList(0);

  @$pb.TagNumber(2)
  ListingOverview get overview => $_getN(1);
  @$pb.TagNumber(2)
  set overview(ListingOverview value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOverview() => $_has(1);
  @$pb.TagNumber(2)
  void clearOverview() => $_clearField(2);
  @$pb.TagNumber(2)
  ListingOverview ensureOverview() => $_ensure(1);
}

class ListingOverview extends $pb.GeneratedMessage {
  factory ListingOverview({
    $core.int? availableListingNum,
    $core.int? listingNum,
    $core.bool? listingLimit,
    $core.int? feeRate,
    $2.GameCurrency? currency,
  }) {
    final result = create();
    if (availableListingNum != null)
      result.availableListingNum = availableListingNum;
    if (listingNum != null) result.listingNum = listingNum;
    if (listingLimit != null) result.listingLimit = listingLimit;
    if (feeRate != null) result.feeRate = feeRate;
    if (currency != null) result.currency = currency;
    return result;
  }

  ListingOverview._();

  factory ListingOverview.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListingOverview.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListingOverview',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.merch'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'availableListingNum')
    ..aI(2, _omitFieldNames ? '' : 'listingNum')
    ..aOB(3, _omitFieldNames ? '' : 'listingLimit')
    ..aI(4, _omitFieldNames ? '' : 'feeRate')
    ..aE<$2.GameCurrency>(5, _omitFieldNames ? '' : 'currency',
        enumValues: $2.GameCurrency.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListingOverview clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListingOverview copyWith(void Function(ListingOverview) updates) =>
      super.copyWith((message) => updates(message as ListingOverview))
          as ListingOverview;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListingOverview create() => ListingOverview._();
  @$core.override
  ListingOverview createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListingOverview getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListingOverview>(create);
  static ListingOverview? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get availableListingNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set availableListingNum($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAvailableListingNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearAvailableListingNum() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get listingNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set listingNum($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasListingNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearListingNum() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get listingLimit => $_getBF(2);
  @$pb.TagNumber(3)
  set listingLimit($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasListingLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearListingLimit() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get feeRate => $_getIZ(3);
  @$pb.TagNumber(4)
  set feeRate($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFeeRate() => $_has(3);
  @$pb.TagNumber(4)
  void clearFeeRate() => $_clearField(4);

  @$pb.TagNumber(5)
  $2.GameCurrency get currency => $_getN(4);
  @$pb.TagNumber(5)
  set currency($2.GameCurrency value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCurrency() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrency() => $_clearField(5);
}

class MerchBuyReq extends $pb.GeneratedMessage {
  factory MerchBuyReq({
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  MerchBuyReq._();

  factory MerchBuyReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MerchBuyReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MerchBuyReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.merch'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchBuyReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchBuyReq copyWith(void Function(MerchBuyReq) updates) =>
      super.copyWith((message) => updates(message as MerchBuyReq))
          as MerchBuyReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MerchBuyReq create() => MerchBuyReq._();
  @$core.override
  MerchBuyReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MerchBuyReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MerchBuyReq>(create);
  static MerchBuyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class TradeInfo extends $pb.GeneratedMessage {
  factory TradeInfo({
    $0.User? seller,
    $0.User? buyer,
    ItemInfo? itemInfo,
    $fixnum.Int64? price,
    $fixnum.Int64? tradeTime,
    $2.GameCurrency? currency,
  }) {
    final result = create();
    if (seller != null) result.seller = seller;
    if (buyer != null) result.buyer = buyer;
    if (itemInfo != null) result.itemInfo = itemInfo;
    if (price != null) result.price = price;
    if (tradeTime != null) result.tradeTime = tradeTime;
    if (currency != null) result.currency = currency;
    return result;
  }

  TradeInfo._();

  factory TradeInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TradeInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TradeInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.merch'),
      createEmptyInstance: create)
    ..aOM<$0.User>(1, _omitFieldNames ? '' : 'seller',
        subBuilder: $0.User.create)
    ..aOM<$0.User>(2, _omitFieldNames ? '' : 'buyer',
        subBuilder: $0.User.create)
    ..aOM<ItemInfo>(3, _omitFieldNames ? '' : 'itemInfo',
        subBuilder: ItemInfo.create)
    ..aInt64(4, _omitFieldNames ? '' : 'price')
    ..aInt64(5, _omitFieldNames ? '' : 'tradeTime')
    ..aE<$2.GameCurrency>(6, _omitFieldNames ? '' : 'currency',
        enumValues: $2.GameCurrency.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TradeInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TradeInfo copyWith(void Function(TradeInfo) updates) =>
      super.copyWith((message) => updates(message as TradeInfo)) as TradeInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TradeInfo create() => TradeInfo._();
  @$core.override
  TradeInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TradeInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TradeInfo>(create);
  static TradeInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $0.User get seller => $_getN(0);
  @$pb.TagNumber(1)
  set seller($0.User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSeller() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeller() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.User ensureSeller() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.User get buyer => $_getN(1);
  @$pb.TagNumber(2)
  set buyer($0.User value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBuyer() => $_has(1);
  @$pb.TagNumber(2)
  void clearBuyer() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.User ensureBuyer() => $_ensure(1);

  @$pb.TagNumber(3)
  ItemInfo get itemInfo => $_getN(2);
  @$pb.TagNumber(3)
  set itemInfo(ItemInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasItemInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearItemInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  ItemInfo ensureItemInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get price => $_getI64(3);
  @$pb.TagNumber(4)
  set price($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get tradeTime => $_getI64(4);
  @$pb.TagNumber(5)
  set tradeTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTradeTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTradeTime() => $_clearField(5);

  @$pb.TagNumber(6)
  $2.GameCurrency get currency => $_getN(5);
  @$pb.TagNumber(6)
  set currency($2.GameCurrency value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCurrency() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurrency() => $_clearField(6);
}

class TradeInfoListRsp extends $pb.GeneratedMessage {
  factory TradeInfoListRsp({
    $core.Iterable<TradeInfo>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  TradeInfoListRsp._();

  factory TradeInfoListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TradeInfoListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TradeInfoListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.merch'),
      createEmptyInstance: create)
    ..pPM<TradeInfo>(1, _omitFieldNames ? '' : 'items',
        subBuilder: TradeInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TradeInfoListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TradeInfoListRsp copyWith(void Function(TradeInfoListRsp) updates) =>
      super.copyWith((message) => updates(message as TradeInfoListRsp))
          as TradeInfoListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TradeInfoListRsp create() => TradeInfoListRsp._();
  @$core.override
  TradeInfoListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TradeInfoListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TradeInfoListRsp>(create);
  static TradeInfoListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TradeInfo> get items => $_getList(0);
}

class UnusedCommodityListRsp extends $pb.GeneratedMessage {
  factory UnusedCommodityListRsp({
    $core.Iterable<ItemInfo>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  UnusedCommodityListRsp._();

  factory UnusedCommodityListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnusedCommodityListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnusedCommodityListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.merch'),
      createEmptyInstance: create)
    ..pPM<ItemInfo>(1, _omitFieldNames ? '' : 'items',
        subBuilder: ItemInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnusedCommodityListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnusedCommodityListRsp copyWith(
          void Function(UnusedCommodityListRsp) updates) =>
      super.copyWith((message) => updates(message as UnusedCommodityListRsp))
          as UnusedCommodityListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnusedCommodityListRsp create() => UnusedCommodityListRsp._();
  @$core.override
  UnusedCommodityListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnusedCommodityListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnusedCommodityListRsp>(create);
  static UnusedCommodityListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ItemInfo> get items => $_getList(0);
}

class ShareMerchReq extends $pb.GeneratedMessage {
  factory ShareMerchReq({
    $core.String? toEmId,
    $fixnum.Int64? merchId,
  }) {
    final result = create();
    if (toEmId != null) result.toEmId = toEmId;
    if (merchId != null) result.merchId = merchId;
    return result;
  }

  ShareMerchReq._();

  factory ShareMerchReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShareMerchReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShareMerchReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.merch'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toEmId')
    ..aInt64(2, _omitFieldNames ? '' : 'merchId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShareMerchReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShareMerchReq copyWith(void Function(ShareMerchReq) updates) =>
      super.copyWith((message) => updates(message as ShareMerchReq))
          as ShareMerchReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShareMerchReq create() => ShareMerchReq._();
  @$core.override
  ShareMerchReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShareMerchReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShareMerchReq>(create);
  static ShareMerchReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get toEmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set toEmId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToEmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToEmId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get merchId => $_getI64(1);
  @$pb.TagNumber(2)
  set merchId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMerchId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMerchId() => $_clearField(2);
}

class BroadcastEventListRsp extends $pb.GeneratedMessage {
  factory BroadcastEventListRsp({
    $core.Iterable<BroadcastEvent>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  BroadcastEventListRsp._();

  factory BroadcastEventListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BroadcastEventListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BroadcastEventListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.merch'),
      createEmptyInstance: create)
    ..pPM<BroadcastEvent>(1, _omitFieldNames ? '' : 'items',
        subBuilder: BroadcastEvent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastEventListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastEventListRsp copyWith(
          void Function(BroadcastEventListRsp) updates) =>
      super.copyWith((message) => updates(message as BroadcastEventListRsp))
          as BroadcastEventListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastEventListRsp create() => BroadcastEventListRsp._();
  @$core.override
  BroadcastEventListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BroadcastEventListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastEventListRsp>(create);
  static BroadcastEventListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BroadcastEvent> get items => $_getList(0);
}

class BroadcastEvent extends $pb.GeneratedMessage {
  factory BroadcastEvent({
    $0.User? user,
    $core.String? content,
    $core.String? jumpUrl,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (content != null) result.content = content;
    if (jumpUrl != null) result.jumpUrl = jumpUrl;
    return result;
  }

  BroadcastEvent._();

  factory BroadcastEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BroadcastEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BroadcastEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.merch'),
      createEmptyInstance: create)
    ..aOM<$0.User>(1, _omitFieldNames ? '' : 'user', subBuilder: $0.User.create)
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOS(3, _omitFieldNames ? '' : 'jumpUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastEvent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BroadcastEvent copyWith(void Function(BroadcastEvent) updates) =>
      super.copyWith((message) => updates(message as BroadcastEvent))
          as BroadcastEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastEvent create() => BroadcastEvent._();
  @$core.override
  BroadcastEvent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BroadcastEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcastEvent>(create);
  static BroadcastEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $0.User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user($0.User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.User ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get jumpUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set jumpUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasJumpUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearJumpUrl() => $_clearField(3);
}

class MerchConfigRsp extends $pb.GeneratedMessage {
  factory MerchConfigRsp({
    $2.GameCurrency? currency,
    $core.String? currencyIcon,
  }) {
    final result = create();
    if (currency != null) result.currency = currency;
    if (currencyIcon != null) result.currencyIcon = currencyIcon;
    return result;
  }

  MerchConfigRsp._();

  factory MerchConfigRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MerchConfigRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MerchConfigRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'merch.merch'),
      createEmptyInstance: create)
    ..aE<$2.GameCurrency>(2, _omitFieldNames ? '' : 'currency',
        enumValues: $2.GameCurrency.values)
    ..aOS(3, _omitFieldNames ? '' : 'currencyIcon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchConfigRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MerchConfigRsp copyWith(void Function(MerchConfigRsp) updates) =>
      super.copyWith((message) => updates(message as MerchConfigRsp))
          as MerchConfigRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MerchConfigRsp create() => MerchConfigRsp._();
  @$core.override
  MerchConfigRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MerchConfigRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MerchConfigRsp>(create);
  static MerchConfigRsp? _defaultInstance;

  @$pb.TagNumber(2)
  $2.GameCurrency get currency => $_getN(0);
  @$pb.TagNumber(2)
  set currency($2.GameCurrency value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCurrency() => $_has(0);
  @$pb.TagNumber(2)
  void clearCurrency() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get currencyIcon => $_getSZ(1);
  @$pb.TagNumber(3)
  set currencyIcon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasCurrencyIcon() => $_has(1);
  @$pb.TagNumber(3)
  void clearCurrencyIcon() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

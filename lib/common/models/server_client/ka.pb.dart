// This is a generated file - do not edit.
//
// Generated from server_client/ka.proto.

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

class ButlerInfoRsp extends $pb.GeneratedMessage {
  factory ButlerInfoRsp({
    $core.int? kaLevel,
    $core.int? kaLinkStatus,
    $core.String? kaButlerWhatsapp,
    $core.String? kaUserLinkTag,
    $fixnum.Int64? butlerUid,
    $core.String? butlerEmUsername,
    $core.Iterable<GiftPackageItem>? giftPackage,
    $fixnum.Int64? uid,
    $core.String? kaButlerTelegram,
  }) {
    final result = create();
    if (kaLevel != null) result.kaLevel = kaLevel;
    if (kaLinkStatus != null) result.kaLinkStatus = kaLinkStatus;
    if (kaButlerWhatsapp != null) result.kaButlerWhatsapp = kaButlerWhatsapp;
    if (kaUserLinkTag != null) result.kaUserLinkTag = kaUserLinkTag;
    if (butlerUid != null) result.butlerUid = butlerUid;
    if (butlerEmUsername != null) result.butlerEmUsername = butlerEmUsername;
    if (giftPackage != null) result.giftPackage.addAll(giftPackage);
    if (uid != null) result.uid = uid;
    if (kaButlerTelegram != null) result.kaButlerTelegram = kaButlerTelegram;
    return result;
  }

  ButlerInfoRsp._();

  factory ButlerInfoRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ButlerInfoRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ButlerInfoRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ka'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'kaLevel', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'kaLinkStatus',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'kaButlerWhatsapp')
    ..aOS(4, _omitFieldNames ? '' : 'kaUserLinkTag')
    ..a<$fixnum.Int64>(
        5, _omitFieldNames ? '' : 'butlerUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'butlerEmUsername')
    ..pPM<GiftPackageItem>(7, _omitFieldNames ? '' : 'giftPackage',
        subBuilder: GiftPackageItem.create)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(9, _omitFieldNames ? '' : 'kaButlerTelegram')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ButlerInfoRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ButlerInfoRsp copyWith(void Function(ButlerInfoRsp) updates) =>
      super.copyWith((message) => updates(message as ButlerInfoRsp))
          as ButlerInfoRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ButlerInfoRsp create() => ButlerInfoRsp._();
  @$core.override
  ButlerInfoRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ButlerInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ButlerInfoRsp>(create);
  static ButlerInfoRsp? _defaultInstance;

  /// KA等级，0-A级，1-S级
  @$pb.TagNumber(1)
  $core.int get kaLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set kaLevel($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasKaLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearKaLevel() => $_clearField(1);

  /// ka建联状态 0-未建联，1-已建联未发放礼包，2-已建联未领取礼包，3-已建联已领取礼包
  @$pb.TagNumber(2)
  $core.int get kaLinkStatus => $_getIZ(1);
  @$pb.TagNumber(2)
  set kaLinkStatus($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasKaLinkStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearKaLinkStatus() => $_clearField(2);

  /// ka管家WhatsApp账号
  @$pb.TagNumber(3)
  $core.String get kaButlerWhatsapp => $_getSZ(2);
  @$pb.TagNumber(3)
  set kaButlerWhatsapp($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasKaButlerWhatsapp() => $_has(2);
  @$pb.TagNumber(3)
  void clearKaButlerWhatsapp() => $_clearField(3);

  /// ka用户建联标签
  @$pb.TagNumber(4)
  $core.String get kaUserLinkTag => $_getSZ(3);
  @$pb.TagNumber(4)
  set kaUserLinkTag($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasKaUserLinkTag() => $_has(3);
  @$pb.TagNumber(4)
  void clearKaUserLinkTag() => $_clearField(4);

  /// 管家ID
  @$pb.TagNumber(5)
  $fixnum.Int64 get butlerUid => $_getI64(4);
  @$pb.TagNumber(5)
  set butlerUid($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasButlerUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearButlerUid() => $_clearField(5);

  /// 管家EM账号
  @$pb.TagNumber(6)
  $core.String get butlerEmUsername => $_getSZ(5);
  @$pb.TagNumber(6)
  set butlerEmUsername($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasButlerEmUsername() => $_has(5);
  @$pb.TagNumber(6)
  void clearButlerEmUsername() => $_clearField(6);

  /// 礼包列表
  @$pb.TagNumber(7)
  $pb.PbList<GiftPackageItem> get giftPackage => $_getList(6);

  /// ka用户ID
  @$pb.TagNumber(8)
  $fixnum.Int64 get uid => $_getI64(7);
  @$pb.TagNumber(8)
  set uid($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasUid() => $_has(7);
  @$pb.TagNumber(8)
  void clearUid() => $_clearField(8);

  /// ka管家Telegram账号
  @$pb.TagNumber(9)
  $core.String get kaButlerTelegram => $_getSZ(8);
  @$pb.TagNumber(9)
  set kaButlerTelegram($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasKaButlerTelegram() => $_has(8);
  @$pb.TagNumber(9)
  void clearKaButlerTelegram() => $_clearField(9);
}

class GiftPackageItem extends $pb.GeneratedMessage {
  factory GiftPackageItem({
    $fixnum.Int64? packageId,
    $core.String? packageName,
    $core.String? packageImageUrl,
  }) {
    final result = create();
    if (packageId != null) result.packageId = packageId;
    if (packageName != null) result.packageName = packageName;
    if (packageImageUrl != null) result.packageImageUrl = packageImageUrl;
    return result;
  }

  GiftPackageItem._();

  factory GiftPackageItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GiftPackageItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GiftPackageItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ka'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'packageId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'packageName')
    ..aOS(3, _omitFieldNames ? '' : 'packageImageUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftPackageItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftPackageItem copyWith(void Function(GiftPackageItem) updates) =>
      super.copyWith((message) => updates(message as GiftPackageItem))
          as GiftPackageItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GiftPackageItem create() => GiftPackageItem._();
  @$core.override
  GiftPackageItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GiftPackageItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftPackageItem>(create);
  static GiftPackageItem? _defaultInstance;

  /// 礼包ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get packageId => $_getI64(0);
  @$pb.TagNumber(1)
  set packageId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPackageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPackageId() => $_clearField(1);

  /// 礼包名称
  @$pb.TagNumber(2)
  $core.String get packageName => $_getSZ(1);
  @$pb.TagNumber(2)
  set packageName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPackageName() => $_has(1);
  @$pb.TagNumber(2)
  void clearPackageName() => $_clearField(2);

  /// 礼包图片URL
  @$pb.TagNumber(3)
  $core.String get packageImageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set packageImageUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPackageImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearPackageImageUrl() => $_clearField(3);
}

class ClaimGiftReq extends $pb.GeneratedMessage {
  factory ClaimGiftReq({
    $fixnum.Int64? packageId,
    $fixnum.Int64? recordId,
  }) {
    final result = create();
    if (packageId != null) result.packageId = packageId;
    if (recordId != null) result.recordId = recordId;
    return result;
  }

  ClaimGiftReq._();

  factory ClaimGiftReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimGiftReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimGiftReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ka'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'packageId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'recordId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimGiftReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimGiftReq copyWith(void Function(ClaimGiftReq) updates) =>
      super.copyWith((message) => updates(message as ClaimGiftReq))
          as ClaimGiftReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimGiftReq create() => ClaimGiftReq._();
  @$core.override
  ClaimGiftReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClaimGiftReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimGiftReq>(create);
  static ClaimGiftReq? _defaultInstance;

  /// 礼包ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get packageId => $_getI64(0);
  @$pb.TagNumber(1)
  set packageId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPackageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPackageId() => $_clearField(1);

  /// 记录ID，用于幂等
  @$pb.TagNumber(2)
  $fixnum.Int64 get recordId => $_getI64(1);
  @$pb.TagNumber(2)
  set recordId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRecordId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecordId() => $_clearField(2);
}

class ClaimGiftRsp extends $pb.GeneratedMessage {
  factory ClaimGiftRsp({
    $fixnum.Int64? packageId,
    $core.String? packageName,
    $core.Iterable<PackageItem>? items,
  }) {
    final result = create();
    if (packageId != null) result.packageId = packageId;
    if (packageName != null) result.packageName = packageName;
    if (items != null) result.items.addAll(items);
    return result;
  }

  ClaimGiftRsp._();

  factory ClaimGiftRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ClaimGiftRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClaimGiftRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ka'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'packageId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'packageName')
    ..pPM<PackageItem>(3, _omitFieldNames ? '' : 'items',
        subBuilder: PackageItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimGiftRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ClaimGiftRsp copyWith(void Function(ClaimGiftRsp) updates) =>
      super.copyWith((message) => updates(message as ClaimGiftRsp))
          as ClaimGiftRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClaimGiftRsp create() => ClaimGiftRsp._();
  @$core.override
  ClaimGiftRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ClaimGiftRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClaimGiftRsp>(create);
  static ClaimGiftRsp? _defaultInstance;

  /// 礼包ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get packageId => $_getI64(0);
  @$pb.TagNumber(1)
  set packageId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPackageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPackageId() => $_clearField(1);

  /// 礼包名称
  @$pb.TagNumber(2)
  $core.String get packageName => $_getSZ(1);
  @$pb.TagNumber(2)
  set packageName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPackageName() => $_has(1);
  @$pb.TagNumber(2)
  void clearPackageName() => $_clearField(2);

  /// 礼包物品列表
  @$pb.TagNumber(3)
  $pb.PbList<PackageItem> get items => $_getList(2);
}

class PackageItem extends $pb.GeneratedMessage {
  factory PackageItem({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? imageUrl,
    $core.int? quantity,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (imageUrl != null) result.imageUrl = imageUrl;
    if (quantity != null) result.quantity = quantity;
    return result;
  }

  PackageItem._();

  factory PackageItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PackageItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PackageItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ka'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'imageUrl')
    ..aI(4, _omitFieldNames ? '' : 'quantity', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PackageItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PackageItem copyWith(void Function(PackageItem) updates) =>
      super.copyWith((message) => updates(message as PackageItem))
          as PackageItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PackageItem create() => PackageItem._();
  @$core.override
  PackageItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PackageItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PackageItem>(create);
  static PackageItem? _defaultInstance;

  /// 物品ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 物品名称
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// 物品图片URL
  @$pb.TagNumber(3)
  $core.String get imageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set imageUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageUrl() => $_clearField(3);

  /// 物品数量
  @$pb.TagNumber(4)
  $core.int get quantity => $_getIZ(3);
  @$pb.TagNumber(4)
  set quantity($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuantity() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuantity() => $_clearField(4);
}

/// *
///  查询用户最近过期的可用折扣券
///  GET /latest-coupon
///  Response LatestCouponRsp
class LatestCouponRsp extends $pb.GeneratedMessage {
  factory LatestCouponRsp({
    $core.bool? hasCoupon,
    CouponInfo? coupon_2,
  }) {
    final result = create();
    if (hasCoupon != null) result.hasCoupon = hasCoupon;
    if (coupon_2 != null) result.coupon_2 = coupon_2;
    return result;
  }

  LatestCouponRsp._();

  factory LatestCouponRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LatestCouponRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LatestCouponRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ka'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasCoupon')
    ..aOM<CouponInfo>(2, _omitFieldNames ? '' : 'coupon',
        subBuilder: CouponInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LatestCouponRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LatestCouponRsp copyWith(void Function(LatestCouponRsp) updates) =>
      super.copyWith((message) => updates(message as LatestCouponRsp))
          as LatestCouponRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LatestCouponRsp create() => LatestCouponRsp._();
  @$core.override
  LatestCouponRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LatestCouponRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LatestCouponRsp>(create);
  static LatestCouponRsp? _defaultInstance;

  /// 是否有可用折扣券
  @$pb.TagNumber(1)
  $core.bool get hasCoupon => $_getBF(0);
  @$pb.TagNumber(1)
  set hasCoupon($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHasCoupon() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasCoupon() => $_clearField(1);

  /// 折扣券详情（has_coupon=true 时存在）
  @$pb.TagNumber(2)
  CouponInfo get coupon_2 => $_getN(1);
  @$pb.TagNumber(2)
  set coupon_2(CouponInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCoupon_2() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoupon_2() => $_clearField(2);
  @$pb.TagNumber(2)
  CouponInfo ensureCoupon_2() => $_ensure(1);
}

class CouponInfo extends $pb.GeneratedMessage {
  factory CouponInfo({
    $fixnum.Int64? couponId,
    $core.String? couponName,
    $core.int? discountPercent,
    $fixnum.Int64? maxUsableValueCoins,
    $fixnum.Int64? expireTime,
    $fixnum.Int64? remainingSeconds,
  }) {
    final result = create();
    if (couponId != null) result.couponId = couponId;
    if (couponName != null) result.couponName = couponName;
    if (discountPercent != null) result.discountPercent = discountPercent;
    if (maxUsableValueCoins != null)
      result.maxUsableValueCoins = maxUsableValueCoins;
    if (expireTime != null) result.expireTime = expireTime;
    if (remainingSeconds != null) result.remainingSeconds = remainingSeconds;
    return result;
  }

  CouponInfo._();

  factory CouponInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CouponInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CouponInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'ka'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'couponId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'couponName')
    ..aI(3, _omitFieldNames ? '' : 'discountPercent',
        fieldType: $pb.PbFieldType.OU3)
    ..aInt64(4, _omitFieldNames ? '' : 'maxUsableValueCoins')
    ..aInt64(5, _omitFieldNames ? '' : 'expireTime')
    ..aInt64(6, _omitFieldNames ? '' : 'remainingSeconds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CouponInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CouponInfo copyWith(void Function(CouponInfo) updates) =>
      super.copyWith((message) => updates(message as CouponInfo)) as CouponInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CouponInfo create() => CouponInfo._();
  @$core.override
  CouponInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CouponInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CouponInfo>(create);
  static CouponInfo? _defaultInstance;

  /// 折扣券实例ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get couponId => $_getI64(0);
  @$pb.TagNumber(1)
  set couponId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCouponId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCouponId() => $_clearField(1);

  /// 折扣券名称，如 "10% off gifts ≤1000 coins."
  @$pb.TagNumber(2)
  $core.String get couponName => $_getSZ(1);
  @$pb.TagNumber(2)
  set couponName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCouponName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCouponName() => $_clearField(2);

  /// 折扣比例（百分比，如10表示10%）
  @$pb.TagNumber(3)
  $core.int get discountPercent => $_getIZ(2);
  @$pb.TagNumber(3)
  set discountPercent($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDiscountPercent() => $_has(2);
  @$pb.TagNumber(3)
  void clearDiscountPercent() => $_clearField(3);

  /// 最高可用礼物价值（coins，展示用）
  @$pb.TagNumber(4)
  $fixnum.Int64 get maxUsableValueCoins => $_getI64(3);
  @$pb.TagNumber(4)
  set maxUsableValueCoins($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMaxUsableValueCoins() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxUsableValueCoins() => $_clearField(4);

  /// 过期时间戳（毫秒，UTC）
  @$pb.TagNumber(5)
  $fixnum.Int64 get expireTime => $_getI64(4);
  @$pb.TagNumber(5)
  set expireTime($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExpireTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpireTime() => $_clearField(5);

  /// 剩余有效秒数（方便客户端倒计时）
  @$pb.TagNumber(6)
  $fixnum.Int64 get remainingSeconds => $_getI64(5);
  @$pb.TagNumber(6)
  set remainingSeconds($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRemainingSeconds() => $_has(5);
  @$pb.TagNumber(6)
  void clearRemainingSeconds() => $_clearField(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

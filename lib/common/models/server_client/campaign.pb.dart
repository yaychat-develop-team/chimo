// This is a generated file - do not edit.
//
// Generated from server_client/campaign.proto.

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

class CampaignHomeRspData extends $pb.GeneratedMessage {
  factory CampaignHomeRspData({
    $fixnum.Int64? campaignId,
    $core.String? name,
    $core.Iterable<CampaignRight>? rights,
  }) {
    final result = create();
    if (campaignId != null) result.campaignId = campaignId;
    if (name != null) result.name = name;
    if (rights != null) result.rights.addAll(rights);
    return result;
  }

  CampaignHomeRspData._();

  factory CampaignHomeRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CampaignHomeRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CampaignHomeRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'campaign'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'campaignId', $pb.PbFieldType.OU6,
        protoName: 'campaignId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..pPM<CampaignRight>(3, _omitFieldNames ? '' : 'rights',
        subBuilder: CampaignRight.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CampaignHomeRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CampaignHomeRspData copyWith(void Function(CampaignHomeRspData) updates) =>
      super.copyWith((message) => updates(message as CampaignHomeRspData))
          as CampaignHomeRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CampaignHomeRspData create() => CampaignHomeRspData._();
  @$core.override
  CampaignHomeRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CampaignHomeRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CampaignHomeRspData>(create);
  static CampaignHomeRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get campaignId => $_getI64(0);
  @$pb.TagNumber(1)
  set campaignId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCampaignId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCampaignId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<CampaignRight> get rights => $_getList(2);
}

class CampaignRight extends $pb.GeneratedMessage {
  factory CampaignRight({
    $fixnum.Int64? rightId,
    $core.String? rightType,
    $core.String? name,
    $core.String? summary,
    $core.String? approvalMode,
    $core.Iterable<CampaignOutfit>? outfits,
  }) {
    final result = create();
    if (rightId != null) result.rightId = rightId;
    if (rightType != null) result.rightType = rightType;
    if (name != null) result.name = name;
    if (summary != null) result.summary = summary;
    if (approvalMode != null) result.approvalMode = approvalMode;
    if (outfits != null) result.outfits.addAll(outfits);
    return result;
  }

  CampaignRight._();

  factory CampaignRight.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CampaignRight.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CampaignRight',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'campaign'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'rightId', $pb.PbFieldType.OU6,
        protoName: 'rightId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'rightType', protoName: 'rightType')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'summary')
    ..aOS(5, _omitFieldNames ? '' : 'approvalMode', protoName: 'approvalMode')
    ..pPM<CampaignOutfit>(6, _omitFieldNames ? '' : 'outfits',
        subBuilder: CampaignOutfit.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CampaignRight clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CampaignRight copyWith(void Function(CampaignRight) updates) =>
      super.copyWith((message) => updates(message as CampaignRight))
          as CampaignRight;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CampaignRight create() => CampaignRight._();
  @$core.override
  CampaignRight createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CampaignRight getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CampaignRight>(create);
  static CampaignRight? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get rightId => $_getI64(0);
  @$pb.TagNumber(1)
  set rightId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRightId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRightId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get rightType => $_getSZ(1);
  @$pb.TagNumber(2)
  set rightType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRightType() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get summary => $_getSZ(3);
  @$pb.TagNumber(4)
  set summary($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSummary() => $_has(3);
  @$pb.TagNumber(4)
  void clearSummary() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get approvalMode => $_getSZ(4);
  @$pb.TagNumber(5)
  set approvalMode($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasApprovalMode() => $_has(4);
  @$pb.TagNumber(5)
  void clearApprovalMode() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<CampaignOutfit> get outfits => $_getList(5);
}

class CampaignOutfit extends $pb.GeneratedMessage {
  factory CampaignOutfit({
    $fixnum.Int64? outfitId,
    $fixnum.Int64? rightId,
    $core.String? name,
    $core.String? summary,
    $core.Iterable<OutfitItem>? items,
  }) {
    final result = create();
    if (outfitId != null) result.outfitId = outfitId;
    if (rightId != null) result.rightId = rightId;
    if (name != null) result.name = name;
    if (summary != null) result.summary = summary;
    if (items != null) result.items.addAll(items);
    return result;
  }

  CampaignOutfit._();

  factory CampaignOutfit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CampaignOutfit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CampaignOutfit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'campaign'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'outfitId', $pb.PbFieldType.OU6,
        protoName: 'outfitId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'rightId', $pb.PbFieldType.OU6,
        protoName: 'rightId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'summary')
    ..pPM<OutfitItem>(5, _omitFieldNames ? '' : 'items',
        subBuilder: OutfitItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CampaignOutfit clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CampaignOutfit copyWith(void Function(CampaignOutfit) updates) =>
      super.copyWith((message) => updates(message as CampaignOutfit))
          as CampaignOutfit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CampaignOutfit create() => CampaignOutfit._();
  @$core.override
  CampaignOutfit createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CampaignOutfit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CampaignOutfit>(create);
  static CampaignOutfit? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get outfitId => $_getI64(0);
  @$pb.TagNumber(1)
  set outfitId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOutfitId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutfitId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get rightId => $_getI64(1);
  @$pb.TagNumber(2)
  set rightId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRightId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get summary => $_getSZ(3);
  @$pb.TagNumber(4)
  set summary($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSummary() => $_has(3);
  @$pb.TagNumber(4)
  void clearSummary() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<OutfitItem> get items => $_getList(4);
}

class OutfitItem extends $pb.GeneratedMessage {
  factory OutfitItem({
    $core.String? commodityType,
    $fixnum.Int64? commodityId,
    $core.String? staticResource,
    $core.String? dynamicResource,
  }) {
    final result = create();
    if (commodityType != null) result.commodityType = commodityType;
    if (commodityId != null) result.commodityId = commodityId;
    if (staticResource != null) result.staticResource = staticResource;
    if (dynamicResource != null) result.dynamicResource = dynamicResource;
    return result;
  }

  OutfitItem._();

  factory OutfitItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OutfitItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OutfitItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'campaign'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'commodityType', protoName: 'commodityType')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'commodityId', $pb.PbFieldType.OU6,
        protoName: 'commodityId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'staticResource',
        protoName: 'staticResource')
    ..aOS(4, _omitFieldNames ? '' : 'dynamicResource',
        protoName: 'dynamicResource')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutfitItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutfitItem copyWith(void Function(OutfitItem) updates) =>
      super.copyWith((message) => updates(message as OutfitItem)) as OutfitItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OutfitItem create() => OutfitItem._();
  @$core.override
  OutfitItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OutfitItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OutfitItem>(create);
  static OutfitItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get commodityType => $_getSZ(0);
  @$pb.TagNumber(1)
  set commodityType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCommodityType() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommodityType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get commodityId => $_getI64(1);
  @$pb.TagNumber(2)
  set commodityId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCommodityId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommodityId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get staticResource => $_getSZ(2);
  @$pb.TagNumber(3)
  set staticResource($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStaticResource() => $_has(2);
  @$pb.TagNumber(3)
  void clearStaticResource() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get dynamicResource => $_getSZ(3);
  @$pb.TagNumber(4)
  set dynamicResource($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDynamicResource() => $_has(3);
  @$pb.TagNumber(4)
  void clearDynamicResource() => $_clearField(4);
}

class CampaignApplyReq extends $pb.GeneratedMessage {
  factory CampaignApplyReq({
    $core.String? needSummary,
  }) {
    final result = create();
    if (needSummary != null) result.needSummary = needSummary;
    return result;
  }

  CampaignApplyReq._();

  factory CampaignApplyReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CampaignApplyReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CampaignApplyReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'campaign'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'needSummary', protoName: 'needSummary')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CampaignApplyReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CampaignApplyReq copyWith(void Function(CampaignApplyReq) updates) =>
      super.copyWith((message) => updates(message as CampaignApplyReq))
          as CampaignApplyReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CampaignApplyReq create() => CampaignApplyReq._();
  @$core.override
  CampaignApplyReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CampaignApplyReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CampaignApplyReq>(create);
  static CampaignApplyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get needSummary => $_getSZ(0);
  @$pb.TagNumber(1)
  set needSummary($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNeedSummary() => $_has(0);
  @$pb.TagNumber(1)
  void clearNeedSummary() => $_clearField(1);
}

class CampaignQualifyRspData extends $pb.GeneratedMessage {
  factory CampaignQualifyRspData({
    $core.bool? matched,
    $fixnum.Int64? matchedOutfitId,
    $core.Iterable<OutfitItem>? missing,
  }) {
    final result = create();
    if (matched != null) result.matched = matched;
    if (matchedOutfitId != null) result.matchedOutfitId = matchedOutfitId;
    if (missing != null) result.missing.addAll(missing);
    return result;
  }

  CampaignQualifyRspData._();

  factory CampaignQualifyRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CampaignQualifyRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CampaignQualifyRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'campaign'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'matched')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'matchedOutfitId', $pb.PbFieldType.OU6,
        protoName: 'matchedOutfitId', defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPM<OutfitItem>(3, _omitFieldNames ? '' : 'missing',
        subBuilder: OutfitItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CampaignQualifyRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CampaignQualifyRspData copyWith(
          void Function(CampaignQualifyRspData) updates) =>
      super.copyWith((message) => updates(message as CampaignQualifyRspData))
          as CampaignQualifyRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CampaignQualifyRspData create() => CampaignQualifyRspData._();
  @$core.override
  CampaignQualifyRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CampaignQualifyRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CampaignQualifyRspData>(create);
  static CampaignQualifyRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get matched => $_getBF(0);
  @$pb.TagNumber(1)
  set matched($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMatched() => $_has(0);
  @$pb.TagNumber(1)
  void clearMatched() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get matchedOutfitId => $_getI64(1);
  @$pb.TagNumber(2)
  set matchedOutfitId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMatchedOutfitId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMatchedOutfitId() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<OutfitItem> get missing => $_getList(2);
}

class CampaignApplyRspData extends $pb.GeneratedMessage {
  factory CampaignApplyRspData({
    $core.String? bizNo,
    $core.String? status,
    $core.bool? entitlementActive,
  }) {
    final result = create();
    if (bizNo != null) result.bizNo = bizNo;
    if (status != null) result.status = status;
    if (entitlementActive != null) result.entitlementActive = entitlementActive;
    return result;
  }

  CampaignApplyRspData._();

  factory CampaignApplyRspData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CampaignApplyRspData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CampaignApplyRspData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'campaign'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'bizNo', protoName: 'bizNo')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..aOB(3, _omitFieldNames ? '' : 'entitlementActive',
        protoName: 'entitlementActive')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CampaignApplyRspData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CampaignApplyRspData copyWith(void Function(CampaignApplyRspData) updates) =>
      super.copyWith((message) => updates(message as CampaignApplyRspData))
          as CampaignApplyRspData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CampaignApplyRspData create() => CampaignApplyRspData._();
  @$core.override
  CampaignApplyRspData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CampaignApplyRspData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CampaignApplyRspData>(create);
  static CampaignApplyRspData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bizNo => $_getSZ(0);
  @$pb.TagNumber(1)
  set bizNo($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBizNo() => $_has(0);
  @$pb.TagNumber(1)
  void clearBizNo() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get entitlementActive => $_getBF(2);
  @$pb.TagNumber(3)
  set entitlementActive($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEntitlementActive() => $_has(2);
  @$pb.TagNumber(3)
  void clearEntitlementActive() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

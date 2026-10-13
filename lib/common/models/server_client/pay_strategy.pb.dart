// This is a generated file - do not edit.
//
// Generated from server_client/pay_strategy.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class PayStrategy extends $pb.GeneratedMessage {
  factory PayStrategy({
    $core.int? status,
    $core.int? guideIntervalCount,
    $core.String? officialRgLink,
    $core.String? webWtLink,
    PayRiskDialogInfo? riskDialog,
    $core.bool? isInRisk,
    $core.String? webRgBottomLink,
    $core.String? guideButtonImg,
    $core.String? guideButtonLink,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (guideIntervalCount != null)
      result.guideIntervalCount = guideIntervalCount;
    if (officialRgLink != null) result.officialRgLink = officialRgLink;
    if (webWtLink != null) result.webWtLink = webWtLink;
    if (riskDialog != null) result.riskDialog = riskDialog;
    if (isInRisk != null) result.isInRisk = isInRisk;
    if (webRgBottomLink != null) result.webRgBottomLink = webRgBottomLink;
    if (guideButtonImg != null) result.guideButtonImg = guideButtonImg;
    if (guideButtonLink != null) result.guideButtonLink = guideButtonLink;
    return result;
  }

  PayStrategy._();

  factory PayStrategy.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayStrategy.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayStrategy',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pay_strategy'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'status', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'guideIntervalCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'officialRgLink')
    ..aOS(4, _omitFieldNames ? '' : 'webWtLink')
    ..aOM<PayRiskDialogInfo>(5, _omitFieldNames ? '' : 'riskDialog',
        subBuilder: PayRiskDialogInfo.create)
    ..aOB(6, _omitFieldNames ? '' : 'isInRisk')
    ..aOS(7, _omitFieldNames ? '' : 'webRgBottomLink')
    ..aOS(8, _omitFieldNames ? '' : 'guideButtonImg')
    ..aOS(9, _omitFieldNames ? '' : 'guideButtonLink')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayStrategy clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayStrategy copyWith(void Function(PayStrategy) updates) =>
      super.copyWith((message) => updates(message as PayStrategy))
          as PayStrategy;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayStrategy create() => PayStrategy._();
  @$core.override
  PayStrategy createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayStrategy getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayStrategy>(create);
  static PayStrategy? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get guideIntervalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set guideIntervalCount($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGuideIntervalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearGuideIntervalCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get officialRgLink => $_getSZ(2);
  @$pb.TagNumber(3)
  set officialRgLink($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOfficialRgLink() => $_has(2);
  @$pb.TagNumber(3)
  void clearOfficialRgLink() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get webWtLink => $_getSZ(3);
  @$pb.TagNumber(4)
  set webWtLink($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWebWtLink() => $_has(3);
  @$pb.TagNumber(4)
  void clearWebWtLink() => $_clearField(4);

  @$pb.TagNumber(5)
  PayRiskDialogInfo get riskDialog => $_getN(4);
  @$pb.TagNumber(5)
  set riskDialog(PayRiskDialogInfo value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasRiskDialog() => $_has(4);
  @$pb.TagNumber(5)
  void clearRiskDialog() => $_clearField(5);
  @$pb.TagNumber(5)
  PayRiskDialogInfo ensureRiskDialog() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.bool get isInRisk => $_getBF(5);
  @$pb.TagNumber(6)
  set isInRisk($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsInRisk() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsInRisk() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get webRgBottomLink => $_getSZ(6);
  @$pb.TagNumber(7)
  set webRgBottomLink($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasWebRgBottomLink() => $_has(6);
  @$pb.TagNumber(7)
  void clearWebRgBottomLink() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get guideButtonImg => $_getSZ(7);
  @$pb.TagNumber(8)
  set guideButtonImg($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasGuideButtonImg() => $_has(7);
  @$pb.TagNumber(8)
  void clearGuideButtonImg() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get guideButtonLink => $_getSZ(8);
  @$pb.TagNumber(9)
  set guideButtonLink($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasGuideButtonLink() => $_has(8);
  @$pb.TagNumber(9)
  void clearGuideButtonLink() => $_clearField(9);
}

class PayRiskDialogInfo extends $pb.GeneratedMessage {
  factory PayRiskDialogInfo({
    $core.String? img,
    $core.String? title,
    $core.String? desc,
  }) {
    final result = create();
    if (img != null) result.img = img;
    if (title != null) result.title = title;
    if (desc != null) result.desc = desc;
    return result;
  }

  PayRiskDialogInfo._();

  factory PayRiskDialogInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayRiskDialogInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayRiskDialogInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pay_strategy'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'img')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'desc')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayRiskDialogInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayRiskDialogInfo copyWith(void Function(PayRiskDialogInfo) updates) =>
      super.copyWith((message) => updates(message as PayRiskDialogInfo))
          as PayRiskDialogInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayRiskDialogInfo create() => PayRiskDialogInfo._();
  @$core.override
  PayRiskDialogInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PayRiskDialogInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayRiskDialogInfo>(create);
  static PayRiskDialogInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get img => $_getSZ(0);
  @$pb.TagNumber(1)
  set img($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasImg() => $_has(0);
  @$pb.TagNumber(1)
  void clearImg() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

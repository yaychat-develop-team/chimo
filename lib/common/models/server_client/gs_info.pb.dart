// This is a generated file - do not edit.
//
// Generated from server_client/gs_info.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class UpdateInfoReq extends $pb.GeneratedMessage {
  factory UpdateInfoReq({
    $core.String? wechat,
    $core.String? phone,
    $core.String? fullName,
    $core.String? gCashId,
    $core.String? email,
    $core.String? telegramId,
    $core.int? cashType,
    $core.String? cryptoChain,
    $core.String? cryptoAddress,
    $core.String? bank,
    $core.String? bankNo,
    $core.Iterable<$core.String>? workExpUrl,
    $core.String? mayaId,
    $core.bool? includeGemSettlement,
  }) {
    final result = create();
    if (wechat != null) result.wechat = wechat;
    if (phone != null) result.phone = phone;
    if (fullName != null) result.fullName = fullName;
    if (gCashId != null) result.gCashId = gCashId;
    if (email != null) result.email = email;
    if (telegramId != null) result.telegramId = telegramId;
    if (cashType != null) result.cashType = cashType;
    if (cryptoChain != null) result.cryptoChain = cryptoChain;
    if (cryptoAddress != null) result.cryptoAddress = cryptoAddress;
    if (bank != null) result.bank = bank;
    if (bankNo != null) result.bankNo = bankNo;
    if (workExpUrl != null) result.workExpUrl.addAll(workExpUrl);
    if (mayaId != null) result.mayaId = mayaId;
    if (includeGemSettlement != null)
      result.includeGemSettlement = includeGemSettlement;
    return result;
  }

  UpdateInfoReq._();

  factory UpdateInfoReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateInfoReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateInfoReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'gs_info'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'wechat')
    ..aOS(2, _omitFieldNames ? '' : 'phone')
    ..aOS(3, _omitFieldNames ? '' : 'fullName')
    ..aOS(4, _omitFieldNames ? '' : 'gCashId')
    ..aOS(5, _omitFieldNames ? '' : 'email')
    ..aOS(6, _omitFieldNames ? '' : 'telegramId')
    ..aI(7, _omitFieldNames ? '' : 'cashType', fieldType: $pb.PbFieldType.OU3)
    ..aOS(8, _omitFieldNames ? '' : 'cryptoChain')
    ..aOS(9, _omitFieldNames ? '' : 'cryptoAddress')
    ..aOS(10, _omitFieldNames ? '' : 'bank')
    ..aOS(11, _omitFieldNames ? '' : 'bankNo')
    ..pPS(12, _omitFieldNames ? '' : 'workExpUrl')
    ..aOS(13, _omitFieldNames ? '' : 'mayaId')
    ..aOB(14, _omitFieldNames ? '' : 'includeGemSettlement')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateInfoReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateInfoReq copyWith(void Function(UpdateInfoReq) updates) =>
      super.copyWith((message) => updates(message as UpdateInfoReq))
          as UpdateInfoReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInfoReq create() => UpdateInfoReq._();
  @$core.override
  UpdateInfoReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateInfoReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateInfoReq>(create);
  static UpdateInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get wechat => $_getSZ(0);
  @$pb.TagNumber(1)
  set wechat($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWechat() => $_has(0);
  @$pb.TagNumber(1)
  void clearWechat() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get phone => $_getSZ(1);
  @$pb.TagNumber(2)
  set phone($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPhone() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhone() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fullName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fullName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFullName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFullName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get gCashId => $_getSZ(3);
  @$pb.TagNumber(4)
  set gCashId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGCashId() => $_has(3);
  @$pb.TagNumber(4)
  void clearGCashId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get email => $_getSZ(4);
  @$pb.TagNumber(5)
  set email($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmail() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get telegramId => $_getSZ(5);
  @$pb.TagNumber(6)
  set telegramId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTelegramId() => $_has(5);
  @$pb.TagNumber(6)
  void clearTelegramId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get cashType => $_getIZ(6);
  @$pb.TagNumber(7)
  set cashType($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCashType() => $_has(6);
  @$pb.TagNumber(7)
  void clearCashType() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get cryptoChain => $_getSZ(7);
  @$pb.TagNumber(8)
  set cryptoChain($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCryptoChain() => $_has(7);
  @$pb.TagNumber(8)
  void clearCryptoChain() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get cryptoAddress => $_getSZ(8);
  @$pb.TagNumber(9)
  set cryptoAddress($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCryptoAddress() => $_has(8);
  @$pb.TagNumber(9)
  void clearCryptoAddress() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get bank => $_getSZ(9);
  @$pb.TagNumber(10)
  set bank($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasBank() => $_has(9);
  @$pb.TagNumber(10)
  void clearBank() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get bankNo => $_getSZ(10);
  @$pb.TagNumber(11)
  set bankNo($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasBankNo() => $_has(10);
  @$pb.TagNumber(11)
  void clearBankNo() => $_clearField(11);

  @$pb.TagNumber(12)
  $pb.PbList<$core.String> get workExpUrl => $_getList(11);

  @$pb.TagNumber(13)
  $core.String get mayaId => $_getSZ(12);
  @$pb.TagNumber(13)
  set mayaId($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasMayaId() => $_has(12);
  @$pb.TagNumber(13)
  void clearMayaId() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.bool get includeGemSettlement => $_getBF(13);
  @$pb.TagNumber(14)
  set includeGemSettlement($core.bool value) => $_setBool(13, value);
  @$pb.TagNumber(14)
  $core.bool hasIncludeGemSettlement() => $_has(13);
  @$pb.TagNumber(14)
  void clearIncludeGemSettlement() => $_clearField(14);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

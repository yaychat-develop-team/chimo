// This is a generated file - do not edit.
//
// Generated from server_client/user.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'account_bind.pb.dart' as $3;
import 'base.pb.dart' as $1;
import 'common/car.pb.dart' as $2;
import 'gs_train_group.pb.dart' as $0;
import 'rtc.pb.dart' as $4;
import 'user.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'user.pbenum.dart';

class CompanionResp extends $pb.GeneratedMessage {
  factory CompanionResp({
    $core.bool? ok,
  }) {
    final result = create();
    if (ok != null) result.ok = ok;
    return result;
  }

  CompanionResp._();

  factory CompanionResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'ok')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionResp copyWith(void Function(CompanionResp) updates) =>
      super.copyWith((message) => updates(message as CompanionResp))
          as CompanionResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionResp create() => CompanionResp._();
  @$core.override
  CompanionResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionResp>(create);
  static CompanionResp? _defaultInstance;

  /// *
  /// true = 是
  @$pb.TagNumber(1)
  $core.bool get ok => $_getBF(0);
  @$pb.TagNumber(1)
  set ok($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => $_clearField(1);
}

class ConfResp extends $pb.GeneratedMessage {
  factory ConfResp({
    $core.bool? magicV,
    $core.bool? cold,
    $core.int? videoMills,
    $core.bool? useHttp2,
    $core.bool? disableShanmeng,
    $core.String? gsTaskUrl,
    $core.bool? showInviteCode,
    $core.String? gsVerifyUrl,
    $core.int? disableLogan,
    $core.String? gsTrainTaskUrl,
    $core.String? gsGuideUrl,
    $core.int? faceCheckCount,
    $core.String? crystalGameUrl,
    $core.bool? showCrystalGame,
    $core.bool? showGsInvite,
    $core.Iterable<$0.GsTrainGuideInfo>? trainGuideList,
    $core.int? userCount,
    $core.int? disableAdjust,
    $core.String? gsConversionUrl,
    $core.bool? freeJoinFleet,
    $core.int? tabType,
    $fixnum.Int64? unlockCardPrice,
    $1.AdTrackConfig? adTrackConfig,
    $1.TaConfig? taConfig,
    $core.int? sudGameSwitch,
    $core.Iterable<$core.String>? spamWords,
    $1.ImConfig? imConfig,
    $fixnum.Int64? feedbackUid,
    $core.String? feedbackEmUsername,
    $core.Iterable<$core.int>? showAppIds,
    $core.bool? enableTencentIm,
    $core.bool? enableEasemobWrite,
    $core.bool? enableTencentWrite,
  }) {
    final result = create();
    if (magicV != null) result.magicV = magicV;
    if (cold != null) result.cold = cold;
    if (videoMills != null) result.videoMills = videoMills;
    if (useHttp2 != null) result.useHttp2 = useHttp2;
    if (disableShanmeng != null) result.disableShanmeng = disableShanmeng;
    if (gsTaskUrl != null) result.gsTaskUrl = gsTaskUrl;
    if (showInviteCode != null) result.showInviteCode = showInviteCode;
    if (gsVerifyUrl != null) result.gsVerifyUrl = gsVerifyUrl;
    if (disableLogan != null) result.disableLogan = disableLogan;
    if (gsTrainTaskUrl != null) result.gsTrainTaskUrl = gsTrainTaskUrl;
    if (gsGuideUrl != null) result.gsGuideUrl = gsGuideUrl;
    if (faceCheckCount != null) result.faceCheckCount = faceCheckCount;
    if (crystalGameUrl != null) result.crystalGameUrl = crystalGameUrl;
    if (showCrystalGame != null) result.showCrystalGame = showCrystalGame;
    if (showGsInvite != null) result.showGsInvite = showGsInvite;
    if (trainGuideList != null) result.trainGuideList.addAll(trainGuideList);
    if (userCount != null) result.userCount = userCount;
    if (disableAdjust != null) result.disableAdjust = disableAdjust;
    if (gsConversionUrl != null) result.gsConversionUrl = gsConversionUrl;
    if (freeJoinFleet != null) result.freeJoinFleet = freeJoinFleet;
    if (tabType != null) result.tabType = tabType;
    if (unlockCardPrice != null) result.unlockCardPrice = unlockCardPrice;
    if (adTrackConfig != null) result.adTrackConfig = adTrackConfig;
    if (taConfig != null) result.taConfig = taConfig;
    if (sudGameSwitch != null) result.sudGameSwitch = sudGameSwitch;
    if (spamWords != null) result.spamWords.addAll(spamWords);
    if (imConfig != null) result.imConfig = imConfig;
    if (feedbackUid != null) result.feedbackUid = feedbackUid;
    if (feedbackEmUsername != null)
      result.feedbackEmUsername = feedbackEmUsername;
    if (showAppIds != null) result.showAppIds.addAll(showAppIds);
    if (enableTencentIm != null) result.enableTencentIm = enableTencentIm;
    if (enableEasemobWrite != null)
      result.enableEasemobWrite = enableEasemobWrite;
    if (enableTencentWrite != null)
      result.enableTencentWrite = enableTencentWrite;
    return result;
  }

  ConfResp._();

  factory ConfResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConfResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConfResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'magicV')
    ..aOB(2, _omitFieldNames ? '' : 'cold')
    ..aI(3, _omitFieldNames ? '' : 'videoMills', fieldType: $pb.PbFieldType.OU3)
    ..aOB(4, _omitFieldNames ? '' : 'useHttp2')
    ..aOB(5, _omitFieldNames ? '' : 'disableShanmeng')
    ..aOS(6, _omitFieldNames ? '' : 'gsTaskUrl')
    ..aOB(7, _omitFieldNames ? '' : 'showInviteCode')
    ..aOS(8, _omitFieldNames ? '' : 'gsVerifyUrl')
    ..aI(9, _omitFieldNames ? '' : 'disableLogan',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(10, _omitFieldNames ? '' : 'gsTrainTaskUrl')
    ..aOS(11, _omitFieldNames ? '' : 'gsGuideUrl')
    ..aI(12, _omitFieldNames ? '' : 'faceCheckCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(13, _omitFieldNames ? '' : 'crystalGameUrl')
    ..aOB(14, _omitFieldNames ? '' : 'showCrystalGame')
    ..aOB(15, _omitFieldNames ? '' : 'showGsInvite')
    ..pPM<$0.GsTrainGuideInfo>(16, _omitFieldNames ? '' : 'trainGuideList',
        subBuilder: $0.GsTrainGuideInfo.create)
    ..aI(17, _omitFieldNames ? '' : 'userCount', fieldType: $pb.PbFieldType.OU3)
    ..aI(18, _omitFieldNames ? '' : 'disableAdjust',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(19, _omitFieldNames ? '' : 'gsConversionUrl')
    ..aOB(20, _omitFieldNames ? '' : 'freeJoinFleet')
    ..aI(21, _omitFieldNames ? '' : 'tabType', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(22, _omitFieldNames ? '' : 'unlockCardPrice')
    ..aOM<$1.AdTrackConfig>(23, _omitFieldNames ? '' : 'adTrackConfig',
        subBuilder: $1.AdTrackConfig.create)
    ..aOM<$1.TaConfig>(24, _omitFieldNames ? '' : 'taConfig',
        subBuilder: $1.TaConfig.create)
    ..aI(25, _omitFieldNames ? '' : 'sudGameSwitch',
        fieldType: $pb.PbFieldType.OU3)
    ..pPS(26, _omitFieldNames ? '' : 'spamWords')
    ..aOM<$1.ImConfig>(27, _omitFieldNames ? '' : 'imConfig',
        subBuilder: $1.ImConfig.create)
    ..aInt64(28, _omitFieldNames ? '' : 'feedbackUid')
    ..aOS(29, _omitFieldNames ? '' : 'feedbackEmUsername')
    ..p<$core.int>(30, _omitFieldNames ? '' : 'showAppIds', $pb.PbFieldType.KU3)
    ..aOB(31, _omitFieldNames ? '' : 'enableTencentIm')
    ..aOB(32, _omitFieldNames ? '' : 'enableEasemobWrite')
    ..aOB(33, _omitFieldNames ? '' : 'enableTencentWrite')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfResp copyWith(void Function(ConfResp) updates) =>
      super.copyWith((message) => updates(message as ConfResp)) as ConfResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfResp create() => ConfResp._();
  @$core.override
  ConfResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConfResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfResp>(create);
  static ConfResp? _defaultInstance;

  /// *
  /// 是否 ture = 是
  @$pb.TagNumber(1)
  $core.bool get magicV => $_getBF(0);
  @$pb.TagNumber(1)
  set magicV($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMagicV() => $_has(0);
  @$pb.TagNumber(1)
  void clearMagicV() => $_clearField(1);

  /// *
  /// 是否冷启动 ture = 是
  @$pb.TagNumber(2)
  $core.bool get cold => $_getBF(1);
  @$pb.TagNumber(2)
  set cold($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCold() => $_has(1);
  @$pb.TagNumber(2)
  void clearCold() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get videoMills => $_getIZ(2);
  @$pb.TagNumber(3)
  set videoMills($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVideoMills() => $_has(2);
  @$pb.TagNumber(3)
  void clearVideoMills() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get useHttp2 => $_getBF(3);
  @$pb.TagNumber(4)
  set useHttp2($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUseHttp2() => $_has(3);
  @$pb.TagNumber(4)
  void clearUseHttp2() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get disableShanmeng => $_getBF(4);
  @$pb.TagNumber(5)
  set disableShanmeng($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDisableShanmeng() => $_has(4);
  @$pb.TagNumber(5)
  void clearDisableShanmeng() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get gsTaskUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set gsTaskUrl($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGsTaskUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearGsTaskUrl() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get showInviteCode => $_getBF(6);
  @$pb.TagNumber(7)
  set showInviteCode($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasShowInviteCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearShowInviteCode() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get gsVerifyUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set gsVerifyUrl($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasGsVerifyUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearGsVerifyUrl() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get disableLogan => $_getIZ(8);
  @$pb.TagNumber(9)
  set disableLogan($core.int value) => $_setUnsignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDisableLogan() => $_has(8);
  @$pb.TagNumber(9)
  void clearDisableLogan() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get gsTrainTaskUrl => $_getSZ(9);
  @$pb.TagNumber(10)
  set gsTrainTaskUrl($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasGsTrainTaskUrl() => $_has(9);
  @$pb.TagNumber(10)
  void clearGsTrainTaskUrl() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get gsGuideUrl => $_getSZ(10);
  @$pb.TagNumber(11)
  set gsGuideUrl($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasGsGuideUrl() => $_has(10);
  @$pb.TagNumber(11)
  void clearGsGuideUrl() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get faceCheckCount => $_getIZ(11);
  @$pb.TagNumber(12)
  set faceCheckCount($core.int value) => $_setUnsignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasFaceCheckCount() => $_has(11);
  @$pb.TagNumber(12)
  void clearFaceCheckCount() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get crystalGameUrl => $_getSZ(12);
  @$pb.TagNumber(13)
  set crystalGameUrl($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasCrystalGameUrl() => $_has(12);
  @$pb.TagNumber(13)
  void clearCrystalGameUrl() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.bool get showCrystalGame => $_getBF(13);
  @$pb.TagNumber(14)
  set showCrystalGame($core.bool value) => $_setBool(13, value);
  @$pb.TagNumber(14)
  $core.bool hasShowCrystalGame() => $_has(13);
  @$pb.TagNumber(14)
  void clearShowCrystalGame() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.bool get showGsInvite => $_getBF(14);
  @$pb.TagNumber(15)
  set showGsInvite($core.bool value) => $_setBool(14, value);
  @$pb.TagNumber(15)
  $core.bool hasShowGsInvite() => $_has(14);
  @$pb.TagNumber(15)
  void clearShowGsInvite() => $_clearField(15);

  @$pb.TagNumber(16)
  $pb.PbList<$0.GsTrainGuideInfo> get trainGuideList => $_getList(15);

  @$pb.TagNumber(17)
  $core.int get userCount => $_getIZ(16);
  @$pb.TagNumber(17)
  set userCount($core.int value) => $_setUnsignedInt32(16, value);
  @$pb.TagNumber(17)
  $core.bool hasUserCount() => $_has(16);
  @$pb.TagNumber(17)
  void clearUserCount() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.int get disableAdjust => $_getIZ(17);
  @$pb.TagNumber(18)
  set disableAdjust($core.int value) => $_setUnsignedInt32(17, value);
  @$pb.TagNumber(18)
  $core.bool hasDisableAdjust() => $_has(17);
  @$pb.TagNumber(18)
  void clearDisableAdjust() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.String get gsConversionUrl => $_getSZ(18);
  @$pb.TagNumber(19)
  set gsConversionUrl($core.String value) => $_setString(18, value);
  @$pb.TagNumber(19)
  $core.bool hasGsConversionUrl() => $_has(18);
  @$pb.TagNumber(19)
  void clearGsConversionUrl() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.bool get freeJoinFleet => $_getBF(19);
  @$pb.TagNumber(20)
  set freeJoinFleet($core.bool value) => $_setBool(19, value);
  @$pb.TagNumber(20)
  $core.bool hasFreeJoinFleet() => $_has(19);
  @$pb.TagNumber(20)
  void clearFreeJoinFleet() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.int get tabType => $_getIZ(20);
  @$pb.TagNumber(21)
  set tabType($core.int value) => $_setUnsignedInt32(20, value);
  @$pb.TagNumber(21)
  $core.bool hasTabType() => $_has(20);
  @$pb.TagNumber(21)
  void clearTabType() => $_clearField(21);

  @$pb.TagNumber(22)
  $fixnum.Int64 get unlockCardPrice => $_getI64(21);
  @$pb.TagNumber(22)
  set unlockCardPrice($fixnum.Int64 value) => $_setInt64(21, value);
  @$pb.TagNumber(22)
  $core.bool hasUnlockCardPrice() => $_has(21);
  @$pb.TagNumber(22)
  void clearUnlockCardPrice() => $_clearField(22);

  @$pb.TagNumber(23)
  $1.AdTrackConfig get adTrackConfig => $_getN(22);
  @$pb.TagNumber(23)
  set adTrackConfig($1.AdTrackConfig value) => $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasAdTrackConfig() => $_has(22);
  @$pb.TagNumber(23)
  void clearAdTrackConfig() => $_clearField(23);
  @$pb.TagNumber(23)
  $1.AdTrackConfig ensureAdTrackConfig() => $_ensure(22);

  @$pb.TagNumber(24)
  $1.TaConfig get taConfig => $_getN(23);
  @$pb.TagNumber(24)
  set taConfig($1.TaConfig value) => $_setField(24, value);
  @$pb.TagNumber(24)
  $core.bool hasTaConfig() => $_has(23);
  @$pb.TagNumber(24)
  void clearTaConfig() => $_clearField(24);
  @$pb.TagNumber(24)
  $1.TaConfig ensureTaConfig() => $_ensure(23);

  @$pb.TagNumber(25)
  $core.int get sudGameSwitch => $_getIZ(24);
  @$pb.TagNumber(25)
  set sudGameSwitch($core.int value) => $_setUnsignedInt32(24, value);
  @$pb.TagNumber(25)
  $core.bool hasSudGameSwitch() => $_has(24);
  @$pb.TagNumber(25)
  void clearSudGameSwitch() => $_clearField(25);

  @$pb.TagNumber(26)
  $pb.PbList<$core.String> get spamWords => $_getList(25);

  @$pb.TagNumber(27)
  $1.ImConfig get imConfig => $_getN(26);
  @$pb.TagNumber(27)
  set imConfig($1.ImConfig value) => $_setField(27, value);
  @$pb.TagNumber(27)
  $core.bool hasImConfig() => $_has(26);
  @$pb.TagNumber(27)
  void clearImConfig() => $_clearField(27);
  @$pb.TagNumber(27)
  $1.ImConfig ensureImConfig() => $_ensure(26);

  @$pb.TagNumber(28)
  $fixnum.Int64 get feedbackUid => $_getI64(27);
  @$pb.TagNumber(28)
  set feedbackUid($fixnum.Int64 value) => $_setInt64(27, value);
  @$pb.TagNumber(28)
  $core.bool hasFeedbackUid() => $_has(27);
  @$pb.TagNumber(28)
  void clearFeedbackUid() => $_clearField(28);

  @$pb.TagNumber(29)
  $core.String get feedbackEmUsername => $_getSZ(28);
  @$pb.TagNumber(29)
  set feedbackEmUsername($core.String value) => $_setString(28, value);
  @$pb.TagNumber(29)
  $core.bool hasFeedbackEmUsername() => $_has(28);
  @$pb.TagNumber(29)
  void clearFeedbackEmUsername() => $_clearField(29);

  @$pb.TagNumber(30)
  $pb.PbList<$core.int> get showAppIds => $_getList(29);

  @$pb.TagNumber(31)
  $core.bool get enableTencentIm => $_getBF(30);
  @$pb.TagNumber(31)
  set enableTencentIm($core.bool value) => $_setBool(30, value);
  @$pb.TagNumber(31)
  $core.bool hasEnableTencentIm() => $_has(30);
  @$pb.TagNumber(31)
  void clearEnableTencentIm() => $_clearField(31);

  @$pb.TagNumber(32)
  $core.bool get enableEasemobWrite => $_getBF(31);
  @$pb.TagNumber(32)
  set enableEasemobWrite($core.bool value) => $_setBool(31, value);
  @$pb.TagNumber(32)
  $core.bool hasEnableEasemobWrite() => $_has(31);
  @$pb.TagNumber(32)
  void clearEnableEasemobWrite() => $_clearField(32);

  @$pb.TagNumber(33)
  $core.bool get enableTencentWrite => $_getBF(32);
  @$pb.TagNumber(33)
  set enableTencentWrite($core.bool value) => $_setBool(32, value);
  @$pb.TagNumber(33)
  $core.bool hasEnableTencentWrite() => $_has(32);
  @$pb.TagNumber(33)
  void clearEnableTencentWrite() => $_clearField(33);
}

class SendMsgNoCarCheckReq extends $pb.GeneratedMessage {
  factory SendMsgNoCarCheckReq({
    $fixnum.Int64? toUserId,
  }) {
    final result = create();
    if (toUserId != null) result.toUserId = toUserId;
    return result;
  }

  SendMsgNoCarCheckReq._();

  factory SendMsgNoCarCheckReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendMsgNoCarCheckReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendMsgNoCarCheckReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'toUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendMsgNoCarCheckReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendMsgNoCarCheckReq copyWith(void Function(SendMsgNoCarCheckReq) updates) =>
      super.copyWith((message) => updates(message as SendMsgNoCarCheckReq))
          as SendMsgNoCarCheckReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendMsgNoCarCheckReq create() => SendMsgNoCarCheckReq._();
  @$core.override
  SendMsgNoCarCheckReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendMsgNoCarCheckReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendMsgNoCarCheckReq>(create);
  static SendMsgNoCarCheckReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get toUserId => $_getI64(0);
  @$pb.TagNumber(1)
  set toUserId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUserId() => $_clearField(1);
}

class SendMsgNoCarCheckResp extends $pb.GeneratedMessage {
  factory SendMsgNoCarCheckResp({
    $core.bool? ok,
  }) {
    final result = create();
    if (ok != null) result.ok = ok;
    return result;
  }

  SendMsgNoCarCheckResp._();

  factory SendMsgNoCarCheckResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendMsgNoCarCheckResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendMsgNoCarCheckResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'ok')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendMsgNoCarCheckResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendMsgNoCarCheckResp copyWith(
          void Function(SendMsgNoCarCheckResp) updates) =>
      super.copyWith((message) => updates(message as SendMsgNoCarCheckResp))
          as SendMsgNoCarCheckResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendMsgNoCarCheckResp create() => SendMsgNoCarCheckResp._();
  @$core.override
  SendMsgNoCarCheckResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendMsgNoCarCheckResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendMsgNoCarCheckResp>(create);
  static SendMsgNoCarCheckResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get ok => $_getBF(0);
  @$pb.TagNumber(1)
  set ok($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => $_clearField(1);
}

class UserOpenReq extends $pb.GeneratedMessage {
  factory UserOpenReq({
    $core.bool? open,
    $fixnum.Int64? timestamp,
  }) {
    final result = create();
    if (open != null) result.open = open;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  UserOpenReq._();

  factory UserOpenReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserOpenReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserOpenReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'open')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'timestamp', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserOpenReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserOpenReq copyWith(void Function(UserOpenReq) updates) =>
      super.copyWith((message) => updates(message as UserOpenReq))
          as UserOpenReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserOpenReq create() => UserOpenReq._();
  @$core.override
  UserOpenReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserOpenReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserOpenReq>(create);
  static UserOpenReq? _defaultInstance;

  /// *
  /// true = 打开
  /// false = 挂在后台后台 or 杀掉app
  @$pb.TagNumber(1)
  $core.bool get open => $_getBF(0);
  @$pb.TagNumber(1)
  set open($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOpen() => $_has(0);
  @$pb.TagNumber(1)
  void clearOpen() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestamp => $_getI64(1);
  @$pb.TagNumber(2)
  set timestamp($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => $_clearField(2);
}

class UserOpenResp extends $pb.GeneratedMessage {
  factory UserOpenResp({
    $core.bool? success,
    $core.String? message,
    UserOpenData? data,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (data != null) result.data = data;
    return result;
  }

  UserOpenResp._();

  factory UserOpenResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserOpenResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserOpenResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<UserOpenData>(3, _omitFieldNames ? '' : 'data',
        subBuilder: UserOpenData.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserOpenResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserOpenResp copyWith(void Function(UserOpenResp) updates) =>
      super.copyWith((message) => updates(message as UserOpenResp))
          as UserOpenResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserOpenResp create() => UserOpenResp._();
  @$core.override
  UserOpenResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserOpenResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserOpenResp>(create);
  static UserOpenResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  UserOpenData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(UserOpenData value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);
  @$pb.TagNumber(3)
  UserOpenData ensureData() => $_ensure(2);
}

class UserOpenData extends $pb.GeneratedMessage {
  factory UserOpenData({
    UserOpenAgent? agent,
  }) {
    final result = create();
    if (agent != null) result.agent = agent;
    return result;
  }

  UserOpenData._();

  factory UserOpenData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserOpenData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserOpenData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOM<UserOpenAgent>(1, _omitFieldNames ? '' : 'agent',
        subBuilder: UserOpenAgent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserOpenData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserOpenData copyWith(void Function(UserOpenData) updates) =>
      super.copyWith((message) => updates(message as UserOpenData))
          as UserOpenData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserOpenData create() => UserOpenData._();
  @$core.override
  UserOpenData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserOpenData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserOpenData>(create);
  static UserOpenData? _defaultInstance;

  /// *
  ///  Agent业务数据
  @$pb.TagNumber(1)
  UserOpenAgent get agent => $_getN(0);
  @$pb.TagNumber(1)
  set agent(UserOpenAgent value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAgent() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgent() => $_clearField(1);
  @$pb.TagNumber(1)
  UserOpenAgent ensureAgent() => $_ensure(0);
}

class UserOpenAgent extends $pb.GeneratedMessage {
  factory UserOpenAgent({
    $core.bool? workHub,
    $core.int? workState,
  }) {
    final result = create();
    if (workHub != null) result.workHub = workHub;
    if (workState != null) result.workState = workState;
    return result;
  }

  UserOpenAgent._();

  factory UserOpenAgent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserOpenAgent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserOpenAgent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'workHub')
    ..aI(2, _omitFieldNames ? '' : 'workState', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserOpenAgent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserOpenAgent copyWith(void Function(UserOpenAgent) updates) =>
      super.copyWith((message) => updates(message as UserOpenAgent))
          as UserOpenAgent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserOpenAgent create() => UserOpenAgent._();
  @$core.override
  UserOpenAgent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserOpenAgent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserOpenAgent>(create);
  static UserOpenAgent? _defaultInstance;

  /// *
  ///  Agent系统:
  ///   全局Agent工作台悬浮入口是否显示(true显示, false不显示)
  @$pb.TagNumber(1)
  $core.bool get workHub => $_getBF(0);
  @$pb.TagNumber(1)
  set workHub($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkHub() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkHub() => $_clearField(1);

  /// *
  ///  Agent系统:
  ///   Agent抢的档期状态(0默认, 1即将上档, 2上档中, 3暂离)
  ///   若服务端该字段返回的值非0~3, 移动端当前版本可显示为 0默认, 预防将来要扩展类型避免翻车
  @$pb.TagNumber(2)
  $core.int get workState => $_getIZ(1);
  @$pb.TagNumber(2)
  set workState($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWorkState() => $_has(1);
  @$pb.TagNumber(2)
  void clearWorkState() => $_clearField(2);
}

class DeleteVisitRecordReq extends $pb.GeneratedMessage {
  factory DeleteVisitRecordReq({
    $fixnum.Int64? visitorId,
  }) {
    final result = create();
    if (visitorId != null) result.visitorId = visitorId;
    return result;
  }

  DeleteVisitRecordReq._();

  factory DeleteVisitRecordReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteVisitRecordReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteVisitRecordReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'visitorId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteVisitRecordReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteVisitRecordReq copyWith(void Function(DeleteVisitRecordReq) updates) =>
      super.copyWith((message) => updates(message as DeleteVisitRecordReq))
          as DeleteVisitRecordReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteVisitRecordReq create() => DeleteVisitRecordReq._();
  @$core.override
  DeleteVisitRecordReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteVisitRecordReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteVisitRecordReq>(create);
  static DeleteVisitRecordReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get visitorId => $_getI64(0);
  @$pb.TagNumber(1)
  set visitorId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVisitorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearVisitorId() => $_clearField(1);
}

class MakeFriendLabelReq extends $pb.GeneratedMessage {
  factory MakeFriendLabelReq({
    $core.Iterable<$fixnum.Int64>? id,
  }) {
    final result = create();
    if (id != null) result.id.addAll(id);
    return result;
  }

  MakeFriendLabelReq._();

  factory MakeFriendLabelReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MakeFriendLabelReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MakeFriendLabelReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.K6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MakeFriendLabelReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MakeFriendLabelReq copyWith(void Function(MakeFriendLabelReq) updates) =>
      super.copyWith((message) => updates(message as MakeFriendLabelReq))
          as MakeFriendLabelReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MakeFriendLabelReq create() => MakeFriendLabelReq._();
  @$core.override
  MakeFriendLabelReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MakeFriendLabelReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MakeFriendLabelReq>(create);
  static MakeFriendLabelReq? _defaultInstance;

  /// *
  /// 交友心愿标签id
  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get id => $_getList(0);
}

class MakeFriendLabelResp extends $pb.GeneratedMessage {
  factory MakeFriendLabelResp({
    $core.Iterable<MakeFriendLabelRespEntry>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  MakeFriendLabelResp._();

  factory MakeFriendLabelResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MakeFriendLabelResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MakeFriendLabelResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..pPM<MakeFriendLabelRespEntry>(1, _omitFieldNames ? '' : 'list',
        subBuilder: MakeFriendLabelRespEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MakeFriendLabelResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MakeFriendLabelResp copyWith(void Function(MakeFriendLabelResp) updates) =>
      super.copyWith((message) => updates(message as MakeFriendLabelResp))
          as MakeFriendLabelResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MakeFriendLabelResp create() => MakeFriendLabelResp._();
  @$core.override
  MakeFriendLabelResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MakeFriendLabelResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MakeFriendLabelResp>(create);
  static MakeFriendLabelResp? _defaultInstance;

  /// *
  /// 交友心愿标签id
  @$pb.TagNumber(1)
  $pb.PbList<MakeFriendLabelRespEntry> get list => $_getList(0);
}

class MakeFriendLabelRespEntry extends $pb.GeneratedMessage {
  factory MakeFriendLabelRespEntry({
    $fixnum.Int64? id,
    $core.String? name,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    return result;
  }

  MakeFriendLabelRespEntry._();

  factory MakeFriendLabelRespEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MakeFriendLabelRespEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MakeFriendLabelRespEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MakeFriendLabelRespEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MakeFriendLabelRespEntry copyWith(
          void Function(MakeFriendLabelRespEntry) updates) =>
      super.copyWith((message) => updates(message as MakeFriendLabelRespEntry))
          as MakeFriendLabelRespEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MakeFriendLabelRespEntry create() => MakeFriendLabelRespEntry._();
  @$core.override
  MakeFriendLabelRespEntry createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MakeFriendLabelRespEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MakeFriendLabelRespEntry>(create);
  static MakeFriendLabelRespEntry? _defaultInstance;

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
}

class CheckPicResp extends $pb.GeneratedMessage {
  factory CheckPicResp({
    $core.bool? ok,
  }) {
    final result = create();
    if (ok != null) result.ok = ok;
    return result;
  }

  CheckPicResp._();

  factory CheckPicResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckPicResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckPicResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'ok')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPicResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPicResp copyWith(void Function(CheckPicResp) updates) =>
      super.copyWith((message) => updates(message as CheckPicResp))
          as CheckPicResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckPicResp create() => CheckPicResp._();
  @$core.override
  CheckPicResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckPicResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckPicResp>(create);
  static CheckPicResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get ok => $_getBF(0);
  @$pb.TagNumber(1)
  set ok($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => $_clearField(1);
}

class UserIdCardResp extends $pb.GeneratedMessage {
  factory UserIdCardResp({
    $core.String? name,
    $core.String? idCard,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (idCard != null) result.idCard = idCard;
    return result;
  }

  UserIdCardResp._();

  factory UserIdCardResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserIdCardResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserIdCardResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'idCard')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserIdCardResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserIdCardResp copyWith(void Function(UserIdCardResp) updates) =>
      super.copyWith((message) => updates(message as UserIdCardResp))
          as UserIdCardResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserIdCardResp create() => UserIdCardResp._();
  @$core.override
  UserIdCardResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserIdCardResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserIdCardResp>(create);
  static UserIdCardResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get idCard => $_getSZ(1);
  @$pb.TagNumber(2)
  set idCard($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdCard() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdCard() => $_clearField(2);
}

class AuditItem extends $pb.GeneratedMessage {
  factory AuditItem({
    $core.String? content,
    $core.bool? ok,
  }) {
    final result = create();
    if (content != null) result.content = content;
    if (ok != null) result.ok = ok;
    return result;
  }

  AuditItem._();

  factory AuditItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuditItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuditItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..aOB(2, _omitFieldNames ? '' : 'ok')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuditItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuditItem copyWith(void Function(AuditItem) updates) =>
      super.copyWith((message) => updates(message as AuditItem)) as AuditItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuditItem create() => AuditItem._();
  @$core.override
  AuditItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuditItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuditItem>(create);
  static AuditItem? _defaultInstance;

  /// *
  /// 内容
  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);

  /// *
  /// 审核是否通过
  /// true = 通过
  @$pb.TagNumber(2)
  $core.bool get ok => $_getBF(1);
  @$pb.TagNumber(2)
  set ok($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOk() => $_has(1);
  @$pb.TagNumber(2)
  void clearOk() => $_clearField(2);
}

class User extends $pb.GeneratedMessage {
  factory User({
    $core.String? birthday,
    $core.int? fanNum,
    $core.int? followNum,
    $core.int? friendNum,
    $core.String? friendWish,
    $core.String? gender,
    $fixnum.Int64? id,
    $1.Job? job,
    $core.String? nickname,
    $core.String? personalSignature,
    $core.Iterable<AuditItem>? picList,
    $core.String? title,
    $core.int? vipLevel,
    $core.String? voice,
    $core.String? avatar,
    $core.String? emUsername,
    $core.String? emPwd,
    $1.RelationType? relationType,
    $core.String? location,
    $core.int? weight,
    $core.int? height,
    $core.int? viewNum,
    $fixnum.Int64? gsGroupId,
    $2.UserCar? car,
    $core.int? voiceDuration,
    $core.int? onlineStatus,
    ChannelInfo? currentChannel,
    $core.int? moreExpForNextLevel,
    $fixnum.Int64? intimacyValue,
    $core.bool? clubManager,
    $fixnum.Int64? experience,
    $1.UserVipLevelIcons? icons,
    $core.bool? superAdmin,
    $fixnum.Int64? totalExperience,
    $fixnum.Int64? newFriendCount,
    $fixnum.Int64? newFollowerCount,
    $fixnum.Int64? newVisitorCount,
    $core.Iterable<$2.UserCar>? cars,
    $core.Iterable<$core.String>? makeFriendsLabel,
    $core.bool? isYourInBlackList,
    $core.bool? isHeInYourBlackList,
    $fixnum.Int64? createTime,
    $core.int? age,
    $core.String? phone,
    $core.String? nicknameAudit,
    $core.String? personalSignatureAudit,
    $core.String? voiceAudit,
    $core.int? days,
    $core.String? avatarAudit,
    $fixnum.Int64? bannedPrivateEndTime,
    $core.Iterable<$2.UserCarCard>? carCardList,
    $core.bool? openedBlindBox,
    $core.bool? isLeader,
    $core.bool? isCompanion,
    $core.bool? isBroker,
    $core.bool? isHost,
    $fixnum.Int64? brokerId,
    $fixnum.Int64? leaderId,
    $core.bool? realNameAuthResult,
    $core.Iterable<$core.String>? tags,
    $core.String? inviteCodeEntrance,
    $core.bool? isShowNumCard,
    MessageGroup? messageGroup,
    $core.String? groupInfoUrl,
    $core.String? joinGroupUrl,
    $core.int? joinGroupStatus,
    $core.bool? isSpamUser,
    $core.String? gsWorkbenchUrl,
    $core.bool? isHidden,
    $fixnum.Int64? latestOnlineTime,
    $core.int? riskLevel,
    $core.int? knightLevel,
    $core.String? usedInfoCard,
    $core.String? knightIcon,
    $core.bool? bot,
    $core.double? intimacyPercent,
    $core.String? email,
    $core.String? country,
    $core.String? groupType,
    $core.bool? accessStrangerMessage,
    $core.String? picFrame,
    $core.String? micHalo,
    $core.String? chatBubble,
    $core.String? luckyBuff,
    $core.String? channelName,
    $fixnum.Int64? channelId,
    $core.String? inviteCode,
    $fixnum.Int64? inviteCodeId,
    $core.int? maxCarLevel,
    $core.bool? isGs,
    $fixnum.Int64? coin,
    $fixnum.Int64? fleetId,
    $core.int? quickHiStage,
    $core.String? heartLinkRole,
    $core.int? heartLinkCardStatus,
    $core.String? cardDynamicResource,
    $core.bool? isKaUser,
    $core.bool? isRegister,
    $core.int? coupleRelationLevel,
    $core.Iterable<$core.String>? nicknameColor,
    $core.bool? isPinned,
    $3.AccountBindings? accountBindings,
  }) {
    final result = create();
    if (birthday != null) result.birthday = birthday;
    if (fanNum != null) result.fanNum = fanNum;
    if (followNum != null) result.followNum = followNum;
    if (friendNum != null) result.friendNum = friendNum;
    if (friendWish != null) result.friendWish = friendWish;
    if (gender != null) result.gender = gender;
    if (id != null) result.id = id;
    if (job != null) result.job = job;
    if (nickname != null) result.nickname = nickname;
    if (personalSignature != null) result.personalSignature = personalSignature;
    if (picList != null) result.picList.addAll(picList);
    if (title != null) result.title = title;
    if (vipLevel != null) result.vipLevel = vipLevel;
    if (voice != null) result.voice = voice;
    if (avatar != null) result.avatar = avatar;
    if (emUsername != null) result.emUsername = emUsername;
    if (emPwd != null) result.emPwd = emPwd;
    if (relationType != null) result.relationType = relationType;
    if (location != null) result.location = location;
    if (weight != null) result.weight = weight;
    if (height != null) result.height = height;
    if (viewNum != null) result.viewNum = viewNum;
    if (gsGroupId != null) result.gsGroupId = gsGroupId;
    if (car != null) result.car = car;
    if (voiceDuration != null) result.voiceDuration = voiceDuration;
    if (onlineStatus != null) result.onlineStatus = onlineStatus;
    if (currentChannel != null) result.currentChannel = currentChannel;
    if (moreExpForNextLevel != null)
      result.moreExpForNextLevel = moreExpForNextLevel;
    if (intimacyValue != null) result.intimacyValue = intimacyValue;
    if (clubManager != null) result.clubManager = clubManager;
    if (experience != null) result.experience = experience;
    if (icons != null) result.icons = icons;
    if (superAdmin != null) result.superAdmin = superAdmin;
    if (totalExperience != null) result.totalExperience = totalExperience;
    if (newFriendCount != null) result.newFriendCount = newFriendCount;
    if (newFollowerCount != null) result.newFollowerCount = newFollowerCount;
    if (newVisitorCount != null) result.newVisitorCount = newVisitorCount;
    if (cars != null) result.cars.addAll(cars);
    if (makeFriendsLabel != null)
      result.makeFriendsLabel.addAll(makeFriendsLabel);
    if (isYourInBlackList != null) result.isYourInBlackList = isYourInBlackList;
    if (isHeInYourBlackList != null)
      result.isHeInYourBlackList = isHeInYourBlackList;
    if (createTime != null) result.createTime = createTime;
    if (age != null) result.age = age;
    if (phone != null) result.phone = phone;
    if (nicknameAudit != null) result.nicknameAudit = nicknameAudit;
    if (personalSignatureAudit != null)
      result.personalSignatureAudit = personalSignatureAudit;
    if (voiceAudit != null) result.voiceAudit = voiceAudit;
    if (days != null) result.days = days;
    if (avatarAudit != null) result.avatarAudit = avatarAudit;
    if (bannedPrivateEndTime != null)
      result.bannedPrivateEndTime = bannedPrivateEndTime;
    if (carCardList != null) result.carCardList.addAll(carCardList);
    if (openedBlindBox != null) result.openedBlindBox = openedBlindBox;
    if (isLeader != null) result.isLeader = isLeader;
    if (isCompanion != null) result.isCompanion = isCompanion;
    if (isBroker != null) result.isBroker = isBroker;
    if (isHost != null) result.isHost = isHost;
    if (brokerId != null) result.brokerId = brokerId;
    if (leaderId != null) result.leaderId = leaderId;
    if (realNameAuthResult != null)
      result.realNameAuthResult = realNameAuthResult;
    if (tags != null) result.tags.addAll(tags);
    if (inviteCodeEntrance != null)
      result.inviteCodeEntrance = inviteCodeEntrance;
    if (isShowNumCard != null) result.isShowNumCard = isShowNumCard;
    if (messageGroup != null) result.messageGroup = messageGroup;
    if (groupInfoUrl != null) result.groupInfoUrl = groupInfoUrl;
    if (joinGroupUrl != null) result.joinGroupUrl = joinGroupUrl;
    if (joinGroupStatus != null) result.joinGroupStatus = joinGroupStatus;
    if (isSpamUser != null) result.isSpamUser = isSpamUser;
    if (gsWorkbenchUrl != null) result.gsWorkbenchUrl = gsWorkbenchUrl;
    if (isHidden != null) result.isHidden = isHidden;
    if (latestOnlineTime != null) result.latestOnlineTime = latestOnlineTime;
    if (riskLevel != null) result.riskLevel = riskLevel;
    if (knightLevel != null) result.knightLevel = knightLevel;
    if (usedInfoCard != null) result.usedInfoCard = usedInfoCard;
    if (knightIcon != null) result.knightIcon = knightIcon;
    if (bot != null) result.bot = bot;
    if (intimacyPercent != null) result.intimacyPercent = intimacyPercent;
    if (email != null) result.email = email;
    if (country != null) result.country = country;
    if (groupType != null) result.groupType = groupType;
    if (accessStrangerMessage != null)
      result.accessStrangerMessage = accessStrangerMessage;
    if (picFrame != null) result.picFrame = picFrame;
    if (micHalo != null) result.micHalo = micHalo;
    if (chatBubble != null) result.chatBubble = chatBubble;
    if (luckyBuff != null) result.luckyBuff = luckyBuff;
    if (channelName != null) result.channelName = channelName;
    if (channelId != null) result.channelId = channelId;
    if (inviteCode != null) result.inviteCode = inviteCode;
    if (inviteCodeId != null) result.inviteCodeId = inviteCodeId;
    if (maxCarLevel != null) result.maxCarLevel = maxCarLevel;
    if (isGs != null) result.isGs = isGs;
    if (coin != null) result.coin = coin;
    if (fleetId != null) result.fleetId = fleetId;
    if (quickHiStage != null) result.quickHiStage = quickHiStage;
    if (heartLinkRole != null) result.heartLinkRole = heartLinkRole;
    if (heartLinkCardStatus != null)
      result.heartLinkCardStatus = heartLinkCardStatus;
    if (cardDynamicResource != null)
      result.cardDynamicResource = cardDynamicResource;
    if (isKaUser != null) result.isKaUser = isKaUser;
    if (isRegister != null) result.isRegister = isRegister;
    if (coupleRelationLevel != null)
      result.coupleRelationLevel = coupleRelationLevel;
    if (nicknameColor != null) result.nicknameColor.addAll(nicknameColor);
    if (isPinned != null) result.isPinned = isPinned;
    if (accountBindings != null) result.accountBindings = accountBindings;
    return result;
  }

  User._();

  factory User.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory User.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'User',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'birthday')
    ..aI(2, _omitFieldNames ? '' : 'fanNum')
    ..aI(3, _omitFieldNames ? '' : 'followNum')
    ..aI(4, _omitFieldNames ? '' : 'friendNum')
    ..aOS(5, _omitFieldNames ? '' : 'friendWish')
    ..aOS(6, _omitFieldNames ? '' : 'gender')
    ..aInt64(7, _omitFieldNames ? '' : 'id')
    ..aE<$1.Job>(8, _omitFieldNames ? '' : 'job', enumValues: $1.Job.values)
    ..aOS(9, _omitFieldNames ? '' : 'nickname')
    ..aOS(10, _omitFieldNames ? '' : 'personalSignature')
    ..pPM<AuditItem>(11, _omitFieldNames ? '' : 'picList',
        subBuilder: AuditItem.create)
    ..aOS(12, _omitFieldNames ? '' : 'title')
    ..aI(13, _omitFieldNames ? '' : 'vipLevel')
    ..aOS(14, _omitFieldNames ? '' : 'voice')
    ..aOS(15, _omitFieldNames ? '' : 'avatar')
    ..aOS(16, _omitFieldNames ? '' : 'emUsername')
    ..aOS(17, _omitFieldNames ? '' : 'emPwd')
    ..aE<$1.RelationType>(18, _omitFieldNames ? '' : 'relationType',
        enumValues: $1.RelationType.values)
    ..aOS(19, _omitFieldNames ? '' : 'location')
    ..aI(20, _omitFieldNames ? '' : 'weight')
    ..aI(21, _omitFieldNames ? '' : 'height')
    ..aI(22, _omitFieldNames ? '' : 'viewNum')
    ..aInt64(23, _omitFieldNames ? '' : 'gsGroupId')
    ..aOM<$2.UserCar>(24, _omitFieldNames ? '' : 'car',
        subBuilder: $2.UserCar.create)
    ..aI(25, _omitFieldNames ? '' : 'voiceDuration')
    ..aI(26, _omitFieldNames ? '' : 'onlineStatus')
    ..aOM<ChannelInfo>(27, _omitFieldNames ? '' : 'currentChannel',
        subBuilder: ChannelInfo.create)
    ..aI(28, _omitFieldNames ? '' : 'moreExpForNextLevel')
    ..a<$fixnum.Int64>(
        29, _omitFieldNames ? '' : 'intimacyValue', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(30, _omitFieldNames ? '' : 'clubManager')
    ..aInt64(32, _omitFieldNames ? '' : 'experience')
    ..aOM<$1.UserVipLevelIcons>(33, _omitFieldNames ? '' : 'icons',
        subBuilder: $1.UserVipLevelIcons.create)
    ..aOB(34, _omitFieldNames ? '' : 'superAdmin')
    ..aInt64(35, _omitFieldNames ? '' : 'totalExperience')
    ..aInt64(36, _omitFieldNames ? '' : 'newFriendCount')
    ..aInt64(37, _omitFieldNames ? '' : 'newFollowerCount')
    ..aInt64(38, _omitFieldNames ? '' : 'newVisitorCount')
    ..pPM<$2.UserCar>(39, _omitFieldNames ? '' : 'cars',
        subBuilder: $2.UserCar.create)
    ..pPS(40, _omitFieldNames ? '' : 'makeFriendsLabel')
    ..aOB(41, _omitFieldNames ? '' : 'isYourInBlackList')
    ..aOB(42, _omitFieldNames ? '' : 'isHeInYourBlackList')
    ..aInt64(43, _omitFieldNames ? '' : 'createTime')
    ..aI(44, _omitFieldNames ? '' : 'age')
    ..aOS(45, _omitFieldNames ? '' : 'phone')
    ..aOS(46, _omitFieldNames ? '' : 'nicknameAudit')
    ..aOS(47, _omitFieldNames ? '' : 'personalSignatureAudit')
    ..aOS(48, _omitFieldNames ? '' : 'voiceAudit')
    ..aI(49, _omitFieldNames ? '' : 'days')
    ..aOS(50, _omitFieldNames ? '' : 'avatarAudit')
    ..aInt64(51, _omitFieldNames ? '' : 'bannedPrivateEndTime')
    ..pPM<$2.UserCarCard>(52, _omitFieldNames ? '' : 'carCardList',
        protoName: 'carCardList', subBuilder: $2.UserCarCard.create)
    ..aOB(53, _omitFieldNames ? '' : 'openedBlindBox')
    ..aOB(54, _omitFieldNames ? '' : 'isLeader')
    ..aOB(55, _omitFieldNames ? '' : 'isCompanion')
    ..aOB(56, _omitFieldNames ? '' : 'isBroker')
    ..aOB(57, _omitFieldNames ? '' : 'isHost')
    ..a<$fixnum.Int64>(
        58, _omitFieldNames ? '' : 'brokerId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        59, _omitFieldNames ? '' : 'leaderId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(60, _omitFieldNames ? '' : 'realNameAuthResult')
    ..pPS(61, _omitFieldNames ? '' : 'tags')
    ..aOS(62, _omitFieldNames ? '' : 'inviteCodeEntrance')
    ..aOB(63, _omitFieldNames ? '' : 'isShowNumCard')
    ..aOM<MessageGroup>(64, _omitFieldNames ? '' : 'messageGroup',
        subBuilder: MessageGroup.create)
    ..aOS(65, _omitFieldNames ? '' : 'groupInfoUrl')
    ..aOS(66, _omitFieldNames ? '' : 'joinGroupUrl')
    ..aI(67, _omitFieldNames ? '' : 'joinGroupStatus')
    ..aOB(68, _omitFieldNames ? '' : 'isSpamUser')
    ..aOS(69, _omitFieldNames ? '' : 'gsWorkbenchUrl')
    ..aOB(70, _omitFieldNames ? '' : 'isHidden')
    ..aInt64(71, _omitFieldNames ? '' : 'latestOnlineTime')
    ..aI(72, _omitFieldNames ? '' : 'riskLevel')
    ..aI(73, _omitFieldNames ? '' : 'knightLevel')
    ..aOS(74, _omitFieldNames ? '' : 'usedInfoCard')
    ..aOS(75, _omitFieldNames ? '' : 'knightIcon')
    ..aOB(76, _omitFieldNames ? '' : 'bot')
    ..aD(77, _omitFieldNames ? '' : 'intimacyPercent')
    ..aOS(78, _omitFieldNames ? '' : 'email')
    ..aOS(79, _omitFieldNames ? '' : 'country')
    ..aOS(80, _omitFieldNames ? '' : 'groupType')
    ..aOB(81, _omitFieldNames ? '' : 'accessStrangerMessage')
    ..aOS(82, _omitFieldNames ? '' : 'picFrame')
    ..aOS(83, _omitFieldNames ? '' : 'micHalo')
    ..aOS(84, _omitFieldNames ? '' : 'chatBubble')
    ..aOS(85, _omitFieldNames ? '' : 'luckyBuff')
    ..aOS(86, _omitFieldNames ? '' : 'channelName')
    ..a<$fixnum.Int64>(
        87, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(88, _omitFieldNames ? '' : 'inviteCode')
    ..a<$fixnum.Int64>(
        89, _omitFieldNames ? '' : 'inviteCodeId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(90, _omitFieldNames ? '' : 'maxCarLevel',
        fieldType: $pb.PbFieldType.OU3)
    ..aOB(91, _omitFieldNames ? '' : 'isGs')
    ..a<$fixnum.Int64>(92, _omitFieldNames ? '' : 'coin', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        93, _omitFieldNames ? '' : 'fleetId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(94, _omitFieldNames ? '' : 'quickHiStage',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(95, _omitFieldNames ? '' : 'heartLinkRole')
    ..aI(96, _omitFieldNames ? '' : 'heartLinkCardStatus')
    ..aOS(97, _omitFieldNames ? '' : 'cardDynamicResource')
    ..aOB(98, _omitFieldNames ? '' : 'isKaUser')
    ..aOB(99, _omitFieldNames ? '' : 'isRegister')
    ..aI(100, _omitFieldNames ? '' : 'coupleRelationLevel')
    ..pPS(101, _omitFieldNames ? '' : 'nicknameColor')
    ..aOB(102, _omitFieldNames ? '' : 'isPinned')
    ..aOM<$3.AccountBindings>(103, _omitFieldNames ? '' : 'accountBindings',
        subBuilder: $3.AccountBindings.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  User clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  User copyWith(void Function(User) updates) =>
      super.copyWith((message) => updates(message as User)) as User;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  @$core.override
  User createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static User getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get birthday => $_getSZ(0);
  @$pb.TagNumber(1)
  set birthday($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBirthday() => $_has(0);
  @$pb.TagNumber(1)
  void clearBirthday() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get fanNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set fanNum($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFanNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearFanNum() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get followNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set followNum($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFollowNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearFollowNum() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get friendNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set friendNum($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFriendNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearFriendNum() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get friendWish => $_getSZ(4);
  @$pb.TagNumber(5)
  set friendWish($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFriendWish() => $_has(4);
  @$pb.TagNumber(5)
  void clearFriendWish() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get gender => $_getSZ(5);
  @$pb.TagNumber(6)
  set gender($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGender() => $_has(5);
  @$pb.TagNumber(6)
  void clearGender() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get id => $_getI64(6);
  @$pb.TagNumber(7)
  set id($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasId() => $_has(6);
  @$pb.TagNumber(7)
  void clearId() => $_clearField(7);

  @$pb.TagNumber(8)
  $1.Job get job => $_getN(7);
  @$pb.TagNumber(8)
  set job($1.Job value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasJob() => $_has(7);
  @$pb.TagNumber(8)
  void clearJob() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get nickname => $_getSZ(8);
  @$pb.TagNumber(9)
  set nickname($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasNickname() => $_has(8);
  @$pb.TagNumber(9)
  void clearNickname() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get personalSignature => $_getSZ(9);
  @$pb.TagNumber(10)
  set personalSignature($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPersonalSignature() => $_has(9);
  @$pb.TagNumber(10)
  void clearPersonalSignature() => $_clearField(10);

  @$pb.TagNumber(11)
  $pb.PbList<AuditItem> get picList => $_getList(10);

  @$pb.TagNumber(12)
  $core.String get title => $_getSZ(11);
  @$pb.TagNumber(12)
  set title($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasTitle() => $_has(11);
  @$pb.TagNumber(12)
  void clearTitle() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get vipLevel => $_getIZ(12);
  @$pb.TagNumber(13)
  set vipLevel($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasVipLevel() => $_has(12);
  @$pb.TagNumber(13)
  void clearVipLevel() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get voice => $_getSZ(13);
  @$pb.TagNumber(14)
  set voice($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasVoice() => $_has(13);
  @$pb.TagNumber(14)
  void clearVoice() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get avatar => $_getSZ(14);
  @$pb.TagNumber(15)
  set avatar($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasAvatar() => $_has(14);
  @$pb.TagNumber(15)
  void clearAvatar() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get emUsername => $_getSZ(15);
  @$pb.TagNumber(16)
  set emUsername($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasEmUsername() => $_has(15);
  @$pb.TagNumber(16)
  void clearEmUsername() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.String get emPwd => $_getSZ(16);
  @$pb.TagNumber(17)
  set emPwd($core.String value) => $_setString(16, value);
  @$pb.TagNumber(17)
  $core.bool hasEmPwd() => $_has(16);
  @$pb.TagNumber(17)
  void clearEmPwd() => $_clearField(17);

  @$pb.TagNumber(18)
  $1.RelationType get relationType => $_getN(17);
  @$pb.TagNumber(18)
  set relationType($1.RelationType value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasRelationType() => $_has(17);
  @$pb.TagNumber(18)
  void clearRelationType() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.String get location => $_getSZ(18);
  @$pb.TagNumber(19)
  set location($core.String value) => $_setString(18, value);
  @$pb.TagNumber(19)
  $core.bool hasLocation() => $_has(18);
  @$pb.TagNumber(19)
  void clearLocation() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.int get weight => $_getIZ(19);
  @$pb.TagNumber(20)
  set weight($core.int value) => $_setSignedInt32(19, value);
  @$pb.TagNumber(20)
  $core.bool hasWeight() => $_has(19);
  @$pb.TagNumber(20)
  void clearWeight() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.int get height => $_getIZ(20);
  @$pb.TagNumber(21)
  set height($core.int value) => $_setSignedInt32(20, value);
  @$pb.TagNumber(21)
  $core.bool hasHeight() => $_has(20);
  @$pb.TagNumber(21)
  void clearHeight() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.int get viewNum => $_getIZ(21);
  @$pb.TagNumber(22)
  set viewNum($core.int value) => $_setSignedInt32(21, value);
  @$pb.TagNumber(22)
  $core.bool hasViewNum() => $_has(21);
  @$pb.TagNumber(22)
  void clearViewNum() => $_clearField(22);

  @$pb.TagNumber(23)
  $fixnum.Int64 get gsGroupId => $_getI64(22);
  @$pb.TagNumber(23)
  set gsGroupId($fixnum.Int64 value) => $_setInt64(22, value);
  @$pb.TagNumber(23)
  $core.bool hasGsGroupId() => $_has(22);
  @$pb.TagNumber(23)
  void clearGsGroupId() => $_clearField(23);

  @$pb.TagNumber(24)
  $2.UserCar get car => $_getN(23);
  @$pb.TagNumber(24)
  set car($2.UserCar value) => $_setField(24, value);
  @$pb.TagNumber(24)
  $core.bool hasCar() => $_has(23);
  @$pb.TagNumber(24)
  void clearCar() => $_clearField(24);
  @$pb.TagNumber(24)
  $2.UserCar ensureCar() => $_ensure(23);

  @$pb.TagNumber(25)
  $core.int get voiceDuration => $_getIZ(24);
  @$pb.TagNumber(25)
  set voiceDuration($core.int value) => $_setSignedInt32(24, value);
  @$pb.TagNumber(25)
  $core.bool hasVoiceDuration() => $_has(24);
  @$pb.TagNumber(25)
  void clearVoiceDuration() => $_clearField(25);

  @$pb.TagNumber(26)
  $core.int get onlineStatus => $_getIZ(25);
  @$pb.TagNumber(26)
  set onlineStatus($core.int value) => $_setSignedInt32(25, value);
  @$pb.TagNumber(26)
  $core.bool hasOnlineStatus() => $_has(25);
  @$pb.TagNumber(26)
  void clearOnlineStatus() => $_clearField(26);

  @$pb.TagNumber(27)
  ChannelInfo get currentChannel => $_getN(26);
  @$pb.TagNumber(27)
  set currentChannel(ChannelInfo value) => $_setField(27, value);
  @$pb.TagNumber(27)
  $core.bool hasCurrentChannel() => $_has(26);
  @$pb.TagNumber(27)
  void clearCurrentChannel() => $_clearField(27);
  @$pb.TagNumber(27)
  ChannelInfo ensureCurrentChannel() => $_ensure(26);

  @$pb.TagNumber(28)
  $core.int get moreExpForNextLevel => $_getIZ(27);
  @$pb.TagNumber(28)
  set moreExpForNextLevel($core.int value) => $_setSignedInt32(27, value);
  @$pb.TagNumber(28)
  $core.bool hasMoreExpForNextLevel() => $_has(27);
  @$pb.TagNumber(28)
  void clearMoreExpForNextLevel() => $_clearField(28);

  @$pb.TagNumber(29)
  $fixnum.Int64 get intimacyValue => $_getI64(28);
  @$pb.TagNumber(29)
  set intimacyValue($fixnum.Int64 value) => $_setInt64(28, value);
  @$pb.TagNumber(29)
  $core.bool hasIntimacyValue() => $_has(28);
  @$pb.TagNumber(29)
  void clearIntimacyValue() => $_clearField(29);

  @$pb.TagNumber(30)
  $core.bool get clubManager => $_getBF(29);
  @$pb.TagNumber(30)
  set clubManager($core.bool value) => $_setBool(29, value);
  @$pb.TagNumber(30)
  $core.bool hasClubManager() => $_has(29);
  @$pb.TagNumber(30)
  void clearClubManager() => $_clearField(30);

  @$pb.TagNumber(32)
  $fixnum.Int64 get experience => $_getI64(30);
  @$pb.TagNumber(32)
  set experience($fixnum.Int64 value) => $_setInt64(30, value);
  @$pb.TagNumber(32)
  $core.bool hasExperience() => $_has(30);
  @$pb.TagNumber(32)
  void clearExperience() => $_clearField(32);

  @$pb.TagNumber(33)
  $1.UserVipLevelIcons get icons => $_getN(31);
  @$pb.TagNumber(33)
  set icons($1.UserVipLevelIcons value) => $_setField(33, value);
  @$pb.TagNumber(33)
  $core.bool hasIcons() => $_has(31);
  @$pb.TagNumber(33)
  void clearIcons() => $_clearField(33);
  @$pb.TagNumber(33)
  $1.UserVipLevelIcons ensureIcons() => $_ensure(31);

  @$pb.TagNumber(34)
  $core.bool get superAdmin => $_getBF(32);
  @$pb.TagNumber(34)
  set superAdmin($core.bool value) => $_setBool(32, value);
  @$pb.TagNumber(34)
  $core.bool hasSuperAdmin() => $_has(32);
  @$pb.TagNumber(34)
  void clearSuperAdmin() => $_clearField(34);

  @$pb.TagNumber(35)
  $fixnum.Int64 get totalExperience => $_getI64(33);
  @$pb.TagNumber(35)
  set totalExperience($fixnum.Int64 value) => $_setInt64(33, value);
  @$pb.TagNumber(35)
  $core.bool hasTotalExperience() => $_has(33);
  @$pb.TagNumber(35)
  void clearTotalExperience() => $_clearField(35);

  @$pb.TagNumber(36)
  $fixnum.Int64 get newFriendCount => $_getI64(34);
  @$pb.TagNumber(36)
  set newFriendCount($fixnum.Int64 value) => $_setInt64(34, value);
  @$pb.TagNumber(36)
  $core.bool hasNewFriendCount() => $_has(34);
  @$pb.TagNumber(36)
  void clearNewFriendCount() => $_clearField(36);

  @$pb.TagNumber(37)
  $fixnum.Int64 get newFollowerCount => $_getI64(35);
  @$pb.TagNumber(37)
  set newFollowerCount($fixnum.Int64 value) => $_setInt64(35, value);
  @$pb.TagNumber(37)
  $core.bool hasNewFollowerCount() => $_has(35);
  @$pb.TagNumber(37)
  void clearNewFollowerCount() => $_clearField(37);

  @$pb.TagNumber(38)
  $fixnum.Int64 get newVisitorCount => $_getI64(36);
  @$pb.TagNumber(38)
  set newVisitorCount($fixnum.Int64 value) => $_setInt64(36, value);
  @$pb.TagNumber(38)
  $core.bool hasNewVisitorCount() => $_has(36);
  @$pb.TagNumber(38)
  void clearNewVisitorCount() => $_clearField(38);

  @$pb.TagNumber(39)
  $pb.PbList<$2.UserCar> get cars => $_getList(37);

  @$pb.TagNumber(40)
  $pb.PbList<$core.String> get makeFriendsLabel => $_getList(38);

  @$pb.TagNumber(41)
  $core.bool get isYourInBlackList => $_getBF(39);
  @$pb.TagNumber(41)
  set isYourInBlackList($core.bool value) => $_setBool(39, value);
  @$pb.TagNumber(41)
  $core.bool hasIsYourInBlackList() => $_has(39);
  @$pb.TagNumber(41)
  void clearIsYourInBlackList() => $_clearField(41);

  @$pb.TagNumber(42)
  $core.bool get isHeInYourBlackList => $_getBF(40);
  @$pb.TagNumber(42)
  set isHeInYourBlackList($core.bool value) => $_setBool(40, value);
  @$pb.TagNumber(42)
  $core.bool hasIsHeInYourBlackList() => $_has(40);
  @$pb.TagNumber(42)
  void clearIsHeInYourBlackList() => $_clearField(42);

  @$pb.TagNumber(43)
  $fixnum.Int64 get createTime => $_getI64(41);
  @$pb.TagNumber(43)
  set createTime($fixnum.Int64 value) => $_setInt64(41, value);
  @$pb.TagNumber(43)
  $core.bool hasCreateTime() => $_has(41);
  @$pb.TagNumber(43)
  void clearCreateTime() => $_clearField(43);

  @$pb.TagNumber(44)
  $core.int get age => $_getIZ(42);
  @$pb.TagNumber(44)
  set age($core.int value) => $_setSignedInt32(42, value);
  @$pb.TagNumber(44)
  $core.bool hasAge() => $_has(42);
  @$pb.TagNumber(44)
  void clearAge() => $_clearField(44);

  @$pb.TagNumber(45)
  $core.String get phone => $_getSZ(43);
  @$pb.TagNumber(45)
  set phone($core.String value) => $_setString(43, value);
  @$pb.TagNumber(45)
  $core.bool hasPhone() => $_has(43);
  @$pb.TagNumber(45)
  void clearPhone() => $_clearField(45);

  @$pb.TagNumber(46)
  $core.String get nicknameAudit => $_getSZ(44);
  @$pb.TagNumber(46)
  set nicknameAudit($core.String value) => $_setString(44, value);
  @$pb.TagNumber(46)
  $core.bool hasNicknameAudit() => $_has(44);
  @$pb.TagNumber(46)
  void clearNicknameAudit() => $_clearField(46);

  @$pb.TagNumber(47)
  $core.String get personalSignatureAudit => $_getSZ(45);
  @$pb.TagNumber(47)
  set personalSignatureAudit($core.String value) => $_setString(45, value);
  @$pb.TagNumber(47)
  $core.bool hasPersonalSignatureAudit() => $_has(45);
  @$pb.TagNumber(47)
  void clearPersonalSignatureAudit() => $_clearField(47);

  @$pb.TagNumber(48)
  $core.String get voiceAudit => $_getSZ(46);
  @$pb.TagNumber(48)
  set voiceAudit($core.String value) => $_setString(46, value);
  @$pb.TagNumber(48)
  $core.bool hasVoiceAudit() => $_has(46);
  @$pb.TagNumber(48)
  void clearVoiceAudit() => $_clearField(48);

  @$pb.TagNumber(49)
  $core.int get days => $_getIZ(47);
  @$pb.TagNumber(49)
  set days($core.int value) => $_setSignedInt32(47, value);
  @$pb.TagNumber(49)
  $core.bool hasDays() => $_has(47);
  @$pb.TagNumber(49)
  void clearDays() => $_clearField(49);

  @$pb.TagNumber(50)
  $core.String get avatarAudit => $_getSZ(48);
  @$pb.TagNumber(50)
  set avatarAudit($core.String value) => $_setString(48, value);
  @$pb.TagNumber(50)
  $core.bool hasAvatarAudit() => $_has(48);
  @$pb.TagNumber(50)
  void clearAvatarAudit() => $_clearField(50);

  @$pb.TagNumber(51)
  $fixnum.Int64 get bannedPrivateEndTime => $_getI64(49);
  @$pb.TagNumber(51)
  set bannedPrivateEndTime($fixnum.Int64 value) => $_setInt64(49, value);
  @$pb.TagNumber(51)
  $core.bool hasBannedPrivateEndTime() => $_has(49);
  @$pb.TagNumber(51)
  void clearBannedPrivateEndTime() => $_clearField(51);

  @$pb.TagNumber(52)
  $pb.PbList<$2.UserCarCard> get carCardList => $_getList(50);

  @$pb.TagNumber(53)
  $core.bool get openedBlindBox => $_getBF(51);
  @$pb.TagNumber(53)
  set openedBlindBox($core.bool value) => $_setBool(51, value);
  @$pb.TagNumber(53)
  $core.bool hasOpenedBlindBox() => $_has(51);
  @$pb.TagNumber(53)
  void clearOpenedBlindBox() => $_clearField(53);

  @$pb.TagNumber(54)
  $core.bool get isLeader => $_getBF(52);
  @$pb.TagNumber(54)
  set isLeader($core.bool value) => $_setBool(52, value);
  @$pb.TagNumber(54)
  $core.bool hasIsLeader() => $_has(52);
  @$pb.TagNumber(54)
  void clearIsLeader() => $_clearField(54);

  @$pb.TagNumber(55)
  $core.bool get isCompanion => $_getBF(53);
  @$pb.TagNumber(55)
  set isCompanion($core.bool value) => $_setBool(53, value);
  @$pb.TagNumber(55)
  $core.bool hasIsCompanion() => $_has(53);
  @$pb.TagNumber(55)
  void clearIsCompanion() => $_clearField(55);

  @$pb.TagNumber(56)
  $core.bool get isBroker => $_getBF(54);
  @$pb.TagNumber(56)
  set isBroker($core.bool value) => $_setBool(54, value);
  @$pb.TagNumber(56)
  $core.bool hasIsBroker() => $_has(54);
  @$pb.TagNumber(56)
  void clearIsBroker() => $_clearField(56);

  @$pb.TagNumber(57)
  $core.bool get isHost => $_getBF(55);
  @$pb.TagNumber(57)
  set isHost($core.bool value) => $_setBool(55, value);
  @$pb.TagNumber(57)
  $core.bool hasIsHost() => $_has(55);
  @$pb.TagNumber(57)
  void clearIsHost() => $_clearField(57);

  @$pb.TagNumber(58)
  $fixnum.Int64 get brokerId => $_getI64(56);
  @$pb.TagNumber(58)
  set brokerId($fixnum.Int64 value) => $_setInt64(56, value);
  @$pb.TagNumber(58)
  $core.bool hasBrokerId() => $_has(56);
  @$pb.TagNumber(58)
  void clearBrokerId() => $_clearField(58);

  @$pb.TagNumber(59)
  $fixnum.Int64 get leaderId => $_getI64(57);
  @$pb.TagNumber(59)
  set leaderId($fixnum.Int64 value) => $_setInt64(57, value);
  @$pb.TagNumber(59)
  $core.bool hasLeaderId() => $_has(57);
  @$pb.TagNumber(59)
  void clearLeaderId() => $_clearField(59);

  @$pb.TagNumber(60)
  $core.bool get realNameAuthResult => $_getBF(58);
  @$pb.TagNumber(60)
  set realNameAuthResult($core.bool value) => $_setBool(58, value);
  @$pb.TagNumber(60)
  $core.bool hasRealNameAuthResult() => $_has(58);
  @$pb.TagNumber(60)
  void clearRealNameAuthResult() => $_clearField(60);

  @$pb.TagNumber(61)
  $pb.PbList<$core.String> get tags => $_getList(59);

  @$pb.TagNumber(62)
  $core.String get inviteCodeEntrance => $_getSZ(60);
  @$pb.TagNumber(62)
  set inviteCodeEntrance($core.String value) => $_setString(60, value);
  @$pb.TagNumber(62)
  $core.bool hasInviteCodeEntrance() => $_has(60);
  @$pb.TagNumber(62)
  void clearInviteCodeEntrance() => $_clearField(62);

  @$pb.TagNumber(63)
  $core.bool get isShowNumCard => $_getBF(61);
  @$pb.TagNumber(63)
  set isShowNumCard($core.bool value) => $_setBool(61, value);
  @$pb.TagNumber(63)
  $core.bool hasIsShowNumCard() => $_has(61);
  @$pb.TagNumber(63)
  void clearIsShowNumCard() => $_clearField(63);

  @$pb.TagNumber(64)
  MessageGroup get messageGroup => $_getN(62);
  @$pb.TagNumber(64)
  set messageGroup(MessageGroup value) => $_setField(64, value);
  @$pb.TagNumber(64)
  $core.bool hasMessageGroup() => $_has(62);
  @$pb.TagNumber(64)
  void clearMessageGroup() => $_clearField(64);
  @$pb.TagNumber(64)
  MessageGroup ensureMessageGroup() => $_ensure(62);

  @$pb.TagNumber(65)
  $core.String get groupInfoUrl => $_getSZ(63);
  @$pb.TagNumber(65)
  set groupInfoUrl($core.String value) => $_setString(63, value);
  @$pb.TagNumber(65)
  $core.bool hasGroupInfoUrl() => $_has(63);
  @$pb.TagNumber(65)
  void clearGroupInfoUrl() => $_clearField(65);

  @$pb.TagNumber(66)
  $core.String get joinGroupUrl => $_getSZ(64);
  @$pb.TagNumber(66)
  set joinGroupUrl($core.String value) => $_setString(64, value);
  @$pb.TagNumber(66)
  $core.bool hasJoinGroupUrl() => $_has(64);
  @$pb.TagNumber(66)
  void clearJoinGroupUrl() => $_clearField(66);

  @$pb.TagNumber(67)
  $core.int get joinGroupStatus => $_getIZ(65);
  @$pb.TagNumber(67)
  set joinGroupStatus($core.int value) => $_setSignedInt32(65, value);
  @$pb.TagNumber(67)
  $core.bool hasJoinGroupStatus() => $_has(65);
  @$pb.TagNumber(67)
  void clearJoinGroupStatus() => $_clearField(67);

  @$pb.TagNumber(68)
  $core.bool get isSpamUser => $_getBF(66);
  @$pb.TagNumber(68)
  set isSpamUser($core.bool value) => $_setBool(66, value);
  @$pb.TagNumber(68)
  $core.bool hasIsSpamUser() => $_has(66);
  @$pb.TagNumber(68)
  void clearIsSpamUser() => $_clearField(68);

  @$pb.TagNumber(69)
  $core.String get gsWorkbenchUrl => $_getSZ(67);
  @$pb.TagNumber(69)
  set gsWorkbenchUrl($core.String value) => $_setString(67, value);
  @$pb.TagNumber(69)
  $core.bool hasGsWorkbenchUrl() => $_has(67);
  @$pb.TagNumber(69)
  void clearGsWorkbenchUrl() => $_clearField(69);

  @$pb.TagNumber(70)
  $core.bool get isHidden => $_getBF(68);
  @$pb.TagNumber(70)
  set isHidden($core.bool value) => $_setBool(68, value);
  @$pb.TagNumber(70)
  $core.bool hasIsHidden() => $_has(68);
  @$pb.TagNumber(70)
  void clearIsHidden() => $_clearField(70);

  @$pb.TagNumber(71)
  $fixnum.Int64 get latestOnlineTime => $_getI64(69);
  @$pb.TagNumber(71)
  set latestOnlineTime($fixnum.Int64 value) => $_setInt64(69, value);
  @$pb.TagNumber(71)
  $core.bool hasLatestOnlineTime() => $_has(69);
  @$pb.TagNumber(71)
  void clearLatestOnlineTime() => $_clearField(71);

  @$pb.TagNumber(72)
  $core.int get riskLevel => $_getIZ(70);
  @$pb.TagNumber(72)
  set riskLevel($core.int value) => $_setSignedInt32(70, value);
  @$pb.TagNumber(72)
  $core.bool hasRiskLevel() => $_has(70);
  @$pb.TagNumber(72)
  void clearRiskLevel() => $_clearField(72);

  @$pb.TagNumber(73)
  $core.int get knightLevel => $_getIZ(71);
  @$pb.TagNumber(73)
  set knightLevel($core.int value) => $_setSignedInt32(71, value);
  @$pb.TagNumber(73)
  $core.bool hasKnightLevel() => $_has(71);
  @$pb.TagNumber(73)
  void clearKnightLevel() => $_clearField(73);

  @$pb.TagNumber(74)
  $core.String get usedInfoCard => $_getSZ(72);
  @$pb.TagNumber(74)
  set usedInfoCard($core.String value) => $_setString(72, value);
  @$pb.TagNumber(74)
  $core.bool hasUsedInfoCard() => $_has(72);
  @$pb.TagNumber(74)
  void clearUsedInfoCard() => $_clearField(74);

  @$pb.TagNumber(75)
  $core.String get knightIcon => $_getSZ(73);
  @$pb.TagNumber(75)
  set knightIcon($core.String value) => $_setString(73, value);
  @$pb.TagNumber(75)
  $core.bool hasKnightIcon() => $_has(73);
  @$pb.TagNumber(75)
  void clearKnightIcon() => $_clearField(75);

  @$pb.TagNumber(76)
  $core.bool get bot => $_getBF(74);
  @$pb.TagNumber(76)
  set bot($core.bool value) => $_setBool(74, value);
  @$pb.TagNumber(76)
  $core.bool hasBot() => $_has(74);
  @$pb.TagNumber(76)
  void clearBot() => $_clearField(76);

  @$pb.TagNumber(77)
  $core.double get intimacyPercent => $_getN(75);
  @$pb.TagNumber(77)
  set intimacyPercent($core.double value) => $_setDouble(75, value);
  @$pb.TagNumber(77)
  $core.bool hasIntimacyPercent() => $_has(75);
  @$pb.TagNumber(77)
  void clearIntimacyPercent() => $_clearField(77);

  @$pb.TagNumber(78)
  $core.String get email => $_getSZ(76);
  @$pb.TagNumber(78)
  set email($core.String value) => $_setString(76, value);
  @$pb.TagNumber(78)
  $core.bool hasEmail() => $_has(76);
  @$pb.TagNumber(78)
  void clearEmail() => $_clearField(78);

  @$pb.TagNumber(79)
  $core.String get country => $_getSZ(77);
  @$pb.TagNumber(79)
  set country($core.String value) => $_setString(77, value);
  @$pb.TagNumber(79)
  $core.bool hasCountry() => $_has(77);
  @$pb.TagNumber(79)
  void clearCountry() => $_clearField(79);

  @$pb.TagNumber(80)
  $core.String get groupType => $_getSZ(78);
  @$pb.TagNumber(80)
  set groupType($core.String value) => $_setString(78, value);
  @$pb.TagNumber(80)
  $core.bool hasGroupType() => $_has(78);
  @$pb.TagNumber(80)
  void clearGroupType() => $_clearField(80);

  @$pb.TagNumber(81)
  $core.bool get accessStrangerMessage => $_getBF(79);
  @$pb.TagNumber(81)
  set accessStrangerMessage($core.bool value) => $_setBool(79, value);
  @$pb.TagNumber(81)
  $core.bool hasAccessStrangerMessage() => $_has(79);
  @$pb.TagNumber(81)
  void clearAccessStrangerMessage() => $_clearField(81);

  @$pb.TagNumber(82)
  $core.String get picFrame => $_getSZ(80);
  @$pb.TagNumber(82)
  set picFrame($core.String value) => $_setString(80, value);
  @$pb.TagNumber(82)
  $core.bool hasPicFrame() => $_has(80);
  @$pb.TagNumber(82)
  void clearPicFrame() => $_clearField(82);

  @$pb.TagNumber(83)
  $core.String get micHalo => $_getSZ(81);
  @$pb.TagNumber(83)
  set micHalo($core.String value) => $_setString(81, value);
  @$pb.TagNumber(83)
  $core.bool hasMicHalo() => $_has(81);
  @$pb.TagNumber(83)
  void clearMicHalo() => $_clearField(83);

  @$pb.TagNumber(84)
  $core.String get chatBubble => $_getSZ(82);
  @$pb.TagNumber(84)
  set chatBubble($core.String value) => $_setString(82, value);
  @$pb.TagNumber(84)
  $core.bool hasChatBubble() => $_has(82);
  @$pb.TagNumber(84)
  void clearChatBubble() => $_clearField(84);

  @$pb.TagNumber(85)
  $core.String get luckyBuff => $_getSZ(83);
  @$pb.TagNumber(85)
  set luckyBuff($core.String value) => $_setString(83, value);
  @$pb.TagNumber(85)
  $core.bool hasLuckyBuff() => $_has(83);
  @$pb.TagNumber(85)
  void clearLuckyBuff() => $_clearField(85);

  @$pb.TagNumber(86)
  $core.String get channelName => $_getSZ(84);
  @$pb.TagNumber(86)
  set channelName($core.String value) => $_setString(84, value);
  @$pb.TagNumber(86)
  $core.bool hasChannelName() => $_has(84);
  @$pb.TagNumber(86)
  void clearChannelName() => $_clearField(86);

  @$pb.TagNumber(87)
  $fixnum.Int64 get channelId => $_getI64(85);
  @$pb.TagNumber(87)
  set channelId($fixnum.Int64 value) => $_setInt64(85, value);
  @$pb.TagNumber(87)
  $core.bool hasChannelId() => $_has(85);
  @$pb.TagNumber(87)
  void clearChannelId() => $_clearField(87);

  @$pb.TagNumber(88)
  $core.String get inviteCode => $_getSZ(86);
  @$pb.TagNumber(88)
  set inviteCode($core.String value) => $_setString(86, value);
  @$pb.TagNumber(88)
  $core.bool hasInviteCode() => $_has(86);
  @$pb.TagNumber(88)
  void clearInviteCode() => $_clearField(88);

  @$pb.TagNumber(89)
  $fixnum.Int64 get inviteCodeId => $_getI64(87);
  @$pb.TagNumber(89)
  set inviteCodeId($fixnum.Int64 value) => $_setInt64(87, value);
  @$pb.TagNumber(89)
  $core.bool hasInviteCodeId() => $_has(87);
  @$pb.TagNumber(89)
  void clearInviteCodeId() => $_clearField(89);

  @$pb.TagNumber(90)
  $core.int get maxCarLevel => $_getIZ(88);
  @$pb.TagNumber(90)
  set maxCarLevel($core.int value) => $_setUnsignedInt32(88, value);
  @$pb.TagNumber(90)
  $core.bool hasMaxCarLevel() => $_has(88);
  @$pb.TagNumber(90)
  void clearMaxCarLevel() => $_clearField(90);

  @$pb.TagNumber(91)
  $core.bool get isGs => $_getBF(89);
  @$pb.TagNumber(91)
  set isGs($core.bool value) => $_setBool(89, value);
  @$pb.TagNumber(91)
  $core.bool hasIsGs() => $_has(89);
  @$pb.TagNumber(91)
  void clearIsGs() => $_clearField(91);

  @$pb.TagNumber(92)
  $fixnum.Int64 get coin => $_getI64(90);
  @$pb.TagNumber(92)
  set coin($fixnum.Int64 value) => $_setInt64(90, value);
  @$pb.TagNumber(92)
  $core.bool hasCoin() => $_has(90);
  @$pb.TagNumber(92)
  void clearCoin() => $_clearField(92);

  @$pb.TagNumber(93)
  $fixnum.Int64 get fleetId => $_getI64(91);
  @$pb.TagNumber(93)
  set fleetId($fixnum.Int64 value) => $_setInt64(91, value);
  @$pb.TagNumber(93)
  $core.bool hasFleetId() => $_has(91);
  @$pb.TagNumber(93)
  void clearFleetId() => $_clearField(93);

  @$pb.TagNumber(94)
  $core.int get quickHiStage => $_getIZ(92);
  @$pb.TagNumber(94)
  set quickHiStage($core.int value) => $_setUnsignedInt32(92, value);
  @$pb.TagNumber(94)
  $core.bool hasQuickHiStage() => $_has(92);
  @$pb.TagNumber(94)
  void clearQuickHiStage() => $_clearField(94);

  @$pb.TagNumber(95)
  $core.String get heartLinkRole => $_getSZ(93);
  @$pb.TagNumber(95)
  set heartLinkRole($core.String value) => $_setString(93, value);
  @$pb.TagNumber(95)
  $core.bool hasHeartLinkRole() => $_has(93);
  @$pb.TagNumber(95)
  void clearHeartLinkRole() => $_clearField(95);

  @$pb.TagNumber(96)
  $core.int get heartLinkCardStatus => $_getIZ(94);
  @$pb.TagNumber(96)
  set heartLinkCardStatus($core.int value) => $_setSignedInt32(94, value);
  @$pb.TagNumber(96)
  $core.bool hasHeartLinkCardStatus() => $_has(94);
  @$pb.TagNumber(96)
  void clearHeartLinkCardStatus() => $_clearField(96);

  @$pb.TagNumber(97)
  $core.String get cardDynamicResource => $_getSZ(95);
  @$pb.TagNumber(97)
  set cardDynamicResource($core.String value) => $_setString(95, value);
  @$pb.TagNumber(97)
  $core.bool hasCardDynamicResource() => $_has(95);
  @$pb.TagNumber(97)
  void clearCardDynamicResource() => $_clearField(97);

  @$pb.TagNumber(98)
  $core.bool get isKaUser => $_getBF(96);
  @$pb.TagNumber(98)
  set isKaUser($core.bool value) => $_setBool(96, value);
  @$pb.TagNumber(98)
  $core.bool hasIsKaUser() => $_has(96);
  @$pb.TagNumber(98)
  void clearIsKaUser() => $_clearField(98);

  @$pb.TagNumber(99)
  $core.bool get isRegister => $_getBF(97);
  @$pb.TagNumber(99)
  set isRegister($core.bool value) => $_setBool(97, value);
  @$pb.TagNumber(99)
  $core.bool hasIsRegister() => $_has(97);
  @$pb.TagNumber(99)
  void clearIsRegister() => $_clearField(99);

  @$pb.TagNumber(100)
  $core.int get coupleRelationLevel => $_getIZ(98);
  @$pb.TagNumber(100)
  set coupleRelationLevel($core.int value) => $_setSignedInt32(98, value);
  @$pb.TagNumber(100)
  $core.bool hasCoupleRelationLevel() => $_has(98);
  @$pb.TagNumber(100)
  void clearCoupleRelationLevel() => $_clearField(100);

  @$pb.TagNumber(101)
  $pb.PbList<$core.String> get nicknameColor => $_getList(99);

  @$pb.TagNumber(102)
  $core.bool get isPinned => $_getBF(100);
  @$pb.TagNumber(102)
  set isPinned($core.bool value) => $_setBool(100, value);
  @$pb.TagNumber(102)
  $core.bool hasIsPinned() => $_has(100);
  @$pb.TagNumber(102)
  void clearIsPinned() => $_clearField(102);

  @$pb.TagNumber(103)
  $3.AccountBindings get accountBindings => $_getN(101);
  @$pb.TagNumber(103)
  set accountBindings($3.AccountBindings value) => $_setField(103, value);
  @$pb.TagNumber(103)
  $core.bool hasAccountBindings() => $_has(101);
  @$pb.TagNumber(103)
  void clearAccountBindings() => $_clearField(103);
  @$pb.TagNumber(103)
  $3.AccountBindings ensureAccountBindings() => $_ensure(101);
}

class MessageGroup extends $pb.GeneratedMessage {
  factory MessageGroup({
    $core.String? type,
    $core.String? name,
    $core.String? cover,
    $core.String? desc,
    $core.String? direction,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (name != null) result.name = name;
    if (cover != null) result.cover = cover;
    if (desc != null) result.desc = desc;
    if (direction != null) result.direction = direction;
    return result;
  }

  MessageGroup._();

  factory MessageGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'cover')
    ..aOS(4, _omitFieldNames ? '' : 'desc')
    ..aOS(5, _omitFieldNames ? '' : 'direction')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageGroup copyWith(void Function(MessageGroup) updates) =>
      super.copyWith((message) => updates(message as MessageGroup))
          as MessageGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageGroup create() => MessageGroup._();
  @$core.override
  MessageGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessageGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageGroup>(create);
  static MessageGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get cover => $_getSZ(2);
  @$pb.TagNumber(3)
  set cover($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCover() => $_has(2);
  @$pb.TagNumber(3)
  void clearCover() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get direction => $_getSZ(4);
  @$pb.TagNumber(5)
  set direction($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDirection() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirection() => $_clearField(5);
}

class SimpleUser extends $pb.GeneratedMessage {
  factory SimpleUser({
    $fixnum.Int64? id,
    $core.String? gender,
    $core.String? nickname,
    $core.String? avatar,
    $core.String? emUsername,
    $core.int? onlineStatus,
    $fixnum.Int64? gsGroupId,
    $core.String? carIcon,
    $core.String? vipLevelIcon,
    $core.int? vipLevel,
    $core.int? age,
    $core.int? days,
    $2.UserCar? car,
    $1.Job? job,
    $core.Iterable<$core.String>? tags,
    $core.String? avatarFrame,
    $core.String? knightIcon,
    $core.int? secretUser,
    $core.String? knightInfoCard,
    $core.bool? robot,
    $core.String? novaIcon,
    $core.Iterable<$core.String>? nicknameColor,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (gender != null) result.gender = gender;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    if (emUsername != null) result.emUsername = emUsername;
    if (onlineStatus != null) result.onlineStatus = onlineStatus;
    if (gsGroupId != null) result.gsGroupId = gsGroupId;
    if (carIcon != null) result.carIcon = carIcon;
    if (vipLevelIcon != null) result.vipLevelIcon = vipLevelIcon;
    if (vipLevel != null) result.vipLevel = vipLevel;
    if (age != null) result.age = age;
    if (days != null) result.days = days;
    if (car != null) result.car = car;
    if (job != null) result.job = job;
    if (tags != null) result.tags.addAll(tags);
    if (avatarFrame != null) result.avatarFrame = avatarFrame;
    if (knightIcon != null) result.knightIcon = knightIcon;
    if (secretUser != null) result.secretUser = secretUser;
    if (knightInfoCard != null) result.knightInfoCard = knightInfoCard;
    if (robot != null) result.robot = robot;
    if (novaIcon != null) result.novaIcon = novaIcon;
    if (nicknameColor != null) result.nicknameColor.addAll(nicknameColor);
    return result;
  }

  SimpleUser._();

  factory SimpleUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SimpleUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SimpleUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'gender')
    ..aOS(3, _omitFieldNames ? '' : 'nickname')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..aOS(5, _omitFieldNames ? '' : 'emUsername')
    ..aI(6, _omitFieldNames ? '' : 'onlineStatus')
    ..aInt64(7, _omitFieldNames ? '' : 'gsGroupId')
    ..aOS(8, _omitFieldNames ? '' : 'carIcon')
    ..aOS(9, _omitFieldNames ? '' : 'vipLevelIcon')
    ..aI(10, _omitFieldNames ? '' : 'vipLevel')
    ..aI(11, _omitFieldNames ? '' : 'age')
    ..aI(13, _omitFieldNames ? '' : 'days')
    ..aOM<$2.UserCar>(14, _omitFieldNames ? '' : 'car',
        subBuilder: $2.UserCar.create)
    ..aE<$1.Job>(15, _omitFieldNames ? '' : 'job', enumValues: $1.Job.values)
    ..pPS(16, _omitFieldNames ? '' : 'tags')
    ..aOS(17, _omitFieldNames ? '' : 'avatarFrame')
    ..aOS(18, _omitFieldNames ? '' : 'knightIcon')
    ..aI(19, _omitFieldNames ? '' : 'secretUser')
    ..aOS(20, _omitFieldNames ? '' : 'knightInfoCard')
    ..aOB(21, _omitFieldNames ? '' : 'robot')
    ..aOS(22, _omitFieldNames ? '' : 'novaIcon')
    ..pPS(23, _omitFieldNames ? '' : 'nicknameColor')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleUser copyWith(void Function(SimpleUser) updates) =>
      super.copyWith((message) => updates(message as SimpleUser)) as SimpleUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SimpleUser create() => SimpleUser._();
  @$core.override
  SimpleUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SimpleUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SimpleUser>(create);
  static SimpleUser? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get gender => $_getSZ(1);
  @$pb.TagNumber(2)
  set gender($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGender() => $_has(1);
  @$pb.TagNumber(2)
  void clearGender() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickname($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickname() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatar($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatar() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get emUsername => $_getSZ(4);
  @$pb.TagNumber(5)
  set emUsername($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEmUsername() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmUsername() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get onlineStatus => $_getIZ(5);
  @$pb.TagNumber(6)
  set onlineStatus($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOnlineStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnlineStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get gsGroupId => $_getI64(6);
  @$pb.TagNumber(7)
  set gsGroupId($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasGsGroupId() => $_has(6);
  @$pb.TagNumber(7)
  void clearGsGroupId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get carIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set carIcon($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCarIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearCarIcon() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get vipLevelIcon => $_getSZ(8);
  @$pb.TagNumber(9)
  set vipLevelIcon($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasVipLevelIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearVipLevelIcon() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get vipLevel => $_getIZ(9);
  @$pb.TagNumber(10)
  set vipLevel($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasVipLevel() => $_has(9);
  @$pb.TagNumber(10)
  void clearVipLevel() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get age => $_getIZ(10);
  @$pb.TagNumber(11)
  set age($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasAge() => $_has(10);
  @$pb.TagNumber(11)
  void clearAge() => $_clearField(11);

  @$pb.TagNumber(13)
  $core.int get days => $_getIZ(11);
  @$pb.TagNumber(13)
  set days($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(13)
  $core.bool hasDays() => $_has(11);
  @$pb.TagNumber(13)
  void clearDays() => $_clearField(13);

  @$pb.TagNumber(14)
  $2.UserCar get car => $_getN(12);
  @$pb.TagNumber(14)
  set car($2.UserCar value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasCar() => $_has(12);
  @$pb.TagNumber(14)
  void clearCar() => $_clearField(14);
  @$pb.TagNumber(14)
  $2.UserCar ensureCar() => $_ensure(12);

  @$pb.TagNumber(15)
  $1.Job get job => $_getN(13);
  @$pb.TagNumber(15)
  set job($1.Job value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasJob() => $_has(13);
  @$pb.TagNumber(15)
  void clearJob() => $_clearField(15);

  @$pb.TagNumber(16)
  $pb.PbList<$core.String> get tags => $_getList(14);

  @$pb.TagNumber(17)
  $core.String get avatarFrame => $_getSZ(15);
  @$pb.TagNumber(17)
  set avatarFrame($core.String value) => $_setString(15, value);
  @$pb.TagNumber(17)
  $core.bool hasAvatarFrame() => $_has(15);
  @$pb.TagNumber(17)
  void clearAvatarFrame() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.String get knightIcon => $_getSZ(16);
  @$pb.TagNumber(18)
  set knightIcon($core.String value) => $_setString(16, value);
  @$pb.TagNumber(18)
  $core.bool hasKnightIcon() => $_has(16);
  @$pb.TagNumber(18)
  void clearKnightIcon() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.int get secretUser => $_getIZ(17);
  @$pb.TagNumber(19)
  set secretUser($core.int value) => $_setSignedInt32(17, value);
  @$pb.TagNumber(19)
  $core.bool hasSecretUser() => $_has(17);
  @$pb.TagNumber(19)
  void clearSecretUser() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.String get knightInfoCard => $_getSZ(18);
  @$pb.TagNumber(20)
  set knightInfoCard($core.String value) => $_setString(18, value);
  @$pb.TagNumber(20)
  $core.bool hasKnightInfoCard() => $_has(18);
  @$pb.TagNumber(20)
  void clearKnightInfoCard() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.bool get robot => $_getBF(19);
  @$pb.TagNumber(21)
  set robot($core.bool value) => $_setBool(19, value);
  @$pb.TagNumber(21)
  $core.bool hasRobot() => $_has(19);
  @$pb.TagNumber(21)
  void clearRobot() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.String get novaIcon => $_getSZ(20);
  @$pb.TagNumber(22)
  set novaIcon($core.String value) => $_setString(20, value);
  @$pb.TagNumber(22)
  $core.bool hasNovaIcon() => $_has(20);
  @$pb.TagNumber(22)
  void clearNovaIcon() => $_clearField(22);

  @$pb.TagNumber(23)
  $pb.PbList<$core.String> get nicknameColor => $_getList(21);
}

class ChannelInfo extends $pb.GeneratedMessage {
  factory ChannelInfo({
    $core.bool? isLobby,
    $fixnum.Int64? channelId,
    $core.String? agoraChannelId,
    $core.String? emChatroomId,
    $core.bool? freePub,
    $core.String? title,
    $core.bool? hasPassword,
    $core.bool? isPrivacy,
    $core.String? theme,
    $core.int? templateId,
    $fixnum.Int64? ownerId,
    $core.String? tag,
    $core.Iterable<$core.String>? color,
    $core.String? label,
    $core.String? icon,
    $4.RoomType? roomType,
  }) {
    final result = create();
    if (isLobby != null) result.isLobby = isLobby;
    if (channelId != null) result.channelId = channelId;
    if (agoraChannelId != null) result.agoraChannelId = agoraChannelId;
    if (emChatroomId != null) result.emChatroomId = emChatroomId;
    if (freePub != null) result.freePub = freePub;
    if (title != null) result.title = title;
    if (hasPassword != null) result.hasPassword = hasPassword;
    if (isPrivacy != null) result.isPrivacy = isPrivacy;
    if (theme != null) result.theme = theme;
    if (templateId != null) result.templateId = templateId;
    if (ownerId != null) result.ownerId = ownerId;
    if (tag != null) result.tag = tag;
    if (color != null) result.color.addAll(color);
    if (label != null) result.label = label;
    if (icon != null) result.icon = icon;
    if (roomType != null) result.roomType = roomType;
    return result;
  }

  ChannelInfo._();

  factory ChannelInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChannelInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChannelInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isLobby')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'agoraChannelId')
    ..aOS(4, _omitFieldNames ? '' : 'emChatroomId')
    ..aOB(5, _omitFieldNames ? '' : 'freePub')
    ..aOS(6, _omitFieldNames ? '' : 'title')
    ..aOB(7, _omitFieldNames ? '' : 'hasPassword')
    ..aOB(8, _omitFieldNames ? '' : 'isPrivacy')
    ..aOS(9, _omitFieldNames ? '' : 'theme')
    ..aI(10, _omitFieldNames ? '' : 'templateId',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        11, _omitFieldNames ? '' : 'ownerId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(12, _omitFieldNames ? '' : 'tag')
    ..pPS(13, _omitFieldNames ? '' : 'color')
    ..aOS(14, _omitFieldNames ? '' : 'label')
    ..aOS(15, _omitFieldNames ? '' : 'icon')
    ..aE<$4.RoomType>(16, _omitFieldNames ? '' : 'roomType',
        enumValues: $4.RoomType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChannelInfo copyWith(void Function(ChannelInfo) updates) =>
      super.copyWith((message) => updates(message as ChannelInfo))
          as ChannelInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChannelInfo create() => ChannelInfo._();
  @$core.override
  ChannelInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChannelInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChannelInfo>(create);
  static ChannelInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isLobby => $_getBF(0);
  @$pb.TagNumber(1)
  set isLobby($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsLobby() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsLobby() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get channelId => $_getI64(1);
  @$pb.TagNumber(2)
  set channelId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get agoraChannelId => $_getSZ(2);
  @$pb.TagNumber(3)
  set agoraChannelId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAgoraChannelId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAgoraChannelId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get emChatroomId => $_getSZ(3);
  @$pb.TagNumber(4)
  set emChatroomId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmChatroomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmChatroomId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get freePub => $_getBF(4);
  @$pb.TagNumber(5)
  set freePub($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFreePub() => $_has(4);
  @$pb.TagNumber(5)
  void clearFreePub() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(5);
  @$pb.TagNumber(6)
  set title($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get hasPassword => $_getBF(6);
  @$pb.TagNumber(7)
  set hasPassword($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasHasPassword() => $_has(6);
  @$pb.TagNumber(7)
  void clearHasPassword() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isPrivacy => $_getBF(7);
  @$pb.TagNumber(8)
  set isPrivacy($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIsPrivacy() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsPrivacy() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get theme => $_getSZ(8);
  @$pb.TagNumber(9)
  set theme($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasTheme() => $_has(8);
  @$pb.TagNumber(9)
  void clearTheme() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get templateId => $_getIZ(9);
  @$pb.TagNumber(10)
  set templateId($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasTemplateId() => $_has(9);
  @$pb.TagNumber(10)
  void clearTemplateId() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get ownerId => $_getI64(10);
  @$pb.TagNumber(11)
  set ownerId($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasOwnerId() => $_has(10);
  @$pb.TagNumber(11)
  void clearOwnerId() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get tag => $_getSZ(11);
  @$pb.TagNumber(12)
  set tag($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasTag() => $_has(11);
  @$pb.TagNumber(12)
  void clearTag() => $_clearField(12);

  @$pb.TagNumber(13)
  $pb.PbList<$core.String> get color => $_getList(12);

  @$pb.TagNumber(14)
  $core.String get label => $_getSZ(13);
  @$pb.TagNumber(14)
  set label($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasLabel() => $_has(13);
  @$pb.TagNumber(14)
  void clearLabel() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get icon => $_getSZ(14);
  @$pb.TagNumber(15)
  set icon($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasIcon() => $_has(14);
  @$pb.TagNumber(15)
  void clearIcon() => $_clearField(15);

  @$pb.TagNumber(16)
  $4.RoomType get roomType => $_getN(15);
  @$pb.TagNumber(16)
  set roomType($4.RoomType value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasRoomType() => $_has(15);
  @$pb.TagNumber(16)
  void clearRoomType() => $_clearField(16);
}

class UserInfoUpdateReq extends $pb.GeneratedMessage {
  factory UserInfoUpdateReq({
    $core.String? nickname,
    $core.String? birthday,
    $core.String? gender,
    $core.String? avatar,
    $1.Job? job,
    $core.String? personalSignature,
    $core.Iterable<$core.String>? newPic,
    $core.Iterable<$core.String>? delPic,
    $core.int? weight,
    $core.int? height,
    $core.String? friendWish,
    $core.String? voice,
    $core.String? avatarUrl,
    $core.int? voiceDuration,
    $core.String? inviteCode,
    $core.bool? register,
    $core.bool? deleteWeight,
    $core.bool? deleteHeight,
    $core.bool? deleteVoice,
    $core.String? channelName,
  }) {
    final result = create();
    if (nickname != null) result.nickname = nickname;
    if (birthday != null) result.birthday = birthday;
    if (gender != null) result.gender = gender;
    if (avatar != null) result.avatar = avatar;
    if (job != null) result.job = job;
    if (personalSignature != null) result.personalSignature = personalSignature;
    if (newPic != null) result.newPic.addAll(newPic);
    if (delPic != null) result.delPic.addAll(delPic);
    if (weight != null) result.weight = weight;
    if (height != null) result.height = height;
    if (friendWish != null) result.friendWish = friendWish;
    if (voice != null) result.voice = voice;
    if (avatarUrl != null) result.avatarUrl = avatarUrl;
    if (voiceDuration != null) result.voiceDuration = voiceDuration;
    if (inviteCode != null) result.inviteCode = inviteCode;
    if (register != null) result.register = register;
    if (deleteWeight != null) result.deleteWeight = deleteWeight;
    if (deleteHeight != null) result.deleteHeight = deleteHeight;
    if (deleteVoice != null) result.deleteVoice = deleteVoice;
    if (channelName != null) result.channelName = channelName;
    return result;
  }

  UserInfoUpdateReq._();

  factory UserInfoUpdateReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserInfoUpdateReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserInfoUpdateReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'nickname')
    ..aOS(2, _omitFieldNames ? '' : 'birthday')
    ..aOS(3, _omitFieldNames ? '' : 'gender')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..aE<$1.Job>(5, _omitFieldNames ? '' : 'job', enumValues: $1.Job.values)
    ..aOS(6, _omitFieldNames ? '' : 'personalSignature')
    ..pPS(7, _omitFieldNames ? '' : 'newPic')
    ..pPS(8, _omitFieldNames ? '' : 'delPic')
    ..aI(9, _omitFieldNames ? '' : 'weight')
    ..aI(10, _omitFieldNames ? '' : 'height')
    ..aOS(11, _omitFieldNames ? '' : 'friendWish')
    ..aOS(12, _omitFieldNames ? '' : 'voice')
    ..aOS(13, _omitFieldNames ? '' : 'avatarUrl')
    ..aI(14, _omitFieldNames ? '' : 'voiceDuration')
    ..aOS(15, _omitFieldNames ? '' : 'inviteCode')
    ..aOB(16, _omitFieldNames ? '' : 'register')
    ..aOB(17, _omitFieldNames ? '' : 'deleteWeight')
    ..aOB(18, _omitFieldNames ? '' : 'deleteHeight')
    ..aOB(19, _omitFieldNames ? '' : 'deleteVoice')
    ..aOS(20, _omitFieldNames ? '' : 'channelName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfoUpdateReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfoUpdateReq copyWith(void Function(UserInfoUpdateReq) updates) =>
      super.copyWith((message) => updates(message as UserInfoUpdateReq))
          as UserInfoUpdateReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfoUpdateReq create() => UserInfoUpdateReq._();
  @$core.override
  UserInfoUpdateReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserInfoUpdateReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserInfoUpdateReq>(create);
  static UserInfoUpdateReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nickname => $_getSZ(0);
  @$pb.TagNumber(1)
  set nickname($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNickname() => $_has(0);
  @$pb.TagNumber(1)
  void clearNickname() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get birthday => $_getSZ(1);
  @$pb.TagNumber(2)
  set birthday($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBirthday() => $_has(1);
  @$pb.TagNumber(2)
  void clearBirthday() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get gender => $_getSZ(2);
  @$pb.TagNumber(3)
  set gender($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGender() => $_has(2);
  @$pb.TagNumber(3)
  void clearGender() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatar($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatar() => $_clearField(4);

  @$pb.TagNumber(5)
  $1.Job get job => $_getN(4);
  @$pb.TagNumber(5)
  set job($1.Job value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasJob() => $_has(4);
  @$pb.TagNumber(5)
  void clearJob() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get personalSignature => $_getSZ(5);
  @$pb.TagNumber(6)
  set personalSignature($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPersonalSignature() => $_has(5);
  @$pb.TagNumber(6)
  void clearPersonalSignature() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get newPic => $_getList(6);

  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get delPic => $_getList(7);

  @$pb.TagNumber(9)
  $core.int get weight => $_getIZ(8);
  @$pb.TagNumber(9)
  set weight($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasWeight() => $_has(8);
  @$pb.TagNumber(9)
  void clearWeight() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get height => $_getIZ(9);
  @$pb.TagNumber(10)
  set height($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasHeight() => $_has(9);
  @$pb.TagNumber(10)
  void clearHeight() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get friendWish => $_getSZ(10);
  @$pb.TagNumber(11)
  set friendWish($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasFriendWish() => $_has(10);
  @$pb.TagNumber(11)
  void clearFriendWish() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get voice => $_getSZ(11);
  @$pb.TagNumber(12)
  set voice($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasVoice() => $_has(11);
  @$pb.TagNumber(12)
  void clearVoice() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get avatarUrl => $_getSZ(12);
  @$pb.TagNumber(13)
  set avatarUrl($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasAvatarUrl() => $_has(12);
  @$pb.TagNumber(13)
  void clearAvatarUrl() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.int get voiceDuration => $_getIZ(13);
  @$pb.TagNumber(14)
  set voiceDuration($core.int value) => $_setSignedInt32(13, value);
  @$pb.TagNumber(14)
  $core.bool hasVoiceDuration() => $_has(13);
  @$pb.TagNumber(14)
  void clearVoiceDuration() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get inviteCode => $_getSZ(14);
  @$pb.TagNumber(15)
  set inviteCode($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasInviteCode() => $_has(14);
  @$pb.TagNumber(15)
  void clearInviteCode() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.bool get register => $_getBF(15);
  @$pb.TagNumber(16)
  set register($core.bool value) => $_setBool(15, value);
  @$pb.TagNumber(16)
  $core.bool hasRegister() => $_has(15);
  @$pb.TagNumber(16)
  void clearRegister() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.bool get deleteWeight => $_getBF(16);
  @$pb.TagNumber(17)
  set deleteWeight($core.bool value) => $_setBool(16, value);
  @$pb.TagNumber(17)
  $core.bool hasDeleteWeight() => $_has(16);
  @$pb.TagNumber(17)
  void clearDeleteWeight() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.bool get deleteHeight => $_getBF(17);
  @$pb.TagNumber(18)
  set deleteHeight($core.bool value) => $_setBool(17, value);
  @$pb.TagNumber(18)
  $core.bool hasDeleteHeight() => $_has(17);
  @$pb.TagNumber(18)
  void clearDeleteHeight() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.bool get deleteVoice => $_getBF(18);
  @$pb.TagNumber(19)
  set deleteVoice($core.bool value) => $_setBool(18, value);
  @$pb.TagNumber(19)
  $core.bool hasDeleteVoice() => $_has(18);
  @$pb.TagNumber(19)
  void clearDeleteVoice() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.String get channelName => $_getSZ(19);
  @$pb.TagNumber(20)
  set channelName($core.String value) => $_setString(19, value);
  @$pb.TagNumber(20)
  $core.bool hasChannelName() => $_has(19);
  @$pb.TagNumber(20)
  void clearChannelName() => $_clearField(20);
}

class UserInfoRsp extends $pb.GeneratedMessage {
  factory UserInfoRsp({
    $core.bool? success,
    $core.String? message,
    User? user,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (user != null) result.user = user;
    return result;
  }

  UserInfoRsp._();

  factory UserInfoRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserInfoRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserInfoRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<User>(3, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfoRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInfoRsp copyWith(void Function(UserInfoRsp) updates) =>
      super.copyWith((message) => updates(message as UserInfoRsp))
          as UserInfoRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfoRsp create() => UserInfoRsp._();
  @$core.override
  UserInfoRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserInfoRsp>(create);
  static UserInfoRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  User get user => $_getN(2);
  @$pb.TagNumber(3)
  set user(User value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearUser() => $_clearField(3);
  @$pb.TagNumber(3)
  User ensureUser() => $_ensure(2);
}

class UserListRsp extends $pb.GeneratedMessage {
  factory UserListRsp({
    $core.bool? success,
    $core.String? message,
    $1.Page? page,
    $core.Iterable<User>? userList,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (page != null) result.page = page;
    if (userList != null) result.userList.addAll(userList);
    return result;
  }

  UserListRsp._();

  factory UserListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<$1.Page>(3, _omitFieldNames ? '' : 'page', subBuilder: $1.Page.create)
    ..pPM<User>(4, _omitFieldNames ? '' : 'userList', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserListRsp copyWith(void Function(UserListRsp) updates) =>
      super.copyWith((message) => updates(message as UserListRsp))
          as UserListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserListRsp create() => UserListRsp._();
  @$core.override
  UserListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserListRsp>(create);
  static UserListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.Page get page => $_getN(2);
  @$pb.TagNumber(3)
  set page($1.Page value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Page ensurePage() => $_ensure(2);

  @$pb.TagNumber(4)
  $pb.PbList<User> get userList => $_getList(3);
}

class UserList extends $pb.GeneratedMessage {
  factory UserList({
    $core.Iterable<User>? userList,
  }) {
    final result = create();
    if (userList != null) result.userList.addAll(userList);
    return result;
  }

  UserList._();

  factory UserList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..pPM<User>(1, _omitFieldNames ? '' : 'userList', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserList copyWith(void Function(UserList) updates) =>
      super.copyWith((message) => updates(message as UserList)) as UserList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserList create() => UserList._();
  @$core.override
  UserList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserList>(create);
  static UserList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<User> get userList => $_getList(0);
}

class ListPinReq extends $pb.GeneratedMessage {
  factory ListPinReq({
    $core.String? scene,
    $fixnum.Int64? targetId,
  }) {
    final result = create();
    if (scene != null) result.scene = scene;
    if (targetId != null) result.targetId = targetId;
    return result;
  }

  ListPinReq._();

  factory ListPinReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListPinReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListPinReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'scene')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'targetId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPinReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPinReq copyWith(void Function(ListPinReq) updates) =>
      super.copyWith((message) => updates(message as ListPinReq)) as ListPinReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPinReq create() => ListPinReq._();
  @$core.override
  ListPinReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListPinReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListPinReq>(create);
  static ListPinReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get scene => $_getSZ(0);
  @$pb.TagNumber(1)
  set scene($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasScene() => $_has(0);
  @$pb.TagNumber(1)
  void clearScene() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get targetId => $_getI64(1);
  @$pb.TagNumber(2)
  set targetId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTargetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetId() => $_clearField(2);
}

class CollectRsp extends $pb.GeneratedMessage {
  factory CollectRsp({
    $core.bool? success,
    $core.String? message,
    $fixnum.Int64? id,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (id != null) result.id = id;
    return result;
  }

  CollectRsp._();

  factory CollectRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CollectRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CollectRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aInt64(3, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CollectRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CollectRsp copyWith(void Function(CollectRsp) updates) =>
      super.copyWith((message) => updates(message as CollectRsp)) as CollectRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CollectRsp create() => CollectRsp._();
  @$core.override
  CollectRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CollectRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CollectRsp>(create);
  static CollectRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get id => $_getI64(2);
  @$pb.TagNumber(3)
  set id($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => $_clearField(3);
}

enum CollectItem_Content { contentStr, contentId, channel, notSet }

class CollectItem extends $pb.GeneratedMessage {
  factory CollectItem({
    $fixnum.Int64? id,
    $core.String? contentStr,
    $fixnum.Int64? contentId,
    $4.Channel? channel,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (contentStr != null) result.contentStr = contentStr;
    if (contentId != null) result.contentId = contentId;
    if (channel != null) result.channel = channel;
    return result;
  }

  CollectItem._();

  factory CollectItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CollectItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, CollectItem_Content>
      _CollectItem_ContentByTag = {
    2: CollectItem_Content.contentStr,
    3: CollectItem_Content.contentId,
    4: CollectItem_Content.channel,
    0: CollectItem_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CollectItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'contentStr')
    ..aInt64(3, _omitFieldNames ? '' : 'contentId')
    ..aOM<$4.Channel>(4, _omitFieldNames ? '' : 'channel',
        subBuilder: $4.Channel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CollectItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CollectItem copyWith(void Function(CollectItem) updates) =>
      super.copyWith((message) => updates(message as CollectItem))
          as CollectItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CollectItem create() => CollectItem._();
  @$core.override
  CollectItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CollectItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CollectItem>(create);
  static CollectItem? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  CollectItem_Content whichContent() =>
      _CollectItem_ContentByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearContent() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get contentStr => $_getSZ(1);
  @$pb.TagNumber(2)
  set contentStr($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContentStr() => $_has(1);
  @$pb.TagNumber(2)
  void clearContentStr() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get contentId => $_getI64(2);
  @$pb.TagNumber(3)
  set contentId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearContentId() => $_clearField(3);

  @$pb.TagNumber(4)
  $4.Channel get channel => $_getN(3);
  @$pb.TagNumber(4)
  set channel($4.Channel value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasChannel() => $_has(3);
  @$pb.TagNumber(4)
  void clearChannel() => $_clearField(4);
  @$pb.TagNumber(4)
  $4.Channel ensureChannel() => $_ensure(3);
}

class CollectListRsp extends $pb.GeneratedMessage {
  factory CollectListRsp({
    $core.bool? success,
    $core.String? message,
    $1.Page? page,
    $core.int? type,
    $core.Iterable<CollectItem>? contentList,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (page != null) result.page = page;
    if (type != null) result.type = type;
    if (contentList != null) result.contentList.addAll(contentList);
    return result;
  }

  CollectListRsp._();

  factory CollectListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CollectListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CollectListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<$1.Page>(3, _omitFieldNames ? '' : 'page', subBuilder: $1.Page.create)
    ..aI(4, _omitFieldNames ? '' : 'type')
    ..pPM<CollectItem>(5, _omitFieldNames ? '' : 'contentList',
        subBuilder: CollectItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CollectListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CollectListRsp copyWith(void Function(CollectListRsp) updates) =>
      super.copyWith((message) => updates(message as CollectListRsp))
          as CollectListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CollectListRsp create() => CollectListRsp._();
  @$core.override
  CollectListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CollectListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CollectListRsp>(create);
  static CollectListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.Page get page => $_getN(2);
  @$pb.TagNumber(3)
  set page($1.Page value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Page ensurePage() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get type => $_getIZ(3);
  @$pb.TagNumber(4)
  set type($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<CollectItem> get contentList => $_getList(4);
}

class ViewedByItem extends $pb.GeneratedMessage {
  factory ViewedByItem({
    $fixnum.Int64? uid,
    $core.String? avatar,
    $core.String? nickname,
    $fixnum.Int64? lastViewTimestamp,
    $core.int? viewCnt,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (avatar != null) result.avatar = avatar;
    if (nickname != null) result.nickname = nickname;
    if (lastViewTimestamp != null) result.lastViewTimestamp = lastViewTimestamp;
    if (viewCnt != null) result.viewCnt = viewCnt;
    return result;
  }

  ViewedByItem._();

  factory ViewedByItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ViewedByItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ViewedByItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'avatar')
    ..aOS(3, _omitFieldNames ? '' : 'nickname')
    ..aInt64(4, _omitFieldNames ? '' : 'lastViewTimestamp')
    ..aI(5, _omitFieldNames ? '' : 'viewCnt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ViewedByItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ViewedByItem copyWith(void Function(ViewedByItem) updates) =>
      super.copyWith((message) => updates(message as ViewedByItem))
          as ViewedByItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ViewedByItem create() => ViewedByItem._();
  @$core.override
  ViewedByItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ViewedByItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ViewedByItem>(create);
  static ViewedByItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get avatar => $_getSZ(1);
  @$pb.TagNumber(2)
  set avatar($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAvatar() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvatar() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickname($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickname() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get lastViewTimestamp => $_getI64(3);
  @$pb.TagNumber(4)
  set lastViewTimestamp($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLastViewTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastViewTimestamp() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get viewCnt => $_getIZ(4);
  @$pb.TagNumber(5)
  set viewCnt($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasViewCnt() => $_has(4);
  @$pb.TagNumber(5)
  void clearViewCnt() => $_clearField(5);
}

class ViewedByRsp extends $pb.GeneratedMessage {
  factory ViewedByRsp({
    $core.bool? success,
    $core.String? message,
    $1.Page? page,
    $core.Iterable<ViewedByItem>? viewedByList,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (page != null) result.page = page;
    if (viewedByList != null) result.viewedByList.addAll(viewedByList);
    return result;
  }

  ViewedByRsp._();

  factory ViewedByRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ViewedByRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ViewedByRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOM<$1.Page>(3, _omitFieldNames ? '' : 'page', subBuilder: $1.Page.create)
    ..pPM<ViewedByItem>(4, _omitFieldNames ? '' : 'viewedByList',
        subBuilder: ViewedByItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ViewedByRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ViewedByRsp copyWith(void Function(ViewedByRsp) updates) =>
      super.copyWith((message) => updates(message as ViewedByRsp))
          as ViewedByRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ViewedByRsp create() => ViewedByRsp._();
  @$core.override
  ViewedByRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ViewedByRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ViewedByRsp>(create);
  static ViewedByRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.Page get page => $_getN(2);
  @$pb.TagNumber(3)
  set page($1.Page value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Page ensurePage() => $_ensure(2);

  @$pb.TagNumber(4)
  $pb.PbList<ViewedByItem> get viewedByList => $_getList(3);
}

class GsRegisterReq extends $pb.GeneratedMessage {
  factory GsRegisterReq({
    $core.String? introductionUrl,
    $core.String? talentShowUrl,
    $core.String? otherAccount,
    $core.Iterable<$core.String>? picList,
    $core.String? videoAuthUrl,
    $1.Job? job,
    $core.String? drivingLicenseUrl,
    $core.String? homePageUrl,
    $core.bool? clearPics,
    $core.Iterable<$core.String>? drivingLicense,
    $core.bool? singer,
    $core.int? introductionTime,
    $core.int? talentShowTime,
    $core.int? videoAuthTime,
  }) {
    final result = create();
    if (introductionUrl != null) result.introductionUrl = introductionUrl;
    if (talentShowUrl != null) result.talentShowUrl = talentShowUrl;
    if (otherAccount != null) result.otherAccount = otherAccount;
    if (picList != null) result.picList.addAll(picList);
    if (videoAuthUrl != null) result.videoAuthUrl = videoAuthUrl;
    if (job != null) result.job = job;
    if (drivingLicenseUrl != null) result.drivingLicenseUrl = drivingLicenseUrl;
    if (homePageUrl != null) result.homePageUrl = homePageUrl;
    if (clearPics != null) result.clearPics = clearPics;
    if (drivingLicense != null) result.drivingLicense.addAll(drivingLicense);
    if (singer != null) result.singer = singer;
    if (introductionTime != null) result.introductionTime = introductionTime;
    if (talentShowTime != null) result.talentShowTime = talentShowTime;
    if (videoAuthTime != null) result.videoAuthTime = videoAuthTime;
    return result;
  }

  GsRegisterReq._();

  factory GsRegisterReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsRegisterReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsRegisterReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'introductionUrl')
    ..aOS(2, _omitFieldNames ? '' : 'talentShowUrl')
    ..aOS(3, _omitFieldNames ? '' : 'otherAccount')
    ..pPS(4, _omitFieldNames ? '' : 'picList')
    ..aOS(5, _omitFieldNames ? '' : 'videoAuthUrl')
    ..aE<$1.Job>(6, _omitFieldNames ? '' : 'job', enumValues: $1.Job.values)
    ..aOS(7, _omitFieldNames ? '' : 'drivingLicenseUrl')
    ..aOS(8, _omitFieldNames ? '' : 'homePageUrl')
    ..aOB(9, _omitFieldNames ? '' : 'clearPics', protoName: 'clearPics')
    ..pPS(10, _omitFieldNames ? '' : 'drivingLicense')
    ..aOB(11, _omitFieldNames ? '' : 'singer')
    ..aI(12, _omitFieldNames ? '' : 'introductionTime')
    ..aI(13, _omitFieldNames ? '' : 'talentShowTime')
    ..aI(14, _omitFieldNames ? '' : 'videoAuthTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsRegisterReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsRegisterReq copyWith(void Function(GsRegisterReq) updates) =>
      super.copyWith((message) => updates(message as GsRegisterReq))
          as GsRegisterReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsRegisterReq create() => GsRegisterReq._();
  @$core.override
  GsRegisterReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsRegisterReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsRegisterReq>(create);
  static GsRegisterReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get introductionUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set introductionUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIntroductionUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearIntroductionUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get talentShowUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set talentShowUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTalentShowUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearTalentShowUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get otherAccount => $_getSZ(2);
  @$pb.TagNumber(3)
  set otherAccount($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOtherAccount() => $_has(2);
  @$pb.TagNumber(3)
  void clearOtherAccount() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get picList => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get videoAuthUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set videoAuthUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVideoAuthUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearVideoAuthUrl() => $_clearField(5);

  @$pb.TagNumber(6)
  $1.Job get job => $_getN(5);
  @$pb.TagNumber(6)
  set job($1.Job value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasJob() => $_has(5);
  @$pb.TagNumber(6)
  void clearJob() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get drivingLicenseUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set drivingLicenseUrl($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDrivingLicenseUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearDrivingLicenseUrl() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get homePageUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set homePageUrl($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasHomePageUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearHomePageUrl() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get clearPics => $_getBF(8);
  @$pb.TagNumber(9)
  set clearPics($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasClearPics() => $_has(8);
  @$pb.TagNumber(9)
  void clearClearPics() => $_clearField(9);

  @$pb.TagNumber(10)
  $pb.PbList<$core.String> get drivingLicense => $_getList(9);

  @$pb.TagNumber(11)
  $core.bool get singer => $_getBF(10);
  @$pb.TagNumber(11)
  set singer($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasSinger() => $_has(10);
  @$pb.TagNumber(11)
  void clearSinger() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get introductionTime => $_getIZ(11);
  @$pb.TagNumber(12)
  set introductionTime($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasIntroductionTime() => $_has(11);
  @$pb.TagNumber(12)
  void clearIntroductionTime() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get talentShowTime => $_getIZ(12);
  @$pb.TagNumber(13)
  set talentShowTime($core.int value) => $_setSignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasTalentShowTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearTalentShowTime() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.int get videoAuthTime => $_getIZ(13);
  @$pb.TagNumber(14)
  set videoAuthTime($core.int value) => $_setSignedInt32(13, value);
  @$pb.TagNumber(14)
  $core.bool hasVideoAuthTime() => $_has(13);
  @$pb.TagNumber(14)
  void clearVideoAuthTime() => $_clearField(14);
}

class GsRegisterResp extends $pb.GeneratedMessage {
  factory GsRegisterResp({
    $fixnum.Int64? gsRegisterId,
  }) {
    final result = create();
    if (gsRegisterId != null) result.gsRegisterId = gsRegisterId;
    return result;
  }

  GsRegisterResp._();

  factory GsRegisterResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsRegisterResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsRegisterResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'gsRegisterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsRegisterResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsRegisterResp copyWith(void Function(GsRegisterResp) updates) =>
      super.copyWith((message) => updates(message as GsRegisterResp))
          as GsRegisterResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsRegisterResp create() => GsRegisterResp._();
  @$core.override
  GsRegisterResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsRegisterResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsRegisterResp>(create);
  static GsRegisterResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get gsRegisterId => $_getI64(0);
  @$pb.TagNumber(1)
  set gsRegisterId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsRegisterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsRegisterId() => $_clearField(1);
}

class GsRegisterDataRsp extends $pb.GeneratedMessage {
  factory GsRegisterDataRsp({
    $core.String? introductionUrl,
    $core.String? talentShowUrl,
    $core.String? otherAccount,
    $core.Iterable<$core.String>? picList,
    $core.String? videoAuthUrl,
    $1.Job? job,
    $core.String? drivingLicenseUrl,
    $core.String? homePageUrl,
    $core.Iterable<$core.String>? drivingLicense,
  }) {
    final result = create();
    if (introductionUrl != null) result.introductionUrl = introductionUrl;
    if (talentShowUrl != null) result.talentShowUrl = talentShowUrl;
    if (otherAccount != null) result.otherAccount = otherAccount;
    if (picList != null) result.picList.addAll(picList);
    if (videoAuthUrl != null) result.videoAuthUrl = videoAuthUrl;
    if (job != null) result.job = job;
    if (drivingLicenseUrl != null) result.drivingLicenseUrl = drivingLicenseUrl;
    if (homePageUrl != null) result.homePageUrl = homePageUrl;
    if (drivingLicense != null) result.drivingLicense.addAll(drivingLicense);
    return result;
  }

  GsRegisterDataRsp._();

  factory GsRegisterDataRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsRegisterDataRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsRegisterDataRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'introductionUrl')
    ..aOS(2, _omitFieldNames ? '' : 'talentShowUrl')
    ..aOS(3, _omitFieldNames ? '' : 'otherAccount')
    ..pPS(4, _omitFieldNames ? '' : 'picList')
    ..aOS(5, _omitFieldNames ? '' : 'videoAuthUrl')
    ..aE<$1.Job>(6, _omitFieldNames ? '' : 'job', enumValues: $1.Job.values)
    ..aOS(7, _omitFieldNames ? '' : 'drivingLicenseUrl')
    ..aOS(8, _omitFieldNames ? '' : 'homePageUrl')
    ..pPS(9, _omitFieldNames ? '' : 'drivingLicense')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsRegisterDataRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsRegisterDataRsp copyWith(void Function(GsRegisterDataRsp) updates) =>
      super.copyWith((message) => updates(message as GsRegisterDataRsp))
          as GsRegisterDataRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsRegisterDataRsp create() => GsRegisterDataRsp._();
  @$core.override
  GsRegisterDataRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsRegisterDataRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsRegisterDataRsp>(create);
  static GsRegisterDataRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get introductionUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set introductionUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIntroductionUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearIntroductionUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get talentShowUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set talentShowUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTalentShowUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearTalentShowUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get otherAccount => $_getSZ(2);
  @$pb.TagNumber(3)
  set otherAccount($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOtherAccount() => $_has(2);
  @$pb.TagNumber(3)
  void clearOtherAccount() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get picList => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get videoAuthUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set videoAuthUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVideoAuthUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearVideoAuthUrl() => $_clearField(5);

  @$pb.TagNumber(6)
  $1.Job get job => $_getN(5);
  @$pb.TagNumber(6)
  set job($1.Job value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasJob() => $_has(5);
  @$pb.TagNumber(6)
  void clearJob() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get drivingLicenseUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set drivingLicenseUrl($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDrivingLicenseUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearDrivingLicenseUrl() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get homePageUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set homePageUrl($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasHomePageUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearHomePageUrl() => $_clearField(8);

  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get drivingLicense => $_getList(8);
}

class RealNameAuthReq extends $pb.GeneratedMessage {
  factory RealNameAuthReq({
    $core.String? idNo,
    $core.String? idName,
  }) {
    final result = create();
    if (idNo != null) result.idNo = idNo;
    if (idName != null) result.idName = idName;
    return result;
  }

  RealNameAuthReq._();

  factory RealNameAuthReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RealNameAuthReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RealNameAuthReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'idNo')
    ..aOS(2, _omitFieldNames ? '' : 'idName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RealNameAuthReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RealNameAuthReq copyWith(void Function(RealNameAuthReq) updates) =>
      super.copyWith((message) => updates(message as RealNameAuthReq))
          as RealNameAuthReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RealNameAuthReq create() => RealNameAuthReq._();
  @$core.override
  RealNameAuthReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RealNameAuthReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RealNameAuthReq>(create);
  static RealNameAuthReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get idNo => $_getSZ(0);
  @$pb.TagNumber(1)
  set idNo($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdNo() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdNo() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get idName => $_getSZ(1);
  @$pb.TagNumber(2)
  set idName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdName() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdName() => $_clearField(2);
}

class RealNameAuthRsp extends $pb.GeneratedMessage {
  factory RealNameAuthRsp({
    $core.String? bytedToken,
    $core.String? clientConfig,
    $core.String? h5AuthUrl,
    $core.String? stsToken,
    $core.String? ak,
    $core.String? sk,
    $core.String? bucket,
    $core.String? endpoint,
    $core.String? region,
  }) {
    final result = create();
    if (bytedToken != null) result.bytedToken = bytedToken;
    if (clientConfig != null) result.clientConfig = clientConfig;
    if (h5AuthUrl != null) result.h5AuthUrl = h5AuthUrl;
    if (stsToken != null) result.stsToken = stsToken;
    if (ak != null) result.ak = ak;
    if (sk != null) result.sk = sk;
    if (bucket != null) result.bucket = bucket;
    if (endpoint != null) result.endpoint = endpoint;
    if (region != null) result.region = region;
    return result;
  }

  RealNameAuthRsp._();

  factory RealNameAuthRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RealNameAuthRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RealNameAuthRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'bytedToken')
    ..aOS(2, _omitFieldNames ? '' : 'clientConfig')
    ..aOS(3, _omitFieldNames ? '' : 'h5AuthUrl')
    ..aOS(4, _omitFieldNames ? '' : 'stsToken')
    ..aOS(5, _omitFieldNames ? '' : 'ak')
    ..aOS(6, _omitFieldNames ? '' : 'sk')
    ..aOS(7, _omitFieldNames ? '' : 'bucket')
    ..aOS(8, _omitFieldNames ? '' : 'endpoint')
    ..aOS(9, _omitFieldNames ? '' : 'region')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RealNameAuthRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RealNameAuthRsp copyWith(void Function(RealNameAuthRsp) updates) =>
      super.copyWith((message) => updates(message as RealNameAuthRsp))
          as RealNameAuthRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RealNameAuthRsp create() => RealNameAuthRsp._();
  @$core.override
  RealNameAuthRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RealNameAuthRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RealNameAuthRsp>(create);
  static RealNameAuthRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bytedToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set bytedToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBytedToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearBytedToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientConfig => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientConfig($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClientConfig() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientConfig() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get h5AuthUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set h5AuthUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasH5AuthUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearH5AuthUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get stsToken => $_getSZ(3);
  @$pb.TagNumber(4)
  set stsToken($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStsToken() => $_has(3);
  @$pb.TagNumber(4)
  void clearStsToken() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get ak => $_getSZ(4);
  @$pb.TagNumber(5)
  set ak($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAk() => $_has(4);
  @$pb.TagNumber(5)
  void clearAk() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get sk => $_getSZ(5);
  @$pb.TagNumber(6)
  set sk($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSk() => $_has(5);
  @$pb.TagNumber(6)
  void clearSk() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get bucket => $_getSZ(6);
  @$pb.TagNumber(7)
  set bucket($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBucket() => $_has(6);
  @$pb.TagNumber(7)
  void clearBucket() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get endpoint => $_getSZ(7);
  @$pb.TagNumber(8)
  set endpoint($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasEndpoint() => $_has(7);
  @$pb.TagNumber(8)
  void clearEndpoint() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get region => $_getSZ(8);
  @$pb.TagNumber(9)
  set region($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasRegion() => $_has(8);
  @$pb.TagNumber(9)
  void clearRegion() => $_clearField(9);
}

class RegisterProgressRsp extends $pb.GeneratedMessage {
  factory RegisterProgressRsp({
    $fixnum.Int64? uid,
    $1.Job? job,
    RegisterStep? step,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (job != null) result.job = job;
    if (step != null) result.step = step;
    return result;
  }

  RegisterProgressRsp._();

  factory RegisterProgressRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterProgressRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterProgressRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aE<$1.Job>(2, _omitFieldNames ? '' : 'job', enumValues: $1.Job.values)
    ..aE<RegisterStep>(3, _omitFieldNames ? '' : 'step',
        enumValues: RegisterStep.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterProgressRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterProgressRsp copyWith(void Function(RegisterProgressRsp) updates) =>
      super.copyWith((message) => updates(message as RegisterProgressRsp))
          as RegisterProgressRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterProgressRsp create() => RegisterProgressRsp._();
  @$core.override
  RegisterProgressRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RegisterProgressRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterProgressRsp>(create);
  static RegisterProgressRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $1.Job get job => $_getN(1);
  @$pb.TagNumber(2)
  set job($1.Job value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasJob() => $_has(1);
  @$pb.TagNumber(2)
  void clearJob() => $_clearField(2);

  @$pb.TagNumber(3)
  RegisterStep get step => $_getN(2);
  @$pb.TagNumber(3)
  set step(RegisterStep value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStep() => $_has(2);
  @$pb.TagNumber(3)
  void clearStep() => $_clearField(3);
}

class UserInviteListRsp extends $pb.GeneratedMessage {
  factory UserInviteListRsp({
    $core.Iterable<UserInviteItem>? list,
    $core.Iterable<InviteAward>? awardList,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (awardList != null) result.awardList.addAll(awardList);
    return result;
  }

  UserInviteListRsp._();

  factory UserInviteListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserInviteListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserInviteListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..pPM<UserInviteItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: UserInviteItem.create)
    ..pPM<InviteAward>(2, _omitFieldNames ? '' : 'awardList',
        subBuilder: InviteAward.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInviteListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInviteListRsp copyWith(void Function(UserInviteListRsp) updates) =>
      super.copyWith((message) => updates(message as UserInviteListRsp))
          as UserInviteListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInviteListRsp create() => UserInviteListRsp._();
  @$core.override
  UserInviteListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserInviteListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserInviteListRsp>(create);
  static UserInviteListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserInviteItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<InviteAward> get awardList => $_getList(1);
}

class InviteAward extends $pb.GeneratedMessage {
  factory InviteAward({
    $core.int? inviteCnt,
    $core.int? carUsingDays,
    $2.CarMetaInfo? car,
  }) {
    final result = create();
    if (inviteCnt != null) result.inviteCnt = inviteCnt;
    if (carUsingDays != null) result.carUsingDays = carUsingDays;
    if (car != null) result.car = car;
    return result;
  }

  InviteAward._();

  factory InviteAward.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteAward.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteAward',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'inviteCnt')
    ..aI(2, _omitFieldNames ? '' : 'carUsingDays')
    ..aOM<$2.CarMetaInfo>(3, _omitFieldNames ? '' : 'car',
        subBuilder: $2.CarMetaInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteAward clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteAward copyWith(void Function(InviteAward) updates) =>
      super.copyWith((message) => updates(message as InviteAward))
          as InviteAward;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteAward create() => InviteAward._();
  @$core.override
  InviteAward createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InviteAward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteAward>(create);
  static InviteAward? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get inviteCnt => $_getIZ(0);
  @$pb.TagNumber(1)
  set inviteCnt($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInviteCnt() => $_has(0);
  @$pb.TagNumber(1)
  void clearInviteCnt() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get carUsingDays => $_getIZ(1);
  @$pb.TagNumber(2)
  set carUsingDays($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCarUsingDays() => $_has(1);
  @$pb.TagNumber(2)
  void clearCarUsingDays() => $_clearField(2);

  @$pb.TagNumber(3)
  $2.CarMetaInfo get car => $_getN(2);
  @$pb.TagNumber(3)
  set car($2.CarMetaInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCar() => $_has(2);
  @$pb.TagNumber(3)
  void clearCar() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.CarMetaInfo ensureCar() => $_ensure(2);
}

class UserInviteItem extends $pb.GeneratedMessage {
  factory UserInviteItem({
    $core.String? inviteCode,
    $fixnum.Int64? userId,
    $core.String? nickName,
    $core.String? avatar,
    InviteStatus? inviteStatus,
  }) {
    final result = create();
    if (inviteCode != null) result.inviteCode = inviteCode;
    if (userId != null) result.userId = userId;
    if (nickName != null) result.nickName = nickName;
    if (avatar != null) result.avatar = avatar;
    if (inviteStatus != null) result.inviteStatus = inviteStatus;
    return result;
  }

  UserInviteItem._();

  factory UserInviteItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserInviteItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserInviteItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'inviteCode')
    ..aInt64(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'nickName')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..aE<InviteStatus>(5, _omitFieldNames ? '' : 'inviteStatus',
        enumValues: InviteStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInviteItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserInviteItem copyWith(void Function(UserInviteItem) updates) =>
      super.copyWith((message) => updates(message as UserInviteItem))
          as UserInviteItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInviteItem create() => UserInviteItem._();
  @$core.override
  UserInviteItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserInviteItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserInviteItem>(create);
  static UserInviteItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get inviteCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set inviteCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInviteCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearInviteCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickName => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickName() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatar($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatar() => $_clearField(4);

  @$pb.TagNumber(5)
  InviteStatus get inviteStatus => $_getN(4);
  @$pb.TagNumber(5)
  set inviteStatus(InviteStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasInviteStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearInviteStatus() => $_clearField(5);
}

class CalledPageRsp extends $pb.GeneratedMessage {
  factory CalledPageRsp({
    CalledUserCount? carOwner,
    CalledUserCount? gsMale,
    CalledUserCount? gsFemale,
    $core.bool? hasFull,
  }) {
    final result = create();
    if (carOwner != null) result.carOwner = carOwner;
    if (gsMale != null) result.gsMale = gsMale;
    if (gsFemale != null) result.gsFemale = gsFemale;
    if (hasFull != null) result.hasFull = hasFull;
    return result;
  }

  CalledPageRsp._();

  factory CalledPageRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CalledPageRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CalledPageRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOM<CalledUserCount>(1, _omitFieldNames ? '' : 'carOwner',
        subBuilder: CalledUserCount.create)
    ..aOM<CalledUserCount>(2, _omitFieldNames ? '' : 'gsMale',
        subBuilder: CalledUserCount.create)
    ..aOM<CalledUserCount>(3, _omitFieldNames ? '' : 'gsFemale',
        subBuilder: CalledUserCount.create)
    ..aOB(4, _omitFieldNames ? '' : 'hasFull', protoName: 'hasFull')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalledPageRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalledPageRsp copyWith(void Function(CalledPageRsp) updates) =>
      super.copyWith((message) => updates(message as CalledPageRsp))
          as CalledPageRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalledPageRsp create() => CalledPageRsp._();
  @$core.override
  CalledPageRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CalledPageRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CalledPageRsp>(create);
  static CalledPageRsp? _defaultInstance;

  @$pb.TagNumber(1)
  CalledUserCount get carOwner => $_getN(0);
  @$pb.TagNumber(1)
  set carOwner(CalledUserCount value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCarOwner() => $_has(0);
  @$pb.TagNumber(1)
  void clearCarOwner() => $_clearField(1);
  @$pb.TagNumber(1)
  CalledUserCount ensureCarOwner() => $_ensure(0);

  @$pb.TagNumber(2)
  CalledUserCount get gsMale => $_getN(1);
  @$pb.TagNumber(2)
  set gsMale(CalledUserCount value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasGsMale() => $_has(1);
  @$pb.TagNumber(2)
  void clearGsMale() => $_clearField(2);
  @$pb.TagNumber(2)
  CalledUserCount ensureGsMale() => $_ensure(1);

  @$pb.TagNumber(3)
  CalledUserCount get gsFemale => $_getN(2);
  @$pb.TagNumber(3)
  set gsFemale(CalledUserCount value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasGsFemale() => $_has(2);
  @$pb.TagNumber(3)
  void clearGsFemale() => $_clearField(3);
  @$pb.TagNumber(3)
  CalledUserCount ensureGsFemale() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get hasFull => $_getBF(3);
  @$pb.TagNumber(4)
  set hasFull($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHasFull() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasFull() => $_clearField(4);
}

class CalledUserCount extends $pb.GeneratedMessage {
  factory CalledUserCount({
    $core.int? total,
    $core.int? hasCalled,
  }) {
    final result = create();
    if (total != null) result.total = total;
    if (hasCalled != null) result.hasCalled = hasCalled;
    return result;
  }

  CalledUserCount._();

  factory CalledUserCount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CalledUserCount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CalledUserCount',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'total')
    ..aI(2, _omitFieldNames ? '' : 'hasCalled', protoName: 'hasCalled')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalledUserCount clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CalledUserCount copyWith(void Function(CalledUserCount) updates) =>
      super.copyWith((message) => updates(message as CalledUserCount))
          as CalledUserCount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalledUserCount create() => CalledUserCount._();
  @$core.override
  CalledUserCount createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CalledUserCount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CalledUserCount>(create);
  static CalledUserCount? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get total => $_getIZ(0);
  @$pb.TagNumber(1)
  set total($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get hasCalled => $_getIZ(1);
  @$pb.TagNumber(2)
  set hasCalled($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHasCalled() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasCalled() => $_clearField(2);
}

class RealNameAuthResultRsp extends $pb.GeneratedMessage {
  factory RealNameAuthResultRsp({
    $core.bool? passed,
  }) {
    final result = create();
    if (passed != null) result.passed = passed;
    return result;
  }

  RealNameAuthResultRsp._();

  factory RealNameAuthResultRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RealNameAuthResultRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RealNameAuthResultRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'passed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RealNameAuthResultRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RealNameAuthResultRsp copyWith(
          void Function(RealNameAuthResultRsp) updates) =>
      super.copyWith((message) => updates(message as RealNameAuthResultRsp))
          as RealNameAuthResultRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RealNameAuthResultRsp create() => RealNameAuthResultRsp._();
  @$core.override
  RealNameAuthResultRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RealNameAuthResultRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RealNameAuthResultRsp>(create);
  static RealNameAuthResultRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get passed => $_getBF(0);
  @$pb.TagNumber(1)
  set passed($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPassed() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassed() => $_clearField(1);
}

class SaveRegisterProgressReq extends $pb.GeneratedMessage {
  factory SaveRegisterProgressReq({
    RegisterStep? step,
  }) {
    final result = create();
    if (step != null) result.step = step;
    return result;
  }

  SaveRegisterProgressReq._();

  factory SaveRegisterProgressReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SaveRegisterProgressReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SaveRegisterProgressReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aE<RegisterStep>(1, _omitFieldNames ? '' : 'step',
        enumValues: RegisterStep.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaveRegisterProgressReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaveRegisterProgressReq copyWith(
          void Function(SaveRegisterProgressReq) updates) =>
      super.copyWith((message) => updates(message as SaveRegisterProgressReq))
          as SaveRegisterProgressReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaveRegisterProgressReq create() => SaveRegisterProgressReq._();
  @$core.override
  SaveRegisterProgressReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SaveRegisterProgressReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SaveRegisterProgressReq>(create);
  static SaveRegisterProgressReq? _defaultInstance;

  @$pb.TagNumber(1)
  RegisterStep get step => $_getN(0);
  @$pb.TagNumber(1)
  set step(RegisterStep value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStep() => $_has(0);
  @$pb.TagNumber(1)
  void clearStep() => $_clearField(1);
}

class FriendsPalyingListData extends $pb.GeneratedMessage {
  factory FriendsPalyingListData({
    $core.Iterable<MsgListUserItem>? user,
    $core.String? reason,
    $core.Iterable<MsgListUserItem>? hearties,
  }) {
    final result = create();
    if (user != null) result.user.addAll(user);
    if (reason != null) result.reason = reason;
    if (hearties != null) result.hearties.addAll(hearties);
    return result;
  }

  FriendsPalyingListData._();

  factory FriendsPalyingListData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FriendsPalyingListData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FriendsPalyingListData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..pPM<MsgListUserItem>(1, _omitFieldNames ? '' : 'user',
        subBuilder: MsgListUserItem.create)
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..pPM<MsgListUserItem>(3, _omitFieldNames ? '' : 'hearties',
        subBuilder: MsgListUserItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FriendsPalyingListData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FriendsPalyingListData copyWith(
          void Function(FriendsPalyingListData) updates) =>
      super.copyWith((message) => updates(message as FriendsPalyingListData))
          as FriendsPalyingListData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FriendsPalyingListData create() => FriendsPalyingListData._();
  @$core.override
  FriendsPalyingListData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FriendsPalyingListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FriendsPalyingListData>(create);
  static FriendsPalyingListData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MsgListUserItem> get user => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<MsgListUserItem> get hearties => $_getList(2);
}

class MsgListUsersRsp extends $pb.GeneratedMessage {
  factory MsgListUsersRsp({
    $core.Iterable<MsgListUserItem>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  MsgListUsersRsp._();

  factory MsgListUsersRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MsgListUsersRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MsgListUsersRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..pPM<MsgListUserItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: MsgListUserItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MsgListUsersRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MsgListUsersRsp copyWith(void Function(MsgListUsersRsp) updates) =>
      super.copyWith((message) => updates(message as MsgListUsersRsp))
          as MsgListUsersRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MsgListUsersRsp create() => MsgListUsersRsp._();
  @$core.override
  MsgListUsersRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MsgListUsersRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MsgListUsersRsp>(create);
  static MsgListUsersRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MsgListUserItem> get list => $_getList(0);
}

class MsgListUserItem extends $pb.GeneratedMessage {
  factory MsgListUserItem({
    $core.String? birthday,
    $core.String? gender,
    $fixnum.Int64? id,
    $1.Job? job,
    $core.String? nickname,
    $core.String? avatar,
    $core.String? emUsername,
    $core.String? emPwd,
    $core.int? onlineStatus,
    ChannelInfo? currentChannel,
    $fixnum.Int64? intimacy,
    $core.bool? isYourInBlackList,
    $core.bool? isHeInYourBlackList,
    $core.int? age,
    $core.bool? isFollow,
    $1.UserVipLevelIcons? vipIcons,
    $core.int? vipLevel,
    $core.bool? isYouAreStranger,
    $core.int? ridePrice,
    $core.String? showId,
    $core.double? intimacyPercent,
    $core.int? kaLevel,
    $core.int? kaLinkStatus,
    $core.String? kaButlerWhatsapp,
    $core.String? kaUserLinkTag,
    $core.bool? isRecharge,
    $core.bool? isSendGift,
    $core.bool? isBuyChatPkg,
    $core.int? coupleRelationLevel,
    $core.bool? autoChatting,
    $core.Iterable<$core.String>? nicknameColor,
    $core.bool? showOfficialTag,
    $core.bool? hideChatInput,
    $core.bool? hideProfileEntry,
    $core.int? strangerGreetCount,
  }) {
    final result = create();
    if (birthday != null) result.birthday = birthday;
    if (gender != null) result.gender = gender;
    if (id != null) result.id = id;
    if (job != null) result.job = job;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    if (emUsername != null) result.emUsername = emUsername;
    if (emPwd != null) result.emPwd = emPwd;
    if (onlineStatus != null) result.onlineStatus = onlineStatus;
    if (currentChannel != null) result.currentChannel = currentChannel;
    if (intimacy != null) result.intimacy = intimacy;
    if (isYourInBlackList != null) result.isYourInBlackList = isYourInBlackList;
    if (isHeInYourBlackList != null)
      result.isHeInYourBlackList = isHeInYourBlackList;
    if (age != null) result.age = age;
    if (isFollow != null) result.isFollow = isFollow;
    if (vipIcons != null) result.vipIcons = vipIcons;
    if (vipLevel != null) result.vipLevel = vipLevel;
    if (isYouAreStranger != null) result.isYouAreStranger = isYouAreStranger;
    if (ridePrice != null) result.ridePrice = ridePrice;
    if (showId != null) result.showId = showId;
    if (intimacyPercent != null) result.intimacyPercent = intimacyPercent;
    if (kaLevel != null) result.kaLevel = kaLevel;
    if (kaLinkStatus != null) result.kaLinkStatus = kaLinkStatus;
    if (kaButlerWhatsapp != null) result.kaButlerWhatsapp = kaButlerWhatsapp;
    if (kaUserLinkTag != null) result.kaUserLinkTag = kaUserLinkTag;
    if (isRecharge != null) result.isRecharge = isRecharge;
    if (isSendGift != null) result.isSendGift = isSendGift;
    if (isBuyChatPkg != null) result.isBuyChatPkg = isBuyChatPkg;
    if (coupleRelationLevel != null)
      result.coupleRelationLevel = coupleRelationLevel;
    if (autoChatting != null) result.autoChatting = autoChatting;
    if (nicknameColor != null) result.nicknameColor.addAll(nicknameColor);
    if (showOfficialTag != null) result.showOfficialTag = showOfficialTag;
    if (hideChatInput != null) result.hideChatInput = hideChatInput;
    if (hideProfileEntry != null) result.hideProfileEntry = hideProfileEntry;
    if (strangerGreetCount != null)
      result.strangerGreetCount = strangerGreetCount;
    return result;
  }

  MsgListUserItem._();

  factory MsgListUserItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MsgListUserItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MsgListUserItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'birthday')
    ..aOS(2, _omitFieldNames ? '' : 'gender')
    ..aInt64(3, _omitFieldNames ? '' : 'id')
    ..aE<$1.Job>(4, _omitFieldNames ? '' : 'job', enumValues: $1.Job.values)
    ..aOS(5, _omitFieldNames ? '' : 'nickname')
    ..aOS(6, _omitFieldNames ? '' : 'avatar')
    ..aOS(7, _omitFieldNames ? '' : 'emUsername')
    ..aOS(8, _omitFieldNames ? '' : 'emPwd')
    ..aI(9, _omitFieldNames ? '' : 'onlineStatus')
    ..aOM<ChannelInfo>(10, _omitFieldNames ? '' : 'currentChannel',
        subBuilder: ChannelInfo.create)
    ..a<$fixnum.Int64>(
        11, _omitFieldNames ? '' : 'intimacy', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(12, _omitFieldNames ? '' : 'isYourInBlackList')
    ..aOB(13, _omitFieldNames ? '' : 'isHeInYourBlackList')
    ..aI(15, _omitFieldNames ? '' : 'age')
    ..aOB(16, _omitFieldNames ? '' : 'isFollow')
    ..aOM<$1.UserVipLevelIcons>(17, _omitFieldNames ? '' : 'vipIcons',
        subBuilder: $1.UserVipLevelIcons.create)
    ..aI(18, _omitFieldNames ? '' : 'vipLevel')
    ..aOB(19, _omitFieldNames ? '' : 'isYouAreStranger')
    ..aI(20, _omitFieldNames ? '' : 'ridePrice', fieldType: $pb.PbFieldType.OU3)
    ..aOS(21, _omitFieldNames ? '' : 'showId')
    ..aD(22, _omitFieldNames ? '' : 'intimacyPercent')
    ..aI(23, _omitFieldNames ? '' : 'kaLevel', fieldType: $pb.PbFieldType.OU3)
    ..aI(24, _omitFieldNames ? '' : 'kaLinkStatus',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(25, _omitFieldNames ? '' : 'kaButlerWhatsapp')
    ..aOS(26, _omitFieldNames ? '' : 'kaUserLinkTag')
    ..aOB(27, _omitFieldNames ? '' : 'isRecharge')
    ..aOB(28, _omitFieldNames ? '' : 'isSendGift')
    ..aOB(29, _omitFieldNames ? '' : 'isBuyChatPkg')
    ..aI(30, _omitFieldNames ? '' : 'coupleRelationLevel')
    ..aOB(31, _omitFieldNames ? '' : 'autoChatting')
    ..pPS(32, _omitFieldNames ? '' : 'nicknameColor')
    ..aOB(33, _omitFieldNames ? '' : 'showOfficialTag')
    ..aOB(34, _omitFieldNames ? '' : 'hideChatInput')
    ..aOB(35, _omitFieldNames ? '' : 'hideProfileEntry')
    ..aI(36, _omitFieldNames ? '' : 'strangerGreetCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MsgListUserItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MsgListUserItem copyWith(void Function(MsgListUserItem) updates) =>
      super.copyWith((message) => updates(message as MsgListUserItem))
          as MsgListUserItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MsgListUserItem create() => MsgListUserItem._();
  @$core.override
  MsgListUserItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MsgListUserItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MsgListUserItem>(create);
  static MsgListUserItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get birthday => $_getSZ(0);
  @$pb.TagNumber(1)
  set birthday($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBirthday() => $_has(0);
  @$pb.TagNumber(1)
  void clearBirthday() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get gender => $_getSZ(1);
  @$pb.TagNumber(2)
  set gender($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGender() => $_has(1);
  @$pb.TagNumber(2)
  void clearGender() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get id => $_getI64(2);
  @$pb.TagNumber(3)
  set id($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => $_clearField(3);

  @$pb.TagNumber(4)
  $1.Job get job => $_getN(3);
  @$pb.TagNumber(4)
  set job($1.Job value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasJob() => $_has(3);
  @$pb.TagNumber(4)
  void clearJob() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get nickname => $_getSZ(4);
  @$pb.TagNumber(5)
  set nickname($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNickname() => $_has(4);
  @$pb.TagNumber(5)
  void clearNickname() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get avatar => $_getSZ(5);
  @$pb.TagNumber(6)
  set avatar($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAvatar() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvatar() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get emUsername => $_getSZ(6);
  @$pb.TagNumber(7)
  set emUsername($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasEmUsername() => $_has(6);
  @$pb.TagNumber(7)
  void clearEmUsername() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get emPwd => $_getSZ(7);
  @$pb.TagNumber(8)
  set emPwd($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasEmPwd() => $_has(7);
  @$pb.TagNumber(8)
  void clearEmPwd() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get onlineStatus => $_getIZ(8);
  @$pb.TagNumber(9)
  set onlineStatus($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasOnlineStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearOnlineStatus() => $_clearField(9);

  @$pb.TagNumber(10)
  ChannelInfo get currentChannel => $_getN(9);
  @$pb.TagNumber(10)
  set currentChannel(ChannelInfo value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasCurrentChannel() => $_has(9);
  @$pb.TagNumber(10)
  void clearCurrentChannel() => $_clearField(10);
  @$pb.TagNumber(10)
  ChannelInfo ensureCurrentChannel() => $_ensure(9);

  @$pb.TagNumber(11)
  $fixnum.Int64 get intimacy => $_getI64(10);
  @$pb.TagNumber(11)
  set intimacy($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasIntimacy() => $_has(10);
  @$pb.TagNumber(11)
  void clearIntimacy() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get isYourInBlackList => $_getBF(11);
  @$pb.TagNumber(12)
  set isYourInBlackList($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasIsYourInBlackList() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsYourInBlackList() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.bool get isHeInYourBlackList => $_getBF(12);
  @$pb.TagNumber(13)
  set isHeInYourBlackList($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(13)
  $core.bool hasIsHeInYourBlackList() => $_has(12);
  @$pb.TagNumber(13)
  void clearIsHeInYourBlackList() => $_clearField(13);

  @$pb.TagNumber(15)
  $core.int get age => $_getIZ(13);
  @$pb.TagNumber(15)
  set age($core.int value) => $_setSignedInt32(13, value);
  @$pb.TagNumber(15)
  $core.bool hasAge() => $_has(13);
  @$pb.TagNumber(15)
  void clearAge() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.bool get isFollow => $_getBF(14);
  @$pb.TagNumber(16)
  set isFollow($core.bool value) => $_setBool(14, value);
  @$pb.TagNumber(16)
  $core.bool hasIsFollow() => $_has(14);
  @$pb.TagNumber(16)
  void clearIsFollow() => $_clearField(16);

  @$pb.TagNumber(17)
  $1.UserVipLevelIcons get vipIcons => $_getN(15);
  @$pb.TagNumber(17)
  set vipIcons($1.UserVipLevelIcons value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasVipIcons() => $_has(15);
  @$pb.TagNumber(17)
  void clearVipIcons() => $_clearField(17);
  @$pb.TagNumber(17)
  $1.UserVipLevelIcons ensureVipIcons() => $_ensure(15);

  @$pb.TagNumber(18)
  $core.int get vipLevel => $_getIZ(16);
  @$pb.TagNumber(18)
  set vipLevel($core.int value) => $_setSignedInt32(16, value);
  @$pb.TagNumber(18)
  $core.bool hasVipLevel() => $_has(16);
  @$pb.TagNumber(18)
  void clearVipLevel() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.bool get isYouAreStranger => $_getBF(17);
  @$pb.TagNumber(19)
  set isYouAreStranger($core.bool value) => $_setBool(17, value);
  @$pb.TagNumber(19)
  $core.bool hasIsYouAreStranger() => $_has(17);
  @$pb.TagNumber(19)
  void clearIsYouAreStranger() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.int get ridePrice => $_getIZ(18);
  @$pb.TagNumber(20)
  set ridePrice($core.int value) => $_setUnsignedInt32(18, value);
  @$pb.TagNumber(20)
  $core.bool hasRidePrice() => $_has(18);
  @$pb.TagNumber(20)
  void clearRidePrice() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.String get showId => $_getSZ(19);
  @$pb.TagNumber(21)
  set showId($core.String value) => $_setString(19, value);
  @$pb.TagNumber(21)
  $core.bool hasShowId() => $_has(19);
  @$pb.TagNumber(21)
  void clearShowId() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.double get intimacyPercent => $_getN(20);
  @$pb.TagNumber(22)
  set intimacyPercent($core.double value) => $_setDouble(20, value);
  @$pb.TagNumber(22)
  $core.bool hasIntimacyPercent() => $_has(20);
  @$pb.TagNumber(22)
  void clearIntimacyPercent() => $_clearField(22);

  /// KA等级，0-A级，1-S级
  @$pb.TagNumber(23)
  $core.int get kaLevel => $_getIZ(21);
  @$pb.TagNumber(23)
  set kaLevel($core.int value) => $_setUnsignedInt32(21, value);
  @$pb.TagNumber(23)
  $core.bool hasKaLevel() => $_has(21);
  @$pb.TagNumber(23)
  void clearKaLevel() => $_clearField(23);

  /// ka建联状态 0-未建联，1-已建联未发放礼包，2-已建联
  @$pb.TagNumber(24)
  $core.int get kaLinkStatus => $_getIZ(22);
  @$pb.TagNumber(24)
  set kaLinkStatus($core.int value) => $_setUnsignedInt32(22, value);
  @$pb.TagNumber(24)
  $core.bool hasKaLinkStatus() => $_has(22);
  @$pb.TagNumber(24)
  void clearKaLinkStatus() => $_clearField(24);

  /// ka管家WhatsApp账号
  @$pb.TagNumber(25)
  $core.String get kaButlerWhatsapp => $_getSZ(23);
  @$pb.TagNumber(25)
  set kaButlerWhatsapp($core.String value) => $_setString(23, value);
  @$pb.TagNumber(25)
  $core.bool hasKaButlerWhatsapp() => $_has(23);
  @$pb.TagNumber(25)
  void clearKaButlerWhatsapp() => $_clearField(25);

  /// ka用户建联标签
  @$pb.TagNumber(26)
  $core.String get kaUserLinkTag => $_getSZ(24);
  @$pb.TagNumber(26)
  set kaUserLinkTag($core.String value) => $_setString(24, value);
  @$pb.TagNumber(26)
  $core.bool hasKaUserLinkTag() => $_has(24);
  @$pb.TagNumber(26)
  void clearKaUserLinkTag() => $_clearField(26);

  @$pb.TagNumber(27)
  $core.bool get isRecharge => $_getBF(25);
  @$pb.TagNumber(27)
  set isRecharge($core.bool value) => $_setBool(25, value);
  @$pb.TagNumber(27)
  $core.bool hasIsRecharge() => $_has(25);
  @$pb.TagNumber(27)
  void clearIsRecharge() => $_clearField(27);

  @$pb.TagNumber(28)
  $core.bool get isSendGift => $_getBF(26);
  @$pb.TagNumber(28)
  set isSendGift($core.bool value) => $_setBool(26, value);
  @$pb.TagNumber(28)
  $core.bool hasIsSendGift() => $_has(26);
  @$pb.TagNumber(28)
  void clearIsSendGift() => $_clearField(28);

  @$pb.TagNumber(29)
  $core.bool get isBuyChatPkg => $_getBF(27);
  @$pb.TagNumber(29)
  set isBuyChatPkg($core.bool value) => $_setBool(27, value);
  @$pb.TagNumber(29)
  $core.bool hasIsBuyChatPkg() => $_has(27);
  @$pb.TagNumber(29)
  void clearIsBuyChatPkg() => $_clearField(29);

  @$pb.TagNumber(30)
  $core.int get coupleRelationLevel => $_getIZ(28);
  @$pb.TagNumber(30)
  set coupleRelationLevel($core.int value) => $_setSignedInt32(28, value);
  @$pb.TagNumber(30)
  $core.bool hasCoupleRelationLevel() => $_has(28);
  @$pb.TagNumber(30)
  void clearCoupleRelationLevel() => $_clearField(30);

  @$pb.TagNumber(31)
  $core.bool get autoChatting => $_getBF(29);
  @$pb.TagNumber(31)
  set autoChatting($core.bool value) => $_setBool(29, value);
  @$pb.TagNumber(31)
  $core.bool hasAutoChatting() => $_has(29);
  @$pb.TagNumber(31)
  void clearAutoChatting() => $_clearField(31);

  @$pb.TagNumber(32)
  $pb.PbList<$core.String> get nicknameColor => $_getList(30);

  @$pb.TagNumber(33)
  $core.bool get showOfficialTag => $_getBF(31);
  @$pb.TagNumber(33)
  set showOfficialTag($core.bool value) => $_setBool(31, value);
  @$pb.TagNumber(33)
  $core.bool hasShowOfficialTag() => $_has(31);
  @$pb.TagNumber(33)
  void clearShowOfficialTag() => $_clearField(33);

  @$pb.TagNumber(34)
  $core.bool get hideChatInput => $_getBF(32);
  @$pb.TagNumber(34)
  set hideChatInput($core.bool value) => $_setBool(32, value);
  @$pb.TagNumber(34)
  $core.bool hasHideChatInput() => $_has(32);
  @$pb.TagNumber(34)
  void clearHideChatInput() => $_clearField(34);

  @$pb.TagNumber(35)
  $core.bool get hideProfileEntry => $_getBF(33);
  @$pb.TagNumber(35)
  set hideProfileEntry($core.bool value) => $_setBool(33, value);
  @$pb.TagNumber(35)
  $core.bool hasHideProfileEntry() => $_has(33);
  @$pb.TagNumber(35)
  void clearHideProfileEntry() => $_clearField(35);

  @$pb.TagNumber(36)
  $core.int get strangerGreetCount => $_getIZ(34);
  @$pb.TagNumber(36)
  set strangerGreetCount($core.int value) => $_setSignedInt32(34, value);
  @$pb.TagNumber(36)
  $core.bool hasStrangerGreetCount() => $_has(34);
  @$pb.TagNumber(36)
  void clearStrangerGreetCount() => $_clearField(36);
}

class GsUserInfoRsp extends $pb.GeneratedMessage {
  factory GsUserInfoRsp({
    $fixnum.Int64? userId,
    $core.String? nickName,
    $core.String? avatar,
    $core.String? gender,
    $fixnum.Int64? cashMileage,
    $core.String? phone,
    $core.String? fullName,
    $core.String? gCashId,
    $core.String? email,
    $core.bool? isGcashReview,
    $core.String? telegramId,
    $core.bool? isRoomManager,
    $core.int? cashType,
    $core.String? cryptoChain,
    $core.String? cryptoAddress,
    $core.String? bank,
    $core.String? bankNo,
    $core.Iterable<$core.String>? workExpUrl,
    $core.bool? isCryptoReview,
    $core.bool? isBankReview,
    $fixnum.Int64? inviteHandler,
    $core.String? inviteCode,
    $core.String? mayaId,
    $core.bool? isMayaReview,
    $fixnum.Int64? gemBalance,
    $core.bool? includeGemSettlement,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (nickName != null) result.nickName = nickName;
    if (avatar != null) result.avatar = avatar;
    if (gender != null) result.gender = gender;
    if (cashMileage != null) result.cashMileage = cashMileage;
    if (phone != null) result.phone = phone;
    if (fullName != null) result.fullName = fullName;
    if (gCashId != null) result.gCashId = gCashId;
    if (email != null) result.email = email;
    if (isGcashReview != null) result.isGcashReview = isGcashReview;
    if (telegramId != null) result.telegramId = telegramId;
    if (isRoomManager != null) result.isRoomManager = isRoomManager;
    if (cashType != null) result.cashType = cashType;
    if (cryptoChain != null) result.cryptoChain = cryptoChain;
    if (cryptoAddress != null) result.cryptoAddress = cryptoAddress;
    if (bank != null) result.bank = bank;
    if (bankNo != null) result.bankNo = bankNo;
    if (workExpUrl != null) result.workExpUrl.addAll(workExpUrl);
    if (isCryptoReview != null) result.isCryptoReview = isCryptoReview;
    if (isBankReview != null) result.isBankReview = isBankReview;
    if (inviteHandler != null) result.inviteHandler = inviteHandler;
    if (inviteCode != null) result.inviteCode = inviteCode;
    if (mayaId != null) result.mayaId = mayaId;
    if (isMayaReview != null) result.isMayaReview = isMayaReview;
    if (gemBalance != null) result.gemBalance = gemBalance;
    if (includeGemSettlement != null)
      result.includeGemSettlement = includeGemSettlement;
    return result;
  }

  GsUserInfoRsp._();

  factory GsUserInfoRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsUserInfoRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsUserInfoRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'nickName')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'gender')
    ..aInt64(5, _omitFieldNames ? '' : 'cashMileage')
    ..aOS(6, _omitFieldNames ? '' : 'phone')
    ..aOS(7, _omitFieldNames ? '' : 'fullName')
    ..aOS(8, _omitFieldNames ? '' : 'gCashId')
    ..aOS(9, _omitFieldNames ? '' : 'email')
    ..aOB(10, _omitFieldNames ? '' : 'isGcashReview')
    ..aOS(11, _omitFieldNames ? '' : 'telegramId')
    ..aOB(12, _omitFieldNames ? '' : 'isRoomManager')
    ..aI(13, _omitFieldNames ? '' : 'cashType', fieldType: $pb.PbFieldType.OU3)
    ..aOS(14, _omitFieldNames ? '' : 'cryptoChain')
    ..aOS(15, _omitFieldNames ? '' : 'cryptoAddress')
    ..aOS(16, _omitFieldNames ? '' : 'bank')
    ..aOS(17, _omitFieldNames ? '' : 'bankNo')
    ..pPS(18, _omitFieldNames ? '' : 'workExpUrl')
    ..aOB(19, _omitFieldNames ? '' : 'isCryptoReview')
    ..aOB(20, _omitFieldNames ? '' : 'isBankReview')
    ..aInt64(21, _omitFieldNames ? '' : 'inviteHandler')
    ..aOS(22, _omitFieldNames ? '' : 'inviteCode')
    ..aOS(23, _omitFieldNames ? '' : 'mayaId')
    ..aOB(24, _omitFieldNames ? '' : 'isMayaReview')
    ..aInt64(25, _omitFieldNames ? '' : 'gemBalance')
    ..aOB(26, _omitFieldNames ? '' : 'includeGemSettlement')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsUserInfoRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsUserInfoRsp copyWith(void Function(GsUserInfoRsp) updates) =>
      super.copyWith((message) => updates(message as GsUserInfoRsp))
          as GsUserInfoRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsUserInfoRsp create() => GsUserInfoRsp._();
  @$core.override
  GsUserInfoRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsUserInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsUserInfoRsp>(create);
  static GsUserInfoRsp? _defaultInstance;

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
  $core.String get gender => $_getSZ(3);
  @$pb.TagNumber(4)
  set gender($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get cashMileage => $_getI64(4);
  @$pb.TagNumber(5)
  set cashMileage($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCashMileage() => $_has(4);
  @$pb.TagNumber(5)
  void clearCashMileage() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get phone => $_getSZ(5);
  @$pb.TagNumber(6)
  set phone($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPhone() => $_has(5);
  @$pb.TagNumber(6)
  void clearPhone() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get fullName => $_getSZ(6);
  @$pb.TagNumber(7)
  set fullName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasFullName() => $_has(6);
  @$pb.TagNumber(7)
  void clearFullName() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get gCashId => $_getSZ(7);
  @$pb.TagNumber(8)
  set gCashId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasGCashId() => $_has(7);
  @$pb.TagNumber(8)
  void clearGCashId() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get email => $_getSZ(8);
  @$pb.TagNumber(9)
  set email($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasEmail() => $_has(8);
  @$pb.TagNumber(9)
  void clearEmail() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isGcashReview => $_getBF(9);
  @$pb.TagNumber(10)
  set isGcashReview($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasIsGcashReview() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsGcashReview() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get telegramId => $_getSZ(10);
  @$pb.TagNumber(11)
  set telegramId($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasTelegramId() => $_has(10);
  @$pb.TagNumber(11)
  void clearTelegramId() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get isRoomManager => $_getBF(11);
  @$pb.TagNumber(12)
  set isRoomManager($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasIsRoomManager() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsRoomManager() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get cashType => $_getIZ(12);
  @$pb.TagNumber(13)
  set cashType($core.int value) => $_setUnsignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasCashType() => $_has(12);
  @$pb.TagNumber(13)
  void clearCashType() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get cryptoChain => $_getSZ(13);
  @$pb.TagNumber(14)
  set cryptoChain($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasCryptoChain() => $_has(13);
  @$pb.TagNumber(14)
  void clearCryptoChain() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get cryptoAddress => $_getSZ(14);
  @$pb.TagNumber(15)
  set cryptoAddress($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasCryptoAddress() => $_has(14);
  @$pb.TagNumber(15)
  void clearCryptoAddress() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get bank => $_getSZ(15);
  @$pb.TagNumber(16)
  set bank($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasBank() => $_has(15);
  @$pb.TagNumber(16)
  void clearBank() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.String get bankNo => $_getSZ(16);
  @$pb.TagNumber(17)
  set bankNo($core.String value) => $_setString(16, value);
  @$pb.TagNumber(17)
  $core.bool hasBankNo() => $_has(16);
  @$pb.TagNumber(17)
  void clearBankNo() => $_clearField(17);

  @$pb.TagNumber(18)
  $pb.PbList<$core.String> get workExpUrl => $_getList(17);

  @$pb.TagNumber(19)
  $core.bool get isCryptoReview => $_getBF(18);
  @$pb.TagNumber(19)
  set isCryptoReview($core.bool value) => $_setBool(18, value);
  @$pb.TagNumber(19)
  $core.bool hasIsCryptoReview() => $_has(18);
  @$pb.TagNumber(19)
  void clearIsCryptoReview() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.bool get isBankReview => $_getBF(19);
  @$pb.TagNumber(20)
  set isBankReview($core.bool value) => $_setBool(19, value);
  @$pb.TagNumber(20)
  $core.bool hasIsBankReview() => $_has(19);
  @$pb.TagNumber(20)
  void clearIsBankReview() => $_clearField(20);

  @$pb.TagNumber(21)
  $fixnum.Int64 get inviteHandler => $_getI64(20);
  @$pb.TagNumber(21)
  set inviteHandler($fixnum.Int64 value) => $_setInt64(20, value);
  @$pb.TagNumber(21)
  $core.bool hasInviteHandler() => $_has(20);
  @$pb.TagNumber(21)
  void clearInviteHandler() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.String get inviteCode => $_getSZ(21);
  @$pb.TagNumber(22)
  set inviteCode($core.String value) => $_setString(21, value);
  @$pb.TagNumber(22)
  $core.bool hasInviteCode() => $_has(21);
  @$pb.TagNumber(22)
  void clearInviteCode() => $_clearField(22);

  @$pb.TagNumber(23)
  $core.String get mayaId => $_getSZ(22);
  @$pb.TagNumber(23)
  set mayaId($core.String value) => $_setString(22, value);
  @$pb.TagNumber(23)
  $core.bool hasMayaId() => $_has(22);
  @$pb.TagNumber(23)
  void clearMayaId() => $_clearField(23);

  @$pb.TagNumber(24)
  $core.bool get isMayaReview => $_getBF(23);
  @$pb.TagNumber(24)
  set isMayaReview($core.bool value) => $_setBool(23, value);
  @$pb.TagNumber(24)
  $core.bool hasIsMayaReview() => $_has(23);
  @$pb.TagNumber(24)
  void clearIsMayaReview() => $_clearField(24);

  @$pb.TagNumber(25)
  $fixnum.Int64 get gemBalance => $_getI64(24);
  @$pb.TagNumber(25)
  set gemBalance($fixnum.Int64 value) => $_setInt64(24, value);
  @$pb.TagNumber(25)
  $core.bool hasGemBalance() => $_has(24);
  @$pb.TagNumber(25)
  void clearGemBalance() => $_clearField(25);

  @$pb.TagNumber(26)
  $core.bool get includeGemSettlement => $_getBF(25);
  @$pb.TagNumber(26)
  set includeGemSettlement($core.bool value) => $_setBool(25, value);
  @$pb.TagNumber(26)
  $core.bool hasIncludeGemSettlement() => $_has(25);
  @$pb.TagNumber(26)
  void clearIncludeGemSettlement() => $_clearField(26);
}

class SubmitApprovalReq extends $pb.GeneratedMessage {
  factory SubmitApprovalReq({
    $fixnum.Int64? gsRegisterId,
  }) {
    final result = create();
    if (gsRegisterId != null) result.gsRegisterId = gsRegisterId;
    return result;
  }

  SubmitApprovalReq._();

  factory SubmitApprovalReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitApprovalReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitApprovalReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'gsRegisterId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitApprovalReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitApprovalReq copyWith(void Function(SubmitApprovalReq) updates) =>
      super.copyWith((message) => updates(message as SubmitApprovalReq))
          as SubmitApprovalReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitApprovalReq create() => SubmitApprovalReq._();
  @$core.override
  SubmitApprovalReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitApprovalReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitApprovalReq>(create);
  static SubmitApprovalReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get gsRegisterId => $_getI64(0);
  @$pb.TagNumber(1)
  set gsRegisterId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsRegisterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsRegisterId() => $_clearField(1);
}

class UserApprovalRecordResp extends $pb.GeneratedMessage {
  factory UserApprovalRecordResp({
    $fixnum.Int64? userId,
    UserApprovalRecordStatus? status,
    $core.bool? car,
    $fixnum.Int64? roomId,
    $core.bool? coldStart,
    $1.Job? job,
    $core.bool? white,
    RegisterStep? step,
    $core.bool? auth,
    $core.bool? audit,
    $core.bool? speedUp,
    $core.bool? hasUseInviteCode,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (status != null) result.status = status;
    if (car != null) result.car = car;
    if (roomId != null) result.roomId = roomId;
    if (coldStart != null) result.coldStart = coldStart;
    if (job != null) result.job = job;
    if (white != null) result.white = white;
    if (step != null) result.step = step;
    if (auth != null) result.auth = auth;
    if (audit != null) result.audit = audit;
    if (speedUp != null) result.speedUp = speedUp;
    if (hasUseInviteCode != null) result.hasUseInviteCode = hasUseInviteCode;
    return result;
  }

  UserApprovalRecordResp._();

  factory UserApprovalRecordResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserApprovalRecordResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserApprovalRecordResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId')
    ..aE<UserApprovalRecordStatus>(2, _omitFieldNames ? '' : 'status',
        enumValues: UserApprovalRecordStatus.values)
    ..aOB(3, _omitFieldNames ? '' : 'car')
    ..aInt64(4, _omitFieldNames ? '' : 'roomId')
    ..aOB(5, _omitFieldNames ? '' : 'coldStart')
    ..aE<$1.Job>(6, _omitFieldNames ? '' : 'job', enumValues: $1.Job.values)
    ..aOB(7, _omitFieldNames ? '' : 'white')
    ..aE<RegisterStep>(8, _omitFieldNames ? '' : 'step',
        enumValues: RegisterStep.values)
    ..aOB(9, _omitFieldNames ? '' : 'auth')
    ..aOB(10, _omitFieldNames ? '' : 'audit')
    ..aOB(11, _omitFieldNames ? '' : 'speedUp')
    ..aOB(12, _omitFieldNames ? '' : 'hasUseInviteCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserApprovalRecordResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserApprovalRecordResp copyWith(
          void Function(UserApprovalRecordResp) updates) =>
      super.copyWith((message) => updates(message as UserApprovalRecordResp))
          as UserApprovalRecordResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserApprovalRecordResp create() => UserApprovalRecordResp._();
  @$core.override
  UserApprovalRecordResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserApprovalRecordResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserApprovalRecordResp>(create);
  static UserApprovalRecordResp? _defaultInstance;

  /// *
  /// 用户id
  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// *
  /// 用户审核状态
  @$pb.TagNumber(2)
  UserApprovalRecordStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(UserApprovalRecordStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  /// *
  /// 只有是boss才需要识别该状态
  /// true = 有汽车
  /// false = 没汽车
  @$pb.TagNumber(3)
  $core.bool get car => $_getBF(2);
  @$pb.TagNumber(3)
  set car($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCar() => $_has(2);
  @$pb.TagNumber(3)
  void clearCar() => $_clearField(3);

  /// *
  /// 只有是冷启动-并且审核通过才会返回
  @$pb.TagNumber(4)
  $fixnum.Int64 get roomId => $_getI64(3);
  @$pb.TagNumber(4)
  set roomId($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => $_clearField(4);

  /// *
  /// 是否冷启动
  @$pb.TagNumber(5)
  $core.bool get coldStart => $_getBF(4);
  @$pb.TagNumber(5)
  set coldStart($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasColdStart() => $_has(4);
  @$pb.TagNumber(5)
  void clearColdStart() => $_clearField(5);

  /// *
  /// 当前用户角色
  @$pb.TagNumber(6)
  $1.Job get job => $_getN(5);
  @$pb.TagNumber(6)
  set job($1.Job value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasJob() => $_has(5);
  @$pb.TagNumber(6)
  void clearJob() => $_clearField(6);

  /// *
  /// 是否白名单
  @$pb.TagNumber(7)
  $core.bool get white => $_getBF(6);
  @$pb.TagNumber(7)
  set white($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasWhite() => $_has(6);
  @$pb.TagNumber(7)
  void clearWhite() => $_clearField(7);

  /// *
  /// 注册进度
  @$pb.TagNumber(8)
  RegisterStep get step => $_getN(7);
  @$pb.TagNumber(8)
  set step(RegisterStep value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasStep() => $_has(7);
  @$pb.TagNumber(8)
  void clearStep() => $_clearField(8);

  /// *
  /// 是否认证
  @$pb.TagNumber(9)
  $core.bool get auth => $_getBF(8);
  @$pb.TagNumber(9)
  set auth($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasAuth() => $_has(8);
  @$pb.TagNumber(9)
  void clearAuth() => $_clearField(9);

  /// *
  /// 是否是审核账号
  @$pb.TagNumber(10)
  $core.bool get audit => $_getBF(9);
  @$pb.TagNumber(10)
  set audit($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasAudit() => $_has(9);
  @$pb.TagNumber(10)
  void clearAudit() => $_clearField(10);

  /// *
  /// 加速
  @$pb.TagNumber(11)
  $core.bool get speedUp => $_getBF(10);
  @$pb.TagNumber(11)
  set speedUp($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasSpeedUp() => $_has(10);
  @$pb.TagNumber(11)
  void clearSpeedUp() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get hasUseInviteCode => $_getBF(11);
  @$pb.TagNumber(12)
  set hasUseInviteCode($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasHasUseInviteCode() => $_has(11);
  @$pb.TagNumber(12)
  void clearHasUseInviteCode() => $_clearField(12);
}

class SetBlackListReq extends $pb.GeneratedMessage {
  factory SetBlackListReq({
    $fixnum.Int64? userId,
    $core.bool? isCancel,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (isCancel != null) result.isCancel = isCancel;
    return result;
  }

  SetBlackListReq._();

  factory SetBlackListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetBlackListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetBlackListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId')
    ..aOB(2, _omitFieldNames ? '' : 'isCancel')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetBlackListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetBlackListReq copyWith(void Function(SetBlackListReq) updates) =>
      super.copyWith((message) => updates(message as SetBlackListReq))
          as SetBlackListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetBlackListReq create() => SetBlackListReq._();
  @$core.override
  SetBlackListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetBlackListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetBlackListReq>(create);
  static SetBlackListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isCancel => $_getBF(1);
  @$pb.TagNumber(2)
  set isCancel($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsCancel() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsCancel() => $_clearField(2);
}

class GetBlackListResp extends $pb.GeneratedMessage {
  factory GetBlackListResp({
    $core.Iterable<SimpleUser>? users,
  }) {
    final result = create();
    if (users != null) result.users.addAll(users);
    return result;
  }

  GetBlackListResp._();

  factory GetBlackListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBlackListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBlackListResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..pPM<SimpleUser>(1, _omitFieldNames ? '' : 'users',
        subBuilder: SimpleUser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlackListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBlackListResp copyWith(void Function(GetBlackListResp) updates) =>
      super.copyWith((message) => updates(message as GetBlackListResp))
          as GetBlackListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlackListResp create() => GetBlackListResp._();
  @$core.override
  GetBlackListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBlackListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBlackListResp>(create);
  static GetBlackListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SimpleUser> get users => $_getList(0);
}

class ThirdPartyBindReq extends $pb.GeneratedMessage {
  factory ThirdPartyBindReq({
    ThirdParty? thirdParty,
    $core.String? bindToken,
    $core.bool? isUnbind,
    $core.String? appleNickname,
  }) {
    final result = create();
    if (thirdParty != null) result.thirdParty = thirdParty;
    if (bindToken != null) result.bindToken = bindToken;
    if (isUnbind != null) result.isUnbind = isUnbind;
    if (appleNickname != null) result.appleNickname = appleNickname;
    return result;
  }

  ThirdPartyBindReq._();

  factory ThirdPartyBindReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ThirdPartyBindReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ThirdPartyBindReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aE<ThirdParty>(1, _omitFieldNames ? '' : 'thirdParty',
        enumValues: ThirdParty.values)
    ..aOS(2, _omitFieldNames ? '' : 'bindToken')
    ..aOB(3, _omitFieldNames ? '' : 'isUnbind')
    ..aOS(4, _omitFieldNames ? '' : 'appleNickname')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ThirdPartyBindReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ThirdPartyBindReq copyWith(void Function(ThirdPartyBindReq) updates) =>
      super.copyWith((message) => updates(message as ThirdPartyBindReq))
          as ThirdPartyBindReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ThirdPartyBindReq create() => ThirdPartyBindReq._();
  @$core.override
  ThirdPartyBindReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ThirdPartyBindReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ThirdPartyBindReq>(create);
  static ThirdPartyBindReq? _defaultInstance;

  @$pb.TagNumber(1)
  ThirdParty get thirdParty => $_getN(0);
  @$pb.TagNumber(1)
  set thirdParty(ThirdParty value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasThirdParty() => $_has(0);
  @$pb.TagNumber(1)
  void clearThirdParty() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get bindToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set bindToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBindToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearBindToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isUnbind => $_getBF(2);
  @$pb.TagNumber(3)
  set isUnbind($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsUnbind() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsUnbind() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get appleNickname => $_getSZ(3);
  @$pb.TagNumber(4)
  set appleNickname($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAppleNickname() => $_has(3);
  @$pb.TagNumber(4)
  void clearAppleNickname() => $_clearField(4);
}

class CancelAccountReq extends $pb.GeneratedMessage {
  factory CancelAccountReq({
    $core.String? code,
  }) {
    final result = create();
    if (code != null) result.code = code;
    return result;
  }

  CancelAccountReq._();

  factory CancelAccountReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelAccountReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelAccountReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelAccountReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelAccountReq copyWith(void Function(CancelAccountReq) updates) =>
      super.copyWith((message) => updates(message as CancelAccountReq))
          as CancelAccountReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelAccountReq create() => CancelAccountReq._();
  @$core.override
  CancelAccountReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CancelAccountReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelAccountReq>(create);
  static CancelAccountReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);
}

class AccountSecurityInfoResp extends $pb.GeneratedMessage {
  factory AccountSecurityInfoResp({
    $core.String? boundPhone,
    $core.String? boundWechat,
    $core.String? boundQq,
    $core.String? boundApple,
    $core.bool? isIdentifyAuthenticated,
    $core.bool? hasApplyForCancel,
    $3.AccountBindings? accountBindings,
  }) {
    final result = create();
    if (boundPhone != null) result.boundPhone = boundPhone;
    if (boundWechat != null) result.boundWechat = boundWechat;
    if (boundQq != null) result.boundQq = boundQq;
    if (boundApple != null) result.boundApple = boundApple;
    if (isIdentifyAuthenticated != null)
      result.isIdentifyAuthenticated = isIdentifyAuthenticated;
    if (hasApplyForCancel != null) result.hasApplyForCancel = hasApplyForCancel;
    if (accountBindings != null) result.accountBindings = accountBindings;
    return result;
  }

  AccountSecurityInfoResp._();

  factory AccountSecurityInfoResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AccountSecurityInfoResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AccountSecurityInfoResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'boundPhone')
    ..aOS(2, _omitFieldNames ? '' : 'boundWechat')
    ..aOS(3, _omitFieldNames ? '' : 'boundQq')
    ..aOS(4, _omitFieldNames ? '' : 'boundApple')
    ..aOB(5, _omitFieldNames ? '' : 'isIdentifyAuthenticated')
    ..aOB(6, _omitFieldNames ? '' : 'hasApplyForCancel')
    ..aOM<$3.AccountBindings>(7, _omitFieldNames ? '' : 'accountBindings',
        subBuilder: $3.AccountBindings.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccountSecurityInfoResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccountSecurityInfoResp copyWith(
          void Function(AccountSecurityInfoResp) updates) =>
      super.copyWith((message) => updates(message as AccountSecurityInfoResp))
          as AccountSecurityInfoResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountSecurityInfoResp create() => AccountSecurityInfoResp._();
  @$core.override
  AccountSecurityInfoResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AccountSecurityInfoResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountSecurityInfoResp>(create);
  static AccountSecurityInfoResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get boundPhone => $_getSZ(0);
  @$pb.TagNumber(1)
  set boundPhone($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBoundPhone() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoundPhone() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get boundWechat => $_getSZ(1);
  @$pb.TagNumber(2)
  set boundWechat($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBoundWechat() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoundWechat() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get boundQq => $_getSZ(2);
  @$pb.TagNumber(3)
  set boundQq($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBoundQq() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoundQq() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get boundApple => $_getSZ(3);
  @$pb.TagNumber(4)
  set boundApple($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBoundApple() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoundApple() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isIdentifyAuthenticated => $_getBF(4);
  @$pb.TagNumber(5)
  set isIdentifyAuthenticated($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsIdentifyAuthenticated() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsIdentifyAuthenticated() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get hasApplyForCancel => $_getBF(5);
  @$pb.TagNumber(6)
  set hasApplyForCancel($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasHasApplyForCancel() => $_has(5);
  @$pb.TagNumber(6)
  void clearHasApplyForCancel() => $_clearField(6);

  @$pb.TagNumber(7)
  $3.AccountBindings get accountBindings => $_getN(6);
  @$pb.TagNumber(7)
  set accountBindings($3.AccountBindings value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasAccountBindings() => $_has(6);
  @$pb.TagNumber(7)
  void clearAccountBindings() => $_clearField(7);
  @$pb.TagNumber(7)
  $3.AccountBindings ensureAccountBindings() => $_ensure(6);
}

class SimpleGsUser extends $pb.GeneratedMessage {
  factory SimpleGsUser({
    $core.int? age,
    $core.String? constellation,
    $core.int? height,
    $core.int? weight,
    $core.String? audioUrl,
    $core.int? audioLength,
    $fixnum.Int64? id,
    $core.String? nickname,
    $core.String? avatar,
    $core.String? gender,
  }) {
    final result = create();
    if (age != null) result.age = age;
    if (constellation != null) result.constellation = constellation;
    if (height != null) result.height = height;
    if (weight != null) result.weight = weight;
    if (audioUrl != null) result.audioUrl = audioUrl;
    if (audioLength != null) result.audioLength = audioLength;
    if (id != null) result.id = id;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    if (gender != null) result.gender = gender;
    return result;
  }

  SimpleGsUser._();

  factory SimpleGsUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SimpleGsUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SimpleGsUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'age')
    ..aOS(2, _omitFieldNames ? '' : 'constellation')
    ..aI(3, _omitFieldNames ? '' : 'height')
    ..aI(4, _omitFieldNames ? '' : 'weight')
    ..aOS(5, _omitFieldNames ? '' : 'audioUrl')
    ..aI(6, _omitFieldNames ? '' : 'audioLength')
    ..aInt64(7, _omitFieldNames ? '' : 'id')
    ..aOS(8, _omitFieldNames ? '' : 'nickname')
    ..aOS(9, _omitFieldNames ? '' : 'avatar')
    ..aOS(10, _omitFieldNames ? '' : 'gender')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleGsUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SimpleGsUser copyWith(void Function(SimpleGsUser) updates) =>
      super.copyWith((message) => updates(message as SimpleGsUser))
          as SimpleGsUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SimpleGsUser create() => SimpleGsUser._();
  @$core.override
  SimpleGsUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SimpleGsUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SimpleGsUser>(create);
  static SimpleGsUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get age => $_getIZ(0);
  @$pb.TagNumber(1)
  set age($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAge() => $_has(0);
  @$pb.TagNumber(1)
  void clearAge() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get constellation => $_getSZ(1);
  @$pb.TagNumber(2)
  set constellation($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConstellation() => $_has(1);
  @$pb.TagNumber(2)
  void clearConstellation() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get height => $_getIZ(2);
  @$pb.TagNumber(3)
  set height($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get weight => $_getIZ(3);
  @$pb.TagNumber(4)
  set weight($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeight() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get audioUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set audioUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAudioUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearAudioUrl() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get audioLength => $_getIZ(5);
  @$pb.TagNumber(6)
  set audioLength($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAudioLength() => $_has(5);
  @$pb.TagNumber(6)
  void clearAudioLength() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get id => $_getI64(6);
  @$pb.TagNumber(7)
  set id($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasId() => $_has(6);
  @$pb.TagNumber(7)
  void clearId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get nickname => $_getSZ(7);
  @$pb.TagNumber(8)
  set nickname($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasNickname() => $_has(7);
  @$pb.TagNumber(8)
  void clearNickname() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get avatar => $_getSZ(8);
  @$pb.TagNumber(9)
  set avatar($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasAvatar() => $_has(8);
  @$pb.TagNumber(9)
  void clearAvatar() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get gender => $_getSZ(9);
  @$pb.TagNumber(10)
  set gender($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasGender() => $_has(9);
  @$pb.TagNumber(10)
  void clearGender() => $_clearField(10);
}

class RelationChangeMessage extends $pb.GeneratedMessage {
  factory RelationChangeMessage({
    RelationChangeType? type,
    $fixnum.Int64? fromUid,
    $fixnum.Int64? toUid,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (fromUid != null) result.fromUid = fromUid;
    if (toUid != null) result.toUid = toUid;
    return result;
  }

  RelationChangeMessage._();

  factory RelationChangeMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RelationChangeMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RelationChangeMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aE<RelationChangeType>(1, _omitFieldNames ? '' : 'type',
        enumValues: RelationChangeType.values)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'fromUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'toUid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RelationChangeMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RelationChangeMessage copyWith(
          void Function(RelationChangeMessage) updates) =>
      super.copyWith((message) => updates(message as RelationChangeMessage))
          as RelationChangeMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RelationChangeMessage create() => RelationChangeMessage._();
  @$core.override
  RelationChangeMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RelationChangeMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RelationChangeMessage>(create);
  static RelationChangeMessage? _defaultInstance;

  @$pb.TagNumber(1)
  RelationChangeType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(RelationChangeType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get fromUid => $_getI64(1);
  @$pb.TagNumber(2)
  set fromUid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFromUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get toUid => $_getI64(2);
  @$pb.TagNumber(3)
  set toUid($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasToUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearToUid() => $_clearField(3);
}

class GiftItem extends $pb.GeneratedMessage {
  factory GiftItem({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? icon,
    $core.bool? canBuy,
    $fixnum.Int64? price,
    $core.String? description,
    $core.String? dynamicResource,
    $core.bool? isDefaultGift,
    $core.bool? isHighlight,
    $core.String? senderHeadImg,
    $core.int? receiveCount,
    $core.bool? isTimeLimited,
    $fixnum.Int64? limitTimeStart,
    $fixnum.Int64? limitTimeEnd,
    $core.int? level,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (canBuy != null) result.canBuy = canBuy;
    if (price != null) result.price = price;
    if (description != null) result.description = description;
    if (dynamicResource != null) result.dynamicResource = dynamicResource;
    if (isDefaultGift != null) result.isDefaultGift = isDefaultGift;
    if (isHighlight != null) result.isHighlight = isHighlight;
    if (senderHeadImg != null) result.senderHeadImg = senderHeadImg;
    if (receiveCount != null) result.receiveCount = receiveCount;
    if (isTimeLimited != null) result.isTimeLimited = isTimeLimited;
    if (limitTimeStart != null) result.limitTimeStart = limitTimeStart;
    if (limitTimeEnd != null) result.limitTimeEnd = limitTimeEnd;
    if (level != null) result.level = level;
    return result;
  }

  GiftItem._();

  factory GiftItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GiftItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GiftItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aOB(4, _omitFieldNames ? '' : 'canBuy')
    ..aInt64(5, _omitFieldNames ? '' : 'price')
    ..aOS(6, _omitFieldNames ? '' : 'description')
    ..aOS(7, _omitFieldNames ? '' : 'dynamicResource')
    ..aOB(8, _omitFieldNames ? '' : 'isDefaultGift')
    ..aOB(9, _omitFieldNames ? '' : 'isHighlight')
    ..aOS(10, _omitFieldNames ? '' : 'senderHeadImg')
    ..aI(11, _omitFieldNames ? '' : 'receiveCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aOB(12, _omitFieldNames ? '' : 'isTimeLimited')
    ..aInt64(13, _omitFieldNames ? '' : 'limitTimeStart')
    ..aInt64(14, _omitFieldNames ? '' : 'limitTimeEnd')
    ..aI(15, _omitFieldNames ? '' : 'level')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftItem copyWith(void Function(GiftItem) updates) =>
      super.copyWith((message) => updates(message as GiftItem)) as GiftItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GiftItem create() => GiftItem._();
  @$core.override
  GiftItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GiftItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GiftItem>(create);
  static GiftItem? _defaultInstance;

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
  $core.bool get isDefaultGift => $_getBF(7);
  @$pb.TagNumber(8)
  set isDefaultGift($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIsDefaultGift() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsDefaultGift() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isHighlight => $_getBF(8);
  @$pb.TagNumber(9)
  set isHighlight($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasIsHighlight() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsHighlight() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get senderHeadImg => $_getSZ(9);
  @$pb.TagNumber(10)
  set senderHeadImg($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasSenderHeadImg() => $_has(9);
  @$pb.TagNumber(10)
  void clearSenderHeadImg() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get receiveCount => $_getIZ(10);
  @$pb.TagNumber(11)
  set receiveCount($core.int value) => $_setUnsignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasReceiveCount() => $_has(10);
  @$pb.TagNumber(11)
  void clearReceiveCount() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get isTimeLimited => $_getBF(11);
  @$pb.TagNumber(12)
  set isTimeLimited($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasIsTimeLimited() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsTimeLimited() => $_clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get limitTimeStart => $_getI64(12);
  @$pb.TagNumber(13)
  set limitTimeStart($fixnum.Int64 value) => $_setInt64(12, value);
  @$pb.TagNumber(13)
  $core.bool hasLimitTimeStart() => $_has(12);
  @$pb.TagNumber(13)
  void clearLimitTimeStart() => $_clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get limitTimeEnd => $_getI64(13);
  @$pb.TagNumber(14)
  set limitTimeEnd($fixnum.Int64 value) => $_setInt64(13, value);
  @$pb.TagNumber(14)
  $core.bool hasLimitTimeEnd() => $_has(13);
  @$pb.TagNumber(14)
  void clearLimitTimeEnd() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.int get level => $_getIZ(14);
  @$pb.TagNumber(15)
  set level($core.int value) => $_setSignedInt32(14, value);
  @$pb.TagNumber(15)
  $core.bool hasLevel() => $_has(14);
  @$pb.TagNumber(15)
  void clearLevel() => $_clearField(15);
}

class GiftWallData extends $pb.GeneratedMessage {
  factory GiftWallData({
    $core.Iterable<GiftItem>? item,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    return result;
  }

  GiftWallData._();

  factory GiftWallData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GiftWallData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GiftWallData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..pPM<GiftItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: GiftItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftWallData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftWallData copyWith(void Function(GiftWallData) updates) =>
      super.copyWith((message) => updates(message as GiftWallData))
          as GiftWallData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GiftWallData create() => GiftWallData._();
  @$core.override
  GiftWallData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GiftWallData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftWallData>(create);
  static GiftWallData? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GiftItem> get item => $_getList(0);
}

class BindEmailReq extends $pb.GeneratedMessage {
  factory BindEmailReq({
    $core.String? email,
    $core.String? code,
  }) {
    final result = create();
    if (email != null) result.email = email;
    if (code != null) result.code = code;
    return result;
  }

  BindEmailReq._();

  factory BindEmailReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BindEmailReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BindEmailReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindEmailReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BindEmailReq copyWith(void Function(BindEmailReq) updates) =>
      super.copyWith((message) => updates(message as BindEmailReq))
          as BindEmailReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BindEmailReq create() => BindEmailReq._();
  @$core.override
  BindEmailReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BindEmailReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BindEmailReq>(create);
  static BindEmailReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);
}

class AtUser extends $pb.GeneratedMessage {
  factory AtUser({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? icon,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    return result;
  }

  AtUser._();

  factory AtUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AtUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AtUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AtUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AtUser copyWith(void Function(AtUser) updates) =>
      super.copyWith((message) => updates(message as AtUser)) as AtUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AtUser create() => AtUser._();
  @$core.override
  AtUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AtUser getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AtUser>(create);
  static AtUser? _defaultInstance;

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
}

class UserFaceReq extends $pb.GeneratedMessage {
  factory UserFaceReq({
    $core.String? url,
  }) {
    final result = create();
    if (url != null) result.url = url;
    return result;
  }

  UserFaceReq._();

  factory UserFaceReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserFaceReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserFaceReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserFaceReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserFaceReq copyWith(void Function(UserFaceReq) updates) =>
      super.copyWith((message) => updates(message as UserFaceReq))
          as UserFaceReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserFaceReq create() => UserFaceReq._();
  @$core.override
  UserFaceReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserFaceReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserFaceReq>(create);
  static UserFaceReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);
}

class UserChannelInfoReq extends $pb.GeneratedMessage {
  factory UserChannelInfoReq({
    $core.String? gender,
    $core.String? age,
    $core.String? phone,
    $core.String? salary,
  }) {
    final result = create();
    if (gender != null) result.gender = gender;
    if (age != null) result.age = age;
    if (phone != null) result.phone = phone;
    if (salary != null) result.salary = salary;
    return result;
  }

  UserChannelInfoReq._();

  factory UserChannelInfoReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserChannelInfoReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserChannelInfoReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gender')
    ..aOS(2, _omitFieldNames ? '' : 'age')
    ..aOS(3, _omitFieldNames ? '' : 'phone')
    ..aOS(4, _omitFieldNames ? '' : 'salary')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserChannelInfoReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserChannelInfoReq copyWith(void Function(UserChannelInfoReq) updates) =>
      super.copyWith((message) => updates(message as UserChannelInfoReq))
          as UserChannelInfoReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserChannelInfoReq create() => UserChannelInfoReq._();
  @$core.override
  UserChannelInfoReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserChannelInfoReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserChannelInfoReq>(create);
  static UserChannelInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gender => $_getSZ(0);
  @$pb.TagNumber(1)
  set gender($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGender() => $_has(0);
  @$pb.TagNumber(1)
  void clearGender() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get age => $_getSZ(1);
  @$pb.TagNumber(2)
  set age($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAge() => $_has(1);
  @$pb.TagNumber(2)
  void clearAge() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get phone => $_getSZ(2);
  @$pb.TagNumber(3)
  set phone($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPhone() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhone() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get salary => $_getSZ(3);
  @$pb.TagNumber(4)
  set salary($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSalary() => $_has(3);
  @$pb.TagNumber(4)
  void clearSalary() => $_clearField(4);
}

class AdjustRsp extends $pb.GeneratedMessage {
  factory AdjustRsp({
    $core.bool? showEdit,
    $core.bool? showTrain,
  }) {
    final result = create();
    if (showEdit != null) result.showEdit = showEdit;
    if (showTrain != null) result.showTrain = showTrain;
    return result;
  }

  AdjustRsp._();

  factory AdjustRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AdjustRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AdjustRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'showEdit', protoName: 'showEdit')
    ..aOB(2, _omitFieldNames ? '' : 'showTrain', protoName: 'showTrain')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AdjustRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AdjustRsp copyWith(void Function(AdjustRsp) updates) =>
      super.copyWith((message) => updates(message as AdjustRsp)) as AdjustRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdjustRsp create() => AdjustRsp._();
  @$core.override
  AdjustRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AdjustRsp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdjustRsp>(create);
  static AdjustRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get showEdit => $_getBF(0);
  @$pb.TagNumber(1)
  set showEdit($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasShowEdit() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowEdit() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get showTrain => $_getBF(1);
  @$pb.TagNumber(2)
  set showTrain($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasShowTrain() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowTrain() => $_clearField(2);
}

class TopicTextRsp extends $pb.GeneratedMessage {
  factory TopicTextRsp({
    $core.Iterable<$core.String>? texts,
  }) {
    final result = create();
    if (texts != null) result.texts.addAll(texts);
    return result;
  }

  TopicTextRsp._();

  factory TopicTextRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TopicTextRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TopicTextRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'texts')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TopicTextRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TopicTextRsp copyWith(void Function(TopicTextRsp) updates) =>
      super.copyWith((message) => updates(message as TopicTextRsp))
          as TopicTextRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TopicTextRsp create() => TopicTextRsp._();
  @$core.override
  TopicTextRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TopicTextRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TopicTextRsp>(create);
  static TopicTextRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get texts => $_getList(0);
}

/// POST /face/feedback
class FaceFeedbackReq extends $pb.GeneratedMessage {
  factory FaceFeedbackReq({
    $core.String? email,
  }) {
    final result = create();
    if (email != null) result.email = email;
    return result;
  }

  FaceFeedbackReq._();

  factory FaceFeedbackReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FaceFeedbackReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FaceFeedbackReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'user'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FaceFeedbackReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FaceFeedbackReq copyWith(void Function(FaceFeedbackReq) updates) =>
      super.copyWith((message) => updates(message as FaceFeedbackReq))
          as FaceFeedbackReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FaceFeedbackReq create() => FaceFeedbackReq._();
  @$core.override
  FaceFeedbackReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FaceFeedbackReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FaceFeedbackReq>(create);
  static FaceFeedbackReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

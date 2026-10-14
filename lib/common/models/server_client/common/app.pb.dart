// This is a generated file - do not edit.
//
// Generated from server_client/common/app.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../chat.pbenum.dart' as $4;
import '../label.pb.dart' as $0;
import '../pay_strategy.pb.dart' as $1;
import '../rtc.pb.dart' as $3;
import '../user.pb.dart' as $2;
import 'app.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'app.pbenum.dart';

class AppConfigData extends $pb.GeneratedMessage {
  factory AppConfigData() => create();

  AppConfigData._();

  factory AppConfigData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AppConfigData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AppConfigData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonApp'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppConfigData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AppConfigData copyWith(void Function(AppConfigData) updates) =>
      super.copyWith((message) => updates(message as AppConfigData))
          as AppConfigData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AppConfigData create() => AppConfigData._();
  @$core.override
  AppConfigData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AppConfigData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AppConfigData>(create);
  static AppConfigData? _defaultInstance;
}

class VersionUpdateData extends $pb.GeneratedMessage {
  factory VersionUpdateData({
    $core.String? updateText,
    $core.String? updateLink,
    $core.int? latestVersionNo,
    $core.String? latestVersion,
    UpdateMode? updateMod,
  }) {
    final result = create();
    if (updateText != null) result.updateText = updateText;
    if (updateLink != null) result.updateLink = updateLink;
    if (latestVersionNo != null) result.latestVersionNo = latestVersionNo;
    if (latestVersion != null) result.latestVersion = latestVersion;
    if (updateMod != null) result.updateMod = updateMod;
    return result;
  }

  VersionUpdateData._();

  factory VersionUpdateData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VersionUpdateData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VersionUpdateData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonApp'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'updateText')
    ..aOS(2, _omitFieldNames ? '' : 'updateLink')
    ..aI(3, _omitFieldNames ? '' : 'latestVersionNo',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'latestVersion')
    ..aE<UpdateMode>(5, _omitFieldNames ? '' : 'updateMod',
        enumValues: UpdateMode.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VersionUpdateData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VersionUpdateData copyWith(void Function(VersionUpdateData) updates) =>
      super.copyWith((message) => updates(message as VersionUpdateData))
          as VersionUpdateData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VersionUpdateData create() => VersionUpdateData._();
  @$core.override
  VersionUpdateData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VersionUpdateData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VersionUpdateData>(create);
  static VersionUpdateData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get updateText => $_getSZ(0);
  @$pb.TagNumber(1)
  set updateText($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUpdateText() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdateText() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get updateLink => $_getSZ(1);
  @$pb.TagNumber(2)
  set updateLink($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUpdateLink() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdateLink() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get latestVersionNo => $_getIZ(2);
  @$pb.TagNumber(3)
  set latestVersionNo($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLatestVersionNo() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatestVersionNo() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get latestVersion => $_getSZ(3);
  @$pb.TagNumber(4)
  set latestVersion($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLatestVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearLatestVersion() => $_clearField(4);

  @$pb.TagNumber(5)
  UpdateMode get updateMod => $_getN(4);
  @$pb.TagNumber(5)
  set updateMod(UpdateMode value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasUpdateMod() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdateMod() => $_clearField(5);
}

class SetSettingsReq extends $pb.GeneratedMessage {
  factory SetSettingsReq({
    $core.bool? isHidden,
    $core.bool? accessStrangerMessage,
    $core.bool? isPersonalizedRecommend,
    $core.int? quickMsgState,
    $core.bool? isInvisibleEnterRoom,
    $core.bool? isInvisibleVisit,
    $core.bool? isInvisibleRank,
    $core.bool? isInvisibleUpMic,
    $core.bool? closeGameCenterNotice,
    $core.bool? hiddenCp,
    GameCurrency? gameCurrency,
  }) {
    final result = create();
    if (isHidden != null) result.isHidden = isHidden;
    if (accessStrangerMessage != null)
      result.accessStrangerMessage = accessStrangerMessage;
    if (isPersonalizedRecommend != null)
      result.isPersonalizedRecommend = isPersonalizedRecommend;
    if (quickMsgState != null) result.quickMsgState = quickMsgState;
    if (isInvisibleEnterRoom != null)
      result.isInvisibleEnterRoom = isInvisibleEnterRoom;
    if (isInvisibleVisit != null) result.isInvisibleVisit = isInvisibleVisit;
    if (isInvisibleRank != null) result.isInvisibleRank = isInvisibleRank;
    if (isInvisibleUpMic != null) result.isInvisibleUpMic = isInvisibleUpMic;
    if (closeGameCenterNotice != null)
      result.closeGameCenterNotice = closeGameCenterNotice;
    if (hiddenCp != null) result.hiddenCp = hiddenCp;
    if (gameCurrency != null) result.gameCurrency = gameCurrency;
    return result;
  }

  SetSettingsReq._();

  factory SetSettingsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetSettingsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetSettingsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonApp'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isHidden')
    ..aOB(2, _omitFieldNames ? '' : 'accessStrangerMessage')
    ..aOB(3, _omitFieldNames ? '' : 'isPersonalizedRecommend')
    ..aI(4, _omitFieldNames ? '' : 'quickMsgState')
    ..aOB(5, _omitFieldNames ? '' : 'isInvisibleEnterRoom')
    ..aOB(6, _omitFieldNames ? '' : 'isInvisibleVisit')
    ..aOB(7, _omitFieldNames ? '' : 'isInvisibleRank')
    ..aOB(8, _omitFieldNames ? '' : 'isInvisibleUpMic')
    ..aOB(9, _omitFieldNames ? '' : 'closeGameCenterNotice')
    ..aOB(10, _omitFieldNames ? '' : 'hiddenCp')
    ..aE<GameCurrency>(11, _omitFieldNames ? '' : 'gameCurrency',
        enumValues: GameCurrency.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetSettingsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetSettingsReq copyWith(void Function(SetSettingsReq) updates) =>
      super.copyWith((message) => updates(message as SetSettingsReq))
          as SetSettingsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetSettingsReq create() => SetSettingsReq._();
  @$core.override
  SetSettingsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetSettingsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetSettingsReq>(create);
  static SetSettingsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isHidden => $_getBF(0);
  @$pb.TagNumber(1)
  set isHidden($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsHidden() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsHidden() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get accessStrangerMessage => $_getBF(1);
  @$pb.TagNumber(2)
  set accessStrangerMessage($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAccessStrangerMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccessStrangerMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isPersonalizedRecommend => $_getBF(2);
  @$pb.TagNumber(3)
  set isPersonalizedRecommend($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsPersonalizedRecommend() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsPersonalizedRecommend() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get quickMsgState => $_getIZ(3);
  @$pb.TagNumber(4)
  set quickMsgState($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuickMsgState() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuickMsgState() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isInvisibleEnterRoom => $_getBF(4);
  @$pb.TagNumber(5)
  set isInvisibleEnterRoom($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIsInvisibleEnterRoom() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsInvisibleEnterRoom() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isInvisibleVisit => $_getBF(5);
  @$pb.TagNumber(6)
  set isInvisibleVisit($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsInvisibleVisit() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsInvisibleVisit() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isInvisibleRank => $_getBF(6);
  @$pb.TagNumber(7)
  set isInvisibleRank($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasIsInvisibleRank() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsInvisibleRank() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isInvisibleUpMic => $_getBF(7);
  @$pb.TagNumber(8)
  set isInvisibleUpMic($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIsInvisibleUpMic() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsInvisibleUpMic() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get closeGameCenterNotice => $_getBF(8);
  @$pb.TagNumber(9)
  set closeGameCenterNotice($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCloseGameCenterNotice() => $_has(8);
  @$pb.TagNumber(9)
  void clearCloseGameCenterNotice() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get hiddenCp => $_getBF(9);
  @$pb.TagNumber(10)
  set hiddenCp($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasHiddenCp() => $_has(9);
  @$pb.TagNumber(10)
  void clearHiddenCp() => $_clearField(10);

  @$pb.TagNumber(11)
  GameCurrency get gameCurrency => $_getN(10);
  @$pb.TagNumber(11)
  set gameCurrency(GameCurrency value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasGameCurrency() => $_has(10);
  @$pb.TagNumber(11)
  void clearGameCurrency() => $_clearField(11);
}

class GetSettingsResp extends $pb.GeneratedMessage {
  factory GetSettingsResp({
    $core.bool? success,
    $core.String? message,
    $core.bool? isTeenagerMode,
    $core.Iterable<$core.String>? reportReasons,
    $core.bool? magicU,
    $core.bool? isHidden,
    $core.bool? accessStrangerMessage,
    $core.bool? isPersonalizedRecommend,
    $core.Iterable<$0.LabelItem>? likeLabels,
    $core.Iterable<$0.LabelItem>? wantLabels,
    $core.Iterable<$core.MapEntry<$core.String, $core.int>>? rideToPrice,
    $core.int? privateAgreementVer,
    $core.int? userAgreementVer,
    $core.int? quickMsgState,
    $core.bool? isInvisibleEnterRoom,
    $core.bool? isInvisibleVisit,
    $core.bool? isInvisibleRank,
    $core.bool? isInvisibleUpMic,
    $core.bool? closeGameCenterNotice,
    $core.String? translateKey,
    $core.bool? showAuthCenter,
    $core.int? disableGpRv,
    $core.int? pure,
    $core.int? hasShowRvStep,
    $core.int? birthYear,
    $1.PayStrategy? payStrategy,
    $core.bool? trainMatch,
    $core.String? trainState,
    $core.bool? hrNormal,
    $core.bool? showStartGsTrain,
    $core.bool? hasBindFace,
    $core.bool? needCheckFace,
    $core.int? checkFaceStatus,
    $core.int? crystal,
    $core.String? hrTrainBoard,
    $core.bool? needUploadLog,
    $core.bool? hiddenCp,
    $core.bool? shareUser,
    $core.String? duId,
    $core.String? duKey,
    $core.bool? needShowEdit,
    $core.bool? targetChannelGs,
    $core.bool? showGsConversionTaskDialog,
    $core.bool? addressMatch,
    $core.bool? channelMatch,
    $4.ChatRoleType? chatRole,
    GameCurrency? gameCurrency,
    $core.bool? hasFirstRechargePack,
    LuckyChallengeCfg? luckyChallengeCfg,
    $core.String? rechargeEventUrl,
    $core.String? aiProfileUrl,
    $core.bool? rechargeExceedThreshold,
    $core.String? handlerWorkUrl,
    $core.String? leaderWorkUrl,
    $core.bool? viewUser,
    $core.bool? canOpenAutoChat,
    $core.bool? showGameShare,
    $core.bool? translateGlobalEnabled,
    $core.bool? showQuiz,
    $core.bool? showGuardian,
    $core.bool? gemPermission,
    $core.bool? enableMagicPortal,
    $core.int? currencyDailyRemain,
    $core.bool? showGameCurrencySwitch,
    $core.bool? showMerch,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (isTeenagerMode != null) result.isTeenagerMode = isTeenagerMode;
    if (reportReasons != null) result.reportReasons.addAll(reportReasons);
    if (magicU != null) result.magicU = magicU;
    if (isHidden != null) result.isHidden = isHidden;
    if (accessStrangerMessage != null)
      result.accessStrangerMessage = accessStrangerMessage;
    if (isPersonalizedRecommend != null)
      result.isPersonalizedRecommend = isPersonalizedRecommend;
    if (likeLabels != null) result.likeLabels.addAll(likeLabels);
    if (wantLabels != null) result.wantLabels.addAll(wantLabels);
    if (rideToPrice != null) result.rideToPrice.addEntries(rideToPrice);
    if (privateAgreementVer != null)
      result.privateAgreementVer = privateAgreementVer;
    if (userAgreementVer != null) result.userAgreementVer = userAgreementVer;
    if (quickMsgState != null) result.quickMsgState = quickMsgState;
    if (isInvisibleEnterRoom != null)
      result.isInvisibleEnterRoom = isInvisibleEnterRoom;
    if (isInvisibleVisit != null) result.isInvisibleVisit = isInvisibleVisit;
    if (isInvisibleRank != null) result.isInvisibleRank = isInvisibleRank;
    if (isInvisibleUpMic != null) result.isInvisibleUpMic = isInvisibleUpMic;
    if (closeGameCenterNotice != null)
      result.closeGameCenterNotice = closeGameCenterNotice;
    if (translateKey != null) result.translateKey = translateKey;
    if (showAuthCenter != null) result.showAuthCenter = showAuthCenter;
    if (disableGpRv != null) result.disableGpRv = disableGpRv;
    if (pure != null) result.pure = pure;
    if (hasShowRvStep != null) result.hasShowRvStep = hasShowRvStep;
    if (birthYear != null) result.birthYear = birthYear;
    if (payStrategy != null) result.payStrategy = payStrategy;
    if (trainMatch != null) result.trainMatch = trainMatch;
    if (trainState != null) result.trainState = trainState;
    if (hrNormal != null) result.hrNormal = hrNormal;
    if (showStartGsTrain != null) result.showStartGsTrain = showStartGsTrain;
    if (hasBindFace != null) result.hasBindFace = hasBindFace;
    if (needCheckFace != null) result.needCheckFace = needCheckFace;
    if (checkFaceStatus != null) result.checkFaceStatus = checkFaceStatus;
    if (crystal != null) result.crystal = crystal;
    if (hrTrainBoard != null) result.hrTrainBoard = hrTrainBoard;
    if (needUploadLog != null) result.needUploadLog = needUploadLog;
    if (hiddenCp != null) result.hiddenCp = hiddenCp;
    if (shareUser != null) result.shareUser = shareUser;
    if (duId != null) result.duId = duId;
    if (duKey != null) result.duKey = duKey;
    if (needShowEdit != null) result.needShowEdit = needShowEdit;
    if (targetChannelGs != null) result.targetChannelGs = targetChannelGs;
    if (showGsConversionTaskDialog != null)
      result.showGsConversionTaskDialog = showGsConversionTaskDialog;
    if (addressMatch != null) result.addressMatch = addressMatch;
    if (channelMatch != null) result.channelMatch = channelMatch;
    if (chatRole != null) result.chatRole = chatRole;
    if (gameCurrency != null) result.gameCurrency = gameCurrency;
    if (hasFirstRechargePack != null)
      result.hasFirstRechargePack = hasFirstRechargePack;
    if (luckyChallengeCfg != null) result.luckyChallengeCfg = luckyChallengeCfg;
    if (rechargeEventUrl != null) result.rechargeEventUrl = rechargeEventUrl;
    if (aiProfileUrl != null) result.aiProfileUrl = aiProfileUrl;
    if (rechargeExceedThreshold != null)
      result.rechargeExceedThreshold = rechargeExceedThreshold;
    if (handlerWorkUrl != null) result.handlerWorkUrl = handlerWorkUrl;
    if (leaderWorkUrl != null) result.leaderWorkUrl = leaderWorkUrl;
    if (viewUser != null) result.viewUser = viewUser;
    if (canOpenAutoChat != null) result.canOpenAutoChat = canOpenAutoChat;
    if (showGameShare != null) result.showGameShare = showGameShare;
    if (translateGlobalEnabled != null)
      result.translateGlobalEnabled = translateGlobalEnabled;
    if (showQuiz != null) result.showQuiz = showQuiz;
    if (showGuardian != null) result.showGuardian = showGuardian;
    if (gemPermission != null) result.gemPermission = gemPermission;
    if (enableMagicPortal != null) result.enableMagicPortal = enableMagicPortal;
    if (currencyDailyRemain != null)
      result.currencyDailyRemain = currencyDailyRemain;
    if (showGameCurrencySwitch != null)
      result.showGameCurrencySwitch = showGameCurrencySwitch;
    if (showMerch != null) result.showMerch = showMerch;
    return result;
  }

  GetSettingsResp._();

  factory GetSettingsResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSettingsResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSettingsResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonApp'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOB(3, _omitFieldNames ? '' : 'isTeenagerMode')
    ..pPS(4, _omitFieldNames ? '' : 'reportReasons')
    ..aOB(5, _omitFieldNames ? '' : 'magicU')
    ..aOB(6, _omitFieldNames ? '' : 'isHidden')
    ..aOB(7, _omitFieldNames ? '' : 'accessStrangerMessage')
    ..aOB(8, _omitFieldNames ? '' : 'isPersonalizedRecommend')
    ..pPM<$0.LabelItem>(9, _omitFieldNames ? '' : 'likeLabels',
        subBuilder: $0.LabelItem.create)
    ..pPM<$0.LabelItem>(10, _omitFieldNames ? '' : 'wantLabels',
        subBuilder: $0.LabelItem.create)
    ..m<$core.String, $core.int>(11, _omitFieldNames ? '' : 'rideToPrice',
        entryClassName: 'GetSettingsResp.RideToPriceEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O3,
        packageName: const $pb.PackageName('commonApp'))
    ..aI(12, _omitFieldNames ? '' : 'privateAgreementVer',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(13, _omitFieldNames ? '' : 'userAgreementVer',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(14, _omitFieldNames ? '' : 'quickMsgState')
    ..aOB(15, _omitFieldNames ? '' : 'isInvisibleEnterRoom')
    ..aOB(16, _omitFieldNames ? '' : 'isInvisibleVisit')
    ..aOB(17, _omitFieldNames ? '' : 'isInvisibleRank')
    ..aOB(18, _omitFieldNames ? '' : 'isInvisibleUpMic')
    ..aOB(19, _omitFieldNames ? '' : 'closeGameCenterNotice')
    ..aOS(20, _omitFieldNames ? '' : 'translateKey')
    ..aOB(21, _omitFieldNames ? '' : 'showAuthCenter')
    ..aI(22, _omitFieldNames ? '' : 'disableGpRv',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(23, _omitFieldNames ? '' : 'pure', fieldType: $pb.PbFieldType.OU3)
    ..aI(24, _omitFieldNames ? '' : 'hasShowRvStep',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(25, _omitFieldNames ? '' : 'birthYear', fieldType: $pb.PbFieldType.OU3)
    ..aOM<$1.PayStrategy>(26, _omitFieldNames ? '' : 'payStrategy',
        subBuilder: $1.PayStrategy.create)
    ..aOB(27, _omitFieldNames ? '' : 'trainMatch')
    ..aOS(28, _omitFieldNames ? '' : 'trainState')
    ..aOB(29, _omitFieldNames ? '' : 'hrNormal')
    ..aOB(30, _omitFieldNames ? '' : 'showStartGsTrain')
    ..aOB(31, _omitFieldNames ? '' : 'hasBindFace')
    ..aOB(32, _omitFieldNames ? '' : 'needCheckFace')
    ..aI(33, _omitFieldNames ? '' : 'checkFaceStatus')
    ..aI(34, _omitFieldNames ? '' : 'crystal')
    ..aOS(35, _omitFieldNames ? '' : 'hrTrainBoard')
    ..aOB(36, _omitFieldNames ? '' : 'needUploadLog')
    ..aOB(37, _omitFieldNames ? '' : 'hiddenCp')
    ..aOB(38, _omitFieldNames ? '' : 'shareUser')
    ..aOS(39, _omitFieldNames ? '' : 'duId')
    ..aOS(40, _omitFieldNames ? '' : 'duKey')
    ..aOB(41, _omitFieldNames ? '' : 'needShowEdit')
    ..aOB(42, _omitFieldNames ? '' : 'targetChannelGs')
    ..aOB(43, _omitFieldNames ? '' : 'showGsConversionTaskDialog',
        protoName: 'showGsConversionTaskDialog')
    ..aOB(44, _omitFieldNames ? '' : 'addressMatch')
    ..aOB(45, _omitFieldNames ? '' : 'channelMatch')
    ..aE<$4.ChatRoleType>(46, _omitFieldNames ? '' : 'chatRole',
        enumValues: $4.ChatRoleType.values)
    ..aE<GameCurrency>(47, _omitFieldNames ? '' : 'gameCurrency',
        enumValues: GameCurrency.values)
    ..aOB(48, _omitFieldNames ? '' : 'hasFirstRechargePack')
    ..aOM<LuckyChallengeCfg>(49, _omitFieldNames ? '' : 'luckyChallengeCfg',
        subBuilder: LuckyChallengeCfg.create)
    ..aOS(50, _omitFieldNames ? '' : 'rechargeEventUrl',
        protoName: 'rechargeEventUrl')
    ..aOS(51, _omitFieldNames ? '' : 'aiProfileUrl')
    ..aOB(52, _omitFieldNames ? '' : 'rechargeExceedThreshold')
    ..aOS(53, _omitFieldNames ? '' : 'handlerWorkUrl')
    ..aOS(54, _omitFieldNames ? '' : 'leaderWorkUrl')
    ..aOB(55, _omitFieldNames ? '' : 'viewUser')
    ..aOB(56, _omitFieldNames ? '' : 'canOpenAutoChat')
    ..aOB(57, _omitFieldNames ? '' : 'showGameShare')
    ..aOB(58, _omitFieldNames ? '' : 'translateGlobalEnabled')
    ..aOB(59, _omitFieldNames ? '' : 'showQuiz')
    ..aOB(60, _omitFieldNames ? '' : 'showGuardian')
    ..aOB(61, _omitFieldNames ? '' : 'gemPermission')
    ..aOB(62, _omitFieldNames ? '' : 'enableMagicPortal')
    ..aI(63, _omitFieldNames ? '' : 'currencyDailyRemain')
    ..aOB(64, _omitFieldNames ? '' : 'showGameCurrencySwitch')
    ..aOB(65, _omitFieldNames ? '' : 'showMerch')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSettingsResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSettingsResp copyWith(void Function(GetSettingsResp) updates) =>
      super.copyWith((message) => updates(message as GetSettingsResp))
          as GetSettingsResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSettingsResp create() => GetSettingsResp._();
  @$core.override
  GetSettingsResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSettingsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSettingsResp>(create);
  static GetSettingsResp? _defaultInstance;

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
  $core.bool get isTeenagerMode => $_getBF(2);
  @$pb.TagNumber(3)
  set isTeenagerMode($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsTeenagerMode() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsTeenagerMode() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get reportReasons => $_getList(3);

  @$pb.TagNumber(5)
  $core.bool get magicU => $_getBF(4);
  @$pb.TagNumber(5)
  set magicU($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMagicU() => $_has(4);
  @$pb.TagNumber(5)
  void clearMagicU() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isHidden => $_getBF(5);
  @$pb.TagNumber(6)
  set isHidden($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsHidden() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsHidden() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get accessStrangerMessage => $_getBF(6);
  @$pb.TagNumber(7)
  set accessStrangerMessage($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAccessStrangerMessage() => $_has(6);
  @$pb.TagNumber(7)
  void clearAccessStrangerMessage() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isPersonalizedRecommend => $_getBF(7);
  @$pb.TagNumber(8)
  set isPersonalizedRecommend($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIsPersonalizedRecommend() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsPersonalizedRecommend() => $_clearField(8);

  @$pb.TagNumber(9)
  $pb.PbList<$0.LabelItem> get likeLabels => $_getList(8);

  @$pb.TagNumber(10)
  $pb.PbList<$0.LabelItem> get wantLabels => $_getList(9);

  @$pb.TagNumber(11)
  $pb.PbMap<$core.String, $core.int> get rideToPrice => $_getMap(10);

  @$pb.TagNumber(12)
  $core.int get privateAgreementVer => $_getIZ(11);
  @$pb.TagNumber(12)
  set privateAgreementVer($core.int value) => $_setUnsignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasPrivateAgreementVer() => $_has(11);
  @$pb.TagNumber(12)
  void clearPrivateAgreementVer() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get userAgreementVer => $_getIZ(12);
  @$pb.TagNumber(13)
  set userAgreementVer($core.int value) => $_setUnsignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasUserAgreementVer() => $_has(12);
  @$pb.TagNumber(13)
  void clearUserAgreementVer() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.int get quickMsgState => $_getIZ(13);
  @$pb.TagNumber(14)
  set quickMsgState($core.int value) => $_setSignedInt32(13, value);
  @$pb.TagNumber(14)
  $core.bool hasQuickMsgState() => $_has(13);
  @$pb.TagNumber(14)
  void clearQuickMsgState() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.bool get isInvisibleEnterRoom => $_getBF(14);
  @$pb.TagNumber(15)
  set isInvisibleEnterRoom($core.bool value) => $_setBool(14, value);
  @$pb.TagNumber(15)
  $core.bool hasIsInvisibleEnterRoom() => $_has(14);
  @$pb.TagNumber(15)
  void clearIsInvisibleEnterRoom() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.bool get isInvisibleVisit => $_getBF(15);
  @$pb.TagNumber(16)
  set isInvisibleVisit($core.bool value) => $_setBool(15, value);
  @$pb.TagNumber(16)
  $core.bool hasIsInvisibleVisit() => $_has(15);
  @$pb.TagNumber(16)
  void clearIsInvisibleVisit() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.bool get isInvisibleRank => $_getBF(16);
  @$pb.TagNumber(17)
  set isInvisibleRank($core.bool value) => $_setBool(16, value);
  @$pb.TagNumber(17)
  $core.bool hasIsInvisibleRank() => $_has(16);
  @$pb.TagNumber(17)
  void clearIsInvisibleRank() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.bool get isInvisibleUpMic => $_getBF(17);
  @$pb.TagNumber(18)
  set isInvisibleUpMic($core.bool value) => $_setBool(17, value);
  @$pb.TagNumber(18)
  $core.bool hasIsInvisibleUpMic() => $_has(17);
  @$pb.TagNumber(18)
  void clearIsInvisibleUpMic() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.bool get closeGameCenterNotice => $_getBF(18);
  @$pb.TagNumber(19)
  set closeGameCenterNotice($core.bool value) => $_setBool(18, value);
  @$pb.TagNumber(19)
  $core.bool hasCloseGameCenterNotice() => $_has(18);
  @$pb.TagNumber(19)
  void clearCloseGameCenterNotice() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.String get translateKey => $_getSZ(19);
  @$pb.TagNumber(20)
  set translateKey($core.String value) => $_setString(19, value);
  @$pb.TagNumber(20)
  $core.bool hasTranslateKey() => $_has(19);
  @$pb.TagNumber(20)
  void clearTranslateKey() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.bool get showAuthCenter => $_getBF(20);
  @$pb.TagNumber(21)
  set showAuthCenter($core.bool value) => $_setBool(20, value);
  @$pb.TagNumber(21)
  $core.bool hasShowAuthCenter() => $_has(20);
  @$pb.TagNumber(21)
  void clearShowAuthCenter() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.int get disableGpRv => $_getIZ(21);
  @$pb.TagNumber(22)
  set disableGpRv($core.int value) => $_setUnsignedInt32(21, value);
  @$pb.TagNumber(22)
  $core.bool hasDisableGpRv() => $_has(21);
  @$pb.TagNumber(22)
  void clearDisableGpRv() => $_clearField(22);

  @$pb.TagNumber(23)
  $core.int get pure => $_getIZ(22);
  @$pb.TagNumber(23)
  set pure($core.int value) => $_setUnsignedInt32(22, value);
  @$pb.TagNumber(23)
  $core.bool hasPure() => $_has(22);
  @$pb.TagNumber(23)
  void clearPure() => $_clearField(23);

  @$pb.TagNumber(24)
  $core.int get hasShowRvStep => $_getIZ(23);
  @$pb.TagNumber(24)
  set hasShowRvStep($core.int value) => $_setUnsignedInt32(23, value);
  @$pb.TagNumber(24)
  $core.bool hasHasShowRvStep() => $_has(23);
  @$pb.TagNumber(24)
  void clearHasShowRvStep() => $_clearField(24);

  @$pb.TagNumber(25)
  $core.int get birthYear => $_getIZ(24);
  @$pb.TagNumber(25)
  set birthYear($core.int value) => $_setUnsignedInt32(24, value);
  @$pb.TagNumber(25)
  $core.bool hasBirthYear() => $_has(24);
  @$pb.TagNumber(25)
  void clearBirthYear() => $_clearField(25);

  @$pb.TagNumber(26)
  $1.PayStrategy get payStrategy => $_getN(25);
  @$pb.TagNumber(26)
  set payStrategy($1.PayStrategy value) => $_setField(26, value);
  @$pb.TagNumber(26)
  $core.bool hasPayStrategy() => $_has(25);
  @$pb.TagNumber(26)
  void clearPayStrategy() => $_clearField(26);
  @$pb.TagNumber(26)
  $1.PayStrategy ensurePayStrategy() => $_ensure(25);

  @$pb.TagNumber(27)
  $core.bool get trainMatch => $_getBF(26);
  @$pb.TagNumber(27)
  set trainMatch($core.bool value) => $_setBool(26, value);
  @$pb.TagNumber(27)
  $core.bool hasTrainMatch() => $_has(26);
  @$pb.TagNumber(27)
  void clearTrainMatch() => $_clearField(27);

  @$pb.TagNumber(28)
  $core.String get trainState => $_getSZ(27);
  @$pb.TagNumber(28)
  set trainState($core.String value) => $_setString(27, value);
  @$pb.TagNumber(28)
  $core.bool hasTrainState() => $_has(27);
  @$pb.TagNumber(28)
  void clearTrainState() => $_clearField(28);

  @$pb.TagNumber(29)
  $core.bool get hrNormal => $_getBF(28);
  @$pb.TagNumber(29)
  set hrNormal($core.bool value) => $_setBool(28, value);
  @$pb.TagNumber(29)
  $core.bool hasHrNormal() => $_has(28);
  @$pb.TagNumber(29)
  void clearHrNormal() => $_clearField(29);

  @$pb.TagNumber(30)
  $core.bool get showStartGsTrain => $_getBF(29);
  @$pb.TagNumber(30)
  set showStartGsTrain($core.bool value) => $_setBool(29, value);
  @$pb.TagNumber(30)
  $core.bool hasShowStartGsTrain() => $_has(29);
  @$pb.TagNumber(30)
  void clearShowStartGsTrain() => $_clearField(30);

  @$pb.TagNumber(31)
  $core.bool get hasBindFace => $_getBF(30);
  @$pb.TagNumber(31)
  set hasBindFace($core.bool value) => $_setBool(30, value);
  @$pb.TagNumber(31)
  $core.bool hasHasBindFace() => $_has(30);
  @$pb.TagNumber(31)
  void clearHasBindFace() => $_clearField(31);

  @$pb.TagNumber(32)
  $core.bool get needCheckFace => $_getBF(31);
  @$pb.TagNumber(32)
  set needCheckFace($core.bool value) => $_setBool(31, value);
  @$pb.TagNumber(32)
  $core.bool hasNeedCheckFace() => $_has(31);
  @$pb.TagNumber(32)
  void clearNeedCheckFace() => $_clearField(32);

  @$pb.TagNumber(33)
  $core.int get checkFaceStatus => $_getIZ(32);
  @$pb.TagNumber(33)
  set checkFaceStatus($core.int value) => $_setSignedInt32(32, value);
  @$pb.TagNumber(33)
  $core.bool hasCheckFaceStatus() => $_has(32);
  @$pb.TagNumber(33)
  void clearCheckFaceStatus() => $_clearField(33);

  @$pb.TagNumber(34)
  $core.int get crystal => $_getIZ(33);
  @$pb.TagNumber(34)
  set crystal($core.int value) => $_setSignedInt32(33, value);
  @$pb.TagNumber(34)
  $core.bool hasCrystal() => $_has(33);
  @$pb.TagNumber(34)
  void clearCrystal() => $_clearField(34);

  @$pb.TagNumber(35)
  $core.String get hrTrainBoard => $_getSZ(34);
  @$pb.TagNumber(35)
  set hrTrainBoard($core.String value) => $_setString(34, value);
  @$pb.TagNumber(35)
  $core.bool hasHrTrainBoard() => $_has(34);
  @$pb.TagNumber(35)
  void clearHrTrainBoard() => $_clearField(35);

  @$pb.TagNumber(36)
  $core.bool get needUploadLog => $_getBF(35);
  @$pb.TagNumber(36)
  set needUploadLog($core.bool value) => $_setBool(35, value);
  @$pb.TagNumber(36)
  $core.bool hasNeedUploadLog() => $_has(35);
  @$pb.TagNumber(36)
  void clearNeedUploadLog() => $_clearField(36);

  @$pb.TagNumber(37)
  $core.bool get hiddenCp => $_getBF(36);
  @$pb.TagNumber(37)
  set hiddenCp($core.bool value) => $_setBool(36, value);
  @$pb.TagNumber(37)
  $core.bool hasHiddenCp() => $_has(36);
  @$pb.TagNumber(37)
  void clearHiddenCp() => $_clearField(37);

  @$pb.TagNumber(38)
  $core.bool get shareUser => $_getBF(37);
  @$pb.TagNumber(38)
  set shareUser($core.bool value) => $_setBool(37, value);
  @$pb.TagNumber(38)
  $core.bool hasShareUser() => $_has(37);
  @$pb.TagNumber(38)
  void clearShareUser() => $_clearField(38);

  @$pb.TagNumber(39)
  $core.String get duId => $_getSZ(38);
  @$pb.TagNumber(39)
  set duId($core.String value) => $_setString(38, value);
  @$pb.TagNumber(39)
  $core.bool hasDuId() => $_has(38);
  @$pb.TagNumber(39)
  void clearDuId() => $_clearField(39);

  @$pb.TagNumber(40)
  $core.String get duKey => $_getSZ(39);
  @$pb.TagNumber(40)
  set duKey($core.String value) => $_setString(39, value);
  @$pb.TagNumber(40)
  $core.bool hasDuKey() => $_has(39);
  @$pb.TagNumber(40)
  void clearDuKey() => $_clearField(40);

  @$pb.TagNumber(41)
  $core.bool get needShowEdit => $_getBF(40);
  @$pb.TagNumber(41)
  set needShowEdit($core.bool value) => $_setBool(40, value);
  @$pb.TagNumber(41)
  $core.bool hasNeedShowEdit() => $_has(40);
  @$pb.TagNumber(41)
  void clearNeedShowEdit() => $_clearField(41);

  @$pb.TagNumber(42)
  $core.bool get targetChannelGs => $_getBF(41);
  @$pb.TagNumber(42)
  set targetChannelGs($core.bool value) => $_setBool(41, value);
  @$pb.TagNumber(42)
  $core.bool hasTargetChannelGs() => $_has(41);
  @$pb.TagNumber(42)
  void clearTargetChannelGs() => $_clearField(42);

  @$pb.TagNumber(43)
  $core.bool get showGsConversionTaskDialog => $_getBF(42);
  @$pb.TagNumber(43)
  set showGsConversionTaskDialog($core.bool value) => $_setBool(42, value);
  @$pb.TagNumber(43)
  $core.bool hasShowGsConversionTaskDialog() => $_has(42);
  @$pb.TagNumber(43)
  void clearShowGsConversionTaskDialog() => $_clearField(43);

  @$pb.TagNumber(44)
  $core.bool get addressMatch => $_getBF(43);
  @$pb.TagNumber(44)
  set addressMatch($core.bool value) => $_setBool(43, value);
  @$pb.TagNumber(44)
  $core.bool hasAddressMatch() => $_has(43);
  @$pb.TagNumber(44)
  void clearAddressMatch() => $_clearField(44);

  @$pb.TagNumber(45)
  $core.bool get channelMatch => $_getBF(44);
  @$pb.TagNumber(45)
  set channelMatch($core.bool value) => $_setBool(44, value);
  @$pb.TagNumber(45)
  $core.bool hasChannelMatch() => $_has(44);
  @$pb.TagNumber(45)
  void clearChannelMatch() => $_clearField(45);

  @$pb.TagNumber(46)
  $4.ChatRoleType get chatRole => $_getN(45);
  @$pb.TagNumber(46)
  set chatRole($4.ChatRoleType value) => $_setField(46, value);
  @$pb.TagNumber(46)
  $core.bool hasChatRole() => $_has(45);
  @$pb.TagNumber(46)
  void clearChatRole() => $_clearField(46);

  @$pb.TagNumber(47)
  GameCurrency get gameCurrency => $_getN(46);
  @$pb.TagNumber(47)
  set gameCurrency(GameCurrency value) => $_setField(47, value);
  @$pb.TagNumber(47)
  $core.bool hasGameCurrency() => $_has(46);
  @$pb.TagNumber(47)
  void clearGameCurrency() => $_clearField(47);

  @$pb.TagNumber(48)
  $core.bool get hasFirstRechargePack => $_getBF(47);
  @$pb.TagNumber(48)
  set hasFirstRechargePack($core.bool value) => $_setBool(47, value);
  @$pb.TagNumber(48)
  $core.bool hasHasFirstRechargePack() => $_has(47);
  @$pb.TagNumber(48)
  void clearHasFirstRechargePack() => $_clearField(48);

  @$pb.TagNumber(49)
  LuckyChallengeCfg get luckyChallengeCfg => $_getN(48);
  @$pb.TagNumber(49)
  set luckyChallengeCfg(LuckyChallengeCfg value) => $_setField(49, value);
  @$pb.TagNumber(49)
  $core.bool hasLuckyChallengeCfg() => $_has(48);
  @$pb.TagNumber(49)
  void clearLuckyChallengeCfg() => $_clearField(49);
  @$pb.TagNumber(49)
  LuckyChallengeCfg ensureLuckyChallengeCfg() => $_ensure(48);

  @$pb.TagNumber(50)
  $core.String get rechargeEventUrl => $_getSZ(49);
  @$pb.TagNumber(50)
  set rechargeEventUrl($core.String value) => $_setString(49, value);
  @$pb.TagNumber(50)
  $core.bool hasRechargeEventUrl() => $_has(49);
  @$pb.TagNumber(50)
  void clearRechargeEventUrl() => $_clearField(50);

  @$pb.TagNumber(51)
  $core.String get aiProfileUrl => $_getSZ(50);
  @$pb.TagNumber(51)
  set aiProfileUrl($core.String value) => $_setString(50, value);
  @$pb.TagNumber(51)
  $core.bool hasAiProfileUrl() => $_has(50);
  @$pb.TagNumber(51)
  void clearAiProfileUrl() => $_clearField(51);

  @$pb.TagNumber(52)
  $core.bool get rechargeExceedThreshold => $_getBF(51);
  @$pb.TagNumber(52)
  set rechargeExceedThreshold($core.bool value) => $_setBool(51, value);
  @$pb.TagNumber(52)
  $core.bool hasRechargeExceedThreshold() => $_has(51);
  @$pb.TagNumber(52)
  void clearRechargeExceedThreshold() => $_clearField(52);

  @$pb.TagNumber(53)
  $core.String get handlerWorkUrl => $_getSZ(52);
  @$pb.TagNumber(53)
  set handlerWorkUrl($core.String value) => $_setString(52, value);
  @$pb.TagNumber(53)
  $core.bool hasHandlerWorkUrl() => $_has(52);
  @$pb.TagNumber(53)
  void clearHandlerWorkUrl() => $_clearField(53);

  @$pb.TagNumber(54)
  $core.String get leaderWorkUrl => $_getSZ(53);
  @$pb.TagNumber(54)
  set leaderWorkUrl($core.String value) => $_setString(53, value);
  @$pb.TagNumber(54)
  $core.bool hasLeaderWorkUrl() => $_has(53);
  @$pb.TagNumber(54)
  void clearLeaderWorkUrl() => $_clearField(54);

  @$pb.TagNumber(55)
  $core.bool get viewUser => $_getBF(54);
  @$pb.TagNumber(55)
  set viewUser($core.bool value) => $_setBool(54, value);
  @$pb.TagNumber(55)
  $core.bool hasViewUser() => $_has(54);
  @$pb.TagNumber(55)
  void clearViewUser() => $_clearField(55);

  @$pb.TagNumber(56)
  $core.bool get canOpenAutoChat => $_getBF(55);
  @$pb.TagNumber(56)
  set canOpenAutoChat($core.bool value) => $_setBool(55, value);
  @$pb.TagNumber(56)
  $core.bool hasCanOpenAutoChat() => $_has(55);
  @$pb.TagNumber(56)
  void clearCanOpenAutoChat() => $_clearField(56);

  @$pb.TagNumber(57)
  $core.bool get showGameShare => $_getBF(56);
  @$pb.TagNumber(57)
  set showGameShare($core.bool value) => $_setBool(56, value);
  @$pb.TagNumber(57)
  $core.bool hasShowGameShare() => $_has(56);
  @$pb.TagNumber(57)
  void clearShowGameShare() => $_clearField(57);

  @$pb.TagNumber(58)
  $core.bool get translateGlobalEnabled => $_getBF(57);
  @$pb.TagNumber(58)
  set translateGlobalEnabled($core.bool value) => $_setBool(57, value);
  @$pb.TagNumber(58)
  $core.bool hasTranslateGlobalEnabled() => $_has(57);
  @$pb.TagNumber(58)
  void clearTranslateGlobalEnabled() => $_clearField(58);

  @$pb.TagNumber(59)
  $core.bool get showQuiz => $_getBF(58);
  @$pb.TagNumber(59)
  set showQuiz($core.bool value) => $_setBool(58, value);
  @$pb.TagNumber(59)
  $core.bool hasShowQuiz() => $_has(58);
  @$pb.TagNumber(59)
  void clearShowQuiz() => $_clearField(59);

  @$pb.TagNumber(60)
  $core.bool get showGuardian => $_getBF(59);
  @$pb.TagNumber(60)
  set showGuardian($core.bool value) => $_setBool(59, value);
  @$pb.TagNumber(60)
  $core.bool hasShowGuardian() => $_has(59);
  @$pb.TagNumber(60)
  void clearShowGuardian() => $_clearField(60);

  @$pb.TagNumber(61)
  $core.bool get gemPermission => $_getBF(60);
  @$pb.TagNumber(61)
  set gemPermission($core.bool value) => $_setBool(60, value);
  @$pb.TagNumber(61)
  $core.bool hasGemPermission() => $_has(60);
  @$pb.TagNumber(61)
  void clearGemPermission() => $_clearField(61);

  @$pb.TagNumber(62)
  $core.bool get enableMagicPortal => $_getBF(61);
  @$pb.TagNumber(62)
  set enableMagicPortal($core.bool value) => $_setBool(61, value);
  @$pb.TagNumber(62)
  $core.bool hasEnableMagicPortal() => $_has(61);
  @$pb.TagNumber(62)
  void clearEnableMagicPortal() => $_clearField(62);

  @$pb.TagNumber(63)
  $core.int get currencyDailyRemain => $_getIZ(62);
  @$pb.TagNumber(63)
  set currencyDailyRemain($core.int value) => $_setSignedInt32(62, value);
  @$pb.TagNumber(63)
  $core.bool hasCurrencyDailyRemain() => $_has(62);
  @$pb.TagNumber(63)
  void clearCurrencyDailyRemain() => $_clearField(63);

  @$pb.TagNumber(64)
  $core.bool get showGameCurrencySwitch => $_getBF(63);
  @$pb.TagNumber(64)
  set showGameCurrencySwitch($core.bool value) => $_setBool(63, value);
  @$pb.TagNumber(64)
  $core.bool hasShowGameCurrencySwitch() => $_has(63);
  @$pb.TagNumber(64)
  void clearShowGameCurrencySwitch() => $_clearField(64);

  @$pb.TagNumber(65)
  $core.bool get showMerch => $_getBF(64);
  @$pb.TagNumber(65)
  set showMerch($core.bool value) => $_setBool(64, value);
  @$pb.TagNumber(65)
  $core.bool hasShowMerch() => $_has(64);
  @$pb.TagNumber(65)
  void clearShowMerch() => $_clearField(65);
}

class LuckyChallengeCfg extends $pb.GeneratedMessage {
  factory LuckyChallengeCfg({
    $core.String? url,
    $core.bool? superLuckyDay,
    $fixnum.Int64? prizePool,
    $core.int? giftPackThreshold,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (superLuckyDay != null) result.superLuckyDay = superLuckyDay;
    if (prizePool != null) result.prizePool = prizePool;
    if (giftPackThreshold != null) result.giftPackThreshold = giftPackThreshold;
    return result;
  }

  LuckyChallengeCfg._();

  factory LuckyChallengeCfg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LuckyChallengeCfg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LuckyChallengeCfg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonApp'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOB(2, _omitFieldNames ? '' : 'superLuckyDay')
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'prizePool', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(4, _omitFieldNames ? '' : 'giftPackThreshold',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LuckyChallengeCfg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LuckyChallengeCfg copyWith(void Function(LuckyChallengeCfg) updates) =>
      super.copyWith((message) => updates(message as LuckyChallengeCfg))
          as LuckyChallengeCfg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LuckyChallengeCfg create() => LuckyChallengeCfg._();
  @$core.override
  LuckyChallengeCfg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LuckyChallengeCfg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LuckyChallengeCfg>(create);
  static LuckyChallengeCfg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get superLuckyDay => $_getBF(1);
  @$pb.TagNumber(2)
  set superLuckyDay($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSuperLuckyDay() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuperLuckyDay() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get prizePool => $_getI64(2);
  @$pb.TagNumber(3)
  set prizePool($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPrizePool() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrizePool() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get giftPackThreshold => $_getIZ(3);
  @$pb.TagNumber(4)
  set giftPackThreshold($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGiftPackThreshold() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftPackThreshold() => $_clearField(4);
}

class SearchResp extends $pb.GeneratedMessage {
  factory SearchResp({
    $core.Iterable<$2.MsgListUserItem>? users,
    $core.Iterable<$3.Channel>? channels,
    $core.Iterable<KmaxVanityNo>? kmaxVanityNo,
  }) {
    final result = create();
    if (users != null) result.users.addAll(users);
    if (channels != null) result.channels.addAll(channels);
    if (kmaxVanityNo != null) result.kmaxVanityNo.addAll(kmaxVanityNo);
    return result;
  }

  SearchResp._();

  factory SearchResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonApp'),
      createEmptyInstance: create)
    ..pPM<$2.MsgListUserItem>(1, _omitFieldNames ? '' : 'users',
        subBuilder: $2.MsgListUserItem.create)
    ..pPM<$3.Channel>(2, _omitFieldNames ? '' : 'channels',
        subBuilder: $3.Channel.create)
    ..pPM<KmaxVanityNo>(3, _omitFieldNames ? '' : 'kmaxVanityNo',
        subBuilder: KmaxVanityNo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchResp copyWith(void Function(SearchResp) updates) =>
      super.copyWith((message) => updates(message as SearchResp)) as SearchResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchResp create() => SearchResp._();
  @$core.override
  SearchResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchResp>(create);
  static SearchResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$2.MsgListUserItem> get users => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$3.Channel> get channels => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<KmaxVanityNo> get kmaxVanityNo => $_getList(2);
}

class KmaxVanityNo extends $pb.GeneratedMessage {
  factory KmaxVanityNo({
    $core.String? vanityNo,
    $core.String? familyName,
    $core.String? avatarUrl,
    $core.String? coverUrl,
    $core.String? slug,
    $core.String? launchUrl,
    $core.int? age,
    $core.String? gender,
  }) {
    final result = create();
    if (vanityNo != null) result.vanityNo = vanityNo;
    if (familyName != null) result.familyName = familyName;
    if (avatarUrl != null) result.avatarUrl = avatarUrl;
    if (coverUrl != null) result.coverUrl = coverUrl;
    if (slug != null) result.slug = slug;
    if (launchUrl != null) result.launchUrl = launchUrl;
    if (age != null) result.age = age;
    if (gender != null) result.gender = gender;
    return result;
  }

  KmaxVanityNo._();

  factory KmaxVanityNo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KmaxVanityNo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KmaxVanityNo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonApp'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'vanityNo')
    ..aOS(2, _omitFieldNames ? '' : 'familyName')
    ..aOS(3, _omitFieldNames ? '' : 'avatarUrl')
    ..aOS(4, _omitFieldNames ? '' : 'coverUrl')
    ..aOS(5, _omitFieldNames ? '' : 'slug')
    ..aOS(6, _omitFieldNames ? '' : 'launchUrl')
    ..aI(7, _omitFieldNames ? '' : 'age', fieldType: $pb.PbFieldType.OU3)
    ..aOS(8, _omitFieldNames ? '' : 'gender')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KmaxVanityNo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KmaxVanityNo copyWith(void Function(KmaxVanityNo) updates) =>
      super.copyWith((message) => updates(message as KmaxVanityNo))
          as KmaxVanityNo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KmaxVanityNo create() => KmaxVanityNo._();
  @$core.override
  KmaxVanityNo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KmaxVanityNo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KmaxVanityNo>(create);
  static KmaxVanityNo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get vanityNo => $_getSZ(0);
  @$pb.TagNumber(1)
  set vanityNo($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVanityNo() => $_has(0);
  @$pb.TagNumber(1)
  void clearVanityNo() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get familyName => $_getSZ(1);
  @$pb.TagNumber(2)
  set familyName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFamilyName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFamilyName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatarUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatarUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatarUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatarUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get coverUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set coverUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCoverUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoverUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get slug => $_getSZ(4);
  @$pb.TagNumber(5)
  set slug($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSlug() => $_has(4);
  @$pb.TagNumber(5)
  void clearSlug() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get launchUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set launchUrl($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLaunchUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearLaunchUrl() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get age => $_getIZ(6);
  @$pb.TagNumber(7)
  set age($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAge() => $_has(6);
  @$pb.TagNumber(7)
  void clearAge() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get gender => $_getSZ(7);
  @$pb.TagNumber(8)
  set gender($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasGender() => $_has(7);
  @$pb.TagNumber(8)
  void clearGender() => $_clearField(8);
}

class SetRvConfReq extends $pb.GeneratedMessage {
  factory SetRvConfReq({
    $core.int? pure,
    $core.int? hasShowRvStep,
    $core.int? birthYear,
  }) {
    final result = create();
    if (pure != null) result.pure = pure;
    if (hasShowRvStep != null) result.hasShowRvStep = hasShowRvStep;
    if (birthYear != null) result.birthYear = birthYear;
    return result;
  }

  SetRvConfReq._();

  factory SetRvConfReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetRvConfReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetRvConfReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonApp'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'pure', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'hasShowRvStep',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'birthYear', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetRvConfReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetRvConfReq copyWith(void Function(SetRvConfReq) updates) =>
      super.copyWith((message) => updates(message as SetRvConfReq))
          as SetRvConfReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetRvConfReq create() => SetRvConfReq._();
  @$core.override
  SetRvConfReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetRvConfReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetRvConfReq>(create);
  static SetRvConfReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pure => $_getIZ(0);
  @$pb.TagNumber(1)
  set pure($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPure() => $_has(0);
  @$pb.TagNumber(1)
  void clearPure() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get hasShowRvStep => $_getIZ(1);
  @$pb.TagNumber(2)
  set hasShowRvStep($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHasShowRvStep() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasShowRvStep() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get birthYear => $_getIZ(2);
  @$pb.TagNumber(3)
  set birthYear($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBirthYear() => $_has(2);
  @$pb.TagNumber(3)
  void clearBirthYear() => $_clearField(3);
}

class MessageConfigRsp extends $pb.GeneratedMessage {
  factory MessageConfigRsp({
    $core.Iterable<$core.String>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  MessageConfigRsp._();

  factory MessageConfigRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MessageConfigRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageConfigRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'commonApp'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'list')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageConfigRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MessageConfigRsp copyWith(void Function(MessageConfigRsp) updates) =>
      super.copyWith((message) => updates(message as MessageConfigRsp))
          as MessageConfigRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageConfigRsp create() => MessageConfigRsp._();
  @$core.override
  MessageConfigRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MessageConfigRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageConfigRsp>(create);
  static MessageConfigRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get list => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

// This is a generated file - do not edit.
//
// Generated from server_client/quiz.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'base.pb.dart' as $2;
import 'cash.pb.dart' as $1;
import 'quiz.pbenum.dart';
import 'user.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'quiz.pbenum.dart';

/// 题目选项
class QuizOption extends $pb.GeneratedMessage {
  factory QuizOption({
    $core.String? optionKey,
    $core.String? optionText,
    $fixnum.Int64? myChipAmount,
  }) {
    final result = create();
    if (optionKey != null) result.optionKey = optionKey;
    if (optionText != null) result.optionText = optionText;
    if (myChipAmount != null) result.myChipAmount = myChipAmount;
    return result;
  }

  QuizOption._();

  factory QuizOption.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizOption.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizOption',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'optionKey')
    ..aOS(2, _omitFieldNames ? '' : 'optionText')
    ..aInt64(3, _omitFieldNames ? '' : 'myChipAmount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizOption clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizOption copyWith(void Function(QuizOption) updates) =>
      super.copyWith((message) => updates(message as QuizOption)) as QuizOption;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizOption create() => QuizOption._();
  @$core.override
  QuizOption createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizOption getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizOption>(create);
  static QuizOption? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get optionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set optionKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOptionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptionKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get optionText => $_getSZ(1);
  @$pb.TagNumber(2)
  set optionText($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOptionText() => $_has(1);
  @$pb.TagNumber(2)
  void clearOptionText() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get myChipAmount => $_getI64(2);
  @$pb.TagNumber(3)
  set myChipAmount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMyChipAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearMyChipAmount() => $_clearField(3);
}

/// 参与者摘要
class QuizParticipant extends $pb.GeneratedMessage {
  factory QuizParticipant({
    $fixnum.Int64? uid,
    $core.String? nickname,
    $core.String? avatar,
    $core.String? optionKey,
    $fixnum.Int64? chipAmount,
    $fixnum.Int64? betTime,
    QuizChipLotItem? betChip,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    if (optionKey != null) result.optionKey = optionKey;
    if (chipAmount != null) result.chipAmount = chipAmount;
    if (betTime != null) result.betTime = betTime;
    if (betChip != null) result.betChip = betChip;
    return result;
  }

  QuizParticipant._();

  factory QuizParticipant.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizParticipant.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizParticipant',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'optionKey')
    ..aInt64(5, _omitFieldNames ? '' : 'chipAmount')
    ..aInt64(6, _omitFieldNames ? '' : 'betTime')
    ..aOM<QuizChipLotItem>(7, _omitFieldNames ? '' : 'betChip',
        subBuilder: QuizChipLotItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizParticipant clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizParticipant copyWith(void Function(QuizParticipant) updates) =>
      super.copyWith((message) => updates(message as QuizParticipant))
          as QuizParticipant;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizParticipant create() => QuizParticipant._();
  @$core.override
  QuizParticipant createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizParticipant getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizParticipant>(create);
  static QuizParticipant? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get optionKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set optionKey($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOptionKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearOptionKey() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get chipAmount => $_getI64(4);
  @$pb.TagNumber(5)
  set chipAmount($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasChipAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearChipAmount() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get betTime => $_getI64(5);
  @$pb.TagNumber(6)
  set betTime($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBetTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearBetTime() => $_clearField(6);

  @$pb.TagNumber(7)
  QuizChipLotItem get betChip => $_getN(6);
  @$pb.TagNumber(7)
  set betChip(QuizChipLotItem value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasBetChip() => $_has(6);
  @$pb.TagNumber(7)
  void clearBetChip() => $_clearField(7);
  @$pb.TagNumber(7)
  QuizChipLotItem ensureBetChip() => $_ensure(6);
}

/// 竞猜卡片
class QuizCard extends $pb.GeneratedMessage {
  factory QuizCard({
    $fixnum.Int64? bindingId,
    $fixnum.Int64? questionId,
    $0.User? gsInfo,
    $core.String? title,
    $core.Iterable<QuizOption>? options,
    $fixnum.Int64? guessDeadlineTime,
    $fixnum.Int64? resultPublishTime,
    $core.int? status,
    $core.String? correctKey,
    $core.bool? isCurrentEvent,
    $core.Iterable<$0.User>? participants,
    $core.Iterable<QuizBetInfo>? betList,
    $fixnum.Int64? rewardPoint,
  }) {
    final result = create();
    if (bindingId != null) result.bindingId = bindingId;
    if (questionId != null) result.questionId = questionId;
    if (gsInfo != null) result.gsInfo = gsInfo;
    if (title != null) result.title = title;
    if (options != null) result.options.addAll(options);
    if (guessDeadlineTime != null) result.guessDeadlineTime = guessDeadlineTime;
    if (resultPublishTime != null) result.resultPublishTime = resultPublishTime;
    if (status != null) result.status = status;
    if (correctKey != null) result.correctKey = correctKey;
    if (isCurrentEvent != null) result.isCurrentEvent = isCurrentEvent;
    if (participants != null) result.participants.addAll(participants);
    if (betList != null) result.betList.addAll(betList);
    if (rewardPoint != null) result.rewardPoint = rewardPoint;
    return result;
  }

  QuizCard._();

  factory QuizCard.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizCard.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizCard',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'bindingId')
    ..aInt64(2, _omitFieldNames ? '' : 'questionId')
    ..aOM<$0.User>(3, _omitFieldNames ? '' : 'gsInfo',
        subBuilder: $0.User.create)
    ..aOS(4, _omitFieldNames ? '' : 'title')
    ..pPM<QuizOption>(5, _omitFieldNames ? '' : 'options',
        subBuilder: QuizOption.create)
    ..aInt64(6, _omitFieldNames ? '' : 'guessDeadlineTime')
    ..aInt64(7, _omitFieldNames ? '' : 'resultPublishTime')
    ..aI(8, _omitFieldNames ? '' : 'status')
    ..aOS(9, _omitFieldNames ? '' : 'correctKey')
    ..aOB(10, _omitFieldNames ? '' : 'isCurrentEvent')
    ..pPM<$0.User>(11, _omitFieldNames ? '' : 'participants',
        subBuilder: $0.User.create)
    ..pPM<QuizBetInfo>(12, _omitFieldNames ? '' : 'betList',
        subBuilder: QuizBetInfo.create)
    ..aInt64(13, _omitFieldNames ? '' : 'rewardPoint')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizCard clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizCard copyWith(void Function(QuizCard) updates) =>
      super.copyWith((message) => updates(message as QuizCard)) as QuizCard;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizCard create() => QuizCard._();
  @$core.override
  QuizCard createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizCard getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QuizCard>(create);
  static QuizCard? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get bindingId => $_getI64(0);
  @$pb.TagNumber(1)
  set bindingId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBindingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBindingId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get questionId => $_getI64(1);
  @$pb.TagNumber(2)
  set questionId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuestionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestionId() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.User get gsInfo => $_getN(2);
  @$pb.TagNumber(3)
  set gsInfo($0.User value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasGsInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearGsInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.User ensureGsInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<QuizOption> get options => $_getList(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get guessDeadlineTime => $_getI64(5);
  @$pb.TagNumber(6)
  set guessDeadlineTime($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGuessDeadlineTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearGuessDeadlineTime() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get resultPublishTime => $_getI64(6);
  @$pb.TagNumber(7)
  set resultPublishTime($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasResultPublishTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearResultPublishTime() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get status => $_getIZ(7);
  @$pb.TagNumber(8)
  set status($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get correctKey => $_getSZ(8);
  @$pb.TagNumber(9)
  set correctKey($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCorrectKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearCorrectKey() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isCurrentEvent => $_getBF(9);
  @$pb.TagNumber(10)
  set isCurrentEvent($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasIsCurrentEvent() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsCurrentEvent() => $_clearField(10);

  @$pb.TagNumber(11)
  $pb.PbList<$0.User> get participants => $_getList(10);

  @$pb.TagNumber(12)
  $pb.PbList<QuizBetInfo> get betList => $_getList(11);

  @$pb.TagNumber(13)
  $fixnum.Int64 get rewardPoint => $_getI64(12);
  @$pb.TagNumber(13)
  set rewardPoint($fixnum.Int64 value) => $_setInt64(12, value);
  @$pb.TagNumber(13)
  $core.bool hasRewardPoint() => $_has(12);
  @$pb.TagNumber(13)
  void clearRewardPoint() => $_clearField(13);
}

/// 列表请求（仅返回 gs_uid 下 status=OPEN 的绑定）
class QuizListReq extends $pb.GeneratedMessage {
  factory QuizListReq({
    $fixnum.Int64? gsUid,
  }) {
    final result = create();
    if (gsUid != null) result.gsUid = gsUid;
    return result;
  }

  QuizListReq._();

  factory QuizListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'gsUid')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizListReq copyWith(void Function(QuizListReq) updates) =>
      super.copyWith((message) => updates(message as QuizListReq))
          as QuizListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizListReq create() => QuizListReq._();
  @$core.override
  QuizListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizListReq>(create);
  static QuizListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get gsUid => $_getI64(0);
  @$pb.TagNumber(1)
  set gsUid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsUid() => $_clearField(1);
}

class QuizListRsp extends $pb.GeneratedMessage {
  factory QuizListRsp({
    $core.Iterable<QuizCard>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  QuizListRsp._();

  factory QuizListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..pPM<QuizCard>(1, _omitFieldNames ? '' : 'list',
        subBuilder: QuizCard.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizListRsp copyWith(void Function(QuizListRsp) updates) =>
      super.copyWith((message) => updates(message as QuizListRsp))
          as QuizListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizListRsp create() => QuizListRsp._();
  @$core.override
  QuizListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizListRsp>(create);
  static QuizListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<QuizCard> get list => $_getList(0);
}

/// 下注
class QuizBetReq extends $pb.GeneratedMessage {
  factory QuizBetReq({
    $fixnum.Int64? bindingId,
    $core.String? optionKey,
    $fixnum.Int64? chipLotId,
  }) {
    final result = create();
    if (bindingId != null) result.bindingId = bindingId;
    if (optionKey != null) result.optionKey = optionKey;
    if (chipLotId != null) result.chipLotId = chipLotId;
    return result;
  }

  QuizBetReq._();

  factory QuizBetReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizBetReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizBetReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'bindingId')
    ..aOS(2, _omitFieldNames ? '' : 'optionKey')
    ..aInt64(3, _omitFieldNames ? '' : 'chipLotId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizBetReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizBetReq copyWith(void Function(QuizBetReq) updates) =>
      super.copyWith((message) => updates(message as QuizBetReq)) as QuizBetReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizBetReq create() => QuizBetReq._();
  @$core.override
  QuizBetReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizBetReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizBetReq>(create);
  static QuizBetReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get bindingId => $_getI64(0);
  @$pb.TagNumber(1)
  set bindingId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBindingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBindingId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get optionKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set optionKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOptionKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearOptionKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get chipLotId => $_getI64(2);
  @$pb.TagNumber(3)
  set chipLotId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChipLotId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChipLotId() => $_clearField(3);
}

class QuizBetInfo extends $pb.GeneratedMessage {
  factory QuizBetInfo({
    $core.String? betKey,
    $fixnum.Int64? betAmount,
    $core.bool? win,
    $fixnum.Int64? betTime,
  }) {
    final result = create();
    if (betKey != null) result.betKey = betKey;
    if (betAmount != null) result.betAmount = betAmount;
    if (win != null) result.win = win;
    if (betTime != null) result.betTime = betTime;
    return result;
  }

  QuizBetInfo._();

  factory QuizBetInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizBetInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizBetInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'betKey')
    ..aInt64(2, _omitFieldNames ? '' : 'betAmount')
    ..aOB(3, _omitFieldNames ? '' : 'win')
    ..aInt64(4, _omitFieldNames ? '' : 'betTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizBetInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizBetInfo copyWith(void Function(QuizBetInfo) updates) =>
      super.copyWith((message) => updates(message as QuizBetInfo))
          as QuizBetInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizBetInfo create() => QuizBetInfo._();
  @$core.override
  QuizBetInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizBetInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizBetInfo>(create);
  static QuizBetInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get betKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set betKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBetKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearBetKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get betAmount => $_getI64(1);
  @$pb.TagNumber(2)
  set betAmount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBetAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearBetAmount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get win => $_getBF(2);
  @$pb.TagNumber(3)
  set win($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWin() => $_has(2);
  @$pb.TagNumber(3)
  void clearWin() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get betTime => $_getI64(3);
  @$pb.TagNumber(4)
  set betTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBetTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearBetTime() => $_clearField(4);
}

class QuizRecordsRsp extends $pb.GeneratedMessage {
  factory QuizRecordsRsp({
    $core.Iterable<QuizCard>? list,
    $fixnum.Int64? pointBalance,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (pointBalance != null) result.pointBalance = pointBalance;
    return result;
  }

  QuizRecordsRsp._();

  factory QuizRecordsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizRecordsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizRecordsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..pPM<QuizCard>(1, _omitFieldNames ? '' : 'list',
        subBuilder: QuizCard.create)
    ..aInt64(2, _omitFieldNames ? '' : 'pointBalance')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizRecordsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizRecordsRsp copyWith(void Function(QuizRecordsRsp) updates) =>
      super.copyWith((message) => updates(message as QuizRecordsRsp))
          as QuizRecordsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizRecordsRsp create() => QuizRecordsRsp._();
  @$core.override
  QuizRecordsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizRecordsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizRecordsRsp>(create);
  static QuizRecordsRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<QuizCard> get list => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get pointBalance => $_getI64(1);
  @$pb.TagNumber(2)
  set pointBalance($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPointBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearPointBalance() => $_clearField(2);
}

/// 积分
class QuizPointRsp extends $pb.GeneratedMessage {
  factory QuizPointRsp({
    $fixnum.Int64? balance,
  }) {
    final result = create();
    if (balance != null) result.balance = balance;
    return result;
  }

  QuizPointRsp._();

  factory QuizPointRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizPointRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizPointRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'balance')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizPointRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizPointRsp copyWith(void Function(QuizPointRsp) updates) =>
      super.copyWith((message) => updates(message as QuizPointRsp))
          as QuizPointRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizPointRsp create() => QuizPointRsp._();
  @$core.override
  QuizPointRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizPointRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizPointRsp>(create);
  static QuizPointRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get balance => $_getI64(0);
  @$pb.TagNumber(1)
  set balance($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalance() => $_clearField(1);
}

class QuizChipLotItem extends $pb.GeneratedMessage {
  factory QuizChipLotItem({
    $fixnum.Int64? chipLotId,
    $fixnum.Int64? amount,
    $fixnum.Int64? createTime,
    $fixnum.Int64? expireTime,
    $core.int? status,
    $1.ItemInfo? itemInfo,
  }) {
    final result = create();
    if (chipLotId != null) result.chipLotId = chipLotId;
    if (amount != null) result.amount = amount;
    if (createTime != null) result.createTime = createTime;
    if (expireTime != null) result.expireTime = expireTime;
    if (status != null) result.status = status;
    if (itemInfo != null) result.itemInfo = itemInfo;
    return result;
  }

  QuizChipLotItem._();

  factory QuizChipLotItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizChipLotItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizChipLotItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'chipLotId')
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..aInt64(3, _omitFieldNames ? '' : 'createTime')
    ..aInt64(4, _omitFieldNames ? '' : 'expireTime')
    ..aI(5, _omitFieldNames ? '' : 'status')
    ..aOM<$1.ItemInfo>(6, _omitFieldNames ? '' : 'itemInfo',
        subBuilder: $1.ItemInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizChipLotItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizChipLotItem copyWith(void Function(QuizChipLotItem) updates) =>
      super.copyWith((message) => updates(message as QuizChipLotItem))
          as QuizChipLotItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizChipLotItem create() => QuizChipLotItem._();
  @$core.override
  QuizChipLotItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizChipLotItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizChipLotItem>(create);
  static QuizChipLotItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chipLotId => $_getI64(0);
  @$pb.TagNumber(1)
  set chipLotId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChipLotId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChipLotId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get createTime => $_getI64(2);
  @$pb.TagNumber(3)
  set createTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCreateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreateTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get expireTime => $_getI64(3);
  @$pb.TagNumber(4)
  set expireTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpireTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpireTime() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get status => $_getIZ(4);
  @$pb.TagNumber(5)
  set status($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $1.ItemInfo get itemInfo => $_getN(5);
  @$pb.TagNumber(6)
  set itemInfo($1.ItemInfo value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasItemInfo() => $_has(5);
  @$pb.TagNumber(6)
  void clearItemInfo() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.ItemInfo ensureItemInfo() => $_ensure(5);
}

class QuizChipListRsp extends $pb.GeneratedMessage {
  factory QuizChipListRsp({
    $core.Iterable<QuizChipLotItem>? list,
    $fixnum.Int64? totalAvailable,
    $core.int? receivedChipCount,
    $core.int? dailyMaxReceivedCount,
    $fixnum.Int64? itemId,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (totalAvailable != null) result.totalAvailable = totalAvailable;
    if (receivedChipCount != null) result.receivedChipCount = receivedChipCount;
    if (dailyMaxReceivedCount != null)
      result.dailyMaxReceivedCount = dailyMaxReceivedCount;
    if (itemId != null) result.itemId = itemId;
    return result;
  }

  QuizChipListRsp._();

  factory QuizChipListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizChipListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizChipListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..pPM<QuizChipLotItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: QuizChipLotItem.create)
    ..aInt64(2, _omitFieldNames ? '' : 'totalAvailable')
    ..aI(3, _omitFieldNames ? '' : 'receivedChipCount')
    ..aI(4, _omitFieldNames ? '' : 'dailyMaxReceivedCount')
    ..aInt64(5, _omitFieldNames ? '' : 'itemId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizChipListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizChipListRsp copyWith(void Function(QuizChipListRsp) updates) =>
      super.copyWith((message) => updates(message as QuizChipListRsp))
          as QuizChipListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizChipListRsp create() => QuizChipListRsp._();
  @$core.override
  QuizChipListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizChipListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizChipListRsp>(create);
  static QuizChipListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<QuizChipLotItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalAvailable => $_getI64(1);
  @$pb.TagNumber(2)
  set totalAvailable($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalAvailable() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalAvailable() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get receivedChipCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set receivedChipCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReceivedChipCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceivedChipCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get dailyMaxReceivedCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set dailyMaxReceivedCount($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDailyMaxReceivedCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearDailyMaxReceivedCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get itemId => $_getI64(4);
  @$pb.TagNumber(5)
  set itemId($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasItemId() => $_has(4);
  @$pb.TagNumber(5)
  void clearItemId() => $_clearField(5);
}

/// 主播题库
class QuizQuestionBankRsp extends $pb.GeneratedMessage {
  factory QuizQuestionBankRsp({
    $core.Iterable<QuizBankItem>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  QuizQuestionBankRsp._();

  factory QuizQuestionBankRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizQuestionBankRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizQuestionBankRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..pPM<QuizBankItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: QuizBankItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizQuestionBankRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizQuestionBankRsp copyWith(void Function(QuizQuestionBankRsp) updates) =>
      super.copyWith((message) => updates(message as QuizQuestionBankRsp))
          as QuizQuestionBankRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizQuestionBankRsp create() => QuizQuestionBankRsp._();
  @$core.override
  QuizQuestionBankRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizQuestionBankRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizQuestionBankRsp>(create);
  static QuizQuestionBankRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<QuizBankItem> get list => $_getList(0);
}

class QuizBankItem extends $pb.GeneratedMessage {
  factory QuizBankItem({
    $fixnum.Int64? questionId,
    $core.String? title,
    $fixnum.Int64? guessDeadlineTime,
    $core.bool? isCurrentEvent,
    $core.Iterable<QuizOption>? options,
  }) {
    final result = create();
    if (questionId != null) result.questionId = questionId;
    if (title != null) result.title = title;
    if (guessDeadlineTime != null) result.guessDeadlineTime = guessDeadlineTime;
    if (isCurrentEvent != null) result.isCurrentEvent = isCurrentEvent;
    if (options != null) result.options.addAll(options);
    return result;
  }

  QuizBankItem._();

  factory QuizBankItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizBankItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizBankItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'questionId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aInt64(3, _omitFieldNames ? '' : 'guessDeadlineTime')
    ..aOB(4, _omitFieldNames ? '' : 'isCurrentEvent')
    ..pPM<QuizOption>(5, _omitFieldNames ? '' : 'options',
        subBuilder: QuizOption.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizBankItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizBankItem copyWith(void Function(QuizBankItem) updates) =>
      super.copyWith((message) => updates(message as QuizBankItem))
          as QuizBankItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizBankItem create() => QuizBankItem._();
  @$core.override
  QuizBankItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizBankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizBankItem>(create);
  static QuizBankItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get questionId => $_getI64(0);
  @$pb.TagNumber(1)
  set questionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuestionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get guessDeadlineTime => $_getI64(2);
  @$pb.TagNumber(3)
  set guessDeadlineTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGuessDeadlineTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearGuessDeadlineTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isCurrentEvent => $_getBF(3);
  @$pb.TagNumber(4)
  set isCurrentEvent($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsCurrentEvent() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsCurrentEvent() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<QuizOption> get options => $_getList(4);
}

class QuizGsBindReq extends $pb.GeneratedMessage {
  factory QuizGsBindReq({
    $fixnum.Int64? questionId,
  }) {
    final result = create();
    if (questionId != null) result.questionId = questionId;
    return result;
  }

  QuizGsBindReq._();

  factory QuizGsBindReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizGsBindReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizGsBindReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'questionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizGsBindReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizGsBindReq copyWith(void Function(QuizGsBindReq) updates) =>
      super.copyWith((message) => updates(message as QuizGsBindReq))
          as QuizGsBindReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizGsBindReq create() => QuizGsBindReq._();
  @$core.override
  QuizGsBindReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizGsBindReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizGsBindReq>(create);
  static QuizGsBindReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get questionId => $_getI64(0);
  @$pb.TagNumber(1)
  set questionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuestionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestionId() => $_clearField(1);
}

class QuizGsUnbindReq extends $pb.GeneratedMessage {
  factory QuizGsUnbindReq({
    $fixnum.Int64? bindingId,
  }) {
    final result = create();
    if (bindingId != null) result.bindingId = bindingId;
    return result;
  }

  QuizGsUnbindReq._();

  factory QuizGsUnbindReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizGsUnbindReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizGsUnbindReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'bindingId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizGsUnbindReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizGsUnbindReq copyWith(void Function(QuizGsUnbindReq) updates) =>
      super.copyWith((message) => updates(message as QuizGsUnbindReq))
          as QuizGsUnbindReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizGsUnbindReq create() => QuizGsUnbindReq._();
  @$core.override
  QuizGsUnbindReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizGsUnbindReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizGsUnbindReq>(create);
  static QuizGsUnbindReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get bindingId => $_getI64(0);
  @$pb.TagNumber(1)
  set bindingId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBindingId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBindingId() => $_clearField(1);
}

class QuizGsInitiatedRsp extends $pb.GeneratedMessage {
  factory QuizGsInitiatedRsp({
    $core.Iterable<QuizCard>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  QuizGsInitiatedRsp._();

  factory QuizGsInitiatedRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizGsInitiatedRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizGsInitiatedRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..pPM<QuizCard>(1, _omitFieldNames ? '' : 'list',
        subBuilder: QuizCard.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizGsInitiatedRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizGsInitiatedRsp copyWith(void Function(QuizGsInitiatedRsp) updates) =>
      super.copyWith((message) => updates(message as QuizGsInitiatedRsp))
          as QuizGsInitiatedRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizGsInitiatedRsp create() => QuizGsInitiatedRsp._();
  @$core.override
  QuizGsInitiatedRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizGsInitiatedRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizGsInitiatedRsp>(create);
  static QuizGsInitiatedRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<QuizCard> get list => $_getList(0);
}

class QuizParticipantsRsp extends $pb.GeneratedMessage {
  factory QuizParticipantsRsp({
    $core.Iterable<QuizParticipant>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  QuizParticipantsRsp._();

  factory QuizParticipantsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizParticipantsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizParticipantsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..pPM<QuizParticipant>(1, _omitFieldNames ? '' : 'list',
        subBuilder: QuizParticipant.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizParticipantsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizParticipantsRsp copyWith(void Function(QuizParticipantsRsp) updates) =>
      super.copyWith((message) => updates(message as QuizParticipantsRsp))
          as QuizParticipantsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizParticipantsRsp create() => QuizParticipantsRsp._();
  @$core.override
  QuizParticipantsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizParticipantsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizParticipantsRsp>(create);
  static QuizParticipantsRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<QuizParticipant> get list => $_getList(0);
}

/// 任务
class QuizTaskItem extends $pb.GeneratedMessage {
  factory QuizTaskItem({
    $fixnum.Int64? taskId,
    $core.String? taskCode,
    $core.String? title,
    $core.int? periodType,
    $core.String? periodKey,
    $fixnum.Int64? target,
    $fixnum.Int64? progress,
    $core.int? rewardType,
    $fixnum.Int64? rewardAmount,
    $core.String? rewardDesc,
    $core.int? taskStatus,
    $core.String? url,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    if (taskCode != null) result.taskCode = taskCode;
    if (title != null) result.title = title;
    if (periodType != null) result.periodType = periodType;
    if (periodKey != null) result.periodKey = periodKey;
    if (target != null) result.target = target;
    if (progress != null) result.progress = progress;
    if (rewardType != null) result.rewardType = rewardType;
    if (rewardAmount != null) result.rewardAmount = rewardAmount;
    if (rewardDesc != null) result.rewardDesc = rewardDesc;
    if (taskStatus != null) result.taskStatus = taskStatus;
    if (url != null) result.url = url;
    return result;
  }

  QuizTaskItem._();

  factory QuizTaskItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizTaskItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizTaskItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'taskId')
    ..aOS(2, _omitFieldNames ? '' : 'taskCode')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aI(4, _omitFieldNames ? '' : 'periodType')
    ..aOS(5, _omitFieldNames ? '' : 'periodKey')
    ..aInt64(6, _omitFieldNames ? '' : 'target')
    ..aInt64(7, _omitFieldNames ? '' : 'progress')
    ..aI(8, _omitFieldNames ? '' : 'rewardType')
    ..aInt64(9, _omitFieldNames ? '' : 'rewardAmount')
    ..aOS(10, _omitFieldNames ? '' : 'rewardDesc')
    ..aI(11, _omitFieldNames ? '' : 'taskStatus')
    ..aOS(12, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizTaskItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizTaskItem copyWith(void Function(QuizTaskItem) updates) =>
      super.copyWith((message) => updates(message as QuizTaskItem))
          as QuizTaskItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizTaskItem create() => QuizTaskItem._();
  @$core.override
  QuizTaskItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizTaskItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizTaskItem>(create);
  static QuizTaskItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get taskId => $_getI64(0);
  @$pb.TagNumber(1)
  set taskId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get taskCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set taskCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTaskCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearTaskCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get periodType => $_getIZ(3);
  @$pb.TagNumber(4)
  set periodType($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPeriodType() => $_has(3);
  @$pb.TagNumber(4)
  void clearPeriodType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get periodKey => $_getSZ(4);
  @$pb.TagNumber(5)
  set periodKey($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPeriodKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearPeriodKey() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get target => $_getI64(5);
  @$pb.TagNumber(6)
  set target($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTarget() => $_has(5);
  @$pb.TagNumber(6)
  void clearTarget() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get progress => $_getI64(6);
  @$pb.TagNumber(7)
  set progress($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasProgress() => $_has(6);
  @$pb.TagNumber(7)
  void clearProgress() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get rewardType => $_getIZ(7);
  @$pb.TagNumber(8)
  set rewardType($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRewardType() => $_has(7);
  @$pb.TagNumber(8)
  void clearRewardType() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get rewardAmount => $_getI64(8);
  @$pb.TagNumber(9)
  set rewardAmount($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasRewardAmount() => $_has(8);
  @$pb.TagNumber(9)
  void clearRewardAmount() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get rewardDesc => $_getSZ(9);
  @$pb.TagNumber(10)
  set rewardDesc($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasRewardDesc() => $_has(9);
  @$pb.TagNumber(10)
  void clearRewardDesc() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get taskStatus => $_getIZ(10);
  @$pb.TagNumber(11)
  set taskStatus($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasTaskStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearTaskStatus() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get url => $_getSZ(11);
  @$pb.TagNumber(12)
  set url($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasUrl() => $_has(11);
  @$pb.TagNumber(12)
  void clearUrl() => $_clearField(12);
}

class QuizTaskListRsp extends $pb.GeneratedMessage {
  factory QuizTaskListRsp({
    $core.Iterable<QuizTaskItem>? dailyTasks,
    $core.Iterable<QuizTaskItem>? weeklyTasks,
  }) {
    final result = create();
    if (dailyTasks != null) result.dailyTasks.addAll(dailyTasks);
    if (weeklyTasks != null) result.weeklyTasks.addAll(weeklyTasks);
    return result;
  }

  QuizTaskListRsp._();

  factory QuizTaskListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizTaskListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizTaskListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..pPM<QuizTaskItem>(1, _omitFieldNames ? '' : 'dailyTasks',
        subBuilder: QuizTaskItem.create)
    ..pPM<QuizTaskItem>(2, _omitFieldNames ? '' : 'weeklyTasks',
        subBuilder: QuizTaskItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizTaskListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizTaskListRsp copyWith(void Function(QuizTaskListRsp) updates) =>
      super.copyWith((message) => updates(message as QuizTaskListRsp))
          as QuizTaskListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizTaskListRsp create() => QuizTaskListRsp._();
  @$core.override
  QuizTaskListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizTaskListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizTaskListRsp>(create);
  static QuizTaskListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<QuizTaskItem> get dailyTasks => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<QuizTaskItem> get weeklyTasks => $_getList(1);
}

class QuizTaskClaimReq extends $pb.GeneratedMessage {
  factory QuizTaskClaimReq({
    $core.String? taskCode,
  }) {
    final result = create();
    if (taskCode != null) result.taskCode = taskCode;
    return result;
  }

  QuizTaskClaimReq._();

  factory QuizTaskClaimReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizTaskClaimReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizTaskClaimReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizTaskClaimReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizTaskClaimReq copyWith(void Function(QuizTaskClaimReq) updates) =>
      super.copyWith((message) => updates(message as QuizTaskClaimReq))
          as QuizTaskClaimReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizTaskClaimReq create() => QuizTaskClaimReq._();
  @$core.override
  QuizTaskClaimReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizTaskClaimReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizTaskClaimReq>(create);
  static QuizTaskClaimReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskCode() => $_clearField(1);
}

class QuizTaskClaimRsp extends $pb.GeneratedMessage {
  factory QuizTaskClaimRsp({
    QuizTaskItem? task,
  }) {
    final result = create();
    if (task != null) result.task = task;
    return result;
  }

  QuizTaskClaimRsp._();

  factory QuizTaskClaimRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizTaskClaimRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizTaskClaimRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aOM<QuizTaskItem>(1, _omitFieldNames ? '' : 'task',
        subBuilder: QuizTaskItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizTaskClaimRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizTaskClaimRsp copyWith(void Function(QuizTaskClaimRsp) updates) =>
      super.copyWith((message) => updates(message as QuizTaskClaimRsp))
          as QuizTaskClaimRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizTaskClaimRsp create() => QuizTaskClaimRsp._();
  @$core.override
  QuizTaskClaimRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizTaskClaimRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizTaskClaimRsp>(create);
  static QuizTaskClaimRsp? _defaultInstance;

  @$pb.TagNumber(1)
  QuizTaskItem get task => $_getN(0);
  @$pb.TagNumber(1)
  set task(QuizTaskItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearTask() => $_clearField(1);
  @$pb.TagNumber(1)
  QuizTaskItem ensureTask() => $_ensure(0);
}

/// H5 活动首页 — GET /h5-api/v1/quiz/home_page
class QuizH5HomeRsp extends $pb.GeneratedMessage {
  factory QuizH5HomeRsp({
    $core.int? userRole,
    $core.Iterable<QuizActivityGiftItem>? activityGifts,
    $core.Iterable<QuizActivityHonor>? gsChallengeBadges,
    QuizActivityHonor? unluckyBadge,
    $core.Iterable<QuizEasterEggWeeklyLoser>? weeklyTopLosers,
  }) {
    final result = create();
    if (userRole != null) result.userRole = userRole;
    if (activityGifts != null) result.activityGifts.addAll(activityGifts);
    if (gsChallengeBadges != null)
      result.gsChallengeBadges.addAll(gsChallengeBadges);
    if (unluckyBadge != null) result.unluckyBadge = unluckyBadge;
    if (weeklyTopLosers != null) result.weeklyTopLosers.addAll(weeklyTopLosers);
    return result;
  }

  QuizH5HomeRsp._();

  factory QuizH5HomeRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizH5HomeRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizH5HomeRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'userRole')
    ..pPM<QuizActivityGiftItem>(2, _omitFieldNames ? '' : 'activityGifts',
        subBuilder: QuizActivityGiftItem.create)
    ..pPM<QuizActivityHonor>(3, _omitFieldNames ? '' : 'gsChallengeBadges',
        subBuilder: QuizActivityHonor.create)
    ..aOM<QuizActivityHonor>(4, _omitFieldNames ? '' : 'unluckyBadge',
        subBuilder: QuizActivityHonor.create)
    ..pPM<QuizEasterEggWeeklyLoser>(5, _omitFieldNames ? '' : 'weeklyTopLosers',
        subBuilder: QuizEasterEggWeeklyLoser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizH5HomeRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizH5HomeRsp copyWith(void Function(QuizH5HomeRsp) updates) =>
      super.copyWith((message) => updates(message as QuizH5HomeRsp))
          as QuizH5HomeRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizH5HomeRsp create() => QuizH5HomeRsp._();
  @$core.override
  QuizH5HomeRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizH5HomeRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizH5HomeRsp>(create);
  static QuizH5HomeRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userRole => $_getIZ(0);
  @$pb.TagNumber(1)
  set userRole($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserRole() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<QuizActivityGiftItem> get activityGifts => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<QuizActivityHonor> get gsChallengeBadges => $_getList(2);

  @$pb.TagNumber(4)
  QuizActivityHonor get unluckyBadge => $_getN(3);
  @$pb.TagNumber(4)
  set unluckyBadge(QuizActivityHonor value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasUnluckyBadge() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnluckyBadge() => $_clearField(4);
  @$pb.TagNumber(4)
  QuizActivityHonor ensureUnluckyBadge() => $_ensure(3);

  @$pb.TagNumber(5)
  $pb.PbList<QuizEasterEggWeeklyLoser> get weeklyTopLosers => $_getList(4);
}

/// 活动指定礼物
class QuizActivityGiftItem extends $pb.GeneratedMessage {
  factory QuizActivityGiftItem({
    $fixnum.Int64? giftId,
    $core.String? giftIcon,
    $core.String? name,
  }) {
    final result = create();
    if (giftId != null) result.giftId = giftId;
    if (giftIcon != null) result.giftIcon = giftIcon;
    if (name != null) result.name = name;
    return result;
  }

  QuizActivityGiftItem._();

  factory QuizActivityGiftItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizActivityGiftItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizActivityGiftItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'giftId')
    ..aOS(2, _omitFieldNames ? '' : 'giftIcon')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizActivityGiftItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizActivityGiftItem copyWith(void Function(QuizActivityGiftItem) updates) =>
      super.copyWith((message) => updates(message as QuizActivityGiftItem))
          as QuizActivityGiftItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizActivityGiftItem create() => QuizActivityGiftItem._();
  @$core.override
  QuizActivityGiftItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizActivityGiftItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizActivityGiftItem>(create);
  static QuizActivityGiftItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get giftId => $_getI64(0);
  @$pb.TagNumber(1)
  set giftId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get giftIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set giftIcon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGiftIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftIcon() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);
}

/// 竞猜活动勋章（主播挑战、世界杯主题、彩蛋倒霉蛋等共用）
class QuizActivityHonor extends $pb.GeneratedMessage {
  factory QuizActivityHonor({
    $fixnum.Int64? honorId,
    $core.String? honorName,
    $core.String? honorIcon,
    $core.String? type,
    $core.String? title,
    $fixnum.Int64? total,
    $fixnum.Int64? completeNum,
    $fixnum.Int64? periodDays,
    $core.bool? activated,
    $fixnum.Int64? pointCost,
  }) {
    final result = create();
    if (honorId != null) result.honorId = honorId;
    if (honorName != null) result.honorName = honorName;
    if (honorIcon != null) result.honorIcon = honorIcon;
    if (type != null) result.type = type;
    if (title != null) result.title = title;
    if (total != null) result.total = total;
    if (completeNum != null) result.completeNum = completeNum;
    if (periodDays != null) result.periodDays = periodDays;
    if (activated != null) result.activated = activated;
    if (pointCost != null) result.pointCost = pointCost;
    return result;
  }

  QuizActivityHonor._();

  factory QuizActivityHonor.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizActivityHonor.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizActivityHonor',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'honorId')
    ..aOS(2, _omitFieldNames ? '' : 'honorName')
    ..aOS(3, _omitFieldNames ? '' : 'honorIcon')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..aOS(5, _omitFieldNames ? '' : 'title')
    ..aInt64(6, _omitFieldNames ? '' : 'total')
    ..aInt64(7, _omitFieldNames ? '' : 'completeNum')
    ..aInt64(8, _omitFieldNames ? '' : 'periodDays')
    ..aOB(9, _omitFieldNames ? '' : 'activated')
    ..aInt64(10, _omitFieldNames ? '' : 'pointCost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizActivityHonor clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizActivityHonor copyWith(void Function(QuizActivityHonor) updates) =>
      super.copyWith((message) => updates(message as QuizActivityHonor))
          as QuizActivityHonor;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizActivityHonor create() => QuizActivityHonor._();
  @$core.override
  QuizActivityHonor createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizActivityHonor getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizActivityHonor>(create);
  static QuizActivityHonor? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get honorId => $_getI64(0);
  @$pb.TagNumber(1)
  set honorId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHonorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHonorId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get honorName => $_getSZ(1);
  @$pb.TagNumber(2)
  set honorName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHonorName() => $_has(1);
  @$pb.TagNumber(2)
  void clearHonorName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get honorIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set honorIcon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHonorIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearHonorIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(5)
  set title($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get total => $_getI64(5);
  @$pb.TagNumber(6)
  set total($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotal() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotal() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get completeNum => $_getI64(6);
  @$pb.TagNumber(7)
  set completeNum($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCompleteNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearCompleteNum() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get periodDays => $_getI64(7);
  @$pb.TagNumber(8)
  set periodDays($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPeriodDays() => $_has(7);
  @$pb.TagNumber(8)
  void clearPeriodDays() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get activated => $_getBF(8);
  @$pb.TagNumber(9)
  set activated($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasActivated() => $_has(8);
  @$pb.TagNumber(9)
  void clearActivated() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get pointCost => $_getI64(9);
  @$pb.TagNumber(10)
  set pointCost($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPointCost() => $_has(9);
  @$pb.TagNumber(10)
  void clearPointCost() => $_clearField(10);
}

/// 周猜错 TOP 用户
class QuizEasterEggWeeklyLoser extends $pb.GeneratedMessage {
  factory QuizEasterEggWeeklyLoser({
    $fixnum.Int64? uid,
    $core.String? nickname,
    $core.String? avatar,
    $core.String? emUserName,
    $fixnum.Int64? loseCount,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    if (emUserName != null) result.emUserName = emUserName;
    if (loseCount != null) result.loseCount = loseCount;
    return result;
  }

  QuizEasterEggWeeklyLoser._();

  factory QuizEasterEggWeeklyLoser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizEasterEggWeeklyLoser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizEasterEggWeeklyLoser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'emUserName')
    ..aInt64(5, _omitFieldNames ? '' : 'loseCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizEasterEggWeeklyLoser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizEasterEggWeeklyLoser copyWith(
          void Function(QuizEasterEggWeeklyLoser) updates) =>
      super.copyWith((message) => updates(message as QuizEasterEggWeeklyLoser))
          as QuizEasterEggWeeklyLoser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizEasterEggWeeklyLoser create() => QuizEasterEggWeeklyLoser._();
  @$core.override
  QuizEasterEggWeeklyLoser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizEasterEggWeeklyLoser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizEasterEggWeeklyLoser>(create);
  static QuizEasterEggWeeklyLoser? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get emUserName => $_getSZ(3);
  @$pb.TagNumber(4)
  set emUserName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmUserName() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmUserName() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get loseCount => $_getI64(4);
  @$pb.TagNumber(5)
  set loseCount($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLoseCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearLoseCount() => $_clearField(5);
}

class QuizExchangeItem extends $pb.GeneratedMessage {
  factory QuizExchangeItem({
    $fixnum.Int64? itemId,
    $core.String? name,
    $core.String? icon,
    $fixnum.Int64? pointCost,
  }) {
    final result = create();
    if (itemId != null) result.itemId = itemId;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (pointCost != null) result.pointCost = pointCost;
    return result;
  }

  QuizExchangeItem._();

  factory QuizExchangeItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizExchangeItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizExchangeItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'itemId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aInt64(4, _omitFieldNames ? '' : 'pointCost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizExchangeItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizExchangeItem copyWith(void Function(QuizExchangeItem) updates) =>
      super.copyWith((message) => updates(message as QuizExchangeItem))
          as QuizExchangeItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizExchangeItem create() => QuizExchangeItem._();
  @$core.override
  QuizExchangeItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizExchangeItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizExchangeItem>(create);
  static QuizExchangeItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get itemId => $_getI64(0);
  @$pb.TagNumber(1)
  set itemId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItemId() => $_has(0);
  @$pb.TagNumber(1)
  void clearItemId() => $_clearField(1);

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
  $fixnum.Int64 get pointCost => $_getI64(3);
  @$pb.TagNumber(4)
  set pointCost($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPointCost() => $_has(3);
  @$pb.TagNumber(4)
  void clearPointCost() => $_clearField(4);
}

/// 座驾抽奖兑换项
class QuizExchangeCarDraw extends $pb.GeneratedMessage {
  factory QuizExchangeCarDraw({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? icon,
    $fixnum.Int64? costPoints,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (costPoints != null) result.costPoints = costPoints;
    return result;
  }

  QuizExchangeCarDraw._();

  factory QuizExchangeCarDraw.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizExchangeCarDraw.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizExchangeCarDraw',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aInt64(4, _omitFieldNames ? '' : 'costPoints')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizExchangeCarDraw clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizExchangeCarDraw copyWith(void Function(QuizExchangeCarDraw) updates) =>
      super.copyWith((message) => updates(message as QuizExchangeCarDraw))
          as QuizExchangeCarDraw;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizExchangeCarDraw create() => QuizExchangeCarDraw._();
  @$core.override
  QuizExchangeCarDraw createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizExchangeCarDraw getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizExchangeCarDraw>(create);
  static QuizExchangeCarDraw? _defaultInstance;

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
  $fixnum.Int64 get costPoints => $_getI64(3);
  @$pb.TagNumber(4)
  set costPoints($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCostPoints() => $_has(3);
  @$pb.TagNumber(4)
  void clearCostPoints() => $_clearField(4);
}

class QuizExchangeItemsRsp extends $pb.GeneratedMessage {
  factory QuizExchangeItemsRsp({
    $core.Iterable<QuizExchangeItem>? list,
    QuizActivityHonor? worldCupThemeHonor,
    $core.Iterable<QuizExchangeCarDraw>? carDraws,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (worldCupThemeHonor != null)
      result.worldCupThemeHonor = worldCupThemeHonor;
    if (carDraws != null) result.carDraws.addAll(carDraws);
    return result;
  }

  QuizExchangeItemsRsp._();

  factory QuizExchangeItemsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizExchangeItemsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizExchangeItemsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..pPM<QuizExchangeItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: QuizExchangeItem.create)
    ..aOM<QuizActivityHonor>(2, _omitFieldNames ? '' : 'worldCupThemeHonor',
        subBuilder: QuizActivityHonor.create)
    ..pPM<QuizExchangeCarDraw>(3, _omitFieldNames ? '' : 'carDraws',
        subBuilder: QuizExchangeCarDraw.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizExchangeItemsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizExchangeItemsRsp copyWith(void Function(QuizExchangeItemsRsp) updates) =>
      super.copyWith((message) => updates(message as QuizExchangeItemsRsp))
          as QuizExchangeItemsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizExchangeItemsRsp create() => QuizExchangeItemsRsp._();
  @$core.override
  QuizExchangeItemsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizExchangeItemsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizExchangeItemsRsp>(create);
  static QuizExchangeItemsRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<QuizExchangeItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  QuizActivityHonor get worldCupThemeHonor => $_getN(1);
  @$pb.TagNumber(2)
  set worldCupThemeHonor(QuizActivityHonor value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasWorldCupThemeHonor() => $_has(1);
  @$pb.TagNumber(2)
  void clearWorldCupThemeHonor() => $_clearField(2);
  @$pb.TagNumber(2)
  QuizActivityHonor ensureWorldCupThemeHonor() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbList<QuizExchangeCarDraw> get carDraws => $_getList(2);
}

class QuizExchangeReq extends $pb.GeneratedMessage {
  factory QuizExchangeReq({
    $fixnum.Int64? itemId,
    QuizExchangeType? exchangeType,
  }) {
    final result = create();
    if (itemId != null) result.itemId = itemId;
    if (exchangeType != null) result.exchangeType = exchangeType;
    return result;
  }

  QuizExchangeReq._();

  factory QuizExchangeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizExchangeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizExchangeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'itemId')
    ..aE<QuizExchangeType>(2, _omitFieldNames ? '' : 'exchangeType',
        enumValues: QuizExchangeType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizExchangeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizExchangeReq copyWith(void Function(QuizExchangeReq) updates) =>
      super.copyWith((message) => updates(message as QuizExchangeReq))
          as QuizExchangeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizExchangeReq create() => QuizExchangeReq._();
  @$core.override
  QuizExchangeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizExchangeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizExchangeReq>(create);
  static QuizExchangeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get itemId => $_getI64(0);
  @$pb.TagNumber(1)
  set itemId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItemId() => $_has(0);
  @$pb.TagNumber(1)
  void clearItemId() => $_clearField(1);

  @$pb.TagNumber(2)
  QuizExchangeType get exchangeType => $_getN(1);
  @$pb.TagNumber(2)
  set exchangeType(QuizExchangeType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasExchangeType() => $_has(1);
  @$pb.TagNumber(2)
  void clearExchangeType() => $_clearField(2);
}

class QuizExchangeLogItem extends $pb.GeneratedMessage {
  factory QuizExchangeLogItem({
    $fixnum.Int64? itemId,
    $core.String? name,
    $fixnum.Int64? pointCost,
    $fixnum.Int64? exchangeTime,
    $core.String? icon,
  }) {
    final result = create();
    if (itemId != null) result.itemId = itemId;
    if (name != null) result.name = name;
    if (pointCost != null) result.pointCost = pointCost;
    if (exchangeTime != null) result.exchangeTime = exchangeTime;
    if (icon != null) result.icon = icon;
    return result;
  }

  QuizExchangeLogItem._();

  factory QuizExchangeLogItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizExchangeLogItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizExchangeLogItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'itemId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aInt64(3, _omitFieldNames ? '' : 'pointCost')
    ..aInt64(4, _omitFieldNames ? '' : 'exchangeTime')
    ..aOS(5, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizExchangeLogItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizExchangeLogItem copyWith(void Function(QuizExchangeLogItem) updates) =>
      super.copyWith((message) => updates(message as QuizExchangeLogItem))
          as QuizExchangeLogItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizExchangeLogItem create() => QuizExchangeLogItem._();
  @$core.override
  QuizExchangeLogItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizExchangeLogItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizExchangeLogItem>(create);
  static QuizExchangeLogItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get itemId => $_getI64(0);
  @$pb.TagNumber(1)
  set itemId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItemId() => $_has(0);
  @$pb.TagNumber(1)
  void clearItemId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get pointCost => $_getI64(2);
  @$pb.TagNumber(3)
  set pointCost($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPointCost() => $_has(2);
  @$pb.TagNumber(3)
  void clearPointCost() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get exchangeTime => $_getI64(3);
  @$pb.TagNumber(4)
  set exchangeTime($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExchangeTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearExchangeTime() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => $_clearField(5);
}

class QuizExchangeLogsRsp extends $pb.GeneratedMessage {
  factory QuizExchangeLogsRsp({
    $core.Iterable<QuizExchangeLogItem>? list,
    $2.Page? page,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    if (page != null) result.page = page;
    return result;
  }

  QuizExchangeLogsRsp._();

  factory QuizExchangeLogsRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuizExchangeLogsRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuizExchangeLogsRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..pPM<QuizExchangeLogItem>(1, _omitFieldNames ? '' : 'list',
        subBuilder: QuizExchangeLogItem.create)
    ..aOM<$2.Page>(2, _omitFieldNames ? '' : 'page', subBuilder: $2.Page.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizExchangeLogsRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuizExchangeLogsRsp copyWith(void Function(QuizExchangeLogsRsp) updates) =>
      super.copyWith((message) => updates(message as QuizExchangeLogsRsp))
          as QuizExchangeLogsRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuizExchangeLogsRsp create() => QuizExchangeLogsRsp._();
  @$core.override
  QuizExchangeLogsRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuizExchangeLogsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuizExchangeLogsRsp>(create);
  static QuizExchangeLogsRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<QuizExchangeLogItem> get list => $_getList(0);

  @$pb.TagNumber(2)
  $2.Page get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($2.Page value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.Page ensurePage() => $_ensure(1);
}

class ShareQuizInfo extends $pb.GeneratedMessage {
  factory ShareQuizInfo({
    $0.User? gsInfo,
  }) {
    final result = create();
    if (gsInfo != null) result.gsInfo = gsInfo;
    return result;
  }

  ShareQuizInfo._();

  factory ShareQuizInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShareQuizInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShareQuizInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'quiz'),
      createEmptyInstance: create)
    ..aOM<$0.User>(1, _omitFieldNames ? '' : 'gsInfo',
        subBuilder: $0.User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShareQuizInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShareQuizInfo copyWith(void Function(ShareQuizInfo) updates) =>
      super.copyWith((message) => updates(message as ShareQuizInfo))
          as ShareQuizInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShareQuizInfo create() => ShareQuizInfo._();
  @$core.override
  ShareQuizInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShareQuizInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShareQuizInfo>(create);
  static ShareQuizInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $0.User get gsInfo => $_getN(0);
  @$pb.TagNumber(1)
  set gsInfo($0.User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGsInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.User ensureGsInfo() => $_ensure(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

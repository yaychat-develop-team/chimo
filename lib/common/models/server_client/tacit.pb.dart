// This is a generated file - do not edit.
//
// Generated from server_client/tacit.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'tacit.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'tacit.pbenum.dart';

class GetTacitScoreReq extends $pb.GeneratedMessage {
  factory GetTacitScoreReq({
    $fixnum.Int64? user,
    $fixnum.Int64? gs,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (gs != null) result.gs = gs;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  GetTacitScoreReq._();

  factory GetTacitScoreReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTacitScoreReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTacitScoreReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'user', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'gs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTacitScoreReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTacitScoreReq copyWith(void Function(GetTacitScoreReq) updates) =>
      super.copyWith((message) => updates(message as GetTacitScoreReq))
          as GetTacitScoreReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTacitScoreReq create() => GetTacitScoreReq._();
  @$core.override
  GetTacitScoreReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetTacitScoreReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTacitScoreReq>(create);
  static GetTacitScoreReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get user => $_getI64(0);
  @$pb.TagNumber(1)
  set user($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get gs => $_getI64(1);
  @$pb.TagNumber(2)
  set gs($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGs() => $_has(1);
  @$pb.TagNumber(2)
  void clearGs() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get channelId => $_getI64(2);
  @$pb.TagNumber(3)
  set channelId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChannelId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannelId() => $_clearField(3);
}

class GetTacitScoreRsp extends $pb.GeneratedMessage {
  factory GetTacitScoreRsp({
    $fixnum.Int64? firstTestTimeStampMs,
    $fixnum.Int64? lastTestTimeStampMs,
    $core.int? score,
  }) {
    final result = create();
    if (firstTestTimeStampMs != null)
      result.firstTestTimeStampMs = firstTestTimeStampMs;
    if (lastTestTimeStampMs != null)
      result.lastTestTimeStampMs = lastTestTimeStampMs;
    if (score != null) result.score = score;
    return result;
  }

  GetTacitScoreRsp._();

  factory GetTacitScoreRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTacitScoreRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTacitScoreRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'firstTestTimeStampMs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'lastTestTimeStampMs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(3, _omitFieldNames ? '' : 'score', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTacitScoreRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTacitScoreRsp copyWith(void Function(GetTacitScoreRsp) updates) =>
      super.copyWith((message) => updates(message as GetTacitScoreRsp))
          as GetTacitScoreRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTacitScoreRsp create() => GetTacitScoreRsp._();
  @$core.override
  GetTacitScoreRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetTacitScoreRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTacitScoreRsp>(create);
  static GetTacitScoreRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get firstTestTimeStampMs => $_getI64(0);
  @$pb.TagNumber(1)
  set firstTestTimeStampMs($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFirstTestTimeStampMs() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstTestTimeStampMs() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastTestTimeStampMs => $_getI64(1);
  @$pb.TagNumber(2)
  set lastTestTimeStampMs($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLastTestTimeStampMs() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastTestTimeStampMs() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get score => $_getIZ(2);
  @$pb.TagNumber(3)
  set score($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => $_clearField(3);
}

class InviteTacitReq extends $pb.GeneratedMessage {
  factory InviteTacitReq({
    $fixnum.Int64? gs,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (gs != null) result.gs = gs;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  InviteTacitReq._();

  factory InviteTacitReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteTacitReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteTacitReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'gs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteTacitReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteTacitReq copyWith(void Function(InviteTacitReq) updates) =>
      super.copyWith((message) => updates(message as InviteTacitReq))
          as InviteTacitReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteTacitReq create() => InviteTacitReq._();
  @$core.override
  InviteTacitReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InviteTacitReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteTacitReq>(create);
  static InviteTacitReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get gs => $_getI64(0);
  @$pb.TagNumber(1)
  set gs($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGs() => $_has(0);
  @$pb.TagNumber(1)
  void clearGs() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get channelId => $_getI64(1);
  @$pb.TagNumber(2)
  set channelId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => $_clearField(2);
}

class GsTacitResponse extends $pb.GeneratedMessage {
  factory GsTacitResponse({
    $core.bool? accept,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (accept != null) result.accept = accept;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  GsTacitResponse._();

  factory GsTacitResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsTacitResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsTacitResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'accept')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsTacitResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsTacitResponse copyWith(void Function(GsTacitResponse) updates) =>
      super.copyWith((message) => updates(message as GsTacitResponse))
          as GsTacitResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsTacitResponse create() => GsTacitResponse._();
  @$core.override
  GsTacitResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsTacitResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsTacitResponse>(create);
  static GsTacitResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get accept => $_getBF(0);
  @$pb.TagNumber(1)
  set accept($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccept() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccept() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get channelId => $_getI64(1);
  @$pb.TagNumber(2)
  set channelId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => $_clearField(2);
}

class AnswerTacitQuest extends $pb.GeneratedMessage {
  factory AnswerTacitQuest({
    $core.int? questIndex,
    $core.int? answerIndex,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (questIndex != null) result.questIndex = questIndex;
    if (answerIndex != null) result.answerIndex = answerIndex;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  AnswerTacitQuest._();

  factory AnswerTacitQuest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnswerTacitQuest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnswerTacitQuest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'questIndex', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'answerIndex',
        fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnswerTacitQuest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnswerTacitQuest copyWith(void Function(AnswerTacitQuest) updates) =>
      super.copyWith((message) => updates(message as AnswerTacitQuest))
          as AnswerTacitQuest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnswerTacitQuest create() => AnswerTacitQuest._();
  @$core.override
  AnswerTacitQuest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnswerTacitQuest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnswerTacitQuest>(create);
  static AnswerTacitQuest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get questIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set questIndex($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuestIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestIndex() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get answerIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set answerIndex($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAnswerIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnswerIndex() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get channelId => $_getI64(2);
  @$pb.TagNumber(3)
  set channelId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChannelId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannelId() => $_clearField(3);
}

enum TacitPush_Message { abort, invitation, quest, end, notSet }

class TacitPush extends $pb.GeneratedMessage {
  factory TacitPush({
    $fixnum.Int64? user,
    $fixnum.Int64? gs,
    TacitAbortReason? abort,
    TacitInvitation? invitation,
    TacitQuest? quest,
    TacitEnd? end,
    TacitUserInfo? userInfo,
    TacitUserInfo? gsInfo,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (gs != null) result.gs = gs;
    if (abort != null) result.abort = abort;
    if (invitation != null) result.invitation = invitation;
    if (quest != null) result.quest = quest;
    if (end != null) result.end = end;
    if (userInfo != null) result.userInfo = userInfo;
    if (gsInfo != null) result.gsInfo = gsInfo;
    return result;
  }

  TacitPush._();

  factory TacitPush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TacitPush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, TacitPush_Message> _TacitPush_MessageByTag =
      {
    3: TacitPush_Message.abort,
    4: TacitPush_Message.invitation,
    5: TacitPush_Message.quest,
    6: TacitPush_Message.end,
    0: TacitPush_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TacitPush',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5, 6])
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'user', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'gs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aE<TacitAbortReason>(3, _omitFieldNames ? '' : 'abort',
        enumValues: TacitAbortReason.values)
    ..aOM<TacitInvitation>(4, _omitFieldNames ? '' : 'invitation',
        subBuilder: TacitInvitation.create)
    ..aOM<TacitQuest>(5, _omitFieldNames ? '' : 'quest',
        subBuilder: TacitQuest.create)
    ..aOM<TacitEnd>(6, _omitFieldNames ? '' : 'end',
        subBuilder: TacitEnd.create)
    ..aOM<TacitUserInfo>(7, _omitFieldNames ? '' : 'userInfo',
        protoName: 'userInfo', subBuilder: TacitUserInfo.create)
    ..aOM<TacitUserInfo>(8, _omitFieldNames ? '' : 'gsInfo',
        protoName: 'gsInfo', subBuilder: TacitUserInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TacitPush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TacitPush copyWith(void Function(TacitPush) updates) =>
      super.copyWith((message) => updates(message as TacitPush)) as TacitPush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TacitPush create() => TacitPush._();
  @$core.override
  TacitPush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TacitPush getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TacitPush>(create);
  static TacitPush? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  TacitPush_Message whichMessage() => _TacitPush_MessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  void clearMessage() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $fixnum.Int64 get user => $_getI64(0);
  @$pb.TagNumber(1)
  set user($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get gs => $_getI64(1);
  @$pb.TagNumber(2)
  set gs($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGs() => $_has(1);
  @$pb.TagNumber(2)
  void clearGs() => $_clearField(2);

  @$pb.TagNumber(3)
  TacitAbortReason get abort => $_getN(2);
  @$pb.TagNumber(3)
  set abort(TacitAbortReason value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAbort() => $_has(2);
  @$pb.TagNumber(3)
  void clearAbort() => $_clearField(3);

  @$pb.TagNumber(4)
  TacitInvitation get invitation => $_getN(3);
  @$pb.TagNumber(4)
  set invitation(TacitInvitation value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasInvitation() => $_has(3);
  @$pb.TagNumber(4)
  void clearInvitation() => $_clearField(4);
  @$pb.TagNumber(4)
  TacitInvitation ensureInvitation() => $_ensure(3);

  @$pb.TagNumber(5)
  TacitQuest get quest => $_getN(4);
  @$pb.TagNumber(5)
  set quest(TacitQuest value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasQuest() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuest() => $_clearField(5);
  @$pb.TagNumber(5)
  TacitQuest ensureQuest() => $_ensure(4);

  @$pb.TagNumber(6)
  TacitEnd get end => $_getN(5);
  @$pb.TagNumber(6)
  set end(TacitEnd value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasEnd() => $_has(5);
  @$pb.TagNumber(6)
  void clearEnd() => $_clearField(6);
  @$pb.TagNumber(6)
  TacitEnd ensureEnd() => $_ensure(5);

  @$pb.TagNumber(7)
  TacitUserInfo get userInfo => $_getN(6);
  @$pb.TagNumber(7)
  set userInfo(TacitUserInfo value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasUserInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserInfo() => $_clearField(7);
  @$pb.TagNumber(7)
  TacitUserInfo ensureUserInfo() => $_ensure(6);

  @$pb.TagNumber(8)
  TacitUserInfo get gsInfo => $_getN(7);
  @$pb.TagNumber(8)
  set gsInfo(TacitUserInfo value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasGsInfo() => $_has(7);
  @$pb.TagNumber(8)
  void clearGsInfo() => $_clearField(8);
  @$pb.TagNumber(8)
  TacitUserInfo ensureGsInfo() => $_ensure(7);
}

class TacitInvitation extends $pb.GeneratedMessage {
  factory TacitInvitation({
    $fixnum.Int64? endTimestampMs,
  }) {
    final result = create();
    if (endTimestampMs != null) result.endTimestampMs = endTimestampMs;
    return result;
  }

  TacitInvitation._();

  factory TacitInvitation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TacitInvitation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TacitInvitation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'endTimestampMs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TacitInvitation clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TacitInvitation copyWith(void Function(TacitInvitation) updates) =>
      super.copyWith((message) => updates(message as TacitInvitation))
          as TacitInvitation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TacitInvitation create() => TacitInvitation._();
  @$core.override
  TacitInvitation createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TacitInvitation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TacitInvitation>(create);
  static TacitInvitation? _defaultInstance;

  /// 截止时间戳
  /// 这里按照业务逻辑 客户端在超时用户未做任何操作的时候 调用接口接受邀请
  /// 如果客户端在超时一段时间后依然未做任何接口请求 我会认为用户掉线或者离开了 结束这次测试
  @$pb.TagNumber(1)
  $fixnum.Int64 get endTimestampMs => $_getI64(0);
  @$pb.TagNumber(1)
  set endTimestampMs($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEndTimestampMs() => $_has(0);
  @$pb.TagNumber(1)
  void clearEndTimestampMs() => $_clearField(1);
}

class TacitQuest extends $pb.GeneratedMessage {
  factory TacitQuest({
    $core.int? index,
    $core.String? title,
    $core.Iterable<TacitAnswer>? answers,
    $fixnum.Int64? endTimestampMs,
  }) {
    final result = create();
    if (index != null) result.index = index;
    if (title != null) result.title = title;
    if (answers != null) result.answers.addAll(answers);
    if (endTimestampMs != null) result.endTimestampMs = endTimestampMs;
    return result;
  }

  TacitQuest._();

  factory TacitQuest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TacitQuest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TacitQuest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'index', fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..pPM<TacitAnswer>(3, _omitFieldNames ? '' : 'answers',
        subBuilder: TacitAnswer.create)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'endTimestampMs', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TacitQuest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TacitQuest copyWith(void Function(TacitQuest) updates) =>
      super.copyWith((message) => updates(message as TacitQuest)) as TacitQuest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TacitQuest create() => TacitQuest._();
  @$core.override
  TacitQuest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TacitQuest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TacitQuest>(create);
  static TacitQuest? _defaultInstance;

  /// 从0自增 回答问题的时候需要
  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  /// 因为后端数据库没有数组 所以设计上可以支持无限多个答案
  /// 但是目前录入数据库的时候会只录入2个答案 异常数据找我处理
  @$pb.TagNumber(3)
  $pb.PbList<TacitAnswer> get answers => $_getList(2);

  /// 结束答题时间戳
  @$pb.TagNumber(4)
  $fixnum.Int64 get endTimestampMs => $_getI64(3);
  @$pb.TagNumber(4)
  set endTimestampMs($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEndTimestampMs() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndTimestampMs() => $_clearField(4);
}

class TacitAnswer extends $pb.GeneratedMessage {
  factory TacitAnswer({
    $core.int? index,
    $core.String? title,
  }) {
    final result = create();
    if (index != null) result.index = index;
    if (title != null) result.title = title;
    return result;
  }

  TacitAnswer._();

  factory TacitAnswer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TacitAnswer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TacitAnswer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'index', fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TacitAnswer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TacitAnswer copyWith(void Function(TacitAnswer) updates) =>
      super.copyWith((message) => updates(message as TacitAnswer))
          as TacitAnswer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TacitAnswer create() => TacitAnswer._();
  @$core.override
  TacitAnswer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TacitAnswer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TacitAnswer>(create);
  static TacitAnswer? _defaultInstance;

  /// 每个问题的答案都从0自增 回答问题的时候需要
  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);
}

class TacitEnd extends $pb.GeneratedMessage {
  factory TacitEnd({
    $core.int? score,
    $core.Iterable<TacitAnswerRecord>? answerRecord,
  }) {
    final result = create();
    if (score != null) result.score = score;
    if (answerRecord != null) result.answerRecord.addAll(answerRecord);
    return result;
  }

  TacitEnd._();

  factory TacitEnd.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TacitEnd.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TacitEnd',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'score', fieldType: $pb.PbFieldType.OU3)
    ..pPM<TacitAnswerRecord>(2, _omitFieldNames ? '' : 'answerRecord',
        subBuilder: TacitAnswerRecord.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TacitEnd clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TacitEnd copyWith(void Function(TacitEnd) updates) =>
      super.copyWith((message) => updates(message as TacitEnd)) as TacitEnd;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TacitEnd create() => TacitEnd._();
  @$core.override
  TacitEnd createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TacitEnd getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TacitEnd>(create);
  static TacitEnd? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get score => $_getIZ(0);
  @$pb.TagNumber(1)
  set score($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasScore() => $_has(0);
  @$pb.TagNumber(1)
  void clearScore() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<TacitAnswerRecord> get answerRecord => $_getList(1);
}

class TacitAnswerRecord extends $pb.GeneratedMessage {
  factory TacitAnswerRecord({
    $core.int? userAnswer,
    $core.int? gsAnswer,
    TacitAnswer? answers,
    TacitQuest? quest,
  }) {
    final result = create();
    if (userAnswer != null) result.userAnswer = userAnswer;
    if (gsAnswer != null) result.gsAnswer = gsAnswer;
    if (answers != null) result.answers = answers;
    if (quest != null) result.quest = quest;
    return result;
  }

  TacitAnswerRecord._();

  factory TacitAnswerRecord.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TacitAnswerRecord.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TacitAnswerRecord',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'userAnswer', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'gsAnswer', fieldType: $pb.PbFieldType.OU3)
    ..aOM<TacitAnswer>(3, _omitFieldNames ? '' : 'answers',
        subBuilder: TacitAnswer.create)
    ..aOM<TacitQuest>(4, _omitFieldNames ? '' : 'quest',
        subBuilder: TacitQuest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TacitAnswerRecord clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TacitAnswerRecord copyWith(void Function(TacitAnswerRecord) updates) =>
      super.copyWith((message) => updates(message as TacitAnswerRecord))
          as TacitAnswerRecord;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TacitAnswerRecord create() => TacitAnswerRecord._();
  @$core.override
  TacitAnswerRecord createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TacitAnswerRecord getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TacitAnswerRecord>(create);
  static TacitAnswerRecord? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userAnswer => $_getIZ(0);
  @$pb.TagNumber(1)
  set userAnswer($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserAnswer() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserAnswer() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get gsAnswer => $_getIZ(1);
  @$pb.TagNumber(2)
  set gsAnswer($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGsAnswer() => $_has(1);
  @$pb.TagNumber(2)
  void clearGsAnswer() => $_clearField(2);

  @$pb.TagNumber(3)
  TacitAnswer get answers => $_getN(2);
  @$pb.TagNumber(3)
  set answers(TacitAnswer value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAnswers() => $_has(2);
  @$pb.TagNumber(3)
  void clearAnswers() => $_clearField(3);
  @$pb.TagNumber(3)
  TacitAnswer ensureAnswers() => $_ensure(2);

  @$pb.TagNumber(4)
  TacitQuest get quest => $_getN(3);
  @$pb.TagNumber(4)
  set quest(TacitQuest value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasQuest() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuest() => $_clearField(4);
  @$pb.TagNumber(4)
  TacitQuest ensureQuest() => $_ensure(3);
}

class TacitUserInfo extends $pb.GeneratedMessage {
  factory TacitUserInfo({
    $fixnum.Int64? uid,
    $core.String? avatar,
    $core.String? nickName,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (avatar != null) result.avatar = avatar;
    if (nickName != null) result.nickName = nickName;
    return result;
  }

  TacitUserInfo._();

  factory TacitUserInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TacitUserInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TacitUserInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'avatar')
    ..aOS(3, _omitFieldNames ? '' : 'nickName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TacitUserInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TacitUserInfo copyWith(void Function(TacitUserInfo) updates) =>
      super.copyWith((message) => updates(message as TacitUserInfo))
          as TacitUserInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TacitUserInfo create() => TacitUserInfo._();
  @$core.override
  TacitUserInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TacitUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TacitUserInfo>(create);
  static TacitUserInfo? _defaultInstance;

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
  $core.String get nickName => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickName() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickName() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

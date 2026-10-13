// This is a generated file - do not edit.
//
// Generated from server_client/mentor.proto.

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

enum MentorCheckRsp_Status {
  searchBegin,
  frequencyControl,
  alreadyAssigned,
  notSet
}

class MentorCheckRsp extends $pb.GeneratedMessage {
  factory MentorCheckRsp({
    MentorCheckSearchBegin? searchBegin,
    MentorCheckFrequencyControl? frequencyControl,
    MentorCheckAlreadyAssigned? alreadyAssigned,
  }) {
    final result = create();
    if (searchBegin != null) result.searchBegin = searchBegin;
    if (frequencyControl != null) result.frequencyControl = frequencyControl;
    if (alreadyAssigned != null) result.alreadyAssigned = alreadyAssigned;
    return result;
  }

  MentorCheckRsp._();

  factory MentorCheckRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorCheckRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, MentorCheckRsp_Status>
      _MentorCheckRsp_StatusByTag = {
    3: MentorCheckRsp_Status.searchBegin,
    4: MentorCheckRsp_Status.frequencyControl,
    5: MentorCheckRsp_Status.alreadyAssigned,
    0: MentorCheckRsp_Status.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorCheckRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5])
    ..aOM<MentorCheckSearchBegin>(3, _omitFieldNames ? '' : 'searchBegin',
        subBuilder: MentorCheckSearchBegin.create)
    ..aOM<MentorCheckFrequencyControl>(
        4, _omitFieldNames ? '' : 'frequencyControl',
        subBuilder: MentorCheckFrequencyControl.create)
    ..aOM<MentorCheckAlreadyAssigned>(
        5, _omitFieldNames ? '' : 'alreadyAssigned',
        subBuilder: MentorCheckAlreadyAssigned.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorCheckRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorCheckRsp copyWith(void Function(MentorCheckRsp) updates) =>
      super.copyWith((message) => updates(message as MentorCheckRsp))
          as MentorCheckRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorCheckRsp create() => MentorCheckRsp._();
  @$core.override
  MentorCheckRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorCheckRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorCheckRsp>(create);
  static MentorCheckRsp? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  MentorCheckRsp_Status whichStatus() =>
      _MentorCheckRsp_StatusByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField($_whichOneof(0));

  /// 开始寻找陪伴师
  @$pb.TagNumber(3)
  MentorCheckSearchBegin get searchBegin => $_getN(0);
  @$pb.TagNumber(3)
  set searchBegin(MentorCheckSearchBegin value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSearchBegin() => $_has(0);
  @$pb.TagNumber(3)
  void clearSearchBegin() => $_clearField(3);
  @$pb.TagNumber(3)
  MentorCheckSearchBegin ensureSearchBegin() => $_ensure(0);

  /// 频控限制
  @$pb.TagNumber(4)
  MentorCheckFrequencyControl get frequencyControl => $_getN(1);
  @$pb.TagNumber(4)
  set frequencyControl(MentorCheckFrequencyControl value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasFrequencyControl() => $_has(1);
  @$pb.TagNumber(4)
  void clearFrequencyControl() => $_clearField(4);
  @$pb.TagNumber(4)
  MentorCheckFrequencyControl ensureFrequencyControl() => $_ensure(1);

  /// 已经分配过陪伴师了
  @$pb.TagNumber(5)
  MentorCheckAlreadyAssigned get alreadyAssigned => $_getN(2);
  @$pb.TagNumber(5)
  set alreadyAssigned(MentorCheckAlreadyAssigned value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasAlreadyAssigned() => $_has(2);
  @$pb.TagNumber(5)
  void clearAlreadyAssigned() => $_clearField(5);
  @$pb.TagNumber(5)
  MentorCheckAlreadyAssigned ensureAlreadyAssigned() => $_ensure(2);
}

class MentorBidReq extends $pb.GeneratedMessage {
  factory MentorBidReq({
    $fixnum.Int64? user,
  }) {
    final result = create();
    if (user != null) result.user = user;
    return result;
  }

  MentorBidReq._();

  factory MentorBidReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorBidReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorBidReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'user', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorBidReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorBidReq copyWith(void Function(MentorBidReq) updates) =>
      super.copyWith((message) => updates(message as MentorBidReq))
          as MentorBidReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorBidReq create() => MentorBidReq._();
  @$core.override
  MentorBidReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorBidReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorBidReq>(create);
  static MentorBidReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get user => $_getI64(0);
  @$pb.TagNumber(1)
  set user($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
}

class MentorBidRsp extends $pb.GeneratedMessage {
  factory MentorBidRsp({
    $core.bool? bidDispatched,
  }) {
    final result = create();
    if (bidDispatched != null) result.bidDispatched = bidDispatched;
    return result;
  }

  MentorBidRsp._();

  factory MentorBidRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorBidRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorBidRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..aOB(3, _omitFieldNames ? '' : 'bidDispatched')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorBidRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorBidRsp copyWith(void Function(MentorBidRsp) updates) =>
      super.copyWith((message) => updates(message as MentorBidRsp))
          as MentorBidRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorBidRsp create() => MentorBidRsp._();
  @$core.override
  MentorBidRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorBidRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorBidRsp>(create);
  static MentorBidRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $core.bool get bidDispatched => $_getBF(0);
  @$pb.TagNumber(3)
  set bidDispatched($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(3)
  $core.bool hasBidDispatched() => $_has(0);
  @$pb.TagNumber(3)
  void clearBidDispatched() => $_clearField(3);
}

class MentorCheckSearchBegin extends $pb.GeneratedMessage {
  factory MentorCheckSearchBegin({
    $fixnum.Int64? endAtTimestamp,
    $core.Iterable<$fixnum.Int64>? gsId,
  }) {
    final result = create();
    if (endAtTimestamp != null) result.endAtTimestamp = endAtTimestamp;
    if (gsId != null) result.gsId.addAll(gsId);
    return result;
  }

  MentorCheckSearchBegin._();

  factory MentorCheckSearchBegin.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorCheckSearchBegin.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorCheckSearchBegin',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'endAtTimestamp', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$fixnum.Int64>(3, _omitFieldNames ? '' : 'gsId', $pb.PbFieldType.KU6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorCheckSearchBegin clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorCheckSearchBegin copyWith(
          void Function(MentorCheckSearchBegin) updates) =>
      super.copyWith((message) => updates(message as MentorCheckSearchBegin))
          as MentorCheckSearchBegin;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorCheckSearchBegin create() => MentorCheckSearchBegin._();
  @$core.override
  MentorCheckSearchBegin createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorCheckSearchBegin getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorCheckSearchBegin>(create);
  static MentorCheckSearchBegin? _defaultInstance;

  @$pb.TagNumber(2)
  $fixnum.Int64 get endAtTimestamp => $_getI64(0);
  @$pb.TagNumber(2)
  set endAtTimestamp($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(2)
  $core.bool hasEndAtTimestamp() => $_has(0);
  @$pb.TagNumber(2)
  void clearEndAtTimestamp() => $_clearField(2);

  /// 正在呼叫的gs列表
  @$pb.TagNumber(3)
  $pb.PbList<$fixnum.Int64> get gsId => $_getList(1);
}

class MentorCheckFrequencyControl extends $pb.GeneratedMessage {
  factory MentorCheckFrequencyControl({
    $fixnum.Int64? searchAgainAt,
  }) {
    final result = create();
    if (searchAgainAt != null) result.searchAgainAt = searchAgainAt;
    return result;
  }

  MentorCheckFrequencyControl._();

  factory MentorCheckFrequencyControl.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorCheckFrequencyControl.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorCheckFrequencyControl',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'searchAgainAt', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorCheckFrequencyControl clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorCheckFrequencyControl copyWith(
          void Function(MentorCheckFrequencyControl) updates) =>
      super.copyWith(
              (message) => updates(message as MentorCheckFrequencyControl))
          as MentorCheckFrequencyControl;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorCheckFrequencyControl create() =>
      MentorCheckFrequencyControl._();
  @$core.override
  MentorCheckFrequencyControl createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorCheckFrequencyControl getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorCheckFrequencyControl>(create);
  static MentorCheckFrequencyControl? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get searchAgainAt => $_getI64(0);
  @$pb.TagNumber(1)
  set searchAgainAt($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSearchAgainAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearSearchAgainAt() => $_clearField(1);
}

class MentorCheckAlreadyAssigned extends $pb.GeneratedMessage {
  factory MentorCheckAlreadyAssigned({
    $fixnum.Int64? gsId,
  }) {
    final result = create();
    if (gsId != null) result.gsId = gsId;
    return result;
  }

  MentorCheckAlreadyAssigned._();

  factory MentorCheckAlreadyAssigned.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorCheckAlreadyAssigned.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorCheckAlreadyAssigned',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'gsId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorCheckAlreadyAssigned clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorCheckAlreadyAssigned copyWith(
          void Function(MentorCheckAlreadyAssigned) updates) =>
      super.copyWith(
              (message) => updates(message as MentorCheckAlreadyAssigned))
          as MentorCheckAlreadyAssigned;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorCheckAlreadyAssigned create() => MentorCheckAlreadyAssigned._();
  @$core.override
  MentorCheckAlreadyAssigned createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorCheckAlreadyAssigned getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorCheckAlreadyAssigned>(create);
  static MentorCheckAlreadyAssigned? _defaultInstance;

  /// 陪伴师uid
  @$pb.TagNumber(1)
  $fixnum.Int64 get gsId => $_getI64(0);
  @$pb.TagNumber(1)
  set gsId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsId() => $_clearField(1);
}

class MentorCustomerRsp extends $pb.GeneratedMessage {
  factory MentorCustomerRsp({
    $core.Iterable<MentorCustomer>? customer,
  }) {
    final result = create();
    if (customer != null) result.customer.addAll(customer);
    return result;
  }

  MentorCustomerRsp._();

  factory MentorCustomerRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorCustomerRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorCustomerRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..pPM<MentorCustomer>(3, _omitFieldNames ? '' : 'customer',
        subBuilder: MentorCustomer.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorCustomerRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorCustomerRsp copyWith(void Function(MentorCustomerRsp) updates) =>
      super.copyWith((message) => updates(message as MentorCustomerRsp))
          as MentorCustomerRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorCustomerRsp create() => MentorCustomerRsp._();
  @$core.override
  MentorCustomerRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorCustomerRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorCustomerRsp>(create);
  static MentorCustomerRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $pb.PbList<MentorCustomer> get customer => $_getList(0);
}

class MentorCustomer extends $pb.GeneratedMessage {
  factory MentorCustomer({
    $fixnum.Int64? uid,
    $core.int? affinity,
    $core.bool? questRideDone,
    $core.bool? questPartyDone,
    $core.bool? questAffinityDone,
    $core.bool? questPurchaseGuideDone,
    $fixnum.Int64? assignTimestamp,
    $core.bool? questLaunched,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (affinity != null) result.affinity = affinity;
    if (questRideDone != null) result.questRideDone = questRideDone;
    if (questPartyDone != null) result.questPartyDone = questPartyDone;
    if (questAffinityDone != null) result.questAffinityDone = questAffinityDone;
    if (questPurchaseGuideDone != null)
      result.questPurchaseGuideDone = questPurchaseGuideDone;
    if (assignTimestamp != null) result.assignTimestamp = assignTimestamp;
    if (questLaunched != null) result.questLaunched = questLaunched;
    return result;
  }

  MentorCustomer._();

  factory MentorCustomer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorCustomer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorCustomer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(2, _omitFieldNames ? '' : 'affinity', fieldType: $pb.PbFieldType.OU3)
    ..aOB(3, _omitFieldNames ? '' : 'questRideDone')
    ..aOB(4, _omitFieldNames ? '' : 'questPartyDone')
    ..aOB(5, _omitFieldNames ? '' : 'questAffinityDone')
    ..aOB(6, _omitFieldNames ? '' : 'questPurchaseGuideDone')
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'assignTimestamp', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(8, _omitFieldNames ? '' : 'questLaunched')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorCustomer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorCustomer copyWith(void Function(MentorCustomer) updates) =>
      super.copyWith((message) => updates(message as MentorCustomer))
          as MentorCustomer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorCustomer create() => MentorCustomer._();
  @$core.override
  MentorCustomer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorCustomer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorCustomer>(create);
  static MentorCustomer? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get affinity => $_getIZ(1);
  @$pb.TagNumber(2)
  set affinity($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAffinity() => $_has(1);
  @$pb.TagNumber(2)
  void clearAffinity() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get questRideDone => $_getBF(2);
  @$pb.TagNumber(3)
  set questRideDone($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasQuestRideDone() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuestRideDone() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get questPartyDone => $_getBF(3);
  @$pb.TagNumber(4)
  set questPartyDone($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuestPartyDone() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuestPartyDone() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get questAffinityDone => $_getBF(4);
  @$pb.TagNumber(5)
  set questAffinityDone($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasQuestAffinityDone() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuestAffinityDone() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get questPurchaseGuideDone => $_getBF(5);
  @$pb.TagNumber(6)
  set questPurchaseGuideDone($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasQuestPurchaseGuideDone() => $_has(5);
  @$pb.TagNumber(6)
  void clearQuestPurchaseGuideDone() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get assignTimestamp => $_getI64(6);
  @$pb.TagNumber(7)
  set assignTimestamp($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAssignTimestamp() => $_has(6);
  @$pb.TagNumber(7)
  void clearAssignTimestamp() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get questLaunched => $_getBF(7);
  @$pb.TagNumber(8)
  set questLaunched($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasQuestLaunched() => $_has(7);
  @$pb.TagNumber(8)
  void clearQuestLaunched() => $_clearField(8);
}

class GetMentorRsp extends $pb.GeneratedMessage {
  factory GetMentorRsp({
    $fixnum.Int64? mentor,
  }) {
    final result = create();
    if (mentor != null) result.mentor = mentor;
    return result;
  }

  GetMentorRsp._();

  factory GetMentorRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMentorRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMentorRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'mentor', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMentorRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMentorRsp copyWith(void Function(GetMentorRsp) updates) =>
      super.copyWith((message) => updates(message as GetMentorRsp))
          as GetMentorRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMentorRsp create() => GetMentorRsp._();
  @$core.override
  GetMentorRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMentorRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMentorRsp>(create);
  static GetMentorRsp? _defaultInstance;

  @$pb.TagNumber(3)
  $fixnum.Int64 get mentor => $_getI64(0);
  @$pb.TagNumber(3)
  set mentor($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(3)
  $core.bool hasMentor() => $_has(0);
  @$pb.TagNumber(3)
  void clearMentor() => $_clearField(3);
}

class MentorPickReq extends $pb.GeneratedMessage {
  factory MentorPickReq({
    $fixnum.Int64? gsId,
  }) {
    final result = create();
    if (gsId != null) result.gsId = gsId;
    return result;
  }

  MentorPickReq._();

  factory MentorPickReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorPickReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorPickReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'gsId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorPickReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorPickReq copyWith(void Function(MentorPickReq) updates) =>
      super.copyWith((message) => updates(message as MentorPickReq))
          as MentorPickReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorPickReq create() => MentorPickReq._();
  @$core.override
  MentorPickReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorPickReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorPickReq>(create);
  static MentorPickReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get gsId => $_getI64(0);
  @$pb.TagNumber(1)
  set gsId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsId() => $_clearField(1);
}

class MentorPickRsp extends $pb.GeneratedMessage {
  factory MentorPickRsp() => create();

  MentorPickRsp._();

  factory MentorPickRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorPickRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorPickRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorPickRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorPickRsp copyWith(void Function(MentorPickRsp) updates) =>
      super.copyWith((message) => updates(message as MentorPickRsp))
          as MentorPickRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorPickRsp create() => MentorPickRsp._();
  @$core.override
  MentorPickRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorPickRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorPickRsp>(create);
  static MentorPickRsp? _defaultInstance;
}

class PartyLaunchReq extends $pb.GeneratedMessage {
  factory PartyLaunchReq({
    $fixnum.Int64? userId,
    $core.int? gsCount,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (gsCount != null) result.gsCount = gsCount;
    return result;
  }

  PartyLaunchReq._();

  factory PartyLaunchReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PartyLaunchReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PartyLaunchReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(2, _omitFieldNames ? '' : 'gsCount', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyLaunchReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyLaunchReq copyWith(void Function(PartyLaunchReq) updates) =>
      super.copyWith((message) => updates(message as PartyLaunchReq))
          as PartyLaunchReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PartyLaunchReq create() => PartyLaunchReq._();
  @$core.override
  PartyLaunchReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PartyLaunchReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyLaunchReq>(create);
  static PartyLaunchReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get gsCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set gsCount($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGsCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearGsCount() => $_clearField(2);
}

class PartyLaunchRsp extends $pb.GeneratedMessage {
  factory PartyLaunchRsp({
    $core.bool? success,
    $core.String? message,
    $core.int? durationSec,
    $core.String? endAt,
    $core.Iterable<$fixnum.Int64>? gsId,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (durationSec != null) result.durationSec = durationSec;
    if (endAt != null) result.endAt = endAt;
    if (gsId != null) result.gsId.addAll(gsId);
    return result;
  }

  PartyLaunchRsp._();

  factory PartyLaunchRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PartyLaunchRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PartyLaunchRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aI(3, _omitFieldNames ? '' : 'durationSec',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'endAt')
    ..p<$fixnum.Int64>(5, _omitFieldNames ? '' : 'gsId', $pb.PbFieldType.KU6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyLaunchRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyLaunchRsp copyWith(void Function(PartyLaunchRsp) updates) =>
      super.copyWith((message) => updates(message as PartyLaunchRsp))
          as PartyLaunchRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PartyLaunchRsp create() => PartyLaunchRsp._();
  @$core.override
  PartyLaunchRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PartyLaunchRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyLaunchRsp>(create);
  static PartyLaunchRsp? _defaultInstance;

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

  /// 持续时间
  @$pb.TagNumber(3)
  $core.int get durationSec => $_getIZ(2);
  @$pb.TagNumber(3)
  set durationSec($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDurationSec() => $_has(2);
  @$pb.TagNumber(3)
  void clearDurationSec() => $_clearField(3);

  /// 结束时间 rfc3339
  @$pb.TagNumber(4)
  $core.String get endAt => $_getSZ(3);
  @$pb.TagNumber(4)
  set endAt($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEndAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndAt() => $_clearField(4);

  /// 正在呼叫的gs列表
  @$pb.TagNumber(5)
  $pb.PbList<$fixnum.Int64> get gsId => $_getList(4);
}

class PartyAcceptReq extends $pb.GeneratedMessage {
  factory PartyAcceptReq({
    $fixnum.Int64? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  PartyAcceptReq._();

  factory PartyAcceptReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PartyAcceptReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PartyAcceptReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyAcceptReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyAcceptReq copyWith(void Function(PartyAcceptReq) updates) =>
      super.copyWith((message) => updates(message as PartyAcceptReq))
          as PartyAcceptReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PartyAcceptReq create() => PartyAcceptReq._();
  @$core.override
  PartyAcceptReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PartyAcceptReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyAcceptReq>(create);
  static PartyAcceptReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class PartyAcceptRsp extends $pb.GeneratedMessage {
  factory PartyAcceptRsp({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  PartyAcceptRsp._();

  factory PartyAcceptRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PartyAcceptRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PartyAcceptRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyAcceptRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyAcceptRsp copyWith(void Function(PartyAcceptRsp) updates) =>
      super.copyWith((message) => updates(message as PartyAcceptRsp))
          as PartyAcceptRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PartyAcceptRsp create() => PartyAcceptRsp._();
  @$core.override
  PartyAcceptRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PartyAcceptRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyAcceptRsp>(create);
  static PartyAcceptRsp? _defaultInstance;

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
}

class PartyStartReq extends $pb.GeneratedMessage {
  factory PartyStartReq({
    $fixnum.Int64? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  PartyStartReq._();

  factory PartyStartReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PartyStartReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PartyStartReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyStartReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyStartReq copyWith(void Function(PartyStartReq) updates) =>
      super.copyWith((message) => updates(message as PartyStartReq))
          as PartyStartReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PartyStartReq create() => PartyStartReq._();
  @$core.override
  PartyStartReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PartyStartReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyStartReq>(create);
  static PartyStartReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class PartyStartRsp extends $pb.GeneratedMessage {
  factory PartyStartRsp({
    $core.bool? success,
    $core.String? message,
    $fixnum.Int64? channel,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    if (channel != null) result.channel = channel;
    return result;
  }

  PartyStartRsp._();

  factory PartyStartRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PartyStartRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PartyStartRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'channel', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyStartRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyStartRsp copyWith(void Function(PartyStartRsp) updates) =>
      super.copyWith((message) => updates(message as PartyStartRsp))
          as PartyStartRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PartyStartRsp create() => PartyStartRsp._();
  @$core.override
  PartyStartRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PartyStartRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyStartRsp>(create);
  static PartyStartRsp? _defaultInstance;

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
  $fixnum.Int64 get channel => $_getI64(2);
  @$pb.TagNumber(3)
  set channel($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChannel() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannel() => $_clearField(3);
}

enum MentorPush_Message {
  bidStart,
  found,
  order,
  pickResult,
  orderDone,
  partyInvitation,
  partyStart,
  partyReady,
  partyAccept,
  notSet
}

class MentorPush extends $pb.GeneratedMessage {
  factory MentorPush({
    MentorBidStart? bidStart,
    MentorFoundPush? found,
    MentorOrderPush? order,
    MentorPickResult? pickResult,
    MentorOrderDonePush? orderDone,
    PartyInvitation? partyInvitation,
    PartyStart? partyStart,
    PartyReady? partyReady,
    PartyAccept? partyAccept,
  }) {
    final result = create();
    if (bidStart != null) result.bidStart = bidStart;
    if (found != null) result.found = found;
    if (order != null) result.order = order;
    if (pickResult != null) result.pickResult = pickResult;
    if (orderDone != null) result.orderDone = orderDone;
    if (partyInvitation != null) result.partyInvitation = partyInvitation;
    if (partyStart != null) result.partyStart = partyStart;
    if (partyReady != null) result.partyReady = partyReady;
    if (partyAccept != null) result.partyAccept = partyAccept;
    return result;
  }

  MentorPush._();

  factory MentorPush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorPush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, MentorPush_Message>
      _MentorPush_MessageByTag = {
    1: MentorPush_Message.bidStart,
    2: MentorPush_Message.found,
    3: MentorPush_Message.order,
    5: MentorPush_Message.pickResult,
    6: MentorPush_Message.orderDone,
    7: MentorPush_Message.partyInvitation,
    8: MentorPush_Message.partyStart,
    9: MentorPush_Message.partyReady,
    10: MentorPush_Message.partyAccept,
    0: MentorPush_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorPush',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 5, 6, 7, 8, 9, 10])
    ..aOM<MentorBidStart>(1, _omitFieldNames ? '' : 'bidStart',
        subBuilder: MentorBidStart.create)
    ..aOM<MentorFoundPush>(2, _omitFieldNames ? '' : 'found',
        subBuilder: MentorFoundPush.create)
    ..aOM<MentorOrderPush>(3, _omitFieldNames ? '' : 'order',
        subBuilder: MentorOrderPush.create)
    ..aOM<MentorPickResult>(5, _omitFieldNames ? '' : 'pickResult',
        subBuilder: MentorPickResult.create)
    ..aOM<MentorOrderDonePush>(6, _omitFieldNames ? '' : 'orderDone',
        subBuilder: MentorOrderDonePush.create)
    ..aOM<PartyInvitation>(7, _omitFieldNames ? '' : 'partyInvitation',
        subBuilder: PartyInvitation.create)
    ..aOM<PartyStart>(8, _omitFieldNames ? '' : 'partyStart',
        subBuilder: PartyStart.create)
    ..aOM<PartyReady>(9, _omitFieldNames ? '' : 'partyReady',
        subBuilder: PartyReady.create)
    ..aOM<PartyAccept>(10, _omitFieldNames ? '' : 'partyAccept',
        subBuilder: PartyAccept.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorPush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorPush copyWith(void Function(MentorPush) updates) =>
      super.copyWith((message) => updates(message as MentorPush)) as MentorPush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorPush create() => MentorPush._();
  @$core.override
  MentorPush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorPush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorPush>(create);
  static MentorPush? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  MentorPush_Message whichMessage() =>
      _MentorPush_MessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  @$pb.TagNumber(10)
  void clearMessage() => $_clearField($_whichOneof(0));

  /// to user
  @$pb.TagNumber(1)
  MentorBidStart get bidStart => $_getN(0);
  @$pb.TagNumber(1)
  set bidStart(MentorBidStart value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBidStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearBidStart() => $_clearField(1);
  @$pb.TagNumber(1)
  MentorBidStart ensureBidStart() => $_ensure(0);

  @$pb.TagNumber(2)
  MentorFoundPush get found => $_getN(1);
  @$pb.TagNumber(2)
  set found(MentorFoundPush value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasFound() => $_has(1);
  @$pb.TagNumber(2)
  void clearFound() => $_clearField(2);
  @$pb.TagNumber(2)
  MentorFoundPush ensureFound() => $_ensure(1);

  /// to gs
  @$pb.TagNumber(3)
  MentorOrderPush get order => $_getN(2);
  @$pb.TagNumber(3)
  set order(MentorOrderPush value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasOrder() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrder() => $_clearField(3);
  @$pb.TagNumber(3)
  MentorOrderPush ensureOrder() => $_ensure(2);

  /// to both
  @$pb.TagNumber(5)
  MentorPickResult get pickResult => $_getN(3);
  @$pb.TagNumber(5)
  set pickResult(MentorPickResult value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPickResult() => $_has(3);
  @$pb.TagNumber(5)
  void clearPickResult() => $_clearField(5);
  @$pb.TagNumber(5)
  MentorPickResult ensurePickResult() => $_ensure(3);

  @$pb.TagNumber(6)
  MentorOrderDonePush get orderDone => $_getN(4);
  @$pb.TagNumber(6)
  set orderDone(MentorOrderDonePush value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasOrderDone() => $_has(4);
  @$pb.TagNumber(6)
  void clearOrderDone() => $_clearField(6);
  @$pb.TagNumber(6)
  MentorOrderDonePush ensureOrderDone() => $_ensure(4);

  /// party
  @$pb.TagNumber(7)
  PartyInvitation get partyInvitation => $_getN(5);
  @$pb.TagNumber(7)
  set partyInvitation(PartyInvitation value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasPartyInvitation() => $_has(5);
  @$pb.TagNumber(7)
  void clearPartyInvitation() => $_clearField(7);
  @$pb.TagNumber(7)
  PartyInvitation ensurePartyInvitation() => $_ensure(5);

  @$pb.TagNumber(8)
  PartyStart get partyStart => $_getN(6);
  @$pb.TagNumber(8)
  set partyStart(PartyStart value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasPartyStart() => $_has(6);
  @$pb.TagNumber(8)
  void clearPartyStart() => $_clearField(8);
  @$pb.TagNumber(8)
  PartyStart ensurePartyStart() => $_ensure(6);

  @$pb.TagNumber(9)
  PartyReady get partyReady => $_getN(7);
  @$pb.TagNumber(9)
  set partyReady(PartyReady value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasPartyReady() => $_has(7);
  @$pb.TagNumber(9)
  void clearPartyReady() => $_clearField(9);
  @$pb.TagNumber(9)
  PartyReady ensurePartyReady() => $_ensure(7);

  @$pb.TagNumber(10)
  PartyAccept get partyAccept => $_getN(8);
  @$pb.TagNumber(10)
  set partyAccept(PartyAccept value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasPartyAccept() => $_has(8);
  @$pb.TagNumber(10)
  void clearPartyAccept() => $_clearField(10);
  @$pb.TagNumber(10)
  PartyAccept ensurePartyAccept() => $_ensure(8);
}

/// 通知用户开始派单陪伴师
class MentorBidStart extends $pb.GeneratedMessage {
  factory MentorBidStart({
    $fixnum.Int64? endAt,
    $core.Iterable<$fixnum.Int64>? gsId,
  }) {
    final result = create();
    if (endAt != null) result.endAt = endAt;
    if (gsId != null) result.gsId.addAll(gsId);
    return result;
  }

  MentorBidStart._();

  factory MentorBidStart.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorBidStart.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorBidStart',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'endAt', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : 'gsId', $pb.PbFieldType.KU6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorBidStart clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorBidStart copyWith(void Function(MentorBidStart) updates) =>
      super.copyWith((message) => updates(message as MentorBidStart))
          as MentorBidStart;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorBidStart create() => MentorBidStart._();
  @$core.override
  MentorBidStart createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorBidStart getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorBidStart>(create);
  static MentorBidStart? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get endAt => $_getI64(0);
  @$pb.TagNumber(1)
  set endAt($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEndAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearEndAt() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$fixnum.Int64> get gsId => $_getList(1);
}

/// 通知用户有一位陪伴师选择接单
class MentorFoundPush extends $pb.GeneratedMessage {
  factory MentorFoundPush({
    $fixnum.Int64? gsId,
  }) {
    final result = create();
    if (gsId != null) result.gsId = gsId;
    return result;
  }

  MentorFoundPush._();

  factory MentorFoundPush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorFoundPush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorFoundPush',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'gsId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorFoundPush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorFoundPush copyWith(void Function(MentorFoundPush) updates) =>
      super.copyWith((message) => updates(message as MentorFoundPush))
          as MentorFoundPush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorFoundPush create() => MentorFoundPush._();
  @$core.override
  MentorFoundPush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorFoundPush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorFoundPush>(create);
  static MentorFoundPush? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get gsId => $_getI64(0);
  @$pb.TagNumber(1)
  set gsId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsId() => $_clearField(1);
}

/// 通知gs有陪伴师需求
class MentorOrderPush extends $pb.GeneratedMessage {
  factory MentorOrderPush({
    $fixnum.Int64? endAt,
    $fixnum.Int64? userId,
  }) {
    final result = create();
    if (endAt != null) result.endAt = endAt;
    if (userId != null) result.userId = userId;
    return result;
  }

  MentorOrderPush._();

  factory MentorOrderPush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorOrderPush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorOrderPush',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'endAt', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorOrderPush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorOrderPush copyWith(void Function(MentorOrderPush) updates) =>
      super.copyWith((message) => updates(message as MentorOrderPush))
          as MentorOrderPush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorOrderPush create() => MentorOrderPush._();
  @$core.override
  MentorOrderPush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorOrderPush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorOrderPush>(create);
  static MentorOrderPush? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get endAt => $_getI64(0);
  @$pb.TagNumber(1)
  set endAt($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEndAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearEndAt() => $_clearField(1);

  /// 需要陪伴师的用户id
  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);
}

/// 通知派单结束 超时或者人数已满都会触发
class MentorOrderDonePush extends $pb.GeneratedMessage {
  factory MentorOrderDonePush({
    $fixnum.Int64? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  MentorOrderDonePush._();

  factory MentorOrderDonePush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorOrderDonePush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorOrderDonePush',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorOrderDonePush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorOrderDonePush copyWith(void Function(MentorOrderDonePush) updates) =>
      super.copyWith((message) => updates(message as MentorOrderDonePush))
          as MentorOrderDonePush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorOrderDonePush create() => MentorOrderDonePush._();
  @$core.override
  MentorOrderDonePush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorOrderDonePush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorOrderDonePush>(create);
  static MentorOrderDonePush? _defaultInstance;

  /// 需要陪伴师的用户id
  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

/// 通知陪伴师选定结果
class MentorPickResult extends $pb.GeneratedMessage {
  factory MentorPickResult({
    $fixnum.Int64? userId,
    $fixnum.Int64? gsId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (gsId != null) result.gsId = gsId;
    return result;
  }

  MentorPickResult._();

  factory MentorPickResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentorPickResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentorPickResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'gsId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorPickResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentorPickResult copyWith(void Function(MentorPickResult) updates) =>
      super.copyWith((message) => updates(message as MentorPickResult))
          as MentorPickResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentorPickResult create() => MentorPickResult._();
  @$core.override
  MentorPickResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentorPickResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentorPickResult>(create);
  static MentorPickResult? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get gsId => $_getI64(1);
  @$pb.TagNumber(2)
  set gsId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGsId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGsId() => $_clearField(2);
}

/// party邀请
class PartyInvitation extends $pb.GeneratedMessage {
  factory PartyInvitation({
    $fixnum.Int64? userId,
    $fixnum.Int64? gsId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (gsId != null) result.gsId = gsId;
    return result;
  }

  PartyInvitation._();

  factory PartyInvitation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PartyInvitation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PartyInvitation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'gsId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyInvitation clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyInvitation copyWith(void Function(PartyInvitation) updates) =>
      super.copyWith((message) => updates(message as PartyInvitation))
          as PartyInvitation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PartyInvitation create() => PartyInvitation._();
  @$core.override
  PartyInvitation createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PartyInvitation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyInvitation>(create);
  static PartyInvitation? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get gsId => $_getI64(1);
  @$pb.TagNumber(2)
  set gsId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGsId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGsId() => $_clearField(2);
}

/// 发送给车主表示邀请进入已经准备好的party
class PartyAccept extends $pb.GeneratedMessage {
  factory PartyAccept({
    $fixnum.Int64? userId,
    $fixnum.Int64? gsId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (gsId != null) result.gsId = gsId;
    return result;
  }

  PartyAccept._();

  factory PartyAccept.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PartyAccept.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PartyAccept',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'gsId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyAccept clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyAccept copyWith(void Function(PartyAccept) updates) =>
      super.copyWith((message) => updates(message as PartyAccept))
          as PartyAccept;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PartyAccept create() => PartyAccept._();
  @$core.override
  PartyAccept createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PartyAccept getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyAccept>(create);
  static PartyAccept? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get gsId => $_getI64(1);
  @$pb.TagNumber(2)
  set gsId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGsId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGsId() => $_clearField(2);
}

/// party开始
class PartyStart extends $pb.GeneratedMessage {
  factory PartyStart({
    $fixnum.Int64? userId,
    $fixnum.Int64? gsId,
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (gsId != null) result.gsId = gsId;
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  PartyStart._();

  factory PartyStart.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PartyStart.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PartyStart',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'gsId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyStart clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyStart copyWith(void Function(PartyStart) updates) =>
      super.copyWith((message) => updates(message as PartyStart)) as PartyStart;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PartyStart create() => PartyStart._();
  @$core.override
  PartyStart createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PartyStart getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyStart>(create);
  static PartyStart? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get gsId => $_getI64(1);
  @$pb.TagNumber(2)
  set gsId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGsId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGsId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get channelId => $_getI64(2);
  @$pb.TagNumber(3)
  set channelId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChannelId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChannelId() => $_clearField(3);
}

/// 发送给车主表示邀请进入已经准备好的party
class PartyReady extends $pb.GeneratedMessage {
  factory PartyReady({
    $fixnum.Int64? channelId,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    return result;
  }

  PartyReady._();

  factory PartyReady.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PartyReady.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PartyReady',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        3, _omitFieldNames ? '' : 'channelId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyReady clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PartyReady copyWith(void Function(PartyReady) updates) =>
      super.copyWith((message) => updates(message as PartyReady)) as PartyReady;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PartyReady create() => PartyReady._();
  @$core.override
  PartyReady createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PartyReady getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyReady>(create);
  static PartyReady? _defaultInstance;

  @$pb.TagNumber(3)
  $fixnum.Int64 get channelId => $_getI64(0);
  @$pb.TagNumber(3)
  set channelId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(3)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(3)
  void clearChannelId() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

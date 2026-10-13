// This is a generated file - do not edit.
//
// Generated from server_client/mic_tool.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'mic_tool.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'mic_tool.pbenum.dart';

/// 请求参数
class MicCounterReq extends $pb.GeneratedMessage {
  factory MicCounterReq({
    OpType? opType,
    $core.int? durationSeconds,
    $core.int? opUid,
    $core.int? opRid,
  }) {
    final result = create();
    if (opType != null) result.opType = opType;
    if (durationSeconds != null) result.durationSeconds = durationSeconds;
    if (opUid != null) result.opUid = opUid;
    if (opRid != null) result.opRid = opRid;
    return result;
  }

  MicCounterReq._();

  factory MicCounterReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MicCounterReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MicCounterReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mic_tool'),
      createEmptyInstance: create)
    ..aE<OpType>(1, _omitFieldNames ? '' : 'opType', enumValues: OpType.values)
    ..aI(2, _omitFieldNames ? '' : 'durationSeconds',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'opUid', fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'opRid', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicCounterReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicCounterReq copyWith(void Function(MicCounterReq) updates) =>
      super.copyWith((message) => updates(message as MicCounterReq))
          as MicCounterReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MicCounterReq create() => MicCounterReq._();
  @$core.override
  MicCounterReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MicCounterReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MicCounterReq>(create);
  static MicCounterReq? _defaultInstance;

  @$pb.TagNumber(1)
  OpType get opType => $_getN(0);
  @$pb.TagNumber(1)
  set opType(OpType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOpType() => $_has(0);
  @$pb.TagNumber(1)
  void clearOpType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get durationSeconds => $_getIZ(1);
  @$pb.TagNumber(2)
  set durationSeconds($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDurationSeconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearDurationSeconds() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get opUid => $_getIZ(2);
  @$pb.TagNumber(3)
  set opUid($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOpUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearOpUid() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get opRid => $_getIZ(3);
  @$pb.TagNumber(4)
  set opRid($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOpRid() => $_has(3);
  @$pb.TagNumber(4)
  void clearOpRid() => $_clearField(4);
}

class MicScoreClearReq extends $pb.GeneratedMessage {
  factory MicScoreClearReq({
    $fixnum.Int64? rid,
    $fixnum.Int64? uid,
  }) {
    final result = create();
    if (rid != null) result.rid = rid;
    if (uid != null) result.uid = uid;
    return result;
  }

  MicScoreClearReq._();

  factory MicScoreClearReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MicScoreClearReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MicScoreClearReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mic_tool'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'rid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicScoreClearReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicScoreClearReq copyWith(void Function(MicScoreClearReq) updates) =>
      super.copyWith((message) => updates(message as MicScoreClearReq))
          as MicScoreClearReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MicScoreClearReq create() => MicScoreClearReq._();
  @$core.override
  MicScoreClearReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MicScoreClearReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MicScoreClearReq>(create);
  static MicScoreClearReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get rid => $_getI64(0);
  @$pb.TagNumber(1)
  set rid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);
}

class MicImgShowReq extends $pb.GeneratedMessage {
  factory MicImgShowReq({
    $fixnum.Int64? rid,
    $fixnum.Int64? uid,
    $core.int? type,
    $core.String? url,
  }) {
    final result = create();
    if (rid != null) result.rid = rid;
    if (uid != null) result.uid = uid;
    if (type != null) result.type = type;
    if (url != null) result.url = url;
    return result;
  }

  MicImgShowReq._();

  factory MicImgShowReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MicImgShowReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MicImgShowReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'mic_tool'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'rid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(3, _omitFieldNames ? '' : 'type', fieldType: $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicImgShowReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MicImgShowReq copyWith(void Function(MicImgShowReq) updates) =>
      super.copyWith((message) => updates(message as MicImgShowReq))
          as MicImgShowReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MicImgShowReq create() => MicImgShowReq._();
  @$core.override
  MicImgShowReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MicImgShowReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MicImgShowReq>(create);
  static MicImgShowReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get rid => $_getI64(0);
  @$pb.TagNumber(1)
  set rid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get uid => $_getI64(1);
  @$pb.TagNumber(2)
  set uid($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get type => $_getIZ(2);
  @$pb.TagNumber(3)
  set type($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

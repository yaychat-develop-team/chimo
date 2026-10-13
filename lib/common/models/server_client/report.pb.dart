// This is a generated file - do not edit.
//
// Generated from server_client/report.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'report.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'report.pbenum.dart';

class ReportReq extends $pb.GeneratedMessage {
  factory ReportReq({
    $fixnum.Int64? reporterId,
    $fixnum.Int64? reportedId,
    ReportType? type,
    $core.String? reason,
    $core.String? description,
    $core.Iterable<$core.String>? evidenceImages,
    $core.Iterable<$core.String>? evidenceVideos,
  }) {
    final result = create();
    if (reporterId != null) result.reporterId = reporterId;
    if (reportedId != null) result.reportedId = reportedId;
    if (type != null) result.type = type;
    if (reason != null) result.reason = reason;
    if (description != null) result.description = description;
    if (evidenceImages != null) result.evidenceImages.addAll(evidenceImages);
    if (evidenceVideos != null) result.evidenceVideos.addAll(evidenceVideos);
    return result;
  }

  ReportReq._();

  factory ReportReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReportReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReportReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'report'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'reporterId')
    ..aInt64(2, _omitFieldNames ? '' : 'reportedId')
    ..aE<ReportType>(3, _omitFieldNames ? '' : 'type',
        enumValues: ReportType.values)
    ..aOS(4, _omitFieldNames ? '' : 'reason')
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..pPS(6, _omitFieldNames ? '' : 'evidenceImages')
    ..pPS(7, _omitFieldNames ? '' : 'evidenceVideos')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportReq copyWith(void Function(ReportReq) updates) =>
      super.copyWith((message) => updates(message as ReportReq)) as ReportReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportReq create() => ReportReq._();
  @$core.override
  ReportReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReportReq getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReportReq>(create);
  static ReportReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get reporterId => $_getI64(0);
  @$pb.TagNumber(1)
  set reporterId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReporterId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReporterId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get reportedId => $_getI64(1);
  @$pb.TagNumber(2)
  set reportedId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReportedId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReportedId() => $_clearField(2);

  @$pb.TagNumber(3)
  ReportType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(ReportType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get reason => $_getSZ(3);
  @$pb.TagNumber(4)
  set reason($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReason() => $_has(3);
  @$pb.TagNumber(4)
  void clearReason() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get evidenceImages => $_getList(5);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get evidenceVideos => $_getList(6);
}

class ReportFeedbackReq extends $pb.GeneratedMessage {
  factory ReportFeedbackReq({
    $core.String? desc,
    $core.Iterable<$core.String>? evidenceImages,
    $core.Iterable<EvidenceVideos>? evidenceVideos,
  }) {
    final result = create();
    if (desc != null) result.desc = desc;
    if (evidenceImages != null) result.evidenceImages.addAll(evidenceImages);
    if (evidenceVideos != null) result.evidenceVideos.addAll(evidenceVideos);
    return result;
  }

  ReportFeedbackReq._();

  factory ReportFeedbackReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReportFeedbackReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReportFeedbackReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'report'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'desc')
    ..pPS(2, _omitFieldNames ? '' : 'evidenceImages')
    ..pPM<EvidenceVideos>(3, _omitFieldNames ? '' : 'evidenceVideos',
        subBuilder: EvidenceVideos.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportFeedbackReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportFeedbackReq copyWith(void Function(ReportFeedbackReq) updates) =>
      super.copyWith((message) => updates(message as ReportFeedbackReq))
          as ReportFeedbackReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportFeedbackReq create() => ReportFeedbackReq._();
  @$core.override
  ReportFeedbackReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReportFeedbackReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportFeedbackReq>(create);
  static ReportFeedbackReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get desc => $_getSZ(0);
  @$pb.TagNumber(1)
  set desc($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearDesc() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get evidenceImages => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<EvidenceVideos> get evidenceVideos => $_getList(2);
}

class EvidenceVideos extends $pb.GeneratedMessage {
  factory EvidenceVideos({
    $core.String? thumb,
    $core.String? url,
  }) {
    final result = create();
    if (thumb != null) result.thumb = thumb;
    if (url != null) result.url = url;
    return result;
  }

  EvidenceVideos._();

  factory EvidenceVideos.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EvidenceVideos.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EvidenceVideos',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'report'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'thumb')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EvidenceVideos clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EvidenceVideos copyWith(void Function(EvidenceVideos) updates) =>
      super.copyWith((message) => updates(message as EvidenceVideos))
          as EvidenceVideos;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EvidenceVideos create() => EvidenceVideos._();
  @$core.override
  EvidenceVideos createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EvidenceVideos getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EvidenceVideos>(create);
  static EvidenceVideos? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get thumb => $_getSZ(0);
  @$pb.TagNumber(1)
  set thumb($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasThumb() => $_has(0);
  @$pb.TagNumber(1)
  void clearThumb() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => $_clearField(2);
}

class LogUploadReq extends $pb.GeneratedMessage {
  factory LogUploadReq({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  LogUploadReq._();

  factory LogUploadReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LogUploadReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LogUploadReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'report'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LogUploadReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LogUploadReq copyWith(void Function(LogUploadReq) updates) =>
      super.copyWith((message) => updates(message as LogUploadReq))
          as LogUploadReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogUploadReq create() => LogUploadReq._();
  @$core.override
  LogUploadReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LogUploadReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LogUploadReq>(create);
  static LogUploadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

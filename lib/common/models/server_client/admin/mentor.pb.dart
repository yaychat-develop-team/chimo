// This is a generated file - do not edit.
//
// Generated from server_client/admin/mentor.proto.

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

class GetMentorReq extends $pb.GeneratedMessage {
  factory GetMentorReq({
    $fixnum.Int64? uid,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    return result;
  }

  GetMentorReq._();

  factory GetMentorReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMentorReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMentorReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminMentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMentorReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMentorReq copyWith(void Function(GetMentorReq) updates) =>
      super.copyWith((message) => updates(message as GetMentorReq))
          as GetMentorReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMentorReq create() => GetMentorReq._();
  @$core.override
  GetMentorReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMentorReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMentorReq>(create);
  static GetMentorReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);
}

class GetMentorRsp extends $pb.GeneratedMessage {
  factory GetMentorRsp({
    $fixnum.Int64? uid,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminMentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
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

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);
}

class ChangeMentorReq extends $pb.GeneratedMessage {
  factory ChangeMentorReq({
    $fixnum.Int64? uid,
    $fixnum.Int64? mentor,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (mentor != null) result.mentor = mentor;
    return result;
  }

  ChangeMentorReq._();

  factory ChangeMentorReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChangeMentorReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChangeMentorReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'adminMentor'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'uid', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'mentor', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangeMentorReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangeMentorReq copyWith(void Function(ChangeMentorReq) updates) =>
      super.copyWith((message) => updates(message as ChangeMentorReq))
          as ChangeMentorReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeMentorReq create() => ChangeMentorReq._();
  @$core.override
  ChangeMentorReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChangeMentorReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChangeMentorReq>(create);
  static ChangeMentorReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get mentor => $_getI64(1);
  @$pb.TagNumber(2)
  set mentor($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMentor() => $_has(1);
  @$pb.TagNumber(2)
  void clearMentor() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

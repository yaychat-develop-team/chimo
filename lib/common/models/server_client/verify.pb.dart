// This is a generated file - do not edit.
//
// Generated from server_client/verify.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class VerifyIdCardReq extends $pb.GeneratedMessage {
  factory VerifyIdCardReq({
    $core.String? name,
    $core.String? idCard,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (idCard != null) result.idCard = idCard;
    return result;
  }

  VerifyIdCardReq._();

  factory VerifyIdCardReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VerifyIdCardReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VerifyIdCardReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'idCard')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyIdCardReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyIdCardReq copyWith(void Function(VerifyIdCardReq) updates) =>
      super.copyWith((message) => updates(message as VerifyIdCardReq))
          as VerifyIdCardReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyIdCardReq create() => VerifyIdCardReq._();
  @$core.override
  VerifyIdCardReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VerifyIdCardReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VerifyIdCardReq>(create);
  static VerifyIdCardReq? _defaultInstance;

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

class VerifyIdCardResp extends $pb.GeneratedMessage {
  factory VerifyIdCardResp({
    $core.bool? ok,
  }) {
    final result = create();
    if (ok != null) result.ok = ok;
    return result;
  }

  VerifyIdCardResp._();

  factory VerifyIdCardResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VerifyIdCardResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VerifyIdCardResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'tacit'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'ok')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyIdCardResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyIdCardResp copyWith(void Function(VerifyIdCardResp) updates) =>
      super.copyWith((message) => updates(message as VerifyIdCardResp))
          as VerifyIdCardResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyIdCardResp create() => VerifyIdCardResp._();
  @$core.override
  VerifyIdCardResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VerifyIdCardResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VerifyIdCardResp>(create);
  static VerifyIdCardResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get ok => $_getBF(0);
  @$pb.TagNumber(1)
  set ok($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

// This is a generated file - do not edit.
//
// Generated from server_client/h5_util.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class UniqIdData extends $pb.GeneratedMessage {
  factory UniqIdData({
    $core.String? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  UniqIdData._();

  factory UniqIdData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UniqIdData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UniqIdData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'h5util'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UniqIdData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UniqIdData copyWith(void Function(UniqIdData) updates) =>
      super.copyWith((message) => updates(message as UniqIdData)) as UniqIdData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UniqIdData create() => UniqIdData._();
  @$core.override
  UniqIdData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UniqIdData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UniqIdData>(create);
  static UniqIdData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class BossRankData extends $pb.GeneratedMessage {
  factory BossRankData({
    $core.String? rank,
  }) {
    final result = create();
    if (rank != null) result.rank = rank;
    return result;
  }

  BossRankData._();

  factory BossRankData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BossRankData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BossRankData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'h5util'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'rank')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BossRankData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BossRankData copyWith(void Function(BossRankData) updates) =>
      super.copyWith((message) => updates(message as BossRankData))
          as BossRankData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BossRankData create() => BossRankData._();
  @$core.override
  BossRankData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BossRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BossRankData>(create);
  static BossRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rank => $_getSZ(0);
  @$pb.TagNumber(1)
  set rank($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRank() => $_has(0);
  @$pb.TagNumber(1)
  void clearRank() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

// This is a generated file - do not edit.
//
// Generated from server_client/cold.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ColdResp extends $pb.GeneratedMessage {
  factory ColdResp({
    $core.bool? coldStart,
  }) {
    final result = create();
    if (coldStart != null) result.coldStart = coldStart;
    return result;
  }

  ColdResp._();

  factory ColdResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ColdResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ColdResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cold'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'coldStart')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ColdResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ColdResp copyWith(void Function(ColdResp) updates) =>
      super.copyWith((message) => updates(message as ColdResp)) as ColdResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ColdResp create() => ColdResp._();
  @$core.override
  ColdResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ColdResp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ColdResp>(create);
  static ColdResp? _defaultInstance;

  /// *
  /// 是否是冷启动
  /// true = 是
  /// false = 不是
  @$pb.TagNumber(1)
  $core.bool get coldStart => $_getBF(0);
  @$pb.TagNumber(1)
  set coldStart($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasColdStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearColdStart() => $_clearField(1);
}

class ColdRoleSelectConfig extends $pb.GeneratedMessage {
  factory ColdRoleSelectConfig({
    $core.int? curOwner,
    $core.int? totalOwner,
    $core.int? curGs,
    $core.int? totalGs,
    $core.int? curSinger,
    $core.int? totalSinger,
  }) {
    final result = create();
    if (curOwner != null) result.curOwner = curOwner;
    if (totalOwner != null) result.totalOwner = totalOwner;
    if (curGs != null) result.curGs = curGs;
    if (totalGs != null) result.totalGs = totalGs;
    if (curSinger != null) result.curSinger = curSinger;
    if (totalSinger != null) result.totalSinger = totalSinger;
    return result;
  }

  ColdRoleSelectConfig._();

  factory ColdRoleSelectConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ColdRoleSelectConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ColdRoleSelectConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cold'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'curOwner')
    ..aI(2, _omitFieldNames ? '' : 'totalOwner')
    ..aI(5, _omitFieldNames ? '' : 'curGs')
    ..aI(6, _omitFieldNames ? '' : 'totalGs')
    ..aI(7, _omitFieldNames ? '' : 'curSinger')
    ..aI(8, _omitFieldNames ? '' : 'totalSinger')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ColdRoleSelectConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ColdRoleSelectConfig copyWith(void Function(ColdRoleSelectConfig) updates) =>
      super.copyWith((message) => updates(message as ColdRoleSelectConfig))
          as ColdRoleSelectConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ColdRoleSelectConfig create() => ColdRoleSelectConfig._();
  @$core.override
  ColdRoleSelectConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ColdRoleSelectConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ColdRoleSelectConfig>(create);
  static ColdRoleSelectConfig? _defaultInstance;

  /// *
  /// 当前车手
  @$pb.TagNumber(1)
  $core.int get curOwner => $_getIZ(0);
  @$pb.TagNumber(1)
  set curOwner($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCurOwner() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurOwner() => $_clearField(1);

  /// *
  /// 总需要车手
  @$pb.TagNumber(2)
  $core.int get totalOwner => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalOwner($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalOwner() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalOwner() => $_clearField(2);

  /// *
  /// 当前嘉宾
  @$pb.TagNumber(5)
  $core.int get curGs => $_getIZ(2);
  @$pb.TagNumber(5)
  set curGs($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(5)
  $core.bool hasCurGs() => $_has(2);
  @$pb.TagNumber(5)
  void clearCurGs() => $_clearField(5);

  /// *
  /// 总嘉宾
  @$pb.TagNumber(6)
  $core.int get totalGs => $_getIZ(3);
  @$pb.TagNumber(6)
  set totalGs($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(6)
  $core.bool hasTotalGs() => $_has(3);
  @$pb.TagNumber(6)
  void clearTotalGs() => $_clearField(6);

  /// *
  /// 当前歌手
  @$pb.TagNumber(7)
  $core.int get curSinger => $_getIZ(4);
  @$pb.TagNumber(7)
  set curSinger($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(7)
  $core.bool hasCurSinger() => $_has(4);
  @$pb.TagNumber(7)
  void clearCurSinger() => $_clearField(7);

  /// *
  /// 总歌手
  @$pb.TagNumber(8)
  $core.int get totalSinger => $_getIZ(5);
  @$pb.TagNumber(8)
  set totalSinger($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(8)
  $core.bool hasTotalSinger() => $_has(5);
  @$pb.TagNumber(8)
  void clearTotalSinger() => $_clearField(8);
}

class CountDownConfig extends $pb.GeneratedMessage {
  factory CountDownConfig({
    $core.String? managerUrl,
    $core.int? curOwner,
    $core.int? totalOwner,
    $core.int? curManGs,
    $core.int? totalManGs,
    $core.int? curGirlGs,
    $core.int? totalGirlGs,
    $core.int? curManSinger,
    $core.int? totalManSinger,
    $core.int? curGirlSinger,
    $core.int? totalGirlSinger,
  }) {
    final result = create();
    if (managerUrl != null) result.managerUrl = managerUrl;
    if (curOwner != null) result.curOwner = curOwner;
    if (totalOwner != null) result.totalOwner = totalOwner;
    if (curManGs != null) result.curManGs = curManGs;
    if (totalManGs != null) result.totalManGs = totalManGs;
    if (curGirlGs != null) result.curGirlGs = curGirlGs;
    if (totalGirlGs != null) result.totalGirlGs = totalGirlGs;
    if (curManSinger != null) result.curManSinger = curManSinger;
    if (totalManSinger != null) result.totalManSinger = totalManSinger;
    if (curGirlSinger != null) result.curGirlSinger = curGirlSinger;
    if (totalGirlSinger != null) result.totalGirlSinger = totalGirlSinger;
    return result;
  }

  CountDownConfig._();

  factory CountDownConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CountDownConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CountDownConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'cold'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'managerUrl')
    ..aI(2, _omitFieldNames ? '' : 'curOwner')
    ..aI(3, _omitFieldNames ? '' : 'totalOwner')
    ..aI(4, _omitFieldNames ? '' : 'curManGs')
    ..aI(5, _omitFieldNames ? '' : 'totalManGs')
    ..aI(6, _omitFieldNames ? '' : 'curGirlGs')
    ..aI(7, _omitFieldNames ? '' : 'totalGirlGs')
    ..aI(8, _omitFieldNames ? '' : 'curManSinger')
    ..aI(9, _omitFieldNames ? '' : 'totalManSinger')
    ..aI(10, _omitFieldNames ? '' : 'curGirlSinger')
    ..aI(11, _omitFieldNames ? '' : 'totalGirlSinger')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CountDownConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CountDownConfig copyWith(void Function(CountDownConfig) updates) =>
      super.copyWith((message) => updates(message as CountDownConfig))
          as CountDownConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CountDownConfig create() => CountDownConfig._();
  @$core.override
  CountDownConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CountDownConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CountDownConfig>(create);
  static CountDownConfig? _defaultInstance;

  /// *
  /// 微信url
  @$pb.TagNumber(1)
  $core.String get managerUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set managerUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasManagerUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearManagerUrl() => $_clearField(1);

  /// *
  /// 当前车手
  @$pb.TagNumber(2)
  $core.int get curOwner => $_getIZ(1);
  @$pb.TagNumber(2)
  set curOwner($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCurOwner() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurOwner() => $_clearField(2);

  /// *
  /// 总需要车手
  @$pb.TagNumber(3)
  $core.int get totalOwner => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalOwner($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalOwner() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalOwner() => $_clearField(3);

  /// *
  /// 当前男嘉宾
  @$pb.TagNumber(4)
  $core.int get curManGs => $_getIZ(3);
  @$pb.TagNumber(4)
  set curManGs($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCurManGs() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurManGs() => $_clearField(4);

  /// *
  /// 总男嘉宾
  @$pb.TagNumber(5)
  $core.int get totalManGs => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalManGs($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotalManGs() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalManGs() => $_clearField(5);

  /// *
  /// 当前女嘉宾
  @$pb.TagNumber(6)
  $core.int get curGirlGs => $_getIZ(5);
  @$pb.TagNumber(6)
  set curGirlGs($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCurGirlGs() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurGirlGs() => $_clearField(6);

  /// *
  /// 总女嘉宾
  @$pb.TagNumber(7)
  $core.int get totalGirlGs => $_getIZ(6);
  @$pb.TagNumber(7)
  set totalGirlGs($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTotalGirlGs() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalGirlGs() => $_clearField(7);

  /// *
  /// 当前男歌手
  @$pb.TagNumber(8)
  $core.int get curManSinger => $_getIZ(7);
  @$pb.TagNumber(8)
  set curManSinger($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCurManSinger() => $_has(7);
  @$pb.TagNumber(8)
  void clearCurManSinger() => $_clearField(8);

  /// *
  /// 总男歌手
  @$pb.TagNumber(9)
  $core.int get totalManSinger => $_getIZ(8);
  @$pb.TagNumber(9)
  set totalManSinger($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasTotalManSinger() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalManSinger() => $_clearField(9);

  /// *
  /// 当前女歌手
  @$pb.TagNumber(10)
  $core.int get curGirlSinger => $_getIZ(9);
  @$pb.TagNumber(10)
  set curGirlSinger($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCurGirlSinger() => $_has(9);
  @$pb.TagNumber(10)
  void clearCurGirlSinger() => $_clearField(10);

  /// *
  /// 总女歌手
  @$pb.TagNumber(11)
  $core.int get totalGirlSinger => $_getIZ(10);
  @$pb.TagNumber(11)
  set totalGirlSinger($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasTotalGirlSinger() => $_has(10);
  @$pb.TagNumber(11)
  void clearTotalGirlSinger() => $_clearField(11);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

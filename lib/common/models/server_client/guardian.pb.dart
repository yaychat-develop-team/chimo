// This is a generated file - do not edit.
//
// Generated from server_client/guardian.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 防护页信息
class GuardianInfoData extends $pb.GeneratedMessage {
  factory GuardianInfoData({
    $core.bool? switchStatus,
    $core.bool? isTop1,
    $core.int? blackListLimit,
    $core.Iterable<$0.User>? blackList,
  }) {
    final result = create();
    if (switchStatus != null) result.switchStatus = switchStatus;
    if (isTop1 != null) result.isTop1 = isTop1;
    if (blackListLimit != null) result.blackListLimit = blackListLimit;
    if (blackList != null) result.blackList.addAll(blackList);
    return result;
  }

  GuardianInfoData._();

  factory GuardianInfoData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GuardianInfoData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GuardianInfoData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'guardian'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'switchStatus')
    ..aOB(2, _omitFieldNames ? '' : 'isTop1')
    ..aI(3, _omitFieldNames ? '' : 'blackListLimit')
    ..pPM<$0.User>(4, _omitFieldNames ? '' : 'blackList',
        subBuilder: $0.User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GuardianInfoData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GuardianInfoData copyWith(void Function(GuardianInfoData) updates) =>
      super.copyWith((message) => updates(message as GuardianInfoData))
          as GuardianInfoData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GuardianInfoData create() => GuardianInfoData._();
  @$core.override
  GuardianInfoData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GuardianInfoData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuardianInfoData>(create);
  static GuardianInfoData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get switchStatus => $_getBF(0);
  @$pb.TagNumber(1)
  set switchStatus($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSwitchStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwitchStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isTop1 => $_getBF(1);
  @$pb.TagNumber(2)
  set isTop1($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsTop1() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsTop1() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get blackListLimit => $_getIZ(2);
  @$pb.TagNumber(3)
  set blackListLimit($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBlackListLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlackListLimit() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$0.User> get blackList => $_getList(3);
}

/// 开关切换请求
class GuardianSwitchReq extends $pb.GeneratedMessage {
  factory GuardianSwitchReq({
    $core.bool? open,
  }) {
    final result = create();
    if (open != null) result.open = open;
    return result;
  }

  GuardianSwitchReq._();

  factory GuardianSwitchReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GuardianSwitchReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GuardianSwitchReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'guardian'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'open')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GuardianSwitchReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GuardianSwitchReq copyWith(void Function(GuardianSwitchReq) updates) =>
      super.copyWith((message) => updates(message as GuardianSwitchReq))
          as GuardianSwitchReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GuardianSwitchReq create() => GuardianSwitchReq._();
  @$core.override
  GuardianSwitchReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GuardianSwitchReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuardianSwitchReq>(create);
  static GuardianSwitchReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get open => $_getBF(0);
  @$pb.TagNumber(1)
  set open($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOpen() => $_has(0);
  @$pb.TagNumber(1)
  void clearOpen() => $_clearField(1);
}

/// 黑名单添加/解除请求
class GuardianBlackListReq extends $pb.GeneratedMessage {
  factory GuardianBlackListReq({
    $fixnum.Int64? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  GuardianBlackListReq._();

  factory GuardianBlackListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GuardianBlackListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GuardianBlackListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'guardian'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GuardianBlackListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GuardianBlackListReq copyWith(void Function(GuardianBlackListReq) updates) =>
      super.copyWith((message) => updates(message as GuardianBlackListReq))
          as GuardianBlackListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GuardianBlackListReq create() => GuardianBlackListReq._();
  @$core.override
  GuardianBlackListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GuardianBlackListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuardianBlackListReq>(create);
  static GuardianBlackListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

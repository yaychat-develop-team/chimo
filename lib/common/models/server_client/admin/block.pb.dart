// This is a generated file - do not edit.
//
// Generated from server_client/admin/block.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../base.pb.dart' as $1;
import 'base.pb.dart' as $0;
import 'block.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'block.pbenum.dart';

enum BlockTypeDesc_SubType {
  loginSubType,
  cashSubType,
  interactiveSubType,
  notSet
}

class BlockTypeDesc extends $pb.GeneratedMessage {
  factory BlockTypeDesc({
    BlockMainType? mainType,
    BlockLoginSubType? loginSubType,
    BlockCashSubType? cashSubType,
    BlockInteractiveSubType? interactiveSubType,
  }) {
    final result = create();
    if (mainType != null) result.mainType = mainType;
    if (loginSubType != null) result.loginSubType = loginSubType;
    if (cashSubType != null) result.cashSubType = cashSubType;
    if (interactiveSubType != null)
      result.interactiveSubType = interactiveSubType;
    return result;
  }

  BlockTypeDesc._();

  factory BlockTypeDesc.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlockTypeDesc.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, BlockTypeDesc_SubType>
      _BlockTypeDesc_SubTypeByTag = {
    2: BlockTypeDesc_SubType.loginSubType,
    3: BlockTypeDesc_SubType.cashSubType,
    4: BlockTypeDesc_SubType.interactiveSubType,
    0: BlockTypeDesc_SubType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlockTypeDesc',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'block'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aE<BlockMainType>(1, _omitFieldNames ? '' : 'mainType',
        protoName: 'mainType', enumValues: BlockMainType.values)
    ..aE<BlockLoginSubType>(2, _omitFieldNames ? '' : 'loginSubType',
        protoName: 'loginSubType', enumValues: BlockLoginSubType.values)
    ..aE<BlockCashSubType>(3, _omitFieldNames ? '' : 'cashSubType',
        protoName: 'cashSubType', enumValues: BlockCashSubType.values)
    ..aE<BlockInteractiveSubType>(
        4, _omitFieldNames ? '' : 'interactiveSubType',
        protoName: 'interactiveSubType',
        enumValues: BlockInteractiveSubType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockTypeDesc clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockTypeDesc copyWith(void Function(BlockTypeDesc) updates) =>
      super.copyWith((message) => updates(message as BlockTypeDesc))
          as BlockTypeDesc;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockTypeDesc create() => BlockTypeDesc._();
  @$core.override
  BlockTypeDesc createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlockTypeDesc getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BlockTypeDesc>(create);
  static BlockTypeDesc? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  BlockTypeDesc_SubType whichSubType() =>
      _BlockTypeDesc_SubTypeByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearSubType() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  BlockMainType get mainType => $_getN(0);
  @$pb.TagNumber(1)
  set mainType(BlockMainType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMainType() => $_has(0);
  @$pb.TagNumber(1)
  void clearMainType() => $_clearField(1);

  @$pb.TagNumber(2)
  BlockLoginSubType get loginSubType => $_getN(1);
  @$pb.TagNumber(2)
  set loginSubType(BlockLoginSubType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLoginSubType() => $_has(1);
  @$pb.TagNumber(2)
  void clearLoginSubType() => $_clearField(2);

  @$pb.TagNumber(3)
  BlockCashSubType get cashSubType => $_getN(2);
  @$pb.TagNumber(3)
  set cashSubType(BlockCashSubType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCashSubType() => $_has(2);
  @$pb.TagNumber(3)
  void clearCashSubType() => $_clearField(3);

  @$pb.TagNumber(4)
  BlockInteractiveSubType get interactiveSubType => $_getN(3);
  @$pb.TagNumber(4)
  set interactiveSubType(BlockInteractiveSubType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasInteractiveSubType() => $_has(3);
  @$pb.TagNumber(4)
  void clearInteractiveSubType() => $_clearField(4);
}

/// *
/// POST /bapi/v1/block/operate
/// return BaseRsp
class AddBlockActionReq extends $pb.GeneratedMessage {
  factory AddBlockActionReq({
    BlockTypeDesc? desc,
    $fixnum.Int64? durationInHours,
    $core.String? remark,
    $fixnum.Int64? blockUser,
  }) {
    final result = create();
    if (desc != null) result.desc = desc;
    if (durationInHours != null) result.durationInHours = durationInHours;
    if (remark != null) result.remark = remark;
    if (blockUser != null) result.blockUser = blockUser;
    return result;
  }

  AddBlockActionReq._();

  factory AddBlockActionReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddBlockActionReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddBlockActionReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'block'),
      createEmptyInstance: create)
    ..aOM<BlockTypeDesc>(1, _omitFieldNames ? '' : 'desc',
        subBuilder: BlockTypeDesc.create)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'durationInHours', $pb.PbFieldType.OU6,
        protoName: 'durationInHours', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'remark')
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'blockUser', $pb.PbFieldType.OU6,
        protoName: 'blockUser', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddBlockActionReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddBlockActionReq copyWith(void Function(AddBlockActionReq) updates) =>
      super.copyWith((message) => updates(message as AddBlockActionReq))
          as AddBlockActionReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddBlockActionReq create() => AddBlockActionReq._();
  @$core.override
  AddBlockActionReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddBlockActionReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddBlockActionReq>(create);
  static AddBlockActionReq? _defaultInstance;

  @$pb.TagNumber(1)
  BlockTypeDesc get desc => $_getN(0);
  @$pb.TagNumber(1)
  set desc(BlockTypeDesc value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearDesc() => $_clearField(1);
  @$pb.TagNumber(1)
  BlockTypeDesc ensureDesc() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get durationInHours => $_getI64(1);
  @$pb.TagNumber(2)
  set durationInHours($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDurationInHours() => $_has(1);
  @$pb.TagNumber(2)
  void clearDurationInHours() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get remark => $_getSZ(2);
  @$pb.TagNumber(3)
  set remark($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRemark() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemark() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get blockUser => $_getI64(3);
  @$pb.TagNumber(4)
  set blockUser($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBlockUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearBlockUser() => $_clearField(4);
}

/// *
/// DELETE /bapi/v1/block/operate
/// return BaseRsp
class RemoveBlockActionReq extends $pb.GeneratedMessage {
  factory RemoveBlockActionReq({
    BlockTypeDesc? desc,
    $fixnum.Int64? blockUser,
    $core.String? remark,
  }) {
    final result = create();
    if (desc != null) result.desc = desc;
    if (blockUser != null) result.blockUser = blockUser;
    if (remark != null) result.remark = remark;
    return result;
  }

  RemoveBlockActionReq._();

  factory RemoveBlockActionReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveBlockActionReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveBlockActionReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'block'),
      createEmptyInstance: create)
    ..aOM<BlockTypeDesc>(1, _omitFieldNames ? '' : 'desc',
        subBuilder: BlockTypeDesc.create)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'blockUser', $pb.PbFieldType.OU6,
        protoName: 'blockUser', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : 'remark')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveBlockActionReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveBlockActionReq copyWith(void Function(RemoveBlockActionReq) updates) =>
      super.copyWith((message) => updates(message as RemoveBlockActionReq))
          as RemoveBlockActionReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveBlockActionReq create() => RemoveBlockActionReq._();
  @$core.override
  RemoveBlockActionReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemoveBlockActionReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveBlockActionReq>(create);
  static RemoveBlockActionReq? _defaultInstance;

  @$pb.TagNumber(1)
  BlockTypeDesc get desc => $_getN(0);
  @$pb.TagNumber(1)
  set desc(BlockTypeDesc value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearDesc() => $_clearField(1);
  @$pb.TagNumber(1)
  BlockTypeDesc ensureDesc() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get blockUser => $_getI64(1);
  @$pb.TagNumber(2)
  set blockUser($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBlockUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockUser() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get remark => $_getSZ(2);
  @$pb.TagNumber(3)
  set remark($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRemark() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemark() => $_clearField(3);
}

class BlockHistory extends $pb.GeneratedMessage {
  factory BlockHistory({
    BlockOperateType? operateType,
    $0.AdminUser? operator,
    BlockTypeDesc? desc,
    $fixnum.Int64? durationInHours,
    $core.String? remark,
    $fixnum.Int64? happenTime,
  }) {
    final result = create();
    if (operateType != null) result.operateType = operateType;
    if (operator != null) result.operator = operator;
    if (desc != null) result.desc = desc;
    if (durationInHours != null) result.durationInHours = durationInHours;
    if (remark != null) result.remark = remark;
    if (happenTime != null) result.happenTime = happenTime;
    return result;
  }

  BlockHistory._();

  factory BlockHistory.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlockHistory.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlockHistory',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'block'),
      createEmptyInstance: create)
    ..aE<BlockOperateType>(1, _omitFieldNames ? '' : 'operateType',
        protoName: 'operateType', enumValues: BlockOperateType.values)
    ..aOM<$0.AdminUser>(2, _omitFieldNames ? '' : 'operator',
        subBuilder: $0.AdminUser.create)
    ..aOM<BlockTypeDesc>(3, _omitFieldNames ? '' : 'desc',
        subBuilder: BlockTypeDesc.create)
    ..a<$fixnum.Int64>(
        4, _omitFieldNames ? '' : 'durationInHours', $pb.PbFieldType.OU6,
        protoName: 'durationInHours', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, _omitFieldNames ? '' : 'remark')
    ..aInt64(6, _omitFieldNames ? '' : 'happenTime', protoName: 'happenTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockHistory clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockHistory copyWith(void Function(BlockHistory) updates) =>
      super.copyWith((message) => updates(message as BlockHistory))
          as BlockHistory;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockHistory create() => BlockHistory._();
  @$core.override
  BlockHistory createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlockHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BlockHistory>(create);
  static BlockHistory? _defaultInstance;

  @$pb.TagNumber(1)
  BlockOperateType get operateType => $_getN(0);
  @$pb.TagNumber(1)
  set operateType(BlockOperateType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOperateType() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperateType() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.AdminUser get operator => $_getN(1);
  @$pb.TagNumber(2)
  set operator($0.AdminUser value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOperator() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperator() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.AdminUser ensureOperator() => $_ensure(1);

  @$pb.TagNumber(3)
  BlockTypeDesc get desc => $_getN(2);
  @$pb.TagNumber(3)
  set desc(BlockTypeDesc value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => $_clearField(3);
  @$pb.TagNumber(3)
  BlockTypeDesc ensureDesc() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get durationInHours => $_getI64(3);
  @$pb.TagNumber(4)
  set durationInHours($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDurationInHours() => $_has(3);
  @$pb.TagNumber(4)
  void clearDurationInHours() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get remark => $_getSZ(4);
  @$pb.TagNumber(5)
  set remark($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRemark() => $_has(4);
  @$pb.TagNumber(5)
  void clearRemark() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get happenTime => $_getI64(5);
  @$pb.TagNumber(6)
  set happenTime($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasHappenTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearHappenTime() => $_clearField(6);
}

class BlockHistoryRsp extends $pb.GeneratedMessage {
  factory BlockHistoryRsp({
    $1.Page? page,
    $core.Iterable<BlockHistory>? blockHistory,
  }) {
    final result = create();
    if (page != null) result.page = page;
    if (blockHistory != null) result.blockHistory.addAll(blockHistory);
    return result;
  }

  BlockHistoryRsp._();

  factory BlockHistoryRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlockHistoryRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlockHistoryRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'block'),
      createEmptyInstance: create)
    ..aOM<$1.Page>(1, _omitFieldNames ? '' : 'page', subBuilder: $1.Page.create)
    ..pPM<BlockHistory>(2, _omitFieldNames ? '' : 'blockHistory',
        protoName: 'blockHistory', subBuilder: BlockHistory.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockHistoryRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockHistoryRsp copyWith(void Function(BlockHistoryRsp) updates) =>
      super.copyWith((message) => updates(message as BlockHistoryRsp))
          as BlockHistoryRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockHistoryRsp create() => BlockHistoryRsp._();
  @$core.override
  BlockHistoryRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlockHistoryRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BlockHistoryRsp>(create);
  static BlockHistoryRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Page get page => $_getN(0);
  @$pb.TagNumber(1)
  set page($1.Page value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Page ensurePage() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<BlockHistory> get blockHistory => $_getList(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

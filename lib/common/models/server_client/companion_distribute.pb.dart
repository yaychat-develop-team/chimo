// This is a generated file - do not edit.
//
// Generated from server_client/companion_distribute.proto.

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

/// *
/// 陪伴师-派对派单
///
/// ========================================================================
/// 流程
/// 1.陪伴师在我的车手页面 or 兜风房内调用【发布派单】
/// 2.陪伴师轮训调用【陪伴师拉取派单info】实时更新UI
/// 3.GS收到【CompanionDistributePush -> CompanionGSMessage】事件推送
/// 4.GS接受或者拒绝都调用【gs抢单】
/// 5.陪伴师【开启派对】
/// 6.GS收到【CompanionDistributePush -> CompanionStartPartMessage】事件推送，然后直接跳转房间
/// 7?.陪伴师邀请车主进入房间调用【邀请车主进房】(这个操作可以没有) 车主收到【CompanionDistributePush -> CompanionInvitationVehicleMessage】
/// 8.车主同意后进入房间并且上麦后调用【车主进房后上麦(只进房不上麦不用调用)】
/// 9.车离开房间后调用【车主离开房间】
/// 10.进入兜风房 调用【异常退出后检测当前已存在的派单用于恢复派单信息】恢复派单
/// ========================================================================
///
///
///   所有接口均以 /api/v1/distribute/companion" 开头
///
///  post /launch
/// body LaunchPartDistributeReq
/// return LaunchPartDistributeResp
/// 发布派单
///
///  post /pull
/// body PullPartDistributeReq
/// return PullPartDistributeResp
/// 陪伴师拉取派单info
///
///  post /grabbing
/// body GsGrabbingReq
/// return BaseResp
/// gs抢单
///
///  get /check
/// return CheckPartDistributeResp
/// 异常退出后检测当前已存在的派单用于恢复派单信息
///
///  post /start
/// body StartPartDistributeReq
/// return StartPartDistributeResp
/// 开启派对
///
///  post /vehicle-room-wheat
/// body CompanionVehicleRoomWheatReq
/// return BaseResp
/// 车主进房后上麦(只进房不上麦不用调用)
///
///  post /close-room
/// body CompanionCloseRoomReq
/// return BaseResp
/// 关房
///
///  post /vehicle-leave-room
/// body CompanionVehicleLeaveRoomReq
/// return BaseResp
/// 车主离开房间
///
///  post /invitation-vehicle
/// body CompanionInvitationVehicleReq
/// return BaseResp
/// 邀请车主进房
///
///  get /in-room?id={distribute_id}
/// return BaseResp
/// 有人进房不管是谁(车主 or 陪伴师)
///
///  相关推送
/// im type: 'CompanionDistributePush'
/// proto type: CompanionDistributePush
class LaunchPartDistributeReq extends $pb.GeneratedMessage {
  factory LaunchPartDistributeReq({
    $core.Iterable<$core.String>? typeCodes,
    $core.Iterable<$core.String>? skillCodes,
    $core.int? cnt,
    $fixnum.Int64? vehicleUid,
    $core.int? scene,
  }) {
    final result = create();
    if (typeCodes != null) result.typeCodes.addAll(typeCodes);
    if (skillCodes != null) result.skillCodes.addAll(skillCodes);
    if (cnt != null) result.cnt = cnt;
    if (vehicleUid != null) result.vehicleUid = vehicleUid;
    if (scene != null) result.scene = scene;
    return result;
  }

  LaunchPartDistributeReq._();

  factory LaunchPartDistributeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LaunchPartDistributeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LaunchPartDistributeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'typeCodes')
    ..pPS(2, _omitFieldNames ? '' : 'skillCodes')
    ..aI(3, _omitFieldNames ? '' : 'cnt')
    ..aInt64(4, _omitFieldNames ? '' : 'vehicleUid')
    ..aI(5, _omitFieldNames ? '' : 'scene')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LaunchPartDistributeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LaunchPartDistributeReq copyWith(
          void Function(LaunchPartDistributeReq) updates) =>
      super.copyWith((message) => updates(message as LaunchPartDistributeReq))
          as LaunchPartDistributeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LaunchPartDistributeReq create() => LaunchPartDistributeReq._();
  @$core.override
  LaunchPartDistributeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LaunchPartDistributeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LaunchPartDistributeReq>(create);
  static LaunchPartDistributeReq? _defaultInstance;

  /// *
  /// 类型code
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get typeCodes => $_getList(0);

  /// *
  /// 技能code
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get skillCodes => $_getList(1);

  /// *
  /// 人数
  @$pb.TagNumber(3)
  $core.int get cnt => $_getIZ(2);
  @$pb.TagNumber(3)
  set cnt($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCnt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCnt() => $_clearField(3);

  /// *
  /// 车主id
  @$pb.TagNumber(4)
  $fixnum.Int64 get vehicleUid => $_getI64(3);
  @$pb.TagNumber(4)
  set vehicleUid($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVehicleUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearVehicleUid() => $_clearField(4);

  /// *
  /// 场景
  /// 1 = 我得车主列表通过任务按钮点击
  /// 2 = 兜风房内发起
  @$pb.TagNumber(5)
  $core.int get scene => $_getIZ(4);
  @$pb.TagNumber(5)
  set scene($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasScene() => $_has(4);
  @$pb.TagNumber(5)
  void clearScene() => $_clearField(5);
}

class LaunchPartDistributeResp extends $pb.GeneratedMessage {
  factory LaunchPartDistributeResp({
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  LaunchPartDistributeResp._();

  factory LaunchPartDistributeResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LaunchPartDistributeResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LaunchPartDistributeResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LaunchPartDistributeResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LaunchPartDistributeResp copyWith(
          void Function(LaunchPartDistributeResp) updates) =>
      super.copyWith((message) => updates(message as LaunchPartDistributeResp))
          as LaunchPartDistributeResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LaunchPartDistributeResp create() => LaunchPartDistributeResp._();
  @$core.override
  LaunchPartDistributeResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LaunchPartDistributeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LaunchPartDistributeResp>(create);
  static LaunchPartDistributeResp? _defaultInstance;

  /// *
  /// 派单id
  @$pb.TagNumber(1)
  $fixnum.Int64 get distributeId => $_getI64(0);
  @$pb.TagNumber(1)
  set distributeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDistributeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDistributeId() => $_clearField(1);
}

class PullPartDistributeReq extends $pb.GeneratedMessage {
  factory PullPartDistributeReq({
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  PullPartDistributeReq._();

  factory PullPartDistributeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PullPartDistributeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PullPartDistributeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PullPartDistributeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PullPartDistributeReq copyWith(
          void Function(PullPartDistributeReq) updates) =>
      super.copyWith((message) => updates(message as PullPartDistributeReq))
          as PullPartDistributeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PullPartDistributeReq create() => PullPartDistributeReq._();
  @$core.override
  PullPartDistributeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PullPartDistributeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PullPartDistributeReq>(create);
  static PullPartDistributeReq? _defaultInstance;

  /// *
  /// 派单id
  @$pb.TagNumber(1)
  $fixnum.Int64 get distributeId => $_getI64(0);
  @$pb.TagNumber(1)
  set distributeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDistributeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDistributeId() => $_clearField(1);
}

class PullPartDistributeResp extends $pb.GeneratedMessage {
  factory PullPartDistributeResp({
    $core.Iterable<$fixnum.Int64>? receiveId,
    $core.int? touchReach,
    $core.bool? timeout,
  }) {
    final result = create();
    if (receiveId != null) result.receiveId.addAll(receiveId);
    if (touchReach != null) result.touchReach = touchReach;
    if (timeout != null) result.timeout = timeout;
    return result;
  }

  PullPartDistributeResp._();

  factory PullPartDistributeResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PullPartDistributeResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PullPartDistributeResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'receiveId', $pb.PbFieldType.K6)
    ..aI(2, _omitFieldNames ? '' : 'touchReach')
    ..aOB(3, _omitFieldNames ? '' : 'timeout')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PullPartDistributeResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PullPartDistributeResp copyWith(
          void Function(PullPartDistributeResp) updates) =>
      super.copyWith((message) => updates(message as PullPartDistributeResp))
          as PullPartDistributeResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PullPartDistributeResp create() => PullPartDistributeResp._();
  @$core.override
  PullPartDistributeResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PullPartDistributeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PullPartDistributeResp>(create);
  static PullPartDistributeResp? _defaultInstance;

  /// *
  /// 接单嘉宾id
  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get receiveId => $_getList(0);

  /// *
  /// 触达人数
  @$pb.TagNumber(2)
  $core.int get touchReach => $_getIZ(1);
  @$pb.TagNumber(2)
  set touchReach($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTouchReach() => $_has(1);
  @$pb.TagNumber(2)
  void clearTouchReach() => $_clearField(2);

  /// *
  /// true = 超时 则不在pull
  /// 超时后【开启派对】会失败
  @$pb.TagNumber(3)
  $core.bool get timeout => $_getBF(2);
  @$pb.TagNumber(3)
  set timeout($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTimeout() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimeout() => $_clearField(3);
}

class GsGrabbingReq extends $pb.GeneratedMessage {
  factory GsGrabbingReq({
    $fixnum.Int64? distributeId,
    $core.bool? ok,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    if (ok != null) result.ok = ok;
    return result;
  }

  GsGrabbingReq._();

  factory GsGrabbingReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsGrabbingReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsGrabbingReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..aOB(2, _omitFieldNames ? '' : 'ok')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsGrabbingReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsGrabbingReq copyWith(void Function(GsGrabbingReq) updates) =>
      super.copyWith((message) => updates(message as GsGrabbingReq))
          as GsGrabbingReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsGrabbingReq create() => GsGrabbingReq._();
  @$core.override
  GsGrabbingReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsGrabbingReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsGrabbingReq>(create);
  static GsGrabbingReq? _defaultInstance;

  /// *
  /// 派单id
  @$pb.TagNumber(1)
  $fixnum.Int64 get distributeId => $_getI64(0);
  @$pb.TagNumber(1)
  set distributeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDistributeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDistributeId() => $_clearField(1);

  /// *
  /// ture 接受
  /// false 拒绝
  @$pb.TagNumber(2)
  $core.bool get ok => $_getBF(1);
  @$pb.TagNumber(2)
  set ok($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOk() => $_has(1);
  @$pb.TagNumber(2)
  void clearOk() => $_clearField(2);
}

class GsGrabbingResp extends $pb.GeneratedMessage {
  factory GsGrabbingResp({
    $core.bool? ok,
  }) {
    final result = create();
    if (ok != null) result.ok = ok;
    return result;
  }

  GsGrabbingResp._();

  factory GsGrabbingResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsGrabbingResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsGrabbingResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..aOB(2, _omitFieldNames ? '' : 'ok')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsGrabbingResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsGrabbingResp copyWith(void Function(GsGrabbingResp) updates) =>
      super.copyWith((message) => updates(message as GsGrabbingResp))
          as GsGrabbingResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsGrabbingResp create() => GsGrabbingResp._();
  @$core.override
  GsGrabbingResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsGrabbingResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsGrabbingResp>(create);
  static GsGrabbingResp? _defaultInstance;

  /// *
  /// ture 成功
  /// false 失败
  @$pb.TagNumber(2)
  $core.bool get ok => $_getBF(0);
  @$pb.TagNumber(2)
  set ok($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(2)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(2)
  void clearOk() => $_clearField(2);
}

enum CompanionDistributePush_Message {
  gsMessage,
  startPartMessage,
  invitationMessage,
  notSet
}

class CompanionDistributePush extends $pb.GeneratedMessage {
  factory CompanionDistributePush({
    CompanionGSMessage? gsMessage,
    CompanionStartPartMessage? startPartMessage,
    CompanionInvitationVehicleMessage? invitationMessage,
  }) {
    final result = create();
    if (gsMessage != null) result.gsMessage = gsMessage;
    if (startPartMessage != null) result.startPartMessage = startPartMessage;
    if (invitationMessage != null) result.invitationMessage = invitationMessage;
    return result;
  }

  CompanionDistributePush._();

  factory CompanionDistributePush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionDistributePush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, CompanionDistributePush_Message>
      _CompanionDistributePush_MessageByTag = {
    1: CompanionDistributePush_Message.gsMessage,
    2: CompanionDistributePush_Message.startPartMessage,
    3: CompanionDistributePush_Message.invitationMessage,
    0: CompanionDistributePush_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionDistributePush',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<CompanionGSMessage>(1, _omitFieldNames ? '' : 'gsMessage',
        subBuilder: CompanionGSMessage.create)
    ..aOM<CompanionStartPartMessage>(
        2, _omitFieldNames ? '' : 'startPartMessage',
        subBuilder: CompanionStartPartMessage.create)
    ..aOM<CompanionInvitationVehicleMessage>(
        3, _omitFieldNames ? '' : 'invitationMessage',
        subBuilder: CompanionInvitationVehicleMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionDistributePush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionDistributePush copyWith(
          void Function(CompanionDistributePush) updates) =>
      super.copyWith((message) => updates(message as CompanionDistributePush))
          as CompanionDistributePush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionDistributePush create() => CompanionDistributePush._();
  @$core.override
  CompanionDistributePush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionDistributePush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionDistributePush>(create);
  static CompanionDistributePush? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  CompanionDistributePush_Message whichMessage() =>
      _CompanionDistributePush_MessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField($_whichOneof(0));

  /// *
  /// 被邀请嘉宾收到邀请通知
  @$pb.TagNumber(1)
  CompanionGSMessage get gsMessage => $_getN(0);
  @$pb.TagNumber(1)
  set gsMessage(CompanionGSMessage value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGsMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsMessage() => $_clearField(1);
  @$pb.TagNumber(1)
  CompanionGSMessage ensureGsMessage() => $_ensure(0);

  /// *
  /// 陪伴师开启派对，收到此通知直接跳转到房间
  @$pb.TagNumber(2)
  CompanionStartPartMessage get startPartMessage => $_getN(1);
  @$pb.TagNumber(2)
  set startPartMessage(CompanionStartPartMessage value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStartPartMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartPartMessage() => $_clearField(2);
  @$pb.TagNumber(2)
  CompanionStartPartMessage ensureStartPartMessage() => $_ensure(1);

  /// *
  /// 车主收到邀请进房
  @$pb.TagNumber(3)
  CompanionInvitationVehicleMessage get invitationMessage => $_getN(2);
  @$pb.TagNumber(3)
  set invitationMessage(CompanionInvitationVehicleMessage value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasInvitationMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearInvitationMessage() => $_clearField(3);
  @$pb.TagNumber(3)
  CompanionInvitationVehicleMessage ensureInvitationMessage() => $_ensure(2);
}

class CompanionStartPartMessage extends $pb.GeneratedMessage {
  factory CompanionStartPartMessage({
    $fixnum.Int64? distributeId,
    $fixnum.Int64? roomId,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  CompanionStartPartMessage._();

  factory CompanionStartPartMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionStartPartMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionStartPartMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..aInt64(2, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionStartPartMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionStartPartMessage copyWith(
          void Function(CompanionStartPartMessage) updates) =>
      super.copyWith((message) => updates(message as CompanionStartPartMessage))
          as CompanionStartPartMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionStartPartMessage create() => CompanionStartPartMessage._();
  @$core.override
  CompanionStartPartMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionStartPartMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionStartPartMessage>(create);
  static CompanionStartPartMessage? _defaultInstance;

  /// *
  /// 派单id
  @$pb.TagNumber(1)
  $fixnum.Int64 get distributeId => $_getI64(0);
  @$pb.TagNumber(1)
  set distributeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDistributeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDistributeId() => $_clearField(1);

  /// *
  /// 房间id
  @$pb.TagNumber(2)
  $fixnum.Int64 get roomId => $_getI64(1);
  @$pb.TagNumber(2)
  set roomId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => $_clearField(2);
}

class CompanionGSMessage extends $pb.GeneratedMessage {
  factory CompanionGSMessage({
    $fixnum.Int64? uid,
    $fixnum.Int64? distributeId,
    $fixnum.Int64? endTime,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (distributeId != null) result.distributeId = distributeId;
    if (endTime != null) result.endTime = endTime;
    return result;
  }

  CompanionGSMessage._();

  factory CompanionGSMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionGSMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionGSMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aInt64(2, _omitFieldNames ? '' : 'distributeId')
    ..aInt64(3, _omitFieldNames ? '' : 'endTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionGSMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionGSMessage copyWith(void Function(CompanionGSMessage) updates) =>
      super.copyWith((message) => updates(message as CompanionGSMessage))
          as CompanionGSMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionGSMessage create() => CompanionGSMessage._();
  @$core.override
  CompanionGSMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionGSMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionGSMessage>(create);
  static CompanionGSMessage? _defaultInstance;

  /// *
  /// 发起邀请的uid
  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  /// *
  /// 派单id
  @$pb.TagNumber(2)
  $fixnum.Int64 get distributeId => $_getI64(1);
  @$pb.TagNumber(2)
  set distributeId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDistributeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDistributeId() => $_clearField(2);

  /// *
  /// 邀请结束时间
  @$pb.TagNumber(3)
  $fixnum.Int64 get endTime => $_getI64(2);
  @$pb.TagNumber(3)
  set endTime($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => $_clearField(3);
}

class CompanionInvitationVehicleMessage extends $pb.GeneratedMessage {
  factory CompanionInvitationVehicleMessage({
    $fixnum.Int64? uid,
    $fixnum.Int64? distributeId,
    $fixnum.Int64? roomId,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (distributeId != null) result.distributeId = distributeId;
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  CompanionInvitationVehicleMessage._();

  factory CompanionInvitationVehicleMessage.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionInvitationVehicleMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionInvitationVehicleMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aInt64(2, _omitFieldNames ? '' : 'distributeId')
    ..aInt64(3, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionInvitationVehicleMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionInvitationVehicleMessage copyWith(
          void Function(CompanionInvitationVehicleMessage) updates) =>
      super.copyWith((message) =>
              updates(message as CompanionInvitationVehicleMessage))
          as CompanionInvitationVehicleMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionInvitationVehicleMessage create() =>
      CompanionInvitationVehicleMessage._();
  @$core.override
  CompanionInvitationVehicleMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionInvitationVehicleMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionInvitationVehicleMessage>(
          create);
  static CompanionInvitationVehicleMessage? _defaultInstance;

  /// *
  /// 发起邀请的uid
  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  /// *
  /// 派单id
  @$pb.TagNumber(2)
  $fixnum.Int64 get distributeId => $_getI64(1);
  @$pb.TagNumber(2)
  set distributeId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDistributeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDistributeId() => $_clearField(2);

  /// *
  /// 房间id
  @$pb.TagNumber(3)
  $fixnum.Int64 get roomId => $_getI64(2);
  @$pb.TagNumber(3)
  set roomId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => $_clearField(3);
}

class CheckPartDistributeReq extends $pb.GeneratedMessage {
  factory CheckPartDistributeReq() => create();

  CheckPartDistributeReq._();

  factory CheckPartDistributeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckPartDistributeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckPartDistributeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPartDistributeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPartDistributeReq copyWith(
          void Function(CheckPartDistributeReq) updates) =>
      super.copyWith((message) => updates(message as CheckPartDistributeReq))
          as CheckPartDistributeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckPartDistributeReq create() => CheckPartDistributeReq._();
  @$core.override
  CheckPartDistributeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckPartDistributeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckPartDistributeReq>(create);
  static CheckPartDistributeReq? _defaultInstance;
}

class CheckPartDistributeResp extends $pb.GeneratedMessage {
  factory CheckPartDistributeResp({
    $core.bool? exist,
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (exist != null) result.exist = exist;
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  CheckPartDistributeResp._();

  factory CheckPartDistributeResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckPartDistributeResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckPartDistributeResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'exist')
    ..aInt64(2, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPartDistributeResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPartDistributeResp copyWith(
          void Function(CheckPartDistributeResp) updates) =>
      super.copyWith((message) => updates(message as CheckPartDistributeResp))
          as CheckPartDistributeResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckPartDistributeResp create() => CheckPartDistributeResp._();
  @$core.override
  CheckPartDistributeResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckPartDistributeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckPartDistributeResp>(create);
  static CheckPartDistributeResp? _defaultInstance;

  /// *
  /// true 有正在派单 则取 distribute_id 拉取派单详情
  @$pb.TagNumber(1)
  $core.bool get exist => $_getBF(0);
  @$pb.TagNumber(1)
  set exist($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasExist() => $_has(0);
  @$pb.TagNumber(1)
  void clearExist() => $_clearField(1);

  /// *
  /// 派单id
  @$pb.TagNumber(2)
  $fixnum.Int64 get distributeId => $_getI64(1);
  @$pb.TagNumber(2)
  set distributeId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDistributeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDistributeId() => $_clearField(2);
}

class StartPartDistributeReq extends $pb.GeneratedMessage {
  factory StartPartDistributeReq({
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  StartPartDistributeReq._();

  factory StartPartDistributeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartPartDistributeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartPartDistributeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartPartDistributeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartPartDistributeReq copyWith(
          void Function(StartPartDistributeReq) updates) =>
      super.copyWith((message) => updates(message as StartPartDistributeReq))
          as StartPartDistributeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartPartDistributeReq create() => StartPartDistributeReq._();
  @$core.override
  StartPartDistributeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartPartDistributeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartPartDistributeReq>(create);
  static StartPartDistributeReq? _defaultInstance;

  /// *
  /// 派单id
  @$pb.TagNumber(1)
  $fixnum.Int64 get distributeId => $_getI64(0);
  @$pb.TagNumber(1)
  set distributeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDistributeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDistributeId() => $_clearField(1);
}

class StartPartDistributeResp extends $pb.GeneratedMessage {
  factory StartPartDistributeResp({
    $fixnum.Int64? roomId,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    return result;
  }

  StartPartDistributeResp._();

  factory StartPartDistributeResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartPartDistributeResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartPartDistributeResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartPartDistributeResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartPartDistributeResp copyWith(
          void Function(StartPartDistributeResp) updates) =>
      super.copyWith((message) => updates(message as StartPartDistributeResp))
          as StartPartDistributeResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartPartDistributeResp create() => StartPartDistributeResp._();
  @$core.override
  StartPartDistributeResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartPartDistributeResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartPartDistributeResp>(create);
  static StartPartDistributeResp? _defaultInstance;

  /// *
  /// 房间id
  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => $_clearField(1);
}

class CompanionVehicleRoomWheatReq extends $pb.GeneratedMessage {
  factory CompanionVehicleRoomWheatReq({
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  CompanionVehicleRoomWheatReq._();

  factory CompanionVehicleRoomWheatReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionVehicleRoomWheatReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionVehicleRoomWheatReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionVehicleRoomWheatReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionVehicleRoomWheatReq copyWith(
          void Function(CompanionVehicleRoomWheatReq) updates) =>
      super.copyWith(
              (message) => updates(message as CompanionVehicleRoomWheatReq))
          as CompanionVehicleRoomWheatReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionVehicleRoomWheatReq create() =>
      CompanionVehicleRoomWheatReq._();
  @$core.override
  CompanionVehicleRoomWheatReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionVehicleRoomWheatReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionVehicleRoomWheatReq>(create);
  static CompanionVehicleRoomWheatReq? _defaultInstance;

  /// *
  /// 派单id
  @$pb.TagNumber(1)
  $fixnum.Int64 get distributeId => $_getI64(0);
  @$pb.TagNumber(1)
  set distributeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDistributeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDistributeId() => $_clearField(1);
}

class CompanionCloseRoomReq extends $pb.GeneratedMessage {
  factory CompanionCloseRoomReq({
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  CompanionCloseRoomReq._();

  factory CompanionCloseRoomReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionCloseRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionCloseRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionCloseRoomReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionCloseRoomReq copyWith(
          void Function(CompanionCloseRoomReq) updates) =>
      super.copyWith((message) => updates(message as CompanionCloseRoomReq))
          as CompanionCloseRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionCloseRoomReq create() => CompanionCloseRoomReq._();
  @$core.override
  CompanionCloseRoomReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionCloseRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionCloseRoomReq>(create);
  static CompanionCloseRoomReq? _defaultInstance;

  /// *
  /// 派单id
  @$pb.TagNumber(1)
  $fixnum.Int64 get distributeId => $_getI64(0);
  @$pb.TagNumber(1)
  set distributeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDistributeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDistributeId() => $_clearField(1);
}

class CompanionVehicleLeaveRoomReq extends $pb.GeneratedMessage {
  factory CompanionVehicleLeaveRoomReq({
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  CompanionVehicleLeaveRoomReq._();

  factory CompanionVehicleLeaveRoomReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionVehicleLeaveRoomReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionVehicleLeaveRoomReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionVehicleLeaveRoomReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionVehicleLeaveRoomReq copyWith(
          void Function(CompanionVehicleLeaveRoomReq) updates) =>
      super.copyWith(
              (message) => updates(message as CompanionVehicleLeaveRoomReq))
          as CompanionVehicleLeaveRoomReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionVehicleLeaveRoomReq create() =>
      CompanionVehicleLeaveRoomReq._();
  @$core.override
  CompanionVehicleLeaveRoomReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionVehicleLeaveRoomReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionVehicleLeaveRoomReq>(create);
  static CompanionVehicleLeaveRoomReq? _defaultInstance;

  /// *
  /// 派单id
  @$pb.TagNumber(1)
  $fixnum.Int64 get distributeId => $_getI64(0);
  @$pb.TagNumber(1)
  set distributeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDistributeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDistributeId() => $_clearField(1);
}

class CompanionInvitationVehicleReq extends $pb.GeneratedMessage {
  factory CompanionInvitationVehicleReq({
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  CompanionInvitationVehicleReq._();

  factory CompanionInvitationVehicleReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompanionInvitationVehicleReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompanionInvitationVehicleReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'companion'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionInvitationVehicleReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompanionInvitationVehicleReq copyWith(
          void Function(CompanionInvitationVehicleReq) updates) =>
      super.copyWith(
              (message) => updates(message as CompanionInvitationVehicleReq))
          as CompanionInvitationVehicleReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompanionInvitationVehicleReq create() =>
      CompanionInvitationVehicleReq._();
  @$core.override
  CompanionInvitationVehicleReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompanionInvitationVehicleReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompanionInvitationVehicleReq>(create);
  static CompanionInvitationVehicleReq? _defaultInstance;

  /// *
  /// 派单id
  @$pb.TagNumber(1)
  $fixnum.Int64 get distributeId => $_getI64(0);
  @$pb.TagNumber(1)
  set distributeId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDistributeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDistributeId() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

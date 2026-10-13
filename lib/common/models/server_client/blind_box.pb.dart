// This is a generated file - do not edit.
//
// Generated from server_client/blind_box.proto.

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
///  统一盲盒 — App 接口与 CMD 对接
///
///  ── HTTP 接口 ──
///
///    * 开启盲盒（弹窗点遮罩 / 背包点击均可）
///      POST /api/v1/blind-box/open
///      body: BlindBoxOpenReq
///      response: BlindBoxOpenData
///
///  ── CMD 推送 ──
///
///    * 强制弹窗（仅配置 popup=1）
///      消息说明:
///        发放时若用户在前台，只推本批当前这条；不在前台则 delivered=0。
///        首页 / 登录事件才一次推送该用户全部未弹（PENDING + popup=1 + delivered=0），
///        list 按 grant_time 逆序（新的在前）；客户端用本列表整表替换本地队列。
///        客户端无关闭按钮；点遮罩或开启按钮调用 /api/v1/blind-box/open，传入 grant_record_id。
///        popup=0 不推本 CMD。未开启盲盒一律由 admin 发放时写入背包。
///      消息类型:
///        EaseCmdPush.type = EaseCmdPushType.BLIND_BOX_POPUP (46)
///        PushType.code    = BlindBoxPopup
///      消息体:
///        EaseCmdPush.content = Any.pack(BlindBoxPopupList)
class BlindBoxOpenReq extends $pb.GeneratedMessage {
  factory BlindBoxOpenReq({
    $fixnum.Int64? grantRecordId,
  }) {
    final result = create();
    if (grantRecordId != null) result.grantRecordId = grantRecordId;
    return result;
  }

  BlindBoxOpenReq._();

  factory BlindBoxOpenReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlindBoxOpenReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlindBoxOpenReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'blind_box'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'grantRecordId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlindBoxOpenReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlindBoxOpenReq copyWith(void Function(BlindBoxOpenReq) updates) =>
      super.copyWith((message) => updates(message as BlindBoxOpenReq))
          as BlindBoxOpenReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlindBoxOpenReq create() => BlindBoxOpenReq._();
  @$core.override
  BlindBoxOpenReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlindBoxOpenReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BlindBoxOpenReq>(create);
  static BlindBoxOpenReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get grantRecordId => $_getI64(0);
  @$pb.TagNumber(1)
  set grantRecordId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGrantRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGrantRecordId() => $_clearField(1);
}

class BlindBoxOpenData extends $pb.GeneratedMessage {
  factory BlindBoxOpenData({
    $fixnum.Int64? grantRecordId,
    $core.int? itemType,
    $fixnum.Int64? itemId,
    $core.String? itemName,
    $core.String? itemIcon,
    $core.int? period,
    $core.String? openDynamicResource,
  }) {
    final result = create();
    if (grantRecordId != null) result.grantRecordId = grantRecordId;
    if (itemType != null) result.itemType = itemType;
    if (itemId != null) result.itemId = itemId;
    if (itemName != null) result.itemName = itemName;
    if (itemIcon != null) result.itemIcon = itemIcon;
    if (period != null) result.period = period;
    if (openDynamicResource != null)
      result.openDynamicResource = openDynamicResource;
    return result;
  }

  BlindBoxOpenData._();

  factory BlindBoxOpenData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlindBoxOpenData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlindBoxOpenData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'blind_box'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'grantRecordId')
    ..aI(2, _omitFieldNames ? '' : 'itemType')
    ..aInt64(3, _omitFieldNames ? '' : 'itemId')
    ..aOS(4, _omitFieldNames ? '' : 'itemName')
    ..aOS(5, _omitFieldNames ? '' : 'itemIcon')
    ..aI(6, _omitFieldNames ? '' : 'period')
    ..aOS(7, _omitFieldNames ? '' : 'openDynamicResource')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlindBoxOpenData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlindBoxOpenData copyWith(void Function(BlindBoxOpenData) updates) =>
      super.copyWith((message) => updates(message as BlindBoxOpenData))
          as BlindBoxOpenData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlindBoxOpenData create() => BlindBoxOpenData._();
  @$core.override
  BlindBoxOpenData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlindBoxOpenData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BlindBoxOpenData>(create);
  static BlindBoxOpenData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get grantRecordId => $_getI64(0);
  @$pb.TagNumber(1)
  set grantRecordId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGrantRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGrantRecordId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get itemType => $_getIZ(1);
  @$pb.TagNumber(2)
  set itemType($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasItemType() => $_has(1);
  @$pb.TagNumber(2)
  void clearItemType() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get itemId => $_getI64(2);
  @$pb.TagNumber(3)
  set itemId($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasItemId() => $_has(2);
  @$pb.TagNumber(3)
  void clearItemId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get itemName => $_getSZ(3);
  @$pb.TagNumber(4)
  set itemName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasItemName() => $_has(3);
  @$pb.TagNumber(4)
  void clearItemName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get itemIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set itemIcon($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasItemIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearItemIcon() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get period => $_getIZ(5);
  @$pb.TagNumber(6)
  set period($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPeriod() => $_has(5);
  @$pb.TagNumber(6)
  void clearPeriod() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get openDynamicResource => $_getSZ(6);
  @$pb.TagNumber(7)
  set openDynamicResource($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasOpenDynamicResource() => $_has(6);
  @$pb.TagNumber(7)
  void clearOpenDynamicResource() => $_clearField(7);
}

/// * 单条待弹窗盲盒
class BlindBoxPopupInfo extends $pb.GeneratedMessage {
  factory BlindBoxPopupInfo({
    $fixnum.Int64? grantRecordId,
    $fixnum.Int64? boxId,
    $core.String? name,
    $core.String? icon,
    $core.String? dynamicResource,
  }) {
    final result = create();
    if (grantRecordId != null) result.grantRecordId = grantRecordId;
    if (boxId != null) result.boxId = boxId;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (dynamicResource != null) result.dynamicResource = dynamicResource;
    return result;
  }

  BlindBoxPopupInfo._();

  factory BlindBoxPopupInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlindBoxPopupInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlindBoxPopupInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'blind_box'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'grantRecordId')
    ..aInt64(2, _omitFieldNames ? '' : 'boxId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'icon')
    ..aOS(5, _omitFieldNames ? '' : 'dynamicResource')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlindBoxPopupInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlindBoxPopupInfo copyWith(void Function(BlindBoxPopupInfo) updates) =>
      super.copyWith((message) => updates(message as BlindBoxPopupInfo))
          as BlindBoxPopupInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlindBoxPopupInfo create() => BlindBoxPopupInfo._();
  @$core.override
  BlindBoxPopupInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlindBoxPopupInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BlindBoxPopupInfo>(create);
  static BlindBoxPopupInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get grantRecordId => $_getI64(0);
  @$pb.TagNumber(1)
  set grantRecordId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGrantRecordId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGrantRecordId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get boxId => $_getI64(1);
  @$pb.TagNumber(2)
  set boxId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBoxId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoxId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get dynamicResource => $_getSZ(4);
  @$pb.TagNumber(5)
  set dynamicResource($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDynamicResource() => $_has(4);
  @$pb.TagNumber(5)
  void clearDynamicResource() => $_clearField(5);
}

/// * 强制弹窗 CMD 消息体，对应 EaseCmdPushType.BLIND_BOX_POPUP = 46
class BlindBoxPopupList extends $pb.GeneratedMessage {
  factory BlindBoxPopupList({
    $core.Iterable<BlindBoxPopupInfo>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  BlindBoxPopupList._();

  factory BlindBoxPopupList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlindBoxPopupList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlindBoxPopupList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'blind_box'),
      createEmptyInstance: create)
    ..pPM<BlindBoxPopupInfo>(1, _omitFieldNames ? '' : 'list',
        subBuilder: BlindBoxPopupInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlindBoxPopupList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlindBoxPopupList copyWith(void Function(BlindBoxPopupList) updates) =>
      super.copyWith((message) => updates(message as BlindBoxPopupList))
          as BlindBoxPopupList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlindBoxPopupList create() => BlindBoxPopupList._();
  @$core.override
  BlindBoxPopupList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlindBoxPopupList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BlindBoxPopupList>(create);
  static BlindBoxPopupList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BlindBoxPopupInfo> get list => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

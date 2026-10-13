// This is a generated file - do not edit.
//
// Generated from server_client/companion_owner_distribute.proto.

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

class GsInfoCompanionReq extends $pb.GeneratedMessage {
  factory GsInfoCompanionReq({
    $core.Iterable<$fixnum.Int64>? gsId,
  }) {
    final result = create();
    if (gsId != null) result.gsId.addAll(gsId);
    return result;
  }

  GsInfoCompanionReq._();

  factory GsInfoCompanionReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsInfoCompanionReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsInfoCompanionReq',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'gsId', $pb.PbFieldType.K6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInfoCompanionReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInfoCompanionReq copyWith(void Function(GsInfoCompanionReq) updates) =>
      super.copyWith((message) => updates(message as GsInfoCompanionReq))
          as GsInfoCompanionReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsInfoCompanionReq create() => GsInfoCompanionReq._();
  @$core.override
  GsInfoCompanionReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsInfoCompanionReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsInfoCompanionReq>(create);
  static GsInfoCompanionReq? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get gsId => $_getList(0);
}

class GsInfoCompanionResp extends $pb.GeneratedMessage {
  factory GsInfoCompanionResp({
    $core.Iterable<GsInfoCompanionList>? item,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    return result;
  }

  GsInfoCompanionResp._();

  factory GsInfoCompanionResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsInfoCompanionResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsInfoCompanionResp',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..pPM<GsInfoCompanionList>(1, _omitFieldNames ? '' : 'item',
        subBuilder: GsInfoCompanionList.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInfoCompanionResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInfoCompanionResp copyWith(void Function(GsInfoCompanionResp) updates) =>
      super.copyWith((message) => updates(message as GsInfoCompanionResp))
          as GsInfoCompanionResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsInfoCompanionResp create() => GsInfoCompanionResp._();
  @$core.override
  GsInfoCompanionResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsInfoCompanionResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsInfoCompanionResp>(create);
  static GsInfoCompanionResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GsInfoCompanionList> get item => $_getList(0);
}

class GsInfoCompanionList extends $pb.GeneratedMessage {
  factory GsInfoCompanionList({
    $core.int? age,
    $core.String? constellation,
    $core.int? stature,
    $core.int? weight,
    $core.String? audioUrl,
    $core.int? audioTime,
    $core.Iterable<$core.String>? code,
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? url,
    $core.String? gender,
  }) {
    final result = create();
    if (age != null) result.age = age;
    if (constellation != null) result.constellation = constellation;
    if (stature != null) result.stature = stature;
    if (weight != null) result.weight = weight;
    if (audioUrl != null) result.audioUrl = audioUrl;
    if (audioTime != null) result.audioTime = audioTime;
    if (code != null) result.code.addAll(code);
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (url != null) result.url = url;
    if (gender != null) result.gender = gender;
    return result;
  }

  GsInfoCompanionList._();

  factory GsInfoCompanionList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsInfoCompanionList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsInfoCompanionList',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'age')
    ..aOS(2, _omitFieldNames ? '' : 'constellation')
    ..aI(3, _omitFieldNames ? '' : 'stature')
    ..aI(4, _omitFieldNames ? '' : 'weight')
    ..aOS(5, _omitFieldNames ? '' : 'audioUrl')
    ..aI(6, _omitFieldNames ? '' : 'audioTime')
    ..pPS(7, _omitFieldNames ? '' : 'code')
    ..aInt64(8, _omitFieldNames ? '' : 'id')
    ..aOS(9, _omitFieldNames ? '' : 'name')
    ..aOS(10, _omitFieldNames ? '' : 'url')
    ..aOS(11, _omitFieldNames ? '' : 'gender')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInfoCompanionList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsInfoCompanionList copyWith(void Function(GsInfoCompanionList) updates) =>
      super.copyWith((message) => updates(message as GsInfoCompanionList))
          as GsInfoCompanionList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsInfoCompanionList create() => GsInfoCompanionList._();
  @$core.override
  GsInfoCompanionList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsInfoCompanionList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsInfoCompanionList>(create);
  static GsInfoCompanionList? _defaultInstance;

  /// *
  /// 年龄
  @$pb.TagNumber(1)
  $core.int get age => $_getIZ(0);
  @$pb.TagNumber(1)
  set age($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAge() => $_has(0);
  @$pb.TagNumber(1)
  void clearAge() => $_clearField(1);

  /// *
  /// 星座
  @$pb.TagNumber(2)
  $core.String get constellation => $_getSZ(1);
  @$pb.TagNumber(2)
  set constellation($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConstellation() => $_has(1);
  @$pb.TagNumber(2)
  void clearConstellation() => $_clearField(2);

  /// *
  /// 身高
  @$pb.TagNumber(3)
  $core.int get stature => $_getIZ(2);
  @$pb.TagNumber(3)
  set stature($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStature() => $_has(2);
  @$pb.TagNumber(3)
  void clearStature() => $_clearField(3);

  /// *
  /// 体重
  @$pb.TagNumber(4)
  $core.int get weight => $_getIZ(3);
  @$pb.TagNumber(4)
  set weight($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeight() => $_clearField(4);

  /// *
  /// 音频url
  @$pb.TagNumber(5)
  $core.String get audioUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set audioUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAudioUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearAudioUrl() => $_clearField(5);

  /// *
  /// 音频时长
  @$pb.TagNumber(6)
  $core.int get audioTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set audioTime($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAudioTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearAudioTime() => $_clearField(6);

  /// *
  /// 标签
  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get code => $_getList(6);

  /// *
  /// gs id
  @$pb.TagNumber(8)
  $fixnum.Int64 get id => $_getI64(7);
  @$pb.TagNumber(8)
  set id($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasId() => $_has(7);
  @$pb.TagNumber(8)
  void clearId() => $_clearField(8);

  /// *
  /// name
  @$pb.TagNumber(9)
  $core.String get name => $_getSZ(8);
  @$pb.TagNumber(9)
  set name($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasName() => $_has(8);
  @$pb.TagNumber(9)
  void clearName() => $_clearField(9);

  /// *
  /// 头像
  @$pb.TagNumber(10)
  $core.String get url => $_getSZ(9);
  @$pb.TagNumber(10)
  set url($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasUrl() => $_has(9);
  @$pb.TagNumber(10)
  void clearUrl() => $_clearField(10);

  /// *
  /// 性别
  @$pb.TagNumber(11)
  $core.String get gender => $_getSZ(10);
  @$pb.TagNumber(11)
  set gender($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasGender() => $_has(10);
  @$pb.TagNumber(11)
  void clearGender() => $_clearField(11);
}

class OwnerListResp extends $pb.GeneratedMessage {
  factory OwnerListResp({
    $core.Iterable<OwnerListItem>? item,
  }) {
    final result = create();
    if (item != null) result.item.addAll(item);
    return result;
  }

  OwnerListResp._();

  factory OwnerListResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerListResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerListResp',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..pPM<OwnerListItem>(1, _omitFieldNames ? '' : 'item',
        subBuilder: OwnerListItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerListResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerListResp copyWith(void Function(OwnerListResp) updates) =>
      super.copyWith((message) => updates(message as OwnerListResp))
          as OwnerListResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerListResp create() => OwnerListResp._();
  @$core.override
  OwnerListResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerListResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerListResp>(create);
  static OwnerListResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<OwnerListItem> get item => $_getList(0);
}

/// *
/// 0 = 未完成
/// 1 = 完成
/// 2 = 失败
class OwnerListItem extends $pb.GeneratedMessage {
  factory OwnerListItem({
    $fixnum.Int64? uid,
    $core.int? affinity,
    $core.int? questRideDone,
    $core.int? questPartyDone,
    $core.int? questAffinityDone,
    $core.int? questPurchaseGuideDone,
    $fixnum.Int64? partSuccessTime,
    $fixnum.Int64? createTime,
    $core.String? divide,
    $fixnum.Int64? id,
    $core.int? bindStatus,
    OwnerUserInfo? user,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (affinity != null) result.affinity = affinity;
    if (questRideDone != null) result.questRideDone = questRideDone;
    if (questPartyDone != null) result.questPartyDone = questPartyDone;
    if (questAffinityDone != null) result.questAffinityDone = questAffinityDone;
    if (questPurchaseGuideDone != null)
      result.questPurchaseGuideDone = questPurchaseGuideDone;
    if (partSuccessTime != null) result.partSuccessTime = partSuccessTime;
    if (createTime != null) result.createTime = createTime;
    if (divide != null) result.divide = divide;
    if (id != null) result.id = id;
    if (bindStatus != null) result.bindStatus = bindStatus;
    if (user != null) result.user = user;
    return result;
  }

  OwnerListItem._();

  factory OwnerListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerListItem',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aI(2, _omitFieldNames ? '' : 'affinity')
    ..aI(3, _omitFieldNames ? '' : 'questRideDone', protoName: 'questRideDone')
    ..aI(4, _omitFieldNames ? '' : 'questPartyDone',
        protoName: 'questPartyDone')
    ..aI(5, _omitFieldNames ? '' : 'questAffinityDone',
        protoName: 'questAffinityDone')
    ..aI(6, _omitFieldNames ? '' : 'questPurchaseGuideDone',
        protoName: 'questPurchaseGuideDone')
    ..aInt64(7, _omitFieldNames ? '' : 'partSuccessTime')
    ..aInt64(8, _omitFieldNames ? '' : 'createTime')
    ..aOS(9, _omitFieldNames ? '' : 'divide')
    ..aInt64(10, _omitFieldNames ? '' : 'id')
    ..aI(11, _omitFieldNames ? '' : 'bindStatus')
    ..aOM<OwnerUserInfo>(12, _omitFieldNames ? '' : 'user',
        subBuilder: OwnerUserInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerListItem copyWith(void Function(OwnerListItem) updates) =>
      super.copyWith((message) => updates(message as OwnerListItem))
          as OwnerListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerListItem create() => OwnerListItem._();
  @$core.override
  OwnerListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerListItem>(create);
  static OwnerListItem? _defaultInstance;

  /// *
  /// 车主id
  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  /// *
  /// 亲密度
  @$pb.TagNumber(2)
  $core.int get affinity => $_getIZ(1);
  @$pb.TagNumber(2)
  set affinity($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAffinity() => $_has(1);
  @$pb.TagNumber(2)
  void clearAffinity() => $_clearField(2);

  /// *
  /// 带体验车主兜风
  @$pb.TagNumber(3)
  $core.int get questRideDone => $_getIZ(2);
  @$pb.TagNumber(3)
  set questRideDone($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasQuestRideDone() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuestRideDone() => $_clearField(3);

  /// *
  /// 为车主举办欢迎派对
  @$pb.TagNumber(4)
  $core.int get questPartyDone => $_getIZ(3);
  @$pb.TagNumber(4)
  set questPartyDone($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuestPartyDone() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuestPartyDone() => $_clearField(4);

  /// *
  /// 为车主亲密度达到1000
  @$pb.TagNumber(5)
  $core.int get questAffinityDone => $_getIZ(4);
  @$pb.TagNumber(5)
  set questAffinityDone($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasQuestAffinityDone() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuestAffinityDone() => $_clearField(5);

  /// *
  /// 引导车主升级座驾至S级
  @$pb.TagNumber(6)
  $core.int get questPurchaseGuideDone => $_getIZ(5);
  @$pb.TagNumber(6)
  set questPurchaseGuideDone($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasQuestPurchaseGuideDone() => $_has(5);
  @$pb.TagNumber(6)
  void clearQuestPurchaseGuideDone() => $_clearField(6);

  /// *
  /// 配对成功时间
  @$pb.TagNumber(7)
  $fixnum.Int64 get partSuccessTime => $_getI64(6);
  @$pb.TagNumber(7)
  set partSuccessTime($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPartSuccessTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearPartSuccessTime() => $_clearField(7);

  /// *
  /// 创建时间
  @$pb.TagNumber(8)
  $fixnum.Int64 get createTime => $_getI64(7);
  @$pb.TagNumber(8)
  set createTime($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCreateTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreateTime() => $_clearField(8);

  /// *
  /// 分成
  @$pb.TagNumber(9)
  $core.String get divide => $_getSZ(8);
  @$pb.TagNumber(9)
  set divide($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDivide() => $_has(8);
  @$pb.TagNumber(9)
  void clearDivide() => $_clearField(9);

  /// *
  /// 记录id
  @$pb.TagNumber(10)
  $fixnum.Int64 get id => $_getI64(9);
  @$pb.TagNumber(10)
  set id($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasId() => $_has(9);
  @$pb.TagNumber(10)
  void clearId() => $_clearField(10);

  /// *
  /// 1 绑定中
  /// 2 解除绑定-车主或者定时任务
  /// 3 admin手动解除绑定
  @$pb.TagNumber(11)
  $core.int get bindStatus => $_getIZ(10);
  @$pb.TagNumber(11)
  set bindStatus($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasBindStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearBindStatus() => $_clearField(11);

  /// *
  /// 用户信息
  @$pb.TagNumber(12)
  OwnerUserInfo get user => $_getN(11);
  @$pb.TagNumber(12)
  set user(OwnerUserInfo value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasUser() => $_has(11);
  @$pb.TagNumber(12)
  void clearUser() => $_clearField(12);
  @$pb.TagNumber(12)
  OwnerUserInfo ensureUser() => $_ensure(11);
}

class OwnerUserInfo extends $pb.GeneratedMessage {
  factory OwnerUserInfo({
    $fixnum.Int64? uid,
    $core.String? gender,
    $core.String? nickname,
    $core.String? avatar,
    $core.String? emUsername,
    $0.ChannelInfo? channelInfo,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (gender != null) result.gender = gender;
    if (nickname != null) result.nickname = nickname;
    if (avatar != null) result.avatar = avatar;
    if (emUsername != null) result.emUsername = emUsername;
    if (channelInfo != null) result.channelInfo = channelInfo;
    return result;
  }

  OwnerUserInfo._();

  factory OwnerUserInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerUserInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerUserInfo',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'gender')
    ..aOS(3, _omitFieldNames ? '' : 'nickname')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..aOS(5, _omitFieldNames ? '' : 'emUsername')
    ..aOM<$0.ChannelInfo>(6, _omitFieldNames ? '' : 'channelInfo',
        subBuilder: $0.ChannelInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerUserInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerUserInfo copyWith(void Function(OwnerUserInfo) updates) =>
      super.copyWith((message) => updates(message as OwnerUserInfo))
          as OwnerUserInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerUserInfo create() => OwnerUserInfo._();
  @$core.override
  OwnerUserInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerUserInfo>(create);
  static OwnerUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get gender => $_getSZ(1);
  @$pb.TagNumber(2)
  set gender($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGender() => $_has(1);
  @$pb.TagNumber(2)
  void clearGender() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickname($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickname() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatar($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatar() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get emUsername => $_getSZ(4);
  @$pb.TagNumber(5)
  set emUsername($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEmUsername() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmUsername() => $_clearField(5);

  @$pb.TagNumber(6)
  $0.ChannelInfo get channelInfo => $_getN(5);
  @$pb.TagNumber(6)
  set channelInfo($0.ChannelInfo value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasChannelInfo() => $_has(5);
  @$pb.TagNumber(6)
  void clearChannelInfo() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.ChannelInfo ensureChannelInfo() => $_ensure(5);
}

class CheckOwnerCompanionReq extends $pb.GeneratedMessage {
  factory CheckOwnerCompanionReq() => create();

  CheckOwnerCompanionReq._();

  factory CheckOwnerCompanionReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckOwnerCompanionReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckOwnerCompanionReq',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckOwnerCompanionReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckOwnerCompanionReq copyWith(
          void Function(CheckOwnerCompanionReq) updates) =>
      super.copyWith((message) => updates(message as CheckOwnerCompanionReq))
          as CheckOwnerCompanionReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckOwnerCompanionReq create() => CheckOwnerCompanionReq._();
  @$core.override
  CheckOwnerCompanionReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckOwnerCompanionReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckOwnerCompanionReq>(create);
  static CheckOwnerCompanionReq? _defaultInstance;
}

class UpdateOwnerCompanionResp extends $pb.GeneratedMessage {
  factory UpdateOwnerCompanionResp({
    $fixnum.Int64? amount,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    return result;
  }

  UpdateOwnerCompanionResp._();

  factory UpdateOwnerCompanionResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateOwnerCompanionResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateOwnerCompanionResp',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateOwnerCompanionResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateOwnerCompanionResp copyWith(
          void Function(UpdateOwnerCompanionResp) updates) =>
      super.copyWith((message) => updates(message as UpdateOwnerCompanionResp))
          as UpdateOwnerCompanionResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateOwnerCompanionResp create() => UpdateOwnerCompanionResp._();
  @$core.override
  UpdateOwnerCompanionResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateOwnerCompanionResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateOwnerCompanionResp>(create);
  static UpdateOwnerCompanionResp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);
}

class CheckOwnerCompanionResp extends $pb.GeneratedMessage {
  factory CheckOwnerCompanionResp({
    $core.int? status,
    $fixnum.Int64? gsId,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (gsId != null) result.gsId = gsId;
    return result;
  }

  CheckOwnerCompanionResp._();

  factory CheckOwnerCompanionResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckOwnerCompanionResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckOwnerCompanionResp',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'status')
    ..aInt64(2, _omitFieldNames ? '' : 'gsId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckOwnerCompanionResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckOwnerCompanionResp copyWith(
          void Function(CheckOwnerCompanionResp) updates) =>
      super.copyWith((message) => updates(message as CheckOwnerCompanionResp))
          as CheckOwnerCompanionResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckOwnerCompanionResp create() => CheckOwnerCompanionResp._();
  @$core.override
  CheckOwnerCompanionResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckOwnerCompanionResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckOwnerCompanionResp>(create);
  static CheckOwnerCompanionResp? _defaultInstance;

  /// *
  /// 1 = 已有陪伴师
  /// 2 = 正在寻找陪伴师(因为可能反复打开退出app)
  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  /// *
  /// status = 1 的时候 有陪伴师id
  @$pb.TagNumber(2)
  $fixnum.Int64 get gsId => $_getI64(1);
  @$pb.TagNumber(2)
  set gsId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGsId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGsId() => $_clearField(2);
}

class GsGrabbingOwnerCompanionReq extends $pb.GeneratedMessage {
  factory GsGrabbingOwnerCompanionReq({
    $fixnum.Int64? distributeId,
    $core.bool? ok,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    if (ok != null) result.ok = ok;
    return result;
  }

  GsGrabbingOwnerCompanionReq._();

  factory GsGrabbingOwnerCompanionReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsGrabbingOwnerCompanionReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsGrabbingOwnerCompanionReq',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..aOB(2, _omitFieldNames ? '' : 'ok')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsGrabbingOwnerCompanionReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsGrabbingOwnerCompanionReq copyWith(
          void Function(GsGrabbingOwnerCompanionReq) updates) =>
      super.copyWith(
              (message) => updates(message as GsGrabbingOwnerCompanionReq))
          as GsGrabbingOwnerCompanionReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsGrabbingOwnerCompanionReq create() =>
      GsGrabbingOwnerCompanionReq._();
  @$core.override
  GsGrabbingOwnerCompanionReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsGrabbingOwnerCompanionReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsGrabbingOwnerCompanionReq>(create);
  static GsGrabbingOwnerCompanionReq? _defaultInstance;

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

class GsGrabbingOwnerCompanionResp extends $pb.GeneratedMessage {
  factory GsGrabbingOwnerCompanionResp({
    $core.bool? ok,
  }) {
    final result = create();
    if (ok != null) result.ok = ok;
    return result;
  }

  GsGrabbingOwnerCompanionResp._();

  factory GsGrabbingOwnerCompanionResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsGrabbingOwnerCompanionResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsGrabbingOwnerCompanionResp',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aOB(2, _omitFieldNames ? '' : 'ok')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsGrabbingOwnerCompanionResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsGrabbingOwnerCompanionResp copyWith(
          void Function(GsGrabbingOwnerCompanionResp) updates) =>
      super.copyWith(
              (message) => updates(message as GsGrabbingOwnerCompanionResp))
          as GsGrabbingOwnerCompanionResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsGrabbingOwnerCompanionResp create() =>
      GsGrabbingOwnerCompanionResp._();
  @$core.override
  GsGrabbingOwnerCompanionResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsGrabbingOwnerCompanionResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsGrabbingOwnerCompanionResp>(create);
  static GsGrabbingOwnerCompanionResp? _defaultInstance;

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

enum OwnerCompanionPush_Message {
  gsMessage,
  selectGsMessage,
  pairSuccessMessage,
  ownerReceiveRideMessage,
  ownerGsReceiveRideMessage,
  ownerGsAutoPairMessage,
  notSet
}

class OwnerCompanionPush extends $pb.GeneratedMessage {
  factory OwnerCompanionPush({
    OwnerCompanionGSMessage? gsMessage,
    OwnerSelectGSMessage? selectGsMessage,
    PairSuccessMessage? pairSuccessMessage,
    OwnerReceiveRideMessage? ownerReceiveRideMessage,
    OwnerGsReceiveRideMessage? ownerGsReceiveRideMessage,
    OwnerGsAutoPairMessage? ownerGsAutoPairMessage,
  }) {
    final result = create();
    if (gsMessage != null) result.gsMessage = gsMessage;
    if (selectGsMessage != null) result.selectGsMessage = selectGsMessage;
    if (pairSuccessMessage != null)
      result.pairSuccessMessage = pairSuccessMessage;
    if (ownerReceiveRideMessage != null)
      result.ownerReceiveRideMessage = ownerReceiveRideMessage;
    if (ownerGsReceiveRideMessage != null)
      result.ownerGsReceiveRideMessage = ownerGsReceiveRideMessage;
    if (ownerGsAutoPairMessage != null)
      result.ownerGsAutoPairMessage = ownerGsAutoPairMessage;
    return result;
  }

  OwnerCompanionPush._();

  factory OwnerCompanionPush.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerCompanionPush.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, OwnerCompanionPush_Message>
      _OwnerCompanionPush_MessageByTag = {
    1: OwnerCompanionPush_Message.gsMessage,
    2: OwnerCompanionPush_Message.selectGsMessage,
    3: OwnerCompanionPush_Message.pairSuccessMessage,
    4: OwnerCompanionPush_Message.ownerReceiveRideMessage,
    5: OwnerCompanionPush_Message.ownerGsReceiveRideMessage,
    6: OwnerCompanionPush_Message.ownerGsAutoPairMessage,
    0: OwnerCompanionPush_Message.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerCompanionPush',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6])
    ..aOM<OwnerCompanionGSMessage>(1, _omitFieldNames ? '' : 'gsMessage',
        subBuilder: OwnerCompanionGSMessage.create)
    ..aOM<OwnerSelectGSMessage>(2, _omitFieldNames ? '' : 'selectGsMessage',
        subBuilder: OwnerSelectGSMessage.create)
    ..aOM<PairSuccessMessage>(3, _omitFieldNames ? '' : 'pairSuccessMessage',
        subBuilder: PairSuccessMessage.create)
    ..aOM<OwnerReceiveRideMessage>(
        4, _omitFieldNames ? '' : 'ownerReceiveRideMessage',
        subBuilder: OwnerReceiveRideMessage.create)
    ..aOM<OwnerGsReceiveRideMessage>(
        5, _omitFieldNames ? '' : 'ownerGsReceiveRideMessage',
        subBuilder: OwnerGsReceiveRideMessage.create)
    ..aOM<OwnerGsAutoPairMessage>(
        6, _omitFieldNames ? '' : 'ownerGsAutoPairMessage',
        subBuilder: OwnerGsAutoPairMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerCompanionPush clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerCompanionPush copyWith(void Function(OwnerCompanionPush) updates) =>
      super.copyWith((message) => updates(message as OwnerCompanionPush))
          as OwnerCompanionPush;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerCompanionPush create() => OwnerCompanionPush._();
  @$core.override
  OwnerCompanionPush createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerCompanionPush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerCompanionPush>(create);
  static OwnerCompanionPush? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  OwnerCompanionPush_Message whichMessage() =>
      _OwnerCompanionPush_MessageByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  void clearMessage() => $_clearField($_whichOneof(0));

  /// *
  /// Gs收到 抢单通知
  @$pb.TagNumber(1)
  OwnerCompanionGSMessage get gsMessage => $_getN(0);
  @$pb.TagNumber(1)
  set gsMessage(OwnerCompanionGSMessage value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGsMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsMessage() => $_clearField(1);
  @$pb.TagNumber(1)
  OwnerCompanionGSMessage ensureGsMessage() => $_ensure(0);

  /// *
  /// 车主收到 选择陪伴师通知
  @$pb.TagNumber(2)
  OwnerSelectGSMessage get selectGsMessage => $_getN(1);
  @$pb.TagNumber(2)
  set selectGsMessage(OwnerSelectGSMessage value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSelectGsMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelectGsMessage() => $_clearField(2);
  @$pb.TagNumber(2)
  OwnerSelectGSMessage ensureSelectGsMessage() => $_ensure(1);

  /// *
  /// gs收到 配对成功通知
  @$pb.TagNumber(3)
  PairSuccessMessage get pairSuccessMessage => $_getN(2);
  @$pb.TagNumber(3)
  set pairSuccessMessage(PairSuccessMessage value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPairSuccessMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPairSuccessMessage() => $_clearField(3);
  @$pb.TagNumber(3)
  PairSuccessMessage ensurePairSuccessMessage() => $_ensure(2);

  /// *
  /// 车主收到 GS带他兜风
  @$pb.TagNumber(4)
  OwnerReceiveRideMessage get ownerReceiveRideMessage => $_getN(3);
  @$pb.TagNumber(4)
  set ownerReceiveRideMessage(OwnerReceiveRideMessage value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasOwnerReceiveRideMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearOwnerReceiveRideMessage() => $_clearField(4);
  @$pb.TagNumber(4)
  OwnerReceiveRideMessage ensureOwnerReceiveRideMessage() => $_ensure(3);

  /// *
  /// 车主和GS都收到 进兜风房消息
  @$pb.TagNumber(5)
  OwnerGsReceiveRideMessage get ownerGsReceiveRideMessage => $_getN(4);
  @$pb.TagNumber(5)
  set ownerGsReceiveRideMessage(OwnerGsReceiveRideMessage value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasOwnerGsReceiveRideMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearOwnerGsReceiveRideMessage() => $_clearField(5);
  @$pb.TagNumber(5)
  OwnerGsReceiveRideMessage ensureOwnerGsReceiveRideMessage() => $_ensure(4);

  /// *
  /// 车主收到 配对成功通知 （这个通知只有当服务分发只有1个陪伴师的情况下直接就绑定了，车主不会收到【选择陪伴师通知】）
  @$pb.TagNumber(6)
  OwnerGsAutoPairMessage get ownerGsAutoPairMessage => $_getN(5);
  @$pb.TagNumber(6)
  set ownerGsAutoPairMessage(OwnerGsAutoPairMessage value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasOwnerGsAutoPairMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearOwnerGsAutoPairMessage() => $_clearField(6);
  @$pb.TagNumber(6)
  OwnerGsAutoPairMessage ensureOwnerGsAutoPairMessage() => $_ensure(5);
}

class OwnerGsAutoPairMessage extends $pb.GeneratedMessage {
  factory OwnerGsAutoPairMessage({
    $fixnum.Int64? gsId,
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (gsId != null) result.gsId = gsId;
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  OwnerGsAutoPairMessage._();

  factory OwnerGsAutoPairMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerGsAutoPairMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerGsAutoPairMessage',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'gsId')
    ..aInt64(2, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerGsAutoPairMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerGsAutoPairMessage copyWith(
          void Function(OwnerGsAutoPairMessage) updates) =>
      super.copyWith((message) => updates(message as OwnerGsAutoPairMessage))
          as OwnerGsAutoPairMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerGsAutoPairMessage create() => OwnerGsAutoPairMessage._();
  @$core.override
  OwnerGsAutoPairMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerGsAutoPairMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerGsAutoPairMessage>(create);
  static OwnerGsAutoPairMessage? _defaultInstance;

  /// *
  /// 陪伴师id
  @$pb.TagNumber(1)
  $fixnum.Int64 get gsId => $_getI64(0);
  @$pb.TagNumber(1)
  set gsId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsId() => $_clearField(1);

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

class OwnerGsReceiveRideMessage extends $pb.GeneratedMessage {
  factory OwnerGsReceiveRideMessage({
    $fixnum.Int64? roomId,
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (roomId != null) result.roomId = roomId;
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  OwnerGsReceiveRideMessage._();

  factory OwnerGsReceiveRideMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerGsReceiveRideMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerGsReceiveRideMessage',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'roomId')
    ..aInt64(2, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerGsReceiveRideMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerGsReceiveRideMessage copyWith(
          void Function(OwnerGsReceiveRideMessage) updates) =>
      super.copyWith((message) => updates(message as OwnerGsReceiveRideMessage))
          as OwnerGsReceiveRideMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerGsReceiveRideMessage create() => OwnerGsReceiveRideMessage._();
  @$core.override
  OwnerGsReceiveRideMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerGsReceiveRideMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerGsReceiveRideMessage>(create);
  static OwnerGsReceiveRideMessage? _defaultInstance;

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

class OwnerSelectGSMessage extends $pb.GeneratedMessage {
  factory OwnerSelectGSMessage({
    $core.Iterable<$fixnum.Int64>? gsId,
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (gsId != null) result.gsId.addAll(gsId);
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  OwnerSelectGSMessage._();

  factory OwnerSelectGSMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerSelectGSMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerSelectGSMessage',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : 'gsId', $pb.PbFieldType.K6)
    ..aInt64(2, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerSelectGSMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerSelectGSMessage copyWith(void Function(OwnerSelectGSMessage) updates) =>
      super.copyWith((message) => updates(message as OwnerSelectGSMessage))
          as OwnerSelectGSMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerSelectGSMessage create() => OwnerSelectGSMessage._();
  @$core.override
  OwnerSelectGSMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerSelectGSMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerSelectGSMessage>(create);
  static OwnerSelectGSMessage? _defaultInstance;

  /// *
  /// 陪伴师id
  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get gsId => $_getList(0);

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

class PairSuccessMessage extends $pb.GeneratedMessage {
  factory PairSuccessMessage({
    $fixnum.Int64? ownerId,
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (ownerId != null) result.ownerId = ownerId;
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  PairSuccessMessage._();

  factory PairSuccessMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PairSuccessMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PairSuccessMessage',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'ownerId')
    ..aInt64(2, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairSuccessMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PairSuccessMessage copyWith(void Function(PairSuccessMessage) updates) =>
      super.copyWith((message) => updates(message as PairSuccessMessage))
          as PairSuccessMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PairSuccessMessage create() => PairSuccessMessage._();
  @$core.override
  PairSuccessMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PairSuccessMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PairSuccessMessage>(create);
  static PairSuccessMessage? _defaultInstance;

  /// *
  /// 车主id
  @$pb.TagNumber(1)
  $fixnum.Int64 get ownerId => $_getI64(0);
  @$pb.TagNumber(1)
  set ownerId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerId() => $_clearField(1);

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

class OwnerCompanionGSMessage extends $pb.GeneratedMessage {
  factory OwnerCompanionGSMessage({
    $fixnum.Int64? ownerId,
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (ownerId != null) result.ownerId = ownerId;
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  OwnerCompanionGSMessage._();

  factory OwnerCompanionGSMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerCompanionGSMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerCompanionGSMessage',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'ownerId')
    ..aInt64(2, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerCompanionGSMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerCompanionGSMessage copyWith(
          void Function(OwnerCompanionGSMessage) updates) =>
      super.copyWith((message) => updates(message as OwnerCompanionGSMessage))
          as OwnerCompanionGSMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerCompanionGSMessage create() => OwnerCompanionGSMessage._();
  @$core.override
  OwnerCompanionGSMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerCompanionGSMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerCompanionGSMessage>(create);
  static OwnerCompanionGSMessage? _defaultInstance;

  /// *
  /// 车主id
  @$pb.TagNumber(1)
  $fixnum.Int64 get ownerId => $_getI64(0);
  @$pb.TagNumber(1)
  set ownerId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOwnerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerId() => $_clearField(1);

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

class OwnerReceiveRideMessage extends $pb.GeneratedMessage {
  factory OwnerReceiveRideMessage({
    $fixnum.Int64? gsId,
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (gsId != null) result.gsId = gsId;
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  OwnerReceiveRideMessage._();

  factory OwnerReceiveRideMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerReceiveRideMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerReceiveRideMessage',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'gsId')
    ..aInt64(2, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerReceiveRideMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerReceiveRideMessage copyWith(
          void Function(OwnerReceiveRideMessage) updates) =>
      super.copyWith((message) => updates(message as OwnerReceiveRideMessage))
          as OwnerReceiveRideMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerReceiveRideMessage create() => OwnerReceiveRideMessage._();
  @$core.override
  OwnerReceiveRideMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerReceiveRideMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerReceiveRideMessage>(create);
  static OwnerReceiveRideMessage? _defaultInstance;

  /// *
  /// gs id
  @$pb.TagNumber(1)
  $fixnum.Int64 get gsId => $_getI64(0);
  @$pb.TagNumber(1)
  set gsId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsId() => $_clearField(1);

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

class OwnerSelectGsReq extends $pb.GeneratedMessage {
  factory OwnerSelectGsReq({
    $fixnum.Int64? gsId,
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (gsId != null) result.gsId = gsId;
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  OwnerSelectGsReq._();

  factory OwnerSelectGsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerSelectGsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerSelectGsReq',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'gsId')
    ..aInt64(2, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerSelectGsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerSelectGsReq copyWith(void Function(OwnerSelectGsReq) updates) =>
      super.copyWith((message) => updates(message as OwnerSelectGsReq))
          as OwnerSelectGsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerSelectGsReq create() => OwnerSelectGsReq._();
  @$core.override
  OwnerSelectGsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerSelectGsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerSelectGsReq>(create);
  static OwnerSelectGsReq? _defaultInstance;

  /// *
  /// 陪伴师id
  @$pb.TagNumber(1)
  $fixnum.Int64 get gsId => $_getI64(0);
  @$pb.TagNumber(1)
  set gsId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGsId() => $_clearField(1);

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

class GsAndOwnerRideReq extends $pb.GeneratedMessage {
  factory GsAndOwnerRideReq({
    $fixnum.Int64? distributeId,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    return result;
  }

  GsAndOwnerRideReq._();

  factory GsAndOwnerRideReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GsAndOwnerRideReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GsAndOwnerRideReq',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsAndOwnerRideReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GsAndOwnerRideReq copyWith(void Function(GsAndOwnerRideReq) updates) =>
      super.copyWith((message) => updates(message as GsAndOwnerRideReq))
          as GsAndOwnerRideReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GsAndOwnerRideReq create() => GsAndOwnerRideReq._();
  @$core.override
  GsAndOwnerRideReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GsAndOwnerRideReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsAndOwnerRideReq>(create);
  static GsAndOwnerRideReq? _defaultInstance;

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

class OwnerAcceptRideReq extends $pb.GeneratedMessage {
  factory OwnerAcceptRideReq({
    $fixnum.Int64? distributeId,
    $core.bool? ok,
  }) {
    final result = create();
    if (distributeId != null) result.distributeId = distributeId;
    if (ok != null) result.ok = ok;
    return result;
  }

  OwnerAcceptRideReq._();

  factory OwnerAcceptRideReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OwnerAcceptRideReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OwnerAcceptRideReq',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'companion_owner_distribute'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'distributeId')
    ..aOB(2, _omitFieldNames ? '' : 'ok')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerAcceptRideReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OwnerAcceptRideReq copyWith(void Function(OwnerAcceptRideReq) updates) =>
      super.copyWith((message) => updates(message as OwnerAcceptRideReq))
          as OwnerAcceptRideReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerAcceptRideReq create() => OwnerAcceptRideReq._();
  @$core.override
  OwnerAcceptRideReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OwnerAcceptRideReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OwnerAcceptRideReq>(create);
  static OwnerAcceptRideReq? _defaultInstance;

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
  /// ture 立即上车
  /// false 稍后上车
  @$pb.TagNumber(2)
  $core.bool get ok => $_getBF(1);
  @$pb.TagNumber(2)
  set ok($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOk() => $_has(1);
  @$pb.TagNumber(2)
  void clearOk() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

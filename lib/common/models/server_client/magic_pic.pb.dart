// This is a generated file - do not edit.
//
// Generated from server_client/magic_pic.proto.

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

class MagicPicInfoRsp extends $pb.GeneratedMessage {
  factory MagicPicInfoRsp({
    $core.int? freeTimes,
    $core.String? prePic,
    $core.bool? target,
  }) {
    final result = create();
    if (freeTimes != null) result.freeTimes = freeTimes;
    if (prePic != null) result.prePic = prePic;
    if (target != null) result.target = target;
    return result;
  }

  MagicPicInfoRsp._();

  factory MagicPicInfoRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MagicPicInfoRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MagicPicInfoRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'magic_pic'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'freeTimes', fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'prePic')
    ..aOB(3, _omitFieldNames ? '' : 'target')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicPicInfoRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicPicInfoRsp copyWith(void Function(MagicPicInfoRsp) updates) =>
      super.copyWith((message) => updates(message as MagicPicInfoRsp))
          as MagicPicInfoRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MagicPicInfoRsp create() => MagicPicInfoRsp._();
  @$core.override
  MagicPicInfoRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MagicPicInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MagicPicInfoRsp>(create);
  static MagicPicInfoRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get freeTimes => $_getIZ(0);
  @$pb.TagNumber(1)
  set freeTimes($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFreeTimes() => $_has(0);
  @$pb.TagNumber(1)
  void clearFreeTimes() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get prePic => $_getSZ(1);
  @$pb.TagNumber(2)
  set prePic($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrePic() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrePic() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get target => $_getBF(2);
  @$pb.TagNumber(3)
  set target($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTarget() => $_has(2);
  @$pb.TagNumber(3)
  void clearTarget() => $_clearField(3);
}

class MagicPicListReq extends $pb.GeneratedMessage {
  factory MagicPicListReq({
    $core.int? page,
    $core.int? size,
  }) {
    final result = create();
    if (page != null) result.page = page;
    if (size != null) result.size = size;
    return result;
  }

  MagicPicListReq._();

  factory MagicPicListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MagicPicListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MagicPicListReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'magic_pic'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'page', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'size', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicPicListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicPicListReq copyWith(void Function(MagicPicListReq) updates) =>
      super.copyWith((message) => updates(message as MagicPicListReq))
          as MagicPicListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MagicPicListReq create() => MagicPicListReq._();
  @$core.override
  MagicPicListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MagicPicListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MagicPicListReq>(create);
  static MagicPicListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get page => $_getIZ(0);
  @$pb.TagNumber(1)
  set page($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get size => $_getIZ(1);
  @$pb.TagNumber(2)
  set size($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => $_clearField(2);
}

class MagicPicListRsp extends $pb.GeneratedMessage {
  factory MagicPicListRsp({
    $core.Iterable<MagicPicItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  MagicPicListRsp._();

  factory MagicPicListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MagicPicListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MagicPicListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'magic_pic'),
      createEmptyInstance: create)
    ..pPM<MagicPicItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: MagicPicItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicPicListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicPicListRsp copyWith(void Function(MagicPicListRsp) updates) =>
      super.copyWith((message) => updates(message as MagicPicListRsp))
          as MagicPicListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MagicPicListRsp create() => MagicPicListRsp._();
  @$core.override
  MagicPicListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MagicPicListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MagicPicListRsp>(create);
  static MagicPicListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MagicPicItem> get items => $_getList(0);
}

class MagicPicItem extends $pb.GeneratedMessage {
  factory MagicPicItem({
    $fixnum.Int64? id,
    $core.String? url,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (url != null) result.url = url;
    return result;
  }

  MagicPicItem._();

  factory MagicPicItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MagicPicItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MagicPicItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'magic_pic'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicPicItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicPicItem copyWith(void Function(MagicPicItem) updates) =>
      super.copyWith((message) => updates(message as MagicPicItem))
          as MagicPicItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MagicPicItem create() => MagicPicItem._();
  @$core.override
  MagicPicItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MagicPicItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MagicPicItem>(create);
  static MagicPicItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => $_clearField(2);
}

class MagicPicScene extends $pb.GeneratedMessage {
  factory MagicPicScene({
    $core.String? url,
    $core.String? name,
    $core.bool? hot,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (name != null) result.name = name;
    if (hot != null) result.hot = hot;
    return result;
  }

  MagicPicScene._();

  factory MagicPicScene.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MagicPicScene.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MagicPicScene',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'magic_pic'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOB(3, _omitFieldNames ? '' : 'hot')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicPicScene clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicPicScene copyWith(void Function(MagicPicScene) updates) =>
      super.copyWith((message) => updates(message as MagicPicScene))
          as MagicPicScene;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MagicPicScene create() => MagicPicScene._();
  @$core.override
  MagicPicScene createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MagicPicScene getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MagicPicScene>(create);
  static MagicPicScene? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get hot => $_getBF(2);
  @$pb.TagNumber(3)
  set hot($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHot() => $_has(2);
  @$pb.TagNumber(3)
  void clearHot() => $_clearField(3);
}

class MagicPicConfRsp extends $pb.GeneratedMessage {
  factory MagicPicConfRsp({
    $core.int? freeTimes,
    $fixnum.Int64? totalCoins,
    $core.int? price,
    $core.Iterable<$core.String>? ethnicity,
    $core.Iterable<$core.String>? hairStyle,
    $core.Iterable<$core.String>? hairColor,
    $core.Iterable<$core.String>? bodyType,
    $core.Iterable<$core.String>? breastSize,
    $core.Iterable<$core.String>? buttSize,
    $core.Iterable<$core.String>? skin,
    $core.Iterable<$core.String>? bodyHeight,
    $core.Iterable<MagicPicScene>? scene,
    $core.Iterable<$core.int>? num,
    MagicCreateReq? conf,
  }) {
    final result = create();
    if (freeTimes != null) result.freeTimes = freeTimes;
    if (totalCoins != null) result.totalCoins = totalCoins;
    if (price != null) result.price = price;
    if (ethnicity != null) result.ethnicity.addAll(ethnicity);
    if (hairStyle != null) result.hairStyle.addAll(hairStyle);
    if (hairColor != null) result.hairColor.addAll(hairColor);
    if (bodyType != null) result.bodyType.addAll(bodyType);
    if (breastSize != null) result.breastSize.addAll(breastSize);
    if (buttSize != null) result.buttSize.addAll(buttSize);
    if (skin != null) result.skin.addAll(skin);
    if (bodyHeight != null) result.bodyHeight.addAll(bodyHeight);
    if (scene != null) result.scene.addAll(scene);
    if (num != null) result.num.addAll(num);
    if (conf != null) result.conf = conf;
    return result;
  }

  MagicPicConfRsp._();

  factory MagicPicConfRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MagicPicConfRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MagicPicConfRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'magic_pic'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'freeTimes', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'totalCoins', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(3, _omitFieldNames ? '' : 'price', fieldType: $pb.PbFieldType.OU3)
    ..pPS(4, _omitFieldNames ? '' : 'ethnicity')
    ..pPS(5, _omitFieldNames ? '' : 'hairStyle')
    ..pPS(6, _omitFieldNames ? '' : 'hairColor')
    ..pPS(7, _omitFieldNames ? '' : 'bodyType')
    ..pPS(8, _omitFieldNames ? '' : 'breastSize')
    ..pPS(9, _omitFieldNames ? '' : 'buttSize')
    ..pPS(10, _omitFieldNames ? '' : 'skin')
    ..pPS(11, _omitFieldNames ? '' : 'bodyHeight')
    ..pPM<MagicPicScene>(12, _omitFieldNames ? '' : 'scene',
        subBuilder: MagicPicScene.create)
    ..p<$core.int>(13, _omitFieldNames ? '' : 'num', $pb.PbFieldType.KU3)
    ..aOM<MagicCreateReq>(14, _omitFieldNames ? '' : 'conf',
        subBuilder: MagicCreateReq.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicPicConfRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicPicConfRsp copyWith(void Function(MagicPicConfRsp) updates) =>
      super.copyWith((message) => updates(message as MagicPicConfRsp))
          as MagicPicConfRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MagicPicConfRsp create() => MagicPicConfRsp._();
  @$core.override
  MagicPicConfRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MagicPicConfRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MagicPicConfRsp>(create);
  static MagicPicConfRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get freeTimes => $_getIZ(0);
  @$pb.TagNumber(1)
  set freeTimes($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFreeTimes() => $_has(0);
  @$pb.TagNumber(1)
  void clearFreeTimes() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalCoins => $_getI64(1);
  @$pb.TagNumber(2)
  set totalCoins($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCoins() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCoins() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get price => $_getIZ(2);
  @$pb.TagNumber(3)
  set price($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get ethnicity => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get hairStyle => $_getList(4);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get hairColor => $_getList(5);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get bodyType => $_getList(6);

  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get breastSize => $_getList(7);

  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get buttSize => $_getList(8);

  @$pb.TagNumber(10)
  $pb.PbList<$core.String> get skin => $_getList(9);

  @$pb.TagNumber(11)
  $pb.PbList<$core.String> get bodyHeight => $_getList(10);

  @$pb.TagNumber(12)
  $pb.PbList<MagicPicScene> get scene => $_getList(11);

  @$pb.TagNumber(13)
  $pb.PbList<$core.int> get num => $_getList(12);

  @$pb.TagNumber(14)
  MagicCreateReq get conf => $_getN(13);
  @$pb.TagNumber(14)
  set conf(MagicCreateReq value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasConf() => $_has(13);
  @$pb.TagNumber(14)
  void clearConf() => $_clearField(14);
  @$pb.TagNumber(14)
  MagicCreateReq ensureConf() => $_ensure(13);
}

class MagicCreateReq extends $pb.GeneratedMessage {
  factory MagicCreateReq({
    $core.String? ethnicity,
    $core.String? hairStyle,
    $core.String? hairColor,
    $core.String? bodyType,
    $core.String? breastSize,
    $core.String? buttSize,
    $core.String? skin,
    $core.String? bodyHeight,
    MagicPicScene? scene,
    $core.int? num,
  }) {
    final result = create();
    if (ethnicity != null) result.ethnicity = ethnicity;
    if (hairStyle != null) result.hairStyle = hairStyle;
    if (hairColor != null) result.hairColor = hairColor;
    if (bodyType != null) result.bodyType = bodyType;
    if (breastSize != null) result.breastSize = breastSize;
    if (buttSize != null) result.buttSize = buttSize;
    if (skin != null) result.skin = skin;
    if (bodyHeight != null) result.bodyHeight = bodyHeight;
    if (scene != null) result.scene = scene;
    if (num != null) result.num = num;
    return result;
  }

  MagicCreateReq._();

  factory MagicCreateReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MagicCreateReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MagicCreateReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'magic_pic'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ethnicity')
    ..aOS(2, _omitFieldNames ? '' : 'hairStyle')
    ..aOS(3, _omitFieldNames ? '' : 'hairColor')
    ..aOS(4, _omitFieldNames ? '' : 'bodyType')
    ..aOS(5, _omitFieldNames ? '' : 'breastSize')
    ..aOS(6, _omitFieldNames ? '' : 'buttSize')
    ..aOS(7, _omitFieldNames ? '' : 'skin')
    ..aOS(8, _omitFieldNames ? '' : 'bodyHeight')
    ..aOM<MagicPicScene>(9, _omitFieldNames ? '' : 'scene',
        subBuilder: MagicPicScene.create)
    ..aI(10, _omitFieldNames ? '' : 'num', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicCreateReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicCreateReq copyWith(void Function(MagicCreateReq) updates) =>
      super.copyWith((message) => updates(message as MagicCreateReq))
          as MagicCreateReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MagicCreateReq create() => MagicCreateReq._();
  @$core.override
  MagicCreateReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MagicCreateReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MagicCreateReq>(create);
  static MagicCreateReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ethnicity => $_getSZ(0);
  @$pb.TagNumber(1)
  set ethnicity($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEthnicity() => $_has(0);
  @$pb.TagNumber(1)
  void clearEthnicity() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get hairStyle => $_getSZ(1);
  @$pb.TagNumber(2)
  set hairStyle($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHairStyle() => $_has(1);
  @$pb.TagNumber(2)
  void clearHairStyle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get hairColor => $_getSZ(2);
  @$pb.TagNumber(3)
  set hairColor($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHairColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearHairColor() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get bodyType => $_getSZ(3);
  @$pb.TagNumber(4)
  set bodyType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBodyType() => $_has(3);
  @$pb.TagNumber(4)
  void clearBodyType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get breastSize => $_getSZ(4);
  @$pb.TagNumber(5)
  set breastSize($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBreastSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearBreastSize() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get buttSize => $_getSZ(5);
  @$pb.TagNumber(6)
  set buttSize($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasButtSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearButtSize() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get skin => $_getSZ(6);
  @$pb.TagNumber(7)
  set skin($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSkin() => $_has(6);
  @$pb.TagNumber(7)
  void clearSkin() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get bodyHeight => $_getSZ(7);
  @$pb.TagNumber(8)
  set bodyHeight($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasBodyHeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearBodyHeight() => $_clearField(8);

  @$pb.TagNumber(9)
  MagicPicScene get scene => $_getN(8);
  @$pb.TagNumber(9)
  set scene(MagicPicScene value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasScene() => $_has(8);
  @$pb.TagNumber(9)
  void clearScene() => $_clearField(9);
  @$pb.TagNumber(9)
  MagicPicScene ensureScene() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.int get num => $_getIZ(9);
  @$pb.TagNumber(10)
  set num($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasNum() => $_has(9);
  @$pb.TagNumber(10)
  void clearNum() => $_clearField(10);
}

class MagicCreateRsp extends $pb.GeneratedMessage {
  factory MagicCreateRsp({
    $core.String? taskId,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    return result;
  }

  MagicCreateRsp._();

  factory MagicCreateRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MagicCreateRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MagicCreateRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'magic_pic'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicCreateRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicCreateRsp copyWith(void Function(MagicCreateRsp) updates) =>
      super.copyWith((message) => updates(message as MagicCreateRsp))
          as MagicCreateRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MagicCreateRsp create() => MagicCreateRsp._();
  @$core.override
  MagicCreateRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MagicCreateRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MagicCreateRsp>(create);
  static MagicCreateRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);
}

class MagicCheckReq extends $pb.GeneratedMessage {
  factory MagicCheckReq({
    $core.String? taskId,
  }) {
    final result = create();
    if (taskId != null) result.taskId = taskId;
    return result;
  }

  MagicCheckReq._();

  factory MagicCheckReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MagicCheckReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MagicCheckReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'magic_pic'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicCheckReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicCheckReq copyWith(void Function(MagicCheckReq) updates) =>
      super.copyWith((message) => updates(message as MagicCheckReq))
          as MagicCheckReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MagicCheckReq create() => MagicCheckReq._();
  @$core.override
  MagicCheckReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MagicCheckReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MagicCheckReq>(create);
  static MagicCheckReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskId => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTaskId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskId() => $_clearField(1);
}

class MagicCheckRsp extends $pb.GeneratedMessage {
  factory MagicCheckRsp({
    $core.int? status,
    $core.Iterable<$core.String>? url,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (url != null) result.url.addAll(url);
    return result;
  }

  MagicCheckRsp._();

  factory MagicCheckRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MagicCheckRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MagicCheckRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'magic_pic'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'status', fieldType: $pb.PbFieldType.OU3)
    ..pPS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicCheckRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MagicCheckRsp copyWith(void Function(MagicCheckRsp) updates) =>
      super.copyWith((message) => updates(message as MagicCheckRsp))
          as MagicCheckRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MagicCheckRsp create() => MagicCheckRsp._();
  @$core.override
  MagicCheckRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MagicCheckRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MagicCheckRsp>(create);
  static MagicCheckRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get url => $_getList(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

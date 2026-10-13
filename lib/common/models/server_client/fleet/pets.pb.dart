// This is a generated file - do not edit.
//
// Generated from server_client/fleet/pets.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'base.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class PrizePoolRsp extends $pb.GeneratedMessage {
  factory PrizePoolRsp({
    $core.Iterable<Pet>? petsZone,
    $core.Iterable<$0.CommodityInfo>? commodityZone,
  }) {
    final result = create();
    if (petsZone != null) result.petsZone.addAll(petsZone);
    if (commodityZone != null) result.commodityZone.addAll(commodityZone);
    return result;
  }

  PrizePoolRsp._();

  factory PrizePoolRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrizePoolRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrizePoolRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pets'),
      createEmptyInstance: create)
    ..pPM<Pet>(1, _omitFieldNames ? '' : 'petsZone', subBuilder: Pet.create)
    ..pPM<$0.CommodityInfo>(2, _omitFieldNames ? '' : 'commodityZone',
        subBuilder: $0.CommodityInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrizePoolRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrizePoolRsp copyWith(void Function(PrizePoolRsp) updates) =>
      super.copyWith((message) => updates(message as PrizePoolRsp))
          as PrizePoolRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrizePoolRsp create() => PrizePoolRsp._();
  @$core.override
  PrizePoolRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PrizePoolRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrizePoolRsp>(create);
  static PrizePoolRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Pet> get petsZone => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$0.CommodityInfo> get commodityZone => $_getList(1);
}

class DrawPrizeReq extends $pb.GeneratedMessage {
  factory DrawPrizeReq({
    $core.int? count,
  }) {
    final result = create();
    if (count != null) result.count = count;
    return result;
  }

  DrawPrizeReq._();

  factory DrawPrizeReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DrawPrizeReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DrawPrizeReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pets'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawPrizeReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawPrizeReq copyWith(void Function(DrawPrizeReq) updates) =>
      super.copyWith((message) => updates(message as DrawPrizeReq))
          as DrawPrizeReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DrawPrizeReq create() => DrawPrizeReq._();
  @$core.override
  DrawPrizeReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DrawPrizeReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrawPrizeReq>(create);
  static DrawPrizeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);
}

class DrawPrizeRsp extends $pb.GeneratedMessage {
  factory DrawPrizeRsp({
    $core.Iterable<$0.CommodityInfo>? commodities,
    $core.Iterable<Pet>? pets,
    DrawProgress? progress,
  }) {
    final result = create();
    if (commodities != null) result.commodities.addAll(commodities);
    if (pets != null) result.pets.addAll(pets);
    if (progress != null) result.progress = progress;
    return result;
  }

  DrawPrizeRsp._();

  factory DrawPrizeRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DrawPrizeRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DrawPrizeRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pets'),
      createEmptyInstance: create)
    ..pPM<$0.CommodityInfo>(1, _omitFieldNames ? '' : 'commodities',
        subBuilder: $0.CommodityInfo.create)
    ..pPM<Pet>(2, _omitFieldNames ? '' : 'pets', subBuilder: Pet.create)
    ..aOM<DrawProgress>(3, _omitFieldNames ? '' : 'progress',
        subBuilder: DrawProgress.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawPrizeRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawPrizeRsp copyWith(void Function(DrawPrizeRsp) updates) =>
      super.copyWith((message) => updates(message as DrawPrizeRsp))
          as DrawPrizeRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DrawPrizeRsp create() => DrawPrizeRsp._();
  @$core.override
  DrawPrizeRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DrawPrizeRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrawPrizeRsp>(create);
  static DrawPrizeRsp? _defaultInstance;

  /// 所有奖品含宠物
  @$pb.TagNumber(1)
  $pb.PbList<$0.CommodityInfo> get commodities => $_getList(0);

  /// 抽到的宠物列表
  @$pb.TagNumber(2)
  $pb.PbList<Pet> get pets => $_getList(1);

  /// 抽奖进展
  @$pb.TagNumber(3)
  DrawProgress get progress => $_getN(2);
  @$pb.TagNumber(3)
  set progress(DrawProgress value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasProgress() => $_has(2);
  @$pb.TagNumber(3)
  void clearProgress() => $_clearField(3);
  @$pb.TagNumber(3)
  DrawProgress ensureProgress() => $_ensure(2);
}

class DrawProgress extends $pb.GeneratedMessage {
  factory DrawProgress({
    $core.int? drawPetTotalCount,
    $core.int? drawPetCurrentCount,
  }) {
    final result = create();
    if (drawPetTotalCount != null) result.drawPetTotalCount = drawPetTotalCount;
    if (drawPetCurrentCount != null)
      result.drawPetCurrentCount = drawPetCurrentCount;
    return result;
  }

  DrawProgress._();

  factory DrawProgress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DrawProgress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DrawProgress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pets'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'drawPetTotalCount',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'drawPetCurrentCount',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawProgress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawProgress copyWith(void Function(DrawProgress) updates) =>
      super.copyWith((message) => updates(message as DrawProgress))
          as DrawProgress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DrawProgress create() => DrawProgress._();
  @$core.override
  DrawProgress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DrawProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrawProgress>(create);
  static DrawProgress? _defaultInstance;

  /// 宠物兜底总次数
  @$pb.TagNumber(1)
  $core.int get drawPetTotalCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set drawPetTotalCount($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDrawPetTotalCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearDrawPetTotalCount() => $_clearField(1);

  /// 宠物兜底已抽次数
  @$pb.TagNumber(2)
  $core.int get drawPetCurrentCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set drawPetCurrentCount($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDrawPetCurrentCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearDrawPetCurrentCount() => $_clearField(2);
}

class DrawBtnInfo extends $pb.GeneratedMessage {
  factory DrawBtnInfo({
    $core.int? coins,
    $core.int? drawCount,
  }) {
    final result = create();
    if (coins != null) result.coins = coins;
    if (drawCount != null) result.drawCount = drawCount;
    return result;
  }

  DrawBtnInfo._();

  factory DrawBtnInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DrawBtnInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DrawBtnInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pets'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'coins', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'drawCount', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawBtnInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawBtnInfo copyWith(void Function(DrawBtnInfo) updates) =>
      super.copyWith((message) => updates(message as DrawBtnInfo))
          as DrawBtnInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DrawBtnInfo create() => DrawBtnInfo._();
  @$core.override
  DrawBtnInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DrawBtnInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrawBtnInfo>(create);
  static DrawBtnInfo? _defaultInstance;

  /// 消耗的金币数量
  @$pb.TagNumber(1)
  $core.int get coins => $_getIZ(0);
  @$pb.TagNumber(1)
  set coins($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCoins() => $_has(0);
  @$pb.TagNumber(1)
  void clearCoins() => $_clearField(1);

  /// 可以抽的次数
  @$pb.TagNumber(2)
  $core.int get drawCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set drawCount($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDrawCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearDrawCount() => $_clearField(2);
}

class DrawInfoResp extends $pb.GeneratedMessage {
  factory DrawInfoResp({
    DrawProgress? progress,
    $core.Iterable<DrawBtnInfo>? drawBtnInfos,
  }) {
    final result = create();
    if (progress != null) result.progress = progress;
    if (drawBtnInfos != null) result.drawBtnInfos.addAll(drawBtnInfos);
    return result;
  }

  DrawInfoResp._();

  factory DrawInfoResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DrawInfoResp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DrawInfoResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pets'),
      createEmptyInstance: create)
    ..aOM<DrawProgress>(1, _omitFieldNames ? '' : 'progress',
        subBuilder: DrawProgress.create)
    ..pPM<DrawBtnInfo>(2, _omitFieldNames ? '' : 'drawBtnInfos',
        subBuilder: DrawBtnInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawInfoResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DrawInfoResp copyWith(void Function(DrawInfoResp) updates) =>
      super.copyWith((message) => updates(message as DrawInfoResp))
          as DrawInfoResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DrawInfoResp create() => DrawInfoResp._();
  @$core.override
  DrawInfoResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DrawInfoResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrawInfoResp>(create);
  static DrawInfoResp? _defaultInstance;

  /// 抽奖进展
  @$pb.TagNumber(1)
  DrawProgress get progress => $_getN(0);
  @$pb.TagNumber(1)
  set progress(DrawProgress value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProgress() => $_has(0);
  @$pb.TagNumber(1)
  void clearProgress() => $_clearField(1);
  @$pb.TagNumber(1)
  DrawProgress ensureProgress() => $_ensure(0);

  /// 抽奖按钮配置
  @$pb.TagNumber(2)
  $pb.PbList<DrawBtnInfo> get drawBtnInfos => $_getList(1);
}

class PetListRsp extends $pb.GeneratedMessage {
  factory PetListRsp({
    $core.Iterable<UserPet>? pets,
  }) {
    final result = create();
    if (pets != null) result.pets.addAll(pets);
    return result;
  }

  PetListRsp._();

  factory PetListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PetListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PetListRsp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pets'),
      createEmptyInstance: create)
    ..pPM<UserPet>(1, _omitFieldNames ? '' : 'pets', subBuilder: UserPet.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PetListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PetListRsp copyWith(void Function(PetListRsp) updates) =>
      super.copyWith((message) => updates(message as PetListRsp)) as PetListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PetListRsp create() => PetListRsp._();
  @$core.override
  PetListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PetListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PetListRsp>(create);
  static PetListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserPet> get pets => $_getList(0);
}

///
///  宠物公共基础信息
class Pet extends $pb.GeneratedMessage {
  factory Pet({
    $core.String? petIdentifier,
    $core.String? name,
    $core.String? icon,
    $core.String? description,
    $core.int? level,
    $core.String? levelIcon,
    $core.int? type,
    $core.String? typeIcon,
    $core.Iterable<PetSkill>? skills,
    $core.String? idleAnimationUrl,
    $core.String? entryAnimationUrl,
    $core.bool? needMaskInPrizePool,
  }) {
    final result = create();
    if (petIdentifier != null) result.petIdentifier = petIdentifier;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (description != null) result.description = description;
    if (level != null) result.level = level;
    if (levelIcon != null) result.levelIcon = levelIcon;
    if (type != null) result.type = type;
    if (typeIcon != null) result.typeIcon = typeIcon;
    if (skills != null) result.skills.addAll(skills);
    if (idleAnimationUrl != null) result.idleAnimationUrl = idleAnimationUrl;
    if (entryAnimationUrl != null) result.entryAnimationUrl = entryAnimationUrl;
    if (needMaskInPrizePool != null)
      result.needMaskInPrizePool = needMaskInPrizePool;
    return result;
  }

  Pet._();

  factory Pet.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Pet.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Pet',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pets'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'petIdentifier')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aI(5, _omitFieldNames ? '' : 'level', fieldType: $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'levelIcon')
    ..aI(7, _omitFieldNames ? '' : 'type', fieldType: $pb.PbFieldType.OU3)
    ..aOS(8, _omitFieldNames ? '' : 'typeIcon')
    ..pPM<PetSkill>(9, _omitFieldNames ? '' : 'skills',
        subBuilder: PetSkill.create)
    ..aOS(10, _omitFieldNames ? '' : 'idleAnimationUrl')
    ..aOS(11, _omitFieldNames ? '' : 'entryAnimationUrl')
    ..aOB(12, _omitFieldNames ? '' : 'needMaskInPrizePool')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Pet clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Pet copyWith(void Function(Pet) updates) =>
      super.copyWith((message) => updates(message as Pet)) as Pet;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Pet create() => Pet._();
  @$core.override
  Pet createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Pet getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Pet>(create);
  static Pet? _defaultInstance;

  /// 宠物标识符
  @$pb.TagNumber(1)
  $core.String get petIdentifier => $_getSZ(0);
  @$pb.TagNumber(1)
  set petIdentifier($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPetIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearPetIdentifier() => $_clearField(1);

  /// 宠物名称
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// 宠物图标
  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  /// 宠物描述
  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);

  /// 宠物等级 0-R 1-SR 2-SSR
  @$pb.TagNumber(5)
  $core.int get level => $_getIZ(4);
  @$pb.TagNumber(5)
  set level($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLevel() => $_clearField(5);

  /// 等级icon
  @$pb.TagNumber(6)
  $core.String get levelIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set levelIcon($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLevelIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearLevelIcon() => $_clearField(6);

  /// 宠物元素系列：1-飞行系 2-风系 3-火系 4-水系 5-大地系
  @$pb.TagNumber(7)
  $core.int get type => $_getIZ(6);
  @$pb.TagNumber(7)
  set type($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => $_clearField(7);

  /// 宠物元素类型图标
  @$pb.TagNumber(8)
  $core.String get typeIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set typeIcon($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTypeIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearTypeIcon() => $_clearField(8);

  /// 宠物技能列表
  @$pb.TagNumber(9)
  $pb.PbList<PetSkill> get skills => $_getList(8);

  /// 待机动画
  @$pb.TagNumber(10)
  $core.String get idleAnimationUrl => $_getSZ(9);
  @$pb.TagNumber(10)
  set idleAnimationUrl($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasIdleAnimationUrl() => $_has(9);
  @$pb.TagNumber(10)
  void clearIdleAnimationUrl() => $_clearField(10);

  /// 出场动画
  @$pb.TagNumber(11)
  $core.String get entryAnimationUrl => $_getSZ(10);
  @$pb.TagNumber(11)
  set entryAnimationUrl($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasEntryAnimationUrl() => $_has(10);
  @$pb.TagNumber(11)
  void clearEntryAnimationUrl() => $_clearField(11);

  /// 奖池中的时候，是否需要遮盖
  @$pb.TagNumber(12)
  $core.bool get needMaskInPrizePool => $_getBF(11);
  @$pb.TagNumber(12)
  set needMaskInPrizePool($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasNeedMaskInPrizePool() => $_has(11);
  @$pb.TagNumber(12)
  void clearNeedMaskInPrizePool() => $_clearField(12);
}

/// *
///  用户持有的宠物
class UserPet extends $pb.GeneratedMessage {
  factory UserPet({
    $fixnum.Int64? id,
    $core.int? status,
    $core.int? source,
    Pet? pet,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (status != null) result.status = status;
    if (source != null) result.source = source;
    if (pet != null) result.pet = pet;
    return result;
  }

  UserPet._();

  factory UserPet.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserPet.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserPet',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pets'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(2, _omitFieldNames ? '' : 'status', fieldType: $pb.PbFieldType.OU3)
    ..aI(3, _omitFieldNames ? '' : 'source', fieldType: $pb.PbFieldType.OU3)
    ..aOM<Pet>(4, _omitFieldNames ? '' : 'pet', subBuilder: Pet.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserPet clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserPet copyWith(void Function(UserPet) updates) =>
      super.copyWith((message) => updates(message as UserPet)) as UserPet;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserPet create() => UserPet._();
  @$core.override
  UserPet createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserPet getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserPet>(create);
  static UserPet? _defaultInstance;

  /// 宠物ID，对应下面所有上行请求的pet_id
  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  /// 宠物状态, 0-未出战，1-已出战
  @$pb.TagNumber(2)
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(2)
  set status($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  /// 宠物来源 0-抽取 1-接收赠送
  @$pb.TagNumber(3)
  $core.int get source => $_getIZ(2);
  @$pb.TagNumber(3)
  set source($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSource() => $_has(2);
  @$pb.TagNumber(3)
  void clearSource() => $_clearField(3);

  /// 宠物基础信息
  @$pb.TagNumber(4)
  Pet get pet => $_getN(3);
  @$pb.TagNumber(4)
  set pet(Pet value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPet() => $_has(3);
  @$pb.TagNumber(4)
  void clearPet() => $_clearField(4);
  @$pb.TagNumber(4)
  Pet ensurePet() => $_ensure(3);
}

class PetSkill extends $pb.GeneratedMessage {
  factory PetSkill({
    $core.String? identifier,
    $core.int? type,
    $core.String? description,
    $core.String? icon,
  }) {
    final result = create();
    if (identifier != null) result.identifier = identifier;
    if (type != null) result.type = type;
    if (description != null) result.description = description;
    if (icon != null) result.icon = icon;
    return result;
  }

  PetSkill._();

  factory PetSkill.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PetSkill.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PetSkill',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pets'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'identifier')
    ..aI(2, _omitFieldNames ? '' : 'type', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(5, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PetSkill clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PetSkill copyWith(void Function(PetSkill) updates) =>
      super.copyWith((message) => updates(message as PetSkill)) as PetSkill;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PetSkill create() => PetSkill._();
  @$core.override
  PetSkill createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PetSkill getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PetSkill>(create);
  static PetSkill? _defaultInstance;

  /// 在技能体系中唯一
  @$pb.TagNumber(1)
  $core.String get identifier => $_getSZ(0);
  @$pb.TagNumber(1)
  set identifier($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentifier() => $_clearField(1);

  /// 技能类型：1-普通攻击，2-主动技能，3-被动技能
  @$pb.TagNumber(2)
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  /// 技能描述
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  /// 技能图标
  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(5)
  set icon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(5)
  void clearIcon() => $_clearField(5);
}

class SendPetReq extends $pb.GeneratedMessage {
  factory SendPetReq({
    $fixnum.Int64? receiverId,
    $fixnum.Int64? petId,
  }) {
    final result = create();
    if (receiverId != null) result.receiverId = receiverId;
    if (petId != null) result.petId = petId;
    return result;
  }

  SendPetReq._();

  factory SendPetReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendPetReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendPetReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pets'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'receiverId')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'petId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendPetReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendPetReq copyWith(void Function(SendPetReq) updates) =>
      super.copyWith((message) => updates(message as SendPetReq)) as SendPetReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendPetReq create() => SendPetReq._();
  @$core.override
  SendPetReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendPetReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendPetReq>(create);
  static SendPetReq? _defaultInstance;

  /// 接收人ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get receiverId => $_getI64(0);
  @$pb.TagNumber(1)
  set receiverId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReceiverId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReceiverId() => $_clearField(1);

  /// 宠物ID
  @$pb.TagNumber(2)
  $fixnum.Int64 get petId => $_getI64(1);
  @$pb.TagNumber(2)
  set petId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPetId() => $_clearField(2);
}

class SetPetParamsReq extends $pb.GeneratedMessage {
  factory SetPetParamsReq({
    $fixnum.Int64? petId,
    $core.bool? goBattle,
  }) {
    final result = create();
    if (petId != null) result.petId = petId;
    if (goBattle != null) result.goBattle = goBattle;
    return result;
  }

  SetPetParamsReq._();

  factory SetPetParamsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetPetParamsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetPetParamsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pets'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'petId', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(2, _omitFieldNames ? '' : 'goBattle')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetPetParamsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetPetParamsReq copyWith(void Function(SetPetParamsReq) updates) =>
      super.copyWith((message) => updates(message as SetPetParamsReq))
          as SetPetParamsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetPetParamsReq create() => SetPetParamsReq._();
  @$core.override
  SetPetParamsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetPetParamsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetPetParamsReq>(create);
  static SetPetParamsReq? _defaultInstance;

  /// 宠物ID
  @$pb.TagNumber(1)
  $fixnum.Int64 get petId => $_getI64(0);
  @$pb.TagNumber(1)
  set petId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPetId() => $_clearField(1);

  /// 是否出战
  @$pb.TagNumber(2)
  $core.bool get goBattle => $_getBF(1);
  @$pb.TagNumber(2)
  set goBattle($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGoBattle() => $_has(1);
  @$pb.TagNumber(2)
  void clearGoBattle() => $_clearField(2);
}

class SendPetMsg extends $pb.GeneratedMessage {
  factory SendPetMsg({
    $core.String? name,
    $core.String? icon,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    return result;
  }

  SendPetMsg._();

  factory SendPetMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendPetMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendPetMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'fleet.pets'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendPetMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendPetMsg copyWith(void Function(SendPetMsg) updates) =>
      super.copyWith((message) => updates(message as SendPetMsg)) as SendPetMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendPetMsg create() => SendPetMsg._();
  @$core.override
  SendPetMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendPetMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendPetMsg>(create);
  static SendPetMsg? _defaultInstance;

  /// 宠物名称
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// 宠物图标
  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

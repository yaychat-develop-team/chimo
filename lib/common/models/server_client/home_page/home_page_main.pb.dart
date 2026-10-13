// This is a generated file - do not edit.
//
// Generated from server_client/home_page/home_page_main.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../message.pb.dart' as $0;
import '../rtc.pb.dart' as $2;
import 'home_page_bean.pb.dart' as $1;
import 'home_page_main.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'home_page_main.pbenum.dart';

class HomeMainData extends $pb.GeneratedMessage {
  factory HomeMainData({
    HomeGameInfo? gameInfo,
    $core.Iterable<HomeBannerItem>? banners,
    $core.Iterable<HomeTabItem>? tabs,
    HomeConfig? config,
  }) {
    final result = create();
    if (gameInfo != null) result.gameInfo = gameInfo;
    if (banners != null) result.banners.addAll(banners);
    if (tabs != null) result.tabs.addAll(tabs);
    if (config != null) result.config = config;
    return result;
  }

  HomeMainData._();

  factory HomeMainData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomeMainData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomeMainData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_main'),
      createEmptyInstance: create)
    ..aOM<HomeGameInfo>(1, _omitFieldNames ? '' : 'gameInfo',
        subBuilder: HomeGameInfo.create)
    ..pPM<HomeBannerItem>(2, _omitFieldNames ? '' : 'banners',
        subBuilder: HomeBannerItem.create)
    ..pPM<HomeTabItem>(3, _omitFieldNames ? '' : 'tabs',
        subBuilder: HomeTabItem.create)
    ..aOM<HomeConfig>(4, _omitFieldNames ? '' : 'config',
        subBuilder: HomeConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeMainData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeMainData copyWith(void Function(HomeMainData) updates) =>
      super.copyWith((message) => updates(message as HomeMainData))
          as HomeMainData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeMainData create() => HomeMainData._();
  @$core.override
  HomeMainData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomeMainData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeMainData>(create);
  static HomeMainData? _defaultInstance;

  @$pb.TagNumber(1)
  HomeGameInfo get gameInfo => $_getN(0);
  @$pb.TagNumber(1)
  set gameInfo(HomeGameInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGameInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  HomeGameInfo ensureGameInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<HomeBannerItem> get banners => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<HomeTabItem> get tabs => $_getList(2);

  @$pb.TagNumber(4)
  HomeConfig get config => $_getN(3);
  @$pb.TagNumber(4)
  set config(HomeConfig value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasConfig() => $_has(3);
  @$pb.TagNumber(4)
  void clearConfig() => $_clearField(4);
  @$pb.TagNumber(4)
  HomeConfig ensureConfig() => $_ensure(3);
}

class HomeTabItem extends $pb.GeneratedMessage {
  factory HomeTabItem({
    $core.String? id,
    $core.String? name,
    HomeTabItem_Type? type,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    return result;
  }

  HomeTabItem._();

  factory HomeTabItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomeTabItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomeTabItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_main'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aE<HomeTabItem_Type>(3, _omitFieldNames ? '' : 'type',
        enumValues: HomeTabItem_Type.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeTabItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeTabItem copyWith(void Function(HomeTabItem) updates) =>
      super.copyWith((message) => updates(message as HomeTabItem))
          as HomeTabItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeTabItem create() => HomeTabItem._();
  @$core.override
  HomeTabItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomeTabItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeTabItem>(create);
  static HomeTabItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  HomeTabItem_Type get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(HomeTabItem_Type value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);
}

class HomeGameInfo extends $pb.GeneratedMessage {
  factory HomeGameInfo({
    $core.String? title,
    $core.Iterable<HomeGameItem>? gameList,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (gameList != null) result.gameList.addAll(gameList);
    return result;
  }

  HomeGameInfo._();

  factory HomeGameInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomeGameInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomeGameInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_main'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..pPM<HomeGameItem>(2, _omitFieldNames ? '' : 'gameList',
        subBuilder: HomeGameItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeGameInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeGameInfo copyWith(void Function(HomeGameInfo) updates) =>
      super.copyWith((message) => updates(message as HomeGameInfo))
          as HomeGameInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeGameInfo create() => HomeGameInfo._();
  @$core.override
  HomeGameInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomeGameInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeGameInfo>(create);
  static HomeGameInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<HomeGameItem> get gameList => $_getList(1);
}

class HomeGameItem extends $pb.GeneratedMessage {
  factory HomeGameItem({
    HomeGameItem_Type? type,
    $core.String? icon,
    $core.String? url,
    $core.String? name,
    WebGameConfig? webGameConf,
    $core.int? id,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (icon != null) result.icon = icon;
    if (url != null) result.url = url;
    if (name != null) result.name = name;
    if (webGameConf != null) result.webGameConf = webGameConf;
    if (id != null) result.id = id;
    return result;
  }

  HomeGameItem._();

  factory HomeGameItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomeGameItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomeGameItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_main'),
      createEmptyInstance: create)
    ..aE<HomeGameItem_Type>(1, _omitFieldNames ? '' : 'type',
        enumValues: HomeGameItem_Type.values)
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOM<WebGameConfig>(5, _omitFieldNames ? '' : 'webGameConf',
        subBuilder: WebGameConfig.create)
    ..aI(6, _omitFieldNames ? '' : 'id', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeGameItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeGameItem copyWith(void Function(HomeGameItem) updates) =>
      super.copyWith((message) => updates(message as HomeGameItem))
          as HomeGameItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeGameItem create() => HomeGameItem._();
  @$core.override
  HomeGameItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomeGameItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeGameItem>(create);
  static HomeGameItem? _defaultInstance;

  @$pb.TagNumber(1)
  HomeGameItem_Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(HomeGameItem_Type value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  @$pb.TagNumber(5)
  WebGameConfig get webGameConf => $_getN(4);
  @$pb.TagNumber(5)
  set webGameConf(WebGameConfig value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasWebGameConf() => $_has(4);
  @$pb.TagNumber(5)
  void clearWebGameConf() => $_clearField(5);
  @$pb.TagNumber(5)
  WebGameConfig ensureWebGameConf() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get id => $_getIZ(5);
  @$pb.TagNumber(6)
  set id($core.int value) => $_setUnsignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasId() => $_has(5);
  @$pb.TagNumber(6)
  void clearId() => $_clearField(6);
}

class HomeBannerItem extends $pb.GeneratedMessage {
  factory HomeBannerItem({
    HomeBannerItem_Type? type,
    $core.String? img1,
    $core.String? img2,
    $core.Iterable<$0.ShowItem>? showItems,
    $fixnum.Int64? time,
    $core.String? link,
    $core.String? name1,
    $core.String? name2,
    $core.String? giftIcon,
    $core.int? giftNum,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (img1 != null) result.img1 = img1;
    if (img2 != null) result.img2 = img2;
    if (showItems != null) result.showItems.addAll(showItems);
    if (time != null) result.time = time;
    if (link != null) result.link = link;
    if (name1 != null) result.name1 = name1;
    if (name2 != null) result.name2 = name2;
    if (giftIcon != null) result.giftIcon = giftIcon;
    if (giftNum != null) result.giftNum = giftNum;
    return result;
  }

  HomeBannerItem._();

  factory HomeBannerItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomeBannerItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomeBannerItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_main'),
      createEmptyInstance: create)
    ..aE<HomeBannerItem_Type>(1, _omitFieldNames ? '' : 'type',
        enumValues: HomeBannerItem_Type.values)
    ..aOS(2, _omitFieldNames ? '' : 'img1')
    ..aOS(3, _omitFieldNames ? '' : 'img2')
    ..pPM<$0.ShowItem>(4, _omitFieldNames ? '' : 'showItems',
        subBuilder: $0.ShowItem.create)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : 'link')
    ..aOS(7, _omitFieldNames ? '' : 'name1')
    ..aOS(8, _omitFieldNames ? '' : 'name2')
    ..aOS(9, _omitFieldNames ? '' : 'giftIcon')
    ..aI(10, _omitFieldNames ? '' : 'giftNum')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeBannerItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeBannerItem copyWith(void Function(HomeBannerItem) updates) =>
      super.copyWith((message) => updates(message as HomeBannerItem))
          as HomeBannerItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeBannerItem create() => HomeBannerItem._();
  @$core.override
  HomeBannerItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomeBannerItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeBannerItem>(create);
  static HomeBannerItem? _defaultInstance;

  @$pb.TagNumber(1)
  HomeBannerItem_Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(HomeBannerItem_Type value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get img1 => $_getSZ(1);
  @$pb.TagNumber(2)
  set img1($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasImg1() => $_has(1);
  @$pb.TagNumber(2)
  void clearImg1() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get img2 => $_getSZ(2);
  @$pb.TagNumber(3)
  set img2($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasImg2() => $_has(2);
  @$pb.TagNumber(3)
  void clearImg2() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$0.ShowItem> get showItems => $_getList(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get time => $_getI64(4);
  @$pb.TagNumber(5)
  set time($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get link => $_getSZ(5);
  @$pb.TagNumber(6)
  set link($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLink() => $_has(5);
  @$pb.TagNumber(6)
  void clearLink() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get name1 => $_getSZ(6);
  @$pb.TagNumber(7)
  set name1($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasName1() => $_has(6);
  @$pb.TagNumber(7)
  void clearName1() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get name2 => $_getSZ(7);
  @$pb.TagNumber(8)
  set name2($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasName2() => $_has(7);
  @$pb.TagNumber(8)
  void clearName2() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get giftIcon => $_getSZ(8);
  @$pb.TagNumber(9)
  set giftIcon($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasGiftIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearGiftIcon() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get giftNum => $_getIZ(9);
  @$pb.TagNumber(10)
  set giftNum($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasGiftNum() => $_has(9);
  @$pb.TagNumber(10)
  void clearGiftNum() => $_clearField(10);
}

class HomePageListData extends $pb.GeneratedMessage {
  factory HomePageListData({
    $core.int? pageSize,
    $core.int? pageNum,
    $core.String? snapshotId,
    $core.Iterable<HomeListItem>? items,
  }) {
    final result = create();
    if (pageSize != null) result.pageSize = pageSize;
    if (pageNum != null) result.pageNum = pageNum;
    if (snapshotId != null) result.snapshotId = snapshotId;
    if (items != null) result.items.addAll(items);
    return result;
  }

  HomePageListData._();

  factory HomePageListData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomePageListData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomePageListData',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_main'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'pageSize')
    ..aI(2, _omitFieldNames ? '' : 'pageNum')
    ..aOS(3, _omitFieldNames ? '' : 'snapshotId')
    ..pPM<HomeListItem>(5, _omitFieldNames ? '' : 'items',
        subBuilder: HomeListItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageListData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageListData copyWith(void Function(HomePageListData) updates) =>
      super.copyWith((message) => updates(message as HomePageListData))
          as HomePageListData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomePageListData create() => HomePageListData._();
  @$core.override
  HomePageListData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomePageListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomePageListData>(create);
  static HomePageListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageNum($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPageNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageNum() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get snapshotId => $_getSZ(2);
  @$pb.TagNumber(3)
  set snapshotId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSnapshotId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSnapshotId() => $_clearField(3);

  @$pb.TagNumber(5)
  $pb.PbList<HomeListItem> get items => $_getList(3);
}

enum HomeListItem_Data { room, user, notSet }

class HomeListItem extends $pb.GeneratedMessage {
  factory HomeListItem({
    HomeRoomItem? room,
    $1.HomePageUserInfo? user,
  }) {
    final result = create();
    if (room != null) result.room = room;
    if (user != null) result.user = user;
    return result;
  }

  HomeListItem._();

  factory HomeListItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomeListItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, HomeListItem_Data> _HomeListItem_DataByTag =
      {
    1: HomeListItem_Data.room,
    2: HomeListItem_Data.user,
    0: HomeListItem_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomeListItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_main'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<HomeRoomItem>(1, _omitFieldNames ? '' : 'room',
        subBuilder: HomeRoomItem.create)
    ..aOM<$1.HomePageUserInfo>(2, _omitFieldNames ? '' : 'user',
        subBuilder: $1.HomePageUserInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeListItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeListItem copyWith(void Function(HomeListItem) updates) =>
      super.copyWith((message) => updates(message as HomeListItem))
          as HomeListItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeListItem create() => HomeListItem._();
  @$core.override
  HomeListItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomeListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeListItem>(create);
  static HomeListItem? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  HomeListItem_Data whichData() => _HomeListItem_DataByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearData() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  HomeRoomItem get room => $_getN(0);
  @$pb.TagNumber(1)
  set room(HomeRoomItem value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => $_clearField(1);
  @$pb.TagNumber(1)
  HomeRoomItem ensureRoom() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.HomePageUserInfo get user => $_getN(1);
  @$pb.TagNumber(2)
  set user($1.HomePageUserInfo value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.HomePageUserInfo ensureUser() => $_ensure(1);
}

class HomeRoomItemUserList extends $pb.GeneratedMessage {
  factory HomeRoomItemUserList({
    $fixnum.Int64? uid,
    $core.String? icon,
  }) {
    final result = create();
    if (uid != null) result.uid = uid;
    if (icon != null) result.icon = icon;
    return result;
  }

  HomeRoomItemUserList._();

  factory HomeRoomItemUserList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomeRoomItemUserList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomeRoomItemUserList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_main'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeRoomItemUserList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeRoomItemUserList copyWith(void Function(HomeRoomItemUserList) updates) =>
      super.copyWith((message) => updates(message as HomeRoomItemUserList))
          as HomeRoomItemUserList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeRoomItemUserList create() => HomeRoomItemUserList._();
  @$core.override
  HomeRoomItemUserList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomeRoomItemUserList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeRoomItemUserList>(create);
  static HomeRoomItemUserList? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => $_clearField(2);
}

class HomeRoomItemGameInfo extends $pb.GeneratedMessage {
  factory HomeRoomItemGameInfo({
    $core.int? totalPlayer,
    $core.int? totalSeat,
    $core.String? gameIcon,
    $core.String? gameName,
    $core.String? gameId,
    $core.String? gameStatus,
  }) {
    final result = create();
    if (totalPlayer != null) result.totalPlayer = totalPlayer;
    if (totalSeat != null) result.totalSeat = totalSeat;
    if (gameIcon != null) result.gameIcon = gameIcon;
    if (gameName != null) result.gameName = gameName;
    if (gameId != null) result.gameId = gameId;
    if (gameStatus != null) result.gameStatus = gameStatus;
    return result;
  }

  HomeRoomItemGameInfo._();

  factory HomeRoomItemGameInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomeRoomItemGameInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomeRoomItemGameInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_main'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'totalPlayer',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'totalSeat', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'gameIcon')
    ..aOS(4, _omitFieldNames ? '' : 'gameName')
    ..aOS(5, _omitFieldNames ? '' : 'gameId')
    ..aOS(6, _omitFieldNames ? '' : 'gameStatus')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeRoomItemGameInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeRoomItemGameInfo copyWith(void Function(HomeRoomItemGameInfo) updates) =>
      super.copyWith((message) => updates(message as HomeRoomItemGameInfo))
          as HomeRoomItemGameInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeRoomItemGameInfo create() => HomeRoomItemGameInfo._();
  @$core.override
  HomeRoomItemGameInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomeRoomItemGameInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeRoomItemGameInfo>(create);
  static HomeRoomItemGameInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalPlayer => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalPlayer($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalPlayer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalPlayer() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalSeat => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalSeat($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalSeat() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalSeat() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get gameIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set gameIcon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGameIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get gameName => $_getSZ(3);
  @$pb.TagNumber(4)
  set gameName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGameName() => $_has(3);
  @$pb.TagNumber(4)
  void clearGameName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get gameId => $_getSZ(4);
  @$pb.TagNumber(5)
  set gameId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGameId() => $_has(4);
  @$pb.TagNumber(5)
  void clearGameId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get gameStatus => $_getSZ(5);
  @$pb.TagNumber(6)
  set gameStatus($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGameStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearGameStatus() => $_clearField(6);
}

class HomeRoomItem extends $pb.GeneratedMessage {
  factory HomeRoomItem({
    $fixnum.Int64? rid,
    $core.String? name,
    $core.String? icon,
    $core.int? hot,
    $core.String? label,
    $core.Iterable<HomeRoomItemUserList>? userList,
    $core.String? roomOwnerName,
    $fixnum.Int64? roomOwnerUid,
    HomeRoomItemGameInfo? gameInfo,
    $2.StoryInfo? storyInfo,
    $core.String? roomOwnerAvatar,
    $core.String? cardBackgroundUrl,
    $fixnum.Int64? crownUid,
    $core.String? crownName,
  }) {
    final result = create();
    if (rid != null) result.rid = rid;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (hot != null) result.hot = hot;
    if (label != null) result.label = label;
    if (userList != null) result.userList.addAll(userList);
    if (roomOwnerName != null) result.roomOwnerName = roomOwnerName;
    if (roomOwnerUid != null) result.roomOwnerUid = roomOwnerUid;
    if (gameInfo != null) result.gameInfo = gameInfo;
    if (storyInfo != null) result.storyInfo = storyInfo;
    if (roomOwnerAvatar != null) result.roomOwnerAvatar = roomOwnerAvatar;
    if (cardBackgroundUrl != null) result.cardBackgroundUrl = cardBackgroundUrl;
    if (crownUid != null) result.crownUid = crownUid;
    if (crownName != null) result.crownName = crownName;
    return result;
  }

  HomeRoomItem._();

  factory HomeRoomItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomeRoomItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomeRoomItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_main'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'rid')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'icon')
    ..aI(4, _omitFieldNames ? '' : 'hot')
    ..aOS(5, _omitFieldNames ? '' : 'label')
    ..pPM<HomeRoomItemUserList>(6, _omitFieldNames ? '' : 'userList',
        subBuilder: HomeRoomItemUserList.create)
    ..aOS(7, _omitFieldNames ? '' : 'roomOwnerName')
    ..aInt64(8, _omitFieldNames ? '' : 'roomOwnerUid')
    ..aOM<HomeRoomItemGameInfo>(9, _omitFieldNames ? '' : 'gameInfo',
        subBuilder: HomeRoomItemGameInfo.create)
    ..aOM<$2.StoryInfo>(10, _omitFieldNames ? '' : 'storyInfo',
        subBuilder: $2.StoryInfo.create)
    ..aOS(11, _omitFieldNames ? '' : 'roomOwnerAvatar')
    ..aOS(12, _omitFieldNames ? '' : 'cardBackgroundUrl')
    ..aInt64(13, _omitFieldNames ? '' : 'crownUid')
    ..aOS(14, _omitFieldNames ? '' : 'crownName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeRoomItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeRoomItem copyWith(void Function(HomeRoomItem) updates) =>
      super.copyWith((message) => updates(message as HomeRoomItem))
          as HomeRoomItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeRoomItem create() => HomeRoomItem._();
  @$core.override
  HomeRoomItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomeRoomItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeRoomItem>(create);
  static HomeRoomItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get rid => $_getI64(0);
  @$pb.TagNumber(1)
  set rid($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get hot => $_getIZ(3);
  @$pb.TagNumber(4)
  set hot($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHot() => $_has(3);
  @$pb.TagNumber(4)
  void clearHot() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get label => $_getSZ(4);
  @$pb.TagNumber(5)
  set label($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLabel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLabel() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<HomeRoomItemUserList> get userList => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get roomOwnerName => $_getSZ(6);
  @$pb.TagNumber(7)
  set roomOwnerName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRoomOwnerName() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoomOwnerName() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get roomOwnerUid => $_getI64(7);
  @$pb.TagNumber(8)
  set roomOwnerUid($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRoomOwnerUid() => $_has(7);
  @$pb.TagNumber(8)
  void clearRoomOwnerUid() => $_clearField(8);

  @$pb.TagNumber(9)
  HomeRoomItemGameInfo get gameInfo => $_getN(8);
  @$pb.TagNumber(9)
  set gameInfo(HomeRoomItemGameInfo value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasGameInfo() => $_has(8);
  @$pb.TagNumber(9)
  void clearGameInfo() => $_clearField(9);
  @$pb.TagNumber(9)
  HomeRoomItemGameInfo ensureGameInfo() => $_ensure(8);

  @$pb.TagNumber(10)
  $2.StoryInfo get storyInfo => $_getN(9);
  @$pb.TagNumber(10)
  set storyInfo($2.StoryInfo value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasStoryInfo() => $_has(9);
  @$pb.TagNumber(10)
  void clearStoryInfo() => $_clearField(10);
  @$pb.TagNumber(10)
  $2.StoryInfo ensureStoryInfo() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get roomOwnerAvatar => $_getSZ(10);
  @$pb.TagNumber(11)
  set roomOwnerAvatar($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasRoomOwnerAvatar() => $_has(10);
  @$pb.TagNumber(11)
  void clearRoomOwnerAvatar() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get cardBackgroundUrl => $_getSZ(11);
  @$pb.TagNumber(12)
  set cardBackgroundUrl($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasCardBackgroundUrl() => $_has(11);
  @$pb.TagNumber(12)
  void clearCardBackgroundUrl() => $_clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get crownUid => $_getI64(12);
  @$pb.TagNumber(13)
  set crownUid($fixnum.Int64 value) => $_setInt64(12, value);
  @$pb.TagNumber(13)
  $core.bool hasCrownUid() => $_has(12);
  @$pb.TagNumber(13)
  void clearCrownUid() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get crownName => $_getSZ(13);
  @$pb.TagNumber(14)
  set crownName($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasCrownName() => $_has(13);
  @$pb.TagNumber(14)
  void clearCrownName() => $_clearField(14);
}

class WebGameConfig extends $pb.GeneratedMessage {
  factory WebGameConfig({
    $core.int? id,
    $core.String? name,
    $core.String? cover,
    $core.int? versionCode,
    $core.String? resUrl,
    $core.String? uniqueName,
    $core.String? sitePath,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (cover != null) result.cover = cover;
    if (versionCode != null) result.versionCode = versionCode;
    if (resUrl != null) result.resUrl = resUrl;
    if (uniqueName != null) result.uniqueName = uniqueName;
    if (sitePath != null) result.sitePath = sitePath;
    return result;
  }

  WebGameConfig._();

  factory WebGameConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WebGameConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WebGameConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_main'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id', fieldType: $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'cover')
    ..aI(4, _omitFieldNames ? '' : 'versionCode',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(5, _omitFieldNames ? '' : 'resUrl')
    ..aOS(6, _omitFieldNames ? '' : 'uniqueName')
    ..aOS(7, _omitFieldNames ? '' : 'sitePath')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebGameConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebGameConfig copyWith(void Function(WebGameConfig) updates) =>
      super.copyWith((message) => updates(message as WebGameConfig))
          as WebGameConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WebGameConfig create() => WebGameConfig._();
  @$core.override
  WebGameConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WebGameConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WebGameConfig>(create);
  static WebGameConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get cover => $_getSZ(2);
  @$pb.TagNumber(3)
  set cover($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCover() => $_has(2);
  @$pb.TagNumber(3)
  void clearCover() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get versionCode => $_getIZ(3);
  @$pb.TagNumber(4)
  set versionCode($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVersionCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearVersionCode() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get resUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set resUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasResUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearResUrl() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get uniqueName => $_getSZ(5);
  @$pb.TagNumber(6)
  set uniqueName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasUniqueName() => $_has(5);
  @$pb.TagNumber(6)
  void clearUniqueName() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get sitePath => $_getSZ(6);
  @$pb.TagNumber(7)
  set sitePath($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSitePath() => $_has(6);
  @$pb.TagNumber(7)
  void clearSitePath() => $_clearField(7);
}

class WebGameConfigList extends $pb.GeneratedMessage {
  factory WebGameConfigList({
    $core.Iterable<WebGameConfig>? list,
  }) {
    final result = create();
    if (list != null) result.list.addAll(list);
    return result;
  }

  WebGameConfigList._();

  factory WebGameConfigList.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WebGameConfigList.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WebGameConfigList',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_main'),
      createEmptyInstance: create)
    ..pPM<WebGameConfig>(1, _omitFieldNames ? '' : 'list',
        subBuilder: WebGameConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebGameConfigList clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebGameConfigList copyWith(void Function(WebGameConfigList) updates) =>
      super.copyWith((message) => updates(message as WebGameConfigList))
          as WebGameConfigList;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WebGameConfigList create() => WebGameConfigList._();
  @$core.override
  WebGameConfigList createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WebGameConfigList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WebGameConfigList>(create);
  static WebGameConfigList? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WebGameConfig> get list => $_getList(0);
}

class HomeConfig extends $pb.GeneratedMessage {
  factory HomeConfig({
    $core.String? effect,
    $core.String? bg,
    $core.String? tabBg,
    $core.Iterable<HomeTabIcon>? tabIcons,
  }) {
    final result = create();
    if (effect != null) result.effect = effect;
    if (bg != null) result.bg = bg;
    if (tabBg != null) result.tabBg = tabBg;
    if (tabIcons != null) result.tabIcons.addAll(tabIcons);
    return result;
  }

  HomeConfig._();

  factory HomeConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomeConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomeConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_main'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'effect')
    ..aOS(2, _omitFieldNames ? '' : 'bg')
    ..aOS(3, _omitFieldNames ? '' : 'tabBg')
    ..pPM<HomeTabIcon>(4, _omitFieldNames ? '' : 'tabIcons',
        subBuilder: HomeTabIcon.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeConfig copyWith(void Function(HomeConfig) updates) =>
      super.copyWith((message) => updates(message as HomeConfig)) as HomeConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeConfig create() => HomeConfig._();
  @$core.override
  HomeConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomeConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeConfig>(create);
  static HomeConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get effect => $_getSZ(0);
  @$pb.TagNumber(1)
  set effect($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEffect() => $_has(0);
  @$pb.TagNumber(1)
  void clearEffect() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get bg => $_getSZ(1);
  @$pb.TagNumber(2)
  set bg($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBg() => $_has(1);
  @$pb.TagNumber(2)
  void clearBg() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get tabBg => $_getSZ(2);
  @$pb.TagNumber(3)
  set tabBg($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTabBg() => $_has(2);
  @$pb.TagNumber(3)
  void clearTabBg() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<HomeTabIcon> get tabIcons => $_getList(3);
}

class HomeTabIcon extends $pb.GeneratedMessage {
  factory HomeTabIcon({
    $core.String? normal,
    $core.String? selected,
    $core.String? name,
    HomePageType? type,
    $core.double? size,
  }) {
    final result = create();
    if (normal != null) result.normal = normal;
    if (selected != null) result.selected = selected;
    if (name != null) result.name = name;
    if (type != null) result.type = type;
    if (size != null) result.size = size;
    return result;
  }

  HomeTabIcon._();

  factory HomeTabIcon.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomeTabIcon.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomeTabIcon',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'home_page_main'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'normal')
    ..aOS(2, _omitFieldNames ? '' : 'selected')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aE<HomePageType>(4, _omitFieldNames ? '' : 'type',
        enumValues: HomePageType.values)
    ..aD(5, _omitFieldNames ? '' : 'size')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeTabIcon clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomeTabIcon copyWith(void Function(HomeTabIcon) updates) =>
      super.copyWith((message) => updates(message as HomeTabIcon))
          as HomeTabIcon;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomeTabIcon create() => HomeTabIcon._();
  @$core.override
  HomeTabIcon createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomeTabIcon getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeTabIcon>(create);
  static HomeTabIcon? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get normal => $_getSZ(0);
  @$pb.TagNumber(1)
  set normal($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNormal() => $_has(0);
  @$pb.TagNumber(1)
  void clearNormal() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get selected => $_getSZ(1);
  @$pb.TagNumber(2)
  set selected($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSelected() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelected() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  HomePageType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type(HomePageType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get size => $_getN(4);
  @$pb.TagNumber(5)
  set size($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearSize() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

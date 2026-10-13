// This is a generated file - do not edit.
//
// Generated from server_client/home_page/home_page_abundant.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'home_page_bean.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// 获取主页富媒体卡片
class HomePageAbundantCardListReq extends $pb.GeneratedMessage {
  factory HomePageAbundantCardListReq({
    $core.int? count,
    $0.VideoRate? rate,
  }) {
    final result = create();
    if (count != null) result.count = count;
    if (rate != null) result.rate = rate;
    return result;
  }

  HomePageAbundantCardListReq._();

  factory HomePageAbundantCardListReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomePageAbundantCardListReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomePageAbundantCardListReq',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'home_page_abundant'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count')
    ..aE<$0.VideoRate>(2, _omitFieldNames ? '' : 'rate',
        enumValues: $0.VideoRate.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageAbundantCardListReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageAbundantCardListReq copyWith(
          void Function(HomePageAbundantCardListReq) updates) =>
      super.copyWith(
              (message) => updates(message as HomePageAbundantCardListReq))
          as HomePageAbundantCardListReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomePageAbundantCardListReq create() =>
      HomePageAbundantCardListReq._();
  @$core.override
  HomePageAbundantCardListReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomePageAbundantCardListReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomePageAbundantCardListReq>(create);
  static HomePageAbundantCardListReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.VideoRate get rate => $_getN(1);
  @$pb.TagNumber(2)
  set rate($0.VideoRate value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRate() => $_has(1);
  @$pb.TagNumber(2)
  void clearRate() => $_clearField(2);
}

class HomePageAbundantCardListRsp extends $pb.GeneratedMessage {
  factory HomePageAbundantCardListRsp({
    $core.int? totalCount,
    $core.Iterable<HomePageAbundantCard>? cards,
  }) {
    final result = create();
    if (totalCount != null) result.totalCount = totalCount;
    if (cards != null) result.cards.addAll(cards);
    return result;
  }

  HomePageAbundantCardListRsp._();

  factory HomePageAbundantCardListRsp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomePageAbundantCardListRsp.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomePageAbundantCardListRsp',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'home_page_abundant'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'totalCount')
    ..pPM<HomePageAbundantCard>(2, _omitFieldNames ? '' : 'cards',
        subBuilder: HomePageAbundantCard.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageAbundantCardListRsp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageAbundantCardListRsp copyWith(
          void Function(HomePageAbundantCardListRsp) updates) =>
      super.copyWith(
              (message) => updates(message as HomePageAbundantCardListRsp))
          as HomePageAbundantCardListRsp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomePageAbundantCardListRsp create() =>
      HomePageAbundantCardListRsp._();
  @$core.override
  HomePageAbundantCardListRsp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomePageAbundantCardListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomePageAbundantCardListRsp>(create);
  static HomePageAbundantCardListRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalCount($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<HomePageAbundantCard> get cards => $_getList(1);
}

/// *
///  富媒体卡片数据
class HomePageAbundantCard extends $pb.GeneratedMessage {
  factory HomePageAbundantCard({
    $0.HomePageUserInfo? userInfo,
    $core.String? albumUri,
    $0.ResourceType? abundantType,
    $core.String? abundantUri,
  }) {
    final result = create();
    if (userInfo != null) result.userInfo = userInfo;
    if (albumUri != null) result.albumUri = albumUri;
    if (abundantType != null) result.abundantType = abundantType;
    if (abundantUri != null) result.abundantUri = abundantUri;
    return result;
  }

  HomePageAbundantCard._();

  factory HomePageAbundantCard.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HomePageAbundantCard.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HomePageAbundantCard',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'home_page_abundant'),
      createEmptyInstance: create)
    ..aOM<$0.HomePageUserInfo>(1, _omitFieldNames ? '' : 'userInfo',
        subBuilder: $0.HomePageUserInfo.create)
    ..aOS(2, _omitFieldNames ? '' : 'albumUri')
    ..aE<$0.ResourceType>(3, _omitFieldNames ? '' : 'abundantType',
        enumValues: $0.ResourceType.values)
    ..aOS(4, _omitFieldNames ? '' : 'abundantUri')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageAbundantCard clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HomePageAbundantCard copyWith(void Function(HomePageAbundantCard) updates) =>
      super.copyWith((message) => updates(message as HomePageAbundantCard))
          as HomePageAbundantCard;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HomePageAbundantCard create() => HomePageAbundantCard._();
  @$core.override
  HomePageAbundantCard createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HomePageAbundantCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomePageAbundantCard>(create);
  static HomePageAbundantCard? _defaultInstance;

  @$pb.TagNumber(1)
  $0.HomePageUserInfo get userInfo => $_getN(0);
  @$pb.TagNumber(1)
  set userInfo($0.HomePageUserInfo value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUserInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.HomePageUserInfo ensureUserInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get albumUri => $_getSZ(1);
  @$pb.TagNumber(2)
  set albumUri($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAlbumUri() => $_has(1);
  @$pb.TagNumber(2)
  void clearAlbumUri() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.ResourceType get abundantType => $_getN(2);
  @$pb.TagNumber(3)
  set abundantType($0.ResourceType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAbundantType() => $_has(2);
  @$pb.TagNumber(3)
  void clearAbundantType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get abundantUri => $_getSZ(3);
  @$pb.TagNumber(4)
  set abundantUri($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAbundantUri() => $_has(3);
  @$pb.TagNumber(4)
  void clearAbundantUri() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');

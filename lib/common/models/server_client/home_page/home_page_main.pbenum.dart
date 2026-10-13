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

import 'package:protobuf/protobuf.dart' as $pb;

class HomePageType extends $pb.ProtobufEnum {
  static const HomePageType unknown =
      HomePageType._(0, _omitEnumNames ? '' : 'unknown');
  static const HomePageType home =
      HomePageType._(1, _omitEnumNames ? '' : 'home');
  static const HomePageType fleet =
      HomePageType._(2, _omitEnumNames ? '' : 'fleet');
  static const HomePageType chatting =
      HomePageType._(3, _omitEnumNames ? '' : 'chatting');
  static const HomePageType mine =
      HomePageType._(4, _omitEnumNames ? '' : 'mine');
  static const HomePageType video =
      HomePageType._(5, _omitEnumNames ? '' : 'video');
  static const HomePageType find =
      HomePageType._(6, _omitEnumNames ? '' : 'find');
  static const HomePageType live =
      HomePageType._(7, _omitEnumNames ? '' : 'live');

  static const $core.List<HomePageType> values = <HomePageType>[
    unknown,
    home,
    fleet,
    chatting,
    mine,
    video,
    find,
    live,
  ];

  static final $core.List<HomePageType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 7);
  static HomePageType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const HomePageType._(super.value, super.name);
}

class HomeTabItem_Type extends $pb.ProtobufEnum {
  static const HomeTabItem_Type unknown =
      HomeTabItem_Type._(0, _omitEnumNames ? '' : 'unknown');
  static const HomeTabItem_Type room =
      HomeTabItem_Type._(1, _omitEnumNames ? '' : 'room');
  static const HomeTabItem_Type user =
      HomeTabItem_Type._(2, _omitEnumNames ? '' : 'user');
  static const HomeTabItem_Type game =
      HomeTabItem_Type._(3, _omitEnumNames ? '' : 'game');

  static const $core.List<HomeTabItem_Type> values = <HomeTabItem_Type>[
    unknown,
    room,
    user,
    game,
  ];

  static final $core.List<HomeTabItem_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static HomeTabItem_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const HomeTabItem_Type._(super.value, super.name);
}

class HomeGameItem_Type extends $pb.ProtobufEnum {
  static const HomeGameItem_Type unknown =
      HomeGameItem_Type._(0, _omitEnumNames ? '' : 'unknown');
  static const HomeGameItem_Type schema =
      HomeGameItem_Type._(1, _omitEnumNames ? '' : 'schema');
  static const HomeGameItem_Type game =
      HomeGameItem_Type._(2, _omitEnumNames ? '' : 'game');

  static const $core.List<HomeGameItem_Type> values = <HomeGameItem_Type>[
    unknown,
    schema,
    game,
  ];

  static final $core.List<HomeGameItem_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static HomeGameItem_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const HomeGameItem_Type._(super.value, super.name);
}

class HomeBannerItem_Type extends $pb.ProtobufEnum {
  static const HomeBannerItem_Type unknown =
      HomeBannerItem_Type._(0, _omitEnumNames ? '' : 'unknown');
  static const HomeBannerItem_Type image =
      HomeBannerItem_Type._(1, _omitEnumNames ? '' : 'image');
  static const HomeBannerItem_Type gift =
      HomeBannerItem_Type._(2, _omitEnumNames ? '' : 'gift');
  static const HomeBannerItem_Type game =
      HomeBannerItem_Type._(3, _omitEnumNames ? '' : 'game');
  static const HomeBannerItem_Type megaphone =
      HomeBannerItem_Type._(4, _omitEnumNames ? '' : 'megaphone');

  static const $core.List<HomeBannerItem_Type> values = <HomeBannerItem_Type>[
    unknown,
    image,
    gift,
    game,
    megaphone,
  ];

  static final $core.List<HomeBannerItem_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static HomeBannerItem_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const HomeBannerItem_Type._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

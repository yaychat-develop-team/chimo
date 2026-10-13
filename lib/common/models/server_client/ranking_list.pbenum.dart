// This is a generated file - do not edit.
//
// Generated from server_client/ranking_list.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RankingListType extends $pb.ProtobufEnum {
  static const RankingListType CONTRIBUTION =
      RankingListType._(0, _omitEnumNames ? '' : 'CONTRIBUTION');
  static const RankingListType CHARM =
      RankingListType._(1, _omitEnumNames ? '' : 'CHARM');
  static const RankingListType TRUE_LOVE =
      RankingListType._(2, _omitEnumNames ? '' : 'TRUE_LOVE');
  static const RankingListType LUCKY_POINT =
      RankingListType._(3, _omitEnumNames ? '' : 'LUCKY_POINT');
  static const RankingListType GIFT_SEND =
      RankingListType._(4, _omitEnumNames ? '' : 'GIFT_SEND');
  static const RankingListType GIFT_RECEIVE =
      RankingListType._(5, _omitEnumNames ? '' : 'GIFT_RECEIVE');
  static const RankingListType GIFT_SEND_TOTAL =
      RankingListType._(6, _omitEnumNames ? '' : 'GIFT_SEND_TOTAL');
  static const RankingListType GIFT_RECEIVE_TOTAL =
      RankingListType._(7, _omitEnumNames ? '' : 'GIFT_RECEIVE_TOTAL');
  static const RankingListType CAR =
      RankingListType._(8, _omitEnumNames ? '' : 'CAR');
  static const RankingListType CAR_PALACE =
      RankingListType._(9, _omitEnumNames ? '' : 'CAR_PALACE');
  static const RankingListType DRESS =
      RankingListType._(10, _omitEnumNames ? '' : 'DRESS');
  static const RankingListType ARTIST =
      RankingListType._(11, _omitEnumNames ? '' : 'ARTIST');
  static const RankingListType AGENT =
      RankingListType._(12, _omitEnumNames ? '' : 'AGENT');
  static const RankingListType TRADE =
      RankingListType._(13, _omitEnumNames ? '' : 'TRADE');

  static const $core.List<RankingListType> values = <RankingListType>[
    CONTRIBUTION,
    CHARM,
    TRUE_LOVE,
    LUCKY_POINT,
    GIFT_SEND,
    GIFT_RECEIVE,
    GIFT_SEND_TOTAL,
    GIFT_RECEIVE_TOTAL,
    CAR,
    CAR_PALACE,
    DRESS,
    ARTIST,
    AGENT,
    TRADE,
  ];

  static final $core.List<RankingListType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 13);
  static RankingListType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RankingListType._(super.value, super.name);
}

class LuckRankType extends $pb.ProtobufEnum {
  static const LuckRankType NORMAL =
      LuckRankType._(0, _omitEnumNames ? '' : 'NORMAL');
  static const LuckRankType BOX_GIFT =
      LuckRankType._(1, _omitEnumNames ? '' : 'BOX_GIFT');
  static const LuckRankType GAME =
      LuckRankType._(2, _omitEnumNames ? '' : 'GAME');
  static const LuckRankType LUCKY_BUFF =
      LuckRankType._(3, _omitEnumNames ? '' : 'LUCKY_BUFF');
  static const LuckRankType CRYSTAL_LOTTERY =
      LuckRankType._(4, _omitEnumNames ? '' : 'CRYSTAL_LOTTERY');

  static const $core.List<LuckRankType> values = <LuckRankType>[
    NORMAL,
    BOX_GIFT,
    GAME,
    LUCKY_BUFF,
    CRYSTAL_LOTTERY,
  ];

  static final $core.List<LuckRankType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static LuckRankType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const LuckRankType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

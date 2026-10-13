// This is a generated file - do not edit.
//
// Generated from server_client/quiz.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// H5 积分兑换类型 — POST /h5-api/v1/quiz/exchange body.exchange_type
class QuizExchangeType extends $pb.ProtobufEnum {
  static const QuizExchangeType QUIZ_EXCHANGE_TYPE_UNSPECIFIED =
      QuizExchangeType._(
          0, _omitEnumNames ? '' : 'QUIZ_EXCHANGE_TYPE_UNSPECIFIED');
  static const QuizExchangeType COMMON =
      QuizExchangeType._(1, _omitEnumNames ? '' : 'COMMON');
  static const QuizExchangeType CAR_DRAW =
      QuizExchangeType._(2, _omitEnumNames ? '' : 'CAR_DRAW');
  static const QuizExchangeType THEMED_MEDAL =
      QuizExchangeType._(3, _omitEnumNames ? '' : 'THEMED_MEDAL');

  static const $core.List<QuizExchangeType> values = <QuizExchangeType>[
    QUIZ_EXCHANGE_TYPE_UNSPECIFIED,
    COMMON,
    CAR_DRAW,
    THEMED_MEDAL,
  ];

  static final $core.List<QuizExchangeType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static QuizExchangeType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const QuizExchangeType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

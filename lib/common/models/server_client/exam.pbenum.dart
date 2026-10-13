// This is a generated file - do not edit.
//
// Generated from server_client/exam.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MediaType extends $pb.ProtobufEnum {
  static const MediaType text = MediaType._(0, _omitEnumNames ? '' : 'text');
  static const MediaType video = MediaType._(1, _omitEnumNames ? '' : 'video');
  static const MediaType image = MediaType._(2, _omitEnumNames ? '' : 'image');

  static const $core.List<MediaType> values = <MediaType>[
    text,
    video,
    image,
  ];

  static final $core.List<MediaType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static MediaType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MediaType._(super.value, super.name);
}

class TitleType extends $pb.ProtobufEnum {
  static const TitleType h1 = TitleType._(0, _omitEnumNames ? '' : 'h1');
  static const TitleType h2 = TitleType._(1, _omitEnumNames ? '' : 'h2');
  static const TitleType h3 = TitleType._(2, _omitEnumNames ? '' : 'h3');
  static const TitleType h4 = TitleType._(3, _omitEnumNames ? '' : 'h4');

  static const $core.List<TitleType> values = <TitleType>[
    h1,
    h2,
    h3,
    h4,
  ];

  static final $core.List<TitleType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static TitleType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TitleType._(super.value, super.name);
}

/// *
///  ==============================
///  试题
///  ==============================
class QuestionType extends $pb.ProtobufEnum {
  static const QuestionType single_choice =
      QuestionType._(0, _omitEnumNames ? '' : 'single_choice');
  static const QuestionType multiple_choice =
      QuestionType._(1, _omitEnumNames ? '' : 'multiple_choice');
  static const QuestionType judge =
      QuestionType._(2, _omitEnumNames ? '' : 'judge');

  static const $core.List<QuestionType> values = <QuestionType>[
    single_choice,
    multiple_choice,
    judge,
  ];

  static final $core.List<QuestionType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static QuestionType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const QuestionType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

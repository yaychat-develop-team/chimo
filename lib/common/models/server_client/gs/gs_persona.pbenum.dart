// This is a generated file - do not edit.
//
// Generated from server_client/gs/gs_persona.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 简介类型（用于"根据简介生成详细资料"的类型选择，并在详情中下发）
class BriefType extends $pb.ProtobufEnum {
  /// 未指定
  static const BriefType BRIEF_TYPE_UNSPECIFIED =
      BriefType._(0, _omitEnumNames ? '' : 'BRIEF_TYPE_UNSPECIFIED');

  /// 国家地区
  static const BriefType COUNTRY_REGION =
      BriefType._(1, _omitEnumNames ? '' : 'COUNTRY_REGION');

  /// 职业
  static const BriefType OCCUPATION =
      BriefType._(2, _omitEnumNames ? '' : 'OCCUPATION');

  /// 背景资料：家庭背景
  static const BriefType BACKGROUND_FAMILY =
      BriefType._(3, _omitEnumNames ? '' : 'BACKGROUND_FAMILY');

  /// 背景资料：工作背景
  static const BriefType BACKGROUND_WORK =
      BriefType._(4, _omitEnumNames ? '' : 'BACKGROUND_WORK');

  /// 背景资料：学习背景
  static const BriefType BACKGROUND_EDUCATION =
      BriefType._(5, _omitEnumNames ? '' : 'BACKGROUND_EDUCATION');

  /// 兴趣爱好
  static const BriefType HOBBIES =
      BriefType._(6, _omitEnumNames ? '' : 'HOBBIES');

  /// 故事：家庭成长故事
  static const BriefType STORY_FAMILY =
      BriefType._(7, _omitEnumNames ? '' : 'STORY_FAMILY');

  /// 故事：情感故事一
  static const BriefType STORY_EMOTION_FIRST =
      BriefType._(8, _omitEnumNames ? '' : 'STORY_EMOTION_FIRST');

  /// 故事：情感故事二
  static const BriefType STORY_EMOTION_SECOND =
      BriefType._(9, _omitEnumNames ? '' : 'STORY_EMOTION_SECOND');

  static const $core.List<BriefType> values = <BriefType>[
    BRIEF_TYPE_UNSPECIFIED,
    COUNTRY_REGION,
    OCCUPATION,
    BACKGROUND_FAMILY,
    BACKGROUND_WORK,
    BACKGROUND_EDUCATION,
    HOBBIES,
    STORY_FAMILY,
    STORY_EMOTION_FIRST,
    STORY_EMOTION_SECOND,
  ];

  static final $core.List<BriefType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 9);
  static BriefType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BriefType._(super.value, super.name);
}

/// AI 任务状态
class JobStatus extends $pb.ProtobufEnum {
  /// 未指定
  static const JobStatus JOB_STATUS_UNSPECIFIED =
      JobStatus._(0, _omitEnumNames ? '' : 'JOB_STATUS_UNSPECIFIED');

  /// 排队中
  static const JobStatus PENDING =
      JobStatus._(1, _omitEnumNames ? '' : 'PENDING');

  /// 进行中
  static const JobStatus RUNNING =
      JobStatus._(2, _omitEnumNames ? '' : 'RUNNING');

  /// 成功
  static const JobStatus SUCCEEDED =
      JobStatus._(3, _omitEnumNames ? '' : 'SUCCEEDED');

  /// 失败
  static const JobStatus FAILED =
      JobStatus._(4, _omitEnumNames ? '' : 'FAILED');

  /// 已取消
  static const JobStatus CANCELED =
      JobStatus._(5, _omitEnumNames ? '' : 'CANCELED');

  static const $core.List<JobStatus> values = <JobStatus>[
    JOB_STATUS_UNSPECIFIED,
    PENDING,
    RUNNING,
    SUCCEEDED,
    FAILED,
    CANCELED,
  ];

  static final $core.List<JobStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static JobStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const JobStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

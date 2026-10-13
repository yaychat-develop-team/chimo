// This is a generated file - do not edit.
//
// Generated from server_client/user.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RegisterStep extends $pb.ProtobufEnum {
  /// 公共进度
  static const RegisterStep FILL_BASE_INFO =
      RegisterStep._(0, _omitEnumNames ? '' : 'FILL_BASE_INFO');
  static const RegisterStep SELECT_ROLE =
      RegisterStep._(1, _omitEnumNames ? '' : 'SELECT_ROLE');

  /// GS进度 废弃-------------------
  static const RegisterStep SELF_INTRODUCE =
      RegisterStep._(2, _omitEnumNames ? '' : 'SELF_INTRODUCE');
  static const RegisterStep TALENT_SHOW =
      RegisterStep._(3, _omitEnumNames ? '' : 'TALENT_SHOW');
  static const RegisterStep PAST_EXPIRENCE =
      RegisterStep._(4, _omitEnumNames ? '' : 'PAST_EXPIRENCE');
  static const RegisterStep PERSONAL_HOME_PAGE =
      RegisterStep._(5, _omitEnumNames ? '' : 'PERSONAL_HOME_PAGE');
  static const RegisterStep VIDEO_AUTH =
      RegisterStep._(6, _omitEnumNames ? '' : 'VIDEO_AUTH');

  /// gs新进度
  static const RegisterStep FILL_DETAIL_INFO =
      RegisterStep._(7, _omitEnumNames ? '' : 'FILL_DETAIL_INFO');
  static const RegisterStep FILL_AUTH =
      RegisterStep._(8, _omitEnumNames ? '' : 'FILL_AUTH');

  /// 车主进度
  static const RegisterStep MILLION_OWNER_AUTH =
      RegisterStep._(9, _omitEnumNames ? '' : 'MILLION_OWNER_AUTH');

  static const $core.List<RegisterStep> values = <RegisterStep>[
    FILL_BASE_INFO,
    SELECT_ROLE,
    SELF_INTRODUCE,
    TALENT_SHOW,
    PAST_EXPIRENCE,
    PERSONAL_HOME_PAGE,
    VIDEO_AUTH,
    FILL_DETAIL_INFO,
    FILL_AUTH,
    MILLION_OWNER_AUTH,
  ];

  static final $core.List<RegisterStep?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 9);
  static RegisterStep? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RegisterStep._(super.value, super.name);
}

class InviteStatus extends $pb.ProtobufEnum {
  static const InviteStatus AUTH_SUCCESS =
      InviteStatus._(0, _omitEnumNames ? '' : 'AUTH_SUCCESS');
  static const InviteStatus WAIT_AUTH =
      InviteStatus._(1, _omitEnumNames ? '' : 'WAIT_AUTH');
  static const InviteStatus WAIT_INVITE =
      InviteStatus._(2, _omitEnumNames ? '' : 'WAIT_INVITE');

  static const $core.List<InviteStatus> values = <InviteStatus>[
    AUTH_SUCCESS,
    WAIT_AUTH,
    WAIT_INVITE,
  ];

  static final $core.List<InviteStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static InviteStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const InviteStatus._(super.value, super.name);
}

class UserApprovalRecordStatus extends $pb.ProtobufEnum {
  /// *
  /// 0 = 没提交审核(应该去审核)
  /// 1 = 提交审核未通过(跳转审核未通过，重新提交审核页面-还要注意冷启动)
  /// 2 = 提交审核通过(跳转首页-还要注意冷启动)
  /// 3 = 已提交待审核(跳转等待审核页面-还要注意冷启动)
  static const UserApprovalRecordStatus NOT_SUBMITTED_FOR_REVIEW =
      UserApprovalRecordStatus._(
          0, _omitEnumNames ? '' : 'NOT_SUBMITTED_FOR_REVIEW');
  static const UserApprovalRecordStatus SUBMITTED_FOR_REVIEW_FAILED =
      UserApprovalRecordStatus._(
          1, _omitEnumNames ? '' : 'SUBMITTED_FOR_REVIEW_FAILED');
  static const UserApprovalRecordStatus SUBMIT_FOR_APPROVAL =
      UserApprovalRecordStatus._(
          2, _omitEnumNames ? '' : 'SUBMIT_FOR_APPROVAL');
  static const UserApprovalRecordStatus SUBMITTED_FOR_REVIEW =
      UserApprovalRecordStatus._(
          3, _omitEnumNames ? '' : 'SUBMITTED_FOR_REVIEW');

  static const $core.List<UserApprovalRecordStatus> values =
      <UserApprovalRecordStatus>[
    NOT_SUBMITTED_FOR_REVIEW,
    SUBMITTED_FOR_REVIEW_FAILED,
    SUBMIT_FOR_APPROVAL,
    SUBMITTED_FOR_REVIEW,
  ];

  static final $core.List<UserApprovalRecordStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static UserApprovalRecordStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UserApprovalRecordStatus._(super.value, super.name);
}

class ThirdParty extends $pb.ProtobufEnum {
  static const ThirdParty WECHAT =
      ThirdParty._(0, _omitEnumNames ? '' : 'WECHAT');
  static const ThirdParty QQ = ThirdParty._(1, _omitEnumNames ? '' : 'QQ');
  static const ThirdParty APPLE =
      ThirdParty._(2, _omitEnumNames ? '' : 'APPLE');

  static const $core.List<ThirdParty> values = <ThirdParty>[
    WECHAT,
    QQ,
    APPLE,
  ];

  static final $core.List<ThirdParty?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ThirdParty? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ThirdParty._(super.value, super.name);
}

class RelationChangeType extends $pb.ProtobufEnum {
  static const RelationChangeType FOLLOW =
      RelationChangeType._(0, _omitEnumNames ? '' : 'FOLLOW');
  static const RelationChangeType UNFOLLOW =
      RelationChangeType._(1, _omitEnumNames ? '' : 'UNFOLLOW');

  static const $core.List<RelationChangeType> values = <RelationChangeType>[
    FOLLOW,
    UNFOLLOW,
  ];

  static final $core.List<RelationChangeType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static RelationChangeType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RelationChangeType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

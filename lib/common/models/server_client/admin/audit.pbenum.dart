// This is a generated file - do not edit.
//
// Generated from server_client/admin/audit.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AuditResult extends $pb.ProtobufEnum {
  static const AuditResult not_sure =
      AuditResult._(0, _omitEnumNames ? '' : 'not_sure');
  static const AuditResult success =
      AuditResult._(1, _omitEnumNames ? '' : 'success');
  static const AuditResult failed =
      AuditResult._(2, _omitEnumNames ? '' : 'failed');

  static const $core.List<AuditResult> values = <AuditResult>[
    not_sure,
    success,
    failed,
  ];

  static final $core.List<AuditResult?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static AuditResult? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AuditResult._(super.value, super.name);
}

class UserFieldAuditField extends $pb.ProtobufEnum {
  static const UserFieldAuditField nickName =
      UserFieldAuditField._(0, _omitEnumNames ? '' : 'nickName');
  static const UserFieldAuditField avatar =
      UserFieldAuditField._(1, _omitEnumNames ? '' : 'avatar');
  static const UserFieldAuditField personalSignature =
      UserFieldAuditField._(2, _omitEnumNames ? '' : 'personalSignature');
  static const UserFieldAuditField voice =
      UserFieldAuditField._(3, _omitEnumNames ? '' : 'voice');
  static const UserFieldAuditField video =
      UserFieldAuditField._(4, _omitEnumNames ? '' : 'video');
  static const UserFieldAuditField photo =
      UserFieldAuditField._(5, _omitEnumNames ? '' : 'photo');

  static const $core.List<UserFieldAuditField> values = <UserFieldAuditField>[
    nickName,
    avatar,
    personalSignature,
    voice,
    video,
    photo,
  ];

  static final $core.List<UserFieldAuditField?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static UserFieldAuditField? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UserFieldAuditField._(super.value, super.name);
}

class UserFieldAuditFailedReason extends $pb.ProtobufEnum {
  static const UserFieldAuditFailedReason invalidateNickName =
      UserFieldAuditFailedReason._(
          0, _omitEnumNames ? '' : 'invalidateNickName');
  static const UserFieldAuditFailedReason photoNotClear =
      UserFieldAuditFailedReason._(1, _omitEnumNames ? '' : 'photoNotClear');
  static const UserFieldAuditFailedReason photoNotRealMan =
      UserFieldAuditFailedReason._(2, _omitEnumNames ? '' : 'photoNotRealMan');
  static const UserFieldAuditFailedReason allegedVulgarity =
      UserFieldAuditFailedReason._(3, _omitEnumNames ? '' : 'allegedVulgarity');
  static const UserFieldAuditFailedReason others =
      UserFieldAuditFailedReason._(4, _omitEnumNames ? '' : 'others');

  static const $core.List<UserFieldAuditFailedReason> values =
      <UserFieldAuditFailedReason>[
    invalidateNickName,
    photoNotClear,
    photoNotRealMan,
    allegedVulgarity,
    others,
  ];

  static final $core.List<UserFieldAuditFailedReason?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static UserFieldAuditFailedReason? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const UserFieldAuditFailedReason._(super.value, super.name);
}

class ChannelAuditFailedReason extends $pb.ProtobufEnum {
  static const ChannelAuditFailedReason invalidateTitle =
      ChannelAuditFailedReason._(0, _omitEnumNames ? '' : 'invalidateTitle');
  static const ChannelAuditFailedReason invalidateCover =
      ChannelAuditFailedReason._(1, _omitEnumNames ? '' : 'invalidateCover');
  static const ChannelAuditFailedReason invalidateNotice =
      ChannelAuditFailedReason._(2, _omitEnumNames ? '' : 'invalidateNotice');
  static const ChannelAuditFailedReason channelAllegedVulgarity =
      ChannelAuditFailedReason._(
          3, _omitEnumNames ? '' : 'channelAllegedVulgarity');
  static const ChannelAuditFailedReason channelOthers =
      ChannelAuditFailedReason._(4, _omitEnumNames ? '' : 'channelOthers');

  static const $core.List<ChannelAuditFailedReason> values =
      <ChannelAuditFailedReason>[
    invalidateTitle,
    invalidateCover,
    invalidateNotice,
    channelAllegedVulgarity,
    channelOthers,
  ];

  static final $core.List<ChannelAuditFailedReason?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ChannelAuditFailedReason? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChannelAuditFailedReason._(super.value, super.name);
}

class ChannelAuditField extends $pb.ProtobufEnum {
  static const ChannelAuditField title =
      ChannelAuditField._(0, _omitEnumNames ? '' : 'title');
  static const ChannelAuditField cover =
      ChannelAuditField._(1, _omitEnumNames ? '' : 'cover');
  static const ChannelAuditField notice =
      ChannelAuditField._(2, _omitEnumNames ? '' : 'notice');

  static const $core.List<ChannelAuditField> values = <ChannelAuditField>[
    title,
    cover,
    notice,
  ];

  static final $core.List<ChannelAuditField?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ChannelAuditField? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChannelAuditField._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

// This is a generated file - do not edit.
//
// Generated from server_client/ride.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 兜风档位
class RideType extends $pb.ProtobufEnum {
  /// 1v1指定
  static const RideType Specific =
      RideType._(0, _omitEnumNames ? '' : 'Specific');

  /// 99元 GS需求量3
  static const RideType Basic = RideType._(1, _omitEnumNames ? '' : 'Basic');

  /// 199元 GS需求量4
  static const RideType Standard =
      RideType._(2, _omitEnumNames ? '' : 'Standard');

  /// 299元 GS需求量5
  static const RideType Premium =
      RideType._(3, _omitEnumNames ? '' : 'Premium');

  static const $core.List<RideType> values = <RideType>[
    Specific,
    Basic,
    Standard,
    Premium,
  ];

  static final $core.List<RideType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static RideType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RideType._(super.value, super.name);
}

/// GS对于兜风订单的反馈
class GsResponseType extends $pb.ProtobufEnum {
  static const GsResponseType Timeout =
      GsResponseType._(0, _omitEnumNames ? '' : 'Timeout');
  static const GsResponseType Reject =
      GsResponseType._(1, _omitEnumNames ? '' : 'Reject');
  static const GsResponseType Accept =
      GsResponseType._(2, _omitEnumNames ? '' : 'Accept');

  static const $core.List<GsResponseType> values = <GsResponseType>[
    Timeout,
    Reject,
    Accept,
  ];

  static final $core.List<GsResponseType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static GsResponseType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GsResponseType._(super.value, super.name);
}

/// 趣聊卡猜拳选项
class QuestGuess extends $pb.ProtobufEnum {
  static const QuestGuess ROCK = QuestGuess._(0, _omitEnumNames ? '' : 'ROCK');
  static const QuestGuess PAPER =
      QuestGuess._(1, _omitEnumNames ? '' : 'PAPER');
  static const QuestGuess SCISSOR =
      QuestGuess._(2, _omitEnumNames ? '' : 'SCISSOR');

  static const $core.List<QuestGuess> values = <QuestGuess>[
    ROCK,
    PAPER,
    SCISSOR,
  ];

  static final $core.List<QuestGuess?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static QuestGuess? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const QuestGuess._(super.value, super.name);
}

class PrivilegeOperation extends $pb.ProtobufEnum {
  static const PrivilegeOperation USE =
      PrivilegeOperation._(0, _omitEnumNames ? '' : 'USE');
  static const PrivilegeOperation END =
      PrivilegeOperation._(1, _omitEnumNames ? '' : 'END');

  static const $core.List<PrivilegeOperation> values = <PrivilegeOperation>[
    USE,
    END,
  ];

  static final $core.List<PrivilegeOperation?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static PrivilegeOperation? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PrivilegeOperation._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

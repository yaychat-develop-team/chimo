// This is a generated file - do not edit.
//
// Generated from server_client/admin/block.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BlockOperateType extends $pb.ProtobufEnum {
  static const BlockOperateType block =
      BlockOperateType._(0, _omitEnumNames ? '' : 'block');
  static const BlockOperateType unblock_by_time =
      BlockOperateType._(1, _omitEnumNames ? '' : 'unblock_by_time');
  static const BlockOperateType unblock_by_operator =
      BlockOperateType._(2, _omitEnumNames ? '' : 'unblock_by_operator');

  static const $core.List<BlockOperateType> values = <BlockOperateType>[
    block,
    unblock_by_time,
    unblock_by_operator,
  ];

  static final $core.List<BlockOperateType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static BlockOperateType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BlockOperateType._(super.value, super.name);
}

class BlockMainType extends $pb.ProtobufEnum {
  static const BlockMainType login =
      BlockMainType._(0, _omitEnumNames ? '' : 'login');
  static const BlockMainType cash =
      BlockMainType._(1, _omitEnumNames ? '' : 'cash');
  static const BlockMainType interactive =
      BlockMainType._(2, _omitEnumNames ? '' : 'interactive');

  static const $core.List<BlockMainType> values = <BlockMainType>[
    login,
    cash,
    interactive,
  ];

  static final $core.List<BlockMainType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static BlockMainType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BlockMainType._(super.value, super.name);
}

class BlockLoginSubType extends $pb.ProtobufEnum {
  static const BlockLoginSubType id =
      BlockLoginSubType._(0, _omitEnumNames ? '' : 'id');
  static const BlockLoginSubType device =
      BlockLoginSubType._(1, _omitEnumNames ? '' : 'device');
  static const BlockLoginSubType idAndDevice =
      BlockLoginSubType._(2, _omitEnumNames ? '' : 'idAndDevice');

  static const $core.List<BlockLoginSubType> values = <BlockLoginSubType>[
    id,
    device,
    idAndDevice,
  ];

  static final $core.List<BlockLoginSubType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static BlockLoginSubType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BlockLoginSubType._(super.value, super.name);
}

class BlockCashSubType extends $pb.ProtobufEnum {
  static const BlockCashSubType takeCash =
      BlockCashSubType._(0, _omitEnumNames ? '' : 'takeCash');
  static const BlockCashSubType costCash =
      BlockCashSubType._(1, _omitEnumNames ? '' : 'costCash');
  static const BlockCashSubType takeAndCostCash =
      BlockCashSubType._(2, _omitEnumNames ? '' : 'takeAndCostCash');

  static const $core.List<BlockCashSubType> values = <BlockCashSubType>[
    takeCash,
    costCash,
    takeAndCostCash,
  ];

  static final $core.List<BlockCashSubType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static BlockCashSubType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BlockCashSubType._(super.value, super.name);
}

class BlockInteractiveSubType extends $pb.ProtobufEnum {
  static const BlockInteractiveSubType publishChannel =
      BlockInteractiveSubType._(0, _omitEnumNames ? '' : 'publishChannel');
  static const BlockInteractiveSubType singleChat =
      BlockInteractiveSubType._(1, _omitEnumNames ? '' : 'singleChat');
  static const BlockInteractiveSubType publishChannelAndSingleChat =
      BlockInteractiveSubType._(
          2, _omitEnumNames ? '' : 'publishChannelAndSingleChat');

  static const $core.List<BlockInteractiveSubType> values =
      <BlockInteractiveSubType>[
    publishChannel,
    singleChat,
    publishChannelAndSingleChat,
  ];

  static final $core.List<BlockInteractiveSubType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static BlockInteractiveSubType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BlockInteractiveSubType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

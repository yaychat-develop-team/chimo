// This is a generated file - do not edit.
//
// Generated from server_client/cash.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GemUserIdentity extends $pb.ProtobufEnum {
  static const GemUserIdentity UNKNOW_USER =
      GemUserIdentity._(0, _omitEnumNames ? '' : 'UNKNOW_USER');
  static const GemUserIdentity GUILD_USER =
      GemUserIdentity._(1, _omitEnumNames ? '' : 'GUILD_USER');
  static const GemUserIdentity VIP_USER =
      GemUserIdentity._(2, _omitEnumNames ? '' : 'VIP_USER');

  static const $core.List<GemUserIdentity> values = <GemUserIdentity>[
    UNKNOW_USER,
    GUILD_USER,
    VIP_USER,
  ];

  static final $core.List<GemUserIdentity?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static GemUserIdentity? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GemUserIdentity._(super.value, super.name);
}

class AccountType extends $pb.ProtobufEnum {
  static const AccountType ALIPAY =
      AccountType._(0, _omitEnumNames ? '' : 'ALIPAY');
  static const AccountType BANK =
      AccountType._(1, _omitEnumNames ? '' : 'BANK');

  static const $core.List<AccountType> values = <AccountType>[
    ALIPAY,
    BANK,
  ];

  static final $core.List<AccountType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static AccountType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AccountType._(super.value, super.name);
}

class ChargeSource extends $pb.ProtobufEnum {
  static const ChargeSource SEND_GIFT =
      ChargeSource._(0, _omitEnumNames ? '' : 'SEND_GIFT');
  static const ChargeSource RIDE_1V1 =
      ChargeSource._(1, _omitEnumNames ? '' : 'RIDE_1V1');
  static const ChargeSource RIDE_SQUARE =
      ChargeSource._(2, _omitEnumNames ? '' : 'RIDE_SQUARE');
  static const ChargeSource RIDE_RENEW =
      ChargeSource._(3, _omitEnumNames ? '' : 'RIDE_RENEW');
  static const ChargeSource BUY_BLIND_BOX =
      ChargeSource._(4, _omitEnumNames ? '' : 'BUY_BLIND_BOX');
  static const ChargeSource UPDATE_COMPANION =
      ChargeSource._(5, _omitEnumNames ? '' : 'UPDATE_COMPANION');
  static const ChargeSource MAGIC_PIC =
      ChargeSource._(6, _omitEnumNames ? '' : 'MAGIC_PIC');
  static const ChargeSource UNLOCK_CARD =
      ChargeSource._(7, _omitEnumNames ? '' : 'UNLOCK_CARD');
  static const ChargeSource AUCTION =
      ChargeSource._(8, _omitEnumNames ? '' : 'AUCTION');
  static const ChargeSource MERCH =
      ChargeSource._(9, _omitEnumNames ? '' : 'MERCH');

  static const $core.List<ChargeSource> values = <ChargeSource>[
    SEND_GIFT,
    RIDE_1V1,
    RIDE_SQUARE,
    RIDE_RENEW,
    BUY_BLIND_BOX,
    UPDATE_COMPANION,
    MAGIC_PIC,
    UNLOCK_CARD,
    AUCTION,
    MERCH,
  ];

  static final $core.List<ChargeSource?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 9);
  static ChargeSource? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChargeSource._(super.value, super.name);
}

class ItemInfo_Type extends $pb.ProtobufEnum {
  static const ItemInfo_Type normal =
      ItemInfo_Type._(0, _omitEnumNames ? '' : 'normal');
  static const ItemInfo_Type vip =
      ItemInfo_Type._(1, _omitEnumNames ? '' : 'vip');

  static const $core.List<ItemInfo_Type> values = <ItemInfo_Type>[
    normal,
    vip,
  ];

  static final $core.List<ItemInfo_Type?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ItemInfo_Type? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ItemInfo_Type._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

// This is a generated file - do not edit.
//
// Generated from server_client/common/pay.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 支付状态
class PayStatus extends $pb.ProtobufEnum {
  static const PayStatus PayStatus_UNKNOWN =
      PayStatus._(0, _omitEnumNames ? '' : 'PayStatus_UNKNOWN');
  static const PayStatus PAYING =
      PayStatus._(1, _omitEnumNames ? '' : 'PAYING');
  static const PayStatus SUCCESS =
      PayStatus._(2, _omitEnumNames ? '' : 'SUCCESS');
  static const PayStatus CLOSE = PayStatus._(-1, _omitEnumNames ? '' : 'CLOSE');

  static const $core.List<PayStatus> values = <PayStatus>[
    PayStatus_UNKNOWN,
    PAYING,
    SUCCESS,
    CLOSE,
  ];

  static final $core.Map<$core.int, PayStatus> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static PayStatus? valueOf($core.int value) => _byValue[value];

  const PayStatus._(super.value, super.name);
}

class PayChannelAction extends $pb.ProtobufEnum {
  static const PayChannelAction PayChannelAction_UNKNOWN =
      PayChannelAction._(0, _omitEnumNames ? '' : 'PayChannelAction_UNKNOWN');
  static const PayChannelAction SDK =
      PayChannelAction._(1, _omitEnumNames ? '' : 'SDK');
  static const PayChannelAction WEB =
      PayChannelAction._(2, _omitEnumNames ? '' : 'WEB');

  static const $core.List<PayChannelAction> values = <PayChannelAction>[
    PayChannelAction_UNKNOWN,
    SDK,
    WEB,
  ];

  static final $core.List<PayChannelAction?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static PayChannelAction? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PayChannelAction._(super.value, super.name);
}

/// 支付子单类型
class PayItemType extends $pb.ProtobufEnum {
  static const PayItemType PayItemType_UNKNOWN =
      PayItemType._(0, _omitEnumNames ? '' : 'PayItemType_UNKNOWN');
  static const PayItemType ALIPAY =
      PayItemType._(1, _omitEnumNames ? '' : 'ALIPAY');
  static const PayItemType WECHAT_PAY =
      PayItemType._(2, _omitEnumNames ? '' : 'WECHAT_PAY');
  static const PayItemType COIN_PAY =
      PayItemType._(3, _omitEnumNames ? '' : 'COIN_PAY');
  static const PayItemType APPLE_APP_STORE =
      PayItemType._(4, _omitEnumNames ? '' : 'APPLE_APP_STORE');
  static const PayItemType ALIPAY_PC =
      PayItemType._(5, _omitEnumNames ? '' : 'ALIPAY_PC');
  static const PayItemType ALIPAY_PC_WEB =
      PayItemType._(6, _omitEnumNames ? '' : 'ALIPAY_PC_WEB');
  static const PayItemType WECHAT_PC_WEB =
      PayItemType._(7, _omitEnumNames ? '' : 'WECHAT_PC_WEB');
  static const PayItemType WECHAT_MOBILE_WEB =
      PayItemType._(8, _omitEnumNames ? '' : 'WECHAT_MOBILE_WEB');
  static const PayItemType ALIPAY_MOBILE_WEB =
      PayItemType._(9, _omitEnumNames ? '' : 'ALIPAY_MOBILE_WEB');
  static const PayItemType WECHAT_JSAPI =
      PayItemType._(10, _omitEnumNames ? '' : 'WECHAT_JSAPI');
  static const PayItemType UNION_BANK =
      PayItemType._(11, _omitEnumNames ? '' : 'UNION_BANK');
  static const PayItemType THIRD_H5_PAY =
      PayItemType._(12, _omitEnumNames ? '' : 'THIRD_H5_PAY');
  static const PayItemType GOOGLE_PLAY =
      PayItemType._(13, _omitEnumNames ? '' : 'GOOGLE_PLAY');
  static const PayItemType PAYPAL =
      PayItemType._(14, _omitEnumNames ? '' : 'PAYPAL');
  static const PayItemType STRIPE =
      PayItemType._(15, _omitEnumNames ? '' : 'STRIPE');
  static const PayItemType PAYERMAX =
      PayItemType._(16, _omitEnumNames ? '' : 'PAYERMAX');
  static const PayItemType ASIAPAY =
      PayItemType._(17, _omitEnumNames ? '' : 'ASIAPAY');
  static const PayItemType HAIPAY_USDT =
      PayItemType._(18, _omitEnumNames ? '' : 'HAIPAY_USDT');
  static const PayItemType PINDD =
      PayItemType._(19, _omitEnumNames ? '' : 'PINDD');
  static const PayItemType DIANDIAN =
      PayItemType._(20, _omitEnumNames ? '' : 'DIANDIAN');
  static const PayItemType AIRWALLEX =
      PayItemType._(21, _omitEnumNames ? '' : 'AIRWALLEX');
  static const PayItemType PINGPONG =
      PayItemType._(22, _omitEnumNames ? '' : 'PINGPONG');
  static const PayItemType PINGPONG_QRPH =
      PayItemType._(23, _omitEnumNames ? '' : 'PINGPONG_QRPH');
  static const PayItemType PAYERMAX_QRPH =
      PayItemType._(24, _omitEnumNames ? '' : 'PAYERMAX_QRPH');

  static const $core.List<PayItemType> values = <PayItemType>[
    PayItemType_UNKNOWN,
    ALIPAY,
    WECHAT_PAY,
    COIN_PAY,
    APPLE_APP_STORE,
    ALIPAY_PC,
    ALIPAY_PC_WEB,
    WECHAT_PC_WEB,
    WECHAT_MOBILE_WEB,
    ALIPAY_MOBILE_WEB,
    WECHAT_JSAPI,
    UNION_BANK,
    THIRD_H5_PAY,
    GOOGLE_PLAY,
    PAYPAL,
    STRIPE,
    PAYERMAX,
    ASIAPAY,
    HAIPAY_USDT,
    PINDD,
    DIANDIAN,
    AIRWALLEX,
    PINGPONG,
    PINGPONG_QRPH,
    PAYERMAX_QRPH,
  ];

  static final $core.List<PayItemType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 24);
  static PayItemType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PayItemType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');

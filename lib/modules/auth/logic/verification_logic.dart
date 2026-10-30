import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/phone_utils.dart';
import 'package:chimo/common/utils/event_center.dart';
import 'package:chimo/common/utils/event_constant.dart';

/// 短信验证码：发送、倒计时、校验、写会话。
class VerificationLogic extends GetxController {
  VerificationLogic({required this.phone});

  static const int codeLength = 6;
  static const int resendSeconds = 60;

  final String phone;
  final TextEditingController input = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final RxString code = ''.obs;
  final RxBool submitting = false.obs;
  final RxInt resendLeft = 0.obs;
  final RxBool resending = false.obs;

  Timer? _resendTimer;

  bool get canResend => resendLeft.value <= 0 && !resending.value;

  String get maskedPhone {
    if (phone.length < 7) return phone;
    return '${phone.substring(0, 3)}****${phone.substring(phone.length - 4)}';
  }

  @override
  void onInit() {
    super.onInit();
    input.addListener(_onInputChanged);
  }

  @override
  void onReady() {
    super.onReady();
    focusNode.requestFocus();
    unawaited(send(initial: true));
  }

  @override
  void onClose() {
    _resendTimer?.cancel();
    input.removeListener(_onInputChanged);
    input.dispose();
    focusNode.dispose();
    super.onClose();
  }

  void _onInputChanged() {
    final value = input.text;
    code.value = value;
    if (value.length == codeLength) unawaited(submitCode(value));
  }

  Future<void> send({bool initial = false}) async {
    if (resending.value) return;
    if (!initial && !canResend) return;
    resending.value = true;
    try {
      final res = await ChimoApis.auth.sendSms(
        phone: PhoneUtils.toApiPhone(phone),
      );
      resending.value = false;
      if (!res.ok) {
        AppToast.error(res.message.isEmpty ? 'SMS send failed' : res.message);
        if (initial) resendLeft.value = 0;
        return;
      }
      if (!initial) AppToast.info('Verification code resent');
      _startCountdown();
    } catch (error) {
      resending.value = false;
      AppToast.error('SMS send failed: $error');
      if (initial) resendLeft.value = 0;
    }
  }

  Future<void> submitCode(String value) async {
    if (submitting.value) return;
    submitting.value = true;
    final res = await ChimoApis.auth.smsAuth(
      phone: PhoneUtils.toApiPhone(phone),
      code: value,
    );
    if (res.ok) {
      eventCenter.emit(Event(EventConstant.loginGetAuthRsp, data: res.data));
    } else {
      AppToast.error(res.message);
    }
    if (!isClosed) submitting.value = false;
  }

  void _startCountdown() {
    _resendTimer?.cancel();
    resendLeft.value = resendSeconds;
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }
      if (resendLeft.value <= 1) {
        timer.cancel();
        resendLeft.value = 0;
        return;
      }
      resendLeft.value -= 1;
    });
  }
}

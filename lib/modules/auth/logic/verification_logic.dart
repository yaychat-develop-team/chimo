import 'dart:async';

import 'package:chimo/common/utils/event_center.dart';
import 'package:chimo/common/utils/event_constant.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/auth/onboarding_state.dart';
import '../../../app/chimo_api.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/phone_utils.dart';

/// 短信验证结果。成功时 [goHome] 决定进壳层还是完善资料。
class PhoneVerifyResult {
  const PhoneVerifyResult._({this.message, required this.goHome});

  const PhoneVerifyResult.failure(String message) : this._(message: message, goHome: false);

  const PhoneVerifyResult.success(bool goHome) : this._(goHome: goHome, message: null);

  final String? message;
  final bool goHome;

  bool get ok => message == null;
}

/// 短信验证码：发送、倒计时、校验、写会话。
///
/// 焦点和输入框留在页面。输入同步到 [code]，页面在它被清空时清掉输入框。
class VerificationLogic extends GetxController {
  VerificationLogic({required this.phone});

  static const int codeLength = 6;
  static const int resendSeconds = 60;

  final String phone;
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
  void onClose() {
    _resendTimer?.cancel();
    super.onClose();
  }

  void onInput(String value) {
    code.value = value;
    if (value.length == codeLength) {
      submitCode(value);
    }
  }

  Future<void> send({bool initial = false}) async {
    if (resending.value) return;
    resending.value = true;
    final failure = await sendCode(PhoneUtils.toApiPhone(phone));
    if (isClosed) return;
    resending.value = false;
    if (failure != null) {
      AppToast.error(failure);
      if (initial) resendLeft.value = 0;
      return;
    }
    if (!initial) AppToast.info('Verification code resent');
    _startCountdown();
  }

  Future<void> resend() async {
    if (!canResend) return;
    await send();
  }

  Future<void> submitCode(String value) async {
    if (submitting.value) return;
    submitting.value = true;
    final res = await ChimoApis.auth.smsAuth(phone: PhoneUtils.toApiPhone(phone), code: value);
    if(res.ok) {
      eventCenter.emit(Event(EventConstant.loginGetAuthRsp,data: res.data));
    }else {
      AppToast.error(res.message);
    }
    idle();
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

  /// 进入验证码页后补发短信。失败只返回文案，不阻止输入。
  Future<String?> sendCode(String apiPhone) async {
    try {
      final res = await ChimoApis.auth.sendSms(phone: apiPhone);
      if (!res.ok) {
        return res.message.isEmpty ? 'SMS send failed' : res.message;
      }
      return null;
    } catch (error) {
      return 'SMS send failed: $error';
    }
  }

  void idle() {
    if (!isClosed) submitting.value = false;
  }
}

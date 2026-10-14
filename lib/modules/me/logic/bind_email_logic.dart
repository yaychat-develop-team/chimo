import 'dart:async';

import 'package:chimo/app/session_info.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/auth/onboarding_state.dart';
import '../../../app/chimo_api.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/event_center.dart';
import '../../../common/utils/event_constant.dart';

/// 邮箱登录结果。成功时 [goHome] 决定进壳层还是完善资料。
class EmailLoginResult {
  const EmailLoginResult._({this.message, required this.goHome});

  const EmailLoginResult.failure(String message) : this._(message: message, goHome: false);

  const EmailLoginResult.success(bool goHome) : this._(goHome: goHome, message: null);

  final String? message;
  final bool goHome;

  bool get ok => message == null;
}

/// 邮箱输入页：上次邮箱和「获取验证码」按钮。
class BindEmailLogic extends GetxController {
  final RxBool sending = false.obs;

  /// 邮箱占位为空时不预填。
  late final String? savedEmail = _readEmail();

  static String? _readEmail() {
    final last = SessionInfo.currentUser?.email.trim() ?? '';
    return last.isEmpty ? null : last;
  }

  void idle() {
    if (!isClosed) sending.value = false;
  }
}

/// 验证码页：发送、倒计时、登录、绑定。
class EmailCodeLogic extends GetxController {
  static const int codeLength = 6;
  static const int resendSeconds = 60;

  final RxBool verifying = false.obs;
  final RxBool resending = false.obs;
  final RxInt resendLeft = 0.obs;

  Timer? _resendTimer;

  bool canVerify(String code) => code.trim().length == codeLength && !verifying.value;

  bool get canResend => resendLeft.value <= 0 && !resending.value;

  @override
  void onClose() {
    _resendTimer?.cancel();
    super.onClose();
  }

  void startCountdown() {
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

  Future<void> deliver(String email, {bool initial = false}) async {
    final failure = await sendCode(email);
    if (isClosed) return;
    if (failure != null) {
      AppToast.info(failure);
      if (initial) resendLeft.value = 0;
      return;
    }
    if (!initial) AppToast.info('Verification code resent');
    startCountdown();
    idleResend();
  }

  Future<void> resend(String email) async {
    if (!canResend) return;
    await deliver(email);
  }

  Future<void> verify({
    required String email,
    required String code,
    required bool forLogin,
    required void Function() clearInput,
  }) async {
    if (!canVerify(code)) return;
    if (forLogin) {
      final rsp = await ChimoApis.auth.emailAuth(email: email, code: code);
      if (isClosed) return;
      if (rsp.ok) {
        eventCenter.emit(Event(EventConstant.loginGetAuthRsp,data: rsp.data));
      } else {
        AppToast.info(rsp.message);
      }
      return;
    }

    final failure = await bind(email: email, code: code);
    if (isClosed) return;
    if (failure != null) {
      AppToast.info(failure);
      clearInput();
      return;
    }
    AppJumper.back(result: true);
    idle();
  }

  /// 返回 `null` 表示验证码已发出。
  Future<String?> sendCode(String email) async {
    if (resending.value) return null;
    resending.value = true;
    try {
      final res = await ChimoApis.auth.sendEmailCode(email: email);
      if (!res.ok) {
        idleResend();
        return EmailAuthTips.friendly(res.message, fallback: 'Failed to send code');
      }
      return null;
    } catch (error) {
      idleResend();
      return 'Failed to send code: $error';
    }
  }

  /// 返回 `null` 表示已绑定。成功时 [verifying] 保持 true，等页面返回再 [idle]。
  Future<String?> bind({required String email, required String code}) async {
    if (verifying.value) return null;
    verifying.value = true;
    try {
      final res = await ChimoApis.auth.bindEmail(email: email, code: code);
      if (!res.ok) {
        idle();
        return EmailAuthTips.friendly(
          res.message,
          fallback: 'Unable to bind email. Please try again.',
        );
      }
      return null;
    } catch (error) {
      idle();
      return 'Verification failed: $error';
    }
  }

  void idle() {
    if (!isClosed) verifying.value = false;
  }

  void idleResend() {
    if (!isClosed) resending.value = false;
  }
}

/// 把邮箱认证 / 绑定接口的 message key 映射成给用户看的文案。
abstract final class EmailAuthTips {
  static String friendly(String raw, {required String fallback}) {
    final text = raw.trim();
    if (text.isEmpty) return fallback;
    final key = text.toLowerCase();

    switch (key) {
      case 'email.already.bound':
      case 'email.already.exist':
      case 'email.exist':
      case 'email.exists':
        return 'This email is already linked to another account. '
            'Please use a different email.';
      case 'email.invalid':
      case 'invalid.email':
        return 'Please enter a valid email address.';
      case 'wrong verification code':
      case 'invalid verification code':
      case 'code.invalid':
      case 'code.expired':
      case 'verification.code.wrong':
      case 'verification.code.expired':
        return 'Wrong or expired code. Tap Resend, then enter the newest code.';
      case 'user.not.login':
        return 'Please log in again, then bind your email.';
      case 'unauthorized':
      case 'unauthorized registration':
        return 'This email cannot be used right now. Try another email.';
      default:
        break;
    }

    if (key.contains('already') && key.contains('bound')) {
      return 'This email is already linked to another account. '
          'Please use a different email.';
    }
    if (key.contains('wrong') && key.contains('code')) {
      return 'Wrong or expired code. Tap Resend, then enter the newest code.';
    }

    if (RegExp(r'^[a-z0-9_.]+$').hasMatch(key) && key.contains('.')) {
      return fallback;
    }
    return text;
  }
}

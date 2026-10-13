import 'dart:async';

import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/auth/onboarding_state.dart';
import '../../../app/storage/user_store.dart';
import '../../../app/chimo_api.dart';
import '../../../app/network/network_bootstrap.dart';
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
    final result = await submit(
      apiPhone: PhoneUtils.toApiPhone(phone),
      phone: phone,
      code: value,
    );
    if (isClosed) return;
    if (!result.ok) {
      AppToast.error(result.message ?? 'Verification failed');
      code.value = '';
      idle();
      return;
    }
    AppJumper.toAfterAuth(goHome: result.goHome);
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
      final text = '$error';
      final networkish =
          text.contains('HandshakeException') ||
          text.contains('SocketException') ||
          text.contains('ClientException');
      if (networkish) {
        return 'Network error. Check emulator internet and try again.';
      }
      return 'SMS send failed: $error';
    }
  }

  /// 成功时 [submitting] 保持 true，等页面跳走再 [idle]。
  Future<PhoneVerifyResult> submit({
    required String apiPhone,
    required String phone,
    required String code,
  }) async {
    if (submitting.value) {
      return const PhoneVerifyResult.failure('Verification failed');
    }
    submitting.value = true;
    try {
      final res = await ChimoApis.auth.smsAuth(phone: apiPhone, code: code);
      if (!res.ok || res.data == null) {
        final msg = res.message.trim();
        final friendly = msg == 'unauthorized registration'
            ? 'This number is not allowed to register on the test server. Try 13800138000 / 123456.'
            : (msg.isEmpty ? 'Verification failed' : msg);
        return PhoneVerifyResult.failure(friendly);
      }

      final payload = res.data!;
      var token = payload.token;
      final nickname = payload.nickName;
      final avatarUrl = payload.avatar;

      await UserStore.update(
        (cache) => cache.patch(
          method: 'phone',
          phone: phone,
          token: token,
          nickname: nickname,
          avatarUrl: avatarUrl,
          emUsername: payload.emUsername,
          emPassword: payload.emPwd,
        ),
      );
      await NetworkBootstrap.applySessionToken(token);

      final refresh = await NetworkBootstrap.client.get('/auth/refresh-token');
      if (refresh.success && refresh.data is Map) {
        final next = '${(refresh.data as Map)['token'] ?? ''}'.trim();
        if (next.isNotEmpty && next != token) {
          token = next;
          await NetworkBootstrap.applySessionToken(token);
          await UserStore.update(
            (cache) => cache.patch(
              method: 'phone',
              phone: phone,
              token: token,
              nickname: nickname,
              avatarUrl: avatarUrl,
              emUsername: payload.emUsername,
              emPassword: payload.emPwd,
            ),
          );
        }
      }

      unawaited(NetworkBootstrap.connectImAfterLogin());
      final goHome = await OnboardingState.shouldEnterHome(newUser: payload.newUser);
      return PhoneVerifyResult.success(goHome);
    } catch (error) {
      return PhoneVerifyResult.failure('Verification failed: $error');
    }
  }

  void idle() {
    if (!isClosed) submitting.value = false;
  }
}

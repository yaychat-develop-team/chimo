import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../logic/bind_email_logic.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../common/theme/app_text.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/app_primary_button.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/utils/app_toast.dart';

/// 邮箱页：登录与绑定共用的 Welcome Back 流程。
class BindEmailPage extends StatefulWidget {
  const BindEmailPage({super.key, this.initialEmail = '', this.forLogin = false});

  final String initialEmail;

  /// `true`：登录流程，验证后进入主页；`false`：绑定后 pop。
  final bool forLogin;

  @override
  State<BindEmailPage> createState() => _BindEmailPageState();
}

class _BindEmailPageState extends State<BindEmailPage> {
  static const Color _green = AppColors.accentNeon;
  // 校验保持宽松：部分输入法 / 粘贴内容可能含隐蔽字符；
  // 只需「看起来像邮箱」即可启用 CTA。
  static final RegExp _emailRegExp = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  late final TextEditingController _emailController;
  late final BindEmailLogic logic;

  // 规范化：去除隐藏空白（粘贴 / 输入法可能注入）。
  String get _email => _emailController.text.replaceAll(RegExp(r'\s+'), '').trim();

  bool get _isValidEmail => _emailRegExp.hasMatch(_email);

  @override
  void initState() {
    super.initState();
    logic = Get.put(BindEmailLogic());
    _emailController = TextEditingController(text: widget.initialEmail);
    _emailController.addListener(() => setState(() {}));
    final last = logic.savedEmail;
    if (widget.initialEmail.trim().isEmpty && last != null) {
      _emailController.text = last;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    Get.delete<BindEmailLogic>();
    super.dispose();
  }

  Future<void> _onGetCode() async {
    if (!_isValidEmail || logic.sending.value) return;
    logic.sending.value = true;
    try {
      // 对齐 forya：仅缓存邮箱并跳转；验证码页再请求 OTP。
      if (!mounted) return;
      // 所以这一处还是 MaterialPageRoute。它内部的返回已在 换成
      // `AppJumper.back(result:)` —— 全项目只有一个 navigator，Get 与 Navigator
      // 推出去的路由都在同一个栈上，回传不会丢。
      final bound = await Navigator.of(context).push<bool>(
        MaterialPageRoute<bool>(
          builder: (_) =>
              _BindEmailCodePage(email: _email, forLogin: widget.forLogin, sendOnOpen: true),
        ),
      );
      if (!mounted || bound != true) return;
      if (widget.forLogin) return;
      AppJumper.back(result: true);
    } catch (error) {
      if (!mounted) return;
      AppToast.info('Failed to continue: $error');
    } finally {
      logic.idle();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Obx(() {
      final canSubmit = _isValidEmail && !logic.sending.value;
      return ChimoScaffold(
        backgroundColor: AppColors.surface,
        backdrop: AppImage(
          AppAssets.homeTopBg,
          width: screenWidth,
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 28),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter your email to begin your journey.',
                style: TextStyle(
                  color: AppColors.textGrayB0,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 28),
              Container(
                height: 54,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: AppColors.tagBackground,
                  borderRadius: BorderRadius.circular(27),
                ),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  style: AppText.field,
                  cursorColor: _green,
                  decoration: const AppInputDecoration(
                    isDense: true,
                    hintText: 'Enter your Email',
                    hintStyle: TextStyle(
                      color: AppColors.textGray8A,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AppPrimaryButton(
                label: 'Get Verification Code',
                onTap: _onGetCode,
                enabled: canSubmit,
                loading: logic.sending.value,
                color: _green,
                disabledColor: AppColors.outlineBright,
                disabledLabelColor: AppColors.textGray8A,
                borderRadius: 27,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _BindEmailCodePage extends StatefulWidget {
  const _BindEmailCodePage({required this.email, this.forLogin = false, this.sendOnOpen = false});

  final String email;
  final bool forLogin;

  /// 为 true 时，打开即请求 `/auth/send-email-code`（forya EmailLoginCodePage）。
  final bool sendOnOpen;

  @override
  State<_BindEmailCodePage> createState() => _BindEmailCodePageState();
}

class _BindEmailCodePageState extends State<_BindEmailCodePage> {
  static const Color _green = AppColors.accentNeon;

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late final EmailCodeLogic logic;

  bool get _canVerify => logic.canVerify(_controller.text);

  @override
  void initState() {
    super.initState();
    logic = Get.put(EmailCodeLogic());
    _controller.addListener(() => setState(() {}));
    if (widget.sendOnOpen) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        unawaited(logic.deliver(widget.email, initial: true));
      });
    } else {
      logic.startCountdown();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    Get.delete<EmailCodeLogic>();
    super.dispose();
  }

  void _clearInput() {
    _controller.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Obx(() {
      final canVerify = _canVerify;
      return ChimoScaffold(
        backgroundColor: AppColors.surface,
        backdrop: AppImage(
          AppAssets.homeTopBg,
          width: screenWidth,
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 28),
              const Text(
                'Check your email!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    color: AppColors.textGrayB0,
                    fontSize: 15,
                    height: 1.45,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    const TextSpan(text: 'We just sent a magic key to '),
                    TextSpan(
                      text: widget.email,
                      style: const TextStyle(color: _green, fontWeight: FontWeight.w600),
                    ),
                    const TextSpan(text: '. Enter it below to meet your crew.'),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              Container(
                height: 54,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: AppColors.tagBackground,
                  borderRadius: BorderRadius.circular(27),
                ),
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  keyboardType: TextInputType.number,
                  maxLength: EmailCodeLogic.codeLength,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: AppText.field.copyWith(letterSpacing: 2),
                  cursorColor: _green,
                  decoration: const AppInputDecoration(
                    isDense: true,
                    counterText: '',
                    hintText: 'Enter 6-digit code',
                    hintStyle: TextStyle(
                      color: AppColors.textGray8A,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AppPrimaryButton(
                label: 'Verify & Continue',
                onTap: () => logic.verify(
                  email: widget.email,
                  code: _controller.text.trim(),
                  forLogin: widget.forLogin,
                  clearInput: _clearInput,
                ),
                enabled: canVerify,
                loading: logic.verifying.value,
                color: _green,
                disabledColor: AppColors.outlineBright,
                disabledLabelColor: AppColors.textGray8A,
                borderRadius: 27,
              ),
              const SizedBox(height: 22),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text(
                    "Didn't receive it? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: logic.canResend ? () => logic.resend(widget.email) : null,
                    child: Text(
                      logic.canResend ? 'Resend code' : 'Resend code (${logic.resendLeft.value}s)',
                      style: TextStyle(
                        color: logic.canResend ? _green : _green.withValues(alpha: 0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

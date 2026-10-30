import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../logic/bind_email_logic.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../common/theme/app_text.dart';
import '../../../common/widgets/app_scaffold.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 邮箱页：登录与绑定共用的 Welcome Back 流程。
class BindEmailPage extends GetView<BindEmailLogic> {
  const BindEmailPage({super.key});

  static const Color _green = AppColors.green1CFF8A;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final canSubmit = controller.canSubmit;
      return AppScaffold(
        backgroundColor: AppColors.black111111,
        appBar: AppNavBar(),
        backdrop: Chimo.image(
          AppAssets.homeTopBg,
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
                  color: AppColors.grayB0B0B0,
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
                  color: AppColors.black2A2A2A,
                  borderRadius: BorderRadius.circular(27),
                ),
                child: TextField(
                  controller: controller.input,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  style: AppText.field,
                  cursorColor: _green,
                  decoration: const AppInputDecoration(
                    isDense: true,
                    hintText: 'Enter your Email',
                    hintStyle: TextStyle(
                      color: AppColors.gray8A8A8A,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Chimo.s.primaryButton(
                label: 'Get Verification Code',
                onTap: controller.getCode,
                enabled: canSubmit,
                loading: controller.sending.value,
                color: _green,
                disabledColor: AppColors.gray333333,
                disabledLabelColor: AppColors.gray8A8A8A,
                borderRadius: 27,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class BindEmailCodePage extends GetView<EmailCodeLogic> {
  const BindEmailCodePage({super.key});

  static const Color _green = AppColors.green1CFF8A;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Obx(() {
      final canVerify = controller.canVerify;
      return AppScaffold(
        backgroundColor: AppColors.black111111,
        // appBar: AppNavBar(title: 'Check your email!'),
        backdrop: Chimo.image(
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
              Chimo.gap(height: 28),
              const Text(
                'Check your email!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              Chimo.gap(height: 12),
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    color: AppColors.grayB0B0B0,
                    fontSize: 15,
                    height: 1.45,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    const TextSpan(text: 'We just sent a magic key to '),
                    TextSpan(
                      text: controller.email,
                      style: const TextStyle(color: _green, fontWeight: FontWeight.w600),
                    ),
                    const TextSpan(text: '. Enter it below to meet your crew.'),
                  ],
                ),
              ),
              Chimo.gap(height: 28),
              Container(
                height: 54,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: AppColors.black2A2A2A,
                  borderRadius: BorderRadius.circular(27),
                ),
                child: TextField(
                  controller: controller.input,
                  focusNode: controller.focusNode,
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
                      color: AppColors.gray8A8A8A,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
              Chimo.gap(height: 20),
              Chimo.s.primaryButton(
                label: 'Verify & Continue',
                onTap: controller.verify,
                enabled: canVerify,
                loading: controller.verifying.value,
                color: _green,
                disabledColor: AppColors.gray333333,
                disabledLabelColor: AppColors.gray8A8A8A,
                borderRadius: 27,
              ),
              Chimo.gap(height: 22),
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
                    onTap: controller.canResend ? controller.resend : null,
                    child: Text(
                      controller.canResend
                          ? 'Resend code'
                          : 'Resend code (${controller.resendLeft.value}s)',
                      style: TextStyle(
                        color: controller.canResend ? _green : _green.withValues(alpha: 0.7),
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

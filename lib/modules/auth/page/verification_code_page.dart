import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import 'package:chimo/common/utils/chimo.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/verification_logic.dart';

/// 手机验证码页（原六格 UI，背景与邮箱登录同款）。
///
/// [VerificationLogic] 由路由 binding 注入，输入框和发码都在 logic 里。
class VerificationCodePage extends GetView<VerificationLogic> {
  const VerificationCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.black111111,
      appBar: AppNavBar(),
      backdrop: Chimo.image(
        AppAssets.homeTopBg,
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Please enter the verification code',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'The verification code has been sent to your phone number below.',
              style: TextStyle(
                color: AppColors.grayB0B0B0,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              controller.maskedPhone,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 36),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => controller.focusNode.requestFocus(),
              child: Obx(() {
                final code = controller.code.value;
                final submitting = controller.submitting.value;
                return Stack(
                  children: [
                    Row(
                      children: List.generate(VerificationLogic.codeLength, (i) {
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: i == 0 ? 0 : 8),
                            child: Container(
                              height: 52,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.black2A2A2A,
                                borderRadius: BorderRadius.circular(12),
                                border: (i == code.length && !submitting)
                                    ? Border.all(color: AppColors.green1CFF8A, width: 1.5)
                                    : Border.all(color: Colors.transparent, width: 1.5),
                              ),
                              child: submitting && i == 0
                                  ? SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppColors.green1CFF8A,
                                      ),
                                    )
                                  : Text(
                                      i < code.length ? code[i] : '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          ),
                        );
                      }),
                    ),
                    Opacity(
                      opacity: 0,
                      child: TextField(
                        controller: controller.input,
                        focusNode: controller.focusNode,
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        enabled: !submitting,
                        showCursor: false,
                        enableInteractiveSelection: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(VerificationLogic.codeLength),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 22),
            Obx(() {
              final canResend = controller.canResend;
              return Wrap(
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
                    onTap: canResend ? () => unawaited(controller.send()) : null,
                    child: Text(
                      canResend ? 'Resend code' : 'Resend code (${controller.resendLeft.value}s)',
                      style: TextStyle(
                        color: canResend
                            ? AppColors.green1CFF8A
                            : AppColors.green1CFF8A.withValues(alpha: 0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

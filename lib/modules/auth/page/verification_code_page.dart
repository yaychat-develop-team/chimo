import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/verification_logic.dart';

/// 手机验证码页（原六格 UI，背景与邮箱登录同款）。
class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key, required this.phone});

  final String phone;

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  static const Color _green = AppColors.accentNeon;
  static const double _gap = 8;

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late final VerificationLogic logic;
  Worker? _codeSync;

  @override
  void initState() {
    super.initState();
    logic = Get.put(VerificationLogic(phone: widget.phone));
    _codeSync = ever(logic.code, (value) {
      if (_controller.text == value) return;
      _controller.value = TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
      if (value.isEmpty) _focusNode.requestFocus();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _focusNode.requestFocus();
      logic.send(initial: true);
    });
  }

  @override
  void dispose() {
    _codeSync?.dispose();
    _controller.dispose();
    _focusNode.dispose();
    Get.delete<VerificationLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return ChimoScaffold(
      backgroundColor: AppColors.surface,
      backdrop: AppImage(
        AppAssets.homeTopBg,
        width: screenWidth,
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
                color: AppColors.textGrayB0,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              logic.maskedPhone,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 36),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _focusNode.requestFocus(),
              child: Obx(() {
                final code = logic.code.value;
                final submitting = logic.submitting.value;
                return Stack(
                  children: [
                    Row(
                      children: [
                        for (var i = 0; i < VerificationLogic.codeLength; i++) ...[
                          if (i > 0) const SizedBox(width: _gap),
                          Expanded(
                            child: Container(
                              height: 52,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.tagBackground,
                                borderRadius: BorderRadius.circular(12),
                                border: (i == code.length && !submitting)
                                    ? Border.all(color: _green, width: 1.5)
                                    : Border.all(color: Colors.transparent, width: 1.5),
                              ),
                              child: submitting && i == 0
                                  ? SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: _green,
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
                        ],
                      ],
                    ),
                    Opacity(
                      opacity: 0,
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        enabled: !submitting,
                        showCursor: false,
                        enableInteractiveSelection: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(VerificationLogic.codeLength),
                        ],
                        onChanged: logic.onInput,
                      ),
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 22),
            Obx(() {
              final canResend = logic.canResend;
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
                    onTap: canResend ? logic.resend : null,
                    child: Text(
                      canResend ? 'Resend code' : 'Resend code (${logic.resendLeft.value}s)',
                      style: TextStyle(
                        color: canResend ? _green : _green.withValues(alpha: 0.7),
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

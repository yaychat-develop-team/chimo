import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/auth/apple_auth_state.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/constants/app_links.dart';
import '../../../app/app_config.dart';
import '../logic/login_logic.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_webview_page.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/theme/app_bottom_sheet.dart';

/// 登录页：正式环境写死 Apple + Email；测试环境可按 `/auth/login-platforms` 调整入口。
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(LoginLogic());
  }

  @override
  void dispose() {
    Get.delete<LoginLogic>();
    super.dispose();
  }

  Future<void> _openAgreement(String title) {
    final url = title.contains('Privacy') ? AppLinks.privacyAgreement : AppLinks.userAgreement;
    return AppWebViewPage.open(context, url: url, title: title);
  }

  Future<bool> _ensureAgreed() async {
    if (logic.agreed.value) return true;
    final accepted = await AppBottomSheet.show<bool>(
      isScrollControlled: true,
      child: _WelcomeAgreementSheet(onOpenAgreement: (title) => unawaited(_openAgreement(title))),
    );
    if (!mounted || accepted != true) return false;
    logic.acceptAgreement();
    return true;
  }

  Future<void> _openEmailLogin() async {
    if (!await _ensureAgreed()) return;
    if (!mounted) return;
    AppJumper.toBindEmail(forLogin: true);
  }

  Future<void> _openPhoneLogin() async {
    if (!await _ensureAgreed()) return;
    if (!mounted) return;
    AppJumper.toPhoneLogin();
  }

  Future<void> _openAppleLogin() async {
    if (logic.appleSigningIn.value) return;
    if (!await _ensureAgreed()) return;
    if (!mounted || !logic.beginAppleSignIn()) return;
    try {
      await AppleAuthState.signIn(context);
    } finally {
      logic.endAppleSignIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final screenH = MediaQuery.sizeOf(context).height;

    return ChimoScaffold(
      showNav: false,
      safeArea: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-0.9, -1.1),
                radius: 1.2,
                colors: [AppColors.glowPrimary, AppColors.transparent],
              ),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0.95, -1.05),
                radius: 1.1,
                colors: [AppColors.glowLoginBlue, AppColors.transparent],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(32, screenH * 0.06, 32, 16 + bottom),
              child: Obx(
                () => Column(
                  children: [
                    AppImage(AppAssets.splashLogo, width: 120, height: 120, fit: BoxFit.contain),
                    const SizedBox(height: 20),
                    AppImage(AppAssets.splashTitle, height: 36, fit: BoxFit.contain),
                    const SizedBox(height: 10),
                    AppImage(AppAssets.splashSlogan, height: 16, fit: BoxFit.contain),
                    const Spacer(flex: 3),
                    // 正式环境固定入口；非正式环境按登录平台接口控制显隐。
                    if (logic.showAppleLogin) ...[
                      _AppleLoginButton(
                        onTap: _openAppleLogin,
                        loading: logic.appleSigningIn.value,
                      ),
                      const SizedBox(height: 16),
                    ],
                    if (logic.showEmailLogin.value) _EmailLoginButton(onTap: _openEmailLogin),
                    if (logic.showEmailLogin.value) const SizedBox(height: 18),
                    _AgreementRow(
                      agreed: logic.agreed.value,
                      onToggle: logic.toggleAgreed,
                      onTermsTap: () => _openAgreement('User Service Agreement'),
                      onPrivacyTap: () => _openAgreement('Privacy Agreement'),
                    ),
                    const SizedBox(height: 20),
                    if (AppConfig.isDebug)
                      GestureDetector(
                        onTap: () {
                          AppJumper.toDebug();
                        },
                        child: const Text(
                          'Debug Page',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    if (AppConfig.isDebug) const Spacer(flex: 2) else const Spacer(flex: 3),
                    if (logic.showPhoneLogin.value) ...[
                      const _OrContinueDivider(),
                      const SizedBox(height: 20),
                      _PhoneLoginButton(onTap: _openPhoneLogin),
                      const SizedBox(height: 8),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// forya Apple 主按钮：白底 Stadium + 深色文案。
class _AppleLoginButton extends StatelessWidget {
  const _AppleLoginButton({required this.onTap, this.loading = false});

  final VoidCallback onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        onTap: loading ? null : onTap,
        borderRadius: BorderRadius.circular(28),
        child: SizedBox(
          height: 54,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (loading)
                const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.outline),
                )
              else
                AppImage(AppAssets.appleIcon, width: 28, height: 28, fit: BoxFit.contain),
              const SizedBox(width: 12),
              const Text(
                'Sign in with Apple',
                style: TextStyle(
                  color: AppColors.outline,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailLoginButton extends StatelessWidget {
  const _EmailLoginButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceField,
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: SizedBox(
          height: 54,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage(AppAssets.emailIcon, width: 22, height: 22, fit: BoxFit.contain),
              const SizedBox(width: 10),
              const Text(
                'Sign in with Email',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhoneLoginButton extends StatelessWidget {
  const _PhoneLoginButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.outlineField, width: 1),
          ),
          child: const Icon(Icons.smartphone_outlined, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}

class _OrContinueDivider extends StatelessWidget {
  const _OrContinueDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.outlineFieldClear, AppColors.outlineField],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Or Continue with',
            style: TextStyle(
              color: AppColors.textTertiary,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.outlineField, AppColors.outlineFieldClear],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AgreementRow extends StatefulWidget {
  const _AgreementRow({
    required this.agreed,
    required this.onToggle,
    required this.onTermsTap,
    required this.onPrivacyTap,
  });

  final bool agreed;
  final VoidCallback onToggle;
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyTap;

  @override
  State<_AgreementRow> createState() => _AgreementRowState();
}

class _AgreementRowState extends State<_AgreementRow> {
  late final TapGestureRecognizer _termsRecognizer;
  late final TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();
    _termsRecognizer = TapGestureRecognizer()..onTap = widget.onTermsTap;
    _privacyRecognizer = TapGestureRecognizer()..onTap = widget.onPrivacyTap;
  }

  @override
  void didUpdateWidget(covariant _AgreementRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    _termsRecognizer.onTap = widget.onTermsTap;
    _privacyRecognizer.onTap = widget.onPrivacyTap;
  }

  @override
  void dispose() {
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: widget.onToggle,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.only(top: 2, right: 8),
            child: AppImage(
              widget.agreed ? AppAssets.agreeChecked : AppAssets.agreeUnchecked,
              width: 18,
              height: 18,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                height: 1.4,
                fontWeight: FontWeight.w400,
              ),
              children: [
                const TextSpan(text: 'By continuing, you agree to Chimo\'s '),
                TextSpan(
                  text: 'User Service Agreement',
                  style: const TextStyle(
                    color: AppColors.primaryBright,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: _termsRecognizer,
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Agreement',
                  style: const TextStyle(
                    color: AppColors.primaryBright,
                    fontWeight: FontWeight.w500,
                  ),
                  recognizer: _privacyRecognizer,
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// 未勾选协议时的欢迎确认底部弹层。
class _WelcomeAgreementSheet extends StatefulWidget {
  const _WelcomeAgreementSheet({required this.onOpenAgreement});

  final ValueChanged<String> onOpenAgreement;

  @override
  State<_WelcomeAgreementSheet> createState() => _WelcomeAgreementSheetState();
}

class _WelcomeAgreementSheetState extends State<_WelcomeAgreementSheet> {
  late final TapGestureRecognizer _termsRecognizer;
  late final TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();
    _termsRecognizer = TapGestureRecognizer()
      ..onTap = () => widget.onOpenAgreement('User Service Agreement');
    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = () => widget.onOpenAgreement('Privacy Agreement');
  }

  @override
  void dispose() {
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.center,
          colors: [AppColors.tintGreenWhite, AppColors.textGrayF5],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, 28, 24, 20 + bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome to Chimo',
              style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 14),
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  color: AppColors.textGray66,
                  fontSize: 14,
                  height: 1.45,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  const TextSpan(
                    text:
                        'Thank you for your support. In order to better protect your rights, please read and agree to the following: ',
                  ),
                  TextSpan(
                    text: 'User Service Agreement',
                    style: const TextStyle(
                      color: AppColors.primaryBright,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: _termsRecognizer,
                  ),
                  const TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Agreement',
                    style: const TextStyle(
                      color: AppColors.primaryBright,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: _privacyRecognizer,
                  ),
                  const TextSpan(text: ' Chimo strictly protects your personal information.'),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Material(
              color: AppColors.primaryBright,
              borderRadius: BorderRadius.circular(28),
              child: InkWell(
                onTap: () => AppJumper.back(result: true),
                borderRadius: BorderRadius.circular(28),
                child: const SizedBox(
                  height: 52,
                  child: Center(
                    child: Text(
                      'Accept and Continue',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Material(
              color: AppColors.textGrayE8,
              borderRadius: BorderRadius.circular(28),
              child: InkWell(
                onTap: () => AppJumper.back(result: false),
                borderRadius: BorderRadius.circular(28),
                child: const SizedBox(
                  height: 52,
                  child: Center(
                    child: Text(
                      'Decline',
                      style: TextStyle(
                        color: AppColors.textGray66,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

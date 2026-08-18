import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/auth/apple_sign_in.dart';
import '../../core/constants/app_assets.dart';
import '../../core/network/app_apis.dart';
import '../../core/network/api_config.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_webview_page.dart';
import '../debug/debug_page.dart';

/// 登录页：iOS 上 Apple + Email 主按钮（对齐 forya）；Android 为 Email + Phone。
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const _userAgreementUrl =
      'https://www.chimoapp.com/agreements/yonghufuwu.html';
  static const _privacyAgreementUrl =
      'https://www.chimoapp.com/agreements/yinsi.html';

  bool _agreed = false;
  bool _appleSigningIn = false;
  bool _showAppleEntry = true;
  bool _showEmailLogin = true;
  bool _showPhoneLogin = false;

  bool get _showAppleLogin =>
      AppleSignInAuth.isSupportedPlatform && _showAppleEntry;

  @override
  void initState() {
    super.initState();
    _applyProductionDefaults();
    if (!ApiConfig.isOfficial) {
      unawaited(_loadLoginPlatforms());
    }
  }

  void _applyProductionDefaults() {
    _showAppleEntry = AppleSignInAuth.isSupportedPlatform;
    _showEmailLogin = true;
    _showPhoneLogin = ApiConfig.isDebug;
  }

  Future<void> _loadLoginPlatforms() async {
    try {
      final res = await AppApis.auth.loginPlatforms();
      if (!mounted || !res.ok || res.data == null) return;
      final config = res.data!;
      final showApple =
          config.supports('apple') ||
          config.supports('appleid') ||
          config.supports('apple_id');
      setState(() {
        _showAppleEntry = showApple;
        _showEmailLogin = config.supports('email');
        _showPhoneLogin =
            config.supports('phone') ||
            config.supports('sms') ||
            config.supports('mobile');
      });
      if (!_showAppleEntry && !_showEmailLogin && !_showPhoneLogin) {
        setState(_applyProductionDefaults);
      }
    } catch (_) {
      // 非正式环境接口失败时保留本地默认入口。
    }
  }

  Future<void> _openAgreement(String title) {
    final url = title.contains('Privacy')
        ? _privacyAgreementUrl
        : _userAgreementUrl;
    return AppWebViewPage.open(context, url: url, title: title);
  }

  Future<void> _openAgreementFromSheet(
    BuildContext sheetContext,
    String title,
  ) {
    final url = title.contains('Privacy')
        ? _privacyAgreementUrl
        : _userAgreementUrl;
    return AppWebViewPage.open(sheetContext, url: url, title: title);
  }

  Future<bool> _ensureAgreed() async {
    if (_agreed) return true;
    final accepted = await showModalBottomSheet<bool>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (sheetContext) => _WelcomeAgreementSheet(
        onOpenAgreement: (title) {
          unawaited(_openAgreementFromSheet(sheetContext, title));
        },
      ),
    );
    if (!mounted || accepted != true) return false;
    setState(() => _agreed = true);
    return true;
  }

  Future<void> _openEmailLogin() async {
    if (!await _ensureAgreed()) return;
    if (!mounted) return;
    context.push(AppRoutes.bindEmailLogin);
  }

  Future<void> _openPhoneLogin() async {
    if (!await _ensureAgreed()) return;
    if (!mounted) return;
    context.push(AppRoutes.phoneLogin);
  }

  Future<void> _openAppleLogin() async {
    if (_appleSigningIn) return;
    if (!await _ensureAgreed()) return;
    if (!mounted) return;
    setState(() => _appleSigningIn = true);
    try {
      await AppleSignInAuth.signIn(context);
    } finally {
      if (mounted) setState(() => _appleSigningIn = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final screenH = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-0.9, -1.1),
                radius: 1.2,
                colors: [
                  Color(0x6624B572),
                  Color(0x00000000),
                ],
              ),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0.95, -1.05),
                radius: 1.1,
                colors: [
                  Color(0x55203A8C),
                  Color(0x00000000),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(32, screenH * 0.06, 32, 16 + bottom),
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.splashLogo,
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    AppAssets.splashTitle,
                    height: 36,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    AppAssets.splashSlogan,
                    height: 16,
                    fit: BoxFit.contain,
                  ),
                  const Spacer(flex: 3),
                  // 正式环境固定入口；非正式环境按登录平台接口控制显隐。
                  if (_showAppleLogin) ...[
                    _AppleLoginButton(
                      onTap: _openAppleLogin,
                      loading: _appleSigningIn,
                    ),
                    const SizedBox(height: 16),
                  ],
                  if (_showEmailLogin) _EmailLoginButton(onTap: _openEmailLogin),
                  if (_showEmailLogin) const SizedBox(height: 18),
                  _AgreementRow(
                    agreed: _agreed,
                    onToggle: () => setState(() => _agreed = !_agreed),
                    onTermsTap: () =>
                        _openAgreement('User Service Agreement'),
                    onPrivacyTap: () =>
                        _openAgreement('Privacy Agreement'),
                  ),
                  const SizedBox(height: 20),
                  if (ApiConfig.isDebug)
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const DebugPage(),
                          ),
                        );
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
                  if (ApiConfig.isDebug) const Spacer(flex: 2) else const Spacer(flex: 3),
                  if (_showPhoneLogin) ...[
                    const _OrContinueDivider(),
                    const SizedBox(height: 20),
                    _PhoneLoginButton(onTap: _openPhoneLogin),
                    const SizedBox(height: 8),
                  ],
                ],
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
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Color(0xFF333333),
                  ),
                )
              else
                Image.asset(
                  AppAssets.appleIcon,
                  width: 28,
                  height: 28,
                  fit: BoxFit.contain,
                ),
              const SizedBox(width: 12),
              const Text(
                'Sign in with Apple',
                style: TextStyle(
                  color: Color(0xFF333333),
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
      color: const Color(0xFF2C2C2E),
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
              Image.asset(
                AppAssets.emailIcon,
                width: 22,
                height: 22,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              const Text(
                'Sign in with Email',
                style: TextStyle(
                  color: Colors.white,
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
            border: Border.all(color: const Color(0xFF3A3A3C), width: 1),
          ),
          child: const Icon(
            Icons.smartphone_outlined,
            color: Colors.white,
            size: 28,
          ),
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
                colors: [Color(0x003A3A3C), Color(0xFF3A3A3C)],
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
                colors: [Color(0xFF3A3A3C), Color(0x003A3A3C)],
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
            child: Image.asset(
              widget.agreed
                  ? AppAssets.agreeChecked
                  : AppAssets.agreeUnchecked,
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
                const TextSpan(
                  text: 'By continuing, you agree to Chimo\'s ',
                ),
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
          colors: [
            Color(0xFFE8FFE8),
            Color(0xFFF5F5F5),
          ],
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
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 14),
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  color: Color(0xFF666666),
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
                  const TextSpan(
                    text:
                        ' Chimo strictly protects your personal information.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Material(
              color: AppColors.primaryBright,
              borderRadius: BorderRadius.circular(28),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(true),
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
              color: const Color(0xFFE8E8E8),
              borderRadius: BorderRadius.circular(28),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(false),
                borderRadius: BorderRadius.circular(28),
                child: const SizedBox(
                  height: 52,
                  child: Center(
                    child: Text(
                      'Decline',
                      style: TextStyle(
                        color: Color(0xFF666666),
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

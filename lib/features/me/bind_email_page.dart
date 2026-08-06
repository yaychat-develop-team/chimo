import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/auth/auth_session.dart';
import '../../core/constants/app_assets.dart';
import '../../core/network/app_apis.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_primary_button.dart';
import '../../core/widgets/center_toast.dart';

/// Email page: shared Welcome Back flow for login and binding.
class BindEmailPage extends StatefulWidget {
  const BindEmailPage({
    super.key,
    this.initialEmail = '',
    this.forLogin = false,
  });

  final String initialEmail;

  /// `true`: login flow, go to main after verify; `false`: bind then pop.
  final bool forLogin;

  @override
  State<BindEmailPage> createState() => _BindEmailPageState();
}

class _BindEmailPageState extends State<BindEmailPage> {
  static const Color _green = Color(0xFF1CFF8A);
  // Keep validation permissive: some IMEs / copy-paste strings may include
  // subtle characters; we only need "looks like an email" to enable the CTA.
  static final RegExp _emailRegExp = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  late final TextEditingController _emailController;
  bool _sending = false;

  // Normalize: strip hidden whitespace (copy/paste / IME can inject).
  String get _email =>
      _emailController.text.replaceAll(RegExp(r'\s+'), '').trim();

  bool get _isValidEmail => _emailRegExp.hasMatch(_email);

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.initialEmail);
    _emailController.addListener(() => setState(() {}));
    if (widget.initialEmail.trim().isEmpty) {
      unawaited(_prefillLastEmail());
    }
  }

  Future<void> _prefillLastEmail() async {
    final last = (await AuthSession.email())?.trim() ?? '';
    if (!mounted || last.isEmpty) return;
    if (_emailController.text.trim().isNotEmpty) return;
    _emailController.text = last;
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _onGetCode() async {
    if (!_isValidEmail || _sending) return;
    setState(() => _sending = true);
    try {
      // Match forya: just cache email and navigate; code page will request OTP.
      await AuthSession.rememberEmail(_email);
      if (!mounted) return;
      final bound = await Navigator.of(context).push<bool>(
        MaterialPageRoute<bool>(
          builder: (_) => _BindEmailCodePage(
            email: _email,
            forLogin: widget.forLogin,
            sendOnOpen: true,
          ),
        ),
      );
      if (!mounted || bound != true) return;
      if (widget.forLogin) return;
      Navigator.of(context).pop(true);
    } catch (error) {
      if (!mounted) return;
      showCenterToast(context, message: 'Failed to continue: $error');
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final canSubmit = _isValidEmail && !_sending;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 220,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0x5524B572),
                      Color(0x33203A8C),
                      Color(0x00000000),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: SvgPicture.asset(
                          AppAssets.chatBack,
                          width: 17,
                          height: 7,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
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
                        color: Color(0xFFB0B0B0),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Container(
                      height: 54,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(27),
                      ),
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        cursorColor: _green,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter your Email',
                          hintStyle: TextStyle(
                            color: Color(0xFF8A8A8A),
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
                      loading: _sending,
                      color: _green,
                      disabledColor: const Color(0xFF3A3A3A),
                      disabledLabelColor: const Color(0xFF8A8A8A),
                      borderRadius: 27,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BindEmailCodePage extends StatefulWidget {
  const _BindEmailCodePage({
    required this.email,
    this.forLogin = false,
    this.sendOnOpen = false,
  });

  final String email;
  final bool forLogin;

  /// When true, request `/auth/send-email-code` on open (forya EmailLoginCodePage).
  final bool sendOnOpen;

  @override
  State<_BindEmailCodePage> createState() => _BindEmailCodePageState();
}

class _BindEmailCodePageState extends State<_BindEmailCodePage> {
  static const Color _green = Color(0xFF1CFF8A);
  static const int _codeLength = 6;
  static const int _resendSeconds = 60;

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _resendTimer;
  int _resendLeft = 0;
  bool _verifying = false;
  bool _resending = false;

  bool get _canVerify =>
      _controller.text.trim().length == _codeLength && !_verifying;

  bool get _canResend => _resendLeft <= 0 && !_resending;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
    if (widget.sendOnOpen) {
      // Start countdown only after a successful send (or keep prior timer UX).
      WidgetsBinding.instance.addPostFrameCallback((_) {
        unawaited(_sendCode(initial: true));
      });
    } else {
      _startResendCountdown();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _startResendCountdown() {
    _resendTimer?.cancel();
    setState(() => _resendLeft = _resendSeconds);
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_resendLeft <= 1) {
        timer.cancel();
        setState(() => _resendLeft = 0);
        return;
      }
      setState(() => _resendLeft -= 1);
    });
  }

  Future<void> _sendCode({bool initial = false}) async {
    if (_resending) return;
    setState(() => _resending = true);
    try {
      final res = await AppApis.auth.sendEmailCode(email: widget.email);
      if (!mounted) return;
      if (!res.ok) {
        showCenterToast(
          context,
          message: res.message.isEmpty ? 'Failed to send code' : res.message,
        );
        if (initial) {
          // Allow immediate retry when first send fails.
          setState(() => _resendLeft = 0);
        }
        return;
      }
      if (!initial) {
        showCenterToast(context, message: 'Verification code resent');
      }
      _startResendCountdown();
    } catch (error) {
      if (!mounted) return;
      showCenterToast(context, message: 'Failed to send code: $error');
      if (initial) setState(() => _resendLeft = 0);
    } finally {
      if (mounted) setState(() => _resending = false);
    }
  }

  Future<void> _onResend() async {
    if (!_canResend) return;
    await _sendCode();
  }

  Future<void> _onVerify() async {
    if (!_canVerify) return;
    final code = _controller.text.trim();
    setState(() => _verifying = true);
    try {
      if (widget.forLogin) {
        final res = await AppApis.auth.emailAuth(
          email: widget.email,
          code: code,
        );
        if (!mounted) return;
        if (!res.ok || res.data == null) {
          var msg =
              res.message.isEmpty ? 'Verification failed' : res.message;
          if (widget.forLogin &&
              msg.toLowerCase().contains('unauthorized')) {
            msg =
                'This email is not registered in the current test backend. Please use phone login or bind email first.';
          }
          showCenterToast(
            context,
            message: msg,
          );
          return;
        }
        final payload = res.data!;
        var token = payload.token;

        final nickname = payload.nickname;
        final avatarUrl = payload.avatarUrl;

        await AuthSession.markLoggedIn(
          method: 'email',
          email: widget.email,
          token: token,
          userId: payload.userId,
          nickname: nickname,
          avatarUrl: avatarUrl,
          emUsername: payload.emUsername,
          emPassword: payload.emPassword,
        );

        await NetworkBootstrap.applySessionToken(token);

        // Match forya LoginManager: refresh token once after emailAuth.
        final refresh = await NetworkBootstrap.api.refreshToken();
        if (refresh.success && refresh.data is Map) {
          final next = '${(refresh.data as Map)['token'] ?? ''}'.trim();
          if (next.isNotEmpty && next != token) {
            token = next;
            await NetworkBootstrap.applySessionToken(token);
            await AuthSession.markLoggedIn(
              method: 'email',
              email: widget.email,
              token: token,
              userId: payload.userId,
              nickname: nickname,
              avatarUrl: avatarUrl,
              emUsername: payload.emUsername,
              emPassword: payload.emPassword,
            );
          }
        }

        unawaited(NetworkBootstrap.connectImAfterLogin());
        if (!mounted) return;
        context.go(AppRoutes.shell);
        return;
      }

      final res = await AppApis.auth.bindEmail(
        email: widget.email,
        code: code,
      );
      if (!mounted) return;
      if (!res.ok) {
        showCenterToast(
          context,
          message: res.message.isEmpty ? 'Bind failed' : res.message,
        );
        return;
      }
      await AuthSession.markLoggedIn(email: widget.email);
      if (!mounted) return;
      showCenterToast(context, message: 'Email bound successfully');
      Navigator.of(context).pop(true);
    } catch (error) {
      if (!mounted) return;
      showCenterToast(context, message: 'Verification failed: $error');
    } finally {
      if (mounted) setState(() => _verifying = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final canVerify = _canVerify;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 220,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0x5524B572),
                      Color(0x33203A8C),
                      Color(0x00000000),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: SvgPicture.asset(
                          AppAssets.chatBack,
                          width: 17,
                          height: 7,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
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
                          color: Color(0xFFB0B0B0),
                          fontSize: 15,
                          height: 1.45,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          const TextSpan(
                            text: 'We just sent a magic key to ',
                          ),
                          TextSpan(
                            text: widget.email,
                            style: const TextStyle(
                              color: _green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const TextSpan(
                            text: '. Enter it below to meet your crew.',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    Container(
                      height: 54,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(27),
                      ),
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        keyboardType: TextInputType.number,
                        maxLength: _codeLength,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                        ),
                        cursorColor: _green,
                        decoration: const InputDecoration(
                          isDense: true,
                          counterText: '',
                          border: InputBorder.none,
                          hintText: 'Enter 6-digit code',
                          hintStyle: TextStyle(
                            color: Color(0xFF8A8A8A),
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
                      onTap: _onVerify,
                      enabled: canVerify,
                      loading: _verifying,
                      color: _green,
                      disabledColor: const Color(0xFF3A3A3A),
                      disabledLabelColor: const Color(0xFF8A8A8A),
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
                          onTap: _canResend ? _onResend : null,
                          child: Text(
                            _canResend
                                ? 'Resend code'
                                : 'Resend code (${_resendLeft}s)',
                            style: TextStyle(
                              color: _canResend
                                  ? _green
                                  : _green.withValues(alpha: 0.7),
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
            ),
          ],
        ),
      ),
    );
  }
}

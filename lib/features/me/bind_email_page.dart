import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/auth/auth_session.dart';
import '../../core/constants/app_assets.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';
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
  static final RegExp _emailRegExp = RegExp(
    r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
  );

  late final TextEditingController _emailController;
  bool _sending = false;

  String get _email => _emailController.text.trim();

  bool get _isValidEmail => _emailRegExp.hasMatch(_email);

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.initialEmail);
    _emailController.addListener(() => setState(() {}));
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
      final res = await NetworkBootstrap.api.sendEmailCode(email: _email);
      if (!mounted) return;
      if (!res.success) {
        showCenterToast(
          context,
          message: res.message.isEmpty ? 'Failed to send code' : res.message,
        );
        return;
      }
      final bound = await Navigator.of(context).push<bool>(
        MaterialPageRoute<bool>(
          builder: (_) => _BindEmailCodePage(
            email: _email,
            forLogin: widget.forLogin,
          ),
        ),
      );
      if (!mounted || bound != true) return;
      if (widget.forLogin) return;
      Navigator.of(context).pop();
    } catch (error) {
      if (!mounted) return;
      showCenterToast(context, message: 'Failed to send code: $error');
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
                    Opacity(
                      opacity: canSubmit ? 1 : 0.45,
                      child: IgnorePointer(
                        ignoring: !canSubmit,
                        child: GestureDetector(
                          onTap: _onGetCode,
                          child: Container(
                            height: 54,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: canSubmit
                                  ? _green
                                  : const Color(0xFF3A3A3A),
                              borderRadius: BorderRadius.circular(27),
                            ),
                            child: Text(
                              'Get Verification Code',
                              style: TextStyle(
                                color: canSubmit
                                    ? Colors.black
                                    : const Color(0xFF8A8A8A),
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
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
  });

  final String email;
  final bool forLogin;

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
  int _resendLeft = _resendSeconds;
  bool _verifying = false;
  bool _resending = false;

  bool get _canVerify =>
      _controller.text.trim().length == _codeLength && !_verifying;

  bool get _canResend => _resendLeft <= 0 && !_resending;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
    _startResendCountdown();
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

  Future<void> _onResend() async {
    if (!_canResend) return;
    setState(() => _resending = true);
    try {
      final res =
          await NetworkBootstrap.api.sendEmailCode(email: widget.email);
      if (!mounted) return;
      if (!res.success) {
        showCenterToast(
          context,
          message: res.message.isEmpty ? 'Resend failed' : res.message,
        );
        return;
      }
      showCenterToast(context, message: 'Verification code resent');
      _startResendCountdown();
    } catch (error) {
      if (!mounted) return;
      showCenterToast(context, message: 'Resend failed: $error');
    } finally {
      if (mounted) setState(() => _resending = false);
    }
  }

  Future<void> _onVerify() async {
    if (!_canVerify) return;
    final code = _controller.text.trim();
    setState(() => _verifying = true);
    try {
      if (widget.forLogin) {
        final res = await NetworkBootstrap.api.emailAuth(
          email: widget.email,
          code: code,
        );
        if (!mounted) return;
        if (!res.success) {
          showCenterToast(
            context,
            message: res.message.isEmpty ? 'Verification failed' : res.message,
          );
          return;
        }
        final data = res.data;
        final map =
            data is Map ? Map<String, dynamic>.from(data) : <String, dynamic>{};
        final token = '${map['token'] ?? ''}';
        if (token.isEmpty) {
          showCenterToast(context, message: 'Login succeeded but token missing');
          return;
        }
        await AuthSession.markLoggedIn(
          method: 'email',
          email: widget.email,
          token: token,
          nickname: '${map['nickName'] ?? map['nickname'] ?? ''}',
          avatarUrl: '${map['avatar'] ?? map['avatarUrl'] ?? ''}',
        );
        await NetworkBootstrap.applySessionToken(token);
        if (!mounted) return;
        context.go(AppRoutes.shell);
        return;
      }

      final res = await NetworkBootstrap.api.bindEmail(
        email: widget.email,
        code: code,
      );
      if (!mounted) return;
      if (!res.success) {
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
                    Opacity(
                      opacity: canVerify ? 1 : 0.45,
                      child: IgnorePointer(
                        ignoring: !canVerify,
                        child: GestureDetector(
                          onTap: _onVerify,
                          child: Container(
                            height: 54,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: canVerify
                                  ? _green
                                  : const Color(0xFF3A3A3A),
                              borderRadius: BorderRadius.circular(27),
                            ),
                            child: Text(
                              'Verify & Continue',
                              style: TextStyle(
                                color: canVerify
                                    ? Colors.black
                                    : const Color(0xFF8A8A8A),
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
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

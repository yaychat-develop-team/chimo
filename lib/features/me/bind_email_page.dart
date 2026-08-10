import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/auth/auth_onboarding_gate.dart';
import '../../core/auth/auth_session.dart';
import '../../core/constants/app_assets.dart';
import '../../core/network/app_apis.dart';
import '../../core/network/email_auth_messages.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_primary_button.dart';
import '../../core/widgets/center_toast.dart';

/// 邮箱页：登录与绑定共用的 Welcome Back 流程。
class BindEmailPage extends StatefulWidget {
  const BindEmailPage({
    super.key,
    this.initialEmail = '',
    this.forLogin = false,
  });

  final String initialEmail;

  /// `true`：登录流程，验证后进入主页；`false`：绑定后 pop。
  final bool forLogin;

  @override
  State<BindEmailPage> createState() => _BindEmailPageState();
}

class _BindEmailPageState extends State<BindEmailPage> {
  static const Color _green = Color(0xFF1CFF8A);
  // 校验保持宽松：部分输入法 / 粘贴内容可能含隐蔽字符；
  // 只需「看起来像邮箱」即可启用 CTA。
  static final RegExp _emailRegExp = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  late final TextEditingController _emailController;
  bool _sending = false;

  // 规范化：去除隐藏空白（粘贴 / 输入法可能注入）。
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
      // 对齐 forya：仅缓存邮箱并跳转；验证码页再请求 OTP。
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
    final screenWidth = MediaQuery.sizeOf(context).width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                AppAssets.homeTopBg,
                width: screenWidth,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
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

  /// 为 true 时，打开即请求 `/auth/send-email-code`（forya EmailLoginCodePage）。
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
      // 仅在发送成功后开始倒计时（或沿用先前倒计时 UX）。
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
          message: EmailAuthMessages.friendly(
            res.message,
            fallback: 'Failed to send code',
          ),
        );
        if (initial) {
          // 首次发送失败时允许立即重试。
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
          showCenterToast(
            context,
            message: EmailAuthMessages.friendly(
              res.message,
              fallback: 'Verification failed',
            ),
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

        // 对齐 forya LoginManager：emailAuth 后刷新一次 token。
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
        final goHome = await AuthOnboardingGate.shouldEnterHome(
          payload.raw,
          email: widget.email,
        );
        if (!mounted) return;
        context.go(goHome ? AppRoutes.shell : AppRoutes.editProfileOnboarding);
        return;
      }

      // 手机登录后的绑定流程（forya EmailLoginCodePage isBind=true）。
      final res = await AppApis.auth.bindEmail(
        email: widget.email,
        code: code,
      );
      if (!mounted) return;
      if (!res.ok) {
        showCenterToast(
          context,
          message: EmailAuthMessages.friendly(
            res.message,
            fallback: 'Unable to bind email. Please try again.',
          ),
        );
        _controller.clear();
        setState(() {});
        _focusNode.requestFocus();
        return;
      }

      // 本地持久化邮箱，随后由 Me 页刷新 user/info（隐藏 Bind Email）。
      await AuthSession.markLoggedIn(email: widget.email);
      if (!mounted) return;
      // Forya：pop 验证码页 + 邮箱页；Me 根据结果重新加载资料。
      Navigator.of(context).pop(true);
      return;
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
    final screenWidth = MediaQuery.sizeOf(context).width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                AppAssets.homeTopBg,
                width: screenWidth,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
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

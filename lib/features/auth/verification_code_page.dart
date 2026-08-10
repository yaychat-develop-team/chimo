import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/auth/auth_onboarding_gate.dart';
import '../../core/auth/auth_session.dart';
import '../../core/auth/phone_auth.dart';
import '../../core/constants/app_assets.dart';
import '../../core/network/app_apis.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';

/// 手机验证码页（白底设计）。
class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key, required this.phone});

  final String phone;

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  static const int _codeLength = 6;

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _submitting = false;

  String get _maskedPhone {
    final p = widget.phone;
    if (p.length < 7) return p;
    return '${p.substring(0, 3)}****${p.substring(p.length - 4)}';
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    setState(() {});
    if (value.length == _codeLength) {
      _submitCode(value);
    }
  }

  Future<void> _submitCode(String code) async {
    if (_submitting) return;
    setState(() => _submitting = true);
    try {
      final res = await AppApis.auth.smsAuth(
        phone: PhoneAuth.toApiPhone(widget.phone),
        code: code,
      );
      if (!mounted) return;
      if (!res.ok || res.data == null) {
        final msg = res.message.trim();
        final friendly = msg == 'unauthorized registration'
            ? 'This number is not allowed to register on the test server. Try 13800138000 / 123456.'
            : (msg.isEmpty ? 'Verification failed' : msg);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(friendly),
            behavior: SnackBarBehavior.floating,
          ),
        );
        _controller.clear();
        setState(() {});
        _focusNode.requestFocus();
        return;
      }

      final payload = res.data!;
      final map = payload.raw;
      var token = payload.token;

      final nickname = payload.nickname.isNotEmpty
          ? payload.nickname
          : '${map['nickName'] ?? map['nickname'] ?? ''}';
      final avatarUrl = payload.avatarUrl.isNotEmpty
          ? payload.avatarUrl
          : '${map['avatar'] ?? map['avatarUrl'] ?? ''}';

      await AuthSession.markLoggedIn(
        method: 'phone',
        phone: widget.phone,
        token: token,
        userId: payload.userId,
        nickname: nickname,
        avatarUrl: avatarUrl,
        emUsername: payload.emUsername,
        emPassword: payload.emPassword,
      );
      await NetworkBootstrap.applySessionToken(token);

      // 对齐 forya LoginManager：smsAuth 后刷新一次 token。
      final refresh = await NetworkBootstrap.api.refreshToken();
      if (refresh.success && refresh.data is Map) {
        final next = '${(refresh.data as Map)['token'] ?? ''}'.trim();
        if (next.isNotEmpty && next != token) {
          token = next;
          await NetworkBootstrap.applySessionToken(token);
          await AuthSession.markLoggedIn(
            method: 'phone',
            phone: widget.phone,
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

      // 仅当昵称 + 性别已设置时跳过引导。
      final goHome = await AuthOnboardingGate.shouldEnterHome(map);
      if (!mounted) return;
      context.go(goHome ? AppRoutes.shell : AppRoutes.profileSetup);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Verification failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      _controller.clear();
      setState(() {});
      _focusNode.requestFocus();
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final code = _controller.text;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
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
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  'Please enter the verification code',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'The verification code has been sent to your phone number below.',
                  style: TextStyle(
                    color: Color(0xFF8A8A8A),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  _maskedPhone,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 36),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _focusNode.requestFocus(),
                  child: Stack(
                    children: [
                      Row(
                        children: List.generate(_codeLength, (i) {
                          final digit = i < code.length ? code[i] : '';
                          final isActive = i == code.length && !_submitting;
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: i == _codeLength - 1 ? 0 : 8,
                              ),
                              child: Container(
                                height: 52,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF0F0F0),
                                  borderRadius: BorderRadius.circular(12),
                                  border: isActive
                                      ? Border.all(
                                          color: AppColors.primaryBright,
                                          width: 1.5,
                                        )
                                      : null,
                                ),
                                child: _submitting && i == 0
                                    ? const SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        digit,
                                        style: const TextStyle(
                                          color: Colors.black,
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
                          controller: _controller,
                          focusNode: _focusNode,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          enabled: !_submitting,
                          showCursor: false,
                          enableInteractiveSelection: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(_codeLength),
                          ],
                          onChanged: _onChanged,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

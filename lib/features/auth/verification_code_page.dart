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

/// Phone verification code page (white background design).
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
      final res = await NetworkBootstrap.api.smsAuth(
        phone: widget.phone,
        code: code,
      );
      if (!mounted) return;
      if (!res.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              res.message.isEmpty ? 'Verification failed' : res.message,
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
        _controller.clear();
        setState(() {});
        _focusNode.requestFocus();
        return;
      }

      final data = res.data;
      final map = data is Map ? Map<String, dynamic>.from(data) : <String, dynamic>{};
      final token = '${map['token'] ?? ''}';
      if (token.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login succeeded but token missing'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      await AuthSession.markLoggedIn(
        method: 'phone',
        phone: widget.phone,
        token: token,
        userId: '${map['userId'] ?? map['uid'] ?? map['id'] ?? ''}',
        nickname: '${map['nickName'] ?? map['nickname'] ?? ''}',
        avatarUrl: '${map['avatar'] ?? map['avatarUrl'] ?? ''}',
        emUsername: '${map['emUsername'] ?? map['emUserName'] ?? ''}',
        emPassword: '${map['emPwd'] ?? map['emPassword'] ?? ''}',
      );
      await NetworkBootstrap.applySessionToken(token);
      unawaited(NetworkBootstrap.connectImAfterLogin());

      // Existing accounts (not newUser) skip onboarding → home.
      // Mirrors forya: AuthRsp.newUser / User.isRegister.
      final goHome = await _shouldEnterHome(map);
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

  /// True when this phone already has a registered profile → skip setup.
  Future<bool> _shouldEnterHome(Map<String, dynamic> authData) async {
    final newUserFlag = _readBool(authData['newUser']);
    if (newUserFlag == true) return false;
    if (newUserFlag == false) return true;

    try {
      final infoRes = await NetworkBootstrap.api.userInfo();
      final info = infoRes.data;
      if (infoRes.success && info is Map) {
        final registered = _readBool(info['isRegister']);
        if (registered == true) return true;
        if (registered == false) return false;

        final nick =
            '${info['nickName'] ?? info['nickname'] ?? authData['nickName'] ?? ''}';
        final gender = '${info['gender'] ?? authData['gender'] ?? ''}';
        // Profile already filled → treat as existing user.
        if (nick.trim().isNotEmpty && gender.trim().isNotEmpty) return true;
      }
    } catch (_) {
      // Fall through: prefer onboarding when uncertain.
    }

    // No clear signal of a completed profile → setup flow.
    final nick = '${authData['nickName'] ?? authData['nickname'] ?? ''}';
    final gender = '${authData['gender'] ?? ''}';
    return nick.trim().isNotEmpty && gender.trim().isNotEmpty;
  }

  static bool? _readBool(Object? value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is num) return value != 0;
    final text = '$value'.trim().toLowerCase();
    if (text == 'true' || text == '1') return true;
    if (text == 'false' || text == '0') return false;
    return null;
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

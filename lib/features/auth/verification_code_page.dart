import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/auth/auth_session.dart';
import '../../core/constants/app_assets.dart';
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
      _goProfileSetup();
    }
  }

  Future<void> _goProfileSetup() async {
    await AuthSession.markLoggedIn(method: 'phone', phone: widget.phone);
    if (!mounted) return;
    context.go(AppRoutes.profileSetup);
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
                          final isActive = i == code.length;
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
                                child: Text(
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
                      // Hidden input field for system numeric keyboard.
                      Opacity(
                        opacity: 0,
                        child: TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          keyboardType: TextInputType.number,
                          autofocus: true,
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import 'verification_code_page.dart';

/// Phone login page (white background design).
class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  final TextEditingController _phoneController = TextEditingController();

  /// Mainland China phone: starts with 1, second digit 3–9, 11 digits total.
  static final RegExp _phoneRegExp = RegExp(r'^1[3-9]\d{9}$');

  String get _phone => _phoneController.text.trim();

  bool get _isValidPhone => _phoneRegExp.hasMatch(_phone);

  bool get _canLogin => _isValidPhone;

  String? get _errorText {
    if (_phone.isEmpty || _phone.length < 11) return null;
    if (!_isValidPhone) return 'Please enter a valid phone number';
    return null;
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (!_isValidPhone) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid phone number'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => VerificationCodePage(phone: _phone),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 20 + bottom),
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
                Row(
                  children: [
                    Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0),
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: const Text(
                        '+86',
                        style: TextStyle(
                          color: Color(0xFFB0B0B0),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 52,
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F0F0),
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11),
                          ],
                          onChanged: (_) => setState(() {}),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          cursorColor: AppColors.primaryBright,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            isCollapsed: true,
                            hintText: 'Please enter your phone number.',
                            hintStyle: TextStyle(
                              color: Color(0xFFB0B0B0),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (_errorText != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    _errorText!,
                    style: const TextStyle(
                      color: Color(0xFFE44E50),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                Material(
                  color: _canLogin
                      ? AppColors.primaryBright
                      : const Color(0xFFE8E8E8),
                  borderRadius: BorderRadius.circular(28),
                  child: InkWell(
                    onTap: _canLogin ? _onLogin : null,
                    borderRadius: BorderRadius.circular(28),
                    child: SizedBox(
                      height: 54,
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: _canLogin
                                ? Colors.black
                                : const Color(0xFFB0B0B0),
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
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
      ),
    );
  }
}

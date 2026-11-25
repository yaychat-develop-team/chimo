import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../common/theme/app_text.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/phone_utils.dart';
import '../../../common/widgets/app_scaffold.dart';

/// 手机登录页（与邮箱登录同款背景）。
class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  static final RegExp _phonePattern = RegExp(r'^1[3-9]\d{9}$');

  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  bool get _valid => _phonePattern.hasMatch(_phoneController.text.trim());

  String? get _errorText {
    final value = _phoneController.text.trim();
    if (value.isEmpty || value.length < 11) return null;
    if (!_valid) return 'Please enter a valid phone number';
    return null;
  }

  void _login() {
    final value = _phoneController.text.trim();
    if (!_valid) {
      AppToast.error('Please enter a valid phone number');
      return;
    }
    // 先进入验证码页。测试服短信通道不可用时仍可输入验证码。
    AppJumper.toVerify(PhoneUtils.digitsOnly(value));
  }

  @override
  Widget build(BuildContext context) {
    final errorText = _errorText;
    return AppScaffold(
      backgroundColor: AppColors.black111111,
      appBar: AppNavBar(),
      backdrop: Chimo.image(
        AppAssets.homeTopBg,
        width: double.infinity,
        fit: BoxFit.fitWidth,
        alignment: Alignment.topCenter,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
              'Enter your phone number to begin your journey.',
              style: TextStyle(
                color: AppColors.grayB0B0B0,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Container(
                  height: 54,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.black2A2A2A,
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: const Text(
                    '+86',
                    style: TextStyle(
                      color: AppColors.gray8A8A8A,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 54,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: AppColors.black2A2A2A,
                      borderRadius: BorderRadius.circular(27),
                    ),
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                      onChanged: (_) => setState(() {}),
                      style: AppText.field,
                      cursorColor: AppColors.green1CFF8A,
                      decoration: const AppInputDecoration(
                        isDense: true,
                        hintText: 'Please enter your phone number.',
                        hintStyle: TextStyle(
                          color: AppColors.gray8A8A8A,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (errorText != null) ...[
              const SizedBox(height: 8),
              Text(
                errorText,
                style: const TextStyle(
                  color: AppColors.redE44E50,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
            const SizedBox(height: 20),
            Chimo.s.primaryButton(
              label: 'Get Verification Code',
              onTap: _login,
              enabled: _valid,
              color: AppColors.green1CFF8A,
              disabledColor: AppColors.gray333333,
              disabledLabelColor: AppColors.gray8A8A8A,
              borderRadius: 27,
            ),
          ],
        ),
      ),
    );
  }
}

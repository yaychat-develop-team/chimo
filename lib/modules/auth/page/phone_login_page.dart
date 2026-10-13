import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../common/theme/app_text.dart';
import '../logic/phone_login_logic.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/app_primary_button.dart';
import '../../../common/widgets/app_image.dart';

/// 手机登录页（与邮箱登录同款背景）。
class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  late final PhoneLoginLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(PhoneLoginLogic());
  }

  @override
  void dispose() {
    _phoneController.dispose();
    Get.delete<PhoneLoginLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChimoScaffold(
      backgroundColor: AppColors.surface,
      backdrop: AppImage(
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
                color: AppColors.textGrayB0,
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
                    color: AppColors.tagBackground,
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: const Text(
                    '+86',
                    style: TextStyle(
                      color: AppColors.textGray8A,
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
                      color: AppColors.tagBackground,
                      borderRadius: BorderRadius.circular(27),
                    ),
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                      onChanged: (value) => logic.phone.value = value,
                      style: AppText.field,
                      cursorColor: AppColors.accentNeon,
                      decoration: const AppInputDecoration(
                        isDense: true,
                        hintText: 'Please enter your phone number.',
                        hintStyle: TextStyle(
                          color: AppColors.textGray8A,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Obx(() {
              final errorText = logic.errorText;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (errorText != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      errorText,
                      style: const TextStyle(
                        color: AppColors.danger,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  AppPrimaryButton(
                    label: 'Get Verification Code',
                    onTap: logic.login,
                    enabled: logic.canLogin,
                    color: AppColors.accentNeon,
                    disabledColor: AppColors.outlineBright,
                    disabledLabelColor: AppColors.textGray8A,
                    borderRadius: 27,
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_links.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_text.dart';
import '../logic/account_cancellation_logic.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/app_webview_page.dart';

/// 注销账号协议页（对齐 forya AccountCancellationPage）。
class AccountCancellationPage extends StatefulWidget {
  const AccountCancellationPage({super.key});

  @override
  State<AccountCancellationPage> createState() => _AccountCancellationPageState();
}

class _AccountCancellationPageState extends State<AccountCancellationPage> {
  late final AccountCancellationLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(AccountCancellationLogic());
  }

  @override
  void dispose() {
    Get.delete<AccountCancellationLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Obx(
      () => ChimoScaffold(
        title: 'Cancel Account',
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                children: const [
                  _SectionTitle('1. The account is secure.'),
                  SizedBox(height: 9),
                  _SectionBody(
                    'There have been no significant risks such as being frozen (including wallet freezing), stolen, or banned for this account.',
                  ),
                  SizedBox(height: 24),
                  _SectionTitle(
                    '2. The assets in the account have been settled or voluntarily relinquished.',
                  ),
                  SizedBox(height: 9),
                  _SectionBody(
                    'All virtual assets, balances, and other virtual assets or rights within the wallet have been fully used or emptied. All income has been withdrawn. You have voluntarily relinquished all assets, rights, and income, and there are no outstanding debts.',
                  ),
                  SizedBox(height: 24),
                  _SectionTitle('3. There are no unresolved disputes for this account.'),
                  SizedBox(height: 9),
                  _SectionBody(
                    'The account applying for cancellation does not have any ongoing penalties, disputes, or litigations, including but not limited to complaints and reports.',
                  ),
                  SizedBox(height: 24),
                  _SectionTitle('4. The account will be unusable after cancellation.'),
                  SizedBox(height: 9),
                  _SectionBody(
                    'After the account cancellation is completed, this account can no longer be used, and all information will be permanently deleted. The mobile number, third-party accounts, and real-name authentication information associated with this account will be unlinked, and it won\'t be possible to associate other accounts within 90 days.',
                  ),
                  SizedBox(height: 24),
                  _SectionTitle('5. Q&A'),
                  SizedBox(height: 9),
                  _SectionBody(
                    'If you have any questions related to account cancellation, please contact the administrator.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 8, 24, 16 + bottom),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: logic.toggleAgreed,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2, right: 8),
                          child: Icon(
                            logic.agreed.value ? Icons.check_circle : Icons.radio_button_unchecked,
                            size: 18,
                            color: logic.agreed.value ? AppColors.accentLime : AppColors.textGray99,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              color: AppColors.textGray99,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              height: 1.35,
                            ),
                            children: [
                              const TextSpan(
                                text:
                                    'By clicking here, I state that I have read and understood the terms and conditions. ',
                              ),
                              TextSpan(
                                text: 'Account Cancellation Instructions',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    AppWebViewPage.open(
                                      context,
                                      url: AppLinks.accountCancellation,
                                      title: 'Account Cancellation Instructions',
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: Material(
                      color: logic.agreed.value ? AppColors.warningYellow : AppColors.textGrayE4,
                      borderRadius: BorderRadius.circular(26),
                      child: InkWell(
                        onTap: logic.agreed.value && !logic.submitting.value ? logic.submit : null,
                        borderRadius: BorderRadius.circular(26),
                        child: Center(
                          child: logic.submitting.value
                              ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.outline,
                                  ),
                                )
                              : Text(
                                  'Apply for account cancellation',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: logic.agreed.value ? AppColors.outline : Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppText.label);
  }
}

class _SectionBody extends StatelessWidget {
  const _SectionBody(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textGray99,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.4,
      ),
    );
  }
}

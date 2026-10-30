import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../common/constants/app_links.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_text.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/widgets/app_scaffold.dart';

/// 注销账号协议页（对齐 forya AccountCancellationPage）。
class AccountCancellationPage extends StatefulWidget {
  const AccountCancellationPage({super.key});

  @override
  State<AccountCancellationPage> createState() => _AccountCancellationPageState();
}

class _AccountCancellationPageState extends State<AccountCancellationPage> {
  static const _sections = [
    (
      question: '1. The account is secure.',
      answer:
          'There have been no significant risks such as being frozen (including wallet freezing), stolen, or banned for this account.',
    ),
    (
      question: '2. The assets in the account have been settled or voluntarily relinquished.',
      answer:
          'All virtual assets, balances, and other virtual assets or rights within the wallet have been fully used or emptied. All income has been withdrawn. You have voluntarily relinquished all assets, rights, and income, and there are no outstanding debts.',
    ),
    (
      question: '3. There are no unresolved disputes for this account.',
      answer:
          'The account applying for cancellation does not have any ongoing penalties, disputes, or litigations, including but not limited to complaints and reports.',
    ),
    (
      question: '4. The account will be unusable after cancellation.',
      answer:
          'After the account cancellation is completed, this account can no longer be used, and all information will be permanently deleted. The mobile number, third-party accounts, and real-name authentication information associated with this account will be unlinked, and it won\'t be possible to associate other accounts within 90 days.',
    ),
    (
      question: '5. Q&A',
      answer:
          'If you have any questions related to account cancellation, please contact the administrator.',
    ),
  ];
  var _agreed = false;
  var _submitting = false;

  void _openInstructions() {
    AppJumper.toWeb(url: AppLinks.accountCancellation, title: 'Account Cancellation Instructions');
  }

  Future<void> _submit() async {
    if (!_agreed || _submitting) return;
    setState(() => _submitting = true);
    try {
      final res = await ChimoApis.user.cancelAccount();
      if (!mounted) return;
      if (!res.ok) {
        setState(() => _submitting = false);
        AppToast.error(res.message.isEmpty ? 'Request failed' : res.message);
        return;
      }
      await AppJumper.replaceWithAccountCancelResult();
    } catch (error) {
      if (!mounted) return;
      setState(() => _submitting = false);
      AppToast.error('Request failed: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppNavBar(title: 'Cancel Account'),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              itemCount: _sections.length,
              separatorBuilder: (_, _) => const SizedBox(height: 22),
              itemBuilder: (context, index) {
                final section = _sections[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(section.question, style: AppText.title.copyWith(height: 1.35)),
                    const SizedBox(height: 8),
                    Text(section.answer, style: AppText.body.copyWith(height: 1.45)),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24, 8, 24, 16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => setState(() => _agreed = !_agreed),
                      child: Icon(
                        _agreed ? Icons.check_circle : Icons.radio_button_unchecked,
                        size: 18,
                        color: _agreed ? AppColors.green00F875 : AppColors.gray9A9A9A,
                      ),
                    ),
                    Expanded(child: _InstructionsLink(onOpen: _openInstructions)),
                  ],
                ),
                const SizedBox(height: 16),
                Chimo.s.primaryButton(
                  label: 'Apply for account cancellation',
                  onTap: _submit,
                  enabled: _agreed && !_submitting,
                  loading: _submitting,
                  color: _agreed ? AppColors.green00D68F : AppColors.grayE8E8E8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InstructionsLink extends StatefulWidget {
  const _InstructionsLink({required this.onOpen});

  final VoidCallback onOpen;

  @override
  State<_InstructionsLink> createState() => _InstructionsLinkState();
}

class _InstructionsLinkState extends State<_InstructionsLink> {
  late final TapGestureRecognizer _open = TapGestureRecognizer()..onTap = () => widget.onOpen();

  @override
  void dispose() {
    _open.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(
          color: AppColors.gray9A9A9A,
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
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            recognizer: _open,
          ),
        ],
      ),
    );
  }
}

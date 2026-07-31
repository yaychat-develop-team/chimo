import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';

/// Joy Coins recharge FAQ.
class JoyCoinsHelpPage extends StatelessWidget {
  const JoyCoinsHelpPage({super.key});

  static const _faqs = [
    (
      question: '1.What are Joy Coins?',
      answer:
          'Joy Coins is a virtual currency in Chimo that can be obtained by recharging.',
    ),
    (
      question: '2.Where can Joy Coins be used?',
      answer: 'Joy Coins can only be used within the platform.',
    ),
    (
      question: '3.What should I pay attention to when recharging Joy Coins?',
      answer:
          'Joy Coins is non-refundable and cannot be withdrawn after recharging. Please confirm that everything is correct before proceeding with the recharge.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 48,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: SvgPicture.asset(
                        AppAssets.chatBack,
                        width: 17,
                        height: 7,
                      ),
                    ),
                  ),
                  const Text(
                    'Chimo',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                itemCount: _faqs.length,
                separatorBuilder: (_, _) => const SizedBox(height: 22),
                itemBuilder: (context, index) {
                  final faq = _faqs[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        faq.question,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        faq.answer,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.45,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_page_scaffold.dart';

/// Levels FAQ.
class LevelsHelpPage extends StatelessWidget {
  const LevelsHelpPage({super.key});

  static const _faqs = [
    (
      question: '1. What is the level?',
      answer:
          "The level is a symbol of the user's wealth and contribution in the platform, the more Joy Coins spent on the platform, the higher the level.",
    ),
    (
      question: '2. How to upgrade the level?',
      answer:
          'Joy Coins can be spent on the platform to earn experience points, every 1 Joy Coins spent will earn 1 experience point, once the experience point reaches the specified number, the level will be upgraded automatically.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: 'Level Introduction',
      body: ListView.separated(
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
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.45,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../common/theme/app_text.dart';
import '../../../common/widgets/app_scaffold.dart';

/// Joy Coins 充值常见问题。
class JoyCoinsHelpPage extends StatelessWidget {
  const JoyCoinsHelpPage({super.key});

  static const _faqs = [
    (
      question: '1.What are Joy Coins?',
      answer: 'Joy Coins is a virtual currency in Chimo that can be obtained by recharging.',
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
    return ChimoScaffold(
      title: 'Chimo',
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        itemCount: _faqs.length,
        separatorBuilder: (_, _) => const SizedBox(height: 22),
        itemBuilder: (context, index) {
          final faq = _faqs[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(faq.question, style: AppText.title.copyWith(height: 1.35)),
              const SizedBox(height: 8),
              Text(faq.answer, style: AppText.body.copyWith(height: 1.45)),
            ],
          );
        },
      ),
    );
  }
}

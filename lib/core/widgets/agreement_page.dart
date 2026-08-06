import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'app_page_scaffold.dart';

/// Agreement placeholder page (shared by login / About Us).
class AgreementPage extends StatelessWidget {
  const AgreementPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: title,
      titleStyle: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 17,
        fontWeight: FontWeight.w700,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          Text(
            'This is a placeholder for the $title content. '
            'The full legal text will be provided by the product team.',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

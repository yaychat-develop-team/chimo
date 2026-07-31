import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';

/// Home app bar: Chimo logo left (~91×28), search right (36×36).
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, this.onSearchTap});

  /// Search button tap callback.
  final VoidCallback? onSearchTap;

  static const double logoHeight = 28;
  static const double searchSize = 36;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Row(
        children: [
          Image.asset(
            AppAssets.homeTitle,
            height: logoHeight,
            fit: BoxFit.contain,
          ),
          const Spacer(),
          GestureDetector(
            onTap: onSearchTap,
            behavior: HitTestBehavior.opaque,
            child: Image.asset(
              AppAssets.homeSearchBtn,
              width: searchSize,
              height: searchSize,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';

/// Promo banner above list; close hit area matches × on asset.
class ChatsPromoBanner extends StatelessWidget {
  const ChatsPromoBanner({
    super.key,
    this.onTap,
    this.onClose,
  });

  final VoidCallback? onTap;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Image.asset(
              AppAssets.msgPromo,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          // Asset includes × on the right; transparent tap target only.
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            width: 48,
            child: GestureDetector(
              onTap: onClose,
              behavior: HitTestBehavior.opaque,
            ),
          ),
        ],
      ),
    );
  }
}

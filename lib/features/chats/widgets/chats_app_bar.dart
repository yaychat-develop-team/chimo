import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';

/// Chats app bar: title with green underline + contacts/search.
class ChatsAppBar extends StatelessWidget {
  const ChatsAppBar({super.key, this.onContactsTap, this.onSearchTap});

  final VoidCallback? onContactsTap;
  final VoidCallback? onSearchTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 16, 12),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Chats',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  height: 1,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 10,
                width: 36,
                child: Image.asset(
                  AppAssets.chatTitleTips,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          const Spacer(),
          _HeaderIconButton(
            asset: AppAssets.msgContacts,
            onTap: onContactsTap,
            iconSize: 42,
          ),
          const SizedBox(width: 10),
          _HeaderIconButton(
            asset: AppAssets.msgSearch,
            onTap: onSearchTap,
            iconSize: 42,
          ),
        ],
      ),
    );
  }
}

/// Rounded icon button on app bar right (asset image).
class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({
    required this.asset,
    this.onTap,
    this.iconSize = 22,
  });

  final String asset;
  final VoidCallback? onTap;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF1A1A1A),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          width: 44,
          height: 44,
          child: Center(
            child: Image.asset(
              asset,
              width: iconSize,
              height: iconSize,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

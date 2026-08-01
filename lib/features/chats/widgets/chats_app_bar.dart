import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_asset_image.dart';

/// Chats app bar: title with green underline + contacts/search.
/// Spec from Figma 39:428 — title 24 ExtraBold; icon buttons 36×36 r12.
class ChatsAppBar extends StatelessWidget {
  const ChatsAppBar({super.key, this.onContactsTap, this.onSearchTap});

  final VoidCallback? onContactsTap;
  final VoidCallback? onSearchTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          SizedBox(
            height: 40,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topLeft,
              children: [
                // Non-positioned so Stack gets a finite width in the Row.
                const Text(
                  'Chats',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),
                // Green scribble under "a" (Figma Vector 1).
                const Positioned(
                  left: 17,
                  top: 22,
                  child: SizedBox(
                    width: 48,
                    height: 17,
                    child: AppAssetImage(
                      AppAssets.chatTitleTips,
                      width: 48,
                      height: 17,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          _HeaderIconButton(
            asset: AppAssets.msgContacts,
            onTap: onContactsTap,
            iconSize: 22,
          ),
          const SizedBox(width: 8),
          _HeaderIconButton(
            asset: AppAssets.msgSearch,
            onTap: onSearchTap,
            iconSize: 18,
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
      color: AppColors.chatsRowFill,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 36,
          height: 36,
          child: Center(
            child: AppAssetImage(
              asset,
              width: iconSize,
              height: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/center_toast.dart';
import '../models/me_models.dart';

/// Avatar on top; row below: left = name + ID, right = My Profile.
class MeProfileHeader extends StatelessWidget {
  const MeProfileHeader({
    super.key,
    required this.profile,
    this.onProfileTap,
    this.onAvatarTap,
  });

  final MeProfile profile;
  final VoidCallback? onProfileTap;
  final VoidCallback? onAvatarTap;

  static const double avatarSize = 80;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onAvatarTap ?? onProfileTap,
          child: Container(
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: ClipOval(
              child: Image.asset(profile.avatarAsset, fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.displayName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () => _copyId(context),
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'ID:${profile.userId}',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(width: 4),
                        SvgPicture.asset(
                          AppAssets.mineCopy,
                          width: 12,
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Material(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: onProfileTap ?? onAvatarTap,
                borderRadius: BorderRadius.circular(12),
                child: const SizedBox(
                  width: 84,
                  height: 24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'My Profile',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                      SizedBox(width: 2),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 14,
                        color: AppColors.textPrimary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _copyId(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: profile.userId));
    if (!context.mounted) return;
    showCenterToast(context, message: 'Saved to the clipboard');
  }
}

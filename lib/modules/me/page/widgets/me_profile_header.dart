import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/extensions/wire_view.dart';
import '../../../../common/models/server_client/user.pb.dart';
import '../../../../common/widgets/app_image.dart';
import '../../../../common/utils/app_toast.dart';

/// 上方头像；下方一行：左侧名称 + ID，右侧 My Profile。
class MeProfileHeader extends StatelessWidget {
  const MeProfileHeader({super.key, required this.profile, this.onProfileTap, this.onAvatarTap});

  final User profile;
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
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppImage.avatar(
                    profile.shownAvatar,
                    fallbackAsset: AppAssets.avatarPlace,
                    size: avatarSize,
                  ),
                  if (profile.avatarAudit.trim().isNotEmpty)
                    ColoredBox(
                      color: Colors.black.withValues(alpha: 0.5),
                      child: const Center(
                        child: Text(
                          'Under review',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12, height: 1.1),
                        ),
                      ),
                    ),
                ],
              ),
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
                    profile.nickname.isEmpty ? 'User' : profile.nickname,
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
                          'ID:${profile.uid}',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(width: 4),
                        AppImage(AppAssets.mineCopy, width: 12, height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Material(
              color: AppColors.tagBackground,
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
                      Icon(Icons.chevron_right_rounded, size: 14, color: AppColors.textPrimary),
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
    await Clipboard.setData(ClipboardData(text: profile.uid));
    if (!context.mounted) return;
    AppToast.info('Saved to the clipboard');
  }
}

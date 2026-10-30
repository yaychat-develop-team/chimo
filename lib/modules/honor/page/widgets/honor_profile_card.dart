import 'package:flutter/material.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/extensions/wire_view.dart';
import '../../../../common/models/server_client/user.pb.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 顶部资料卡：头像 / 昵称 / Manage Honors / Earned 计数。
class HonorProfileCard extends StatelessWidget {
  const HonorProfileCard({
    super.key,
    required this.profile,
    required this.earnedCount,
    this.showManage = false,
    this.onManageTap,
  });

  final User? profile;
  final int earnedCount;
  final bool showManage;
  final VoidCallback? onManageTap;

  static const double _avatar = 52;
  static const double _earnedW = 78;
  static const double _earnedH = 46;

  @override
  Widget build(BuildContext context) {
    final name = (profile?.nickname.trim().isNotEmpty == true) ? profile!.nickname : 'User';
    final avatar = profile?.shownAvatar ?? '';

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 0),
      padding: const EdgeInsets.fromLTRB(14, 14, 16, 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: AppImage.decorationImage(AppAssets.honorHeaderCardBg, fit: BoxFit.cover),
      ),
      child: Row(
        children: [
          Container(
            width: _avatar,
            height: _avatar,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white18, width: 1.5),
            ),
            child: ClipOval(
              child: AppImage.avatar(avatar, fallbackAsset: AppAssets.avatarPlace, size: _avatar),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                  ),
                ),
                if (showManage) ...[
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: onManageTap,
                    behavior: HitTestBehavior.opaque,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Manage Honors',
                          style: TextStyle(
                            color: AppColors.gray9A9A9A,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(width: 1),
                        Icon(Icons.chevron_right_rounded, size: 16, color: AppColors.gray9A9A9A),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          Container(
            width: 1,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: AppColors.white20,
          ),
          SizedBox(
            width: _earnedW,
            height: _earnedH,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(child: Chimo.image(AppAssets.honorEarnedBg, fit: BoxFit.contain)),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$earnedCount',
                      style: const TextStyle(
                        color: AppColors.yellowFFD400,
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        height: 1,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Earned',
                      style: TextStyle(
                        color: AppColors.yellowFFD400,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

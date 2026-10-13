import 'package:flutter/material.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/widgets/app_back_button.dart';
import '../../../../../common/widgets/app_image.dart';
import '../../../../../common/utils/zodiac.dart';
import '../../../model/chat_conversation.dart';
import '../../../../profile/page/album_photo_viewer_page.dart';

/// 私聊导航栏：头像 / 昵称 / 在线点 / 关注 / 更多，下面挂一段可收起的简介。
///
/// [collapse] 是收起进度（0 = 展开，1 = 只剩导航栏那一行），由 View 里的
/// `AnimationController` 驱动 —— 白色消息区顶部那根把手拖的就是它。
class DmAppBar extends StatelessWidget {
  const DmAppBar({
    super.key,
    required this.conversation,
    required this.following,
    required this.collapse,
    required this.onFollowTap,
    required this.onAvatarTap,
    required this.onMoreTap,
    this.loading = false,
  });

  final ChatConversation conversation;
  final bool following;

  /// 0 = 展开，1 = 收起。
  final double collapse;
  final VoidCallback onFollowTap;
  final VoidCallback onAvatarTap;
  final VoidCallback onMoreTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final introVisible = 1.0 - collapse;
    final followVisible = introVisible;

    return Padding(
      padding: EdgeInsets.fromLTRB(4, 4, 8, 4 + 8 * introVisible),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 52,
            child: Row(
              children: [
                const AppBackButton(),
                GestureDetector(
                  onTap: onAvatarTap,
                  child: ClipOval(
                    child: AppImage(
                      conversation.avatarUrl,
                      fallbackAsset: conversation.avatarAsset,
                      width: 36,
                      height: 36,
                      fit: BoxFit.cover,
                      fadeIn: Duration.zero,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: onAvatarTap,
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Flexible：昵称只占自身宽度，性别紧跟其后；过长再截断。
                            Flexible(
                              child: Text(
                                conversation.title,
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            AppImage(
                              conversation.isMale ? AppAssets.genderMan : AppAssets.genderWoman,
                              width: 16,
                              height: 16,
                            ),
                          ],
                        ),
                        // 对齐 forya：仅在线时展示在线状态。
                        if (conversation.isOnline) ...[
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: AppColors.onlineDot,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Online',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                ClipRect(
                  child: Align(
                    alignment: Alignment.centerRight,
                    widthFactor: followVisible.clamp(0.0, 1.0),
                    child: Opacity(
                      opacity: followVisible.clamp(0.0, 1.0),
                      // forya：未关注时才显示关注；关注后隐藏。
                      child: following
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: GestureDetector(
                                onTap: onFollowTap,
                                child: Container(
                                  width: 64,
                                  height: 28,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: AppColors.promoBannerGradient,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Text(
                                    'Follow',
                                    style: TextStyle(
                                      color: AppColors.promoText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onMoreTap,
                  behavior: HitTestBehavior.opaque,
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: AppImage(
                      AppAssets.chatDmMore,
                      width: 18,
                      height: 18,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.topLeft,
              heightFactor: introVisible.clamp(0.0, 1.0),
              child: Opacity(
                opacity: introVisible.clamp(0.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        conversation.signatureDisplay,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          if (Zodiac.chipLabel(conversation.zodiac).isNotEmpty)
                            _ProfileTag(label: Zodiac.chipLabel(conversation.zodiac)),
                          if (conversation.heightInches > 0)
                            _ProfileTag(
                              label: '${conversation.heightInches} Inch',
                              iconAsset: AppAssets.tagHeight,
                            ),
                          if (conversation.weightLb > 0)
                            _ProfileTag(
                              label: '${conversation.weightLb} LB',
                              iconAsset: AppAssets.tagWeight,
                            ),
                        ],
                      ),
                      if (loading) ...[
                        const SizedBox(height: 10),
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white54),
                        ),
                      ],
                      if (conversation.momentUrls.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 72,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: conversation.momentUrls.length,
                            separatorBuilder: (_, _) => const SizedBox(width: 6),
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () => AlbumPhotoViewerPage.open(
                                  context,
                                  paths: conversation.momentUrls,
                                  initialIndex: i,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: AppImage(
                                    conversation.momentUrls[i],
                                    fallbackAsset: AppAssets.avatarPlace,
                                    width: 72,
                                    height: 72,
                                    fit: BoxFit.cover,
                                    fadeIn: Duration.zero,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ] else if (conversation.momentAssets.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 72,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: conversation.momentAssets.length,
                            separatorBuilder: (_, _) => const SizedBox(width: 6),
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () => AlbumPhotoViewerPage.open(
                                  context,
                                  paths: conversation.momentAssets,
                                  initialIndex: i,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: AppImage(
                                    conversation.momentAssets[i],
                                    width: 72,
                                    height: 72,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileTag extends StatelessWidget {
  const _ProfileTag({required this.label, this.iconAsset});

  final String label;
  final String? iconAsset;

  @override
  Widget build(BuildContext context) {
    // 不要设置 Container.alignment — 在 Wrap 内会撑满最大宽度。
    return Container(
      height: 22,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconAsset != null) ...[
            AppImage(iconAsset!, width: 14, height: 14),
            const SizedBox(width: 3),
          ],
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

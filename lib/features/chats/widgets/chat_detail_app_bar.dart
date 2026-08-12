part of '../chat_detail_page.dart';

enum _DmMoreAction { search, follow, block, report, cancel }

class _DmAppBar extends StatelessWidget {
  const _DmAppBar({
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
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 40,
                    minHeight: 40,
                  ),
                  icon: const AppAssetImage(
                    AppAssets.chatDmBack,
                    width: 17,
                    height: 7,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: onAvatarTap,
                  child: ClipOval(
                    child: NetworkOrAssetAvatar(
                      asset: conversation.avatarAsset,
                      url: conversation.avatarUrl,
                      width: 36,
                      height: 36,
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
                            Flexible(
                              child: Text(
                                conversation.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Image.asset(
                              conversation.isMale
                                  ? AppAssets.genderMan
                                  : AppAssets.genderWoman,
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
                    child: AppAssetImage(
                      AppAssets.chatDmMore,
                      width: 18,
                      height: 18,
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
                          _ProfileTag(
                            label:
                                '${zodiacEmoji(conversation.zodiac)} ${conversation.zodiac}',
                          ),
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
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                      if (conversation.momentUrls.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 72,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: conversation.momentUrls.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(width: 6),
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () => AlbumPhotoViewerPage.open(
                                  context,
                                  paths: conversation.momentUrls,
                                  initialIndex: i,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: NetworkOrAssetAvatar(
                                    asset: AppAssets.avatarPlace,
                                    url: conversation.momentUrls[i],
                                    width: 72,
                                    height: 72,
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
                            separatorBuilder: (_, _) =>
                                const SizedBox(width: 6),
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () => AlbumPhotoViewerPage.open(
                                  context,
                                  paths: conversation.momentAssets,
                                  initialIndex: i,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
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
            SvgPicture.asset(
              iconAsset!,
              width: 14,
              height: 14,
            ),
            const SizedBox(width: 3),
          ],
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}


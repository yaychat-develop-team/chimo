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

  /// 0 expanded → 1 collapsed.
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
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: conversation.isOnline
                                    ? AppColors.onlineDot
                                    : const Color(0xFF6E6E6E),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              conversation.isOnline ? 'Online' : 'Offline',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.5),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
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
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: onFollowTap,
                          child: Container(
                            width: 64,
                            height: 28,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: following
                                  ? null
                                  : AppColors.promoBannerGradient,
                              color: following
                                  ? Colors.white.withValues(alpha: 0.12)
                                  : null,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              following ? 'Following' : 'Follow',
                              style: TextStyle(
                                color: following
                                    ? Colors.white
                                    : AppColors.promoText,
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
                          _ProfileTag(label: '♑ ${conversation.zodiac}'),
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
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: NetworkOrAssetAvatar(
                                  asset: AppAssets.avatarPlace,
                                  url: conversation.momentUrls[i],
                                  width: 72,
                                  height: 72,
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
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  conversation.momentAssets[i],
                                  width: 72,
                                  height: 72,
                                  fit: BoxFit.cover,
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
  const _ProfileTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class _DmMoreSheet extends StatelessWidget {
  const _DmMoreSheet({required this.following, required this.blocked});

  final bool following;
  final bool blocked;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 12 + bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _DmMoreItem(
                  label: 'Search',
                  onTap: () => Navigator.of(context).pop(_DmMoreAction.search),
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                  color: Color(0xFF3A3A3C),
                ),
                _DmMoreItem(
                  label: following ? 'Unfollow' : 'Follow',
                  onTap: () => Navigator.of(context).pop(_DmMoreAction.follow),
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                  color: Color(0xFF3A3A3C),
                ),
                _DmMoreItem(
                  label: blocked ? 'Unblock' : 'Block',
                  onTap: () => Navigator.of(context).pop(_DmMoreAction.block),
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                  color: Color(0xFF3A3A3C),
                ),
                _DmMoreItem(
                  label: 'Report',
                  onTap: () => Navigator.of(context).pop(_DmMoreAction.report),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Material(
            color: const Color(0xFF3A3A3C),
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => Navigator.of(context).pop(_DmMoreAction.cancel),
              child: const SizedBox(
                height: 56,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
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

class _DmMoreItem extends StatelessWidget {
  const _DmMoreItem({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

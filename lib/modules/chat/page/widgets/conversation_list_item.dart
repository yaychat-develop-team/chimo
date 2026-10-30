import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_emoji.dart';
import '../../model/chat_conversation.dart';

/// 列表行：胶囊卡片、徽章、在线点、未读；左滑置顶/删除。
/// 规格来自 Figma 39:428 — 高 72，圆角 36，头像 54。
///
/// 同一 [Slidable.groupTag] 下同时只展开一行，由外层 [SlidableAutoCloseBehavior] 收起。
class ConversationListItem extends StatelessWidget {
  const ConversationListItem({
    super.key,
    required this.conversation,
    this.onTap,
    this.onAvatarTap,
    this.onPin,
    this.onDelete,
  });

  final ChatConversation conversation;

  final VoidCallback? onTap;

  /// 头像点击（私聊 → 资料；与 [onTap] 互斥）。
  final VoidCallback? onAvatarTap;
  final VoidCallback? onPin;
  final VoidCallback? onDelete;

  /// 同一列表内的左滑互斥标记。
  static const groupTag = 'conversation-list';

  /// 操作条宽度（两个 36 按钮 + 间距）。
  static const double _actionsWidth = 100;

  bool get _useBrandTitle {
    // 实色 titleColor 优先；无颜色的认证徽章用品牌渐变。
    if (conversation.titleColor != null) return false;
    return conversation.badge == ChatBadgeType.verified;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final extent = width <= 0 ? 0.3 : (_actionsWidth / width).clamp(0.16, 1.0).toDouble();
          return Slidable(
            groupTag: groupTag,
            endActionPane: ActionPane(
              motion: const BehindMotion(),
              extentRatio: extent,
              dragDismissible: false,
              children: [
                CustomSlidableAction(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  onPressed: (_) => onPin?.call(),
                  child: _ActionCircle(
                    asset: conversation.isPinned ? AppAssets.msgUnpin : AppAssets.msgPin,
                    // 置顶 SVG 已含 36 圆；unpin.webp 需要额外填充。
                    wrapInCircle: conversation.isPinned,
                  ),
                ),
                CustomSlidableAction(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  onPressed: (_) => onDelete?.call(),
                  child: const _ActionCircle(asset: AppAssets.msgSwipeDelete),
                ),
              ],
            ),
            child: SizedBox(
              height: 72.w,
              child: GestureDetector(
                onTap: onTap,
                child: Material(
                  // 8% 白色填充下的不透明底，使左滑操作
                  // 在行被拖开前保持隐藏。
                  color: AppColors.white10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36),
                    side: conversation.isPinned
                        ? const BorderSide(color: AppColors.green00F875, width: 0.5)
                        : BorderSide.none,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 9, 16, 9),
                    child: Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            if (onAvatarTap != null) {
                              onAvatarTap!();
                            } else {
                              onTap?.call();
                            }
                          },
                          child: _Avatar(
                            asset: conversation.avatarAsset,
                            url: conversation.avatarUrl,
                            isOnline: conversation.isOnline,
                            isGroup: conversation.badge == ChatBadgeType.group,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: _TitleText(
                                      text: conversation.title,
                                      useBrandGradient: _useBrandTitle,
                                      solidColor: conversation.titleColor,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  _TitleBadge(type: conversation.badge),
                                ],
                              ),
                              const SizedBox(height: 4),
                              AppEmojiText(
                                conversation.listSubtitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.white70,
                                  fontSize: 13,
                                  height: 1.2,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 18.w,
                              child: Text(
                                conversation.timeLabel,
                                style: const TextStyle(
                                  color: AppColors.white36,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 18.w,
                              child: Visibility(
                                visible: conversation.unreadCount > 0,
                                child: _UnreadBadge(count: conversation.unreadCount),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// 标题：纯白 / 官方账号品牌渐变。
class _TitleText extends StatelessWidget {
  const _TitleText({required this.text, required this.useBrandGradient, this.solidColor});

  final String text;
  final bool useBrandGradient;
  final Color? solidColor;

  static const _style = TextStyle(fontSize: 16, fontWeight: FontWeight.w700, height: 1.2);

  @override
  Widget build(BuildContext context) {
    if (!useBrandGradient) {
      return AppEmojiText(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: _style.copyWith(color: solidColor ?? AppColors.white),
      );
    }

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
      child: AppEmojiText(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: _style.copyWith(color: Colors.white),
      ),
    );
  }
}

/// 头像：私聊圆形、群组圆角方；右下在线点。
class _Avatar extends StatelessWidget {
  const _Avatar({required this.asset, required this.isOnline, this.url, this.isGroup = false});

  final String asset;
  final String? url;
  final bool isOnline;
  final bool isGroup;

  static const double _size = 54;
  static const double _groupRadius = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size.w,
      height: _size.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Chimo.image(
            url,
            fallbackAsset: asset,
            width: _size,
            height: _size,
            fit: BoxFit.cover,
            fadeIn: Duration.zero,
            radius: BorderRadius.circular(isGroup ? _groupRadius : _size / 2),
          ),
          if (isOnline)
            Positioned(
              right: 0,
              bottom: 2,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.green00F875,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1.5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// 标题徽章：认证 / Group / Soulmate。
class _TitleBadge extends StatelessWidget {
  const _TitleBadge({required this.type});

  final ChatBadgeType type;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      ChatBadgeType.none => const SizedBox.shrink(),
      ChatBadgeType.verified => Chimo.image(
        AppAssets.chatVerified,
        width: 16,
        height: 16,
        fit: BoxFit.contain,
      ),
      ChatBadgeType.group => Chimo.image(AppAssets.chatGroupTag, height: 16, fit: BoxFit.contain),
      ChatBadgeType.soulmate => Chimo.image(
        AppAssets.chatSoulmate,
        width: 53,
        height: 14,
        fit: BoxFit.contain,
      ),
    };
  }
}

/// 红色未读数角标（Figma：h16，r8，#FD4B4B，11 SemiBold）。
class _UnreadBadge extends StatelessWidget {
  const _UnreadBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final label = count > 99 ? '99+' : '$count';
    return Container(
      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: AppColors.redFD4B4B, borderRadius: BorderRadius.circular(8)),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          height: 1,
        ),
      ),
    );
  }
}

/// 左滑操作圆：优先设计资源（自带圆形）。
class _ActionCircle extends StatelessWidget {
  const _ActionCircle({this.color, this.icon, this.asset, this.wrapInCircle = false})
    : assert(asset != null || (color != null && icon != null));

  final Color? color;
  final IconData? icon;
  final String? asset;
  final bool wrapInCircle;

  @override
  Widget build(BuildContext context) {
    if (asset != null) {
      final image = Chimo.image(
        asset!,
        width: wrapInCircle ? 18 : 36,
        height: wrapInCircle ? 18 : 36,
        fit: BoxFit.contain,
      );
      if (!wrapInCircle) return image;
      return Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: AppColors.white8, shape: BoxShape.circle),
        child: image,
      );
    }

    return Material(
      color: color,
      shape: const CircleBorder(),
      child: SizedBox(width: 36, height: 36, child: Icon(icon, color: Colors.white, size: 18)),
    );
  }
}

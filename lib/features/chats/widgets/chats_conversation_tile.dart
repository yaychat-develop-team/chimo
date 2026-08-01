import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_asset_image.dart';
import '../models/chat_conversation.dart';

/// List row: pill card, badge, online dot, unread; swipe to pin/delete.
/// Spec from Figma 39:428 — height 72, radius 36, avatar 54.
///
/// [openSwipeId] shared by list: only one row swipe-open at a time.
class ChatsConversationTile extends StatefulWidget {
  const ChatsConversationTile({
    super.key,
    required this.conversation,
    required this.openSwipeId,
    this.onTap,
    this.onAvatarTap,
    this.onPin,
    this.onDelete,
  });

  final ChatConversation conversation;

  /// Id of swipe-open row; `null` means all closed.
  final ValueNotifier<String?> openSwipeId;

  final VoidCallback? onTap;

  /// Avatar tap (DM → profile; mutually exclusive with [onTap]).
  final VoidCallback? onAvatarTap;
  final VoidCallback? onPin;
  final VoidCallback? onDelete;

  @override
  State<ChatsConversationTile> createState() => _ChatsConversationTileState();
}

class _ChatsConversationTileState extends State<ChatsConversationTile> {
  /// Swipe offset exposing actions (negative = left).
  double _dragOffset = 0;

  /// Action strip width (two 36 buttons + gaps; Figma ~52px exposed).
  static const double _actionsWidth = 100;

  String get _id => widget.conversation.id;

  @override
  void initState() {
    super.initState();
    widget.openSwipeId.addListener(_onOpenSwipeChanged);
  }

  @override
  void didUpdateWidget(covariant ChatsConversationTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.openSwipeId != widget.openSwipeId) {
      oldWidget.openSwipeId.removeListener(_onOpenSwipeChanged);
      widget.openSwipeId.addListener(_onOpenSwipeChanged);
    }
  }

  @override
  void dispose() {
    widget.openSwipeId.removeListener(_onOpenSwipeChanged);
    super.dispose();
  }

  /// Collapse this row when another starts swiping.
  void _onOpenSwipeChanged() {
    final openId = widget.openSwipeId.value;
    if (openId != _id && _dragOffset != 0) {
      setState(() => _dragOffset = 0);
    }
  }

  void _claimOpen() {
    if (widget.openSwipeId.value != _id) {
      widget.openSwipeId.value = _id;
    }
  }

  void _releaseOpen() {
    if (widget.openSwipeId.value == _id) {
      widget.openSwipeId.value = null;
    }
  }

  void _onDragUpdate(DragUpdateDetails details) {
    _claimOpen();
    setState(() {
      _dragOffset = (_dragOffset + details.delta.dx).clamp(-_actionsWidth, 0);
    });
  }

  void _onDragEnd(DragEndDetails details) {
    final next = _dragOffset < -_actionsWidth / 2 ? -_actionsWidth : 0.0;
    setState(() => _dragOffset = next);
    if (next == 0) {
      _releaseOpen();
    } else {
      _claimOpen();
    }
  }

  void _close() {
    if (_dragOffset != 0) setState(() => _dragOffset = 0);
    _releaseOpen();
  }

  bool get _useBrandTitle {
    final c = widget.conversation;
    return c.badge == ChatBadgeType.verified || c.titleColor != null;
  }

  @override
  Widget build(BuildContext context) {
    final conversation = widget.conversation;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
      child: SizedBox(
        height: 72,
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _ActionCircle(
                      asset: conversation.isPinned
                          ? AppAssets.msgUnpin
                          : AppAssets.msgPin,
                      // Pin SVG already includes the 36 circle; unpin.webp needs a fill.
                      wrapInCircle: conversation.isPinned,
                      onTap: () {
                        _close();
                        widget.onPin?.call();
                      },
                    ),
                    const SizedBox(width: 16),
                    _ActionCircle(
                      asset: AppAssets.msgSwipeDelete,
                      onTap: () {
                        _close();
                        widget.onDelete?.call();
                      },
                    ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 160),
              curve: Curves.easeOut,
              left: _dragOffset,
              right: -_dragOffset,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onHorizontalDragUpdate: _onDragUpdate,
                onHorizontalDragEnd: _onDragEnd,
                onTap: () {
                  if (_dragOffset != 0) {
                    _close();
                  } else {
                    widget.onTap?.call();
                  }
                },
                child: Material(
                  // Opaque surface under the 8% white fill so swipe actions
                  // stay hidden until the row is dragged open.
                  color: AppColors.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36),
                    side: conversation.isPinned
                        ? const BorderSide(
                            color: AppColors.accentLime,
                            width: 1.5,
                          )
                        : BorderSide.none,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: AppColors.chatsRowFill,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 9, 16, 9),
                      child: Row(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              if (_dragOffset != 0) {
                                _close();
                                return;
                              }
                              if (widget.onAvatarTap != null) {
                                widget.onAvatarTap!();
                              } else {
                                widget.onTap?.call();
                              }
                            },
                            child: _Avatar(
                              asset: conversation.avatarAsset,
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
                                Text(
                                  conversation.lastMessage,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: AppColors.textPreview,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                conversation.timeLabel,
                                style: const TextStyle(
                                  color: AppColors.textTime,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              if (conversation.unreadCount > 0) ...[
                                const SizedBox(height: 6),
                                _UnreadBadge(count: conversation.unreadCount),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Title: solid white / brand gradient for official accounts.
class _TitleText extends StatelessWidget {
  const _TitleText({
    required this.text,
    required this.useBrandGradient,
    this.solidColor,
  });

  final String text;
  final bool useBrandGradient;
  final Color? solidColor;

  static const _style = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  @override
  Widget build(BuildContext context) {
    if (!useBrandGradient) {
      return Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: _style.copyWith(color: solidColor ?? AppColors.textPrimary),
      );
    }

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) =>
          AppColors.brandTextGradient.createShader(bounds),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: _style.copyWith(color: Colors.white),
      ),
    );
  }
}

/// Avatar: circle for DM, rounded square for group; online dot bottom-right.
class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.asset,
    required this.isOnline,
    this.isGroup = false,
  });

  final String asset;
  final bool isOnline;
  final bool isGroup;

  static const double _size = 54;
  static const double _groupRadius = 12;

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      asset,
      width: _size,
      height: _size,
      fit: BoxFit.cover,
    );

    return SizedBox(
      width: _size,
      height: _size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (isGroup)
            ClipRRect(
              borderRadius: BorderRadius.circular(_groupRadius),
              child: image,
            )
          else
            ClipOval(child: image),
          if (isOnline)
            Positioned(
              right: 0,
              bottom: 2,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.onlineDot,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.surface,
                    width: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Title badge: verified / Group / Soulmate.
class _TitleBadge extends StatelessWidget {
  const _TitleBadge({required this.type});

  final ChatBadgeType type;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      ChatBadgeType.none => const SizedBox.shrink(),
      ChatBadgeType.verified => const AppAssetImage(
          AppAssets.chatVerified,
          width: 16,
          height: 16,
        ),
      ChatBadgeType.group => Image.asset(
          AppAssets.chatGroupTag,
          height: 16,
          fit: BoxFit.contain,
        ),
      ChatBadgeType.soulmate => const AppAssetImage(
          AppAssets.chatSoulmate,
          width: 53,
          height: 14,
          fit: BoxFit.contain,
        ),
    };
  }
}

/// Red unread count badge (Figma: h16, r8, #FD4B4B, 11 SemiBold).
class _UnreadBadge extends StatelessWidget {
  const _UnreadBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final label = count > 99 ? '99+' : '$count';
    return Container(
      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.badge,
        borderRadius: BorderRadius.circular(8),
      ),
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

/// Swipe action circle: prefer design asset (built-in circle).
class _ActionCircle extends StatelessWidget {
  const _ActionCircle({
    this.color,
    this.icon,
    this.asset,
    this.wrapInCircle = false,
    this.onTap,
  }) : assert(asset != null || (color != null && icon != null));

  final Color? color;
  final IconData? icon;
  final String? asset;
  final bool wrapInCircle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (asset != null) {
      final image = AppAssetImage(
        asset!,
        width: wrapInCircle ? 18 : 36,
        height: wrapInCircle ? 18 : 36,
        fit: BoxFit.contain,
      );
      child = wrapInCircle
          ? Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.chatsRowFill,
                shape: BoxShape.circle,
              ),
              child: image,
            )
          : image;
    } else {
      child = Material(
        color: color,
        shape: const CircleBorder(),
        child: SizedBox(
          width: 36,
          height: 36,
          child: Icon(icon, color: Colors.white, size: 18),
        ),
      );
    }

    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: child,
      ),
    );
  }
}

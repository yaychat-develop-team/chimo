import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../models/chat_conversation.dart';

/// List row: pill card, badge, online dot, unread; swipe to pin/delete.
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

  /// Action strip width (two round buttons + spacing).
  static const double _actionsWidth = 112;

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
    // Past halfway: snap open; else spring back.
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

  @override
  Widget build(BuildContext context) {
    final conversation = widget.conversation;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
      child: SizedBox(
        height: 76,
        child: Stack(
          children: [
            // Back layer: pin / delete
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
                      onTap: () {
                        _close();
                        widget.onPin?.call();
                      },
                    ),
                    const SizedBox(width: 12),
                    _ActionCircle(
                      asset: AppAssets.msgDelete,
                      onTap: () {
                        _close();
                        widget.onDelete?.call();
                      },
                    ),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
            ),
            // Front layer: draggable conversation card
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
                  color: const Color(0xFF161616),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                    // Pinned: bright green border
                    side: conversation.isPinned
                        ? const BorderSide(
                            color: Color(0xFF1CFF8A),
                            width: 1.5,
                          )
                        : BorderSide.none,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 14, 12),
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
                                    child: Text(
                                      conversation.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: conversation.titleColor ??
                                            AppColors.textPrimary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  _TitleBadge(type: conversation.badge),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                conversation.lastMessage,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 13,
                                  height: 1.2,
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
                                color: AppColors.textTertiary,
                                fontSize: 12,
                              ),
                            ),
                            if (conversation.unreadCount > 0) ...[
                              const SizedBox(height: 8),
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
          ],
        ),
      ),
    );
  }
}

/// Avatar: circle for DM, rounded square for group; optional online dot.
class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.asset,
    required this.isOnline,
    this.isGroup = false,
  });

  final String asset;
  final bool isOnline;
  final bool isGroup;

  static const double _size = 52;
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
              bottom: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: AppColors.primaryBright,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF161616), width: 2),
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
      ChatBadgeType.verified => const Icon(
          Icons.verified_rounded,
          size: 16,
          color: AppColors.primaryBright,
        ),
      ChatBadgeType.group => Image.asset(
          AppAssets.chatGroupTag,
          height: 16,
          fit: BoxFit.contain,
        ),
      ChatBadgeType.soulmate => const Text(
          'Soulmate',
          style: TextStyle(
            color: Color(0xFFFF6BA8),
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
    };
  }
}

/// Red unread count badge.
class _UnreadBadge extends StatelessWidget {
  const _UnreadBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final label = count > 99 ? '99+' : '$count';
    return Container(
      constraints: const BoxConstraints(minWidth: 20, minHeight: 18),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.badge,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// Swipe action circle: prefer design asset (built-in circle), else solid color + Icon.
class _ActionCircle extends StatelessWidget {
  const _ActionCircle({
    this.color,
    this.icon,
    this.asset,
    this.onTap,
  }) : assert(asset != null || (color != null && icon != null));

  final Color? color;
  final IconData? icon;
  final String? asset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final child = asset != null
        ? Image.asset(asset!, width: 44, height: 44, fit: BoxFit.contain)
        : Material(
            color: color,
            shape: const CircleBorder(),
            child: SizedBox(
              width: 44,
              height: 44,
              child: Icon(icon, color: Colors.white, size: 22),
            ),
          );

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

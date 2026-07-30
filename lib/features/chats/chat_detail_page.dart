import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_tip_dialog.dart';
import '../../core/widgets/center_toast.dart';
import '../home/home_search_page.dart';
import '../report/report_page.dart';
import '../wallet/wallet_page.dart';
import 'data/chats_list_controller.dart';
import 'models/chat_conversation.dart';

enum _ChatSide { peer, self }

enum _ChatLineKind { text, voice, image }

class _ChatLine {
  const _ChatLine({
    required this.side,
    this.kind = _ChatLineKind.text,
    this.text = '',
    this.voiceSeconds = 0,
    this.imageAssets = const [],
  });

  final _ChatSide side;
  final _ChatLineKind kind;
  final String text;
  final int voiceSeconds;
  final List<String> imageAssets;

  String get listPreview {
    if (kind == _ChatLineKind.voice) return '[Voice] ${voiceSeconds}"';
    if (kind == _ChatLineKind.image) {
      final n = imageAssets.length;
      return n <= 1 ? '[Image]' : '[Image ×$n]';
    }
    return text;
  }
}

/// 设计稿气泡尺寸（私聊消息流）。
abstract final class _BubbleLayout {
  static const double avatar = 40;
  static const double avatarRadius = 8;
  static const double avatarGap = 10;
  static const double padH = 20;
  static const double padV = 14;
  static const double peerMax = 243;
  static const double selfMax = 260;
  static const double sameGap = 4;
  static const double otherGap = 16;
  static const Color peerColor = Color(0xFFF0F0F0);
  static const Color selfColor = Color(0xFFB8FF6A);
  static const TextStyle textStyle = TextStyle(
    color: Color(0xFF111111),
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 20 / 15,
  );
}

/// 私聊详情：黑底顶栏 + 白底消息区（拖拽条）+ 输入栏。
class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({
    super.key,
    required this.conversation,
    this.chatsController,
  });

  final ChatConversation conversation;

  /// 发送新消息时回写列表（含左滑删除后重新显示）。
  final ChatsListController? chatsController;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _inputController = TextEditingController();
  final ScrollController _messagesScroll = ScrollController();
  late bool _following = widget.conversation.isFollowing;
  bool _blocked = false;

  /// 0 = 简介展开，1 = 简介收起（仅保留顶栏一行）。
  late final AnimationController _introCollapse;

  static const double _introDragRange = 64;

  late final List<_ChatLine> _messages = [
    const _ChatLine(
      side: _ChatSide.peer,
      text: 'Hey! Nice to meet you here 😊',
    ),
    const _ChatLine(side: _ChatSide.peer, text: '👋'),
    const _ChatLine(
      side: _ChatSide.self,
      text:
          'Nice to meet you too! Your profile looks really cool. Are you into photography?',
    ),
    const _ChatLine(side: _ChatSide.peer, text: 'Yes!'),
    const _ChatLine(
      side: _ChatSide.peer,
      text: 'I love taking sunset shots 🌅\nHow about you?',
    ),
  ];

  ChatConversation get _conversation => widget.conversation;

  @override
  void initState() {
    super.initState();
    _introCollapse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
  }

  @override
  void dispose() {
    _introCollapse.dispose();
    _inputController.dispose();
    _messagesScroll.dispose();
    super.dispose();
  }

  void _onIntroDragUpdate(DragUpdateDetails details) {
    // 手指上滑（dy < 0）→ 收起简介
    final next = (_introCollapse.value - details.delta.dy / _introDragRange)
        .clamp(0.0, 1.0);
    _introCollapse.value = next;
  }

  void _onIntroDragEnd(DragEndDetails details) {
    final v = details.primaryVelocity ?? 0;
    if (v < -280) {
      _introCollapse.animateTo(1, curve: Curves.easeOutCubic);
    } else if (v > 280) {
      _introCollapse.animateTo(0, curve: Curves.easeOutCubic);
    } else {
      _introCollapse.animateTo(
        _introCollapse.value >= 0.5 ? 1 : 0,
        curve: Curves.easeOutCubic,
      );
    }
  }

  bool _onMessagesScroll(ScrollNotification notification) {
    if (notification.depth != 0) return false;

    if (notification is OverscrollNotification) {
      // 顶部继续下拉 → 展开简介（overscroll 在顶部为负）
      if (notification.overscroll < 0 && _introCollapse.value > 0) {
        _introCollapse.value =
            (_introCollapse.value + notification.overscroll / _introDragRange)
                .clamp(0.0, 1.0);
      }
      return false;
    }

    if (notification is! ScrollUpdateNotification) return false;
    final delta = notification.scrollDelta;
    if (delta == null || delta == 0) return false;
    if (!_messagesScroll.hasClients) return false;

    final atTop = _messagesScroll.offset <= 0;
    // 向下滚消息（手指上滑）→ 收起简介
    if (delta > 0 && _introCollapse.value < 1) {
      _introCollapse.value = (_introCollapse.value + delta / _introDragRange)
          .clamp(0.0, 1.0);
      return false;
    }
    // 列表顶部继续下拉 → 展开简介
    if (atTop && delta < 0 && _introCollapse.value > 0) {
      _introCollapse.value = (_introCollapse.value + delta / _introDragRange)
          .clamp(0.0, 1.0);
      return false;
    }
    return false;
  }

  void _sendMessage([String? raw]) {
    final text = (raw ?? _inputController.text).trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(_ChatLine(side: _ChatSide.self, text: text));
    });
    _inputController.clear();
    _afterSend(text);
  }

  void _sendVoice(int seconds) {
    if (seconds <= 0) return;
    setState(() {
      _messages.add(
        _ChatLine(
          side: _ChatSide.self,
          kind: _ChatLineKind.voice,
          voiceSeconds: seconds,
        ),
      );
    });
    _afterSend('[Voice] $seconds"');
  }

  void _sendImages(List<String> assets) {
    if (assets.isEmpty) return;
    setState(() {
      for (final asset in assets) {
        _messages.add(
          _ChatLine(
            side: _ChatSide.self,
            kind: _ChatLineKind.image,
            imageAssets: [asset],
          ),
        );
      }
    });
    final n = assets.length;
    _afterSend(n <= 1 ? '[Image]' : '[Image ×$n]');
  }

  void _afterSend(String lastMessage) {
    widget.chatsController?.onNewMessage(
      id: _conversation.id,
      title: _conversation.title,
      avatarAsset: _conversation.avatarAsset,
      lastMessage: lastMessage,
      badge: _conversation.badge == ChatBadgeType.group
          ? ChatBadgeType.none
          : _conversation.badge,
      isMale: _conversation.isMale,
      signature: _conversation.signature,
      zodiac: _conversation.zodiac,
      isFollowing: _following,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_messagesScroll.hasClients) return;
      _messagesScroll.animateTo(
        _messagesScroll.position.maxScrollExtent,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOut,
      );
    });
  }

  Future<void> _openMoreMenu() async {
    final action = await showModalBottomSheet<_DmMoreAction>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (context) =>
          _DmMoreSheet(following: _following, blocked: _blocked),
    );
    if (!mounted || action == null) return;
    switch (action) {
      case _DmMoreAction.search:
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) =>
                HomeSearchPage(chatsController: widget.chatsController),
          ),
        );
      case _DmMoreAction.follow:
        setState(() => _following = !_following);
      case _DmMoreAction.block:
        await _toggleBlock();
      case _DmMoreAction.report:
        Navigator.of(
          context,
        ).push(MaterialPageRoute<void>(builder: (_) => const ReportPage()));
      case _DmMoreAction.cancel:
        break;
    }
  }

  Future<void> _toggleBlock() async {
    if (_blocked) {
      setState(() => _blocked = false);
      if (!mounted) return;
      showCenterToast(
        context,
        message: 'The user is removed from the block list.',
      );
      return;
    }

    final confirmed = await AppTipDialog.show(
      context,
      title: 'Block this user?',
      message: "You won't get any more messages from this user.",
      confirmLabel: 'Block',
    );
    if (!mounted || !confirmed) return;
    setState(() => _blocked = true);
    showCenterToast(context, message: 'The other user has been blocked.');
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: topPadding),
          AnimatedBuilder(
            animation: _introCollapse,
            builder: (context, _) {
              return _DmAppBar(
                conversation: _conversation,
                following: _following,
                collapse: _introCollapse.value,
                onFollowTap: () => setState(() => _following = !_following),
                onMoreTap: _openMoreMenu,
              );
            },
          ),
          Expanded(
            child: _DmChatBody(
              messages: _messages,
              peerAvatar: _conversation.avatarAsset,
              messagesScroll: _messagesScroll,
              onHandleDragUpdate: _onIntroDragUpdate,
              onHandleDragEnd: _onIntroDragEnd,
              onMessagesScroll: _onMessagesScroll,
            ),
          ),
          _DmInputBar(
            bottomInset: bottomPadding,
            controller: _inputController,
            onSend: _sendMessage,
            onSendVoice: _sendVoice,
            onSendImages: _sendImages,
          ),
        ],
      ),
    );
  }
}

enum _DmMoreAction { search, follow, block, report, cancel }

class _DmAppBar extends StatelessWidget {
  const _DmAppBar({
    required this.conversation,
    required this.following,
    required this.collapse,
    required this.onFollowTap,
    required this.onMoreTap,
  });

  final ChatConversation conversation;
  final bool following;

  /// 0 expanded → 1 collapsed.
  final double collapse;
  final VoidCallback onFollowTap;
  final VoidCallback onMoreTap;

  static const Color _green = Color(0xFF1CFF8A);

  @override
  Widget build(BuildContext context) {
    final introVisible = 1.0 - collapse;
    final followVisible = introVisible;

    return Padding(
      padding: EdgeInsets.fromLTRB(4, 4, 8, 4 + 6 * introVisible),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: SvgPicture.asset(
                    AppAssets.chatBack,
                    width: 17,
                    height: 7,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    conversation.avatarAsset,
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          conversation.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Image.asset(
                        conversation.isMale
                            ? AppAssets.genderMan
                            : AppAssets.genderWoman,
                        width: 14,
                        height: 14,
                      ),
                    ],
                  ),
                ),
                ClipRect(
                  child: Align(
                    alignment: Alignment.centerRight,
                    widthFactor: followVisible.clamp(0.0, 1.0),
                    child: Opacity(
                      opacity: followVisible.clamp(0.0, 1.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: GestureDetector(
                          onTap: onFollowTap,
                          child: Container(
                            height: 28,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: following
                                  ? Colors.white.withValues(alpha: 0.12)
                                  : _green,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              following ? 'Following' : 'Follow',
                              style: TextStyle(
                                color: following ? Colors.white : Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onMoreTap,
                  icon: Image.asset(
                    AppAssets.msgMore,
                    width: 22,
                    height: 22,
                    color: Colors.white,
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
                  padding: const EdgeInsets.only(left: 56, right: 16, top: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        conversation.signatureDisplay,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.55),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.nightlight_round,
                              size: 12,
                              color: Color(0xFFB08CFF),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              conversation.zodiac,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (conversation.momentAssets.isNotEmpty) ...[
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 88,
                          child: Row(
                            children: [
                              for (
                                var i = 0;
                                i < conversation.momentAssets.length && i < 2;
                                i++
                              ) ...[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    conversation.momentAssets[i],
                                    width: 88,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                if (i < 1 &&
                                    i < conversation.momentAssets.length - 1)
                                  const SizedBox(width: 8),
                              ],
                            ],
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

class _DmChatBody extends StatelessWidget {
  const _DmChatBody({
    required this.messages,
    required this.peerAvatar,
    required this.messagesScroll,
    required this.onHandleDragUpdate,
    required this.onHandleDragEnd,
    required this.onMessagesScroll,
  });

  final List<_ChatLine> messages;
  final String peerAvatar;
  final ScrollController messagesScroll;
  final GestureDragUpdateCallback onHandleDragUpdate;
  final GestureDragEndCallback onHandleDragEnd;
  final NotificationListenerCallback<ScrollNotification> onMessagesScroll;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragUpdate: onHandleDragUpdate,
            onVerticalDragEnd: onHandleDragEnd,
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: SizedBox(
                  width: 36,
                  height: 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFFD8D8D8),
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: onMessagesScroll,
              child: _DmMessagesFeed(
                messages: messages,
                peerAvatar: peerAvatar,
                scrollController: messagesScroll,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DmMessagesFeed extends StatelessWidget {
  const _DmMessagesFeed({
    required this.messages,
    required this.peerAvatar,
    required this.scrollController,
  });

  final List<_ChatLine> messages;
  final String peerAvatar;
  final ScrollController scrollController;

  bool _showAvatar(int index) {
    if (index == 0) return true;
    return messages[index].side != messages[index - 1].side;
  }

  double _topGap(int index) {
    if (index == 0) return 0;
    return messages[index].side == messages[index - 1].side
        ? _BubbleLayout.sameGap
        : _BubbleLayout.otherGap;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final line = messages[index];
        final showAvatar = _showAvatar(index);
        return Padding(
          padding: EdgeInsets.only(top: _topGap(index)),
          child: switch (line.kind) {
            _ChatLineKind.voice => _VoiceBubble(
              side: line.side,
              seconds: line.voiceSeconds,
              peerAvatar: peerAvatar,
              showAvatar: showAvatar,
            ),
            _ChatLineKind.image => _ImageBubble(
              side: line.side,
              asset: line.imageAssets.first,
              locked: false,
              peerAvatar: peerAvatar,
              showAvatar: showAvatar,
            ),
            _ChatLineKind.text =>
              line.side == _ChatSide.self
                  ? _SelfBubble(text: line.text, showAvatar: showAvatar)
                  : _PeerBubble(
                      text: line.text,
                      avatarAsset: peerAvatar,
                      showAvatar: showAvatar,
                    ),
          },
        );
      },
    );
  }
}

class _ChatAvatar extends StatelessWidget {
  const _ChatAvatar({required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_BubbleLayout.avatarRadius),
      child: Image.asset(
        asset,
        width: _BubbleLayout.avatar,
        height: _BubbleLayout.avatar,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _PeerBubble extends StatelessWidget {
  const _PeerBubble({
    required this.text,
    required this.avatarAsset,
    required this.showAvatar,
  });

  final String text;
  final String avatarAsset;
  final bool showAvatar;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showAvatar)
          _ChatAvatar(asset: avatarAsset)
        else
          const SizedBox(width: _BubbleLayout.avatar),
        const SizedBox(width: _BubbleLayout.avatarGap),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _BubbleLayout.peerMax),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: _BubbleLayout.padH,
              vertical: _BubbleLayout.padV,
            ),
            decoration: const BoxDecoration(
              color: _BubbleLayout.peerColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Text(text, style: _BubbleLayout.textStyle),
          ),
        ),
      ],
    );
  }
}

class _SelfBubble extends StatelessWidget {
  const _SelfBubble({required this.text, required this.showAvatar});

  final String text;
  final bool showAvatar;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _BubbleLayout.selfMax),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: _BubbleLayout.padH,
              vertical: _BubbleLayout.padV,
            ),
            decoration: const BoxDecoration(
              color: _BubbleLayout.selfColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(4),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Text(text, style: _BubbleLayout.textStyle),
          ),
        ),
        const SizedBox(width: _BubbleLayout.avatarGap),
        if (showAvatar)
          const _ChatAvatar(asset: AppAssets.avatarPlace)
        else
          const SizedBox(width: _BubbleLayout.avatar),
      ],
    );
  }
}

class _VoiceBubble extends StatelessWidget {
  const _VoiceBubble({
    required this.side,
    required this.seconds,
    required this.peerAvatar,
    required this.showAvatar,
  });

  final _ChatSide side;
  final int seconds;
  final String peerAvatar;
  final bool showAvatar;

  bool get _isSelf => side == _ChatSide.self;

  @override
  Widget build(BuildContext context) {
    final bubble = Container(
      constraints: BoxConstraints(
        minWidth: 88,
        maxWidth: 88 + (seconds.clamp(1, 60) * 1.6),
      ),
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: _isSelf ? _BubbleLayout.selfColor : _BubbleLayout.peerColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_isSelf ? 18 : 4),
          topRight: Radius.circular(_isSelf ? 4 : 18),
          bottomLeft: const Radius.circular(18),
          bottomRight: const Radius.circular(18),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _VoiceBarsIcon(),
          const SizedBox(width: 10),
          Text(
            '${seconds}s',
            style: const TextStyle(
              color: Color(0xFF111111),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    final avatar = showAvatar
        ? _ChatAvatar(asset: _isSelf ? AppAssets.avatarPlace : peerAvatar)
        : const SizedBox(width: _BubbleLayout.avatar);

    if (_isSelf) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bubble,
          const SizedBox(width: _BubbleLayout.avatarGap),
          avatar,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avatar,
        const SizedBox(width: _BubbleLayout.avatarGap),
        bubble,
      ],
    );
  }
}

/// 设计稿：语音气泡左侧三道波形条。
class _VoiceBarsIcon extends StatelessWidget {
  const _VoiceBarsIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: CustomPaint(painter: _VoiceBarsPainter()),
    );
  }
}

class _VoiceBarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF111111)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    const widths = 2.4;
    final heights = [size.height * 0.45, size.height, size.height * 0.62];
    final gap = (size.width - widths * 3) / 2;
    for (var i = 0; i < 3; i++) {
      final h = heights[i];
      final x = i * (widths + gap);
      final y = (size.height - h) / 2;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, widths, h),
          const Radius.circular(1.2),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 图片消息：清晰图 / 锁定模糊 + Join to view。
class _ImageBubble extends StatelessWidget {
  const _ImageBubble({
    required this.side,
    required this.asset,
    required this.locked,
    required this.peerAvatar,
    required this.showAvatar,
  });

  final _ChatSide side;
  final String asset;
  final bool locked;
  final String peerAvatar;
  final bool showAvatar;

  static const double _size = 180;

  bool get _isSelf => side == _ChatSide.self;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.only(
      topLeft: Radius.circular(_isSelf ? 16 : 4),
      topRight: Radius.circular(_isSelf ? 4 : 16),
      bottomLeft: const Radius.circular(16),
      bottomRight: const Radius.circular(16),
    );

    final bubble = ClipRRect(
      borderRadius: radius,
      child: SizedBox(
        width: _size,
        height: _size,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (locked)
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                child: Transform.scale(
                  scale: 1.08,
                  child: Image.asset(asset, fit: BoxFit.cover),
                ),
              )
            else
              Image.asset(asset, fit: BoxFit.cover),
            if (locked)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ColoredBox(
                  color: Colors.black.withValues(alpha: 0.48),
                  child: const SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _LockIcon(),
                        SizedBox(width: 6),
                        Text(
                          'Join to view',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    final avatar = showAvatar
        ? _ChatAvatar(asset: _isSelf ? AppAssets.avatarPlace : peerAvatar)
        : const SizedBox(width: _BubbleLayout.avatar);

    if (_isSelf) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bubble,
          const SizedBox(width: _BubbleLayout.avatarGap),
          avatar,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avatar,
        const SizedBox(width: _BubbleLayout.avatarGap),
        bubble,
      ],
    );
  }
}

class _LockIcon extends StatelessWidget {
  const _LockIcon();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.lockIcon, width: 13, height: 14);
  }
}

class _DmInputBar extends StatefulWidget {
  const _DmInputBar({
    required this.bottomInset,
    required this.controller,
    required this.onSend,
    required this.onSendVoice,
    required this.onSendImages,
  });

  final double bottomInset;
  final TextEditingController controller;
  final ValueChanged<String?> onSend;
  final ValueChanged<int> onSendVoice;
  final ValueChanged<List<String>> onSendImages;

  @override
  State<_DmInputBar> createState() => _DmInputBarState();
}

enum _ChatVoicePhase { idle, recording, preview }

enum _DmPanel { none, voice, photo }

class _DmInputBarState extends State<_DmInputBar> {
  static const int _maxVoiceSeconds = 60;
  static const Color _accentGreen = Color(0xFF1CFF8A);

  /// Voice / photo panels share the same bottom area height (excl. safe inset).
  static const double _panelHeight = 290;

  static const List<String> _mockPhotos = [
    AppAssets.genderFemaleImg,
    AppAssets.genderMaleImg,
    AppAssets.personalBg,
    AppAssets.avatarPlace,
    AppAssets.homeRoomBg,
    AppAssets.launchBg,
    AppAssets.splashLogo,
    AppAssets.mineBg,
    AppAssets.genderFemaleSelected,
    AppAssets.genderMaleSelected,
    AppAssets.emptyAvatar,
    AppAssets.defaultAvatar,
  ];

  bool get _hasText => widget.controller.text.trim().isNotEmpty;
  _DmPanel _panel = _DmPanel.none;
  _ChatVoicePhase _voicePhase = _ChatVoicePhase.idle;
  int _voiceSeconds = 0;
  double _voiceProgress = 0;
  DateTime? _voiceStartedAt;
  Timer? _voiceTimer;

  /// Selection order (photo indices); empty = none selected.
  final List<int> _selectedPhotos = [];
  bool _originalPhoto = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onChanged);
  }

  @override
  void dispose() {
    _voiceTimer?.cancel();
    widget.controller.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() => setState(() {});

  String get _voiceTimeLabel {
    final m = (_voiceSeconds ~/ 60).toString().padLeft(2, '0');
    final s = (_voiceSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  void _toggleVoicePanel() {
    if (_panel == _DmPanel.voice) {
      _closeVoicePanel();
      return;
    }
    _voiceTimer?.cancel();
    setState(() {
      _panel = _DmPanel.voice;
      _voicePhase = _ChatVoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _selectedPhotos.clear();
    });
  }

  void _togglePhotoPanel() {
    if (_panel == _DmPanel.photo) {
      setState(() {
        _panel = _DmPanel.none;
        _selectedPhotos.clear();
      });
      return;
    }
    _voiceTimer?.cancel();
    setState(() {
      _panel = _DmPanel.photo;
      _voicePhase = _ChatVoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _voiceStartedAt = null;
      _selectedPhotos.clear();
      _originalPhoto = true;
    });
  }

  void _closeVoicePanel() {
    _voiceTimer?.cancel();
    _voiceTimer = null;
    _voiceStartedAt = null;
    setState(() {
      if (_panel == _DmPanel.voice) _panel = _DmPanel.none;
      _voicePhase = _ChatVoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
    });
  }

  void _startRecording() {
    _voiceTimer?.cancel();
    final started = DateTime.now();
    setState(() {
      _voicePhase = _ChatVoicePhase.recording;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _voiceStartedAt = started;
    });
    _voiceTimer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      if (!mounted || _voiceStartedAt == null) return;
      final elapsed =
          DateTime.now().difference(_voiceStartedAt!).inMilliseconds / 1000;
      if (elapsed >= _maxVoiceSeconds) {
        setState(() {
          _voiceSeconds = _maxVoiceSeconds;
          _voiceProgress = 1;
        });
        _finishRecording();
        return;
      }
      setState(() {
        _voiceSeconds = elapsed.floor();
        _voiceProgress = elapsed / _maxVoiceSeconds;
      });
    });
  }

  void _finishRecording() {
    _voiceTimer?.cancel();
    _voiceTimer = null;
    _voiceStartedAt = null;
    if (!mounted) return;
    setState(() {
      _voicePhase = _voiceSeconds > 0
          ? _ChatVoicePhase.preview
          : _ChatVoicePhase.idle;
      if (_voicePhase == _ChatVoicePhase.idle) _voiceProgress = 0;
    });
  }

  void _onVoiceMainTap() {
    switch (_voicePhase) {
      case _ChatVoicePhase.idle:
        _startRecording();
      case _ChatVoicePhase.recording:
        _finishRecording();
      case _ChatVoicePhase.preview:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Playing…'),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
          ),
        );
    }
  }

  void _resetVoice() {
    _voiceTimer?.cancel();
    _voiceTimer = null;
    _voiceStartedAt = null;
    setState(() {
      _voicePhase = _ChatVoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
    });
  }

  void _confirmVoice() {
    final seconds = _voiceSeconds;
    _closeVoicePanel();
    widget.onSendVoice(seconds);
  }

  void _togglePhotoAt(int index) {
    setState(() {
      final i = _selectedPhotos.indexOf(index);
      if (i >= 0) {
        _selectedPhotos.removeAt(i);
      } else {
        _selectedPhotos.add(index);
      }
    });
  }

  void _sendSelectedPhotos() {
    if (_selectedPhotos.isEmpty) return;
    final assets = [for (final i in _selectedPhotos) _mockPhotos[i]];
    setState(() {
      _panel = _DmPanel.none;
      _selectedPhotos.clear();
    });
    widget.onSendImages(assets);
  }

  Widget _toolIconFromAsset(String asset, {double size = 30}) {
    return Image.asset(asset, width: size, height: size, fit: BoxFit.contain);
  }

  Widget _giftToolIcon() {
    return Image.asset(
      AppAssets.chatGift,
      width: 30,
      height: 30,
      fit: BoxFit.contain,
    );
  }

  void _showGiftSheet() {
    if (_panel != _DmPanel.none) {
      setState(() => _panel = _DmPanel.none);
    }
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (_) => const _GiftSheet(),
    );
  }

  void _showPlaceholder(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  @override
  Widget build(BuildContext context) {
    final showPanel = _panel != _DmPanel.none;

    return ColoredBox(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              10,
              16,
              showPanel ? 0 : 8 + widget.bottomInset,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 54,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: widget.controller,
                          minLines: 1,
                          maxLines: 4,
                          textInputAction: TextInputAction.send,
                          onSubmitted: widget.onSend,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: const InputDecoration(
                            isDense: true,
                            hintText: 'Please type here...',
                            hintStyle: TextStyle(
                              color: Color(0xFF9E9E9E),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (_hasText)
                        GestureDetector(
                          onTap: () => widget.onSend(null),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: _accentGreen,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_upward_rounded,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        )
                      else
                        _toolIconFromAsset(AppAssets.inputEmoji, size: 24),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _toggleVoicePanel,
                        child: _toolIconFromAsset(
                          AppAssets.chatVoice,
                          size: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: _togglePhotoPanel,
                        child: _toolIconFromAsset(AppAssets.chatImg, size: 30),
                      ),
                      GestureDetector(
                        onTap: _showGiftSheet,
                        child: _giftToolIcon(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (showPanel)
            SizedBox(
              height: _panelHeight + widget.bottomInset,
              width: double.infinity,
              child: _panel == _DmPanel.voice
                  ? Padding(
                      padding: EdgeInsets.only(bottom: widget.bottomInset),
                      child: Center(
                        child: _ChatVoicePanel(
                          timeLabel: _voiceTimeLabel,
                          phase: _voicePhase,
                          progress: _voiceProgress,
                          onMainTap: _onVoiceMainTap,
                          onReset: _resetVoice,
                          onConfirm: _confirmVoice,
                        ),
                      ),
                    )
                  : _ChatPhotoPanel(
                      photos: _mockPhotos,
                      selected: _selectedPhotos,
                      originalPhoto: _originalPhoto,
                      bottomInset: widget.bottomInset,
                      onTogglePhoto: _togglePhotoAt,
                      onCamera: () => _showPlaceholder('Camera coming soon'),
                      onPreview: () {
                        if (_selectedPhotos.isEmpty) return;
                        _showPlaceholder('Preview coming soon');
                      },
                      onAlbum: () => _showPlaceholder('Album coming soon'),
                      onToggleOriginal: () {
                        setState(() => _originalPhoto = !_originalPhoto);
                      },
                      onSend: _sendSelectedPhotos,
                    ),
            ),
        ],
      ),
    );
  }
}

class _ChatPhotoPanel extends StatelessWidget {
  const _ChatPhotoPanel({
    required this.photos,
    required this.selected,
    required this.originalPhoto,
    required this.bottomInset,
    required this.onTogglePhoto,
    required this.onCamera,
    required this.onPreview,
    required this.onAlbum,
    required this.onToggleOriginal,
    required this.onSend,
  });

  final List<String> photos;
  final List<int> selected;
  final bool originalPhoto;
  final double bottomInset;
  final ValueChanged<int> onTogglePhoto;
  final VoidCallback onCamera;
  final VoidCallback onPreview;
  final VoidCallback onAlbum;
  final VoidCallback onToggleOriginal;
  final VoidCallback onSend;

  static const Color _green = Color(0xFF1CFF8A);

  @override
  Widget build(BuildContext context) {
    final hasSelection = selected.isNotEmpty;
    final itemCount = photos.length + 1;

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _CameraCell(onTap: onCamera);
              }
              final photoIndex = index - 1;
              final order = selected.indexOf(photoIndex);
              return _PhotoCell(
                asset: photos[photoIndex],
                order: order < 0 ? null : order + 1,
                onTap: () => onTogglePhoto(photoIndex),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 8 + bottomInset),
          child: SizedBox(
            height: 44,
            child: Row(
              children: [
                GestureDetector(
                  onTap: hasSelection ? onPreview : null,
                  child: Text(
                    'Preview',
                    style: TextStyle(
                      color: hasSelection
                          ? const Color(0xFF111111)
                          : const Color(0xFFB0B0B0),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(width: 1, height: 14, color: const Color(0xFFD8D8D8)),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: onAlbum,
                  child: const Text(
                    'Album',
                    style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onToggleOriginal,
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: originalPhoto ? _green : Colors.transparent,
                          border: originalPhoto
                              ? null
                              : Border.all(
                                  color: const Color(0xFFC8C8C8),
                                  width: 1.5,
                                ),
                        ),
                        child: originalPhoto
                            ? const Icon(
                                Icons.check_rounded,
                                size: 13,
                                color: Colors.white,
                              )
                            : null,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'Original Photo',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: hasSelection ? onSend : null,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 150),
                    opacity: hasSelection ? 1 : 0.45,
                    child: Container(
                      height: 36,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _green,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        hasSelection ? 'Send (${selected.length})' : 'Send',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CameraCell extends StatelessWidget {
  const _CameraCell({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: const _DashedRectPainter(color: Color(0xFFD0D0D0), radius: 4),
        child: ColoredBox(
          color: const Color(0xFFF5F5F5),
          child: Center(
            child: Image.asset(
              AppAssets.cameraIcon,
              width: 28,
              height: 28,
              fit: BoxFit.contain,
              color: const Color(0xFFB0B0B0),
              colorBlendMode: BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class _PhotoCell extends StatelessWidget {
  const _PhotoCell({
    required this.asset,
    required this.order,
    required this.onTap,
  });

  final String asset;
  final int? order;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final selected = order != null;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            asset,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) =>
                const ColoredBox(color: Color(0xFFE8E8E8)),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: Container(
              width: 22,
              height: 22,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected
                    ? const Color(0xFF1CFF8A)
                    : Colors.black.withValues(alpha: 0.15),
                border: Border.all(
                  color: selected ? const Color(0xFF1CFF8A) : Colors.white,
                  width: 1.5,
                ),
              ),
              child: selected
                  ? Text(
                      '$order',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedRectPainter extends CustomPainter {
  const _DashedRectPainter({required this.color, this.radius = 4});

  final Color color;
  final double radius;
  static const double _strokeWidth = 1.2;
  static const double _dash = 4;
  static const double _gap = 3;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        _strokeWidth / 2,
        _strokeWidth / 2,
        size.width - _strokeWidth,
        size.height - _strokeWidth,
      ),
      Radius.circular(radius),
    );
    final path = Path()..addRRect(rect);
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = math.min(distance + _dash, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance = next + _gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedRectPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.radius != radius;
  }
}

class _ChatVoicePanel extends StatelessWidget {
  const _ChatVoicePanel({
    required this.timeLabel,
    required this.phase,
    required this.progress,
    required this.onMainTap,
    required this.onReset,
    required this.onConfirm,
  });

  final String timeLabel;
  final _ChatVoicePhase phase;
  final double progress;
  final VoidCallback onMainTap;
  final VoidCallback onReset;
  final VoidCallback onConfirm;

  static const _labelStyle = TextStyle(
    color: Color(0xFFB0B0B0),
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 18 / 14,
  );

  @override
  Widget build(BuildContext context) {
    final isPreview = phase == _ChatVoicePhase.preview;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Design: 33×18 timer text
        Text(
          timeLabel,
          style: const TextStyle(
            color: Color(0xFFB0B0B0),
            fontSize: 15,
            fontWeight: FontWeight.w500,
            height: 18 / 15,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Design: 44×44 side actions (preview only)
            SizedBox(
              width: 44,
              height: 44,
              child: isPreview
                  ? _ChatVoiceSideButton(
                      onTap: onReset,
                      child: Image.asset(
                        AppAssets.audioRefreshIcon,
                        width: 22,
                        height: 22,
                        fit: BoxFit.contain,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(width: 24),
            _ChatVoiceMainButton(
              phase: phase,
              progress: progress,
              onTap: onMainTap,
            ),
            const SizedBox(width: 24),
            SizedBox(
              width: 44,
              height: 44,
              child: isPreview
                  ? _ChatVoiceSideButton(
                      onTap: onConfirm,
                      child: Image.asset(
                        AppAssets.audioFinishIcon,
                        width: 22,
                        height: 22,
                        fit: BoxFit.contain,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(switch (phase) {
          _ChatVoicePhase.idle => 'Click to record',
          _ChatVoicePhase.recording => 'Recording',
          _ChatVoicePhase.preview => 'Click to play',
        }, style: _labelStyle),
      ],
    );
  }
}

class _ChatVoiceMainButton extends StatelessWidget {
  const _ChatVoiceMainButton({
    required this.phase,
    required this.progress,
    required this.onTap,
  });

  final _ChatVoicePhase phase;
  final double progress;
  final VoidCallback onTap;

  /// Design outer size for the main control (86×86).
  static const double _outer = 86;

  /// Inset yellow fill so the ring around it stays visible.
  static const double _fill = 78;

  @override
  Widget build(BuildContext context) {
    final isIdle = phase == _ChatVoicePhase.idle;
    final isRecording = phase == _ChatVoicePhase.recording;
    final fillSize = isIdle ? _outer : _fill;

    return SizedBox(
      width: _outer,
      height: _outer,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isRecording)
            CustomPaint(
              size: const Size(_outer, _outer),
              painter: _ChatVoiceProgressPainter(progress: progress),
            )
          else if (phase == _ChatVoicePhase.preview)
            CustomPaint(
              size: const Size(_outer, _outer),
              // Preview: light track ring only (design white/grey border).
              painter: const _ChatVoiceProgressPainter(progress: 0),
            ),
          Material(
            color: const Color(0xFFFFE74F),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onTap,
              child: SizedBox(
                width: fillSize,
                height: fillSize,
                child: Center(
                  child: switch (phase) {
                    // Design: mic 42×42
                    _ChatVoicePhase.idle ||
                    _ChatVoicePhase.recording => Image.asset(
                      AppAssets.audioRecordIcon,
                      width: 42,
                      height: 42,
                      fit: BoxFit.contain,
                    ),
                    // Design: waveform
                    _ChatVoicePhase.preview => Image.asset(
                      AppAssets.audioPlayingIcon,
                      width: 36,
                      height: 28,
                      fit: BoxFit.contain,
                    ),
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatVoiceProgressPainter extends CustomPainter {
  const _ChatVoiceProgressPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const stroke = 3.0;
    final radius = size.width / 2 - stroke / 2;
    final track = Paint()
      ..color = const Color(0xFFE8E8E8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    final active = Paint()
      ..color = const Color(0xFFFFE74F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, track);
    final sweep = 2 * math.pi * progress.clamp(0.0, 1.0);
    if (sweep > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        sweep,
        false,
        active,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ChatVoiceProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _ChatVoiceSideButton extends StatelessWidget {
  const _ChatVoiceSideButton({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF0F0F0),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(width: 44, height: 44, child: Center(child: child)),
      ),
    );
  }
}

class _GiftSheet extends StatefulWidget {
  const _GiftSheet();

  @override
  State<_GiftSheet> createState() => _GiftSheetState();
}

class _GiftItem {
  const _GiftItem({
    required this.name,
    required this.emoji,
    required this.cost,
    required this.color,
  });

  final String name;
  final String emoji;
  final int cost;
  final Color color;
}

class _GiftSheetState extends State<_GiftSheet> {
  static const _green = Color(0xFF1CFF8A);
  static const _darkBg = Color(0xFF1A1A1D);
  static const _balance = 0;
  static const _qtyOptions = [1, 3, 10, 40, 100, 999];

  final List<_GiftItem> _gifts = const [
    _GiftItem(
      name: 'Sagittarius M...',
      emoji: '🔮',
      cost: 3000,
      color: Color(0xFF2D6BFF),
    ),
    _GiftItem(name: 'Rosee', emoji: '🌹', cost: 10, color: Color(0xFFEF5350)),
    _GiftItem(name: 'Kisses', emoji: '💋', cost: 10, color: Color(0xFFFF5BA8)),
    _GiftItem(
      name: 'Thanksgiving...',
      emoji: '🦃',
      cost: 40000,
      color: Color(0xFF7B4DFF),
    ),
    _GiftItem(
      name: 'Spellbook',
      emoji: '📕',
      cost: 60,
      color: Color(0xFFEF5350),
    ),
    _GiftItem(
      name: 'Fortune Cook...',
      emoji: '🍳',
      cost: 100,
      color: Color(0xFF2F6BFF),
    ),
    _GiftItem(
      name: 'Doughnut',
      emoji: '🍩',
      cost: 60,
      color: Color(0xFFFFA726),
    ),
    _GiftItem(
      name: 'Flutter',
      emoji: '🦋',
      cost: 120,
      color: Color(0xFFFF5BA8),
    ),
  ];

  int _selected = 0;
  int _qty = 1;

  void _showQtyPicker() {
    final RenderBox box = context.findRenderObject()! as RenderBox;
    final overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;
    final btnOffset = box.localToGlobal(Offset.zero, ancestor: overlay);

    showMenu<int>(
      context: context,
      color: const Color(0xFF2A2A2D),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      position: RelativeRect.fromLTRB(
        btnOffset.dx + box.size.width - 180,
        btnOffset.dy + box.size.height - 330,
        btnOffset.dx + box.size.width - 60,
        0,
      ),
      items: _qtyOptions
          .map(
            (q) => PopupMenuItem<int>(
              value: q,
              child: Center(
                child: Text(
                  '$q',
                  style: TextStyle(
                    color: q == _qty ? _green : Colors.white,
                    fontSize: 16,
                    fontWeight: q == _qty ? FontWeight.w900 : FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    ).then((v) {
      if (v != null) setState(() => _qty = v);
    });
  }

  void _sendSelected() {
    final item = _gifts[_selected];
    final total = item.cost * _qty;
    Navigator.of(context).pop();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Send ${item.name} ×$_qty (cost: $total)'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Container(
      padding: EdgeInsets.only(bottom: bottom),
      decoration: const BoxDecoration(
        color: _darkBg,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Gift',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 300,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _gifts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final g = _gifts[index];
                    final sel = index == _selected;
                    return GestureDetector(
                      onTap: () => setState(() => _selected = index),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2A2A2D),
                                borderRadius: BorderRadius.circular(16),
                                border: sel
                                    ? Border.all(color: _green, width: 2)
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                g.emoji,
                                style: const TextStyle(fontSize: 28),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            g.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                AppAssets.coin,
                                width: 12,
                                height: 12,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                '${g.cost}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(AppAssets.coin, width: 16, height: 16),
                  const SizedBox(width: 6),
                  const Text(
                    '$_balance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const WalletPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 28,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A3A2A),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Top-Up >',
                        style: TextStyle(
                          color: _green,
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: _showQtyPicker,
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: _green, width: 1.5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$_qty',
                            style: const TextStyle(
                              color: _green,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: _green,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: _sendSelected,
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      decoration: BoxDecoration(
                        color: _green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Gift',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Center(
                child: Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

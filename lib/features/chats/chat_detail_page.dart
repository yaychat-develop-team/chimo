import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:characters/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_asset_image.dart';
import '../../core/widgets/app_tip_dialog.dart';
import '../../core/widgets/center_toast.dart';
import '../home/chat_user_profile_page.dart';
import '../home/home_search_page.dart';
import '../home/models/chat_user_profile.dart';
import '../report/report_page.dart';
import '../wallet/wallet_page.dart';
import 'data/chats_list_controller.dart';
import 'models/chat_conversation.dart';

part 'widgets/chat_detail_models.dart';
part 'widgets/chat_detail_app_bar.dart';
part 'widgets/chat_detail_body.dart';
part 'widgets/chat_detail_input.dart';
part 'widgets/chat_detail_gift_sheet.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({
    super.key,
    required this.conversation,
    this.chatsController,
  });

  final ChatConversation conversation;

  /// Sync list when sending (including re-show after swipe-delete).
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

  /// 0 = intro expanded, 1 = intro collapsed (app bar row only).
  late final AnimationController _introCollapse;

  /// Intro is taller with Moments thumbs; increase drag range for handle.
  static const double _introDragRange = 120;

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
    // Swipe up (dy < 0) collapses intro.
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

    final confirmed = await AppTipDialog.confirmBlockUser(context);
    if (!mounted || !confirmed) return;
    setState(() => _blocked = true);
    showCenterToast(context, message: 'The other user has been blocked.');
  }

  void _openPeerProfile() {
    final profile = ChatUserProfile(
      id: _conversation.id,
      nickname: _conversation.title,
      userId:
          '47571${_conversation.id.hashCode.abs() % 100000}'.padLeft(10, '0'),
      avatarAsset: _conversation.avatarAsset,
      isMale: _conversation.isMale,
      age: 24,
      zodiac: _conversation.zodiac,
      level: 16,
      bio: _conversation.signatureDisplay,
      voiceSeconds: 12,
      momentAssets: _conversation.momentAssets,
    );
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChatUserProfilePage(
          profile: profile,
          chatsController: widget.chatsController,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A14),
      // Input bar handles keyboard inset to avoid overflow when panel + keyboard overlap.
      resizeToAvoidBottomInset: false,
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
                onAvatarTap: _openPeerProfile,
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


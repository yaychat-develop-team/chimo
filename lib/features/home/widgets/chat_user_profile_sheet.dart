import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/center_toast.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../../core/widgets/network_or_asset_avatar.dart';
import '../chat_user_profile_page.dart';
import '../../chats/chat_detail_page.dart';
import '../../chats/data/chats_list_controller.dart';
import '../../chats/models/chat_conversation.dart';
import '../../chats/widgets/gift_bottom_sheet.dart';
import '../../report/report_page.dart';
import '../models/chat_user_profile.dart';

/// 群聊中点击对方头像时的底部资料弹层。
class ChatUserProfileSheet extends StatefulWidget {
  const ChatUserProfileSheet({
    super.key,
    required this.profile,
    this.chatsController,
  });

  final ChatUserProfile profile;
  final ChatsListController? chatsController;

  static Future<void> show(
    BuildContext context, {
    required ChatUserProfile profile,
    ChatsListController? chatsController,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.45),
      builder: (context) => ChatUserProfileSheet(
        profile: profile,
        chatsController: chatsController,
      ),
    );
  }

  @override
  State<ChatUserProfileSheet> createState() => _ChatUserProfileSheetState();
}

class _ChatUserProfileSheetState extends State<ChatUserProfileSheet> {
  late bool _following = widget.profile.isFollowing;

  ChatUserProfile get _profile => widget.profile;

  String get _bioDisplay {
    final bio = _profile.bio.trim();
    if (bio.isNotEmpty) return bio;
    if (!_profile.hasGender) {
      return 'They have not set up their personal signature yet.';
    }
    return _profile.isMale
        ? 'He has not set up his personal signature yet.'
        : 'She has not set up her personal signature yet.';
  }

  Future<void> _copyId() async {
    await Clipboard.setData(ClipboardData(text: _profile.userId));
    if (!mounted) return;
    showCenterToast(context, message: 'Saved to the clipboard');
  }

  void _openReport() {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ReportPage(
          reportedId: _profile.userId.isNotEmpty
              ? _profile.userId
              : _profile.id,
          targetKind: ReportTargetKind.user,
        ),
      ),
    );
  }

  void _openChat() {
    final em = _profile.emUsername.trim();
    final conversation = ChatConversation(
      id: em.isNotEmpty ? 'dm_$em' : 'dm_${_profile.id}',
      title: _profile.nickname,
      avatarAsset: _profile.avatarAsset,
      lastMessage: '',
      timeLabel: 'Just',
      isMale: _profile.isMale,
      signature: _profile.bio,
      zodiac: _profile.zodiac,
      isFollowing: _following,
      momentAssets: _profile.momentAssets,
      avatarUrl: _profile.avatarUrl,
      emUserName: em,
    );
    final controller = widget.chatsController;
    controller?.upsertPrivateChat(conversation);
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChatDetailPage(
          conversation: conversation,
          chatsController: controller,
        ),
      ),
    );
  }

  void _openProfilePage() {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChatUserProfilePage(
          profile: _profile,
          chatsController: widget.chatsController,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    // 对齐 forya PersonalBottomPage：头像叠在卡片左上，仅轻微探出顶边。
    const avatarSize = 72.0;
    const sheetOverlap = 12.0;

    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.only(top: sheetOverlap),
            decoration: const BoxDecoration(
              color: Color(0xFF1A1F1C),
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.centerLeft,
                colors: [Color(0xFF24352A), Color(0xFF1A1F1C)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 83),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _profile.nickname,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: _copyId,
                              behavior: HitTestBehavior.opaque,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'ID:${_profile.userId}',
                                    style: const TextStyle(
                                      color: AppColors.textTertiary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  SvgPicture.asset(
                                    AppAssets.mineCopy,
                                    width: 12,
                                    height: 12,
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.textTertiary,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: _openReport,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                size: 14,
                                color: Colors.white.withValues(alpha: 0.75),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Report',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.75),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      if (_profile.zodiac.trim().isNotEmpty)
                        _TagChip(
                          color: const Color(0xFF6B5CFF),
                          child: Text(
                            _profile.zodiac,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      if (_profile.hasGender)
                        _TagChip(
                          color: _profile.isMale
                              ? const Color(0xFF3B82F6)
                              : const Color(0xFFFF5BA8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                _profile.isMale
                                    ? AppAssets.genderMan
                                    : AppAssets.genderWoman,
                                width: 12,
                                height: 12,
                              ),
                              if (_profile.age > 0) ...[
                                const SizedBox(width: 4),
                                Text(
                                  '${_profile.age}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      if ((_profile.vipIconUrl ?? '').trim().isNotEmpty)
                        AppNetworkImage(
                          _profile.vipIconUrl!.trim(),
                          height: 22,
                          fit: BoxFit.fitHeight,
                          errorWidget: (_, _, _) => const SizedBox.shrink(),
                        ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    _bioDisplay,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                      height: 1.35,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 18),
                  _following
                      ? Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: _openChat,
                                child: Container(
                                  height: 48,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1CFF8A),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Text(
                                    'Chat',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            _GiftButton(
                              onTap: () => showGiftBottomSheet(
                                context,
                                receiverUid: widget.profile.userId,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => _following = true),
                                child: Container(
                                  height: 48,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1CFF8A),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Text(
                                    'Follow',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: GestureDetector(
                                onTap: _openChat,
                                child: Container(
                                  height: 48,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                      color: const Color(0xFF1CFF8A),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: const Text(
                                    'Chat',
                                    style: TextStyle(
                                      color: Color(0xFF1CFF8A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            _GiftButton(
                              onTap: () => showGiftBottomSheet(
                                context,
                                receiverUid: widget.profile.userId,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 0,
            child: GestureDetector(
              onTap: _openProfilePage,
              child: Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF1A1F1C),
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: NetworkOrAssetAvatar(
                    asset: _profile.avatarAsset,
                    url: _profile.avatarUrl,
                    width: avatarSize,
                    height: avatarSize,
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

class _TagChip extends StatelessWidget {
  const _TagChip({required this.color, required this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }
}

class _GiftButton extends StatelessWidget {
  const _GiftButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(28),
        ),
        alignment: Alignment.center,
        child: Image.asset(
          AppAssets.giftIcon,
          width: 28,
          height: 28,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_text.dart';
import '../../../../common/utils/zodiac.dart';
import '../../../chat/logic/dm_entry.dart';
import '../../../chat/model/chat_conversation.dart';
import '../../../chat/page/widgets/gift_sheet.dart';
import '../../../../common/extensions/wire_view.dart';
import '../../../../common/models/server_client/user.pb.dart';
import '../../../../common/widgets/app_image.dart';
import '../../../../common/widgets/app_tag_chip.dart';
import '../../../../app/app_jumper.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/utils/app_toast.dart';

/// 群聊中点击对方头像时的底部资料弹层。
class ChatUserProfileSheet extends StatefulWidget {
  const ChatUserProfileSheet({super.key, required this.profile});

  final User profile;
  static Future<void> show(BuildContext context, {required User profile}) {
    return AppBottomSheet.show<void>(
      isScrollControlled: true,
      barrierColor: const Color(0x73000000),
      child: ChatUserProfileSheet(profile: profile),
    );
  }

  @override
  State<ChatUserProfileSheet> createState() => _ChatUserProfileSheetState();
}

class _ChatUserProfileSheetState extends State<ChatUserProfileSheet> {
  late bool _following = widget.profile.following;

  User get _profile => widget.profile;

  String get _zodiacText =>
      _profile.birthday.trim().isEmpty ? '' : Zodiac.fromBirthday(_profile.birthday);

  String get _zodiacLabel => Zodiac.chipLabel(_zodiacText);

  int get _age {
    final birth = Zodiac.parseBirthday(_profile.birthday);
    if (birth != null) {
      final now = DateTime.now();
      var age = now.year - birth.year;
      if (now.month < birth.month || (now.month == birth.month && now.day < birth.day)) {
        age -= 1;
      }
      return age.clamp(0, 120);
    }
    return _profile.age;
  }

  String get _bioDisplay {
    final bio = _profile.personalSignature.trim();
    if (bio.isNotEmpty) return bio;
    if (!_profile.genderKnown) {
      return 'They have not set up their personal signature yet.';
    }
    return _profile.male
        ? 'He has not set up his personal signature yet.'
        : 'She has not set up her personal signature yet.';
  }

  Future<void> _copyId() async {
    await Clipboard.setData(ClipboardData(text: _profile.uid));
    if (!mounted) return;
    AppToast.info('Saved to the clipboard');
  }

  void _openReport() {
    AppJumper.back();
    AppJumper.toReport(reportedId: _profile.uid);
  }

  void _openChat() {
    final em = _profile.emUsername.trim();
    final conversation = ChatConversation(
      id: em.isNotEmpty ? 'dm_$em' : 'dm_${_profile.uid}',
      title: _profile.nickname,
      avatarAsset: AppAssets.avatarPlace,
      lastMessage: '',
      timeLabel: 'Just',
      isMale: _profile.male,
      signature: _profile.personalSignature,
      zodiac: _zodiacText,
      isFollowing: _following,
      momentAssets: _profile.approvedPics,
      avatarUrl: _profile.avatar.trim().isEmpty ? null : _profile.avatar,
      emUserName: em,
    );
    DmEntry.open(conversation, closeCurrent: true);
  }

  void _openProfilePage() {
    AppJumper.back();
    AppJumper.toProfile(_profile.uid, preview: _profile);
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
              color: AppColors.panelGreen,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.centerLeft,
                colors: [AppColors.panelGreenTop, AppColors.panelGreen],
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
                              style: AppText.title,
                            ),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: _copyId,
                              behavior: HitTestBehavior.opaque,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'ID:${_profile.uid}',
                                    style: const TextStyle(
                                      color: AppColors.textTertiary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  AppImage(
                                    AppAssets.mineCopy,
                                    width: 12,
                                    height: 12,
                                    color: AppColors.textTertiary,
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
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                      if (_zodiacLabel.isNotEmpty)
                        AppTagChip(
                          color: Colors.white12,
                          child: Text(
                            _zodiacLabel,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      if (_profile.genderKnown)
                        AppTagChip(
                          color: _profile.male ? AppColors.infoBlueBright : AppColors.genderFemale,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppImage(
                                _profile.male ? AppAssets.genderMan : AppAssets.genderWoman,
                                width: 12,
                                height: 12,
                              ),
                              if (_age > 0) ...[
                                const SizedBox(width: 4),
                                Text(
                                  '$_age',
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
                      if ((_profile.vipSmallIcon ?? '').trim().isNotEmpty)
                        AppImage(
                          _profile.vipSmallIcon!.trim(),
                          height: 22,
                          fit: BoxFit.fitHeight,
                          error: const SizedBox.shrink(),
                        ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(_bioDisplay, style: AppText.body.copyWith(height: 1.35)),
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
                                    color: AppColors.accentNeon,
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
                              onTap: () =>
                                  showGiftBottomSheet(context, receiverUid: widget.profile.uid),
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
                                    color: AppColors.accentNeon,
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
                                    border: Border.all(color: AppColors.accentNeon, width: 1.5),
                                  ),
                                  child: const Text(
                                    'Chat',
                                    style: TextStyle(
                                      color: AppColors.accentNeon,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            _GiftButton(
                              onTap: () =>
                                  showGiftBottomSheet(context, receiverUid: widget.profile.uid),
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
                  border: Border.all(color: AppColors.panelGreen, width: 2),
                ),
                child: ClipOval(
                  child: AppImage(
                    _profile.avatar,
                    fallbackAsset: AppAssets.avatarPlace,
                    width: avatarSize,
                    height: avatarSize,
                    fit: BoxFit.cover,
                    fadeIn: Duration.zero,
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
          color: AppColors.tagBackground,
          borderRadius: BorderRadius.circular(28),
        ),
        alignment: Alignment.center,
        child: AppImage(AppAssets.giftIcon, width: 28, height: 28, fit: BoxFit.contain),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/auth/auth_session.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/widgets/app_tip_dialog.dart';
import '../../core/widgets/center_toast.dart';
import '../chats/chat_detail_page.dart';
import '../chats/data/chats_list_controller.dart';
import '../chats/models/chat_conversation.dart';
import '../chats/widgets/gift_bottom_sheet.dart';
import '../me/data/user_dto.dart';
import '../me/models/me_models.dart';
import '../profile/edit_profile_page.dart';
import '../profile/widgets/user_profile_scaffold.dart';
import '../report/report_page.dart';
import 'models/chat_user_profile.dart';

class ChatUserProfilePage extends StatefulWidget {
  const ChatUserProfilePage({
    super.key,
    required this.profile,
    this.chatsController,
  });

  final ChatUserProfile profile;
  final ChatsListController? chatsController;

  @override
  State<ChatUserProfilePage> createState() => _ChatUserProfilePageState();
}

class _ChatUserProfilePageState extends State<ChatUserProfilePage> {
  late ChatUserProfile _profile;
  late bool _following;
  bool _blocked = false;
  bool _loading = true;
  bool _isSelf = false;

  @override
  void initState() {
    super.initState();
    _profile = widget.profile;
    _following = widget.profile.isFollowing;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_bootstrap());
    });
  }

  String get _targetUid {
    final id = _profile.userId.isNotEmpty ? _profile.userId : _profile.id;
    return id.trim();
  }

  String get _bioText {
    if (_profile.bio.trim().isNotEmpty) return _profile.bio;
    return _profile.isMale
        ? 'He has not set up his personal signature yet.'
        : 'She has not set up her personal signature yet.';
  }

  List<ProfileFlavorTag>? get _flavors {
    if (_profile.tags.isEmpty) return const [];
    return [
      for (final tag in _profile.tags) ProfileFlavorTag(label: tag),
    ];
  }

  List<String> get _momentUrls {
    if (_profile.momentUrls.isNotEmpty) return _profile.momentUrls;
    return const [];
  }

  Future<void> _bootstrap() async {
    final seedUid = _targetUid;
    final self = seedUid.isNotEmpty && await AuthSession.isCurrentUser(seedUid);
    if (!mounted) return;
    setState(() => _isSelf = self);
    await _loadProfile();
  }

  Future<void> _loadProfile() async {
    final uid = _targetUid;
    if (uid.isEmpty) {
      setState(() => _loading = false);
      return;
    }
    try {
      final infoRes = _isSelf
          ? await NetworkBootstrap.api.userInfo()
          : await NetworkBootstrap.api.userInfoByUid(uid);
      if (!mounted) return;
      if (_isSelf) {
        final me = UserDto.parseProfile(infoRes);
        if (me != null) {
          await AuthSession.markLoggedIn(
            userId: me.userId,
            nickname: me.displayName,
            avatarUrl: me.avatarUrl,
          );
          setState(() {
            _profile = ChatUserProfile(
              id: me.userId,
              nickname: me.displayName,
              userId: me.userId,
              avatarAsset: me.avatarAsset,
              avatarUrl: me.avatarUrl,
              isMale: me.isMale,
              age: _ageFromBirthday(me.birthday),
              zodiac: _profile.zodiac,
              level: me.vipLevel,
              bio: me.signature,
              voiceSeconds: me.voiceSeconds,
              momentUrls: me.momentUrls,
              tags: me.tags,
              isFollowing: false,
            );
          });
        }
      } else {
        final parsed = UserDto.parseChatProfile(infoRes);
        if (parsed != null) {
          final self = await AuthSession.isCurrentUser(parsed.userId) ||
              await AuthSession.isCurrentUser(parsed.id);
          setState(() {
            _profile = parsed;
            _following = parsed.isFollowing;
            _isSelf = self;
          });
        }
      }
    } catch (_) {
      // Keep seed profile from list if refresh fails.
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  static int _ageFromBirthday(String birthday) {
    final birth = DateTime.tryParse(birthday);
    if (birth == null) return 0;
    final now = DateTime.now();
    var age = now.year - birth.year;
    if (now.month < birth.month ||
        (now.month == birth.month && now.day < birth.day)) {
      age -= 1;
    }
    return age.clamp(0, 120);
  }

  void _openReport() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (_) => const ReportPage()));
  }

  void _openChat() {
    final conversation = ChatConversation(
      id: 'dm_${_profile.id}',
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
      emUserName: _profile.emUsername,
    );
    widget.chatsController?.upsertPrivateChat(conversation);
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ChatDetailPage(
          conversation: conversation,
          chatsController: widget.chatsController,
        ),
      ),
    );
  }

  Future<void> _openEditProfile() async {
    try {
      final res = await NetworkBootstrap.api.userInfo();
      final me = UserDto.parseProfile(res);
      if (!mounted) return;
      final seed = me ??
          MeProfile(
            displayName: _profile.nickname,
            userId: _profile.userId,
            avatarAsset: _profile.avatarAsset,
            avatarUrl: _profile.avatarUrl,
            friends: 0,
            fans: 0,
            follows: 0,
            visitors: 0,
            signature: _profile.bio,
            gender: _profile.isMale ? 'Male' : 'Female',
            tags: _profile.tags,
            vipLevel: _profile.level,
            momentUrls: _profile.momentUrls,
            voiceSeconds: _profile.voiceSeconds,
          );
      final updated = await Navigator.of(context).push<MeProfile>(
        MaterialPageRoute(builder: (_) => EditProfilePage(profile: seed)),
      );
      if (!mounted) return;
      if (updated != null) {
        setState(() {
          _profile = ChatUserProfile(
            id: updated.userId,
            nickname: updated.displayName,
            userId: updated.userId,
            avatarAsset: updated.avatarAsset,
            avatarUrl: updated.avatarUrl,
            isMale: updated.isMale,
            age: _ageFromBirthday(updated.birthday),
            zodiac: _profile.zodiac,
            level: updated.vipLevel,
            bio: updated.signature,
            voiceSeconds: updated.voiceSeconds,
            momentUrls: updated.momentUrls,
            tags: updated.tags,
            isFollowing: false,
          );
        });
      } else {
        unawaited(_loadProfile());
      }
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Open edit profile failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _toggleFollow() async {
    final uid = _targetUid;
    try {
      final res = _following
          ? await NetworkBootstrap.api.unfollowUser(uid)
          : await NetworkBootstrap.api.followUser(uid);
      if (!mounted) return;
      if (!res.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              res.message.isEmpty ? 'Action failed' : res.message,
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      setState(() => _following = !_following);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Action failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _openMoreMenu() async {
    if (_isSelf) return;
    final action = await showModalBottomSheet<_ProfileMoreAction>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (context) =>
          _ProfileMoreSheet(following: _following, blocked: _blocked),
    );
    if (!mounted || action == null) return;
    switch (action) {
      case _ProfileMoreAction.follow:
        await _toggleFollow();
      case _ProfileMoreAction.report:
        _openReport();
      case _ProfileMoreAction.block:
        await _toggleBlock();
      case _ProfileMoreAction.cancel:
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
    setState(() {
      _blocked = true;
      _following = false;
    });
    showCenterToast(context, message: 'The other user has been blocked.');
  }

  Widget _buildBottomBar() {
    if (_isSelf) {
      return ProfilePrimaryAction(
        label: 'Edit Profile',
        onTap: () => unawaited(_openEditProfile()),
      );
    }

    if (_following) {
      return Row(
        children: [
          Expanded(
            child: ProfilePrimaryAction(label: 'Chat', onTap: _openChat),
          ),
          const SizedBox(width: 10),
          ProfileGiftAction(onTap: () => showGiftBottomSheet(context)),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: ProfilePrimaryAction(
            label: 'Follow',
            onTap: () => unawaited(_toggleFollow()),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ProfileOutlineAction(label: 'Chat', onTap: _openChat),
        ),
        const SizedBox(width: 10),
        ProfileGiftAction(onTap: () => showGiftBottomSheet(context)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserProfileScaffold(
          nickname: _profile.nickname.isEmpty ? 'User' : _profile.nickname,
          userId: _profile.userId,
          avatarAsset: _profile.avatarAsset,
          avatarUrl: _profile.avatarUrl,
          isMale: _profile.isMale,
          age: _profile.age,
          zodiac: _profile.zodiac,
          level: _profile.level,
          bio: _bioText,
          voiceSeconds: _profile.voiceSeconds,
          momentUrls: _momentUrls,
          flavors: _flavors,
          inPartyName: _isSelf ? null : _profile.inPartyName,
          showMore: !_isSelf,
          onMore: _isSelf ? null : _openMoreMenu,
          bottomBar: _buildBottomBar(),
        ),
        if (_loading)
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(
              minHeight: 2,
              color: Color(0xFFB6FF2E),
              backgroundColor: Colors.transparent,
            ),
          ),
      ],
    );
  }
}

enum _ProfileMoreAction { follow, report, block, cancel }

class _ProfileMoreSheet extends StatelessWidget {
  const _ProfileMoreSheet({required this.following, required this.blocked});

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
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                _MoreItem(
                  label: following ? 'Unfollow' : 'Follow',
                  onTap: () =>
                      Navigator.pop(context, _ProfileMoreAction.follow),
                ),
                const Divider(height: 1, color: Color(0xFF3A3A3A)),
                _MoreItem(
                  label: 'Report',
                  onTap: () =>
                      Navigator.pop(context, _ProfileMoreAction.report),
                ),
                const Divider(height: 1, color: Color(0xFF3A3A3A)),
                _MoreItem(
                  label: blocked ? 'Unblock' : 'Block',
                  destructive: !blocked,
                  onTap: () =>
                      Navigator.pop(context, _ProfileMoreAction.block),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Material(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(14),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () => Navigator.pop(context, _ProfileMoreAction.cancel),
              child: const SizedBox(
                height: 52,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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

class _MoreItem extends StatelessWidget {
  const _MoreItem({
    required this.label,
    required this.onTap,
    this.destructive = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 52,
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: destructive ? const Color(0xFFFF5A5A) : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

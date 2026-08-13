import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/auth/auth_session.dart';
import '../../core/network/app_apis.dart';
import '../../core/utils/personal_effect_card_cache.dart';
import '../../core/utils/zodiac.dart';
import '../../core/widgets/app_action_bottom_sheet.dart';
import '../../core/widgets/app_tip_dialog.dart';
import '../../core/widgets/center_toast.dart';
import '../../core/widgets/pag_network_overlay.dart';
import '../chats/chat_detail_page.dart';
import '../chats/data/chats_list_controller.dart';
import '../chats/models/chat_conversation.dart';
import '../chats/widgets/gift_bottom_sheet.dart';
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
  bool _showCardEffect = false;

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

  String get _emHint {
    final em = _profile.emUsername.trim();
    if (em.isNotEmpty) return em;
    final id = _targetUid;
    if (id.startsWith('yqdf-') || id.contains('yqdf')) return id;
    return '';
  }

  String get _bioText {
    if (_profile.bio.trim().isNotEmpty) return _profile.bio;
    if (!_profile.hasGender) return 'No personal signature yet.';
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
    final self = seedUid.isNotEmpty &&
        (await AuthSession.isCurrentUser(seedUid) ||
            await AuthSession.isCurrentUser(_emHint));
    if (!mounted) return;
    setState(() => _isSelf = self);
    await _loadProfile();
    if (!mounted) return;
    await _maybeShowCardEffect();
  }

  /// 对齐 forya `showEffectIfNeed`：有 `cardDynamicResource` 且未在冷却内则播放。
  Future<void> _maybeShowCardEffect() async {
    final url = _profile.cardDynamicResource.trim();
    final uid = _profile.userId.trim().isNotEmpty
        ? _profile.userId.trim()
        : _targetUid;
    if (url.isEmpty || uid.isEmpty) return;
    if (!PersonalEffectCardCache.shouldShow(uid)) return;
    if (!mounted) return;
    setState(() => _showCardEffect = true);
  }

  /// 优先数字应用 uid；EaseMob 用户名经 `/user/msg-user` 解析。
  Future<String> _resolveAppUid() async {
    final raw = _targetUid;
    if (RegExp(r'^\d+$').hasMatch(raw)) return raw;
    final em = _emHint.isNotEmpty ? _emHint : raw;
    if (em.isEmpty) return raw;
    try {
      final msgRes = await AppApis.relation.msgUser(em);
      final id = msgRes.data?.id.trim() ?? '';
      if (RegExp(r'^\d+$').hasMatch(id)) return id;
    } catch (_) {}
    return raw;
  }

  Future<void> _loadProfile() async {
    final seed = _targetUid;
    if (seed.isEmpty && _emHint.isEmpty) {
      setState(() => _loading = false);
      return;
    }
    try {
      if (_isSelf) {
        final infoRes = await AppApis.user.profileOrNull();
        if (!mounted) return;
        final me = infoRes.data;
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
              zodiac: zodiacFromBirthday(me.birthday),
              level: me.vipLevel,
              bio: me.signature,
              voiceSeconds: me.voiceSeconds,
              voiceUrl: me.voiceUrl,
              vipIconUrl: me.vipIconUrl,
              momentUrls: me.momentUrls,
              tags: me.tags,
              isFollowing: false,
              emUsername: _profile.emUsername,
              cardDynamicResource: me.cardDynamicResource,
            );
          });
        }
      } else {
        final appUid = await _resolveAppUid();
        if (!mounted) return;
        final infoRes = await AppApis.user.profileByUidOrNull(appUid);
        if (!mounted) return;
        final parsed = infoRes.data;
        var blocked = false;
        final blockUid = (parsed?.userId.isNotEmpty == true)
            ? parsed!.userId
            : appUid;
        if (blockUid.isNotEmpty && RegExp(r'^\d+$').hasMatch(blockUid)) {
          try {
            final blackRes = await AppApis.relation.isBlocked(blockUid);
            blocked = blackRes.data ?? false;
          } catch (_) {}
        }
        if (!mounted) return;
        if (parsed != null) {
          final self = await AuthSession.isCurrentUser(parsed.userId) ||
              await AuthSession.isCurrentUser(parsed.id);
          final em = parsed.emUsername.isNotEmpty
              ? parsed.emUsername
              : (_emHint.isNotEmpty ? _emHint : _profile.emUsername);
          setState(() {
            _profile = parsed.copyWith(
              emUsername: em,
              // 仅当 API 未返回时保留种子 Moments/标签（少见）。
            );
            _following = parsed.isFollowing;
            _blocked = blocked;
            _isSelf = self;
          });
        } else {
          setState(() => _blocked = blocked);
        }
      }
    } catch (_) {
      // 刷新失败时保留列表带来的种子资料。
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
      final res = await AppApis.user.profileOrNull();
      final me = res.data;
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
            voiceUrl: updated.voiceUrl,
            vipIconUrl: updated.vipIconUrl,
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
          ? await AppApis.relation.unfollow(uid)
          : await AppApis.relation.follow(uid);
      if (!mounted) return;
      if (!res.ok) {
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
    final action = await AppActionBottomSheet.show<_ProfileMoreAction>(
      context: context,
      buildItems: (sheetContext) => [
        AppActionSheetItem(
          label: _following ? 'Unfollow' : 'Follow',
          onTap: () =>
              Navigator.pop(sheetContext, _ProfileMoreAction.follow),
        ),
        AppActionSheetItem(
          label: 'Report',
          destructive: true,
          onTap: () =>
              Navigator.pop(sheetContext, _ProfileMoreAction.report),
        ),
        AppActionSheetItem(
          label: _blocked ? 'Unblock' : 'Block',
          destructive: !_blocked,
          onTap: () => Navigator.pop(sheetContext, _ProfileMoreAction.block),
        ),
      ],
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
    final uid = _targetUid;
    if (uid.isEmpty || !RegExp(r'^\d+$').hasMatch(uid)) {
      showCenterToast(
        context,
        message: 'Block failed: user id not ready',
      );
      return;
    }

    if (_blocked) {
      try {
        final res = await AppApis.relation.setBlackList(
          userId: uid,
          isCancel: true,
        );
        if (!mounted) return;
        if (!res.ok) {
          showCenterToast(
            context,
            message: res.message.isEmpty ? 'Unblock failed' : res.message,
          );
          return;
        }
        setState(() => _blocked = false);
        showCenterToast(
          context,
          message: 'The user is removed from the block list.',
        );
      } catch (error) {
        if (!mounted) return;
        showCenterToast(context, message: 'Unblock failed: $error');
      }
      return;
    }

    final confirmed = await AppTipDialog.confirmBlockUser(context);
    if (!mounted || !confirmed) return;
    try {
      final res = await AppApis.relation.setBlackList(
        userId: uid,
        isCancel: false,
      );
      if (!mounted) return;
      if (!res.ok) {
        showCenterToast(
          context,
          message: res.message.isEmpty ? 'Block failed' : res.message,
        );
        return;
      }
      setState(() {
        _blocked = true;
        _following = false;
      });
      showCenterToast(context, message: 'The other user has been blocked.');
    } catch (error) {
      if (!mounted) return;
      showCenterToast(context, message: 'Block failed: $error');
    }
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
          ProfileGiftAction(
            onTap: () => showGiftBottomSheet(
              context,
              receiverUid: _profile.userId,
            ),
          ),
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
        ProfileGiftAction(
          onTap: () => showGiftBottomSheet(
            context,
            receiverUid: _profile.userId,
          ),
        ),
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
          showZodiac: _profile.zodiac.trim().isNotEmpty,
          showGenderAge: _profile.hasGender,
          bio: _bioText,
          voiceSeconds: _profile.voiceSeconds,
          voiceUrl: _profile.voiceUrl,
          vipIconUrl: _profile.vipIconUrl,
          momentUrls: _momentUrls,
          flavors: _flavors,
          inPartyName: _isSelf ? null : _profile.inPartyName,
          showMore: !_isSelf,
          onMore: _isSelf ? null : _openMoreMenu,
          bottomBar: _buildBottomBar(),
        ),
        if (_showCardEffect && _profile.cardDynamicResource.trim().isNotEmpty)
          PagNetworkOverlay(
            url: _profile.cardDynamicResource,
            onAnimationStart: () {
              final uid = _profile.userId.trim().isNotEmpty
                  ? _profile.userId.trim()
                  : _targetUid;
              PersonalEffectCardCache.markShown(uid);
            },
            onAnimationEnd: () {
              if (!mounted) return;
              setState(() => _showCardEffect = false);
            },
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


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/utils/zodiac.dart';
import '../logic/flavor_label_store.dart';
import '../../../common/theme/app_bottom_sheet.dart';
import '../../../common/widgets/pag_network_overlay.dart';
import '../../chat/page/widgets/gift_sheet.dart';
import 'widgets/user_profile_scaffold.dart';
import '../logic/chat_user_profile_logic.dart';
import '../../../common/theme/app_colors.dart';
import '../../../app/app_jumper.dart';

class ChatUserProfilePage extends StatefulWidget {
  const ChatUserProfilePage({super.key, required this.seed});

  /// 首帧预填资料（列表点进来的那份）；真资料由 logic 按 uid 重拉。
  final User seed;

  @override
  State<ChatUserProfilePage> createState() => _ChatUserProfilePageState();
}

class _ChatUserProfilePageState extends State<ChatUserProfilePage> {
  late final ChatUserProfileLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(ChatUserProfileLogic(seed: widget.seed));
  }

  @override
  void dispose() {
    if (Get.isRegistered<ChatUserProfileLogic>()) {
      Get.delete<ChatUserProfileLogic>();
    }
    super.dispose();
  }

  int _displayAge(User profile) {
    final birth = Zodiac.parseBirthday(profile.birthday);
    if (birth != null) {
      final now = DateTime.now();
      var age = now.year - birth.year;
      if (now.month < birth.month || (now.month == birth.month && now.day < birth.day)) {
        age -= 1;
      }
      return age.clamp(0, 120);
    }
    return profile.age;
  }

  String _zodiac(User profile) {
    if (profile.birthday.trim().isEmpty) return '';
    return Zodiac.fromBirthday(profile.birthday);
  }

  List<ProfileFlavorTag>? get _flavors {
    final tags = logic.p.makeFriendsLabel;
    if (tags.isEmpty) return const [];
    return [
      for (final tag in tags)
        if (FlavorLabelStore.display(tag).isNotEmpty)
          ProfileFlavorTag(label: FlavorLabelStore.display(tag)),
    ];
  }

  Future<void> _openMoreMenu() async {
    if (logic.isSelf.value) return;
    final action = await AppBottomSheet.actions<_ProfileMoreAction>(
      buildItems: () => [
        AppSheetAction(
          label: logic.following.value ? 'Unfollow' : 'Follow',
          onTap: () => AppJumper.back(result: _ProfileMoreAction.follow),
        ),
        AppSheetAction(
          label: 'Report',
          destructive: true,
          onTap: () => AppJumper.back(result: _ProfileMoreAction.report),
        ),
        AppSheetAction(
          label: logic.blocked.value ? 'Unblock' : 'Block',
          destructive: !logic.blocked.value,
          onTap: () => AppJumper.back(result: _ProfileMoreAction.block),
        ),
      ],
    );
    if (action == null || logic.isClosed) return;
    switch (action) {
      case _ProfileMoreAction.follow:
        await logic.toggleFollow();
      case _ProfileMoreAction.report:
        logic.openReport();
      case _ProfileMoreAction.block:
        await logic.toggleBlock();
      case _ProfileMoreAction.cancel:
        break;
    }
  }

  Widget _buildBottomBar(BuildContext context) {
    if (logic.isSelf.value) {
      return ProfilePrimaryAction(
        label: 'Edit Profile',
        onTap: () => unawaited(logic.openEditProfile()),
      );
    }

    if (logic.following.value) {
      return Row(
        children: [
          Expanded(
            child: ProfilePrimaryAction(label: 'Chat', onTap: logic.openChat),
          ),
          const SizedBox(width: 10),
          ProfileGiftAction(onTap: () => showGiftBottomSheet(context, receiverUid: logic.p.uid)),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: ProfilePrimaryAction(
            label: 'Follow',
            onTap: () => unawaited(logic.toggleFollow()),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ProfileOutlineAction(label: 'Chat', onTap: logic.openChat),
        ),
        const SizedBox(width: 10),
        ProfileGiftAction(onTap: () => showGiftBottomSheet(context, receiverUid: logic.p.uid)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 整页一个 `Obx`：原版每次 `setState` 也是整页重建，收窄反而改了行为。
    return Obx(() {
      final profile = logic.p;
      final isSelf = logic.isSelf.value;
      return Stack(
        children: [
          UserProfileScaffold(
            nickname: profile.nickname.isEmpty ? 'User' : profile.nickname,
            userId: profile.uid,
            avatarAsset: AppAssets.avatarPlace,
            avatarUrl: isSelf ? profile.shownAvatar : profile.avatar,
            avatarUnderReview: isSelf && profile.avatarAudit.trim().isNotEmpty,
            isMale: profile.male,
            age: _displayAge(profile),
            zodiac: _zodiac(profile),
            showZodiac: profile.birthday.trim().isNotEmpty,
            showGenderAge: profile.genderKnown,
            bio: logic.bioText,
            voiceSeconds: profile.voiceDuration > 0 ? profile.voiceDuration : null,
            voiceUrl: profile.voice.trim().isEmpty ? null : profile.voice,
            vipIconUrl: profile.vipSmallIcon,
            momentUrls: logic.momentUrls,
            flavors: _flavors,
            // 移除房间相关入口：不展示 In Party。
            inPartyName: null,
            showMore: !isSelf,
            onMore: isSelf ? null : _openMoreMenu,
            bottomBar: _buildBottomBar(context),
          ),
          if (logic.showCardEffect.value && profile.cardDynamicResource.trim().isNotEmpty)
            PagNetworkOverlay(
              url: profile.cardDynamicResource,
              onAnimationEnd: logic.dismissCardEffect,
            ),
          if (logic.loading.value)
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(
                minHeight: 2,
                color: AppColors.accentLimeBright,
                backgroundColor: Colors.transparent,
              ),
            ),
        ],
      );
    });
  }
}

enum _ProfileMoreAction { follow, report, block, cancel }

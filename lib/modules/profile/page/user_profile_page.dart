import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_gift.dart';
import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/gift_wall.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/theme/app_bottom_sheet.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/zodiac.dart';
import '../../../common/widgets/pag_network_overlay.dart';
import '../../heart_link/widgets/heart_link_relation_section.dart';
import '../../heart_link/widgets/heart_link_secret_card_dialog.dart';
import '../logic/user_profile_logic.dart';
import '../logic/flavor_label_store.dart';
import 'widgets/personal_profile_sections.dart';
import 'widgets/user_profile_scaffold.dart';

/// 个人主页（自己 / 他人共用）
class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key, required this.seed});

  /// 首帧预填资料；真资料由 logic 按 uid 重拉。
  final User seed;

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late final UserProfileLogic logic;
  late final String _tag;

  String get _logicTag {
    final id = widget.seed.id.toInt();
    if (id > 0) return '$id';
    final uid = widget.seed.uid.trim();
    if (uid.isNotEmpty && uid != '0') return uid;
    return 'seed_${identityHashCode(widget.seed)}';
  }

  @override
  void initState() {
    super.initState();
    _tag = _logicTag;
    logic = Get.put(UserProfileLogic(seed: widget.seed), tag: _tag);
  }

  @override
  void dispose() {
    if (Get.isRegistered<UserProfileLogic>(tag: _tag)) {
      Get.delete<UserProfileLogic>(tag: _tag);
    }
    super.dispose();
  }

  void _popWithResult() {
    AppJumper.back(result: logic.p);
  }

  String _zodiac(User profile) {
    if (profile.birthday.trim().isEmpty) return '';
    return Zodiac.fromBirthday(profile.birthday);
  }

  List<ProfileFlavorTag>? get _flavors {
    final tags = logic.p.makeFriendsLabel;
    if (tags.isEmpty) return const [];
    return tags
        .map(FlavorLabelStore.display)
        .where((label) => label.isNotEmpty)
        .map((label) => ProfileFlavorTag(label: label))
        .toList();
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
    }
  }

  void _openParty() {
    final rid = logic.partyRid;
    if (rid <= 0) return;
    AppJumper.toRoom(rid);
  }

  void _openGiftWall() {
    final id = logic.numericUid;
    if (id <= 0) return;
    AppJumper.toGiftWall(id);
  }

  void _openRevealCard() {
    final id = logic.numericUid;
    if (id <= 0) return;
    HeartLinkSecretCardDialog.show(id);
  }

  Widget _buildBottomBar(BuildContext context) {
    if (logic.isSelf.value) {
      return ProfilePrimaryAction(label: 'Edit Profile', onTap: () => logic.openEditProfile());
    }

    if (logic.following.value) {
      return Row(
        children: [
          Expanded(
            child: ProfilePrimaryAction(label: 'Chat', onTap: logic.openChat),
          ),
          const SizedBox(width: 10),
          ProfileGiftAction(
            onTap: () => AppGift.show(
              context,
              scene: AppGiftScene.profile,
              receiverUid: logic.p.uid,
              receiverName: logic.p.nickname,
              receiverAvatar: logic.p.avatar,
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: ProfilePrimaryAction(label: 'Follow', onTap: () => logic.toggleFollow()),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ProfileOutlineAction(label: 'Chat', onTap: logic.openChat),
        ),
        const SizedBox(width: 10),
        ProfileGiftAction(
          onTap: () => AppGift.show(
            context,
            scene: AppGiftScene.profile,
            receiverUid: logic.p.uid,
            receiverName: logic.p.nickname,
            receiverAvatar: logic.p.avatar,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 整页一个 `Obx`：原版每次 `setState` 也是整页重建，收窄反而改了行为。
    return Obx(() {
      final profile = logic.p;
      final isSelf = logic.isSelf.value;
      final wall = logic.giftWall.value ?? GiftWallListRsp();
      final extra = <Widget>[
        HeartLinkRelationSection(uid: logic.numericUid, data: logic.hearties.value),
        ProfileRelationshipSection(relations: logic.relations.toList()),
        ProfileGiftWallBanner(wall: wall, onTap: _openGiftWall),
      ];

      return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;
          _popWithResult();
        },
        child: Stack(
          children: [
            UserProfileScaffold(
              nickname: profile.nickname.isEmpty ? 'User' : profile.nickname,
              userId: profile.uid,
              avatarAsset: AppAssets.avatarPlace,
              avatarUrl: isSelf ? profile.shownAvatar : profile.avatar,
              avatarUnderReview: isSelf && profile.avatarAudit.trim().isNotEmpty,
              isMale: profile.male,
              age: Zodiac.age(profile.birthday, fallback: profile.age),
              zodiac: _zodiac(profile),
              showZodiac: profile.birthday.trim().isNotEmpty,
              showGenderAge: profile.genderKnown,
              bio: logic.bioText,
              voiceSeconds: profile.voiceDuration > 0 ? profile.voiceDuration : null,
              voiceUrl: profile.voice.trim().isEmpty ? null : profile.voice,
              vipIconUrl: profile.vipSmallIcon,
              momentUrls: logic.momentUrls,
              flavors: _flavors,
              showMore: !isSelf,
              onBack: _popWithResult,
              onMore: isSelf ? null : _openMoreMenu,
              onRefresh: logic.refreshAll,
              partyBanner: logic.inParty
                  ? ProfilePartyBanner(title: logic.partyTitle, onTap: _openParty)
                  : null,
              revealBanner: logic.hasUnlockRevealCard.value
                  ? ProfileRevealCardBanner(
                      isMale: profile.male,
                      onReveal: _openRevealCard,
                    )
                  : null,
              extraSections: extra,
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
                  color: AppColors.greenB6FF2E,
                  backgroundColor: Colors.transparent,
                ),
              ),
          ],
        ),
      );
    });
  }
}

enum _ProfileMoreAction { follow, report, block }

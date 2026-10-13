import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/flavor_label_store.dart';
import '../logic/personal_profile_logic.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../app/storage/effect_store.dart';
import '../../../common/utils/zodiac.dart';
import '../../../common/widgets/pag_network_overlay.dart';
import 'widgets/user_profile_scaffold.dart';
import '../../../common/theme/app_colors.dart';
import '../../../app/app_jumper.dart';

/// 自己的资料页：布局与他人一致；底栏为编辑资料。
class PersonalProfilePage extends StatefulWidget {
  const PersonalProfilePage({super.key, required this.profile, this.zodiac});

  final User profile;
  final String? zodiac;

  @override
  State<PersonalProfilePage> createState() => _PersonalProfilePageState();
}

class _PersonalProfilePageState extends State<PersonalProfilePage> {
  late final PersonalProfileLogic logic;
  bool _showCardEffect = false;

  User get _profile => logic.profile.value;
  bool get _loading => logic.loading.value;

  @override
  void initState() {
    super.initState();
    logic = Get.put(PersonalProfileLogic(seed: widget.profile));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_loadFromApi());
    });
  }

  @override
  void dispose() {
    Get.delete<PersonalProfileLogic>();
    super.dispose();
  }

  int get _age {
    final birth = Zodiac.parseBirthday(_profile.birthday);
    if (birth == null) return 0;
    final now = DateTime.now();
    var age = now.year - birth.year;
    if (now.month < birth.month || (now.month == birth.month && now.day < birth.day)) {
      age -= 1;
    }
    return age.clamp(0, 120);
  }

  String get _zodiac {
    if (_profile.birthday.trim().isEmpty) return '';
    return widget.zodiac ?? Zodiac.fromBirthday(_profile.birthday);
  }

  bool get _hasGender => _profile.genderKnown;

  bool get _hasBirthday => _profile.birthday.trim().isNotEmpty;

  String get _signatureText {
    if (_profile.personalSignature.trim().isNotEmpty) {
      return _profile.personalSignature;
    }
    if (!_hasGender) {
      return 'No personal signature yet.';
    }
    return _profile.male
        ? 'He has not set up his personal signature yet.'
        : 'She has not set up her personal signature yet.';
  }

  List<ProfileFlavorTag>? get _flavors {
    if (_profile.makeFriendsLabel.isEmpty) return const [];
    return [
      for (final tag in _profile.makeFriendsLabel)
        if (FlavorLabelStore.display(tag).isNotEmpty)
          ProfileFlavorTag(label: FlavorLabelStore.display(tag)),
    ];
  }

  List<String> get _momentUrls => _profile.approvedPics;

  Future<void> _loadFromApi() async {
    await logic.refreshProfile();
    if (!mounted) return;
    await _maybeShowCardEffect();
  }

  Future<void> _maybeShowCardEffect() async {
    final url = _profile.cardDynamicResource.trim();
    final uid = _profile.uid.trim();
    if (url.isEmpty || uid.isEmpty) return;
    if (!EffectStore.requestShow(uid)) return;
    if (!mounted) return;
    setState(() => _showCardEffect = true);
  }

  Future<void> _openEditProfile() async {
    final updated = await AppJumper.toEditProfile(profile: _profile);
    if (!mounted || updated == null) return;
    logic.replace(updated);
  }

  void _popWithResult() {
    AppJumper.back(result: _profile);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;
          _popWithResult();
        },
        child: Stack(
          children: [
            UserProfileScaffold(
              nickname: _profile.nickname.isEmpty ? 'User' : _profile.nickname,
              userId: _profile.uid,
              avatarAsset: AppAssets.avatarPlace,
              avatarUrl: _profile.shownAvatar,
              avatarUnderReview: _profile.avatarAudit.trim().isNotEmpty,
              isMale: _profile.male,
              age: _age,
              zodiac: _zodiac,
              showZodiac: _hasBirthday,
              showGenderAge: _hasGender,
              bio: _signatureText,
              voiceSeconds: _profile.voiceDuration > 0 ? _profile.voiceDuration : null,
              voiceUrl: _profile.voice.trim().isEmpty ? null : _profile.voice,
              vipIconUrl: _profile.vipSmallIcon,
              momentUrls: _momentUrls,
              flavors: _flavors,
              inPartyName: null,
              showMore: false,
              onBack: _popWithResult,
              bottomBar: ProfilePrimaryAction(label: 'Edit Profile', onTap: _openEditProfile),
            ),
            if (_showCardEffect && _profile.cardDynamicResource.trim().isNotEmpty)
              PagNetworkOverlay(
                url: _profile.cardDynamicResource,
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
                  color: AppColors.accentLimeBright,
                  backgroundColor: Colors.transparent,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

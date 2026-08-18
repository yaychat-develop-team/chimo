import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/network/app_apis.dart';
import '../../core/network/flavor_label_store.dart';
import '../../core/utils/personal_effect_card_cache.dart';
import '../../core/utils/zodiac.dart';
import '../../core/widgets/pag_network_overlay.dart';
import '../me/models/me_models.dart';
import 'edit/edit_profile_page.dart';
import 'widgets/user_profile_scaffold.dart';

/// 自己的资料页：布局与他人一致；底栏为编辑资料。
class PersonalProfilePage extends StatefulWidget {
  const PersonalProfilePage({
    super.key,
    required this.profile,
    this.zodiac,
  });

  final MeProfile profile;
  final String? zodiac;

  @override
  State<PersonalProfilePage> createState() => _PersonalProfilePageState();
}

class _PersonalProfilePageState extends State<PersonalProfilePage> {
  late MeProfile _profile;
  bool _loading = true;
  bool _showCardEffect = false;

  @override
  void initState() {
    super.initState();
    _profile = widget.profile;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_loadFromApi());
    });
  }

  int get _age {
    final birth = parseBirthday(_profile.birthday);
    if (birth == null) return 0;
    final now = DateTime.now();
    var age = now.year - birth.year;
    if (now.month < birth.month ||
        (now.month == birth.month && now.day < birth.day)) {
      age -= 1;
    }
    return age.clamp(0, 120);
  }

  String get _zodiac {
    if (_profile.birthday.trim().isEmpty) return '';
    return widget.zodiac ?? zodiacFromBirthday(_profile.birthday);
  }

  bool get _hasGender => _profile.gender.trim().isNotEmpty;

  bool get _hasBirthday => _profile.birthday.trim().isNotEmpty;

  String get _signatureText {
    if (_profile.signature.trim().isNotEmpty) {
      return _profile.signature;
    }
    if (!_hasGender) {
      return 'No personal signature yet.';
    }
    return _profile.isMale
        ? 'He has not set up his personal signature yet.'
        : 'She has not set up her personal signature yet.';
  }

  List<ProfileFlavorTag>? get _flavors {
    if (_profile.tags.isEmpty) return const [];
    return [
      for (final tag in _profile.tags)
        if (FlavorLabelStore.display(tag).isNotEmpty)
          ProfileFlavorTag(label: FlavorLabelStore.display(tag)),
    ];
  }

  List<String> get _momentUrls {
    if (_profile.momentUrls.isNotEmpty) return _profile.momentUrls;
    return const [];
  }

  Future<void> _loadFromApi() async {
    try {
      final infoRes = await AppApis.user.profileOrNull();
      if (!mounted) return;
      final parsed = infoRes.data;
      if (parsed != null) {
        await FlavorLabelStore.ensureLoaded();
        if (!mounted) return;
        setState(() => _profile = parsed);
      }
    } catch (_) {
      // 刷新失败时保留 Me 页带来的种子资料。
    } finally {
      if (mounted) setState(() => _loading = false);
    }
    if (!mounted) return;
    await _maybeShowCardEffect();
  }

  Future<void> _maybeShowCardEffect() async {
    final url = _profile.cardDynamicResource.trim();
    final uid = _profile.userId.trim();
    if (url.isEmpty || uid.isEmpty) return;
    if (!PersonalEffectCardCache.shouldShow(uid)) return;
    if (!mounted) return;
    setState(() => _showCardEffect = true);
  }

  Future<void> _openEditProfile() async {
    final updated = await Navigator.of(context).push<MeProfile>(
      MaterialPageRoute(
        builder: (_) => EditProfilePage(profile: _profile),
      ),
    );
    if (!mounted || updated == null) return;
    setState(() => _profile = updated);
  }

  void _popWithResult() {
    Navigator.of(context).pop(_profile);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _popWithResult();
      },
      child: Stack(
        children: [
          UserProfileScaffold(
            nickname: _profile.displayName.isEmpty
                ? 'User'
                : _profile.displayName,
            userId: _profile.userId,
            avatarAsset: _profile.avatarAsset,
            avatarUrl: _profile.editAvatarUrl,
            avatarUnderReview: _profile.avatarUnderReview,
            isMale: _profile.isMale,
            age: _age,
            zodiac: _zodiac,
            showZodiac: _hasBirthday,
            showGenderAge: _hasGender,
            bio: _signatureText,
            voiceSeconds: _profile.voiceSeconds,
            voiceUrl: _profile.voiceUrl,
            vipIconUrl: _profile.vipIconUrl,
            momentUrls: _momentUrls,
            flavors: _flavors,
            inPartyName: null,
            showMore: false,
            onBack: _popWithResult,
            bottomBar: ProfilePrimaryAction(
              label: 'Edit Profile',
              onTap: _openEditProfile,
            ),
          ),
          if (_showCardEffect && _profile.cardDynamicResource.trim().isNotEmpty)
            PagNetworkOverlay(
              url: _profile.cardDynamicResource,
              onAnimationStart: () {
                PersonalEffectCardCache.markShown(_profile.userId);
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
      ),
    );
  }
}

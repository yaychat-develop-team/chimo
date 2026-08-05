import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/network/network_bootstrap.dart';
import '../../core/utils/zodiac.dart';
import '../me/data/user_dto.dart';
import '../me/models/me_models.dart';
import 'edit_profile_page.dart';
import 'widgets/user_profile_scaffold.dart';

/// Own profile page: same layout as others; bottom bar is Edit Profile.
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

  @override
  void initState() {
    super.initState();
    _profile = widget.profile;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_loadFromApi());
    });
  }

  int get _age {
    final birth = DateTime.tryParse(_profile.birthday);
    if (birth == null) return 0;
    final now = DateTime.now();
    var age = now.year - birth.year;
    if (now.month < birth.month ||
        (now.month == birth.month && now.day < birth.day)) {
      age -= 1;
    }
    return age.clamp(0, 120);
  }

  String get _zodiac =>
      widget.zodiac ?? zodiacFromBirthday(_profile.birthday);

  String get _signatureText {
    if (_profile.signature.trim().isNotEmpty) {
      return _profile.signature;
    }
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

  Future<void> _loadFromApi() async {
    try {
      final infoRes = await NetworkBootstrap.api.userInfo();
      if (!mounted) return;
      final parsed = UserDto.parseProfile(infoRes);
      if (parsed != null) {
        setState(() => _profile = parsed);
      }
    } catch (_) {
      // Keep seed profile from Me page if refresh fails.
    } finally {
      if (mounted) setState(() => _loading = false);
    }
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
            avatarUrl: _profile.avatarUrl,
            isMale: _profile.isMale,
            age: _age,
            zodiac: _zodiac,
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

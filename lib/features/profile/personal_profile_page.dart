import 'package:flutter/material.dart';

import '../me/models/me_models.dart';
import 'edit_profile_page.dart';
import 'widgets/user_profile_scaffold.dart';

/// Own profile page: same layout as others; bottom bar is Edit Profile.
class PersonalProfilePage extends StatefulWidget {
  const PersonalProfilePage({
    super.key,
    required this.profile,
    this.zodiac = 'Capricornus',
  });

  final MeProfile profile;
  final String zodiac;

  @override
  State<PersonalProfilePage> createState() => _PersonalProfilePageState();
}

class _PersonalProfilePageState extends State<PersonalProfilePage> {
  late MeProfile _profile;

  @override
  void initState() {
    super.initState();
    _profile = widget.profile;
  }

  int get _age {
    final birth = DateTime.tryParse(_profile.birthday);
    if (birth == null) return 31;
    final now = DateTime.now();
    var age = now.year - birth.year;
    if (now.month < birth.month ||
        (now.month == birth.month && now.day < birth.day)) {
      age -= 1;
    }
    return age.clamp(1, 120);
  }

  String get _signatureText {
    if (_profile.signature.trim().isNotEmpty) {
      return _profile.signature;
    }
    return _profile.isMale
        ? 'He has not set up his personal signature yet.'
        : 'She has not set up her personal signature yet.';
  }

  List<ProfileFlavorTag> get _flavors {
    if (_profile.tags.isEmpty) return ProfileFlavorTag.defaults;
    return [
      for (final tag in _profile.tags) ProfileFlavorTag(label: tag),
    ];
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
      child: UserProfileScaffold(
        nickname: _profile.displayName,
        userId: _profile.userId,
        avatarAsset: _profile.avatarAsset,
        isMale: _profile.isMale,
        age: _age,
        zodiac: widget.zodiac,
        level: 16,
        bio: _signatureText,
        voiceSeconds: _profile.voiceSeconds,
        flavors: _flavors,
        inPartyName: 'Masquerade Ball',
        showMore: false,
        onBack: _popWithResult,
        bottomBar: ProfilePrimaryAction(
          label: 'Edit Profile',
          onTap: _openEditProfile,
        ),
      ),
    );
  }
}

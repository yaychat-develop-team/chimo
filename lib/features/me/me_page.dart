import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../debug/debug_page.dart';
import '../friends/friends_page.dart';
import '../level/level_page.dart';
import '../profile/edit_profile_page.dart';
import '../profile/personal_profile_page.dart';
import '../wallet/wallet_page.dart';
import 'about_us_page.dart';
import 'bind_email_page.dart';
import 'data/me_mock_data.dart';
import 'help_page.dart';
import 'models/me_models.dart';
import 'settings_page.dart';
import 'widgets/me_action_cards.dart';
import 'widgets/me_profile_header.dart';
import 'widgets/me_quick_access_section.dart';
import 'widgets/me_stats_row.dart';

/// Me page: `mine_bg` background matches screen width.
class MePage extends StatefulWidget {
  const MePage({super.key});

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  MeProfile _profile = MeMockData.profile;

  Future<void> _openPersonalProfile() async {
    final updated = await Navigator.of(context).push<MeProfile>(
      MaterialPageRoute(builder: (_) => PersonalProfilePage(profile: _profile)),
    );
    if (!mounted || updated == null) return;
    setState(() => _profile = updated);
  }

  Future<void> _openEditProfile() async {
    final updated = await Navigator.of(context).push<MeProfile>(
      MaterialPageRoute(builder: (_) => EditProfilePage(profile: _profile)),
    );
    if (!mounted || updated == null) return;
    setState(() => _profile = updated);
  }

  void _openStatPage(MeStatItem item) {
    final tab = switch (item.label) {
      'Friends' => FriendsTab.friends,
      'Fans' => FriendsTab.followers,
      'Follows' => FriendsTab.follow,
      _ => null,
    };
    if (tab == null) return;

    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => FriendsPage(initialTab: tab)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return ColoredBox(
      color: AppColors.background,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AppAssets.mineBg,
              width: screenWidth,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          SafeArea(
            bottom: false,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 80, 16, 24),
              children: [
                MeProfileHeader(
                  profile: _profile,
                  onAvatarTap: _openPersonalProfile,
                  onProfileTap: _openEditProfile,
                ),
                const SizedBox(height: 20),
                MeStatsRow(stats: MeMockData.stats, onStatTap: _openStatPage),
                const SizedBox(height: 16),
                MeActionCards(
                  onWalletTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const WalletPage(),
                      ),
                    );
                  },
                  onLevelTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const LevelPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                MeQuickAccessSection(
                  items: MeMockData.quickAccess,
                  onItemTap: (item) async {
                    if (item.id == 'debug') {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const DebugPage(),
                        ),
                      );
                    } else if (item.id == 'bind_email') {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const BindEmailPage(),
                        ),
                      );
                    } else if (item.id == 'about') {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const AboutUsPage(),
                        ),
                      );
                    } else if (item.id == 'information') {
                      await _openEditProfile();
                    } else if (item.id == 'help') {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const HelpPage(),
                        ),
                      );
                    } else if (item.id == 'settings') {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const SettingsPage(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

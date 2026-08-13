import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/auth/auth_session.dart';
import '../../core/constants/app_assets.dart';
import '../../core/network/app_apis.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_top_loading_bar.dart';
import '../debug/debug_page.dart';
import '../friends/friends_page.dart';
import '../level/level_page.dart';
import '../profile/edit_profile_page.dart';
import '../profile/personal_profile_page.dart';
import '../wallet/wallet_page.dart';
import 'about_us_page.dart';
import 'bind_email_page.dart';
import 'data/me_menu_data.dart';
import 'help_page.dart';
import 'models/me_models.dart';
import 'settings_page.dart';
import 'visits_page.dart';
import 'widgets/me_action_cards.dart';
import 'widgets/me_profile_header.dart';
import 'widgets/me_quick_access_section.dart';
import 'widgets/me_stats_row.dart';

/// Me 页：`mine_bg` 背景与屏幕宽度一致。
class MePage extends StatefulWidget {
  const MePage({super.key});

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  MeProfile _profile = MeProfile.empty;
  bool _loading = true;
  bool _hasBoundEmail = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_loadProfile());
    });
  }

  /// 紧凑社交计数（如 208、1.2K、88K）。
  static String _formatCount(int value) {
    if (value < 1000) return '$value';
    if (value < 10000) {
      final k = value / 1000;
      final text =
          k == k.roundToDouble() ? '${k.toInt()}' : k.toStringAsFixed(1);
      return '${text}K';
    }
    if (value < 1000000) return '${value ~/ 1000}K';
    final m = value / 1000000;
    final text =
        m == m.roundToDouble() ? '${m.toInt()}' : m.toStringAsFixed(1);
    return '${text}M';
  }

  List<MeStatItem> get _stats => [
        MeStatItem(label: 'Friends', value: _formatCount(_profile.friends)),
        MeStatItem(label: 'Follows', value: _formatCount(_profile.follows)),
        MeStatItem(label: 'Fans', value: _formatCount(_profile.fans)),
        MeStatItem(label: 'Visitors', value: _formatCount(_profile.visitors)),
      ];

  /// 邮箱已绑定后隐藏 Bind Email（邮箱登录或绑定流程）。
  List<QuickAccessItem> get _quickAccess {
    if (_hasBoundEmail) {
      return MeMenuData.quickAccess
          .where((item) => item.id != 'bind_email')
          .toList(growable: false);
    }
    return MeMenuData.quickAccess;
  }

  Future<void> _loadProfile() async {
    try {
      final profileFuture = AppApis.user.profileOrNull();
      // Me「Visitors」= Visits 列表中的去重人数（不是 viewNum 总次数）。
      final visitsFuture = AppApis.relation.viewedBy();
      final res = await profileFuture;
      final visitsRes = await visitsFuture;
      if (!mounted) return;
      if (!res.ok || res.data == null) {
        setState(() => _loading = false);
        if (res.isNotLogin) {
          if (!mounted) return;
          context.go(AppRoutes.login);
        }
        return;
      }
      final parsed = res.data!;
      final sessionEmail = (await AuthSession.email())?.trim() ?? '';
      final loginMethod = await AuthSession.loginMethod();
      final email =
          parsed.email.trim().isNotEmpty ? parsed.email.trim() : sessionEmail;
      final hasBoundEmail = email.isNotEmpty || loginMethod == 'email';
      var profile =
          email.isEmpty || email == parsed.email
              ? parsed
              : parsed.copyWith(email: email);
      if (visitsRes.ok && visitsRes.data != null) {
        profile = profile.copyWith(visitors: visitsRes.data!.length);
      }
      setState(() {
        _profile = profile;
        _hasBoundEmail = hasBoundEmail;
        _loading = false;
      });
      await AuthSession.markLoggedIn(
        nickname: profile.displayName,
        avatarUrl: profile.avatarUrl,
        userId: profile.userId,
        email: email.isEmpty ? null : email,
        gender: profile.gender,
      );
      // 应用 token 刷新路径后保持 IM 在线。
      unawaited(NetworkBootstrap.connectImAfterLogin());
    } catch (error) {
      if (!mounted) return;
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load profile: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

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
    if (item.label == 'Visitors') {
      unawaited(() async {
        await Navigator.of(context).push<void>(
          MaterialPageRoute<void>(builder: (_) => const VisitsPage()),
        );
        if (mounted) await _loadProfile();
      }());
      return;
    }
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
      // 对齐 `mine_bg` 底部（#0F0F0F），避免 Quick Access 纯黑。
      color: AppColors.surface,
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
            child: RefreshIndicator(
              color: AppColors.primaryBright,
              onRefresh: _loadProfile,
              // 内容未超出页面高度时不可滑动；超出后才能滚。
              child: ListView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 80, 16, 24),
                children: [
                  if (_loading)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: AppTopLoadingBar(),
                    ),
                  MeProfileHeader(
                    profile: _profile,
                    onAvatarTap: _openPersonalProfile,
                    onProfileTap: _openEditProfile,
                  ),
                  const SizedBox(height: 20),
                  MeStatsRow(stats: _stats, onStatTap: _openStatPage),
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
                          builder: (_) => LevelPage(
                            initialLevel: _profile.vipLevel,
                            initialExperience: _profile.experience,
                            initialMoreExpForNextLevel:
                                _profile.moreExpForNextLevel,
                            initialTotalExperience: _profile.totalExperience,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  MeQuickAccessSection(
                    items: _quickAccess,
                    onItemTap: (item) async {
                      if (item.id == 'debug') {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const DebugPage(),
                          ),
                        );
                      } else if (item.id == 'bind_email') {
                        final bound = await Navigator.of(context).push<bool>(
                          MaterialPageRoute<bool>(
                            builder: (_) => const BindEmailPage(),
                          ),
                        );
                        if (!mounted) return;
                        if (bound == true) {
                          await _loadProfile();
                        }
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
          ),
        ],
      ),
    );
  }
}

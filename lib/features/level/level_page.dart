import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/network/app_apis.dart';
import '../../core/widgets/app_nav_bar.dart';
import '../../core/widgets/app_top_loading_bar.dart';
import '../me/levels_help_page.dart';
import '../me/models/me_models.dart';

/// My Level — mirrors forya `MineLevelPage` / `MineLevelModel`.
class LevelPage extends StatefulWidget {
  const LevelPage({
    super.key,
    this.initialLevel = 0,
    this.initialExperience = 0,
    this.initialMoreExpForNextLevel = 0,
    this.initialTotalExperience = 0,
  });

  final int initialLevel;
  final int initialExperience;
  final int initialMoreExpForNextLevel;
  final int initialTotalExperience;

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  static const _mainColors = [
    Color(0xFF4E566B),
    Color(0xFF1587F2),
    Color(0xFF6A39F5),
    Color(0xFFE97B15),
    Color(0xFFE7425F),
    Color(0xFFAE1817),
  ];

  late MeProfile _profile = MeProfile.empty.copyWith(
    vipLevel: widget.initialLevel,
    experience: widget.initialExperience,
    moreExpForNextLevel: widget.initialMoreExpForNextLevel,
    totalExperience: widget.initialTotalExperience,
  );
  bool _loading = true;

  Color get _mainColor => _mainColors[_profile.levelIndex];

  List<Color> get _progressColors => [
        _mainColor.withValues(alpha: 0.5),
        _mainColor,
      ];

  String get _experienceText {
    if (_profile.isMaxLevel) {
      return 'Current experience point:${_profile.totalExperience}';
    }
    return 'Current experience point:${_profile.displayedExperience}';
  }

  String get _levelUpText {
    if (_profile.isMaxLevel) return '';
    return '${_profile.moreExpForNextLevel} points to level up';
  }

  double get _percent {
    if (_profile.isMaxLevel) return 1;
    final total = _profile.experience;
    if (total <= 0) return 0;
    return math.min(
      1.0,
      1 - _profile.moreExpForNextLevel / total.toDouble(),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_load());
    });
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final res = await AppApis.user.profileOrNull();
      if (!mounted) return;
      final profile = res.data;
      setState(() {
        if (profile != null) _profile = profile;
        _loading = false;
      });
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _openIntroduction(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const LevelsHelpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    final bottom = MediaQuery.paddingOf(context).bottom;
    final levelIndex = _profile.levelIndex;

    return Scaffold(
      backgroundColor: const Color(0xFF0C052A),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AppAssets.levelBg,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: top),
              AppNavBar(
                title: 'My Level',
                titleStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                trailing: IconButton(
                  onPressed: () => _openIntroduction(context),
                  icon: const Icon(
                    Icons.help_outline,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              AppTopLoadingBar(visible: _loading),
              Expanded(
                child: RefreshIndicator(
                  color: const Color(0xFFFFD56A),
                  onRefresh: _load,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(12, 16, 12, 24 + bottom),
                    children: [
                      _CurrentLevelCard(
                        level: _profile.vipLevel,
                        levelIndex: levelIndex,
                        mainColor: _mainColor,
                        progressColors: _progressColors,
                        experienceText: _experienceText,
                        levelUpText: _levelUpText,
                        percent: _percent,
                      ),
                      const SizedBox(height: 24),
                      const _SectionTitle(),
                      const SizedBox(height: 16),
                      const _PrivilegeCard(
                        iconAsset: AppAssets.levelPrivilegeBadge,
                        title: 'Level Badge',
                        activationLabel: 'Activation Level: 1',
                        description:
                            'Your personal homepage display your level badges. The higher your level is, the more splendid the badge becomes.',
                      ),
                      const SizedBox(height: 12),
                      const _PrivilegeCard(
                        iconAsset: AppAssets.levelPrivilegeAssist,
                        title: 'Exclusive Assistance',
                        activationLabel: 'Activation Level: 1',
                        description:
                            'Own exclusive assistance, 1-on-1 problem-solving, priority registration for activities.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CurrentLevelCard extends StatelessWidget {
  const _CurrentLevelCard({
    required this.level,
    required this.levelIndex,
    required this.mainColor,
    required this.progressColors,
    required this.experienceText,
    required this.levelUpText,
    required this.percent,
  });

  final int level;
  final int levelIndex;
  final Color mainColor;
  final List<Color> progressColors;
  final String experienceText;
  final String levelUpText;
  final double percent;

  static const double _startMargin = 17;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 19),
          child: Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.levelCardBg(levelIndex)),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                  decoration: BoxDecoration(
                    color: mainColor.withValues(alpha: 0.2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Current level',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: _startMargin, top: 6),
                  child: Text(
                    'Lv.$level',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: mainColor,
                      fontStyle: FontStyle.italic,
                      height: 1,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: _startMargin),
                  child: Text(
                    experienceText,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: mainColor,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: _startMargin,
                    top: 6,
                    right: _startMargin,
                  ),
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                  ),
                  child: FractionallySizedBox(
                    widthFactor: percent.clamp(0.0, 1.0),
                    heightFactor: 1,
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        gradient: LinearGradient(colors: progressColors),
                      ),
                    ),
                  ),
                ),
                if (levelUpText.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: _startMargin, top: 6),
                    child: Text(
                      levelUpText,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: mainColor,
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            AppAssets.levelBadgeHero(levelIndex),
            width: 142,
            height: 124,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            AppAssets.levelPrivilegeAccent,
            width: 39,
            height: 15,
            fit: BoxFit.contain,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              'Level Privilege',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrivilegeCard extends StatelessWidget {
  const _PrivilegeCard({
    required this.iconAsset,
    required this.title,
    required this.activationLabel,
    required this.description,
  });

  final String iconAsset;
  final String title;
  final String activationLabel;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF272048),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            iconAsset,
            width: 92,
            height: 92,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      width: 100,
                      height: 18,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xFF504970),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        activationLabel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

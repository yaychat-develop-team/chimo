import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../me/levels_help_page.dart';

/// 我的等级：当前等级卡片 + 等级特权列表（按设计稿素材还原）。
class LevelPage extends StatelessWidget {
  const LevelPage({
    super.key,
    this.level = 1,
    this.experience = 2063,
    this.pointsToLevelUp = 1568,
  });

  final int level;
  final int experience;
  final int pointsToLevelUp;

  double get _progress {
    final total = experience + pointsToLevelUp;
    if (total <= 0) return 0;
    return (experience / total).clamp(0.0, 1.0);
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

    return Scaffold(
      backgroundColor: Colors.black,
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
              _LevelAppBar(
                onHelp: () => _openIntroduction(context),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(16, 20, 16, 24 + bottom),
                  children: [
                    _CurrentLevelCard(
                      level: level,
                      experience: experience,
                      pointsToLevelUp: pointsToLevelUp,
                      progress: _progress,
                    ),
                    const SizedBox(height: 28),
                    const _SectionTitle(),
                    const SizedBox(height: 14),
                    const _PrivilegeCard(
                      iconAsset: AppAssets.levelPrivilegeBadge,
                      title: 'Level Badge',
                      unlockLevel: 40,
                      description:
                          'Your personal homepage and room public screen display your level badges. The higher your level is, the more splendid the badge becomes.',
                    ),
                    const SizedBox(height: 12),
                    const _PrivilegeCard(
                      iconAsset: AppAssets.levelPrivilegeAssist,
                      title: 'Exclusive Assistance',
                      unlockLevel: 40,
                      description:
                          'Own exclusive assistance, 1-on-1 problem-solving, priority registration for activities.',
                    ),
                    const SizedBox(height: 12),
                    const _PrivilegeCard(
                      iconAsset: AppAssets.levelPrivilegeCar,
                      title: 'Exclusively Custom-made car',
                      unlockLevel: 40,
                      description:
                          'Own exclusive cars, and you can drive them into the room to show them off.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LevelAppBar extends StatelessWidget {
  const _LevelAppBar({required this.onHelp});

  final VoidCallback onHelp;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: SvgPicture.asset(
                AppAssets.chatBack,
                width: 17,
                height: 7,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const Text(
            'My level',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: onHelp,
              icon: const Icon(
                Icons.help_outline_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrentLevelCard extends StatelessWidget {
  const _CurrentLevelCard({
    required this.level,
    required this.experience,
    required this.pointsToLevelUp,
    required this.progress,
  });

  final int level;
  final int experience;
  final int pointsToLevelUp;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.levelCardBg,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 6,
            top: -28,
            child: Image.asset(
              AppAssets.levelBadgeHero,
              width: 118,
              height: 118,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 120, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB7C8DA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Current level',
                    style: TextStyle(
                      color: Color(0xFF5A6B7A),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'LV.$level',
                  style: const TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    height: 1,
                  ),
                ),
                const Spacer(),
                Text(
                  'Current experience value $experience',
                  style: const TextStyle(
                    color: Color(0xFF4A5A68),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: Colors.white.withValues(alpha: 0.75),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF6FA8D8),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '$pointsToLevelUp to go, 1 level up',
                  style: const TextStyle(
                    color: Color(0xFF4A5A68),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppAssets.levelPrivilegeAccent,
          width: 26,
          height: 26,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 8),
        const Text(
          'Level Privilege',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _PrivilegeCard extends StatelessWidget {
  const _PrivilegeCard({
    required this.iconAsset,
    required this.title,
    required this.unlockLevel,
    required this.description,
  });

  final String iconAsset;
  final String title;
  final int unlockLevel;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1F3D),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF3D2F55)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PrivilegeIcon(asset: iconAsset),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF3A3150),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Unlock level:$unlockLevel',
                  style: const TextStyle(
                    color: Color(0xFFB8AEC8),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFFB8AEC8),
              fontSize: 13,
              height: 1.4,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _PrivilegeIcon extends StatelessWidget {
  const _PrivilegeIcon({required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF8B5CF6).withValues(alpha: 0.55),
                  const Color(0xFF8B5CF6).withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
          Image.asset(
            asset,
            width: 52,
            height: 52,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

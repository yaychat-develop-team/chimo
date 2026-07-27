import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';

/// 我的等级：当前等级卡片 + 等级特权列表。
class LevelPage extends StatelessWidget {
  const LevelPage({
    super.key,
    this.level = 0,
    this.experience = 0,
    this.pointsToLevelUp = 10,
  });

  final int level;
  final int experience;
  final int pointsToLevelUp;

  double get _progress {
    final total = experience + pointsToLevelUp;
    if (total <= 0) return 0;
    return (experience / total).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AppAssets.levelBg,
              width: screenWidth,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _LevelAppBar(
                  onHelp: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Level rules coming soon'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
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
                        activationLevel: 1,
                        description:
                            'Your personal homepage display your level badges. The higher your level is, the more splendid the badge becomes.',
                      ),
                      const SizedBox(height: 12),
                      const _PrivilegeCard(
                        iconAsset: AppAssets.levelPrivilegeAssist,
                        title: 'Exclusive Assistance',
                        activationLevel: 1,
                        description:
                            'Own exclusive assistance, 1-on-1 problem-solving, priority registration for activities.',
                      ),
                    ],
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
              ),
            ),
          ),
          const Text(
            'My Level',
            style: TextStyle(
              color: AppColors.textPrimary,
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
                color: AppColors.textPrimary,
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
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 12, 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE8F4FF),
            Color(0xFFD6E8F8),
            Color(0xFFC5D8EC),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB8C9DA),
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
                    const SizedBox(height: 10),
                    Text(
                      'Lv.$level',
                      style: const TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                AppAssets.levelBadgeHero,
                width: 92,
                height: 92,
                fit: BoxFit.contain,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Current experience point: $experience',
            style: const TextStyle(
              color: Color(0xFF4A5A68),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: Colors.white.withValues(alpha: 0.85),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF7EB6E8),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$pointsToLevelUp points to level up',
            style: const TextStyle(
              color: Color(0xFF4A5A68),
              fontSize: 13,
              fontWeight: FontWeight.w500,
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
          AppAssets.levelPrivilegeBadge,
          width: 22,
          height: 22,
        ),
        const SizedBox(width: 8),
        const Text(
          'Level Privilege',
          style: TextStyle(
            color: AppColors.textPrimary,
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
    required this.activationLevel,
    required this.description,
  });

  final String iconAsset;
  final String title;
  final int activationLevel;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1E),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(iconAsset, width: 48, height: 48),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C30),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Activation Level: $activationLevel',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
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
              color: AppColors.textSecondary,
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

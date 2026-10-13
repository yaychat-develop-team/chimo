import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_scaffold.dart';
import 'logic/level_logic.dart';

/// 我的等级 — 对齐 forya `MineLevelPage` / `MineLevelModel`。
class LevelPage extends StatefulWidget {
  const LevelPage({
    super.key,
    this.level = 0,
    this.experience = 0,
    this.moreExpForNextLevel = 0,
    this.totalExperience = 0,
  });

  /// 四个初始值只作首帧预填（深链没带参数也能进来），
  /// [LevelLogic.onReady] 会再拉一次盖掉。
  final int level;
  final int experience;
  final int moreExpForNextLevel;
  final int totalExperience;

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  late final LevelLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(
      LevelLogic(
        initialLevel: widget.level,
        initialExperience: widget.experience,
        initialMoreExpForNextLevel: widget.moreExpForNextLevel,
        initialTotalExperience: widget.totalExperience,
      ),
    );
  }

  @override
  void dispose() {
    if (Get.isRegistered<LevelLogic>()) Get.delete<LevelLogic>();
    super.dispose();
  }

  static const _mainColors = [
    AppColors.levelTier1,
    AppColors.levelTier2,
    AppColors.levelTier3,
    AppColors.levelTier4,
    AppColors.levelTier5,
    AppColors.levelTier6,
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ChimoScaffold(
        title: 'My Level',
        backgroundColor: AppColors.levelBackground,
        loading: logic.loading.value,
        titleStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        trailing: IconButton(
          onPressed: AppJumper.toLevelsHelp,
          icon: const Icon(Icons.help_outline, color: Colors.white, size: 24),
        ),
        backdrop: AppImage(
          AppAssets.levelBg,
          width: MediaQuery.sizeOf(context).width,
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
        body: RefreshIndicator(
          color: AppColors.warningAmberSoft,
          onRefresh: logic.load,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(12, 16, 12, 24),
            children: [
              // 卡片这一块跟着 profile 重建；下面的特权卡是常量，别一起包。
              Obx(() {
                final profile = logic.profile.value;
                final mainColor = _mainColors[logic.levelIndex];
                return _CurrentLevelCard(
                  level: profile.vipLevel,
                  levelIndex: logic.levelIndex,
                  mainColor: mainColor,
                  progressColors: [mainColor.withValues(alpha: 0.5), mainColor],
                  experienceText: logic.experienceText,
                  levelUpText: logic.levelUpText,
                  percent: logic.percent,
                );
              }),
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
              image: AppImage.decorationImage(AppAssets.levelCardBg(levelIndex), fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                  decoration: BoxDecoration(
                    color: mainColor.withValues(alpha: 0.2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Current level',
                    style: TextStyle(color: mainColor, fontSize: 10, fontWeight: FontWeight.w500),
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
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: mainColor),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: _startMargin, top: 6, right: _startMargin),
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
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: mainColor),
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
          child: AppImage(
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
          AppImage(AppAssets.levelPrivilegeAccent, width: 39, height: 15, fit: BoxFit.contain),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              'Level Privilege',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
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
        color: AppColors.levelPanel,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImage(iconAsset, width: 92, height: 92, fit: BoxFit.contain),
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
                        color: AppColors.levelPanelLight,
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

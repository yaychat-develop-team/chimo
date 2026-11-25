import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/gift_wall.pb.dart';
import '../../../../common/models/server_client/user_realtion.pb.dart';
import '../../../../common/theme/app_colors.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 资料页神秘卡入口。对齐 joyride `_revealCardWidget` + 设计图。
class ProfileRevealCardBanner extends StatelessWidget {
  const ProfileRevealCardBanner({
    super.key,
    required this.isMale,
    required this.onReveal,
  });

  final bool isMale;
  final VoidCallback onReveal;

  @override
  Widget build(BuildContext context) {
    final who = isMale ? 'His' : 'Her';
    final whom = isMale ? 'him' : 'her';
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 8.w, end: 16.w, bottom: 8.w),
      child: GestureDetector(
        onTap: onReveal,
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          height: 60.w,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              PositionedDirectional(
                start: 0,
                end: 0,
                top: 12.w,
                child: Container(
                  height: 48.w,
                  decoration: BoxDecoration(
                    gradient: AppColors.revealCardBanner,
                    borderRadius: BorderRadius.circular(12.w),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 84.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$who Reveal Card',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                              ),
                            ),
                            Text(
                              'Your match value with $whom is 99%',
                              style: TextStyle(
                                color: AppColors.white70,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 59.w,
                        height: 22.w,
                        alignment: Alignment.center,
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          color: AppColors.white,
                        ),
                        child: Text(
                          'Reveal',
                          style: TextStyle(
                            color: AppColors.pinkFF42D9,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 9.w),
                    ],
                  ),
                ),
              ),
              PositionedDirectional(
                start: 0,
                top: 0,
                child: Chimo.image(
                  AppAssets.revealCardItem,
                  height: 60.w,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 在房条：贴头像右侧重叠展示。自己 / 他人主页都显示。
class ProfilePartyBanner extends StatelessWidget {
  const ProfilePartyBanner({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 30.w,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.rgba(0, 254, 168, 0.2), AppColors.rgba(0, 248, 117, 0.2)],
          ),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.rgba(0, 248, 117, 0.5), width: 0.5),
        ),
        child: Row(
          children: [
            SizedBox(width: 36.w),
            Chimo.image(
              AppAssets.roomFloatWave,
              width: 12.w,
              fit: BoxFit.fitWidth,
              color: AppColors.green00F875,
              colorBlendMode: BlendMode.srcIn,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                title.isEmpty ? 'In Party' : 'In Party: $title',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.green00F875,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 14.w,
              width: 14.w,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.green00F875,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_forward_ios, size: 10.w, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

/// 设计图 Relationship 横滑区。无本地关系素材时用渐变描边卡片。
class ProfileRelationshipSection extends StatelessWidget {
  const ProfileRelationshipSection({super.key, required this.relations, this.onHeaderTap});

  final List<Relation> relations;
  final VoidCallback? onHeaderTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 8),
            child: Row(
              children: [
                const Text(
                  'Relationship',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 21 / 14,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onHeaderTap,
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${relations.length}',
                        style: const TextStyle(
                          color: AppColors.gray9A9A9A,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Chimo.image(
                        AppAssets.roomArrowRight,
                        width: 6,
                        height: 12,
                        color: AppColors.gray9A9A9A,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (relations.isEmpty)
            const Padding(
              padding: EdgeInsets.only(right: 16, top: 8, bottom: 4),
              child: Text(
                'No relationship yet',
                style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 12),
              ),
            )
          else
            SizedBox(
              height: 118,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(right: 16),
                itemCount: relations.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return _RelationCard(relation: relations[index]);
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _RelationCard extends StatelessWidget {
  const _RelationCard({required this.relation});

  final Relation relation;

  static List<Color> _gradientFor(int type) {
    switch (type) {
      case 0:
        return const [Color(0xFFFB375A), Color(0xFFFF8590)];
      case 1:
        return const [Color(0xFFFF9701), Color(0xFFFACB56)];
      case 2:
        return const [Color(0xFF0158F5), Color(0xFF82A9FA)];
      case 3:
        return const [Color(0xFFFA2A77), Color(0xFFFC98B8)];
      case 4:
        return const [Color(0xFF0DB7C0), Color(0xFF0BF2F9)];
      case 5:
        return const [Color(0xFF00C760), Color(0xFF51E596)];
      case 6:
        return const [Color(0xFFF46E00), Color(0xFFFBA553)];
      case 7:
        return const [Color(0xFFFB375A), Color(0xFFFF8590)];
      case 8:
        return const [Color(0xFF9934FF), Color(0xFFC59DFA)];
      case 9:
        return const [Color(0xFFFB59BB), Color(0xFFFB8CD7)];
      default:
        return const [Color(0xFFFB375A), Color(0xFFFF8590)];
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = _gradientFor(relation.type);
    final avatar = relation.hasToUser() ? relation.toUser.avatar.trim() : '';
    final label = relation.name.trim().isEmpty ? 'Relation' : relation.name.trim();
    final showLevel = relation.type != 0 && relation.level > 0;

    return SizedBox(
      width: 88,
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colors,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.black111111),
              padding: const EdgeInsets.all(2),
              child: ClipOval(
                child: Chimo.image(
                  avatar.isEmpty ? null : avatar,
                  fallbackAsset: AppAssets.avatarPlace,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colors.first,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
          ),
          if (showLevel) ...[
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(colors: colors),
              ),
              child: Text(
                'Lv.${relation.level}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// 设计图 Gift Wall 横条。对齐资料卡 `_GiftWallCard`。
class ProfileGiftWallBanner extends StatelessWidget {
  const ProfileGiftWallBanner({super.key, required this.wall, required this.onTap});

  final GiftWallListRsp wall;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final level = wall.hasLevelInfo() ? wall.levelInfo : null;
    final unlocked = level?.receiveGift.toInt() ?? 0;
    final total = level?.totalGift.toInt() ?? 0;
    final icons = wall.itemList
        .map((item) => item.icon.trim())
        .where((icon) => icon.isNotEmpty)
        .take(4)
        .toList();

    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 16),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 64,
          padding: const EdgeInsets.fromLTRB(16, 0, 12, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AppColors.purpleA510FF, AppColors.blue0056FF],
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gift Wall',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Unlocked: $unlocked/$total',
                      style: TextStyle(
                        color: AppColors.white.withValues(alpha: 0.85),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              if (icons.isNotEmpty) ...[
                ...List.generate(icons.length, (i) {
                  return Padding(
                    padding: EdgeInsets.only(left: i == 0 ? 0 : 6),
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.black30,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Chimo.image(icons[i], width: 32, height: 32, fit: BoxFit.contain),
                    ),
                  );
                }),
                const SizedBox(width: 6),
              ],
              Chimo.image(AppAssets.roomArrowRight, width: 6, height: 12, color: AppColors.white),
            ],
          ),
        ),
      ),
    );
  }
}

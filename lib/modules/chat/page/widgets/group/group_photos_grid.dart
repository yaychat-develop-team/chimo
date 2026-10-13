import 'package:flutter/material.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/group/group.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/widgets/app_image.dart';

/// 群相册：按 `periodName` 分段的 4 列网格；未加入时是一把锁 + 引导加群。
class GroupPhotosGrid extends StatelessWidget {
  const GroupPhotosGrid({
    super.key,
    required this.isJoined,
    required this.sections,
    required this.onPhotoTap,
  });

  final bool isJoined;
  final List<GroupPhoto> sections;
  final ValueChanged<int> onPhotoTap;

  @override
  Widget build(BuildContext context) {
    if (!isJoined) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppImage(AppAssets.groupUnjoinedLock, width: 140, height: 140, fit: BoxFit.contain),
              const SizedBox(height: 20),
              const Text(
                'Want to see everything?\nJoin the group!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  height: 1.45,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (sections.isEmpty) {
      return const Center(
        child: Text(
          'No photos yet',
          style: TextStyle(color: AppColors.textGrayAE, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      );
    }

    // 对齐 forya ChatGroupPhotosPage：periodName 标题 + 4 列网格。
    var globalIndex = 0;
    final slivers = <Widget>[];
    for (final section in sections) {
      final label = section.periodName.trim();
      if (label.isNotEmpty) {
        slivers.add(
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 12),
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.textGrayBC,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        slivers.add(const SliverToBoxAdapter(child: SizedBox(height: 12)));
      }

      final startIndex = globalIndex;
      final count = section.photoList.length;
      globalIndex += count;
      slivers.add(
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final flatIndex = startIndex + index;
              return GestureDetector(
                onTap: () => onPhotoTap(flatIndex),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  // 「是不是 http 开头」判断 `AppImage` 自己就会做
                  // （`AppImage.classify`），剩下的只有这几个参数。
                  child: AppImage(
                    section.photoList[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    memWidth: 1080,
                    error: const ColoredBox(color: AppColors.surfaceField),
                  ),
                ),
              );
            }, childCount: count),
          ),
        ),
      );
    }
    slivers.add(const SliverToBoxAdapter(child: SizedBox(height: 20)));

    return CustomScrollView(slivers: slivers);
  }
}

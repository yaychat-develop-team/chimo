import 'package:flutter/material.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/group/group.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import 'package:chimo/common/utils/chimo.dart';

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
              Chimo.image(
                AppAssets.groupUnjoinedLock,
                width: 140,
                height: 140,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const Text(
                'Want to see everything?\nJoin the group!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.gray9A9A9A,
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
          style: TextStyle(color: AppColors.grayB0B0B0, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      );
    }

    final slivers = sections.indexed.expand((entry) {
      final (index, section) = entry;
      final label = section.periodName.trim();
      final startIndex = sections
          .take(index)
          .fold<int>(0, (sum, item) => sum + item.photoList.length);
      final count = section.photoList.length;
      return [
        if (label.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 12),
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.grayC8C8C8,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                ),
              ),
            ),
          )
        else
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            delegate: SliverChildBuilderDelegate((context, gridIndex) {
              final flatIndex = startIndex + gridIndex;
              return GestureDetector(
                onTap: () => onPhotoTap(flatIndex),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Chimo.image(
                    section.photoList[gridIndex],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    memWidth: 1080,
                    error: const ColoredBox(color: AppColors.black2A2A2A),
                  ),
                ),
              );
            }, childCount: count),
          ),
        ),
      ];
    }).toList()..add(const SliverToBoxAdapter(child: SizedBox(height: 20)));

    return CustomScrollView(slivers: slivers);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../model/room_format.dart';
import '../../service/room_service.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 房间顶栏。名称条、在线数、缩小，以及下方公告 / 热度 / 更多房间，都是同一套半透明胶囊。
///
/// 头像 / 人数 / 热度等会随 socket 变，这里自己 [Obx]，不依赖外层快照传值。
class RoomTopBar extends StatelessWidget {
  const RoomTopBar({
    super.key,
    required this.roomId,
    required this.onSave,
    required this.onBulletin,
    required this.onMoreRooms,
    required this.onRank,
    required this.onAudience,
    required this.onScale,
  });

  final int roomId;
  final VoidCallback onSave;
  final VoidCallback onBulletin;
  final VoidCallback onMoreRooms;

  /// giftRank 头像 → Top Givers。
  final VoidCallback onRank;

  /// 在线人数 → Room Members。
  final VoidCallback onAudience;
  final VoidCallback onScale;

  static const double _chip = 22;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
      child: Obx(() {
        final service = RoomService.findOrNull();
        final title = service?.title.value ?? '';
        final cover = service?.cover.value ?? '';
        final saved = service?.saved.value ?? false;
        final online = service?.online.value ?? 0;
        final hot = service?.hot.value ?? 0;
        // 读 length 保证 RxList 变更被订阅；再拷一份给 UI。
        final avatarCount = service?.audience.length ?? 0;
        final avatars = avatarCount == 0
            ? const <String>[]
            : List<String>.from(service!.audience);
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _roomChip(title: title, cover: cover, saved: saved),
                ),
                const SizedBox(width: 8),
                _faces(avatars),
                const SizedBox(width: 6),
                _count(online),
                const SizedBox(width: 6),
                _scale(),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _pill(
                  onTap: onBulletin,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Chimo.image(
                        AppAssets.roomBulletin,
                        width: 14,
                        height: 14,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Room Bulletin',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _pill(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Chimo.image(AppAssets.roomFire, width: 14, height: 14),
                      const SizedBox(width: 4),
                      Text(
                        roomCount(hot),
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                _pill(
                  onTap: onMoreRooms,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'More Rooms',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 6),
                      Chimo.image(
                        AppAssets.roomArrowRight,
                        width: 6,
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  Widget _roomChip({
    required String title,
    required String cover,
    required bool saved,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 封面、间距、内边距和 Save 占掉的宽度，剩下的才给标题。
        final titleMax = (constraints.maxWidth - 138).clamp(
          48.0,
          constraints.maxWidth,
        );
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 42.w,
            padding: const EdgeInsets.fromLTRB(4, 4, 6, 4),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _cover(cover),
                const SizedBox(width: 8),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: titleMax),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.1,
                        ),
                      ),
                      Text(
                        'ID: $roomId',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.white60,
                          fontSize: 11,
                          height: 1.15,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!saved) ...[const SizedBox(width: 8), _save()],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _cover(String cover) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: cover.trim().isEmpty
          ? const ColoredBox(
              color: AppColors.white18,
              child: SizedBox(width: 36, height: 36),
            )
          : Chimo.image(cover, width: 36, height: 36, fit: BoxFit.cover),
    );
  }

  Widget _save() {
    return GestureDetector(
      onTap: onSave,
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.green29EEAA,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Text(
          'Save',
          style: TextStyle(
            color: AppColors.black1F2518,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _faces(List<String> avatars) {
    final faces = avatars
        .where((item) => item.trim().isNotEmpty)
        .take(3)
        .toList();
    if (faces.isEmpty) return const SizedBox.shrink();
    // 对齐设计稿：头像 24，约 20% 层叠；王冠挂在圈右上。
    const size = 24.0;
    const step = 19.0;
    const crown = 11.0;
    return GestureDetector(
      onTap: onRank,
      child: SizedBox(
        width: size + step * (faces.length - 1) + 2,
        height: size + 2,
        child: Stack(
          clipBehavior: Clip.none,
          children: faces.indexed.toList().reversed.map((entry) {
            final i = entry.$1;
            return Positioned(
              left: i * step,
              bottom: 0,
              child: SizedBox(
                width: size + 2,
                height: size + 2,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: _kingColor(i), width: 1.5),
                        ),
                        child: ClipOval(
                          child: Chimo.image(
                            faces[i],
                            width: size,
                            height: size,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: -1,
                      child: Chimo.image(
                        AppAssets.roomKing,
                        width: crown,
                        height: crown,
                        color: _kingColor(i),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  /// giftRank 1/2/3：金 / 青 / 铜，对齐 Cosmic Lounge 设计稿。
  Color _kingColor(int rank) {
    switch (rank) {
      case 0:
        return AppColors.yellowFFC83D;
      case 1:
        return AppColors.cyan67D6F6;
      default:
        return AppColors.orangeDC9260;
    }
  }

  Widget _count(int online) {
    return _pill(
      onTap: onAudience,
      child: Text(
        '$online',
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _scale() {
    return GestureDetector(
      onTap: onScale,
      child: SizedBox(
        width: 30.w,
        height: 30.w,
        child: Container(
          width: _chip.w,
          height: _chip.w,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.black30,
            shape: BoxShape.circle,
          ),
          child: Chimo.image(AppAssets.roomScale, width: 16, height: 16),
        ),
      ),
    );
  }

  Widget _pill({VoidCallback? onTap, required Widget child}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: _chip.w,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.black30,
          borderRadius: BorderRadius.circular(_chip / 2),
        ),
        child: child,
      ),
    );
  }
}

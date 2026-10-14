import 'package:flutter/material.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';
import '../../model/room_format.dart';

/// 房间顶栏。名称条、在线数、缩小，以及下方公告 / 热度 / 更多房间，都是同一套半透明胶囊。
class RoomTopBar extends StatelessWidget {
  const RoomTopBar({
    super.key,
    required this.title,
    required this.roomId,
    required this.cover,
    required this.saved,
    required this.online,
    required this.hot,
    required this.avatars,
    required this.onSave,
    required this.onBulletin,
    required this.onMoreRooms,
    required this.onAudience,
    required this.onScale,
  });

  final String title;
  final int roomId;
  final String cover;
  final bool saved;
  final int online;
  final int hot;
  final List<String> avatars;
  final VoidCallback onSave;
  final VoidCallback onBulletin;
  final VoidCallback onMoreRooms;
  final VoidCallback onAudience;
  final VoidCallback onScale;

  static const double _chip = 32;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _roomChip()),
              const SizedBox(width: 8),
              _faces(),
              const SizedBox(width: 6),
              _count(),
              const SizedBox(width: 6),
              _scale(),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _pill(
                onTap: onBulletin,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppImage(AppAssets.roomBulletin, width: 14, height: 14),
                    SizedBox(width: 4),
                    Text(
                      'Room Bulletin',
                      style: TextStyle(color: AppColors.textPrimary, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              _pill(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AppImage(AppAssets.roomFire, width: 14, height: 14),
                    const SizedBox(width: 4),
                    Text(
                      roomCount(hot),
                      style: const TextStyle(
                        color: AppColors.textPrimary,
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
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'More Rooms',
                      style: TextStyle(color: AppColors.textPrimary, fontSize: 12),
                    ),
                    SizedBox(width: 2),
                    AppImage(AppAssets.roomArrowRight, width: 8, height: 12),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _roomChip() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 封面、间距、内边距和 Save 占掉的宽度，剩下的才给标题。
        final titleMax = (constraints.maxWidth - 138).clamp(48.0, constraints.maxWidth);
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 44,
            padding: const EdgeInsets.fromLTRB(4, 4, 6, 4),
            decoration: BoxDecoration(
              color: AppColors.roomChip,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _cover(),
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
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 1.1,
                        ),
                      ),
                      Text(
                        'ID: $roomId',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: AppColors.roomId, fontSize: 11, height: 1.15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _save(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _cover() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: cover.trim().isEmpty
          ? const ColoredBox(color: AppColors.roomEmptySeat, child: SizedBox(width: 36, height: 36))
          : AppImage(cover, width: 36, height: 36, fit: BoxFit.cover),
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
          color: saved ? AppColors.roomGlass : AppColors.roomSave,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          saved ? 'Saved' : 'Save',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _faces() {
    final faces = avatars.where((item) => item.trim().isNotEmpty).take(3).toList();
    if (faces.isEmpty) return const SizedBox.shrink();
    const size = 28.0;
    const step = 18.0;
    return GestureDetector(
      onTap: onAudience,
      child: SizedBox(
        width: size + step * (faces.length - 1),
        height: size,
        child: Stack(
          children: [
            for (var i = 0; i < faces.length; i++)
              Positioned(
                left: i * step,
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.textPrimary, width: 1.5),
                  ),
                  child: ClipOval(
                    child: AppImage(faces[i], width: size, height: size, fit: BoxFit.cover),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _count() {
    return _pill(
      onTap: onAudience,
      child: Text(
        '$online',
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _scale() {
    return GestureDetector(
      onTap: onScale,
      child: Container(
        width: _chip,
        height: _chip,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: AppColors.roomChip, shape: BoxShape.circle),
        child: const AppImage(AppAssets.roomScale, width: 16, height: 16),
      ),
    );
  }

  Widget _pill({VoidCallback? onTap, required Widget child}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: _chip,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.roomChip,
          borderRadius: BorderRadius.circular(_chip / 2),
        ),
        child: child,
      ),
    );
  }
}

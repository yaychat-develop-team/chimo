import 'package:flutter/material.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/home_page/home_page_main.pb.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';

class HomeRoomCard extends StatelessWidget {
  const HomeRoomCard({super.key, required this.room, required this.onTap});

  final HomeRoomItem room;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cover = room.icon.isNotEmpty ? room.icon : room.cardBackgroundUrl;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: AppImage.decorationImage(AppAssets.homeRoomBg, fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 64,
                    height: 64,
                    child: cover.isEmpty
                        ? const ColoredBox(color: AppColors.surfaceField)
                        : AppImage(cover, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        room.name.isEmpty ? 'Room' : room.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        [
                          if (room.label.isNotEmpty) room.label,
                          if (room.roomOwnerName.isNotEmpty) room.roomOwnerName,
                          if (room.hot > 0) '${room.hot}',
                        ].join(' · '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

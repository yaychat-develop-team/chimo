import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/theme/app_colors.dart';
import '../../service/room_service.dart';

/// 最小化后的浮窗。点主体回到房间，点关闭则退房。
class RoomFloat extends StatelessWidget {
  const RoomFloat({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<RoomService>()) return const SizedBox.shrink();
    final service = Get.find<RoomService>();
    return Positioned(
      left: 16,
      bottom: 96,
      child: Obx(() {
        return Material(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(22),
          child: InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: () => AppJumper.toRoom(service.rid),
            child: Padding(
              padding: const EdgeInsets.only(left: 14, right: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 160),
                    child: Text(
                      service.title.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
                    ),
                  ),
                  IconButton(
                    onPressed: service.leave,
                    icon: const Icon(Icons.close_rounded, color: AppColors.textPrimary, size: 18),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

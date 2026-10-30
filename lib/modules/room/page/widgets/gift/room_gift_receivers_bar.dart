import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/widgets/app_image.dart';
import '../../../model/room_gift_receiver.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 房间礼物面板顶部 To 多选（对齐 joyride showUserList）。
class RoomGiftReceiversBar extends StatelessWidget {
  const RoomGiftReceiversBar({
    super.key,
    required this.receivers,
    required this.selectedUids,
    required this.allSelected,
    required this.onToggleUser,
    required this.onToggleAll,
  });

  final List<RoomGiftReceiver> receivers;
  final Set<String> selectedUids;
  final bool allSelected;
  final ValueChanged<String> onToggleUser;
  final VoidCallback onToggleAll;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
        child: Row(
          children: [
            const Text(
              'To',
              style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: receivers.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final user = receivers[index];
                    final selected = selectedUids.contains(user.uid);
                    return GestureDetector(
                      onTap: () => onToggleUser(user.uid),
                      child: SizedBox(
                        width: 36,
                        height: 36,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selected ? AppColors.green29EEAA : Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              child: AppImage.avatar(user.avatar, size: 33),
                            ),
                            if (selected)
                              Positioned(
                                right: -1,
                                bottom: -1,
                                child: Chimo.image(
                                  AppAssets.roomGiftSelected,
                                  width: 14,
                                  height: 14,
                                  fit: BoxFit.contain,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onToggleAll,
              child: Container(
                height: 28.w,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.white12,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Text(
                  allSelected ? 'Cancel' : 'All',
                  style: TextStyle(
                    color: AppColors.white.withValues(alpha: 0.85),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

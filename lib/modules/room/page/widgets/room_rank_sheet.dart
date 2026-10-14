import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';
import '../../logic/room_effect_logic.dart';
import '../../model/room_fx.dart';

class RoomRankSheet extends StatelessWidget {
  const RoomRankSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.rankSheet,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const RoomRankSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.5;
    return SizedBox(
      height: height,
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'Rank',
            style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Expanded(child: _list()),
        ],
      ),
    );
  }

  Widget _list() {
    if (!Get.isRegistered<RoomEffectLogic>()) {
      return const Center(child: Text('No ranking yet', style: TextStyle(color: AppColors.textSecondary)));
    }
    final logic = Get.find<RoomEffectLogic>();
    return Obx(() {
      final ranks = logic.ranks;
      if (ranks.isEmpty) {
        return const Center(child: Text('No ranking yet', style: TextStyle(color: AppColors.textSecondary)));
      }
      return ListView.builder(
        itemCount: ranks.length,
        itemBuilder: (context, index) => _row(index, ranks[index]),
      );
    });
  }

  Widget _row(int index, RoomRankUser user) {
    final top = index < 3;
    return SizedBox(
      height: 72,
      child: Row(
        children: [
          SizedBox(
            width: 47,
            child: Text(
              '${index + 1}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: top ? AppColors.giftGold : AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ClipOval(
            child: user.avatar.isEmpty
                ? const ColoredBox(color: AppColors.surfaceField, child: SizedBox(width: 42, height: 42))
                : AppImage(user.avatar, width: 42, height: 42, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              user.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text('${user.value}', style: const TextStyle(color: AppColors.textPreview, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}

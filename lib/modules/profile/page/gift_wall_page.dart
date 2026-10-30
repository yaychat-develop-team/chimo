import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/theme/app_colors.dart';
import 'package:chimo/common/utils/chimo.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/gift_wall_logic.dart';

/// 礼物墙详情。数据对齐 joyride `GiftWallPage` + `/gift-wall/detail`。
class GiftWallPage extends StatefulWidget {
  const GiftWallPage({super.key, required this.targetId});

  final int targetId;

  @override
  State<GiftWallPage> createState() => _GiftWallPageState();
}

class _GiftWallPageState extends State<GiftWallPage> {
  late final GiftWallLogic logic;

  @override
  void initState() {
    super.initState();
    logic = GiftWallLogic.put(widget.targetId);
  }

  @override
  void dispose() {
    GiftWallLogic.delete(widget.targetId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppNavBar(title: 'Gift Wall'),
      backgroundColor: AppColors.purple14081F,
      body: Obx(() {
        if (logic.loading.value && logic.detail.value == null) {
          return const Center(child: CircularProgressIndicator(color: AppColors.green29EEAA));
        }
        if (logic.error.value.isNotEmpty && logic.detail.value == null) {
          return Center(
            child: GestureDetector(
              onTap: logic.load,
              child: Text(logic.error.value, style: const TextStyle(color: AppColors.white60)),
            ),
          );
        }
        final data = logic.detail.value;
        final level = logic.currentLevel;
        final unlocked = level?.receiveGift.toInt() ?? 0;
        final total = level?.totalGift.toInt() ?? 0;
        final items = data?.itemList ?? const [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    logic.targetUser.value?.nickname.trim().isNotEmpty == true
                        ? logic.targetUser.value!.nickname
                        : 'Gift Wall',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Unlocked: $unlocked/$total',
                    style: const TextStyle(
                      color: AppColors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: items.isEmpty
                  ? const Center(
                      child: Text('No gifts yet', style: TextStyle(color: AppColors.white60)),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.78,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.black30,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            children: [
                              Expanded(child: Chimo.image(item.icon, fit: BoxFit.contain)),
                              const SizedBox(height: 6),
                              Text(
                                item.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '×${item.receiveCount}',
                                style: const TextStyle(color: AppColors.white60, fontSize: 10),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/cash.pb.dart';
import '../../../../../common/models/server_client/commodity.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 普通礼物 4 列网格。
class RoomGiftCashGrid extends StatelessWidget {
  const RoomGiftCashGrid({
    super.key,
    required this.gifts,
    required this.selected,
    required this.onSelect,
  });

  final List<ItemInfo> gifts;
  final int selected;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    if (gifts.isEmpty) {
      return const Center(
        child: Text(
          'No gifts available',
          style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 14),
        ),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      itemCount: gifts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 0,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (context, index) {
        final gift = gifts[index];
        final on = index == selected;
        return GestureDetector(
          onTap: () => onSelect(index),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: on ? AppColors.green29EEAA : Colors.transparent,
                width: 1.5,
              ),
              color: on ? AppColors.black2A2A2A.withValues(alpha: 0.55) : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chimo.image(
                  gift.icon,
                  width: 56.w,
                  height: 56.w,
                  fit: BoxFit.contain,
                  error: const Text('🎁', style: TextStyle(fontSize: 28)),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    gift.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Chimo.image(AppAssets.coin, width: 12, height: 12),
                    const SizedBox(width: 3),
                    Text(
                      '${gift.price}',
                      style: const TextStyle(
                        color: AppColors.gray9A9A9A,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// 互动礼物横滑列表（对齐 Oumi GiftHorizontalPanel）。
class RoomGiftInteractiveList extends StatelessWidget {
  const RoomGiftInteractiveList({
    super.key,
    required this.gifts,
    required this.selected,
    required this.onSelect,
  });

  final List<ItemInfo> gifts;
  final int selected;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    if (gifts.isEmpty) {
      return const Center(
        child: Text(
          'No gifts available',
          style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 14),
        ),
      );
    }
    const iconSize = 72.0;
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 182,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: gifts.length,
          separatorBuilder: (_, _) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            final gift = gifts[index];
            final on = index == selected;
            return GestureDetector(
              onTap: () => onSelect(index),
              child: Container(
                width: 115,
                height: 182,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: on ? AppColors.green29EEAA : Colors.white24, width: 1),
                  color: on ? AppColors.black2A2A2A.withValues(alpha: 0.55) : null,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    SizedBox(
                      width: iconSize,
                      height: iconSize,
                      child: Chimo.image(
                        gift.icon,
                        width: iconSize,
                        height: iconSize,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        error: const SizedBox(
                          width: iconSize,
                          height: iconSize,
                          child: Center(child: Text('🎁', style: TextStyle(fontSize: 32))),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      gift.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.white, fontSize: 15),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          gift.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.gray9A9A9A,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${gift.price} Coin/Person',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: AppColors.white, fontSize: 11),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// 背包礼物网格。
class RoomGiftBagGrid extends StatelessWidget {
  const RoomGiftBagGrid({
    super.key,
    required this.items,
    required this.selected,
    required this.onSelect,
    required this.onRetry,
    this.loading = false,
  });

  final List<CommodityItem> items;
  final int selected;
  final ValueChanged<int> onSelect;
  final VoidCallback onRetry;
  final bool loading;

  static String validityLabel(CommodityItem item) {
    final days = item.validityPeriod;
    if (days <= 0) return 'Permanent';
    return '${days}d';
  }

  @override
  Widget build(BuildContext context) {
    if (loading && items.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.green29EEAA, strokeWidth: 2.4),
      );
    }
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Package is empty',
              style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 14),
            ),
            TextButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 8,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        final on = index == selected;
        return GestureDetector(
          onTap: () => onSelect(index),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: on ? AppColors.green29EEAA : Colors.transparent,
                width: 1.5,
              ),
              color: on ? AppColors.black2A2A2A.withValues(alpha: 0.55) : null,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Chimo.image(
                        item.url,
                        width: 52,
                        height: 52,
                        fit: BoxFit.contain,
                        error: const Text('🎁', style: TextStyle(fontSize: 28)),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (item.type != CommodityType.GIFT) ...[
                        const SizedBox(height: 2),
                        Text(
                          validityLabel(item),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.gray9A9A9A,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (item.num > 1)
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 16),
                      height: 16,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: AppColors.green29EEAA,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Text(
                        '${item.num}',
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

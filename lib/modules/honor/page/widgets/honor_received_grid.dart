import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';

import '../../../../common/models/server_client/honor.pb.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_pull_refresh.dart';
import '../../logic/honor_display.dart';

/// Received：三列徽章网格
class HonorReceivedGrid extends StatelessWidget {
  const HonorReceivedGrid({super.key, required this.items, required this.onRefresh, this.onTap});

  final List<HonorItem> items;
  final Future<void> Function() onRefresh;
  final ValueChanged<HonorItem>? onTap;

  @override
  Widget build(BuildContext context) {
    return AppPullRefresh.grid(
      onRefresh: onRefresh,
      accentColor: AppColors.green00FEA8,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 8,
        childAspectRatio: 0.76,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        final valid = HonorDisplay.isValid(item);
        return ReceivedHonorItem(
          item: item,
          grayed: !valid,
          onTap: onTap == null ? null : () => onTap!(item),
        );
      },
    );
  }
}

class ReceivedHonorItem extends StatelessWidget {
  const ReceivedHonorItem({super.key, required this.item, required this.grayed, this.onTap});

  final HonorItem item;
  final bool grayed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final image = item.image.trim().isNotEmpty ? item.image : item.icon;
    Widget icon = Chimo.image(
      image,
      width: 92,
      height: 92,
      fit: BoxFit.cover,
      fadeIn: Duration.zero,
      gaplessPlayback: true,
    );
    if (grayed) {
      icon = ColorFiltered(
        colorFilter: const ColorFilter.matrix(<double>[
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
          0.2126,
          0.7152,
          0.0722,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
        ]),
        child: Opacity(opacity: 0.55, child: icon),
      );
    }
    icon = Hero(
      tag: HonorDisplay.heroTag(item),
      child: Material(type: MaterialType.transparency, child: icon),
    );

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Center(child: icon),
                  if (item.wear)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: const BoxDecoration(
                          color: AppColors.green00FEA8,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Equipped',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            height: 1.15,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text(
              item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              HonorDisplay.receivedStatus(item),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.gray9A9A9A,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../common/theme/app_colors.dart';
import 'room_barrage_host.dart';
import 'package:chimo/common/utils/chimo.dart';

class RoomBarrageCardBody extends StatelessWidget {
  const RoomBarrageCardBody({super.key, required this.host});

  final RoomBarrageHost host;

  @override
  Widget build(BuildContext context) {
    final card = host.message.card;
    if (card == null) return const SizedBox.shrink();
    return GestureDetector(
      onTap: () => host.openLink(card.link),
      child: SizedBox(
        height: 70,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            gradient: AppColors.roomCardBanner,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                if (card.cover.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Chimo.image(card.cover, width: 56, height: 56, fit: BoxFit.cover),
                  ),
                if (card.cover.isNotEmpty) const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: AppColors.white, fontSize: 12),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        card.content,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: AppColors.white, fontSize: 10),
                      ),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          if (card.label.isNotEmpty)
                            Container(
                              height: 14,
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: AppColors.white),
                              ),
                              child: Text(
                                card.label,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 8,
                                  height: 1,
                                ),
                              ),
                            ),
                          if (card.label.isNotEmpty) const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              '${card.count} people',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: AppColors.white, fontSize: 10),
                            ),
                          ),
                        ],
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

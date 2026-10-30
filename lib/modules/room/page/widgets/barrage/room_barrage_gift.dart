import 'package:flutter/material.dart';

import '../../../../../common/theme/app_colors.dart';
import '../../../model/room_message.dart';
import 'room_barrage_host.dart';
import 'package:chimo/common/utils/chimo.dart';

class RoomBarrageGiftBody extends StatelessWidget {
  const RoomBarrageGiftBody({super.key, required this.host});

  final RoomBarrageHost host;

  RoomMessage get message => host.message;

  @override
  Widget build(BuildContext context) {
    final bubble = host.bubble(
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Send ', style: TextStyle(color: AppColors.white, fontSize: 12)),
                    Flexible(
                      child: GestureDetector(
                        onTap: host.openGiftTo,
                        behavior: HitTestBehavior.opaque,
                        child: Text(
                          message.giftTo,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.yellowFFD400,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  message.giftName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: AppColors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          if (message.giftIcon.trim().isNotEmpty)
            Chimo.image(message.giftIcon, width: 42, height: 42, fit: BoxFit.contain),
        ],
      ),
    );
    final boxed = message.boxIcon.trim().isEmpty
        ? bubble
        : Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(padding: const EdgeInsetsDirectional.only(bottom: 6, end: 8), child: bubble),
              PositionedDirectional(
                bottom: 0,
                end: 0,
                child: Chimo.image(message.boxIcon, width: 24, height: 24, fit: BoxFit.contain),
              ),
            ],
          );
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(child: boxed),
        const SizedBox(width: 5),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            '×',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 10,
              height: 1,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 1),
        Text(
          '${message.giftCount}',
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}

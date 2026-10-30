import 'package:flutter/material.dart';

import '../../../../../common/theme/app_colors.dart';
import '../../../model/room_message.dart';
import 'room_barrage_host.dart';

/// 对齐 yaychat `_buildJoinStyle`：整卡可点（头像 / 昵称同开资料卡）。
class RoomBarrageJoinBody extends StatelessWidget {
  const RoomBarrageJoinBody({super.key, required this.host});

  final RoomBarrageHost host;

  RoomMessage get message => host.message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: host.openSender,
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: 220,
          height: 44,
          padding: const EdgeInsetsDirectional.only(start: 4, top: 4, bottom: 4),
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            gradient: AppColors.roomJoinBanner,
          ),
          child: Row(
            children: [
              host.face(message.avatar, 36),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: message.sender,
                            style: const TextStyle(color: AppColors.green29EEAA),
                          ),
                          const TextSpan(text: ' is here!'),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Text(
                      "Who's gonna greet first~",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

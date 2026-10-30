import 'package:flutter/material.dart';

import '../../../../../common/theme/app_colors.dart';
import 'room_barrage_host.dart';
import 'package:chimo/common/utils/chimo.dart';

class RoomBarragePetBody extends StatelessWidget {
  const RoomBarragePetBody({super.key, required this.host});

  final RoomBarrageHost host;

  @override
  Widget build(BuildContext context) {
    final pet = host.message.pet;
    if (pet == null) return const SizedBox.shrink();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Chimo.image(pet.icon, width: 30, height: 30, fit: BoxFit.contain),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 120),
                    child: Text(
                      pet.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: AppColors.white70, fontSize: 11),
                    ),
                  ),
                  const SizedBox(width: 6),
                  UnconstrainedBox(
                    child: GestureDetector(
                      onTap: () => host.openProfile(uid: pet.ownerUid, name: pet.tag),
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        height: 16,
                        constraints: const BoxConstraints(maxWidth: 120),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          color: AppColors.yellow29FDF652,
                        ),
                        child: Text(
                          pet.tag,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: AppColors.green29EEAA, fontSize: 11),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Container(
                constraints: const BoxConstraints(maxWidth: 213),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.black30,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(12),
                    bottomStart: Radius.circular(12),
                    bottomEnd: Radius.circular(12),
                  ),
                ),
                child: Text(
                  pet.text,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../common/theme/app_colors.dart';
import 'room_barrage_host.dart';

class RoomBarrageQaBody extends StatelessWidget {
  const RoomBarrageQaBody({super.key, required this.host});

  final RoomBarrageHost host;

  @override
  Widget build(BuildContext context) {
    final qa = host.message.qa;
    if (qa == null) return const SizedBox.shrink();
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white8,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(12),
          bottomStart: Radius.circular(12),
          bottomEnd: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(qa.question, style: const TextStyle(color: AppColors.white, fontSize: 12)),
          ),
          const SizedBox(height: 6),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 0.5,
            color: AppColors.white20,
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(color: AppColors.white, fontSize: 12),
                children: [
                  const TextSpan(text: 'I choose '),
                  TextSpan(
                    text: qa.answer,
                    style: const TextStyle(color: AppColors.green29EEAA),
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

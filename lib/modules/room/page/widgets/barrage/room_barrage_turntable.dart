import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/theme/app_colors.dart';
import 'room_barrage_host.dart';

/// Lucky Spin 公屏卡片。对齐 joyride `ROOM_TURNTABLE_CHAT`。
class RoomBarrageTurntableBody extends StatelessWidget {
  const RoomBarrageTurntableBody({super.key, required this.host});

  final RoomBarrageHost host;

  @override
  Widget build(BuildContext context) {
    final message = host.message;
    final body = message.turntable;
    if (body == null) return const SizedBox.shrink();
    final title = body.title;
    return Container(
      width: 260.w,
      padding: EdgeInsetsDirectional.only(start: 10.w, top: 10.w, bottom: 10.w, end: 10.w),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x5CEF72E6)),
        color: const Color(0x33B818AC),
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              host.avatar(onTap: host.openSender),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            message.sender,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.5, color: const Color(0x4DEF72E6)),
                            color: const Color(0x33F926FD),
                            borderRadius: BorderRadius.circular(3.w),
                          ),
                          child: Text(
                            'Lucky Spin',
                            style: TextStyle(
                              color: const Color(0xFFEF72E6),
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          const TextSpan(text: 'Landed on: '),
                          TextSpan(
                            text: title,
                            style: TextStyle(
                              color: const Color(0xFFFDD301),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 4.w),
          Text(
            body.desc,
            style: TextStyle(
              color: AppColors.white.withValues(alpha: 0.8),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

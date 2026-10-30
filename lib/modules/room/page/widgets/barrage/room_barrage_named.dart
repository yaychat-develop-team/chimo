import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../model/room_message.dart';
import 'room_barrage_host.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 对齐 Oumi [NamedRoomBanner] 公屏样式。
class RoomBarrageNamedBody extends StatelessWidget {
  const RoomBarrageNamedBody({super.key, required this.host});

  final RoomBarrageHost host;

  RoomMessage get message => host.message;

  @override
  Widget build(BuildContext context) {
    const bannerW = 255.0;
    const bannerH = 24.0;
    const crownW = 16.0;
    const avatarSize = 30.0;
    const avatarContent = 28.0;
    const textStart = 33.7;
    const textEnd = 17.0;
    const textGap = 9.3;
    const shadows = [Shadow(color: AppColors.black35, blurRadius: 2, offset: Offset(0, 1))];
    return SizedBox(
      width: bannerW.w,
      height: bannerH.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            top: 0,
            width: bannerW.w,
            height: bannerH.w,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AppAssets.roomNamedBg), fit: BoxFit.fill),
              ),
            ),
          ),
          Positioned(
            left: -crownW.w / 2,
            top: -crownW.w / 2,
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: Chimo.image(AppAssets.roomNamedCrown, width: crownW.w, fit: BoxFit.contain),
            ),
          ),
          PositionedDirectional(
            start: 0,
            top: -(avatarSize - bannerH) / 2 * 1.w,
            child: GestureDetector(
              onTap: host.openSender,
              child: Container(
                width: avatarSize.w,
                height: avatarSize.w,
                padding: EdgeInsets.all(1.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.yellowD9CE7C, width: 1.w),
                ),
                child: ClipOval(child: host.face(message.avatar, avatarContent.w)),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: textStart.w, end: textEnd.w),
              child: Row(
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => AppColors.roomNamedTitle.createShader(bounds),
                    child: Text(
                      message.text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        shadows: shadows,
                      ),
                    ),
                  ),
                  SizedBox(width: textGap.w),
                  // 对齐 yaychat NamedRoomBanner：仅头像可点，昵称不可点。
                  Flexible(
                    child: Text(
                      message.sender,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.yellowFFFC52,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        shadows: shadows,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

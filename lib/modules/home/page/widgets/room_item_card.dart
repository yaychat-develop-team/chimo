import 'dart:math';
import 'dart:ui';

import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/home_page/home_page_main.pb.dart';
import '../../../../common/theme/app_colors.dart';

/// 房间卡片：背景、房名、房主、标签，以及在房头像。
class RoomItemCard extends StatelessWidget {
  const RoomItemCard({super.key, required this.room, required this.onTap});

  final HomeRoomItem room;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final story = room.hasStoryInfo();
    final hasRoomBg = room.cardBackgroundUrl.isNotEmpty;
    final roomBg = story
        ? room.storyInfo.indexCover
        : hasRoomBg
        ? room.cardBackgroundUrl
        : AppAssets.homeRoomBg;
    final title = story ? room.storyInfo.name : room.name;
    final owner = room.roomOwnerName.length > 15
        ? room.roomOwnerName.substring(0, 15)
        : room.roomOwnerName;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: hasRoomBg ? 153.w : 150.w,
        margin: EdgeInsets.only(
          bottom: 12.w,
          left: hasRoomBg ? 13.w : 16.w,
          right: hasRoomBg ? 13.w : 16.w,
        ),
        padding: EdgeInsetsDirectional.only(
          start: hasRoomBg ? 23.w : 20.w,
          top: hasRoomBg ? 15.w : 12.w,
          end: hasRoomBg ? 23.w : 20.w,
          bottom: 16.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          image: Chimo.decorationImage(
            roomBg.isEmpty ? AppAssets.homeRoomBg : roomBg,
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Chimo.image(AppAssets.roomFloatWave, width: 14, height: 14),
                SizedBox(width: 5.w),
                Expanded(
                  child: Text(
                    title.isEmpty ? 'Room' : title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (owner.isNotEmpty) ...[
                  SizedBox(width: 5.w),
                  Text(
                    owner,
                    maxLines: 1,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                if (room.roomOwnerAvatar.isNotEmpty) ...[
                  SizedBox(width: 4.w),
                  Chimo.image(
                    room.roomOwnerAvatar,
                    width: 20,
                    height: 20,
                    circle: true,
                    borderColor: AppColors.white,
                  ),
                ],
              ],
            ),
            if (story)
              Text(
                room.storyInfo.introduction,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (room.label.isNotEmpty)
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 3.w),
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 10.w,
                        vertical: 1.w,
                      ),
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        color: AppColors.green1FC0F600,
                      ),
                      child: Text(
                        room.label,
                        style: const TextStyle(
                          color: AppColors.greenC7EF4C,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  if (room.crownUid.toInt() != 0 &&
                      room.crownName.isNotEmpty) ...[
                    SizedBox(width: 4.w),
                    Flexible(
                      child: Container(
                        margin: EdgeInsetsDirectional.only(top: 3.w),
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 8.w,
                          vertical: 1.w,
                        ),
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          color: AppColors.white20,
                        ),
                        child: Text(
                          'Room Naming · ${room.crownName}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            const Spacer(),
            if (room.userList.isNotEmpty)
              Align(
                alignment: AlignmentDirectional.center,
                child: _userList(room.userList),
              ),
          ],
        ),
      ),
    );
  }

  Widget _userList(List<HomeRoomItemUserList> users) {
    final count = users.length;
    final shown = min(count, 6);
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.w),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: ColoredBox(
          color: AppColors.white20,
          child: SizedBox(
            height: 60.w,
            width: 34.w * shown + 26.w,
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: List.generate(shown, (i) {
                return PositionedDirectional(
                  start: 8.w + 34.w * i,
                  child: i == 5 && count > 6
                      ? Container(
                          width: 44.w,
                          height: 44.w,
                          alignment: Alignment.center,
                          decoration: const ShapeDecoration(
                            shape: StadiumBorder(),
                            color: AppColors.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '$count+',
                                style: const TextStyle(
                                  color: AppColors.black111111,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Text(
                                'In Room',
                                style: TextStyle(
                                  color: AppColors.black50,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Chimo.image(
                          users[i].icon,
                          width: 42,
                          height: 42,
                          circle: true,
                          borderColor: AppColors.white,
                        ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

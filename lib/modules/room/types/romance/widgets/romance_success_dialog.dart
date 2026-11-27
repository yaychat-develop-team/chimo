import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../app/network/services/romance_api.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/couple.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../app/storage/app_storage.dart';
import '../../../../../common/widgets/app_image.dart';
import '../../../../chat/logic/chats_list_logic.dart';

/// 21 日解锁成功弹窗。对齐 joyride `RomanceSuccessDialog`。
abstract final class RomanceSuccessDialog {
  static Future<void> show(CoupleInfo info) {
    final key = StorageKeys.romanceActivitySuccessHasShow('${info.uid1}_${info.uid2}');
    if (AppStorage.getBool(AppStorage.cache, key)) return Future.value();
    AppStorage.setBool(AppStorage.cache, key, true);

    final em = info.emUid2.trim();
    if (em.isNotEmpty && Get.isRegistered<ConversationListLogic>()) {
      final chats = Get.find<ConversationListLogic>();
      var id = 'dm_$em';
      for (final c in chats.conversations) {
        if (c.emUserName == em || c.id.endsWith(em)) {
          id = c.id;
          break;
        }
      }
      if (!chats.pinnedIds.contains(id)) {
        chats.togglePin(id);
      }
    }

    return Get.dialog<void>(RomanceSuccessDialogBody(info: info), barrierColor: AppColors.black60);
  }
}

class RomanceSuccessDialogBody extends StatelessWidget {
  const RomanceSuccessDialogBody({super.key, required this.info});

  final CoupleInfo info;

  void _openMission() {
    Get.back();
    final aid = info.activityId.toString();
    if (aid.isEmpty || aid == '0') return;
    AppJumper.toWeb(url: RomanceApi.intimacyMissionUrl(aid), title: '21-Day Romance');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 82.w),
                Container(
                  width: 300.w,
                  height: 362.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.w),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.pinkFFCBF7, AppColors.white],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 62.w),
                      SizedBox(
                        width: 268.w,
                        height: 88.w,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              width: 268.w,
                              height: 88.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(44.w),
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [AppColors.pinkFFA0EF, AppColors.pinkFFE6F8],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20.w,
                              child: Image.asset(
                                AppAssets.romanceRelationBg2,
                                width: 161.w,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Positioned(
                              top: 14.w,
                              left: 73.w,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.white),
                                ),
                                child: AppImage.avatar(info.avatar1, size: 60.w),
                              ),
                            ),
                            Positioned(
                              top: 14.w,
                              right: 72.w,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.white),
                                ),
                                child: AppImage.avatar(info.avatar2, size: 60.w),
                              ),
                            ),
                            Positioned(
                              top: 30.w,
                              child: Image.asset(
                                AppAssets.romanceHeart,
                                width: 33.w,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.w),
                      Text(
                        'Congratulations! 21-Day\nRomance Achieved!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFFF007E),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 6.w),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          'Complete intimacy tasks to earn exclusive rewards and deepen your bond!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFFF007E),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: _openMission,
                        child: Container(
                          width: 240.w,
                          height: 48.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF007E),
                            borderRadius: BorderRadius.circular(24.w),
                          ),
                          child: Text(
                            'Go to View Tasks',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.w),
                    ],
                  ),
                ),
                SizedBox(height: 20.w),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.cancel, color: AppColors.white70, size: 28.w),
                ),
              ],
            ),
            Image.asset(AppAssets.romanceTitleBg, width: 257.w, fit: BoxFit.fitWidth),
          ],
        ),
      ),
    );
  }
}

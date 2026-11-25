import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/rtc.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/chimo.dart';
import '../logic/heart_link_logic.dart';

/// Host Outlookers：进房用户气泡浮层。对齐产品脑图「Outlookers」+ joyride `HtRoomUserList`。
abstract final class HeartLinkOutlookers {
  static Future<void> show() async {
    if (!Get.isRegistered<HeartLinkLogic>()) return;
    final ht = Get.find<HeartLinkLogic>();
    if (!ht.isHost) return;
    await ht.refreshUserList();
    await Get.bottomSheet(
      const _OutlookersBody(),
      isScrollControlled: true,
      backgroundColor: AppColors.black1C1C1E,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }
}

class _OutlookersBody extends StatelessWidget {
  const _OutlookersBody();

  @override
  Widget build(BuildContext context) {
    final ht = Get.find<HeartLinkLogic>();
    final height = MediaQuery.sizeOf(context).height * 0.55;
    return SizedBox(
      height: height,
      child: Obx(() {
        final users = ht.outlookerUsers;
        return Column(
          children: [
            const SizedBox(height: 10),
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.white20,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 14, 16, 8),
              child: Row(
                children: [
                  Text(
                    'Outlookers',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: users.isEmpty
                  ? const Center(
                      child: Text(
                        'No guests yet',
                        style: TextStyle(color: AppColors.white50, fontSize: 13),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.72,
                      ),
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return _Bubble(
                          user: users[index],
                          number: index + 1,
                          onTap: () async {
                            final u = users[index];
                            final uid = u.id.toInt();
                            ht.dismissOutlooker(uid);
                            Get.back();
                            await AppJumper.showUserProfileSheet(
                              uid: '$uid',
                              name: u.nickname,
                              avatar: u.avatar,
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        );
      }),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    required this.user,
    required this.number,
    required this.onTap,
  });

  final SimpleChannelUser user;
  final int number;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.pinkFC5CC6, width: 1.5),
                ),
                child: ClipOval(
                  child: Chimo.image(
                    user.avatar,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                    fallbackAsset: AppAssets.avatarPlace,
                  ),
                ),
              ),
              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: AppColors.redFD4B4B,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$number',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            user.nickname,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.white70, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

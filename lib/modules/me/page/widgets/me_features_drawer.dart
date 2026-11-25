import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/chimo.dart';
import '../../model/me_menu_data.dart';

/// 个人中心 More Features 左侧抽屉。
class MeFeaturesDrawer extends StatelessWidget {
  const MeFeaturesDrawer({super.key, required this.onItemTap});

  final ValueChanged<QuickAccessItem> onItemTap;

  static Future<void> show({required ValueChanged<QuickAccessItem> onItemTap}) {
    return Get.generalDialog<void>(
      barrierLabel: 'More Features',
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 280),
      pageBuilder: (_, _, _) => MeFeaturesDrawer(onItemTap: onItemTap),
      transitionBuilder: (context, animation, _, child) {
        final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(curved),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 0.84;
    final items = MeMenuData.features;
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(onTap: Get.back, behavior: HitTestBehavior.opaque),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: width,
              height: double.infinity,
              color: AppColors.black111DE5,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _header(),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 8.w, bottom: 16.w),
                        itemCount: items.length,
                        itemBuilder: (context, index) => _row(items[index]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 8.w, 12.w, 8.w),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'More Features',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
            ),
          ),
          GestureDetector(
            onTap: Get.back,
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              width: 36.w,
              height: 36.w,
              child: Icon(Icons.close, color: AppColors.white, size: 22.w),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(QuickAccessItem item) {
    return GestureDetector(
      onTap: () => onItemTap(item),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.w),
        child: Row(
          children: [
            item.id == 'reveal_card'
                ? Icon(Icons.lock_outline_rounded, color: AppColors.white, size: 22.w)
                : Chimo.image(item.iconAsset, width: 22.w, height: 22.w, fit: BoxFit.contain),
            SizedBox(width: 14.w),
            Expanded(
              child: Text(
                item.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: AppColors.white60, size: 22.w),
          ],
        ),
      ),
    );
  }
}

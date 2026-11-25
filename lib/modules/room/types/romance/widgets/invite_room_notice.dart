import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../app/chimo_api.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/mass.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/app_toast.dart';
import '../../../../../common/widgets/app_global_notice.dart';

/// GS 侧派单房邀请浮层。对齐 joyride `InviteRoomNotice`。
abstract final class RomanceInviteRoomNotice {
  static Future<void> show(InviteInfo info) {
    return AppGlobalNotice.show(
      widget: _InviteCard(info: info),
      level: AppGlobalNotice.romanceInviteLevel,
      durationSeconds: 30,
      dismissOnBarrier: false,
    );
  }
}

class _InviteCard extends StatelessWidget {
  const _InviteCard({required this.info});

  final InviteInfo info;

  Future<void> _handle(int result) async {
    final res = await ChimoApis.romance.handleDispatch(dispatchId: info.dispatchId, result: result);
    if (!res.ok) {
      AppToast.info(res.message.isEmpty ? 'Request failed' : res.message);
      return;
    }
    AppGlobalNotice.dismiss();
    if (result == 1) {
      final rid = info.roomId.toInt();
      if (rid > 0) await AppJumper.toRoom(rid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 149.w,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.romanceNoticeBg), fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 24.w,
            child: Center(
              child: Text(
                'Assignment Room',
                style: TextStyle(
                  color: AppColors.pinkFF5BA8,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.w),
          Text(
            'New users are in the room!',
            style: TextStyle(color: AppColors.white, fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 3.w),
          Text(
            'Come say hi and show your vibe.',
            style: TextStyle(
              color: AppColors.white70,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 16.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ActionBtn(label: 'Reject', filled: false, onTap: () => _handle(0)),
              SizedBox(width: 16.w),
              _ActionBtn(label: 'Join Now', filled: true, onTap: () => _handle(1)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  const _ActionBtn({required this.label, required this.filled, required this.onTap});

  final String label;
  final bool filled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 139.w,
        height: 36.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: filled ? AppColors.white : AppColors.white10,
          borderRadius: BorderRadius.circular(18.w),
          border: filled ? null : Border.all(color: AppColors.white),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: filled ? AppColors.pinkFF5BA8 : AppColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

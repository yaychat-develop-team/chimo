import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/extensions/wire_view.dart';
import '../../../../common/models/server_client/rtc.pb.dart';
import '../../../../common/models/server_client/user.pb.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../../common/utils/chimo.dart';
import '../../../../common/widgets/app_blur_backdrop.dart';
import '../../service/room_service.dart';

/// 抱上麦选位。UI 对齐 Cosmic Lounge 设计图；逻辑对齐 joyride `MicSelectPage`。
class MicSelectSheet extends StatefulWidget {
  const MicSelectSheet({super.key, required this.profile});

  final User profile;

  static Future<void> show({required User profile}) {
    return AppBottomSheet.show<void>(
      isScrollControlled: true,
      child: MicSelectSheet(profile: profile),
    );
  }

  @override
  State<MicSelectSheet> createState() => _MicSelectSheetState();
}

class _MicSelectSheetState extends State<MicSelectSheet> {
  /// 默认选表演者，对齐设计图选中态。
  QueueType _type = QueueType.CAR_OWNER_QUEUE;
  var _busy = false;

  RoomService? get _room => RoomService.findOrNull();

  User get _profile => widget.profile;

  Future<void> _confirm() async {
    final room = _room;
    if (room == null || _busy) return;
    setState(() => _busy = true);
    final failure = await room.grantTypeOnMic(uid: _profile.id.toInt(), type: _type);
    if (mounted) setState(() => _busy = false);
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppJumper.back();
    AppToast.info('Done');
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    return AppBlurBackdrop(
      blur: 28,
      color: AppColors.black111DE5.withValues(alpha: 0.92),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 16.w + bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 28.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'Mic Queue',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: GestureDetector(
                      onTap: AppJumper.back,
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: EdgeInsets.all(4.w),
                        child: Icon(Icons.close, size: 22.w, color: AppColors.white70),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.w),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  _AvatarWithGender(profile: _profile),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _profile.nickname,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 4.w),
                        Text(
                          'ID: ${_profile.uid}',
                          style: TextStyle(
                            color: AppColors.gray9A9A9A,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.w),
            Text(
              'Assign Mic Type',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
            SizedBox(height: 12.w),
            Row(
              children: [
                Expanded(
                  child: _TypeCard(
                    label: 'Performers',
                    selected: _type == QueueType.CAR_OWNER_QUEUE,
                    avatar: _profile.avatar,
                    onTap: () => setState(() => _type = QueueType.CAR_OWNER_QUEUE),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _TypeCard(
                    label: 'Audience',
                    selected: _type == QueueType.COMMON_QUEUE,
                    avatar: _profile.avatar,
                    onTap: () => setState(() => _type = QueueType.COMMON_QUEUE),
                  ),
                ),
              ],
            ),
            SizedBox(height: 28.w),
            GestureDetector(
              onTap: _busy ? null : _confirm,
              child: Opacity(
                opacity: _busy ? 0.55 : 1,
                child: Container(
                  height: 48.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      color: AppColors.black1C1C1E,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarWithGender extends StatelessWidget {
  const _AvatarWithGender({required this.profile});

  final User profile;

  @override
  Widget build(BuildContext context) {
    final size = 48.w;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(
            child: Chimo.image(
              profile.avatar,
              fallbackAsset: AppAssets.avatarPlace,
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
          ),
          if (profile.genderKnown)
            Positioned(
              right: -1.w,
              bottom: -1.w,
              child: Container(
                width: 16.w,
                height: 16.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: profile.male ? AppColors.blue4F8BFF : AppColors.pinkFF5BA8,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.black1C1C1E, width: 1.5),
                ),
                child: Chimo.image(
                  profile.male ? AppAssets.genderMan : AppAssets.genderWoman,
                  width: 9.w,
                  height: 9.w,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _TypeCard extends StatelessWidget {
  const _TypeCard({
    required this.label,
    required this.selected,
    required this.avatar,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final String avatar;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 108.w,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: selected ? AppColors.green00F875 : AppColors.white.withValues(alpha: 0.08),
            width: 0.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selected)
              Chimo.image(
                avatar,
                fallbackAsset: AppAssets.avatarPlace,
                width: 48.w,
                height: 48.w,
                fit: BoxFit.cover,
                circle: true,
              )
            else
              Chimo.image(AppAssets.roomSeatEmpty, width: 48.w, height: 48.w),
            SizedBox(height: 10.w),
            Text(
              label,
              style: TextStyle(
                color: selected ? AppColors.green00F875 : AppColors.white70,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

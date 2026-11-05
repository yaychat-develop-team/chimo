import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/rtc.pb.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/chimo.dart';
import '../../../../common/widgets/app_blur_backdrop.dart';
import '../../logic/room_rank_logic.dart';

/// 抱上麦选空位。对齐 joyride `MicSelectPage` 非拍卖态（麦位网格选位）。
Future<int?> showMicSeatPickSheet({
  required SimpleChannelUser user,
  required List<int> emptyPositions,
}) {
  if (emptyPositions.isEmpty) return Future.value(null);
  if (emptyPositions.length == 1) return Future.value(emptyPositions.first);
  return Get.bottomSheet<int>(
    _MicSeatPickSheet(user: user, empties: emptyPositions),
    isScrollControlled: true,
  );
}

class _MicSeatPickSheet extends StatefulWidget {
  const _MicSeatPickSheet({required this.user, required this.empties});

  final SimpleChannelUser user;
  final List<int> empties;

  @override
  State<_MicSeatPickSheet> createState() => _MicSeatPickSheetState();
}

class _MicSeatPickSheetState extends State<_MicSeatPickSheet> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.empties.first;
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    // final maxH = MediaQuery.sizeOf(context).height * 0.55;
    final name = widget.user.nickname.trim();
    final avatar = widget.user.avatar.trim();
    final uid = widget.user.id.toInt();
    final male = RoomRankLogic.isMale(widget.user);

    return AppBlurBackdrop(
      blur: 28,
      color: AppColors.black111DE5.withValues(alpha: 0.92),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: Container(
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
                      'Assign Mic',
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
                    _Avatar(url: avatar, male: male),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name.isEmpty ? 'User' : name,
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
                            'ID: $uid',
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
              SizedBox(height: 16.w),
              Text(
                'Select empty seat',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 12.w),
              Flexible(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.empties.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 12.w,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: 0.78,
                  ),
                  itemBuilder: (context, index) {
                    final pos = widget.empties[index];
                    final selected = pos == _selected;
                    return GestureDetector(
                      onTap: () => setState(() => _selected = pos),
                      behavior: HitTestBehavior.opaque,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 56.w,
                            height: 56.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selected
                                    ? AppColors.green29EEAA
                                    : AppColors.white.withValues(alpha: 0.12),
                                width: selected ? 2 : 1,
                              ),
                              color: AppColors.white.withValues(alpha: 0.06),
                            ),
                            child: selected
                                ? ClipOval(
                                    child: Chimo.image(
                                      avatar,
                                      fallbackAsset: AppAssets.avatarPlace,
                                      width: 52.w,
                                      height: 52.w,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Chimo.image(AppAssets.roomSeatEmpty),
                          ),
                          SizedBox(height: 6.w),
                          Text(
                            pos == 0 ? 'Host' : 'Mic $pos',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: selected
                                  ? AppColors.green29EEAA
                                  : AppColors.white.withValues(alpha: 0.7),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.1,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.w),
              GestureDetector(
                onTap: () => AppJumper.back(result: _selected),
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
            ],
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.url, required this.male});

  final String url;
  final bool male;

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
              url,
              fallbackAsset: AppAssets.avatarPlace,
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: -1.w,
            bottom: -1.w,
            child: Chimo.image(
              male ? AppAssets.roomMale : AppAssets.roomFemale,
              width: 14.w,
              height: 14.w,
            ),
          ),
        ],
      ),
    );
  }
}

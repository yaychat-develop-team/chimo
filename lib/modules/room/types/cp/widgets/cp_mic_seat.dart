import 'package:chimo/common/widgets/app_blur_backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../../../common/widgets/app_image.dart';
import '../../../logic/mic_logic.dart';
import '../../../logic/room_logic.dart';
import '../../../model/mic_seat.dart';
import '../../../model/room_format.dart';
import '../../../page/widgets/room_mic_grid.dart';
import '../logic/cp_logic.dart';
import 'cp_util.dart';

/// CP 麦位。对照 Cosmic Lounge 设计图 + joyride `CPMicSeatItemWidget`。
///
/// 编号在昵称左侧（不在头像顶部）；空位毛玻璃；有人时展示贡献值粉条。
class CpMicSeat extends StatelessWidget {
  const CpMicSeat({
    super.key,
    required this.seat,
    required this.position,
    this.size = 52,
    this.borderColor,
    this.showName = true,
    this.nickWidth,
    this.anchor,
    this.emoteUrl = '',
    this.showHot = true,
    this.isHost = false,
  });

  final MicSeat seat;
  final int position;
  final double size;
  final Color? borderColor;
  final bool showName;
  final double? nickWidth;

  /// 飞麦锚点；为空时按 [MicLogic.anchorFor] 自动挂。
  final GlobalKey? anchor;
  final String emoteUrl;

  /// 昵称下方贡献粉条。对齐设计图 occupied 态。
  final bool showHot;

  /// 主持麦：无编号，昵称下显示 Host。
  final bool isHost;

  Color get _posColor => CpUtil.colorOf(position);

  Color get _border => borderColor ?? _posColor;

  GlobalKey? get _anchor {
    if (anchor != null) return anchor;
    if (Get.isRegistered<MicLogic>()) {
      return Get.find<MicLogic>().anchorFor(seat);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final avatar = size.w;
    // 外层宽度 = 头像宽，保证 Positioned(left) 左右对称（对齐 oumi）。
    return GestureDetector(
      onTap: () {
        // 空麦：自由上麦直上；关闭自由上麦则打开申请排麦。
        if (!seat.occupied) {
          if (Get.isRegistered<RoomLogic>()) {
            Get.find<RoomLogic>().toggleMic(position: position);
          } else if (Get.isRegistered<CpLogic>()) {
            Get.find<CpLogic>().joinMic(position: position);
          }
          return;
        }
        AppJumper.showUserProfileSheet(
          uid: '${seat.uid ?? 0}',
          name: seat.name,
          avatar: seat.avatar,
        );
      },
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: avatar,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(key: _anchor, width: avatar, height: avatar, child: _face(avatar)),
            if (showName) ...[SizedBox(height: 6.w), _nameRow(avatar)],
            if (showHot && seat.occupied) ...[
              SizedBox(height: 5.w),
              _hotPill(),
            ] else if (showHot)
              SizedBox(height: 16.w),
          ],
        ),
      ),
    );
  }

  Widget _face(double avatar) {
    final frame = seat.frame.trim();
    final emote = emoteUrl.trim();
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        if (seat.occupied && seat.speaking) RoomSeatWave(size: avatar),
        Container(
          width: avatar,
          height: avatar,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: _border, width: 1.2.w),
            // color: AppColors.white10,
          ),
          child: seat.occupied
              ? ClipOval(child: AppImage.avatar(seat.avatar, size: avatar))
              : AppBlurBackdrop(
                  color: AppColors.white.withValues(alpha: 0.12),
                  blur: 12,
                  borderRadius: BorderRadius.circular(avatar),
                  child: Center(
                    child: Chimo.image(AppAssets.roomSeatEmpty, color: AppColors.white70),
                  ),
                ),
        ),
        if (seat.occupied && frame.isNotEmpty)
          IgnorePointer(
            child: OverflowBox(
              minWidth: avatar,
              minHeight: avatar,
              maxWidth: avatar * 1.7,
              maxHeight: avatar * 1.7,
              child: Chimo.image(
                frame,
                width: avatar * 1.35,
                height: avatar * 1.35,
                fit: BoxFit.cover,
              ),
            ),
          ),
        if (seat.occupied && emote.isNotEmpty)
          IgnorePointer(
            child: Chimo.image(
              emote,
              width: avatar * 1.3,
              height: avatar * 1.3,
              fit: BoxFit.contain,
            ),
          ),
        if (seat.occupied && !seat.micOpen)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 14.w,
              height: 14.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.black.withValues(alpha: 0.35),
              ),
              child: Chimo.image(
                AppAssets.roomMicOff,
                width: 12.w,
                height: 12.w,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }

  /// 设计图：编号在昵称左侧（头像下方），不在头像顶角。
  Widget _nameRow(double maxWidth) {
    final name = seat.occupied ? seat.name : 'Waiting';
    return SizedBox(
      width: maxWidth,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 设计图仅 1–6 嘉宾位展示编号；主持 / 右侧位不展示。
          if (!isHost && position >= 1 && position <= 6) ...[
            Container(
              width: 10.w,
              height: 10.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(shape: BoxShape.circle, color: _posColor),
              child: Text(
                '$position',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
            ),
            SizedBox(width: 3.w),
          ],
          Flexible(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.white, fontSize: 9.sp, height: 1.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _hotPill() {
    return UnconstrainedBox(
      child: Container(
        height: 16.w,
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        alignment: Alignment.center,
        decoration: const ShapeDecoration(shape: StadiumBorder(), color: Color(0xFFFF5780)),
        child: Text(
          roomCount(seat.contribution),
          maxLines: 1,
          style: TextStyle(
            fontSize: 10.sp,
            color: AppColors.white,
            height: 1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/theme/app_colors.dart';

/// 房间公告。高度随正文收缩，超过设计图卡片高度后只滚动正文。
class RoomBulletinDialog extends StatelessWidget {
  const RoomBulletinDialog({super.key, required this.notice});

  final String notice;

  static Future<void> show(String notice) {
    return Get.dialog<void>(
      RoomBulletinDialog(notice: notice),
      barrierColor: Colors.black.withValues(alpha: 0.55),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final scale = screen.width / 472;
    double d(num value) => value * scale;

    final text = notice.trim().isEmpty ? 'No bulletin yet' : notice.trim();
    final maxCard = d(508).clamp(0.0, screen.height - d(80));
    const titleStyle = TextStyle(
      color: AppColors.black111111,
      fontSize: 22,
      fontWeight: FontWeight.w700,
      height: 1.15,
    );
    final titleHeight = (titleStyle.fontSize ?? 22) * (titleStyle.height ?? 1) * scale;
    final bodyMax = (maxCard - d(34) - titleHeight - d(22) - d(24) - d(60) - d(25)).clamp(
      d(72),
      maxCard,
    );

    return Dialog(
      backgroundColor: Colors.white,
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: d(61)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(d(32))),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxCard),
        child: Padding(
          padding: EdgeInsets.fromLTRB(d(25), d(32), d(25), d(25)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Room Bulletin',
                textAlign: TextAlign.center,
                style: titleStyle.copyWith(fontSize: d(22)),
              ),
              SizedBox(height: d(22)),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: bodyMax),
                child: SingleChildScrollView(
                  child: Text(
                    text,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.gray333333,
                      fontSize: d(16),
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
              SizedBox(height: d(24)),
              Material(
                color: AppColors.green29EEAA,
                borderRadius: BorderRadius.circular(d(30)),
                child: InkWell(
                  onTap: () => AppJumper.back(),
                  borderRadius: BorderRadius.circular(d(30)),
                  child: SizedBox(
                    height: d(60),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Got It',
                        style: TextStyle(
                          color: AppColors.black111111,
                          fontSize: d(18),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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

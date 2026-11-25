import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';

/// 用户侧欢迎派对进房弹窗。对齐 joyride `WelcomeJoinDialog`。
abstract final class RomanceWelcomeJoinDialog {
  static Future<void> show(int rid) {
    if (rid <= 0) return Future.value();
    return Get.dialog<void>(RomanceWelcomeJoinDialogBody(rid: rid), barrierDismissible: false);
  }
}

class RomanceWelcomeJoinDialogBody extends StatefulWidget {
  const RomanceWelcomeJoinDialogBody({super.key, required this.rid});

  final int rid;

  @override
  State<RomanceWelcomeJoinDialogBody> createState() => _RomanceWelcomeJoinDialogBodyState();
}

class _RomanceWelcomeJoinDialogBodyState extends State<RomanceWelcomeJoinDialogBody> {
  Timer? _timer;
  int _sec = 5;
  var _going = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() => _sec--);
      if (_sec <= 0) _gotoRoom();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _gotoRoom() async {
    if (_going) return;
    _going = true;
    _timer?.cancel();
    if (Get.isDialogOpen ?? false) Get.back();
    await AppJumper.toRoom(widget.rid);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: 356.w,
          height: 351.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 56.w,
                child: Image.asset(
                  AppAssets.romanceJoinBg,
                  width: 300.w,
                  height: 275.w,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 80.w,
                left: 48.w,
                child: Image.asset(
                  AppAssets.romanceJoinTitle,
                  width: 136.w,
                  height: 72.w,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 168.w,
                left: 48.w,
                right: 48.w,
                child: Text(
                  "We've set up a special Welcome Party just for you.\nCome dive into the best of Chimo and meet some super nice new friends!",
                  style: TextStyle(
                    color: const Color(0xFF180423),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.35,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Image.asset(
                  AppAssets.romanceJoinTips,
                  width: 198.w,
                  height: 188.w,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 0,
                child: GestureDetector(
                  onTap: _gotoRoom,
                  child: Container(
                    width: 201.w,
                    height: 54.w,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.romanceJoinBtn),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Text(
                      'Join Now ($_sec)',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w900,
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

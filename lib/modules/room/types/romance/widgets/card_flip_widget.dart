import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forya_pag/pag.dart';
import 'package:get/get.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/extensions/wire_view.dart';
import '../../../../../common/models/server_client/user.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/zodiac.dart';
import '../../../../../common/widgets/app_image.dart';
import '../../../../chat/model/conversation_model.dart';

/// 翻牌匹配 GS。对齐 joyride `CardFlipWidget`。
abstract final class RomanceCardFlip {
  static Future<void> show(User info) {
    return Get.dialog<void>(
      RomanceCardFlipBody(info: info),
      barrierDismissible: false,
      barrierColor: AppColors.black80,
    );
  }
}

class RomanceCardFlipBody extends StatefulWidget {
  const RomanceCardFlipBody({super.key, required this.info});

  final User info;

  @override
  State<RomanceCardFlipBody> createState() => _RomanceCardFlipBodyState();
}

class _RomanceCardFlipBodyState extends State<RomanceCardFlipBody>
    with SingleTickerProviderStateMixin {
  /// 0 选牌 / 1 PAG 翻牌 / 2 结果
  var _status = 0;
  var _autoFlipSec = 5;
  var _autoChatSec = 5;
  Timer? _flipTimer;
  Timer? _chatTimer;
  AnimationController? _handCtrl;
  Animation<Offset>? _handOffset;

  @override
  void initState() {
    super.initState();
    _flipTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() => _autoFlipSec--);
      if (_autoFlipSec <= 0) _changeStatus(1);
    });
  }

  @override
  void dispose() {
    _flipTimer?.cancel();
    _chatTimer?.cancel();
    _handCtrl?.dispose();
    super.dispose();
  }

  void _changeStatus(int value) {
    if (value == 1) {
      if (_status != 0) return;
      _flipTimer?.cancel();
    }
    if (value == 2) {
      if (_status == 2) return;
      _handCtrl?.dispose();
      _handCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))
        ..repeat(reverse: true);
      _handOffset = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(0.4, 0.4),
      ).animate(CurvedAnimation(parent: _handCtrl!, curve: Curves.easeInOut));
      _chatTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (!mounted) return;
        setState(() => _autoChatSec--);
        if (_autoChatSec <= 0) _gotoChat();
      });
    }
    setState(() => _status = value);
  }

  void _gotoChat() {
    _chatTimer?.cancel();
    if (Get.isDialogOpen ?? false) Get.back();
    final em = widget.info.emUsername.trim();
    if (em.isEmpty) return;
    final preview = ConversationModel(
      id: 'dm_$em',
      title: widget.info.nickname,
      avatarAsset: '',
      avatarUrl: widget.info.avatar,
      lastMessage: '',
      timeLabel: '',
      emUserName: em,
      appUid: widget.info.uid,
      isMale: widget.info.male,
    );
    AppJumper.toChat(preview.id, preview: preview);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          color: Colors.black87,
          image: DecorationImage(image: AssetImage(AppAssets.romanceCardBg), fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        child: _status == 0
            ? _pickCards()
            : _status == 1
            ? PAGView.asset(
                AppAssets.romanceCardPag,
                width: 1.sw,
                height: 1.sh,
                autoPlay: true,
                repeatCount: 1,
                onAnimationEnd: () => _changeStatus(2),
              )
            : _resultCard(),
      ),
    );
  }

  Widget _pickCards() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(AppAssets.romanceCardTitle, width: 271.w, fit: BoxFit.fitWidth),
        SizedBox(height: 20.w),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 66.w),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 18.w,
              crossAxisSpacing: 16.w,
              childAspectRatio: 112 / 196,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _changeStatus(1),
                child: Image.asset(AppAssets.romanceCard, width: 112.w, fit: BoxFit.fitWidth),
              );
            },
          ),
        ),
        SizedBox(height: 24.w),
        Text(
          'Auto-flip in ${_autoFlipSec}s',
          style: TextStyle(color: AppColors.white70, fontSize: 12.sp),
        ),
      ],
    );
  }

  Widget _resultCard() {
    final user = widget.info;
    final zodiac = user.birthday.trim().isEmpty ? '' : Zodiac.fromBirthday(user.birthday);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(AppAssets.romanceCardSuccessTitle, width: 277.w, fit: BoxFit.fitWidth),
        SizedBox(height: 25.w),
        Stack(
          children: [
            Container(
              width: 240.w,
              height: 422.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.romanceCardSuccessBg),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 70.w),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white54, width: 2.w),
                    ),
                    child: AppImage.avatar(user.avatar, size: 72.w),
                  ),
                  SizedBox(height: 10.w),
                  Text(
                    user.nickname,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10.w),
                  Wrap(
                    spacing: 5.w,
                    children: [
                      if (zodiac.isNotEmpty) _chip(zodiac),
                      if (user.height > 0) _chip('${user.height} inch'),
                      if (user.weight > 0) _chip('${user.weight} lb'),
                    ],
                  ),
                  SizedBox(height: 16.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'I love listening to songs and playing games.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.white, fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(height: 30.w),
                  GestureDetector(
                    onTap: _gotoChat,
                    child: Container(
                      width: 172.w,
                      height: 48.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.w),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.yellowFBC469, AppColors.yellowFFFFD2],
                        ),
                      ),
                      child: Text(
                        'Chat Now',
                        style: TextStyle(
                          color: AppColors.brown912910,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.w),
                  Text(
                    'Auto-redirect in ${_autoChatSec}s',
                    style: TextStyle(color: AppColors.white70, fontSize: 11.sp),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 56.w,
              right: 51.w,
              child: Container(
                width: 68.w,
                height: 27.w,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 6.w),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.romanceCardTipsBg),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Text(
                  'Matched',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            if (_handOffset != null)
              Positioned(
                bottom: 75.w,
                right: 30.w,
                child: SlideTransition(
                  position: _handOffset!,
                  child: Image.asset(
                    AppAssets.romanceHand,
                    width: 36.w,
                    height: 33.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: Text(
        text,
        style: TextStyle(color: AppColors.white, fontSize: 11.sp),
      ),
    );
  }
}

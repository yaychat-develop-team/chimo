import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../app/session_info.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/models/server_client/heart_link.pb.dart';
import '../../../common/models/server_client/rtc.pbenum.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/chimo.dart';
import '../../../common/widgets/app_global_notice.dart';

/// Heart Link 全局邀请 / 上线浮层。对齐 oumi `HeartLinkInvite*Dialog` + `ht_info_bg`。
abstract final class HeartLinkInviteNotice {
  static int _lastGsRid = 0;
  static int _lastGsAtMs = 0;
  static int _lastUserRid = 0;
  static int _lastUserAtMs = 0;

  static const inviteBtnGradient = LinearGradient(
    colors: [AppColors.pinkFC5CC6, Color(0xFFFC475F)],
  );

  static bool isExpired(HeartLinkInfo info) {
    final expired = info.expiredTime.toInt();
    if (expired <= 0) return false;
    final nowSec = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final expiredSec = expired > 100000000000 ? expired ~/ 1000 : expired;
    return nowSec > expiredSec;
  }

  static bool _dedupe({required int rid, required bool forGs}) {
    if (rid <= 0) return false;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (forGs) {
      if (rid == _lastGsRid && now - _lastGsAtMs < 2500) return true;
      _lastGsRid = rid;
      _lastGsAtMs = now;
      return false;
    }
    if (rid == _lastUserRid && now - _lastUserAtMs < 2500) return true;
    _lastUserRid = rid;
    _lastUserAtMs = now;
    return false;
  }

  static Future<void> showUserInvite(HeartLinkInfo info) {
    if (isExpired(info)) {
      AppToast.info('This invitation has expired');
      return Future.value();
    }
    if (_dedupe(rid: info.rid.toInt(), forGs: false)) return Future.value();
    return AppGlobalNotice.show(
      widget: _UserInviteCard(info: info),
      level: AppGlobalNotice.heartLinkInviteLevel,
      durationSeconds: 5,
      dismissOnBarrier: false,
    );
  }

  static Future<void> showGsInvite(HeartLinkInfo info) {
    if (isExpired(info)) {
      AppToast.info('This invitation has expired');
      return Future.value();
    }
    if (_dedupe(rid: info.rid.toInt(), forGs: true)) return Future.value();
    return AppGlobalNotice.show(
      widget: _GsInviteCard(info: info),
      level: AppGlobalNotice.heartLinkInviteLevel,
      durationSeconds: 10,
      dismissOnBarrier: true,
    );
  }

  static Future<void> showOnline(HeartLinkInfo info) {
    return AppGlobalNotice.show(
      widget: _OnlineCard(info: info),
      level: AppGlobalNotice.heartLinkOnlineLevel,
      durationSeconds: 10,
      dismissOnBarrier: true,
    );
  }

  static Future<void> joinRoom(HeartLinkInfo info) async {
    final rid = info.rid.toInt();
    if (rid <= 0) return;
    if (isExpired(info)) {
      AppToast.info('This invitation has expired');
      return;
    }
    AppGlobalNotice.dismiss();
    await AppJumper.toRoom(rid, joinSource: JoinSource.HEART_LINK_INVITE);
  }
}

/// 白底粉字按钮。对齐 oumi `JRGradientText` + 白 Stadium。
class HeartLinkInviteActionBtn extends StatelessWidget {
  const HeartLinkInviteActionBtn({
    super.key,
    required this.label,
    required this.onTap,
    this.width,
    this.height,
    this.fontSize = 16,
  });

  final String label;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final h = height ?? 44.w;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(3.w),
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: AppColors.white.withValues(alpha: 0.2),
        ),
        child: Container(
          width: width,
          height: h,
          alignment: Alignment.center,
          decoration: const ShapeDecoration(color: AppColors.white, shape: StadiumBorder()),
          child: ShaderMask(
            shaderCallback: (rect) => HeartLinkInviteNotice.inviteBtnGradient.createShader(rect),
            child: Text(
              label,
              style: TextStyle(
                color: AppColors.white,
                fontSize: fontSize.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 匹配双方头像 + 心形。对齐 oumi `HeartLinkUserInfo`。
class HeartLinkInviteMatchPair extends StatelessWidget {
  const HeartLinkInviteMatchPair({super.key, required this.info, this.small = false});

  final HeartLinkInfo info;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final imgW = small ? 100.w : 140.w;
    final imgH = small ? 43.w : 60.w;
    final imgP = small ? 34.w : 44.w;
    final imgB = small ? 18.w : 22.w;
    final avatar = small ? 42.w : 60.w;
    final pad = 30.w;
    final numTop = small ? 10.w : 17.w;
    final nameStyle = TextStyle(
      color: AppColors.white,
      fontSize: small ? 11.sp : 12.sp,
      fontWeight: small ? FontWeight.w500 : FontWeight.w600,
    );
    final leftName = info.uid1.toInt() == SessionInfo.uid
        ? 'Me'
        : (info.name1.trim().isEmpty ? 'Guest' : info.name1);
    final rightName = info.name2.trim().isEmpty ? 'Secret Match' : info.name2;
    final rightAvatar = info.avatar2.trim().isEmpty ? AppAssets.htSecretAvatar : info.avatar2;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: imgP + pad, end: imgP + pad, bottom: imgB),
          child: Chimo.image(AppAssets.htInfoHeart, width: imgW, height: imgH, fit: BoxFit.contain),
        ),
        PositionedDirectional(
          start: 0,
          top: 2.w,
          child: SizedBox(
            width: avatar + 2 * pad,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 1),
                  ),
                  child: Chimo.image(
                    info.avatar1,
                    width: avatar,
                    height: avatar,
                    circle: true,
                    fallbackAsset: AppAssets.avatarPlace,
                  ),
                ),
                SizedBox(height: 2.w),
                Text(leftName, maxLines: 1, overflow: TextOverflow.ellipsis, style: nameStyle),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          end: 0,
          top: 2.w,
          child: SizedBox(
            width: avatar + 2 * pad,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 1),
                  ),
                  child: Chimo.image(
                    rightAvatar,
                    width: avatar,
                    height: avatar,
                    circle: true,
                    fallbackAsset: AppAssets.htSecretAvatar,
                  ),
                ),
                SizedBox(height: 2.w),
                Text(rightName, maxLines: 1, overflow: TextOverflow.ellipsis, style: nameStyle),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          top: numTop,
          child: Text(
            '${info.matchValue}%',
            style: TextStyle(
              color: AppColors.white,
              fontSize: small ? 13.sp : 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (!small)
          PositionedDirectional(
            top: 51.w,
            child: Text(
              'Matching Value',
              style: TextStyle(color: AppColors.white, fontSize: 9.sp),
            ),
          ),
      ],
    );
  }
}

class _InfoBag extends StatelessWidget {
  const _InfoBag({required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: Container(
        width: 343.w,
        height: 218.w,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(image: AssetImage(AppAssets.htInfoBg), fit: BoxFit.fill),
        ),
        child: child,
      ),
    );
  }
}

class _UserInviteCard extends StatefulWidget {
  const _UserInviteCard({required this.info});

  final HeartLinkInfo info;

  @override
  State<_UserInviteCard> createState() => _UserInviteCardState();
}

class _UserInviteCardState extends State<_UserInviteCard> {
  int _seconds = 3;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {
        _seconds -= 1;
        if (_seconds <= 0) {
          _timer?.cancel();
          HeartLinkInviteNotice.joinRoom(widget.info);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InfoBag(
      padding: EdgeInsetsDirectional.only(top: 16.w, start: 16.w, end: 16.w, bottom: 8.w),
      child: Column(
        children: [
          Text(
            'Match Found!',
            style: TextStyle(color: AppColors.white, fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 11.w),
          HeartLinkInviteMatchPair(info: widget.info),
          const Spacer(),
          HeartLinkInviteActionBtn(
            label: 'Chat Now',
            width: 280.w,
            onTap: () {
              _timer?.cancel();
              HeartLinkInviteNotice.joinRoom(widget.info);
            },
          ),
          SizedBox(height: 6.w),
          Text(
            'Joining in $_seconds seconds...',
            style: TextStyle(
              color: AppColors.white.withValues(alpha: 0.8),
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _GsInviteCard extends StatelessWidget {
  const _GsInviteCard({required this.info});

  final HeartLinkInfo info;

  Future<void> _result(int result) async {
    final rid = info.rid.toInt();
    if (rid > 0) {
      await ChimoApis.heartLink.inviteResult(rid: rid, result: result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = info.name1.trim().isEmpty ? 'Host' : info.name1;
    final room = info.ridName.trim().isEmpty ? 'Heart Link Room' : info.ridName;
    return Stack(
      children: [
        _InfoBag(
          padding: EdgeInsetsDirectional.only(top: 16.w, start: 24.w, end: 24.w, bottom: 16.w),
          child: Column(
            children: [
              Row(
                children: [
                  Chimo.image(
                    info.avatar1,
                    width: 60.w,
                    height: 60.w,
                    circle: true,
                    fallbackAsset: AppAssets.avatarPlace,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 12.w),
                        Row(
                          children: [
                            Chimo.image(AppAssets.htHouseIcon, width: 12.w, height: 12.w),
                            SizedBox(width: 6.w),
                            Flexible(
                              child: Text(
                                room,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: AppColors.white, fontSize: 11.sp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.w),
              Container(
                height: 62.w,
                alignment: Alignment.center,
                padding: EdgeInsetsDirectional.only(top: 4.w, start: 8.w, end: 6.w),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.htTextArrowBg),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Text(
                  'The host invites you to join the Heartlink Room. Join now to interact with the audience!',
                  style: TextStyle(
                    color: AppColors.black1C1C1E,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await _result(0);
                      AppGlobalNotice.dismiss();
                    },
                    child: Container(
                      width: 139.w,
                      height: 44.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.w),
                        border: Border.all(color: AppColors.white, width: 1.w),
                      ),
                      child: Text(
                        'Later',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  HeartLinkInviteActionBtn(
                    label: 'Start Now',
                    width: 139.w,
                    onTap: () async {
                      await _result(1);
                      await HeartLinkInviteNotice.joinRoom(info);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        PositionedDirectional(
          top: 16.w,
          end: 16.w,
          child: GestureDetector(
            onTap: AppGlobalNotice.dismiss,
            child: Icon(Icons.close, size: 14.w, color: AppColors.white.withValues(alpha: 0.5)),
          ),
        ),
      ],
    );
  }
}

class _OnlineCard extends StatelessWidget {
  const _OnlineCard({required this.info});

  final HeartLinkInfo info;

  @override
  Widget build(BuildContext context) {
    final name = info.name1.trim().isEmpty ? 'Your Heartie' : info.name1;
    return Stack(
      children: [
        _InfoBag(
          padding: EdgeInsetsDirectional.only(top: 16.w, start: 24.w, end: 24.w, bottom: 16.w),
          child: Column(
            children: [
              Chimo.image(
                info.avatar1,
                width: 60.w,
                height: 60.w,
                circle: true,
                fallbackAsset: AppAssets.avatarPlace,
              ),
              SizedBox(height: 4.w),
              Text(
                name,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.w),
              Text(
                'Good news! $name is online, ready to chat with you!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              HeartLinkInviteActionBtn(
                label: 'Start Chat',
                width: 280.w,
                onTap: () {
                  AppGlobalNotice.dismiss();
                  final emId = info.emId.trim();
                  if (emId.isEmpty) {
                    AppToast.info('Chat unavailable');
                    return;
                  }
                  AppJumper.toChat(emId);
                },
              ),
            ],
          ),
        ),
        PositionedDirectional(
          top: 16.w,
          end: 16.w,
          child: GestureDetector(
            onTap: AppGlobalNotice.dismiss,
            child: Icon(Icons.close, size: 14.w, color: AppColors.white.withValues(alpha: 0.5)),
          ),
        ),
      ],
    );
  }
}

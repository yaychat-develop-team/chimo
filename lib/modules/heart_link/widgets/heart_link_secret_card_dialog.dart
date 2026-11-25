import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../app/global_config.dart';
import '../../../app/session_info.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/heart_link.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/chimo.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/gender_age_chip.dart';
import '../../room/service/room_service.dart';

/// 房内神秘资料卡预览 / 解锁。对齐 joyride `SecretCardDialog`。
abstract final class HeartLinkSecretCardDialog {
  /// [source]：0 默认；2 Boss 点 Banner；3 点麦位（对齐 joyride）。
  static Future<void> show(int targetUid, {int source = 0}) async {
    if (targetUid <= 0) return;
    await Get.dialog(
      Dialog(
        backgroundColor: AppColors.black.withValues(alpha: 0.7),
        insetPadding: EdgeInsets.zero,
        child: _SecretCardBody(targetUid: targetUid, source: source),
      ),
      barrierColor: AppColors.transparent,
      useSafeArea: false,
    );
  }
}

class _SecretCardBody extends StatefulWidget {
  const _SecretCardBody({required this.targetUid, required this.source});

  final int targetUid;
  final int source;

  @override
  State<_SecretCardBody> createState() => _SecretCardBodyState();
}

class _SecretCardBodyState extends State<_SecretCardBody> {
  HeartLinkCard? _data;
  var _locked = true;
  var _loading = true;
  var _busy = false;

  bool get _isMe => widget.targetUid == SessionInfo.uid;

  bool get _lock => _isMe ? false : _locked;

  User? get _user {
    if (_data != null && _data!.hasUser() && _data!.user.id.toInt() > 0) {
      return _data!.user;
    }
    if (_isMe) return SessionInfo.currentUser;
    return null;
  }

  int get _unlockPrice {
    final price = GlobalConfig.confResp?.unlockCardPrice.toInt() ?? 0;
    return price > 0 ? price : 100;
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      if (_isMe) {
        final rsp = await ChimoApis.heartLink.queryApply();
        if (rsp.ok && rsp.data != null) {
          _data = rsp.data;
          _locked = false;
        } else {
          AppToast.error(rsp.message.isEmpty ? 'Failed' : rsp.message);
        }
      } else {
        final unlockRsp = await ChimoApis.heartLink.hasUnlock(widget.targetUid);
        final infoRsp = await ChimoApis.heartLink.queryInfo(widget.targetUid);
        if (unlockRsp.ok && unlockRsp.data != null) {
          _locked = !unlockRsp.data!.result;
        }
        if (infoRsp.ok && infoRsp.data != null) {
          _data = infoRsp.data;
        } else {
          AppToast.error(infoRsp.message.isEmpty ? 'Failed' : infoRsp.message);
        }
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _unlock() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final cash = await ChimoApis.cash.balance();
      if (!cash.ok || cash.data == null) {
        AppToast.error(cash.message.isEmpty ? 'Failed' : cash.message);
        return;
      }
      final coin = cash.data!.coin.toInt();
      if (coin < _unlockPrice) {
        Get.back();
        await AppJumper.showRechargeSheet(
          price: _unlockPrice,
          diffCoin: _unlockPrice - coin,
        );
        return;
      }
      final rid = RoomService.findOrNull()?.rid ?? 0;
      final result = await ChimoApis.heartLink.unlock(
        rid: rid,
        gsId: widget.targetUid,
      );
      if (!result.ok) {
        AppToast.error(result.message.isEmpty ? 'Unlock failed' : result.message);
        return;
      }
      Get.back();
      AppToast.success('Unlocked');
      final info = await ChimoApis.heartLink.queryInfo(widget.targetUid);
      if (info.ok && info.data != null) {
        await AppJumper.toRevealCardPreview(info.data!);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _openFull() async {
    Get.back();
    if (_isMe) {
      await AppJumper.toEditRevealCard();
      return;
    }
    if (_data != null) {
      await AppJumper.toRevealCardPreview(_data!);
    }
  }

  void _onCta() {
    if (_lock) {
      _unlock();
    } else {
      _openFull();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: AppColors.transparent,
        child: Container(
          width: 300.w,
          height: 534.w,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.grayF5F6F7,
            borderRadius: BorderRadius.circular(16.w),
          ),
          child: _loading || _data == null
              ? const Center(child: CircularProgressIndicator(color: AppColors.pinkFC5CC6))
              : Stack(
                  children: [
                    _cover(),
                    SizedBox(
                      width: 300.w,
                      height: 534.w,
                      child: Column(
                        children: [
                          SizedBox(height: 199.w),
                          _cta(),
                          const Spacer(),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsetsDirectional.only(
                              start: 16.w,
                              end: 8.w,
                              bottom: 16.w,
                              top: 16.w,
                            ),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [AppColors.transparent, AppColors.black],
                              ),
                            ),
                            child: _SecretCardInfo(
                              data: _data!,
                              locked: _lock,
                              onOpen: _lock ? null : _openFull,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_lock) _priceTip(),
                    PositionedDirectional(
                      top: 16.w,
                      end: 16.w,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        behavior: HitTestBehavior.opaque,
                        child: Icon(
                          Icons.close,
                          size: 16.w,
                          color: AppColors.white50,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _cover() {
    final photo = _data!.photo.isNotEmpty ? _data!.photo.first.url.trim() : '';
    final avatar = _user?.avatar.trim() ?? '';
    final url = photo.isNotEmpty ? photo : avatar;
    final image = Chimo.image(
      url,
      width: 300.w,
      height: 534.w,
      fit: BoxFit.cover,
      fallbackAsset: AppAssets.avatarPlace,
    );
    if (!_lock) return image;
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: image,
    );
  }

  Widget _cta() {
    final female = !(_user?.male ?? true);
    final label = _busy
        ? 'Unlocking...'
        : (female ? 'Reveal Her World' : 'Reveal His World');
    return GestureDetector(
      onTap: _busy ? null : _onCta,
      child: Container(
        width: 228.w,
        height: 42.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white10,
          border: Border.all(color: AppColors.white, width: 1.w),
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 12.w),
            Chimo.image(AppAssets.htArrowRightCircle, width: 18.w, fit: BoxFit.fitWidth),
          ],
        ),
      ),
    );
  }

  Widget _priceTip() {
    return PositionedDirectional(
      top: 182.w,
      end: 36.w,
      child: Container(
        width: 91.w,
        height: 26.w,
        alignment: Alignment.center,
        padding: EdgeInsetsDirectional.only(bottom: 5.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.htPriceTipsBg),
            fit: BoxFit.fill,
          ),
        ),
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              color: AppColors.white,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
            children: [
              const TextSpan(text: 'Only '),
              TextSpan(
                text: '$_unlockPrice Coins',
                style: const TextStyle(color: AppColors.yellowFDE42B),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 底部信息区。对齐 joyride `SecretCardInfoWidget`。
class _SecretCardInfo extends StatelessWidget {
  const _SecretCardInfo({
    required this.data,
    required this.locked,
    this.onOpen,
  });

  final HeartLinkCard data;
  final bool locked;
  final VoidCallback? onOpen;

  User get _user {
    if (data.hasUser() && data.user.id.toInt() > 0) return data.user;
    return SessionInfo.currentUser ?? User();
  }

  String get _telegram {
    final raw = data.telegram.trim();
    if (raw.isEmpty) return '-';
    if (!locked) return raw;
    return _maskMiddle(raw);
  }

  static String _maskMiddle(String text) {
    if (text.length <= 4) return '*' * text.length;
    final start = (text.length - 4) ~/ 2;
    return text.replaceRange(start, start + 4, '****');
  }

  static String _fmt(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final age = _user.age;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                _user.nickname.trim().isEmpty ? 'Guest' : _user.nickname,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                ),
              ),
            ),
            if (age > 0) ...[
              SizedBox(width: 4.w),
              GenderAgeChip(isMale: _user.male, age: age),
            ],
          ],
        ),
        SizedBox(height: 4.w),
        Padding(
          padding: EdgeInsetsDirectional.only(bottom: 10.w),
          child: Row(children: _tags()),
        ),
        _telegramRow(),
        SizedBox(height: 18.w),
        Row(
          children: [
            if (data.hasVideo() && data.video.url.trim().isNotEmpty)
              _tapThumb(_videoThumb()),
            _tapThumb(_photoThumb()),
            if (data.hasAudio() && data.audio.url.trim().isNotEmpty)
              _tapThumb(_cdThumb()),
          ],
        ),
      ],
    );
  }

  List<Widget> _tags() {
    final items = [
      data.occupation.trim(),
      data.emotionalState.trim(),
    ].where((e) => e.isNotEmpty).toList();
    if (items.isEmpty) return const [];
    final widgets = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      if (i > 0) {
        widgets.add(
          Container(
            width: 1.w,
            height: 8.w,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            color: AppColors.white20,
          ),
        );
      }
      widgets.add(
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 100.w),
          child: Text(
            items[i],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  Widget _telegramRow() {
    return Container(
      height: 24.w,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColors.white10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chimo.image(AppAssets.telegramIcon, height: 24.w, fit: BoxFit.fitHeight),
          SizedBox(width: 6.w),
          Text(
            'Telegram:',
            style: TextStyle(color: AppColors.white, fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(width: 4.w),
          Text(
            _telegram,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(width: 8.w),
          if (locked)
            _lockLabel(withBg: false)
          else
            GestureDetector(
              onTap: () async {
                final text = data.telegram.trim();
                if (text.isEmpty) return;
                await Clipboard.setData(ClipboardData(text: text));
                AppToast.info('Saved to the clipboard');
              },
              child: Chimo.image(
                AppAssets.mineCopy,
                width: 10.w,
                fit: BoxFit.fitWidth,
                color: AppColors.white70,
              ),
            ),
          SizedBox(width: 12.w),
        ],
      ),
    );
  }

  Widget _lockLabel({required bool withBg}) {
    final row = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Chimo.image(AppAssets.lockIcon, width: 14.w, height: 14.w, color: AppColors.yellowFFE24B),
        SizedBox(width: 2.w),
        Text(
          'Locked',
          style: TextStyle(
            color: AppColors.yellowFFE24B,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
    if (!withBg) return row;
    return Container(
      height: 20.w,
      width: 72.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.black50,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: row,
    );
  }

  Widget _tapThumb(Widget child) {
    return GestureDetector(
      onTap: onOpen,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 8.w),
        child: child,
      ),
    );
  }

  Widget _blurThumb(Widget child) {
    if (!locked) return child;
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: child,
    );
  }

  Widget _videoThumb() {
    final cover = data.video.cover.trim().isNotEmpty ? data.video.cover : data.video.url;
    return SizedBox(
      width: 84.w,
      height: 84.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.w),
            child: _blurThumb(
              Chimo.image(cover, width: 84.w, height: 84.w, fit: BoxFit.cover),
            ),
          ),
          if (locked) _lockLabel(withBg: true),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 20.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.black.withValues(alpha: 0),
                    AppColors.black.withValues(alpha: 0.6),
                  ],
                ),
              ),
            ),
          ),
          PositionedDirectional(
            bottom: 6.w,
            end: 8.w,
            child: Row(
              children: [
                Chimo.image(AppAssets.htPlayIcon, width: 8.w),
                SizedBox(width: 4.w),
                Text(
                  _fmt(data.video.duration),
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _photoThumb() {
    final url = data.photo.length > 1
        ? data.photo[1].url.trim()
        : (data.photo.isNotEmpty ? data.photo.first.url.trim() : '');
    return SizedBox(
      width: 84.w,
      height: 84.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.w),
            child: _blurThumb(
              Chimo.image(
                url,
                width: 84.w,
                height: 84.w,
                fit: BoxFit.cover,
                fallbackAsset: AppAssets.avatarPlace,
              ),
            ),
          ),
          if (locked) _lockLabel(withBg: true),
        ],
      ),
    );
  }

  Widget _cdThumb() {
    return SizedBox(
      width: 84.w,
      height: 84.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 84.w,
            height: 84.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white10,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Chimo.image(AppAssets.htCdBg, width: 63.w, height: 63.w),
                      AppImage.avatar(_user.avatar, size: 27.w),
                    ],
                  ),
                ),
                PositionedDirectional(
                  top: 2.w,
                  end: 0,
                  child: Chimo.image(AppAssets.htCdPause, width: 24.w, fit: BoxFit.fitWidth),
                ),
              ],
            ),
          ),
          if (locked) _lockLabel(withBg: true),
        ],
      ),
    );
  }
}

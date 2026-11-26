import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/app_toast.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../../../common/utils/text_fmt.dart';
import '../../../../../common/utils/time_fmt.dart';
import '../../../../../modules/heart_link/widgets/heart_link_secret_card_dialog.dart';
import '../../../logic/mic_logic.dart';
import '../../../logic/room_logic.dart';
import '../../../model/mic_seat.dart';
import '../../../page/widgets/room_mic_grid.dart';
import '../../../service/room_service.dart';
import '../logic/heart_link_logic.dart';
import 'heart_link_host_control_sheet.dart';
import 'heart_link_send_gift_sheet.dart';

/// Heart Link 三麦区。主持人视角对齐设计图 + joyride `HtRoomMain`。
class HeartLinkMicArea extends StatelessWidget {
  const HeartLinkMicArea({super.key});

  void _onTap(MicSeat seat, HeartLinkLogic ht) {
    if (!Get.isRegistered<RoomLogic>()) return;
    final room = Get.find<RoomLogic>();
    if (!seat.occupied) {
      if (seat.index == 1 && ht.isHost) {
        HeartLinkHostControlSheet.show();
        return;
      }
      room.toggleMic(position: seat.index);
      return;
    }
    if (seat.index == 1 && ht.needShowSecretCard && !ht.isGuest) {
      HeartLinkSecretCardDialog.show(seat.uid ?? 0, source: 3);
      return;
    }
    AppJumper.showUserProfileSheet(uid: '${seat.uid ?? 0}', name: seat.name, avatar: seat.avatar);
  }

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<HeartLinkLogic>() || !Get.isRegistered<MicLogic>()) {
      return const SizedBox(height: 280);
    }
    final ht = Get.find<HeartLinkLogic>();
    final mic = Get.find<MicLogic>();
    return Obx(() {
      // Boss 倒计时由 _SeatBlock 内层 Obx 订阅 mic.clock，避免整区每秒重建。
      ht.heartLinkInfo.value;
      ht.heartfelt.value;
      ht.noticeInfo.value;
      ht.wordsFold.value;
      ht.roomUsers.length;
      ht.showOutlookerDot.value;
      ht.needShowTipsFlag.value;
      // Gift Stats：对齐 joyride `channel.giftValueCountSwitch` + `MicContributionLabel`。
      final showGiftStats =
          RoomService.findOrNull()?.giftValueCountSwitch.value ?? false;
      final seats = mic.seats.toList();
      final host = seats.isNotEmpty ? seats[0] : const MicSeat(index: 0);
      final gs = seats.length > 1 ? seats[1] : const MicSeat(index: 1);
      final boss = seats.length > 2 ? seats[2] : const MicSeat(index: 2, boss: true);
      final emotes = Map<int, String>.from(mic.micEmotes);
      return Padding(
        padding: EdgeInsets.only(top: 8.w),
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    _SecretBanner(ht: ht, gs: gs),
                    if (ht.noticeInfo.value != null) _NoticeBar(ht: ht),
                  ],
                ),
                SizedBox(height: 4.w),
                SizedBox(
                  height: 132.w,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 5.w),
                          _SeatBlock(
                            seat: host,
                            role: _SeatRole.host,
                            emptyLabel: '',
                            showHostBadge: true,
                            showGiftStats: showGiftStats,
                            emoteUrl: _emoteOf(emotes, host.uid),
                            anchor: mic.anchorFor(host),
                            onTap: () => _onTap(host, ht),
                            onGift: null,
                          ),
                          SizedBox(width: 10.w),
                          Padding(
                            padding: EdgeInsets.only(top: 12.w),
                            child: _SeatBlock(
                              seat: gs,
                              role: _SeatRole.guest,
                              emptyLabel: 'Guest',
                              accent: const Color(0xFFFE05FD),
                              showGift: gs.occupied && !ht.isGuest,
                              showGiftStats: showGiftStats,
                              emoteUrl: _emoteOf(emotes, gs.uid),
                              anchor: mic.anchorFor(gs),
                              onTap: () => _onTap(gs, ht),
                              onGift: () => HeartLinkSendGiftSheet.show(gs),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Padding(
                            padding: EdgeInsets.only(top: 12.w),
                            child: _SeatBlock(
                              seat: boss,
                              role: _SeatRole.boss,
                              emptyLabel: 'Handsome',
                              accent: const Color(0xFF0080FF),
                              showGiftStats: showGiftStats,
                              emoteUrl: _emoteOf(emotes, boss.uid),
                              anchor: mic.anchorFor(boss),
                              onTap: () => _onTap(boss, ht),
                              onGift: null,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Center(
                          child: ht.showHeartLinkBtn
                              ? _HeartLinkBtn(
                                  onTap: () {
                                    ht.needShowTipsFlag.value = false;
                                    HeartLinkSendGiftSheet.show(gs);
                                  },
                                )
                              : SizedBox(height: 24.w),
                        ),
                      ),
                    ],
                  ),
                ),
                if (ht.showHeartfeltWords) ...[SizedBox(height: 10.w), _HeartfeltCard(ht: ht)],
                if (ht.isHost || ht.isGuest) ...[
                  SizedBox(height: 8.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: _AudienceBar(ht: ht),
                  ),
                ],
                SizedBox(height: 8.w),
              ],
            ),
            if (ht.isHost)
              Positioned(
                left: 0,
                top: 156.w,
                child: _HeartieRoomBtn(
                  onTap: () => HeartLinkHostControlSheet.show(privateRoom: true),
                ),
              ),
            if (ht.needShowTips)
              Positioned(
                top: 167.w,
                child: Chimo.image(AppAssets.htClickTips, width: 298.w, height: 32.w),
              ),
          ],
        ),
      );
    });
  }

  static String _emoteOf(Map<int, String> emotes, int? uid) {
    if (uid == null || uid <= 0) return '';
    return emotes[uid]?.trim() ?? '';
  }
}

class _SecretBanner extends StatefulWidget {
  const _SecretBanner({required this.ht, required this.gs});

  final HeartLinkLogic ht;
  final MicSeat gs;

  @override
  State<_SecretBanner> createState() => _SecretBannerState();
}

class _SecretBannerState extends State<_SecretBanner> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _clip;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _clip = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.08, end: 0.20), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.20, end: 0.15), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.15, end: 0.20), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.20, end: 0.08), weight: 1),
      TweenSequenceItem(tween: ConstantTween(0.08), weight: 2),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onTap() async {
    final ht = widget.ht;
    if (ht.needShowSecretCard) {
      if (ht.isHost) {
        await ht.inviteViewCard();
        return;
      }
      final uid = widget.gs.uid ?? 0;
      if (uid <= 0) return;
      await ht.viewCard();
      await HeartLinkSecretCardDialog.show(uid, source: 2);
      return;
    }
    if (!ht.isHost) {
      AppToast.info('Please remind the guest to complete the Reveal Card');
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = 343.w;
    final h = 80.w;
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _clip,
        builder: (context, _) {
          final left = _clip.value * w;
          return SizedBox(
            width: w,
            height: h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Chimo.image(AppAssets.htBannerBottom, width: w, height: h, fit: BoxFit.fill),
                ClipRect(
                  clipper: _LeftClipper(left),
                  child: Chimo.image(AppAssets.htBannerTop, width: w, height: h, fit: BoxFit.fill),
                ),
                Positioned(
                  left: left - 14.w,
                  child: Chimo.image(
                    AppAssets.htBannerLine,
                    width: 28.w,
                    height: h,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: const Text(
                    'Unlock More Mysterious Info...',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LeftClipper extends CustomClipper<Rect> {
  _LeftClipper(this.left);

  final double left;

  @override
  Rect getClip(Size size) => Rect.fromLTWH(left, 0, size.width - left, size.height);

  @override
  bool shouldReclip(covariant _LeftClipper old) => old.left != left;
}

class _NoticeBar extends StatefulWidget {
  const _NoticeBar({required this.ht});

  final HeartLinkLogic ht;

  @override
  State<_NoticeBar> createState() => _NoticeBarState();
}

class _NoticeBarState extends State<_NoticeBar> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  Timer? _autoHide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _slide = Tween<Offset>(
      begin: const Offset(1.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
    _autoHide = Timer(const Duration(seconds: 4), () {
      if (!mounted) return;
      widget.ht.clearNotice();
    });
  }

  @override
  void dispose() {
    _autoHide?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final info = widget.ht.noticeInfo.value!;
    final name1 = info.name1.length > 10 ? info.name1.substring(0, 10) : info.name1;
    final name2 = info.name2.length > 10 ? info.name2.substring(0, 10) : info.name2;
    return Positioned(
      top: 4.w,
      child: SlideTransition(
        position: _slide,
        child: Container(
          constraints: BoxConstraints(maxWidth: 320.w),
          height: 30.w,
          padding: EdgeInsets.fromLTRB(4.w, 4.w, 12.w, 4.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            border: Border.all(color: AppColors.white50),
            gradient: const LinearGradient(colors: [Color(0xFF8826FF), Color(0xFFFF4B51)]),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Chimo.image(AppAssets.htNoticeIcon, width: 22.w, height: 22.w),
              SizedBox(width: 4.w),
              Flexible(
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    children: name2.isEmpty
                        ? [
                            TextSpan(
                              text: name1,
                              style: const TextStyle(color: AppColors.yellowFDE42B),
                            ),
                            const TextSpan(text: ' is curious about detailed'),
                          ]
                        : [
                            TextSpan(
                              text: name1,
                              style: const TextStyle(color: AppColors.yellowFDE42B),
                            ),
                            const TextSpan(text: ' is curious about '),
                            TextSpan(
                              text: name2,
                              style: const TextStyle(color: AppColors.yellowFDE42B),
                            ),
                            const TextSpan(text: "'s detailed"),
                          ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _SeatRole { host, guest, boss }

class _SeatBlock extends StatelessWidget {
  const _SeatBlock({
    required this.seat,
    required this.role,
    required this.emptyLabel,
    required this.emoteUrl,
    required this.anchor,
    required this.onTap,
    required this.onGift,
    this.accent,
    this.showHostBadge = false,
    this.showGift = false,
    this.showGiftStats = false,
  });

  final MicSeat seat;
  final _SeatRole role;
  final String emptyLabel;
  final String emoteUrl;
  final GlobalKey anchor;
  final VoidCallback onTap;
  final VoidCallback? onGift;
  final Color? accent;
  final bool showHostBadge;
  final bool showGift;
  final bool showGiftStats;

  bool get _host => role == _SeatRole.host;

  bool get _boss => role == _SeatRole.boss;

  @override
  Widget build(BuildContext context) {
    final size = _host ? 42.w : 58.w;
    final faceTop = _host ? 8.w : 16.w;
    return SizedBox(
      width: _host ? 70.w : 92.w,
      height: _host ? 80.w : 110.w,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: faceTop,
            child: GestureDetector(
              onTap: onTap,
              child: SizedBox(key: anchor, width: size, height: size, child: _face(size)),
            ),
          ),
          if (showHostBadge)
            Positioned(
              top: 44.w,
              child: Chimo.image(AppAssets.htHostBadge, width: 26.w, height: 12.w),
            ),
          if (showGift && onGift != null)
            Positioned(
              top: 6.w,
              right: 2.w,
              child: GestureDetector(
                onTap: onGift,
                child: Container(
                  width: 22.w,
                  height: 22.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.black.withValues(alpha: 0.24),
                  ),
                  child: Chimo.image(AppAssets.htGiftIcon, width: 14.w, height: 14.w),
                ),
              ),
            ),
          // 对齐 joyride `MicContributionLabel`：头像右上角粉渐变贡献值。
          if (seat.occupied && showGiftStats)
            Positioned(
              top: faceTop,
              left: (_host ? 70.w : 92.w) * 0.55,
              child: Container(
                height: 14,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                alignment: Alignment.center,
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  gradient: LinearGradient(
                    colors: [Color(0xFFFC5CC6), Color(0xFFFC475F)],
                  ),
                ),
                child: Text(
                  TextFmt.roomCount(seat.contribution),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ),
            ),
          // 对齐 joyride Boss `counterTime` 头顶条；仅此处订阅 mic.clock。
          if (_boss && seat.occupied && seat.counterAt > 0) _bossTimer(),
          Positioned(
            top: _host ? 58.w : 82.w,
            left: 0,
            right: 0,
            child: Text(
              seat.occupied ? seat.name : emptyLabel,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: seat.occupied ? AppColors.white : AppColors.white.withValues(alpha: 0.8),
                fontSize: 10.sp,
                fontWeight: seat.occupied ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 对齐 joyride Boss `counterTime`：时钟图标 + mm:ss。
  Widget _bossTimer() {
    return Positioned(
      top: 4.w,
      child: Obx(() {
        if (Get.isRegistered<MicLogic>()) Get.find<MicLogic>().clock.value;
        final remain =
            seat.counterAt - DateTime.now().millisecondsSinceEpoch ~/ 1000;
        if (remain <= 0) return const SizedBox.shrink();
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
          decoration: BoxDecoration(
            color: AppColors.black.withValues(alpha: 0.36),
            borderRadius: BorderRadius.circular(99),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Chimo.image(AppAssets.htClock, width: 11.w, height: 11.w),
              SizedBox(width: 3.w),
              Text(
                TimeFmt.duration(remain),
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _face(double size) {
    if (!seat.occupied) {
      // 三人房 MicLogic 不会给 index=2 打 boss 标记，空麦按角色位展示。
      return Chimo.image(
        _boss ? AppAssets.roomSeatBoss : AppAssets.roomSeatEmpty,
        width: size,
        height: size,
      );
    }
    final border = accent ?? (_boss ? AppColors.yellowFFC83D : AppColors.transparent);
    final hasBorder = accent != null || _boss;
    final frame = seat.frame.trim();
    final micEffect = seat.micEffect.trim();
    final emote = emoteUrl.trim();
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        // 说话麦效：订 speakingUids；佩戴光环优先，否则默认波纹。
        RoomSeatSpeakingFx(
          uid: seat.uid,
          micOpen: seat.micOpen,
          size: size,
          micEffect: micEffect,
        ),
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: border, width: hasBorder ? 2 : 0),
          ),
          child: ClipOval(
            child: Chimo.image(
              seat.avatar,
              width: size,
              height: size,
              fit: BoxFit.cover,
              fallbackAsset: AppAssets.avatarPlace,
            ),
          ),
        ),
        if (frame.isNotEmpty)
          IgnorePointer(
            child: OverflowBox(
              minWidth: size,
              minHeight: size,
              maxWidth: size * 1.6,
              maxHeight: size * 1.6,
              child: Chimo.image(frame, width: size * 1.25, height: size * 1.25, fit: BoxFit.cover),
            ),
          ),
        if (emote.isNotEmpty)
          IgnorePointer(
            child: Chimo.image(emote, width: size * 1.3, height: size * 1.3, fit: BoxFit.contain),
          ),
        if (!seat.micOpen)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 14.w,
              height: 14.w,
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
              child: Chimo.image(
                AppAssets.roomMicOff,
                width: 10.w,
                height: 10.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
      ],
    );
  }
}

class _HeartLinkBtn extends StatelessWidget {
  const _HeartLinkBtn({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 72.w,
        height: 24.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Chimo.image(AppAssets.htBtnBg, width: 72.w, height: 24.w, fit: BoxFit.fill),
            const Text(
              'HeartLink',
              style: TextStyle(color: AppColors.white, fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeartieRoomBtn extends StatelessWidget {
  const _HeartieRoomBtn({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 84.w,
        height: 36.w,
        padding: EdgeInsets.fromLTRB(10.w, 3.w, 3.w, 3.w),
        decoration: BoxDecoration(
          color: AppColors.black.withValues(alpha: 0.5),
          borderRadius: BorderRadius.horizontal(right: Radius.circular(16.w)),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            gradient: AppColors.cpGradient,
          ),
          child: Text(
            'Heartie\nroom',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class _HeartfeltCard extends StatelessWidget {
  const _HeartfeltCard({required this.ht});

  final HeartLinkLogic ht;

  @override
  Widget build(BuildContext context) {
    final words = ht.heartfelt.value;
    if (words == null || words.answer.length < 2) {
      return GestureDetector(
        onTap: ht.refreshHeartfeltWords,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Text(
            'Tap to load Heartfelt Words',
            style: TextStyle(color: AppColors.white60, fontSize: 12),
          ),
        ),
      );
    }
    if (ht.wordsFold.value) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => ht.wordsFold.value = false,
            child: Chimo.image(AppAssets.htTopicExpand, width: 118.w, height: 24.w),
          ),
        ),
      );
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.htTopicBg), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Chimo.image(AppAssets.htTopicCorner, width: 113.w, height: 20.w),
              const Spacer(),
              GestureDetector(
                onTap: () => ht.wordsFold.value = true,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(9.w, 6.w, 9.w, 0),
                  child: Chimo.image(AppAssets.htFoldIcon, width: 14.w, height: 12.w),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.w),
          GestureDetector(
            onTap: ht.refreshHeartfeltWords,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 16.w),
                Padding(
                  padding: EdgeInsets.only(top: 4.w),
                  child: Chimo.image(AppAssets.htRefresh, width: 12.w, height: 12.w),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    words.question,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
              ],
            ),
          ),
          SizedBox(height: 8.w),
          Row(
            children: [
              const Spacer(),
              _answer(words.answer.first, () => ht.chooseAnswer(words.answer.first, words.id)),
              SizedBox(width: 20.w),
              _answer(words.answer.last, () => ht.chooseAnswer(words.answer.last, words.id)),
              const Spacer(),
            ],
          ),
          SizedBox(height: 10.w),
        ],
      ),
    );
  }

  Widget _answer(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 120.w,
        height: 28.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Chimo.image(AppAssets.htTopicBtnBg, width: 120.w, height: 28.w, fit: BoxFit.fill),
            Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AudienceBar extends StatelessWidget {
  const _AudienceBar({required this.ht});

  final HeartLinkLogic ht;

  @override
  Widget build(BuildContext context) {
    final users = ht.outlookerUsers;
    return Container(
      height: 44,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD1D2FF).withValues(alpha: 0.2)),
        color: const Color(0xFF0B0A41).withValues(alpha: 0.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: users.isEmpty
                ? const SizedBox.shrink()
                : ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: users.length.clamp(0, 12),
                    separatorBuilder: (context, index) => SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final u = users[index];
                      return GestureDetector(
                        onTap: () => AppJumper.showUserProfileSheet(
                          uid: '${u.id.toInt()}',
                          name: u.nickname,
                          avatar: u.avatar,
                        ),
                        child: Center(
                          child: Chimo.image(
                            u.avatar,
                            width: 28,
                            height: 28,
                            circle: true,
                            fit: BoxFit.cover,
                            fallbackAsset: AppAssets.avatarPlace,
                          ),
                        ),
                      );
                    },
                  ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              if (!ht.isHost) return;
              ht.clearOutlookerDot();
              HeartLinkHostControlSheet.show();
            },
            child: Stack(
              children: [
                Container(
                  width: 50,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white.withValues(alpha: 0.12),
                  ),
                  child: Text(
                    ht.isHost ? 'Host\nControl' : '${users.length}\nviewers',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ht.isHost ? AppColors.white : AppColors.gray9A9A9A,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      height: 1.1,
                    ),
                  ),
                ),
                if (ht.isHost && ht.showOutlookerDot.value)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.redFD4B4B,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

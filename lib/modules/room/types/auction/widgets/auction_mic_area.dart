import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/auction.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../../../common/widgets/app_image.dart';
import '../../../logic/mic_logic.dart';
import '../../../logic/room_logic.dart';
import '../../../model/mic_seat.dart';
import '../../../model/room_format.dart';
import '../../../page/widgets/room_mic_grid.dart';
import '../logic/auction_logic.dart';

/// 拍卖中间 seat 区。布局对齐 joyride；出价 Top3 皇冠对齐设计图。
class AuctionMicArea extends StatelessWidget {
  const AuctionMicArea({super.key});

  void _onTap(MicSeat seat) {
    if (!Get.isRegistered<RoomLogic>()) return;
    final room = Get.find<RoomLogic>();
    if (!seat.occupied) {
      room.toggleMic(position: seat.index);
      return;
    }
    AppJumper.showUserProfileSheet(uid: '${seat.uid ?? 0}', name: seat.name, avatar: seat.avatar);
  }

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<AuctionLogic>() || !Get.isRegistered<MicLogic>()) {
      return SizedBox(height: 280.w);
    }
    final auction = Get.find<AuctionLogic>();
    final mic = Get.find<MicLogic>();
    return Obx(() {
      mic.clock.value;
      // 显式订阅表演麦，避免上麦后 Obx 未感知座位内容变化。
      final seats = mic.seats.toList();
      final artist = seats.length > 1 ? seats[1] : MicSeat(index: 1);
      final emotes = Map<int, String>.from(mic.micEmotes);
      auction.info.value;
      auction.clock.value;
      auction.busy.value;
      return Padding(
        padding: EdgeInsets.only(top: 8.w),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16.w),
                _openingBid(auction),
                SizedBox(height: 2.w),
                _AuctionSeat(
                  key: ValueKey('auction-artist-${artist.uid ?? 0}-${artist.avatar}'),
                  seat: artist,
                  position: 1,
                  anchor: mic.anchorFor(artist),
                  emoteUrl: _emoteOf(emotes, artist.uid),
                  onTap: () => _onTap(artist),
                ),
                SizedBox(height: 16.w),
                _bidRanks(auction.info.value.bidList),
                SizedBox(height: 12.w),
                _bottomMics(auction, mic, emotes),
              ],
            ),
            Positioned(left: 0, top: 20, child: _stageTimer(auction)),
            if (auction.showBtn) Positioned(left: 16.w, top: 76.w, child: _hostBtn(auction)),
            Positioned(right: 65.w, top: 78.w, child: _manager(auction)),
          ],
        ),
      );
    });
  }

  Widget _openingBid(AuctionLogic auction) {
    if (!auction.showPriceTips) return SizedBox(height: 19.w);
    final value = auction.info.value.artist.value;
    return Container(
      width: 145.w,
      height: 19.w,
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 2.w),
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.auctionPriceTipsBg), fit: BoxFit.fill),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: AppColors.white, fontSize: 10.sp, fontWeight: FontWeight.w600),
          children: [
            const TextSpan(text: 'Opening Bid: '),
            TextSpan(
              text: '$value coins',
              style: const TextStyle(color: AppColors.yellowFDE42B),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stageTimer(AuctionLogic auction) {
    return Container(
      width: 110.w,
      height: 36.w,
      padding: EdgeInsets.only(left: 16.w),
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.auctionTimeBg), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            auction.stageTitle,
            style: TextStyle(color: AppColors.white, fontSize: 11.sp),
          ),
          if (auction.showTimeInfo)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Chimo.image(AppAssets.auctionClock, width: 11.w, height: 11.w),
                SizedBox(width: 2.w),
                Text(
                  auction.remainTimeStr,
                  style: TextStyle(color: AppColors.white, fontSize: 11.sp),
                ),
                if (auction.showPlusBtn)
                  GestureDetector(
                    onTap: auction.addTime,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Chimo.image(AppAssets.auctionPlus, width: 24.w, height: 16.w),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _hostBtn(AuctionLogic auction) {
    return GestureDetector(
      onTap: auction.busy.value ? null : auction.hostAction,
      child: Container(
        width: 88,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: AppColors.auctionBidGradient,
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: auction.busy.value
            ? const SizedBox(
                width: 14,
                height: 14,
                child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.white),
              )
            : Text(
                auction.btnLabel,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }

  /// Manager：设计图黄/金角标。
  Widget _manager(AuctionLogic auction) {
    final agent = auction.info.value.artist.agent;
    final avatar = agent.avatar.trim();
    return GestureDetector(
      onTap: () {
        final uid = agent.id.toInt();
        if (uid <= 0) return;
        AppJumper.showUserProfileSheet(uid: '$uid', name: agent.nickname, avatar: avatar);
      },
      child: SizedBox(
        width: 54.w,
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 4.w),
              child: Container(
                width: 46.w,
                height: 46.w,
                padding: EdgeInsets.all(1.5.w),
                child: ClipOval(
                  child: avatar.isEmpty
                      ? Chimo.image(AppAssets.roomSeatEmpty, width: 43.w, height: 43.w)
                      : Chimo.image(avatar, width: 43.w, height: 43.w, fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              width: 54.w,
              height: 14.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.w),
                color: AppColors.rgba(255, 237, 44, 1),
              ),
              child: Text(
                'Manager',
                style: TextStyle(
                  color: AppColors.black111111,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bidRanks(List<BidInfo> list) {
    // 设计图：左 2 / 中 1 / 右 3，三者同高；头像中心距约 105pt。
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BidRank(index: 1, infos: list),
        _BidRank(index: 0, infos: list),
        _BidRank(index: 2, infos: list),
      ],
    );
  }

  Widget _bottomMics(AuctionLogic auction, MicLogic mic, Map<int, String> emotes) {
    Widget cell(int position) {
      final seat = auction.seatAt(position);
      return Expanded(
        child: Center(
          child: _AuctionSeat(
            seat: seat,
            position: position,
            anchor: mic.anchorFor(seat),
            emoteUrl: _emoteOf(emotes, seat.uid),
            onTap: () => _onTap(seat),
          ),
        ),
      );
    }

    return Container(
      height: 90.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        color: AppColors.white8,
        border: Border.all(color: AppColors.white12),
      ),
      child: Row(
        children: [
          cell(0),
          Container(
            height: 24.w,
            width: 1.w,
            margin: EdgeInsets.only(bottom: 16.w),
            color: AppColors.white.withValues(alpha: 0.12),
          ),
          cell(2),
          cell(3),
          cell(4),
        ],
      ),
    );
  }

  static String _emoteOf(Map<int, String> emotes, int? uid) {
    if (uid == null || uid <= 0) return '';
    return emotes[uid]?.trim() ?? '';
  }
}

/// 对齐设计图：艺人更大、Host 压在头像底、贡献 pill、说话波纹、头像框。
class _AuctionSeat extends StatelessWidget {
  const _AuctionSeat({
    super.key,
    required this.seat,
    required this.position,
    required this.anchor,
    required this.emoteUrl,
    required this.onTap,
  });

  final MicSeat seat;
  final int position;
  final GlobalKey anchor;
  final String emoteUrl;
  final VoidCallback onTap;

  bool get _actor => position == 1;

  bool get _host => position == 0;

  double get _avatar => _actor ? 66.w : 42.w;

  double get _w => _actor ? 88.w : 64.w;

  double get _h => _actor ? 118.w : 90.w;

  int get _remain => seat.remainSeconds();

  bool get _showScore => seat.occupied && !_host && !(_remain > 0 && _remain <= 30);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: _w,
        height: _h,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            if (_actor)
              Positioned(
                top: _avatar * 0.55,
                child: Container(
                  width: _avatar * 1.35,
                  height: _avatar * 0.55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.auctionStageGlow,
                        blurRadius: 22.w,
                        spreadRadius: 6.w,
                      ),
                    ],
                  ),
                ),
              ),
            Positioned(
              top: _actor ? 0 : 15.w,
              child: SizedBox(key: anchor, width: _avatar, height: _avatar, child: _face()),
            ),
            // Host 角标压在头像底部（设计图）
            if (_host)
              Positioned(
                top: 15.w + _avatar - 8.w,
                child: Chimo.image(
                  AppAssets.auctionHost,
                  width: 32.w,
                  height: 14.w,
                  fit: BoxFit.contain,
                ),
              ),
            // 底部麦：贡献 pill 在头像上方
            if (_showScore && !_actor) Positioned(top: 4.w, child: _score()),
            if (!seat.occupied)
              Positioned(
                top: _actor ? 74.w : 65.w,
                child: Text(
                  'Empty',
                  style: TextStyle(color: AppColors.white.withValues(alpha: 0.5), fontSize: 10.sp),
                ),
              ),
            if (seat.occupied)
              Positioned(
                top: _actor ? 70.w : 65.w,
                left: 0,
                right: 0,
                child: Text(
                  seat.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            // 艺人：贡献 pill 在昵称下方
            if (_showScore && _actor) Positioned(top: 90.w, child: _score()),
          ],
        ),
      ),
    );
  }

  Widget _face() {
    if (!seat.occupied) {
      return Chimo.image(
        seat.boss ? AppAssets.roomSeatBoss : AppAssets.roomSeatEmpty,
        width: _avatar,
        height: _avatar,
      );
    }
    final frame = seat.frame.trim();
    final emote = emoteUrl.trim();
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        if (seat.speaking) RoomSeatWave(size: _avatar),
        if (_actor)
          Container(
            width: _avatar,
            height: _avatar,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white.withValues(alpha: 0.35), width: 1.5.w),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFBF3AFC).withValues(alpha: 0.45),
                  blurRadius: 14.w,
                  spreadRadius: 1.w,
                ),
              ],
            ),
          ),
        ClipOval(child: AppImage.avatar(seat.avatar, size: _avatar)),
        if (frame.isNotEmpty)
          IgnorePointer(
            child: OverflowBox(
              minWidth: _avatar,
              minHeight: _avatar,
              maxWidth: _avatar * 1.7,
              maxHeight: _avatar * 1.7,
              child: Chimo.image(
                frame,
                width: _avatar * 1.35,
                height: _avatar * 1.35,
                fit: BoxFit.cover,
              ),
            ),
          ),
        if (emote.isNotEmpty)
          IgnorePointer(
            child: Chimo.image(
              emote,
              width: _avatar * 1.3,
              height: _avatar * 1.3,
              fit: BoxFit.contain,
            ),
          ),
        if (!seat.micOpen)
          Positioned(
            right: 0,
            top: 0,
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
        if (_remain > 0 && _remain <= 30) _remainTip(),
      ],
    );
  }

  Widget _remainTip() {
    return OverflowBox(
      minWidth: _avatar,
      minHeight: _avatar,
      maxWidth: _avatar * 2,
      maxHeight: _avatar * 2,
      child: Container(
        width: 48,
        height: 15,
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: _avatar * 1.3 + 5),
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: AppColors.white.withValues(alpha: 0.12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Chimo.image(AppAssets.roomMicRemain, width: 14, height: 14),
            const SizedBox(width: 3),
            Text(
              '${_remain}s',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _score() {
    return Container(
      height: 16.w,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        gradient: _actor ? AppColors.auctionActorScore : AppColors.auctionBossScore,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            color: (_actor ? const Color(0xFFFC475F) : const Color(0xFF0047FD)).withValues(
              alpha: 0.35,
            ),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chimo.image(
            _actor ? AppAssets.auctionStar : AppAssets.auctionHeart,
            width: 10,
            height: 10,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 3.w),
          Text(
            roomCount(seat.contribution),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

/// 出价 Top3。
class _BidRank extends StatelessWidget {
  const _BidRank({required this.index, required this.infos});

  final int index;
  final List<BidInfo> infos;

  bool get _has => infos.length > index;

  BidInfo? get _info => _has ? infos[index] : null;

  int get _rank => index + 1;

  Color get _border {
    if (_rank == 2) return AppColors.auctionRankSilver;
    if (_rank == 3) return AppColors.auctionRankBronze;
    return AppColors.auctionRankGold;
  }

  String get _crownAsset {
    if (_rank == 2) return AppAssets.auctionCrown2;
    if (_rank == 3) return AppAssets.auctionCrown3;
    return AppAssets.auctionCrown1;
  }

  static double get _avatar => 48.w;

  static double get _crown => 22.w;

  /// 皇冠约 55% 叠在头像上方空白，其余压住顶缘。
  static double get _crownHang => _crown * 0.55;

  /// (28.5 + 48 + 28.5) ≈ 105 中心距。
  static double get _hPad => 28.5.w;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _hPad),
      child: SizedBox(
        width: _avatar,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: _crownHang),
                Container(
                  width: _avatar,
                  height: _avatar,
                  padding: EdgeInsets.all(1.5.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: _border, width: 1.5.w),
                    boxShadow: [
                      BoxShadow(
                        color: _border.withValues(alpha: 0.45),
                        blurRadius: 10.w,
                        spreadRadius: 0.5.w,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: _has
                        ? Chimo.image(
                            _info!.user.avatar,
                            width: 45.w,
                            height: 45.w,
                            fit: BoxFit.cover,
                          )
                        : Chimo.image(AppAssets.roomSeatEmpty, width: 45.w, height: 45.w),
                  ),
                ),
                SizedBox(height: 6.w),
                if (_has)
                  Container(
                    constraints: BoxConstraints(minWidth: 54.w),
                    height: 16.w,
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: AppColors.black.withValues(alpha: 0.55),
                      border: Border.all(color: _border.withValues(alpha: 0.55), width: 0.5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Chimo.image(AppAssets.auctionCoin, width: 12, height: 12),
                        const SizedBox(width: 2),
                        Text(
                          '${_info!.bid}',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  SizedBox(
                    width: 54.w,
                    height: 16.w,
                    child: Center(
                      child: Text(
                        'Waiting',
                        style: TextStyle(
                          color: AppColors.white.withValues(alpha: 0.5),
                          fontSize: 9.sp,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            if (_has)
              Positioned(
                top: 0,
                child: Chimo.image(_crownAsset, width: _crown, height: _crown),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../app/chimo_api.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/auction.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/app_toast.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../../../common/widgets/app_blur_backdrop.dart';
import '../../../model/mic_seat.dart';

/// 出价面板。UI 对齐 Cosmic Lounge Raise Bid；逻辑对齐 joyride `AuctionBidPage`。
class AuctionBidSheet extends StatefulWidget {
  const AuctionBidSheet({super.key, required this.sessionId, this.artist});

  final int sessionId;
  final MicSeat? artist;

  static const balanceShortCode = 1001510100;

  static Future<void> show({required int sessionId, MicSeat? artist}) {
    return Get.bottomSheet<void>(
      AuctionBidSheet(sessionId: sessionId, artist: artist),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  State<AuctionBidSheet> createState() => _AuctionBidSheetState();
}

class _AuctionBidSheetState extends State<AuctionBidSheet> {
  AuctionBidInfo? _info;
  var _select = 0;
  var _loading = true;
  var _bidding = false;

  int get _addBid {
    final list = _info?.increaseBid ?? const [];
    if (list.isEmpty || _select < 0 || _select >= list.length) return 0;
    return list[_select].toInt();
  }

  int get _raiseTo {
    final last = _info?.lastBid.toInt() ?? 0;
    return last + _addBid;
  }

  bool get _hasLastBid => (_info?.lastBid.toInt() ?? 0) > 0;

  static String _fmt(int value) {
    final raw = value.abs().toString();
    final buf = StringBuffer();
    for (var i = 0; i < raw.length; i++) {
      final fromEnd = raw.length - i;
      if (i > 0 && fromEnd % 3 == 0) buf.write(',');
      buf.write(raw[i]);
    }
    return value < 0 ? '-$buf' : buf.toString();
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    setState(() => _loading = true);
    final result = await ChimoApis.auction.bidInfo(widget.sessionId);
    if (!mounted) return;
    setState(() {
      _loading = false;
      if (result.ok && result.data != null) {
        _info = result.data;
        _select = 0;
      } else if (!result.ok) {
        AppToast.error(result.message.isEmpty ? 'Load bid info failed' : result.message);
      }
    });
  }

  Future<void> _bid() async {
    final info = _info;
    if (info == null || _addBid <= 0 || _bidding) return;
    if (info.balance.toInt() < _addBid) {
      AppToast.info('Insufficient balance');
      await AppJumper.toWallet();
      return;
    }
    setState(() => _bidding = true);
    final result = await ChimoApis.auction.bid(sessionId: widget.sessionId, amount: _addBid);
    if (!mounted) return;
    setState(() => _bidding = false);
    if (result.ok) {
      Get.back<void>();
      return;
    }
    if (result.code == AuctionBidSheet.balanceShortCode) {
      AppToast.info('Insufficient balance');
      await AppJumper.toWallet();
      return;
    }
    AppToast.error(result.message.isEmpty ? 'Bid failed' : result.message);
    await _refresh();
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
        child: _loading || _info == null
            ? SizedBox(
                height: 160.w,
                child: const Center(child: CupertinoActivityIndicator(color: AppColors.white)),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _header(),
                  SizedBox(height: 16.w),
                  _artistCard(_info!),
                  SizedBox(height: 16.w),
                  _balanceRow(_info!),
                  SizedBox(height: 12.w),
                  _increments(_info!),
                  SizedBox(height: 24.w),
                  _confirmBtn(),
                ],
              ),
      ),
    );
  }

  Widget _header() {
    return SizedBox(
      height: 28.w,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Text(
            'Raise Bid',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          Positioned(
            right: 0,
            top: 0,
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
    );
  }

  Widget _artistCard(AuctionBidInfo info) {
    final artist = widget.artist;
    final name = (artist?.name.trim().isNotEmpty == true) ? artist!.name : info.artist.nickname;
    final avatar = (artist?.avatar.trim().isNotEmpty == true) ? artist!.avatar : info.artist.avatar;
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 14.w, 12.w, 14.w),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          ClipOval(
            child: avatar.trim().isEmpty
                ? Container(
                    width: 48.w,
                    height: 48.w,
                    color: AppColors.white.withValues(alpha: 0.12),
                  )
                : Chimo.image(avatar, width: 48.w, height: 48.w, fit: BoxFit.cover),
          ),
          SizedBox(width: 10.w),
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
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 6.w),
                Row(
                  children: [
                    Text(
                      'Current Value: ',
                      style: TextStyle(
                        color: AppColors.white.withValues(alpha: 0.5),
                        fontSize: 12.sp,
                        height: 1.2,
                      ),
                    ),
                    Chimo.image(AppAssets.auctionCoin, width: 14.w, height: 14.w),
                    SizedBox(width: 2.w),
                    Text(
                      _fmt(info.currentValue.toInt()),
                      style: TextStyle(color: AppColors.yellowFDE42B, fontSize: 12.sp, height: 1.2),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Chimo.image(AppAssets.auctionCoin, width: 14.w, height: 14.w),
                  SizedBox(width: 2.w),
                  Text(
                    _fmt(info.lastBid.toInt()),
                    style: TextStyle(
                      color: AppColors.yellowFDE42B,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.w),
              Text(
                'Your Bid',
                style: TextStyle(
                  color: AppColors.white.withValues(alpha: 0.45),
                  fontSize: 12.sp,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _balanceRow(AuctionBidInfo info) {
    final raise = _fmt(_raiseTo);
    return Row(
      children: [
        Text(
          'Balance: ',
          style: TextStyle(
            color: AppColors.white.withValues(alpha: 0.5),
            fontSize: 12.sp,
            height: 1.2,
          ),
        ),
        Chimo.image(AppAssets.auctionCoin, width: 14.w, height: 14.w),
        SizedBox(width: 2.w),
        Text(
          _fmt(info.balance.toInt()),
          style: TextStyle(color: AppColors.yellowFDE42B, fontSize: 12.sp, height: 1.2),
        ),
        const Spacer(),
        Flexible(
          child: Text.rich(
            TextSpan(
              style: TextStyle(
                color: AppColors.white.withValues(alpha: 0.5),
                fontSize: 12.sp,
                height: 1.2,
              ),
              children: [
                const TextSpan(text: 'Raise bid to '),
                TextSpan(
                  text: '$raise Coins',
                  style: const TextStyle(color: AppColors.white),
                ),
              ],
            ),
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _increments(AuctionBidInfo info) {
    final list = info.increaseBid;
    if (list.isEmpty) {
      return Text('No bid steps', style: TextStyle(color: AppColors.white.withValues(alpha: 0.5)));
    }
    return GridView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 108 / 78,
        mainAxisSpacing: 9.w,
        crossAxisSpacing: 9.w,
      ),
      itemBuilder: (context, index) {
        final selected = index == _select;
        final amount = list[index].toInt();
        return GestureDetector(
          onTap: () => setState(() => _select = index),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: selected ? AppColors.green00F875 : AppColors.white.withValues(alpha: 0.08),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${_hasLastBid ? '+' : ''}${_fmt(amount)}',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                ),
                SizedBox(height: 2.w),
                Text(
                  'Coins',
                  style: TextStyle(
                    color: AppColors.white.withValues(alpha: 0.5),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _confirmBtn() {
    return GestureDetector(
      onTap: _bidding ? null : _bid,
      child: Opacity(
        opacity: _bidding ? 0.55 : 1,
        child: Container(
          height: 48.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: _bidding
              ? SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.black1C1C1E,
                  ),
                )
              : Text(
                  'Raise Bid',
                  style: TextStyle(
                    color: AppColors.black1C1C1E,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                ),
        ),
      ),
    );
  }
}

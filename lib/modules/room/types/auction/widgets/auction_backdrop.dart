import 'package:flutter/material.dart';
import 'package:forya_pag/pag.dart';

import '../../../../../app/network/http/media_upload.dart';

/// 拍卖房顶部循环 PAG。对齐 joyride `pag/auction_bg.pag`。
class AuctionBackdrop extends StatelessWidget {
  const AuctionBackdrop({super.key});

  /// Joyride：`StringUtil.formatCDNUrl('pag/auction_bg.pag')`
  static const path = '/ugc-media/static/pag/auction_bg.pag';

  static String get url => '${MediaUpload.cdnDomain}$path';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    // joyride 高度 315.w（设计宽 375）
    final height = width * (315 / 375);
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: width,
        height: height,
        child: PAGView.network(
          url,
          width: width,
          height: height,
          autoPlay: true,
          repeatCount: PAGView.REPEAT_COUNT_LOOP,
        ),
      ),
    );
  }
}

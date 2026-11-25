import 'package:card_swiper/card_swiper.dart';
import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/models/server_client/home_page/home_page_main.pb.dart';

/// 首页和房间 Tab 共用的竖向横幅。没有横幅时不占高度。
class HomeBannerSwiper extends StatelessWidget {
  const HomeBannerSwiper({super.key, required this.banners});

  final List<HomeBannerItem> banners;

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty) return const SizedBox.shrink();
    return Container(
      height: 100.w,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Swiper(
        autoplay: banners.length > 1,
        axisDirection: AxisDirection.up,
        scrollDirection: Axis.vertical,
        itemCount: banners.length,
        itemBuilder: (context, index) => Chimo.image(banners[index].img1, fit: BoxFit.cover),
        onTap: (index) => AppJumper.openLink(banners[index].link),
      ),
    );
  }
}

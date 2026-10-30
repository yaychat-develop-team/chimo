import 'package:flutter/material.dart';

import '../../../../common/constants/app_assets.dart';
import 'package:chimo/common/utils/chimo.dart';

class HomeSearchHeader extends StatelessWidget {
  const HomeSearchHeader({super.key, this.onSearchTap});

  /// 搜索按钮点击回调。
  final VoidCallback? onSearchTap;

  static const double logoHeight = 28;
  static const double searchSize = 36;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Row(
        children: [
          Chimo.image(AppAssets.homeTitle, height: logoHeight, fit: BoxFit.contain),
          const Spacer(),
          GestureDetector(
            onTap: onSearchTap,
            behavior: HitTestBehavior.opaque,
            child: Chimo.image(
              AppAssets.homeSearchBtn,
              width: searchSize,
              height: searchSize,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

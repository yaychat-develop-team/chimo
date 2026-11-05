import 'package:flutter/widgets.dart';

/// 拍卖浮层占位。引导与 Place Bid 已迁到 [AuctionBidBar]。
class AuctionOverlay extends StatelessWidget {
  const AuctionOverlay({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

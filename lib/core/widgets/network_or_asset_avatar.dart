import 'package:flutter/material.dart';

/// 头像优先使用远程 [url]，否则回退到本地 [asset]。
class NetworkOrAssetAvatar extends StatelessWidget {
  const NetworkOrAssetAvatar({
    super.key,
    required this.asset,
    this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  final String asset;
  final String? url;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final remote = url?.trim();
    if (remote != null && remote.isNotEmpty) {
      return Image.network(
        remote,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (_, error, stackTrace) => Image.asset(
          asset,
          width: width,
          height: height,
          fit: fit,
        ),
      );
    }
    return Image.asset(asset, width: width, height: height, fit: fit);
  }
}

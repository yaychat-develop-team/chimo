import 'package:flutter/material.dart';

import 'app_network_image.dart';

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

  Widget _asset() => Image.asset(asset, width: width, height: height, fit: fit);

  @override
  Widget build(BuildContext context) {
    final remote = url?.trim();
    if (remote != null && remote.isNotEmpty) {
      return AppNetworkImage(
        remote,
        width: width,
        height: height,
        fit: fit,
        fadeInDuration: Duration.zero,
        placeholder: (_, _) => _asset(),
        errorWidget: (_, _, _) => _asset(),
      );
    }
    return _asset();
  }
}

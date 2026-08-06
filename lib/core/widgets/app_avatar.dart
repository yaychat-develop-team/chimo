import 'package:flutter/material.dart';

import 'network_or_asset_avatar.dart';

/// Circular avatar convenience wrapper around [NetworkOrAssetAvatar].
class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    required this.asset,
    this.url,
    this.size = 40,
  });

  final String asset;
  final String? url;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: NetworkOrAssetAvatar(
          asset: asset,
          url: url,
          width: size,
          height: size,
        ),
      ),
    );
  }
}

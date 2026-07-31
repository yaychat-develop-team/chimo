import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';

/// Top bubble background (legacy; use [MeHeaderSection] for full header).
class MeHeaderBanner extends StatelessWidget {
  const MeHeaderBanner({super.key, this.height = 168});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Image.asset(
        AppAssets.mineBgTop,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
  }
}

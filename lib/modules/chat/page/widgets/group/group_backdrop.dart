import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/widgets/app_image.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/group/group.pb.dart';

/// 群聊页顶部那条模糊头图：群头像放大模糊 + 一层往下收到底色的渐变。
///
/// 只是装饰，不接任何点击 —— 应用栏与头部盖在它上面（页面 `Stack` 里排在后面）。
/// 高度由外面那个 `Positioned` 定（`260 + topPadding`），这里跟着撑满。
class GroupBackdrop extends StatelessWidget {
  const GroupBackdrop({super.key, required this.group});

  final GroupInfo group;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: AppImage(
            group.avatar,
            fallbackAsset: AppAssets.avatarPlace,
            fit: BoxFit.cover,
            fadeIn: Duration.zero,
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black.withValues(alpha: 0.45), AppColors.background],
            ),
          ),
        ),
      ],
    );
  }
}

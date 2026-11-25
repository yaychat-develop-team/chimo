import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/heart_link.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/chimo.dart';

/// Heart Link 提示弹窗。对齐 oumi `HtController.showMicOnDialog` / `showNewUserDialog`。
abstract final class HeartLinkTipsDialog {
  static bool _showing = false;

  /// 嘉宾被抱上麦：开麦提示。
  static Future<void> showMicOn() {
    return _show(
      title: 'Join the Chat!',
      content: 'The host has invited you to speak.\n Start talking on mic!',
      image: Chimo.image(
        AppAssets.htMicOnTipsImg,
        height: 130,
        fit: BoxFit.fitHeight,
      ),
      imageHeight: 130,
      topPadding: 56,
    );
  }

  /// Host 侧：有用户进房。
  static Future<void> showNewUser(HeartLinkInfo info) {
    final name = info.name1.trim().isEmpty ? 'Someone' : info.name1.trim();
    return _show(
      contentWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Chimo.image(
              info.avatar1,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
              fallbackAsset: AppAssets.avatarPlace,
            ),
          ),
          const SizedBox(height: 12),
          Text.rich(
            TextSpan(
              style: const TextStyle(
                color: AppColors.black1F2518,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.35,
              ),
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: _brandName(name),
                ),
                const TextSpan(text: "'s in the room—invite him to join the fun! "),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      topPadding: 24,
    );
  }

  static Widget _brandName(String name) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (rect) => const LinearGradient(
        colors: [Color(0xFF4843FE), Color(0xFFFF4BA7)],
      ).createShader(rect),
      child: Text(
        name,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static Future<void> _show({
    String? title,
    String? content,
    Widget? image,
    Widget? contentWidget,
    double imageHeight = 0,
    double topPadding = 24,
  }) async {
    if (_showing) return;
    _showing = true;
    try {
      await Get.dialog<void>(
        PopScope(
          canPop: false,
          child: Dialog(
            backgroundColor: AppColors.transparent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 48),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: image == null ? 0 : 42),
                  padding: EdgeInsets.fromLTRB(24, topPadding, 24, 24),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(24),
                    image: const DecorationImage(
                      image: AssetImage(AppAssets.htSendGiftBg),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (image != null) SizedBox(height: imageHeight - 42),
                      if (title != null && title.isNotEmpty) ...[
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.black1F2518,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        if (content != null) const SizedBox(height: 6),
                      ],
                      if (content != null && content.isNotEmpty)
                        Text(
                          content,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.gray6E6E6E,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            height: 1.35,
                          ),
                        ),
                      ?contentWidget,
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: () => AppJumper.back(),
                        child: Container(
                          height: 44,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            gradient: AppColors.primaryGradient,
                          ),
                          child: const Text(
                            'Got It',
                            style: TextStyle(
                              color: AppColors.black1F2518,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ?image,
              ],
            ),
          ),
        ),
        barrierDismissible: false,
        barrierColor: AppColors.black.withValues(alpha: 0.7),
      );
    } finally {
      _showing = false;
    }
  }
}

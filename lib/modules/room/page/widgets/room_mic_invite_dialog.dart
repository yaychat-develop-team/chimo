import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../app/chimo_api.dart';
import '../../../../common/models/server_client/mass.pb.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/app_toast.dart';

/// 上麦邀请弹窗。对齐 joyride `MicInviteDialog`。
abstract final class RoomMicInviteDialog {
  static bool _showing = false;

  static Future<void> show(InviteInfo info) async {
    if (_showing) return;
    _showing = true;
    final name = info.hasInviter() && info.inviter.nickname.trim().isNotEmpty
        ? info.inviter.nickname.trim()
        : 'Someone';
    try {
      await Get.dialog<void>(
        Dialog(
          backgroundColor: AppColors.white,
          insetPadding: const EdgeInsets.symmetric(horizontal: 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Mic Invitation',
                  style: TextStyle(
                    color: AppColors.black1F2518,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      color: AppColors.gray6E6E6E,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (rect) => const LinearGradient(
                            colors: [Color(0xFFFF41FF), Color(0xFF6922FF)],
                          ).createShader(rect),
                          child: Text(
                            name,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const TextSpan(text: ' invited you to speak'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _handle(info, 0),
                        child: Container(
                          height: 42,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFECEDFF),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: const Text(
                            'Not Now',
                            style: TextStyle(
                              color: AppColors.black1F2518,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _handle(info, 1),
                        child: Container(
                          height: 42,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            gradient: AppColors.primaryGradient,
                          ),
                          child: const Text(
                            'Got it',
                            style: TextStyle(
                              color: AppColors.black1F2518,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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

  static Future<void> _handle(InviteInfo info, int result) async {
    final rsp = await ChimoApis.room.handleUpMic(
      result: result,
      grantUpMic: info.hasGrantUpMic() ? info.grantUpMic : null,
    );
    if (!rsp.ok) {
      AppToast.error(rsp.message.isEmpty ? 'Failed' : rsp.message);
      return;
    }
    AppJumper.back();
  }
}

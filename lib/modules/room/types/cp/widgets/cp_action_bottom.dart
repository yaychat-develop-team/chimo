import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/models/server_client/room_cp.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/theme/app_dialog.dart';
import '../../../../../common/utils/app_toast.dart';
import '../logic/cp_logic.dart';
import 'cp_relation_sheet.dart';

/// 底部操作条。对齐 joyride `CPActionBottom`（含管理员 Start/Next/End/授关系）。
class CpActionBottom extends StatelessWidget {
  const CpActionBottom({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CpLogic>()) return const SizedBox.shrink();
    final logic = Get.find<CpLogic>();
    return Obx(() {
      logic.info.value;
      logic.busy.value;
      final stage = logic.stage;
      final admin = logic.isCpAdmin;
      final joined = logic.onMic;
      final started = logic.started;
      final atHand = stage == CPStage.hand;

      final actions = <Widget>[
        _pill(
          label: 'Game Rules',
          filled: false,
          onTap: () {
            AppDialog.show(
              title: 'Game Rules',
              content:
                  '1) Join a guest seat before the game starts.\n'
                  '2) Match Line → Flipped → Matched.\n'
                  '3) Host advances stages and bestows relation at Matched.\n'
                  '4) Bless the couple with gifts during Matched.',
              confirmLabel: 'Got it',
            );
          },
        ),
        if (!joined && !started) _pill(label: 'Join now', filled: true, onTap: logic.joinMic),
        if (admin) ...[
          if (!started)
            _pill(label: 'Start Game', filled: true, onTap: () => _run(logic.start))
          else if (atHand)
            _pill(label: 'Bestow Relation', filled: true, onTap: () => CpRelationSheet.show())
          else
            _pill(label: 'Next Step', filled: true, onTap: () => _run(logic.next)),
          if (started) _pill(label: 'Close Game', filled: true, onTap: () => _confirmEnd(logic)),
        ],
      ];

      final children = <Widget>[];
      for (var i = 0; i < actions.length; i++) {
        if (i > 0) children.add(SizedBox(width: 16.w));
        children.add(actions[i]);
      }
      return Row(mainAxisSize: MainAxisSize.min, children: children);
    });
  }

  Future<void> _run(Future<String?> Function() action) async {
    final failure = await action();
    if (failure != null) AppToast.error(failure);
  }

  Future<void> _confirmEnd(CpLogic logic) async {
    final ok = await AppDialog.show(
      title: 'Tips',
      content: 'Close the CP game for everyone?',
      confirmLabel: 'Close',
      cancelLabel: 'Cancel',
      buttons: DialogLoyoutStyle.horizontal,
    );
    if (ok != true) return;
    await _run(logic.end);
  }

  Widget _pill({required String label, required bool filled, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 28.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: filled ? AppColors.cpGradient : null,
          color: filled ? null : AppColors.black.withValues(alpha: 0.24),
          borderRadius: BorderRadius.circular(14.r),
          border: filled ? null : Border.all(color: AppColors.white50, width: 1),
        ),
        child: Text(
          label,
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 11.sp,
            fontWeight: filled ? FontWeight.w600 : FontWeight.w400,
            height: 1,
          ),
        ),
      ),
    );
  }
}

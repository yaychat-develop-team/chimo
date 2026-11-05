import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/app_toast.dart';
import '../../service/room_service.dart';

/// 房间隐私。对齐 joyride `ToolPrivacyWidget`。
Future<void> showRoomPrivacySheet() {
  final service = RoomService.findOrNull();
  if (service == null || !service.inRoom.value) {
    AppToast.info('Not in a room');
    return Future.value();
  }
  return AppBottomSheet.show<void>(
    isScrollControlled: true,
    child: _RoomPrivacySheet(service: service),
  );
}

class _RoomPrivacySheet extends StatefulWidget {
  const _RoomPrivacySheet({required this.service});

  final RoomService service;

  @override
  State<_RoomPrivacySheet> createState() => _RoomPrivacySheetState();
}

class _RoomPrivacySheetState extends State<_RoomPrivacySheet> {
  late bool _lock;
  late bool _privacy;
  final _pwd = TextEditingController();
  var _loading = true;

  @override
  void initState() {
    super.initState();
    _lock = widget.service.hasPassword.value;
    _privacy = widget.service.isPrivacy.value;
    _loadPassword();
  }

  Future<void> _loadPassword() async {
    final pwd = await widget.service.fetchRoomPassword();
    if (!mounted) return;
    if (pwd != null && pwd.isNotEmpty) _pwd.text = pwd;
    setState(() => _loading = false);
  }

  @override
  void dispose() {
    _pwd.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final failure = await widget.service.updatePrivacy(
      lock: _lock,
      password: _pwd.text.trim(),
      privacy: _privacy,
    );
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    AppJumper.back();
    AppToast.info('Saved');
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.black1C1C1E,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 20.w, 16.w, 20.w + bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Privacy',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.w),
            _row(
              'Room Password',
              CupertinoSwitch(
                value: _lock,
                activeTrackColor: AppColors.green1BBA77,
                onChanged: (v) => setState(() => _lock = v),
              ),
            ),
            SizedBox(height: 10.w),
            TextField(
              controller: _pwd,
              enabled: _lock && !_loading,
              maxLength: 4,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: TextStyle(color: AppColors.white, fontSize: 18.sp, letterSpacing: 8),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                counterText: '',
                hintText: _loading ? 'Loading…' : '····',
                hintStyle: TextStyle(
                  color: AppColors.white.withValues(alpha: 0.3),
                  fontSize: 18.sp,
                  letterSpacing: 8,
                ),
                filled: true,
                fillColor: AppColors.white.withValues(alpha: 0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 14.w),
              ),
            ),
            SizedBox(height: 20.w),
            _row(
              'Privacy Mode',
              CupertinoSwitch(
                value: _privacy,
                activeTrackColor: AppColors.green1BBA77,
                onChanged: (v) => setState(() => _privacy = v),
              ),
            ),
            SizedBox(height: 20.w),
            SizedBox(
              width: double.infinity,
              height: 48.w,
              child: FilledButton(
                onPressed: _save,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.green29EEAA,
                  foregroundColor: AppColors.black111111,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String title, Widget trailing) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.white.withValues(alpha: 0.8),
              fontSize: 14.sp,
            ),
          ),
        ),
        trailing,
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../app/chimo_api.dart';
import '../../../../common/models/server_client/rtc.pb.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_dialog.dart';
import '../../../../common/utils/app_toast.dart';
import '../../service/room_service.dart';
import 'room_background_sheet.dart';
import 'room_privacy_sheet.dart';

/// 房间设置。对齐 joyride `ToolInformationWidget`。
Future<void> showRoomSettingSheet() {
  final service = RoomService.findOrNull();
  if (service == null || !service.inRoom.value) {
    AppToast.info('Not in a room');
    return Future.value();
  }
  if (!service.isOwnerOrReceptionist) {
    AppToast.info('No permission');
    return Future.value();
  }
  return AppBottomSheet.show<void>(
    isScrollControlled: true,
    child: const _RoomSettingSheet(),
  );
}

class _RoomSettingSheet extends StatelessWidget {
  const _RoomSettingSheet();

  @override
  Widget build(BuildContext context) {
    final service = RoomService.findOrNull();
    if (service == null) return const SizedBox.shrink();
    final bottom = MediaQuery.paddingOf(context).bottom;
    final maxH = MediaQuery.sizeOf(context).height * 0.8;
    return Obx(() {
      service.title.value;
      service.theme.value;
      service.notice.value;
      service.layoutName.value;
      service.freePub.value;
      return DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.black1C1C1E,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxH),
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16.w, 20.w, 16.w, 20.w + bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Room Setting',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.w),
                _TextField(
                  title: 'Room Name',
                  content: service.title.value,
                  hint: 'Enter room name',
                  maxLength: 30,
                  onSubmit: (v) => _run(() => service.updateTitle(v)),
                ),
                _TextField(
                  title: 'Topic',
                  content: service.theme.value,
                  hint: 'Enter room topic',
                  maxLength: 60,
                  onSubmit: (v) => _run(() => service.updateTheme(v)),
                ),
                _TextField(
                  title: 'Bulletin',
                  content: service.notice.value,
                  hint: 'Enter bulletin',
                  maxLength: 1500,
                  maxLines: 3,
                  onSubmit: (v) => _run(() => service.updateNotice(v)),
                ),
                if (!service.isCpRoom && !service.isAuctionRoom)
                  _NavRow(
                    title: 'Mic Layout',
                    value: service.layoutName.value,
                    onTap: () => _pickMicLayout(service),
                  ),
                _NavRow(
                  title: 'Background',
                  value: '',
                  onTap: () async {
                    await showRoomBackgroundSheet();
                  },
                ),
                _NavRow(
                  title: 'Privacy',
                  value: '',
                  onTap: () async {
                    await showRoomPrivacySheet();
                  },
                ),
                _SwitchRow(
                  title: 'Free Mic',
                  value: service.freePub.value,
                  onChanged: (_) => _run(service.toggleFreePub),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<void> _run(Future<String?> Function() action) async {
    final failure = await action();
    if (failure != null) AppToast.error(failure);
  }

  Future<void> _pickMicLayout(RoomService service) async {
    final result = await ChimoApis.room.micLayouts(service.rid);
    if (!result.ok || result.data == null || result.data!.layoutItem.isEmpty) {
      AppToast.error(result.message.isEmpty ? 'No layouts' : result.message);
      return;
    }
    final items = result.data!.layoutItem.toList();
    final selected = await AppBottomSheet.actions<MicLayoutItem>(
      buildItems: () {
        final list = <AppSheetAction>[];
        for (final item in items) {
          final current = service.micLayout == item.layout;
          list.add(
            AppSheetAction(
              label: item.layoutName,
              color: current ? AppColors.green29EEAA : null,
              onTap: () => AppJumper.back(result: item),
            ),
          );
        }
        list.add(AppSheetAction(label: 'Cancel', onTap: () => AppJumper.back()));
        return list;
      },
    );
    if (selected == null) return;
    await _run(() => service.updateMicLayout(selected));
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    required this.title,
    required this.content,
    required this.hint,
    required this.maxLength,
    required this.onSubmit,
    this.maxLines = 1,
  });

  final String title;
  final String content;
  final String hint;
  final int maxLength;
  final int maxLines;
  final ValueChanged<String> onSubmit;

  @override
  Widget build(BuildContext context) {
    final empty = content.trim().isEmpty;
    return Padding(
      padding: EdgeInsets.only(bottom: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.white.withValues(alpha: 0.8),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.w),
          GestureDetector(
            onTap: () => _edit(context),
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: double.infinity,
              height: maxLength > 100 ? 96.w : 48.w,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                empty ? hint : content,
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: empty
                      ? AppColors.white.withValues(alpha: 0.38)
                      : AppColors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _edit(BuildContext context) async {
    final controller = TextEditingController(text: content);
    final ok = await AppDialog.show(
      title: title,
      confirmLabel: 'Save',
      cancelLabel: 'Cancel',
      buttons: DialogLoyoutStyle.horizontal,
      contentWidget: TextField(
        controller: controller,
        autofocus: true,
        maxLines: maxLength > 100 ? 5 : 1,
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        style: const TextStyle(color: AppColors.gray6E6E6E, fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.gray6E6E6E.withValues(alpha: 0.5)),
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xFFF3F3F3),
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
    if (ok == true) onSubmit(controller.text);
    controller.dispose();
  }
}

class _NavRow extends StatelessWidget {
  const _NavRow({
    required this.title,
    required this.value,
    required this.onTap,
  });

  final String title;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.w),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 48.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
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
              if (value.isNotEmpty)
                Flexible(
                  child: Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.white.withValues(alpha: 0.5),
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              SizedBox(width: 4.w),
              Icon(
                Icons.chevron_right,
                color: AppColors.white.withValues(alpha: 0.4),
                size: 20.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SwitchRow extends StatelessWidget {
  const _SwitchRow({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: Row(
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
          CupertinoSwitch(
            value: value,
            activeTrackColor: AppColors.green1BBA77,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

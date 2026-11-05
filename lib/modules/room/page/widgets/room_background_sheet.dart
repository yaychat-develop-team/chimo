import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/app_jumper.dart';
import '../../../../app/chimo_api.dart';
import '../../../../common/models/server_client/rtc.pb.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../../common/widgets/app_image.dart';
import '../../service/room_service.dart';

/// 房间背景选择。对齐 joyride `ChooseBackgroundPage`。
Future<void> showRoomBackgroundSheet() {
  final service = RoomService.findOrNull();
  if (service == null || !service.inRoom.value) {
    AppToast.info('Not in a room');
    return Future.value();
  }
  return AppBottomSheet.show<void>(
    isScrollControlled: true,
    child: _RoomBackgroundSheet(service: service),
  );
}

class _RoomBackgroundSheet extends StatefulWidget {
  const _RoomBackgroundSheet({required this.service});

  final RoomService service;

  @override
  State<_RoomBackgroundSheet> createState() => _RoomBackgroundSheetState();
}

class _RoomBackgroundSheetState extends State<_RoomBackgroundSheet> {
  List<BackgroundItem> _items = const [];
  BackgroundItem? _selected;
  var _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final type = widget.service.roomType ?? RoomType.MAKE_FRIENDS;
    final result = await ChimoApis.room.backgrounds(roomType: type);
    if (!mounted) return;
    if (!result.ok || result.data == null) {
      setState(() => _loading = false);
      AppToast.error(result.message.isEmpty ? 'Load failed' : result.message);
      return;
    }
    final list = result.data!.backgrounds.toList();
    BackgroundItem? current;
    final url = widget.service.background.value;
    for (final item in list) {
      if (item.url == url) {
        current = item;
        break;
      }
    }
    setState(() {
      _items = list;
      _selected = current;
      _loading = false;
    });
  }

  Future<void> _save() async {
    final item = _selected;
    if (item == null) {
      AppToast.info('Please select a background');
      return;
    }
    final failure = await widget.service.updateBackground(item);
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
      child: SizedBox(
        height: 522.w,
        child: Column(
          children: [
            SizedBox(height: 20.w),
            Text(
              'Background',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 24.w),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12.w,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 100 / 120,
                      ),
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        final selected = _selected?.url == item.url;
                        return GestureDetector(
                          onTap: () => setState(() => _selected = item),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: selected
                                    ? const Color(0xFFFFD400)
                                    : Colors.transparent,
                                width: 3,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.r),
                              child: AppImage.image(
                                item.url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 12.w, 16.w, 12.w + bottom),
              child: SizedBox(
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
            ),
          ],
        ),
      ),
    );
  }
}

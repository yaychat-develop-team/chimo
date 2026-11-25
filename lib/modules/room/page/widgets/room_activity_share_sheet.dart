import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/app_jumper.dart';
import '../../../../app/chimo_api.dart';
import '../../../../common/models/server_client/activity_share.pb.dart';
import '../../../../common/theme/app_bottom_sheet.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../../common/utils/chimo.dart';
import '../../service/room_service.dart';

/// 活动分享。对齐 joyride `ActivityShareDialog`。
///
/// [fromRoom] true：分享到当前房公屏；false：分享到 [toUid] 私聊。
abstract final class RoomActivityShareSheet {
  static Future<void> show({bool fromRoom = true, int? toUid}) {
    return AppBottomSheet.show<void>(
      isScrollControlled: true,
      child: _ActivityShareBody(fromRoom: fromRoom, toUid: toUid),
    );
  }
}

class _ActivityShareBody extends StatefulWidget {
  const _ActivityShareBody({required this.fromRoom, this.toUid});

  final bool fromRoom;
  final int? toUid;

  @override
  State<_ActivityShareBody> createState() => _ActivityShareBodyState();
}

class _ActivityShareBodyState extends State<_ActivityShareBody> {
  var _loading = true;
  var _sharing = false;
  List<ShareableActivityItem> _list = const [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final result = await ChimoApis.room.shareActivityList();
    if (!mounted) return;
    if (!result.ok) {
      setState(() {
        _loading = false;
        _list = const [];
      });
      AppToast.error(result.message.isEmpty ? 'Load failed' : result.message);
      return;
    }
    setState(() {
      _loading = false;
      _list = result.data?.list.toList() ?? const [];
    });
  }

  Future<void> _share(ShareableActivityItem item) async {
    if (_sharing) return;
    final activityId = item.activityId.toInt();
    if (activityId <= 0) return;
    _sharing = true;
    if (widget.fromRoom) {
      final rid = RoomService.findOrNull()?.rid ?? 0;
      if (rid <= 0) {
        _sharing = false;
        AppToast.info('Not in a room');
        return;
      }
      final result = await ChimoApis.room.shareActivityToRoom(
        activityId: activityId,
        rid: rid,
      );
      _sharing = false;
      if (!mounted) return;
      if (!result.ok) {
        AppToast.error(result.message.isEmpty ? 'Share failed' : result.message);
        return;
      }
      AppJumper.back();
      AppToast.success('Shared to room');
      return;
    }
    final uid = widget.toUid ?? 0;
    if (uid <= 0) {
      _sharing = false;
      AppToast.info('Invalid user');
      return;
    }
    final result = await ChimoApis.room.shareActivityToChat(
      activityId: activityId,
      toUid: uid,
    );
    _sharing = false;
    if (!mounted) return;
    if (!result.ok) {
      AppToast.error(result.message.isEmpty ? 'Share failed' : result.message);
      return;
    }
    AppJumper.back();
    AppToast.success('Shared');
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final maxH = MediaQuery.sizeOf(context).height * 0.75;
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxH, minHeight: maxH * 0.66),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 24.w, 20.w, 12.w + bottom),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      'Choose a Event to share',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.black1F2518,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => AppJumper.back(),
                    child: const Icon(Icons.close, color: Color(0xFFD5D5D5), size: 16),
                  ),
                ],
              ),
              Expanded(child: _content()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _content() {
    if (_loading) {
      return const Center(child: CupertinoActivityIndicator());
    }
    if (_list.isEmpty) {
      return Center(
        child: GestureDetector(
          onTap: _load,
          child: Text(
            'No events\nTap to retry',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.gray6E6E6E, fontSize: 13.sp),
          ),
        ),
      );
    }
    return ListView.separated(
      padding: EdgeInsets.only(top: 20.w, bottom: 24.w),
      itemCount: _list.length,
      separatorBuilder: (_, _) => SizedBox(height: 10.w),
      itemBuilder: (context, index) {
        final item = _list[index];
        return GestureDetector(
          onTap: () => _share(item),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: AspectRatio(
              aspectRatio: 343 / 100,
              child: Chimo.image(
                item.cardImageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
        );
      },
    );
  }
}

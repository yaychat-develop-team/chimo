import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/commodity.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/theme/app_bottom_sheet.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/chimo.dart';
import '../../../common/widgets/app_image.dart';
import '../../chat/logic/chats_list_logic.dart';
import '../../chat/model/conversation_model.dart';
import '../logic/my_frame_logic.dart';
import '../model/commodity_display.dart';
import 'dress_stars.dart';

/// 装扮赠送：选人 → 确认数量。
Future<void> showDressGiftSheet({required MyFrameLogic logic, required CommodityItem item}) {
  return AppBottomSheet.show<void>(
    isScrollControlled: true,
    child: _DressGiftSheet(logic: logic, item: item),
  );
}

enum _GiftTab { recent, friends }

class _GiftTarget {
  const _GiftTarget({
    required this.uid,
    required this.name,
    required this.avatar,
    required this.isMale,
  });

  final int uid;
  final String name;
  final String avatar;
  final bool isMale;
}

class _DressGiftSheet extends StatefulWidget {
  const _DressGiftSheet({required this.logic, required this.item});

  final MyFrameLogic logic;
  final CommodityItem item;

  @override
  State<_DressGiftSheet> createState() => _DressGiftSheetState();
}

class _DressGiftSheetState extends State<_DressGiftSheet> {
  _GiftTab _tab = _GiftTab.recent;
  var _recent = const <_GiftTarget>[];
  var _friends = const <_GiftTarget>[];
  var _loadingRecent = false;
  var _loadingFriends = false;

  @override
  void initState() {
    super.initState();
    _loadRecent();
    _loadFriends();
  }

  Future<int> _resolveUid(ConversationModel c) async {
    final parsed = c.parsedAppUid;
    if (parsed > 0) return parsed;
    final em = c.emUserName.trim().isNotEmpty ? c.emUserName.trim() : _emFromId(c.id);
    if (em.isEmpty) return 0;
    final asUid = int.tryParse(em);
    if (asUid != null && asUid > 0) return asUid;
    try {
      final res = await ChimoApis.relation.msgUser(em);
      final id = res.data?.id.toInt() ?? 0;
      if (id > 0 && Get.isRegistered<ConversationListLogic>()) {
        Get.find<ConversationListLogic>().rememberPeerAppUid(emUserName: em, appUid: '$id');
      }
      return id;
    } catch (_) {
      return 0;
    }
  }

  String _emFromId(String id) {
    var bare = id.trim();
    if (bare.startsWith('dm_')) bare = bare.substring(3);
    if (bare.startsWith('sys_')) bare = bare.substring(4);
    if (bare.isEmpty || int.tryParse(bare) != null) return '';
    return bare;
  }

  Future<void> _loadRecent() async {
    setState(() => _loadingRecent = true);
    try {
      if (!Get.isRegistered<ConversationListLogic>()) {
        if (!mounted) return;
        setState(() {
          _recent = const [];
          _loadingRecent = false;
        });
        return;
      }
      final chats = Get.find<ConversationListLogic>().visibleConversations
          .where((c) => c.badge != ChatBadgeType.group && !c.isSystem)
          .toList();
      final resolved = await Future.wait(
        chats.map((c) async {
          final uid = await _resolveUid(c);
          if (uid <= 0) return null;
          return _GiftTarget(
            uid: uid,
            name: c.title.trim().isEmpty ? 'User' : c.title.trim(),
            avatar: (c.avatarUrl ?? '').trim(),
            isMale: c.isMale,
          );
        }),
      );
      if (!mounted) return;
      final out = <_GiftTarget>[];
      final seen = <int>{};
      for (final item in resolved) {
        if (item == null || !seen.add(item.uid)) continue;
        out.add(item);
      }
      setState(() {
        _recent = out;
        _loadingRecent = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _recent = const [];
        _loadingRecent = false;
      });
    }
  }

  Future<void> _loadFriends() async {
    setState(() => _loadingFriends = true);
    try {
      final res = await ChimoApis.relation.searchFriends(pageSize: 100);
      if (!mounted) return;
      final out = <_GiftTarget>[];
      for (final user in res.data ?? const <User>[]) {
        if (user.id.toInt() <= 0) continue;
        out.add(
          _GiftTarget(
            uid: user.id.toInt(),
            name: user.nickname.trim().isEmpty ? 'User' : user.nickname.trim(),
            avatar: user.shownAvatar,
            isMale: user.male,
          ),
        );
      }
      setState(() {
        _friends = out;
        _loadingFriends = false;
      });
      if (!res.ok && out.isEmpty) {
        AppToast.error(res.message.isEmpty ? 'Failed to load friends' : res.message);
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => _loadingFriends = false);
      AppToast.error('Failed to load friends');
    }
  }

  Future<void> _onSend(_GiftTarget target) async {
    final ok = await _showDressGiftConfirm(logic: widget.logic, item: widget.item, target: target);
    if (ok == true && mounted) Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final loading = _tab == _GiftTab.recent ? _loadingRecent : _loadingFriends;
    final list = _tab == _GiftTab.recent ? _recent : _friends;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF16161E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: SizedBox(
        height: 0.68.sh,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Center(
              child: Container(
                width: 36.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.white20,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 12.h, 8.w, 4.h),
              child: Row(
                children: [
                  SizedBox(width: 32.w),
                  Expanded(
                    child: Text(
                      'Send Gift',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: Get.back,
                    icon: Icon(Icons.close, color: AppColors.white70, size: 22.w),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  _tabChip('Recent Chat', _tab == _GiftTab.recent, () {
                    setState(() => _tab = _GiftTab.recent);
                  }),
                  SizedBox(width: 24.w),
                  _tabChip('Friends', _tab == _GiftTab.friends, () {
                    setState(() => _tab = _GiftTab.friends);
                  }),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: loading
                  ? const Center(
                      child: CircularProgressIndicator(color: AppColors.green00FEA8),
                    )
                  : list.isEmpty
                  ? Center(
                      child: Text(
                        _tab == _GiftTab.recent ? 'No recent chats' : 'No friends yet',
                        style: TextStyle(color: AppColors.white50, fontSize: 14.sp),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, bottom + 16.h),
                      itemCount: list.length,
                      separatorBuilder: (_, _) => SizedBox(height: 10.h),
                      itemBuilder: (_, i) => _row(list[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabChip(String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: selected ? AppColors.white : AppColors.white50,
              fontSize: 15.sp,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            width: 28.w,
            height: 2.h,
            color: selected ? AppColors.green00FEA8 : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _row(_GiftTarget target) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(color: AppColors.white8, borderRadius: BorderRadius.circular(14.r)),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AppImage.avatar(target.avatar, size: 44.w),
              PositionedDirectional(
                end: -2,
                bottom: -2,
                child: Chimo.image(
                  target.isMale ? AppAssets.genderMan : AppAssets.genderWoman,
                  width: 14.w,
                  height: 14.w,
                ),
              ),
            ],
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  target.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'ID: ${target.uid}',
                  style: TextStyle(color: AppColors.white50, fontSize: 12.sp),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _onSend(target),
            child: Container(
              height: 32.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                'Send',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<bool?> _showDressGiftConfirm({
  required MyFrameLogic logic,
  required CommodityItem item,
  required _GiftTarget target,
}) {
  return AppBottomSheet.show<bool>(
    isScrollControlled: true,
    child: _DressGiftConfirm(logic: logic, item: item, target: target),
  );
}

class _DressGiftConfirm extends StatefulWidget {
  const _DressGiftConfirm({required this.logic, required this.item, required this.target});

  final MyFrameLogic logic;
  final CommodityItem item;
  final _GiftTarget target;

  @override
  State<_DressGiftConfirm> createState() => _DressGiftConfirmState();
}

class _DressGiftConfirmState extends State<_DressGiftConfirm> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = 1;
  }

  int get _max => widget.item.num;

  Future<void> _confirm() async {
    final err = await widget.logic.giveTo(
      receiverId: '${widget.target.uid}',
      item: widget.item,
      count: _count,
    );
    if (!mounted) return;
    if (err != null) {
      AppToast.error(err);
      return;
    }
    AppToast.success('Gift sent');
    Get.back(result: true);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final item = widget.item;
    final duration = CommodityDisplay.cardDateDesc(item);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF16161E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, bottom + 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 36.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.white20,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(
                height: 48.h,
                child: Row(
                  children: [
                    SizedBox(width: 40.w),
                    Expanded(
                      child: Text(
                        'Confirm Gift',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: IconButton(
                        onPressed: Get.back,
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.close, color: AppColors.white70, size: 22.w),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.white8,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 72.w,
                      height: 72.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.green00FEA8, width: 1.5),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Chimo.image(item.url, fit: BoxFit.contain),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              DressStars(level: item.level, dense: true),
                              if (duration.isNotEmpty) ...[
                                Text(
                                  '  |  ',
                                  style: TextStyle(color: AppColors.white50, fontSize: 12.sp),
                                ),
                                Flexible(
                                  child: Text(
                                    duration,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: AppColors.white50, fontSize: 12.sp),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          SizedBox(height: 6.h),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'TO: ',
                                  style: TextStyle(
                                    color: AppColors.white50,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.target.name,
                                  style: TextStyle(
                                    color: AppColors.green00FEA8,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              Row(
                children: [
                  Text(
                    'Available: ${item.num}',
                    style: TextStyle(color: AppColors.white50, fontSize: 14.sp),
                  ),
                  const Spacer(),
                  _QtyStepper(count: _count, max: _max, onChanged: (v) => setState(() => _count = v)),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: Get.back,
                      child: Container(
                        height: 48.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.white12,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: AppColors.white70,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Obx(() {
                      final busy = widget.logic.giving.value;
                      return GestureDetector(
                        onTap: busy ? null : _confirm,
                        child: Container(
                          height: 48.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: busy
                              ? SizedBox(
                                  width: 22.w,
                                  height: 22.w,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.black,
                                  ),
                                )
                              : Text(
                                  'Confirm Send',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 设计图：独立圆形 − / +，中间数字。
class _QtyStepper extends StatelessWidget {
  const _QtyStepper({required this.count, required this.max, required this.onChanged});

  final int count;
  final int max;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _circleBtn(Icons.remove, count > 1, () => onChanged(count - 1)),
        SizedBox(
          width: 36.w,
          child: Text(
            '$count',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.white, fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
        ),
        _circleBtn(Icons.add, count < max, () => onChanged(count + 1)),
      ],
    );
  }

  Widget _circleBtn(IconData icon, bool enabled, VoidCallback onTap) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 28.w,
        height: 28.w,
        decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.white12),
        alignment: Alignment.center,
        child: Icon(icon, size: 16.w, color: enabled ? AppColors.white : AppColors.white30),
      ),
    );
  }
}

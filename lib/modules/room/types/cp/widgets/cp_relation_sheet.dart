import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../app/chimo_api.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/room_cp.pb.dart';
import '../../../../../common/models/server_client/user_realtion.pb.dart';
import '../../../../../common/theme/app_bottom_sheet.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/app_toast.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../../../common/widgets/app_image.dart';
import '../../../model/room_format.dart';
import '../logic/cp_logic.dart';

/// 授关系弹层。像素对齐 Cosmic Lounge「Assign Relationship」。
///
/// Stack 自下而上：氛围底 → 白卡片 → 翅膀头图 → 双头像/昵称 → 中间爱心 → 金条心动值。
class CpRelationSheet extends StatefulWidget {
  const CpRelationSheet({super.key});

  static Future<void> show() {
    return AppBottomSheet.show<void>(isScrollControlled: true, child: const CpRelationSheet());
  }

  @override
  State<CpRelationSheet> createState() => _CpRelationSheetState();
}

class _CpRelationSheetState extends State<CpRelationSheet> {
  /// 设计稿 375 宽下的关键尺寸。
  static double get _wingH => 150.w;
  static double get _avatar => 54.w;

  // static const _tagGrad = LinearGradient(
  //   begin: Alignment.centerLeft,
  //   end: Alignment.centerRight,
  //   colors: [Color(0xFFFF7AB8), Color(0xFFFF4D9A)],
  // );
  static final _btnGrad = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [AppColors.rgba(255, 54, 116, 1), AppColors.rgba(255, 116, 222, 1)],
  );

  /// 选中标签字色。
  static const _selectedText = Color(0xFFFFFFFF);

  /// 未选中标签字色（设计稿取样 ≈ #E2ABC7）。
  static const _unselectedText = Color(0xFFE2ABC7);

  int _selectTagIndex = 0;
  List<CPConfItem>? _items;
  var _loading = true;
  var _submitting = false;

  CpLogic? get _logic => Get.isRegistered<CpLogic>() ? Get.find<CpLogic>() : null;

  CPHandsInfo? get _hands {
    final info = _logic?.info.value;
    if (info == null || !info.hasHandsInfo()) return null;
    return info.handsInfo;
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final result = await ChimoApis.cp.relationConfig();
    if (!mounted) return;
    setState(() {
      _loading = false;
      _items = result.ok ? result.data?.configs.toList() ?? [] : [];
    });
    if (!result.ok) {
      AppToast.error(result.message.isEmpty ? 'Load failed' : result.message);
    }
  }

  Future<void> _confirm() async {
    final items = _items;
    final logic = _logic;
    if (items == null || items.isEmpty || logic == null || _submitting) return;
    final item = items[_selectTagIndex.clamp(0, items.length - 1)];
    setState(() => _submitting = true);
    final failure = await logic.next(relationId: item.id);
    if (!mounted) return;
    setState(() => _submitting = false);
    if (failure != null) {
      AppToast.error(failure);
      return;
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final hands = _hands;
    final u1 = _logic?.seatByUid(hands?.uid1.toInt() ?? 0);
    final u2 = _logic?.seatByUid(hands?.uid2.toInt() ?? 0);
    final score = hands?.currentProgress.toInt() ?? 0;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 1) 氛围底
        Positioned.fill(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
            ),
            child: Chimo.image(AppAssets.cpAssignRelationBg, fit: BoxFit.cover),
          ),
        ),
        // 2) 白粉内容卡（在翅膀之下）
        Padding(
          padding: EdgeInsets.only(top: 100.w),
          child: _card(),
        ),
        // 3) 翅膀 + 头像 + 心动值（最上层）
        Positioned(
          top: -58.w,
          left: 0,
          right: 0,
          height: _wingH + 8.w,
          child: _header(
            avatar1: u1?.avatar ?? '',
            name1: u1?.name ?? '',
            avatar2: u2?.avatar ?? '',
            name2: u2?.name ?? '',
            score: score,
          ),
        ),
      ],
    );
  }

  /// 翅膀 → 头像 → 昵称粉条 → 爱心 → 金条心动值（同层后画的在上）。
  Widget _header({
    required String avatar1,
    required String name1,
    required String avatar2,
    required String name2,
    required int score,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // 翅膀底图（自带底部金条）
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Chimo.image(
            AppAssets.cpWingCard,
            width: double.infinity,
            height: _wingH,
            fit: BoxFit.fitHeight,
          ),
        ),
        // 双头像 + 昵称（中心距 _pairGap）
        Positioned(
          bottom: 38.w,
          left: 0,
          right: 0,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _avatarBlock(avatar1, name1),
                Chimo.gap(width: 4.w),
                _avatarBlock(avatar2, name2),
              ],
            ),
          ),
        ),
        // 心动值：只铺文字，金底用翅膀切图
        Positioned(
          top: _wingH - 28.w,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              roomCount(score),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.rgba(178, 86, 50, 1),
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                height: 1,
                shadows: [Shadow(color: Colors.white.withValues(alpha: 0.55), blurRadius: 2)],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _avatarBlock(String avatar, String name) {
    final nick = name.isEmpty ? ' ' : (name.length <= 6 ? name : '${name.substring(0, 6)}…');
    return SizedBox(
      width: _avatar,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: _avatar,
            height: _avatar,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: AppImage.avatar(avatar, size: _avatar - 4.w),
          ),
          Transform.translate(
            offset: Offset(0, -8.w),
            child: Container(
              constraints: BoxConstraints(maxWidth: _avatar + 12.w),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: const LinearGradient(colors: [Color(0xFFFF7AB8), Color(0xFFFF4D9A)]),
              ),
              child: Text(
                nick,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _card() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 8.w),
      padding: EdgeInsets.all(16.w).copyWith(bottom: 70.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: AppColors.white,
        image: Chimo.decorationImage(AppAssets.cpAssignRelationCardBg, fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _title(),
          SizedBox(height: 16.w),
          _tags(),
          SizedBox(height: 18.w),
          _confirmBtn(),
        ],
      ),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Chimo.image(AppAssets.cpWingLeft, width: 20.w, height: 20.w),
        Text(
          'Assign Relationship',
          style: TextStyle(
            color: AppColors.rgba(255, 77, 175, 1),
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        Chimo.image(AppAssets.cpWingRight, width: 20.w, height: 20.w),
      ],
    );
  }

  Widget _tags() {
    if (_loading) {
      return SizedBox(
        height: 100.w,
        child: const Center(child: CupertinoActivityIndicator()),
      );
    }
    final items = _items ?? [];
    if (items.isEmpty) {
      return SizedBox(
        height: 100.w,
        child: Center(
          child: TextButton(onPressed: _load, child: const Text('Retry')),
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 8.w,
        runSpacing: 10.w,
        alignment: WrapAlignment.start,
        children: List.generate(items.length, (index) {
          final isSelected = index == _selectTagIndex;
          final item = items[index];
          return GestureDetector(
            onTap: () => setState(() => _selectTagIndex = index),
            child: UnconstrainedBox(
              child: Container(
                height: 28.w,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  gradient: isSelected ? _btnGrad : null,
                  color: isSelected ? AppColors.white70 : AppColors.white,
                  border: Border.all(color: AppColors.rgba(255, 241, 254, 1)),
                  boxShadow: isSelected
                      ? null
                      : [
                          BoxShadow(
                            color: const Color(0xFFFFB6D0).withValues(alpha: 0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                ),
                child: Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? _selectedText : _unselectedText,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _confirmBtn() {
    return GestureDetector(
      onTap: _submitting ? null : _confirm,
      child: Opacity(
        opacity: _submitting ? 0.7 : 1,
        child: Container(
          width: double.infinity,
          height: 48.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            gradient: _btnGrad,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF3D8A).withValues(alpha: 0.35),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: _submitting
              ? const CupertinoActivityIndicator(color: Colors.white)
              : Text(
                  'Confirm & End',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
        ),
      ),
    );
  }
}

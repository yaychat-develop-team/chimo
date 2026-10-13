import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../logic/group_members_logic.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/theme/app_input.dart';
import '../../../../../common/extensions/wire_view.dart';
import '../../../../../common/models/server_client/user.pb.dart';
import '../../../../../common/widgets/app_image.dart';
import '../../../../../common/theme/app_bottom_sheet.dart';

/// 群成员底部弹层，支持昵称搜索（接口驱动）。
class GroupMembersSheet extends StatefulWidget {
  const GroupMembersSheet({super.key, required this.groupId, this.onMemberTap});

  final String groupId;
  final ValueChanged<User>? onMemberTap;

  /// 打开成员弹层。不需要 BuildContext：弹层走 [AppBottomSheet]，内部用 GetX。
  static Future<void> open({required String groupId, ValueChanged<User>? onMemberTap}) {
    return AppBottomSheet.show<void>(
      isScrollControlled: true,
      child: GroupMembersSheet(groupId: groupId, onMemberTap: onMemberTap),
    );
  }

  @override
  State<GroupMembersSheet> createState() => _GroupMembersSheetState();
}

class _GroupMembersSheetState extends State<GroupMembersSheet> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  late final String _tag;
  late final GroupMembersLogic logic;

  List<User> get _members => logic.members;
  bool get _loading => logic.loading.value;
  String? get _error => logic.error.value;
  bool get _needsLogin => logic.needsLogin.value;
  String get _query => logic.query.value;

  @override
  void initState() {
    super.initState();
    _tag = 'group-members-$hashCode';
    logic = Get.put(GroupMembersLogic(groupId: widget.groupId), tag: _tag);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    Get.delete<GroupMembersLogic>(tag: _tag);
    super.dispose();
  }

  void _onQueryChanged(String value) {
    logic.query.value = value;
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 320), () {
      unawaited(logic.load(searchKey: value.trim()));
    });
  }

  void _goLogin() {
    AppJumper.back();
    AppJumper.toLoginAndClear();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final height = MediaQuery.sizeOf(context).height * 0.72;

    // isScrollControlled 弹层会铺满屏幕；仅用 Align 仍会点到透明顶部
    // 并挡住遮罩关闭 — 点击空白区域关闭。
    return Obx(
      () => SizedBox.expand(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => AppJumper.maybeBack(),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: height,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.surfaceSheet,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 18),
                      const Text(
                        'Group Members',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceField,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Row(
                            children: [
                              const AppImage(
                                AppAssets.msgSearch,
                                width: 18,
                                height: 18,
                                color: AppColors.textTertiary,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  onChanged: _onQueryChanged,
                                  style: const TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  cursorColor: AppColors.primaryBright,
                                  decoration: const AppInputDecoration(
                                    isDense: true,
                                    hintText: 'Enter a nickname to search',
                                    hintStyle: TextStyle(
                                      color: AppColors.textTertiary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(child: _buildBody(bottom)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(double bottom) {
    if (_loading) {
      return const Center(
        child: SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2.4)),
      );
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _error!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.textTertiary, fontSize: 14),
              ),
              const SizedBox(height: 16),
              if (_needsLogin)
                TextButton(onPressed: _goLogin, child: const Text('Log in'))
              else
                TextButton(
                  onPressed: () => unawaited(logic.load(searchKey: _query.trim())),
                  child: const Text('Retry'),
                ),
            ],
          ),
        ),
      );
    }
    if (_members.isEmpty) {
      return Center(
        child: Text(
          _query.trim().isEmpty ? 'No members' : 'No members found',
          style: const TextStyle(color: AppColors.textTertiary, fontSize: 14),
        ),
      );
    }
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 16 + bottom),
      itemCount: _members.length,
      separatorBuilder: (_, _) => const SizedBox(height: 18),
      itemBuilder: (context, index) {
        final member = _members[index];
        return _MemberRow(
          member: member,
          onTap: widget.onMemberTap == null ? null : () => widget.onMemberTap!(member),
        );
      },
    );
  }
}

class _MemberRow extends StatelessWidget {
  const _MemberRow({required this.member, this.onTap});

  final User member;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          ClipOval(
            child: AppImage(
              member.avatar,
              fallbackAsset: AppAssets.avatarPlace,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              fadeIn: Duration.zero,
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              member.nickname,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (member.genderKnown) ...[
            const SizedBox(width: 8),
            AppImage(
              member.male ? AppAssets.genderMan : AppAssets.genderWoman,
              width: 18,
              height: 18,
            ),
          ],
        ],
      ),
    );
  }
}

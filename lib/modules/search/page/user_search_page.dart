import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/models/server_client/rtc.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../common/utils/chimo.dart';
import '../../../common/utils/type_util.dart';
import '../../../common/widgets/app_empty_holder.dart';
import '../../../common/widgets/app_pull_refresh.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/user_search_logic.dart';
import '../model/search_user.dart';

/// 首页搜索。UI 对齐设计稿 + joyride `HomeSearchPage`。
class HomeSearchPage extends GetView<UserSearchLogic> {
  const HomeSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.black0F0F0F,
      appBar: _SearchTopBar(controller: controller),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => controller.focusNode.unfocus(),
        child: Obx(() {
          final showResults = controller.hasSearched.value;
          final result = controller.result.value;
          final room = controller.room.value;
          final editingHistory = controller.editingHistory.value;
          final history = controller.history.toList();
          final searching = controller.searching.value;

          return AppPullRefresh(
            onRefresh: _onRefresh,
            accentColor: AppColors.green1CFF8A,
            padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 24.w),
            header: !showResults
                ? _HistorySection(
                    history: history,
                    editing: editingHistory,
                    onEnterEdit: controller.enterEditHistory,
                    onExitEdit: controller.exitEditHistory,
                    onClearAll: controller.clearAllHistory,
                    onTapItem: controller.onHistoryTap,
                    onDeleteItem: controller.removeHistoryItem,
                  )
                : null,
            slivers: [
              if (showResults && searching)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.4,
                        color: AppColors.green1CFF8A,
                      ),
                    ),
                  ),
                )
              else if (result == null && room == null)
                const AppEmptyHolder.empty(
                  message: 'Sorry. No relevant content.',
                  icon: AppAssets.emptyNoSearch,
                  iconWidth: 220,
                  messageStyle: TextStyle(
                    color: AppColors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ).asSliver
              else ...[
                if (result != null)
                  SliverToBoxAdapter(
                    child: _UsersResult(
                      user: result,
                      onFollow: () => controller.follow(result),
                      onChat: () => controller.openChat(result),
                      onProfile: () => controller.openProfile(result),
                    ),
                  ),
                if (room != null) ...[
                  if (result != null) SliverToBoxAdapter(child: SizedBox(height: 8.w)),
                  SliverToBoxAdapter(
                    child: _RoomResult(room: room, onJoin: () => controller.openRoom(room)),
                  ),
                ],
              ],
            ],
          );
        }),
      ),
    );
  }

  Future<void> _onRefresh() async {
    if (controller.hasSearched.value) {
      await controller.submit(controller.input.text);
    } else {
      controller.loadHistory();
    }
  }
}

/// 返回 + 搜索框（内嵌绿色 Search）。对齐 joyride `JRSearchTextField(showSearchBtn: true)`。
class _SearchTopBar extends StatelessWidget {
  const _SearchTopBar({required this.controller});

  final UserSearchLogic controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 48,
        child: Row(
          children: [
            AppBackButton(
              onBack: () {
                controller.focusNode.unfocus();
                AppJumper.back();
              },
            ),
            Expanded(
              child: Container(
                height: 44,
                margin: EdgeInsetsDirectional.only(end: 16.w),
                padding: const EdgeInsetsDirectional.only(start: 12),
                decoration: BoxDecoration(
                  color: AppColors.white10,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    Chimo.image(
                      AppAssets.msgSearch,
                      width: 14,
                      height: 14,
                      color: AppColors.white,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextField(
                        controller: controller.input,
                        focusNode: controller.focusNode,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        cursorColor: AppColors.green1CFF8A,
                        cursorWidth: 1.5,
                        textInputAction: TextInputAction.search,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(64),
                        ],
                        onSubmitted: controller.submit,
                        decoration: const AppInputDecoration(
                          isDense: true,
                          hintText: 'Enter User ID or Room ID...',
                          hintStyle: TextStyle(
                            color: AppColors.white36,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 4),
                      child: GestureDetector(
                        onTap: () => controller.submit(controller.input.text),
                        child: Container(
                          width: 72,
                          height: 34,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.green1CFF8A,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: const Text(
                            'Search',
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistorySection extends StatelessWidget {
  const _HistorySection({
    required this.history,
    required this.editing,
    required this.onEnterEdit,
    required this.onExitEdit,
    required this.onClearAll,
    required this.onTapItem,
    required this.onDeleteItem,
  });

  final List<String> history;
  final bool editing;
  final VoidCallback onEnterEdit;
  final VoidCallback onExitEdit;
  final VoidCallback onClearAll;
  final ValueChanged<String> onTapItem;
  final ValueChanged<String> onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'History',
                style: TextStyle(
                  color: AppColors.white60,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              if (editing) ...[
                GestureDetector(
                  onTap: onClearAll,
                  behavior: HitTestBehavior.opaque,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                    child: Text(
                      'Clear All',
                      style: TextStyle(color: AppColors.white60, fontSize: 14),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  color: AppColors.gray333333,
                ),
                GestureDetector(
                  onTap: onExitEdit,
                  behavior: HitTestBehavior.opaque,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ] else
                GestureDetector(
                  onTap: history.isEmpty ? null : onEnterEdit,
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Chimo.image(
                      AppAssets.msgDelete,
                      width: 16,
                      height: 16,
                      color: history.isEmpty ? AppColors.gray6E6E6E : AppColors.white,
                    ),
                  ),
                ),
            ],
          ),
          if (history.isNotEmpty) ...[
            SizedBox(height: 10.w),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final item in history)
                  _HistoryChip(
                    label: item,
                    editing: editing,
                    onTap: () => onTapItem(item),
                    onDelete: () => onDeleteItem(item),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _HistoryChip extends StatelessWidget {
  const _HistoryChip({
    required this.label,
    required this.editing,
    required this.onTap,
    required this.onDelete,
  });

  final String label;
  final bool editing;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: editing ? onDelete : onTap,
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 16, end: editing ? 10 : 16, top: 6, bottom: 6),
        decoration: BoxDecoration(
          color: AppColors.white12,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: AppColors.white.withValues(alpha: 0.8),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            if (editing) ...[
              const SizedBox(width: 8),
              Icon(Icons.close_rounded, size: 12, color: AppColors.white.withValues(alpha: 0.6)),
            ],
          ],
        ),
      ),
    );
  }
}

class _UsersResult extends StatelessWidget {
  const _UsersResult({
    required this.user,
    required this.onFollow,
    required this.onChat,
    required this.onProfile,
  });

  final SearchUser user;
  final VoidCallback onFollow;
  final VoidCallback onChat;
  final VoidCallback onProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Users',
          style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 12.w),
        _UserCard(user: user, onFollow: onFollow, onChat: onChat, onProfile: onProfile),
      ],
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    required this.user,
    required this.onFollow,
    required this.onChat,
    required this.onProfile,
  });

  final SearchUser user;
  final VoidCallback onFollow;
  final VoidCallback onChat;
  final VoidCallback onProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.w),
      decoration: BoxDecoration(
        color: const Color(0xFF16161D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onProfile,
            behavior: HitTestBehavior.opaque,
            child: _AvatarWithGender(user: user),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: GestureDetector(
              onTap: onProfile,
              behavior: HitTestBehavior.opaque,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.nickname,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.w),
                  Text(
                    'ID: ${user.userId}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white60,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (user.relation != SearchRelation.self) ...[
            SizedBox(width: 8.w),
            if (user.relation == SearchRelation.notFollowing)
              _ActionPill(label: 'Follow', filled: true, onTap: onFollow)
            else
              _ActionPill(label: 'Chat', filled: false, onTap: onChat),
          ],
        ],
      ),
    );
  }
}

class _AvatarWithGender extends StatelessWidget {
  const _AvatarWithGender({required this.user});

  final SearchUser user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48.w,
      height: 48.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(
            child: Chimo.image(
              user.avatarUrl,
              fallbackAsset: user.avatarAsset,
              width: 48.w,
              height: 48.w,
              fit: BoxFit.cover,
              fadeIn: Duration.zero,
            ),
          ),
          if (user.hasGender)
            PositionedDirectional(
              end: -1,
              bottom: -1,
              child: Container(
                width: 16.w,
                height: 16.w,
                decoration: BoxDecoration(
                  color: user.isMale ? AppColors.blue4F8BFF : AppColors.pinkFF5BA8,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF16161D), width: 1.5),
                ),
                alignment: Alignment.center,
                child: Chimo.image(
                  user.isMale ? AppAssets.genderMan : AppAssets.genderWoman,
                  width: 10.w,
                  height: 10.w,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _RoomResult extends StatelessWidget {
  const _RoomResult({required this.room, required this.onJoin});

  final Channel room;
  final VoidCallback onJoin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Room',
          style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8.w),
        _RoomCard(room: room, onTap: onJoin),
      ],
    );
  }
}

/// 对齐 joyride `RoomDrawerItemWidget(darkStyle: true)`。
class _RoomCard extends StatelessWidget {
  const _RoomCard({required this.room, required this.onTap});

  final Channel room;
  final VoidCallback onTap;

  List<Color> get _labelColors {
    final list = <Color>[];
    for (final raw in room.roomLabelColor) {
      final c = TypeUtil.parseColor(raw);
      if (c != null) list.add(c);
    }
    if (list.isEmpty) {
      return const [AppColors.pinkFF5BA8, AppColors.pinkFC475F];
    }
    if (list.length == 1) return [list.first, list.first];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final title = room.title.trim().isEmpty ? 'Room' : room.title.trim();
    final theme = room.theme.trim();
    final label = room.roomLabelDesc.trim();
    final users = room.userList;
    final online = room.currentUserCount;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsetsDirectional.only(start: 8, top: 8, bottom: 8, end: 8),
        decoration: BoxDecoration(
          color: AppColors.white12,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Chimo.image(
                    room.icon,
                    fallbackAsset: AppAssets.avatarPlace,
                    width: 72.w,
                    height: 72.w,
                    fit: BoxFit.cover,
                    fadeIn: Duration.zero,
                  ),
                ),
                Container(
                  width: 72.w,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0),
                        Colors.black.withValues(alpha: 0.5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsetsDirectional.only(start: 6),
                  alignment: AlignmentDirectional.centerStart,
                  child: Chimo.image(AppAssets.roomFloatWave, width: 10, color: AppColors.white),
                ),
              ],
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (label.isNotEmpty) ...[
                        SizedBox(width: 8.w),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          decoration: ShapeDecoration(
                            shape: const StadiumBorder(),
                            gradient: LinearGradient(colors: _labelColors),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (room.roomLabelIcon.isNotEmpty) ...[
                                Chimo.image(room.roomLabelIcon, width: 12, height: 12),
                                const SizedBox(width: 2),
                              ],
                              Text(
                                label,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (theme.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      theme,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.white60,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _RoomUserAvatars(users: users)),
                      Text(
                        '$online people are online',
                        style: const TextStyle(
                          color: AppColors.white60,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoomUserAvatars extends StatelessWidget {
  const _RoomUserAvatars({required this.users});

  final List<SimpleChannelUser> users;

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) return const SizedBox.shrink();
    final shown = min(users.length, 6);
    return SizedBox(
      height: 22,
      width: 18.0 * shown + 4,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          for (var i = 0; i < shown; i++)
            PositionedDirectional(
              start: 18.0 * i,
              child: i == 5 && users.length > 6
                  ? Container(
                      width: 22,
                      height: 22,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xFF3A3A44),
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '...',
                        style: TextStyle(color: AppColors.white70, fontSize: 9, height: 1),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF272730), width: 1),
                      ),
                      child: Chimo.image(
                        users[i].avatar,
                        fallbackAsset: AppAssets.avatarPlace,
                        width: 22,
                        height: 22,
                        circle: true,
                        fadeIn: Duration.zero,
                      ),
                    ),
            ),
        ],
      ),
    );
  }
}

class _ActionPill extends StatelessWidget {
  const _ActionPill({required this.label, required this.filled, required this.onTap});

  final String label;
  final bool filled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 66,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: filled ? AppColors.green1CFF8A : AppColors.green1A3A28,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: filled ? const Color(0xFF111111) : AppColors.green1CFF8A,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

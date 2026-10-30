import 'package:chimo/common/widgets/app_blur_backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/models/server_client/rtc.pb.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_pull_refresh.dart';
import '../../logic/more_rooms_logic.dart';
import '../../model/room_format.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 房间内 More Rooms 右侧抽屉。像素对齐 Cosmic Lounge 设计稿。
class MoreRoomsDrawer extends StatefulWidget {
  const MoreRoomsDrawer({super.key});

  static Future<void> show() async {
    final logic = MoreRoomsLogic.create();
    await Get.generalDialog<void>(
      barrierLabel: 'More Rooms',
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 280),
      pageBuilder: (context, _, _) => const MoreRoomsDrawer(),
      transitionBuilder: (context, animation, _, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
              .animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
          child: child,
        );
      },
    );
    if (identical(MoreRoomsLogic.findOrNull(), logic)) {
      MoreRoomsLogic.release();
    }
  }

  @override
  State<MoreRoomsDrawer> createState() => _MoreRoomsDrawerState();
}

class _MoreRoomsDrawerState extends State<MoreRoomsDrawer>
    with SingleTickerProviderStateMixin {
  late final MoreRoomsLogic logic;
  late final AnimationController _drag;
  var _dx = 0.0;
  var _closing = false;
  final _drawerWidth = 260.w;

  @override
  void initState() {
    super.initState();
    logic = MoreRoomsLogic.create();
    _drag = AnimationController.unbounded(vsync: this)
      ..addListener(() {
        if (!mounted) return;
        setState(() => _dx = _drag.value);
      });
  }

  @override
  void dispose() {
    _drag.dispose();
    super.dispose();
  }

  Future<void> _open(Channel channel) async {
    final rid = channel.channelId.toInt();
    if (rid <= 0) return;
    AppJumper.back();
    await AppJumper.toRoom(rid);
  }

  void _onDragUpdate(DragUpdateDetails details, double panelW) {
    if (_closing) return;
    setState(() => _dx = (_dx + details.delta.dx).clamp(0.0, panelW));
  }

  void _onDragEnd(DragEndDetails details, double panelW) {
    if (_closing) return;
    final velocity = details.primaryVelocity ?? 0;
    final shouldClose = _dx > panelW * 0.28 || velocity > 700;
    if (shouldClose) {
      _closing = true;
      _drag.value = _dx;
      _drag
          .animateTo(
            panelW,
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
          )
          .whenComplete(() {
            if (mounted) AppJumper.back();
          });
      return;
    }
    _drag.value = _dx;
    _drag.animateTo(
      0,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        GestureDetector(
          onTap: AppJumper.back,
          behavior: HitTestBehavior.opaque,
          child: Opacity(
            opacity: (1 - (_dx / _drawerWidth)).clamp(0.0, 1.0),
            child: const ColoredBox(color: Colors.transparent),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onHorizontalDragUpdate: (d) => _onDragUpdate(d, _drawerWidth),
            onHorizontalDragEnd: (d) => _onDragEnd(d, _drawerWidth),
            child: Transform.translate(
              offset: Offset(_dx, 0),
              child: Material(
                child: AppBlurBackdrop(
                  blur: 28,
                  color: AppColors.black111DE5.withValues(alpha: 0.9),
                  child: SizedBox(
                    width: _drawerWidth,
                    height: double.infinity,
                    child: SafeArea(
                      left: false,
                      child: Obx(() {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _header(),
                            Expanded(
                              child: AppPullRefresh(
                                accentColor: AppColors.green29EEAA,
                                onRefresh: logic.load,
                                onLoadMore: logic.loadMore,
                                hasMore: logic.hasMore,
                                loadingMore: logic.loadingMore.value,
                                showNoMoreFooter: false,
                                loadMoreThreshold: 120,
                                slivers: [
                                  if (logic.saved.isNotEmpty) ...[
                                    const SliverToBoxAdapter(
                                      child: _SectionTitle('Saved'),
                                    ),
                                    SliverToBoxAdapter(
                                      child: _SavedRow(
                                        rooms: logic.saved,
                                        onTap: _open,
                                      ),
                                    ),
                                    const SliverToBoxAdapter(
                                      child: SizedBox(height: 24),
                                    ),
                                  ],
                                  const SliverToBoxAdapter(
                                    child: _SectionTitle('For You'),
                                  ),
                                  if (logic.error.value != null &&
                                      logic.forYou.isEmpty)
                                    SliverFillRemaining(
                                      hasScrollBody: false,
                                      child: _ErrorView(
                                        message: logic.error.value!,
                                        onRetry: logic.load,
                                      ),
                                    )
                                  else if (logic.forYou.isEmpty)
                                    const SliverFillRemaining(
                                      hasScrollBody: false,
                                      child: Center(
                                        child: Text(
                                          'No rooms yet',
                                          style: TextStyle(
                                            color: AppColors.gray9A9A9A,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    )
                                  else
                                    SliverPadding(
                                      padding: const EdgeInsets.fromLTRB(
                                        16,
                                        0,
                                        16,
                                        24,
                                      ),
                                      sliver: SliverList.separated(
                                        itemCount: logic.forYou.length,
                                        separatorBuilder: (_, _) =>
                                            const SizedBox(height: 12),
                                        itemBuilder: (context, index) {
                                          return _ForYouCard(
                                            channel: logic.forYou[index],
                                            onTap: () =>
                                                _open(logic.forYou[index]),
                                          );
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 6, 16),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'More Rooms',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
          ),
          IconButton(
            onPressed: AppJumper.back,
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            icon: const Icon(
              Icons.close,
              color: AppColors.gray8A8A8A,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),
    );
  }
}

class _SavedRow extends StatelessWidget {
  const _SavedRow({required this.rooms, required this.onTap});

  final List<Channel> rooms;
  final ValueChanged<Channel> onTap;

  static const _thumb = 72.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _thumb + 8 + 16,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: rooms.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final room = rooms[index];
          final title = room.title.trim().isEmpty ? 'Room' : room.title.trim();
          return GestureDetector(
            onTap: () => onTap(room),
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              width: _thumb,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: _thumb,
                      height: _thumb,
                      child: room.icon.isEmpty
                          ? const ColoredBox(color: AppColors.black2A2A2A)
                          : Chimo.image(room.icon, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.gray9A9A9A,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// For You 卡片：设计稿实色底 + 内嵌圆角封面 + 重叠头像 + 人数圆徽 + 热度。
///
/// 设计图实测（472 宽导出，约 1px≈1pt）：封面 72、内边距 10、卡片圆角 20、
/// 卡片底 ≈ #25222D、人数徽 ≈ #56545F。
class _ForYouCard extends StatelessWidget {
  const _ForYouCard({required this.channel, required this.onTap});

  final Channel channel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final title = channel.title.trim().isEmpty ? 'Room' : channel.title.trim();
    final theme = channel.theme.trim();
    final cover = channel.icon.trim();
    final faces = [
      for (final user in channel.userList)
        if (user.avatar.trim().isNotEmpty) user.avatar.trim(),
    ].take(3).toList();
    final hot = channel.hotValue.toInt();
    final online = channel.currentUserCount;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 80.w,
              margin: EdgeInsets.only(left: 32.w),
              padding: EdgeInsets.only(
                left: 42.w,
                right: 12.w,
                top: 10.w,
                bottom: 10.w,
              ),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  if (theme.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      theme,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.gray9A9A9A,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                  ],
                  const Spacer(),
                  Row(
                    children: [
                      if (faces.isNotEmpty) ...[
                        _AvatarStack(
                          urls: faces,
                          borderColor: AppColors.rgba(43, 39, 49, 1),
                          trailing: _OnlineCountBadge(count: online),
                        ),
                      ] else
                        _OnlineCountBadge(count: online),
                      const Spacer(),
                      Chimo.image(AppAssets.roomFire, width: 12, height: 12),
                      const SizedBox(width: 3),
                      Text(
                        roomCount(hot),
                        style: const TextStyle(
                          color: AppColors.gray9A9A9A,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 64.w,
              height: 64.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.black1F2518,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Chimo.image(cover, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}

/// 你手改的在线人数徽标样式，叠在头像栈末位。
class _OnlineCountBadge extends StatelessWidget {
  const _OnlineCountBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.w,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      constraints: BoxConstraints(minWidth: 16.w),
      decoration: BoxDecoration(
        color: AppColors.rgba(86, 83, 92, 1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.rgba(43, 39, 49, 1), width: 1),
      ),
      alignment: Alignment.center,
      child: Text(
        '$count',
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          height: 1,
        ),
      ),
    );
  }
}

/// 重叠头像栈；[trailing]（在线人数）叠在最后一枚头像上。
class _AvatarStack extends StatelessWidget {
  const _AvatarStack({
    required this.urls,
    required this.borderColor,
    this.trailing,
  });

  final List<String> urls;
  final Color borderColor;
  final Widget? trailing;

  static double get _size => 16.w;
  static double get _step => 10.w;

  @override
  Widget build(BuildContext context) {
    final n = urls.length;
    final hasTrailing = trailing != null;
    final slots = n + (hasTrailing ? 1 : 0);
    return SizedBox(
      width: slots <= 0 ? 0 : _size + _step * (slots - 1),
      height: _size,
      child: Stack(
        children: [
          ...List.generate(n, (i) {
            return Positioned(
              left: i * _step,
              child: Container(
                width: _size,
                height: _size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor, width: 1.5),
                ),
                child: ClipOval(
                  child: Chimo.image(
                    urls[i],
                    width: _size,
                    height: _size,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),
          if (hasTrailing) Positioned(left: n * _step, child: trailing!),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.gray9A9A9A, fontSize: 14),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: onRetry,
              child: const Text(
                'Retry',
                style: TextStyle(color: AppColors.green29EEAA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

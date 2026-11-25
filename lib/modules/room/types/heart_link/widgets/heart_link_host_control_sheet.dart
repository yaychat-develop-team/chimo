import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../app/chimo_api.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/extensions/wire_view.dart';
import '../../../../../common/models/server_client/heart_link.pb.dart';
import '../../../../../common/theme/app_bottom_sheet.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/app_toast.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../../../common/widgets/gender_age_chip.dart';
import '../../../service/room_service.dart';
import '../logic/heart_link_logic.dart';
import 'heart_link_gs_pool_page.dart';

/// Host Control
abstract final class HeartLinkHostControlSheet {
  static Future<void> show({int initialTab = 0, bool privateRoom = false}) async {
    if (!Get.isRegistered<HeartLinkLogic>()) return;
    await AppBottomSheet.show<void>(
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      child: _HostControlBody(initialTab: initialTab, privateRoom: privateRoom),
    );
  }
}

enum _UserStatus { onMic, inRoom, offRoom }

class _HostControlBody extends StatefulWidget {
  const _HostControlBody({required this.initialTab, required this.privateRoom});

  final int initialTab;
  final bool privateRoom;

  @override
  State<_HostControlBody> createState() => _HostControlBodyState();
}

class _HostControlBodyState extends State<_HostControlBody> with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  HeartLinkUserInfoRsp? _data;
  var _loading = true;
  var _showPool = false;
  var _guestSubTab = 0;
  final _selected = <int>{};
  final _invitedAt = <int, DateTime>{};

  HeartLinkLogic get ht => Get.find<HeartLinkLogic>();

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this, initialIndex: widget.initialTab.clamp(0, 1));
    _refresh();
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    setState(() => _loading = true);
    final result = await ChimoApis.heartLink.queryRoomUser(ht.rid);
    if (!mounted) return;
    setState(() {
      _loading = false;
      if (result.ok) _data = result.data;
    });
    if (!result.ok) {
      AppToast.error(result.message.isEmpty ? 'Failed' : result.message);
    }
  }

  Future<void> _invite(int uid) async {
    final result = await ChimoApis.heartLink.inviteGsJoin(rid: ht.rid, uid: uid);
    if (!result.ok) {
      AppToast.error(result.message.isEmpty ? 'Invite failed' : result.message);
      return;
    }
    setState(() => _invitedAt[uid] = DateTime.now());
    AppToast.success('Invited');
  }

  Future<void> _kick(int uid) async {
    final room = RoomService.findOrNull();
    if (room == null) return;
    final err = await room.kickUser(uid: uid, leaveSeconds: 0);
    if (err != null) {
      AppToast.error(err);
      return;
    }
    await _refresh();
  }

  Future<void> _offMic(int uid) async {
    final room = RoomService.findOrNull();
    if (room == null) return;
    final err = await room.grantDownMic(uid);
    if (err != null) {
      AppToast.error(err);
      return;
    }
    await _refresh();
  }

  Future<void> _bringToMic(int uid, int position, int uidOnMic) async {
    final ok = await _showMicReminder();
    if (ok != true) return;
    final room = RoomService.findOrNull();
    if (room == null) return;
    if (uidOnMic > 0 && uidOnMic != uid) {
      final down = await room.grantDownMic(uidOnMic);
      if (down != null) {
        AppToast.error(down);
        return;
      }
    }
    final err = await room.grantOnMic(uid: uid, position: position);
    if (err != null) {
      AppToast.error(err);
      return;
    }
    await _refresh();
  }

  Future<bool?> _showMicReminder() {
    return Get.dialog<bool>(
      Dialog(
        backgroundColor: AppColors.white,
        elevation: 0,
        insetPadding: const EdgeInsets.symmetric(horizontal: 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Mic Reminder',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),
              const Text(
                'Are you sure you want to bring this user on mic?',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.gray6E6E6E, fontSize: 14, height: 1.4),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: _Btn(
                      label: 'Cancel',
                      height: 44,
                      fill: AppColors.grayF0F0F0,
                      textColor: AppColors.black,
                      onTap: () => Get.back(result: false),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _Btn(
                      label: 'Confirm',
                      height: 44,
                      gradient: AppColors.primaryGradient,
                      textColor: AppColors.black1F2518,
                      onTap: () => Get.back(result: true),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierColor: AppColors.black.withValues(alpha: 0.55),
    );
  }

  Future<void> _createPrivate() async {
    if (_selected.length != 2) {
      AppToast.info('Select exactly 2 people');
      return;
    }
    final ids = _selected.toList();
    final ok = await ht.createPrivateRoom(ids[0], ids[1]);
    if (ok) Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.75;
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.black111DE5,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: _showPool
          ? HeartLinkGsPoolPanel(onBack: () => setState(() => _showPool = false))
          : Column(
              children: [
                const SizedBox(height: 12),
                if (widget.privateRoom) _privateHeader() else _tabsHeader(),
                Expanded(
                  child: _loading
                      ? const Center(child: CircularProgressIndicator(color: AppColors.green00F875))
                      : widget.privateRoom
                      ? _privateBody()
                      : TabBarView(
                          controller: _tabs,
                          children: [
                            _GuestsPage(
                              data: _data,
                              guestSubTab: _guestSubTab,
                              invitedAt: _invitedAt,
                              onSubTab: (i) => setState(() => _guestSubTab = i),
                              onExpand: () => setState(() => _showPool = true),
                              onInvite: _invite,
                              onKick: _kick,
                              onOffMic: _offMic,
                              onBring: _bringToMic,
                            ),
                            _AudiencePage(
                              data: _data,
                              onKick: _kick,
                              onOffMic: _offMic,
                              onBring: _bringToMic,
                            ),
                          ],
                        ),
                ),
                if (widget.privateRoom) _privateConfirm(),
              ],
            ),
    );
  }

  Widget _tabsHeader() {
    // 对齐 oumi `HtManageUserWidget`：JRTabBar + home_page_tab_indicator。
    return Row(
      children: [
        const SizedBox(width: 34),
        Expanded(
          child: SizedBox(
            height: 44,
            child: TabBar(
              controller: _tabs,
              isScrollable: false,
              labelPadding: const EdgeInsets.symmetric(horizontal: 12),
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.gray9A9A9A,
              labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              unselectedLabelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 4,
              dividerColor: AppColors.transparent,
              indicator: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.htTabIndicator),
                  scale: 3,
                  fit: BoxFit.none,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              tabs: const [
                Tab(text: 'Guests'),
                Tab(text: 'Audience'),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: _refresh,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Chimo.image(AppAssets.htRefresh, width: 18, height: 18),
          ),
        ),
      ],
    );
  }

  Widget _privateHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 16, 0),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 18),
          ),
          const Expanded(
            child: Text(
              'Heartie Room',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _privateConfirm() {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: _Btn(
          label: 'Confirm',
          height: 48,
          gradient: AppColors.primaryGradient,
          textColor: AppColors.black1F2518,
          onTap: _createPrivate,
        ),
      ),
    );
  }

  Widget _privateBody() {
    final data = _data;
    if (data == null) return const SizedBox.shrink();
    final users = <HeartiesInfo>[];
    final seen = <int>{};
    void add(HeartiesInfo info) {
      if (!info.hasUser()) return;
      final id = info.user.id.toInt();
      if (id <= 0 || !seen.add(id)) return;
      users.add(info);
    }

    if (data.hasGsMicUser()) add(data.gsMicUser);
    if (data.hasBossMicUser()) add(data.bossMicUser);
    for (final u in data.roomGs) {
      add(u);
    }
    for (final u in data.roomUser) {
      add(u);
    }
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        const Text(
          'Pick two users to join and Heartie Relation',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 12, height: 1.35),
        ),
        const SizedBox(height: 12),
        for (final u in users) _selectRow(u),
      ],
    );
  }

  Widget _selectRow(HeartiesInfo info) {
    final user = info.hasUser() ? info.user : null;
    final uid = user?.id.toInt() ?? 0;
    final nick = user?.nickname.trim() ?? '';
    final name = nick.isEmpty ? 'User' : nick;
    final selected = _selected.contains(uid);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selected) {
            _selected.remove(uid);
          } else if (_selected.length < 2) {
            _selected.add(uid);
          } else {
            AppToast.info('Select at most 2 people');
          }
        });
      },
      child: Container(
        height: 68,
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: selected
              ? LinearGradient(
                  colors: [
                    AppColors.green00F875.withValues(alpha: 0),
                    AppColors.green00F875.withValues(alpha: 0.12),
                  ],
                )
              : null,
        ),
        child: Row(
          children: [
            Chimo.image(
              user?.avatar ?? '',
              width: 42,
              height: 42,
              circle: true,
              fallbackAsset: AppAssets.avatarPlace,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (user != null && user.genderKnown) ...[
                        const SizedBox(width: 4),
                        GenderAgeChip(isMale: user.male, age: user.age),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ID: $uid',
                    style: const TextStyle(color: AppColors.gray9A9A9A, fontSize: 11),
                  ),
                ],
              ),
            ),
            Icon(
              selected ? Icons.check_circle : Icons.circle_outlined,
              color: selected ? AppColors.green00F875 : AppColors.white30,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

/// Guests Tab — 对齐 oumi `HtManageGsPage`。
class _GuestsPage extends StatelessWidget {
  const _GuestsPage({
    required this.data,
    required this.guestSubTab,
    required this.invitedAt,
    required this.onSubTab,
    required this.onExpand,
    required this.onInvite,
    required this.onKick,
    required this.onOffMic,
    required this.onBring,
  });

  final HeartLinkUserInfoRsp? data;
  final int guestSubTab;
  final Map<int, DateTime> invitedAt;
  final ValueChanged<int> onSubTab;
  final VoidCallback onExpand;
  final Future<void> Function(int uid) onInvite;
  final Future<void> Function(int uid) onKick;
  final Future<void> Function(int uid) onOffMic;
  final Future<void> Function(int uid, int position, int uidOnMic) onBring;

  @override
  Widget build(BuildContext context) {
    final d = data;
    final list = d == null ? const <HeartiesInfo>[] : (guestSubTab == 0 ? d.roomGs : d.offRoomGs);
    final onMicUid = d != null && d.hasGsMicUser() ? d.gsMicUser.user.id.toInt() : 0;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
            child: _ExpandPoolBtn(onTap: onExpand),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Text(
              'Current On Mic',
              style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: _GreenBorderCard(
              child: d != null && d.hasGsMicUser()
                  ? _UserItem(
                      info: d.gsMicUser,
                      status: _UserStatus.onMic,
                      position: 1,
                      uidOnMic: onMicUid,
                      invitedAt: invitedAt,
                      embedded: true,
                      onInvite: onInvite,
                      onKick: onKick,
                      onOffMic: onOffMic,
                      onBring: onBring,
                    )
                  : const _EmptyOnMic(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Center(
              child: _GuestSwitch(index: guestSubTab, onChanged: onSubTab),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final info = list[index];
            return _UserItem(
              info: info,
              status: guestSubTab == 0 ? _UserStatus.inRoom : _UserStatus.offRoom,
              position: 1,
              uidOnMic: onMicUid,
              invitedAt: invitedAt,
              onInvite: onInvite,
              onKick: onKick,
              onOffMic: onOffMic,
              onBring: onBring,
            );
          }, childCount: list.length),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}

/// Audience Tab — 对齐 oumi `HtManageBossPage`（无 Expand）。
class _AudiencePage extends StatelessWidget {
  const _AudiencePage({
    required this.data,
    required this.onKick,
    required this.onOffMic,
    required this.onBring,
  });

  final HeartLinkUserInfoRsp? data;
  final Future<void> Function(int uid) onKick;
  final Future<void> Function(int uid) onOffMic;
  final Future<void> Function(int uid, int position, int uidOnMic) onBring;

  @override
  Widget build(BuildContext context) {
    final d = data;
    final onMicUid = d != null && d.hasBossMicUser() ? d.bossMicUser.user.id.toInt() : 0;
    final offMic = d?.roomUser ?? const <HeartiesInfo>[];
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 10),
            child: Text(
              'Current On Mic',
              style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: _GreenBorderCard(
              child: d != null && d.hasBossMicUser()
                  ? _UserItem(
                      info: d.bossMicUser,
                      status: _UserStatus.onMic,
                      position: 2,
                      uidOnMic: onMicUid,
                      invitedAt: const {},
                      embedded: true,
                      onInvite: (_) async {},
                      onKick: onKick,
                      onOffMic: onOffMic,
                      onBring: onBring,
                    )
                  : const _EmptyOnMic(),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: ColoredBox(color: AppColors.black0F0F0F, child: SizedBox(height: 10)),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 10),
            child: Text(
              'Off Mic',
              style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _UserItem(
              info: offMic[index],
              status: _UserStatus.inRoom,
              position: 2,
              uidOnMic: onMicUid,
              invitedAt: const {},
              onInvite: (_) async {},
              onKick: onKick,
              onOffMic: onOffMic,
              onBring: onBring,
            );
          }, childCount: offMic.length),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}

class _ExpandPoolBtn extends StatelessWidget {
  const _ExpandPoolBtn({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, size: 24, color: AppColors.white, fontWeight: .bold),
            // SizedBox(width: 4),
            Text(
              'Expand my guest pool',
              style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class _GreenBorderCard extends StatelessWidget {
  const _GreenBorderCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.green00F875.withValues(alpha: 0.75), width: 1),
        gradient: LinearGradient(
          colors: [
            AppColors.green00F875.withValues(alpha: 0.10),
            AppColors.green00F875.withValues(alpha: 0.04),
          ],
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}

class _EmptyOnMic extends StatelessWidget {
  const _EmptyOnMic();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: Row(
        children: [
          const SizedBox(width: 12),
          Chimo.image(AppAssets.roomSeatEmpty, width: 48, height: 48, color: Colors.white),
          const SizedBox(width: 10),
          const Text('No Guests', style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 14)),
        ],
      ),
    );
  }
}

class _GuestSwitch extends StatelessWidget {
  const _GuestSwitch({required this.index, required this.onChanged});

  final int index;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 304,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColors.rgba(236, 237, 255, 0.04),
        borderRadius: BorderRadius.circular(21),
      ),
      child: Row(children: [_item('In-Room Guests', 0), _item('Off-Room Guests', 1)]),
    );
  }

  Widget _item(String label, int i) {
    final active = index == i;
    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(i),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? AppColors.rgba(255, 255, 255, 0.16) : AppColors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: active ? AppColors.white : AppColors.gray9A9A9A,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

/// 对齐 oumi `HtManageUserItem`。
class _UserItem extends StatelessWidget {
  const _UserItem({
    required this.info,
    required this.status,
    required this.position,
    required this.uidOnMic,
    required this.invitedAt,
    required this.onInvite,
    required this.onKick,
    required this.onOffMic,
    required this.onBring,
    this.embedded = false,
  });

  final HeartiesInfo info;
  final _UserStatus status;
  final int position;
  final int uidOnMic;
  final Map<int, DateTime> invitedAt;
  final bool embedded;
  final Future<void> Function(int uid) onInvite;
  final Future<void> Function(int uid) onKick;
  final Future<void> Function(int uid) onOffMic;
  final Future<void> Function(int uid, int position, int uidOnMic) onBring;

  @override
  Widget build(BuildContext context) {
    final user = info.hasUser() ? info.user : null;
    final uid = user?.id.toInt() ?? 0;
    final nick = user?.nickname.trim() ?? '';
    final name = nick.isEmpty ? 'User' : nick;
    final invited = invitedAt.containsKey(uid);
    return Container(
      height: 118,
      margin: embedded ? EdgeInsets.zero : const EdgeInsets.fromLTRB(16, 0, 16, 10),
      padding: const EdgeInsets.fromLTRB(12, 15, 12, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: embedded ? null : AppColors.black1C1C1E,
        gradient: embedded
            ? LinearGradient(
                colors: [
                  AppColors.green00F875.withValues(alpha: 0.10),
                  AppColors.green00F875.withValues(alpha: 0.04),
                ],
              )
            : null,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Chimo.image(
                user?.avatar ?? '',
                width: 48,
                height: 48,
                circle: true,
                fallbackAsset: AppAssets.avatarPlace,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (user != null && user.genderKnown) ...[
                          const SizedBox(width: 4),
                          GenderAgeChip(isMale: user.male, age: user.age),
                        ],
                        if (user != null && (user.vipSmallIcon ?? '').isNotEmpty) ...[
                          const SizedBox(width: 4),
                          Chimo.image(user.vipSmallIcon!, width: 18, height: 18),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _statusLine(uid, invited),
                      style: TextStyle(
                        color: status == _UserStatus.offRoom && (user?.online ?? false)
                            ? AppColors.green00F875
                            : AppColors.gray9A9A9A,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.green00F875.withValues(alpha: 0.05),
                  AppColors.green00F875.withValues(alpha: 0.18),
                  AppColors.green00F875.withValues(alpha: 0.05),
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          _actions(uid, invited),
        ],
      ),
    );
  }

  String _statusLine(int uid, bool invited) {
    switch (status) {
      case _UserStatus.onMic:
      case _UserStatus.inRoom:
        return 'Time in room: ${_formatJoin(info.joinTime.toInt())}';
      case _UserStatus.offRoom:
        if (invited) {
          final at = invitedAt[uid];
          final mins = at == null ? 0 : DateTime.now().difference(at).inMinutes;
          return 'Reply pending ($mins mins)';
        }
        if (info.hasUser() && info.user.online) return 'Online';
        return 'Offline';
    }
  }

  String _formatJoin(int joinTime) {
    if (joinTime <= 0) return '0min';
    final sec = DateTime.now().millisecondsSinceEpoch ~/ 1000 - joinTime;
    if (sec <= 0) return '0min';
    final h = sec ~/ 3600;
    final m = (sec % 3600) ~/ 60;
    if (h > 0) return '${h}h ${m}min';
    return '${m}min';
  }

  Widget _actions(int uid, bool invited) {
    switch (status) {
      case _UserStatus.onMic:
        return Row(
          children: [
            Expanded(
              child: _Btn(
                label: 'Dismiss',
                height: 28,
                fill: AppColors.black2A2A2A,
                textColor: AppColors.green00F875,
                onTap: () => onKick(uid),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _Btn(
                label: 'Turn off mic',
                height: 28,
                fill: AppColors.black2A2A2A,
                textColor: AppColors.white,
                onTap: () => onOffMic(uid),
              ),
            ),
          ],
        );
      case _UserStatus.inRoom:
        return Row(
          children: [
            Expanded(
              child: _Btn(
                label: 'Dismiss',
                height: 28,
                fill: AppColors.black2A2A2A,
                textColor: AppColors.green00F875,
                onTap: () => onKick(uid),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _Btn(
                label: 'Bring to Mic',
                height: 28,
                gradient: AppColors.primaryGradient,
                textColor: AppColors.black1F2518,
                onTap: () => onBring(uid, position, uidOnMic),
              ),
            ),
          ],
        );
      case _UserStatus.offRoom:
        if (invited) {
          return Align(
            alignment: Alignment.centerRight,
            child: Opacity(
              opacity: 0.7,
              child: _Btn(
                label: 'Invited',
                height: 28,
                width: 90,
                fill: AppColors.transparent,
                textColor: AppColors.green00F875,
                border: AppColors.green00F875,
                onTap: () {},
              ),
            ),
          );
        }
        return Align(
          alignment: Alignment.centerRight,
          child: _Btn(
            label: 'Invite',
            height: 28,
            width: 90,
            gradient: AppColors.primaryGradient,
            textColor: AppColors.black1F2518,
            onTap: () => onInvite(uid),
          ),
        );
    }
  }
}

class _Btn extends StatelessWidget {
  const _Btn({
    required this.label,
    required this.onTap,
    this.height = 44,
    this.width,
    this.fill,
    this.gradient,
    this.textColor = AppColors.white,
    this.border,
  });

  final String label;
  final VoidCallback onTap;
  final double height;
  final double? width;
  final Color? fill;
  final Gradient? gradient;
  final Color textColor;
  final Color? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: gradient == null ? fill : null,
          gradient: gradient,
          borderRadius: BorderRadius.circular(height / 2),
          border: border == null ? null : Border.all(color: border!),
        ),
        child: Text(
          label,
          style: TextStyle(color: textColor, fontSize: 11, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

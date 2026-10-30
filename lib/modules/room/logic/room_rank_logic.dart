import 'package:get/get.dart';

import '../../../app/chimo_api.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/models/server_client/rtc.pb.dart';
import '../service/room_service.dart';
import 'mic_logic.dart';

/// 排行榜 Tab。对齐 Cosmic：Members / Top Givers / Top Receivers。
enum RoomRankTab { members, givers, receivers }

/// 送礼 / 收礼日周切换。对齐 joyride `cash_day` / `cash_week`。
enum RoomRankPeriod { daily, weekly }

/// 房间排行榜。接口对齐 joyride `getChannelUserList`。
class RoomRankLogic extends GetxController {
  RoomRankLogic({required this.rid, this.initial = RoomRankTab.members});

  final int rid;
  final RoomRankTab initial;

  final tab = RoomRankTab.members.obs;
  final period = RoomRankPeriod.daily.obs;
  final users = <SimpleChannelUser>[].obs;
  final myself = Rxn<SimpleChannelUser>();
  final loading = false.obs;
  final error = ''.obs;

  /// 对齐 joyride `RankDateEnumExt.getScope`。
  String get scope {
    switch (tab.value) {
      case RoomRankTab.members:
        return '';
      case RoomRankTab.givers:
        return period.value == RoomRankPeriod.daily ? 'cash_day' : 'cash_week';
      case RoomRankTab.receivers:
        return period.value == RoomRankPeriod.daily ? 'charm_day' : 'charm_week';
    }
  }

  String get backgroundAsset {
    switch (tab.value) {
      case RoomRankTab.members:
        return '';
      case RoomRankTab.givers:
        return AppAssets.roomTopGiverBg;
      case RoomRankTab.receivers:
        return AppAssets.roomTopReceiverBg;
    }
  }

  bool get showPeriod => tab.value != RoomRankTab.members;

  bool get showPodium => tab.value != RoomRankTab.members;

  bool get showValue => tab.value != RoomRankTab.members;

  List<SimpleChannelUser> get topThree {
    if (!showPodium) return const [];
    return users.take(3).toList();
  }

  List<SimpleChannelUser> get listUsers {
    if (!showPodium) return users.toList();
    if (users.length <= 3) return const [];
    return users.sublist(3);
  }

  @override
  void onInit() {
    tab.value = initial;
    super.onInit();
    load();
  }

  void selectTab(RoomRankTab next) {
    if (tab.value == next) return;
    tab.value = next;
    load();
  }

  void selectPeriod(RoomRankPeriod next) {
    if (period.value == next) return;
    period.value = next;
    load();
  }

  Future<void> load() async {
    if (rid <= 0) {
      error.value = 'Room unavailable';
      return;
    }
    loading.value = true;
    error.value = '';
    final result = await ChimoApis.room.channelUsers(rid, count: 50, scope: scope);
    loading.value = false;
    if (!result.ok || result.data == null) {
      error.value = result.message.isEmpty ? 'Failed to load' : result.message;
      users.clear();
      myself.value = null;
      return;
    }
    final data = result.data!;
    users.assignAll(data.users);
    myself.value = data.hasMyself() ? data.myself : null;
    if (tab.value == RoomRankTab.members && data.total > 0) {
      final service = RoomService.findOrNull();
      if (service != null && service.online.value != data.total) {
        service.online.value = data.total;
      }
    }
  }

  /// 麦位序号（展示 Seat N）；不在麦上返回 null。
  int? seatNo(int uid) {
    if (uid <= 0 || !Get.isRegistered<MicLogic>()) return null;
    for (final seat in Get.find<MicLogic>().seats) {
      if (seat.uid == uid) return seat.index + 1;
    }
    return null;
  }

  static bool isMale(SimpleChannelUser user) {
    switch (user.gender.trim().toLowerCase()) {
      case 'female':
      case 'f':
      case '2':
        return false;
      default:
        return true;
    }
  }
}

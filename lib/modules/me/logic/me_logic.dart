import 'dart:async';

import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/utils/app_toast.dart';
import '../model/me_menu_data.dart';

/// Me 页的资料、社交计数与快捷入口。
class MeLogic extends GetxController {
  final Rx<User> profile = User().obs;

  /// 首帧就是加载中（原页面 `bool _loading = true`）。
  final RxBool loading = true.obs;

  /// 邮箱已绑定后隐藏 Bind Email（邮箱登录或走过绑定流程）。
  final RxBool hasBoundEmail = false.obs;

  /// 钱包展示文案。对齐 oumi `CashApi.getCurrUserCash` → `showCoin`。
  final RxString coinText = '0'.obs;

  /// `onReady` = 首帧之后，等价于原页面 `initState` 里的
  /// `addPostFrameCallback`。
  @override
  void onReady() {
    super.onReady();
    unawaited(load());
  }

  /// 紧凑社交计数（如 208、1.2K、88K）。
  static String formatCount(int value) {
    if (value < 1000) return '$value';
    if (value < 10000) {
      final k = value / 1000;
      final text = k == k.roundToDouble() ? '${k.toInt()}' : k.toStringAsFixed(1);
      return '${text}K';
    }
    if (value < 1000000) return '${value ~/ 1000}K';
    final m = value / 1000000;
    final text = m == m.roundToDouble() ? '${m.toInt()}' : m.toStringAsFixed(1);
    return '${text}M';
  }

  List<MeStatItem> get stats {
    final p = profile.value;
    return [
      MeStatItem(
        label: 'Friends',
        value: formatCount(p.friendNum),
        badge: p.newFriendCount.toInt(),
      ),
      MeStatItem(label: 'Follow', value: formatCount(p.followNum)),
      MeStatItem(
        label: 'Followers',
        value: formatCount(p.fanNum),
        badge: p.newFollowerCount.toInt(),
      ),
      MeStatItem(
        label: 'Visitors',
        value: formatCount(p.viewNum),
        badge: p.newVisitorCount.toInt(),
      ),
    ];
  }

  /// 财富等级。`vipLevel == 0` 仍展示 `Lv.0`。
  String get wealthText => 'Lv.${profile.value.vipLevel}';

  /// 爵位。无等级时对齐设计稿 “No Title Yet”。
  String get peerageText {
    final level = profile.value.knightLevel;
    if (level <= 0) return 'No Title Yet';
    return 'Lv.$level';
  }

  String get inviteUrl => profile.value.inviteCodeEntrance.trim();

  List<QuickAccessItem> get menuItems {
    if (hasBoundEmail.value) {
      return MeMenuData.menuItems
          .where((item) => item.id != 'bind_email')
          .toList(growable: false);
    }
    return MeMenuData.menuItems;
  }

  /// 拉资料 + 余额。余额失败不挡资料。对齐 oumi `refreshCoins`。
  Future<void> load() async {
    try {
      final profileFuture = ChimoApis.user.profile();
      final cashFuture = ChimoApis.cash.balance();
      final res = await profileFuture;
      final cash = await cashFuture;
      if (!res.ok || res.data == null) {
        loading.value = false;
        if (res.isNotLogin) AppJumper.toLoginAndClear();
        return;
      }

      profile.value = res.data!.user;
      hasBoundEmail.value = profile.value.email.isNotEmpty;
      if (cash.ok && cash.data != null) {
        final show = cash.data!.showCoin.trim();
        coinText.value = show.isNotEmpty ? show : _comma(cashCoins(cash.data!));
      }
      loading.value = false;
    } catch (failure) {
      loading.value = false;
      AppToast.error('Failed to load profile: $failure');
    }
  }

  String _comma(int value) {
    final raw = '$value';
    final buffer = StringBuffer();
    for (var i = 0; i < raw.length; i++) {
      final fromEnd = raw.length - i;
      if (i > 0 && fromEnd % 3 == 0) buffer.write(',');
      buffer.write(raw[i]);
    }
    return buffer.toString();
  }

  // 跳转回来要改的是 profile，那份状态在这一层（和 EditProfileLogic 一样）。

  Future<void> openPersonalProfile() async {
    final updated = await AppJumper.toPersonalProfile(profile: profile.value);
    if (isClosed || updated == null) return;
    profile.value = updated;
  }

  Future<void> openEditProfile() async {
    final updated = await AppJumper.toEditProfile(profile: profile.value);
    if (isClosed || updated == null) return;
    profile.value = updated;
  }

  Future<void> openStat(MeStatItem item) async {
    if (item.label == 'Visitors') {
      await AppJumper.toVisits();
      await load();
      return;
    }
    final tab = switch (item.label) {
      'Friends' => 0,
      'Followers' => 2,
      'Follow' => 1,
      _ => null,
    };
    if (tab == null) return;
    await AppJumper.toFriends(initialTab: tab);
  }

  Future<void> onQuickAccess(String id) async {
    switch (id) {
      case 'debug':
        await AppJumper.toDebug();
      case 'honor':
        await AppJumper.toMyHonor();
      case 'bind_email':
        final bound = await AppJumper.toBindEmail();
        if (bound == true) await load();
      case 'about':
        await AppJumper.toAboutUs();
      case 'information':
        await openEditProfile();
      case 'help':
        await AppJumper.toHelp();
      case 'settings':
        await AppJumper.toSettings();
      case 'wallet':
        await AppJumper.toWallet();
        await load();
      case 'level':
        await openLevel();
      case 'invite':
        final url = inviteUrl;
        if (url.isEmpty) {
          AppToast.info('Coming soon');
          return;
        }
        await AppJumper.toWeb(url: url, title: 'Invite & Earn');
      default:
        AppToast.info('Coming soon');
    }
  }

  /// 等级页要带四个初始值过去（首帧预填）。
  Future<void> openLevel() async {
    final p = profile.value;
    await AppJumper.toLevel(
      level: p.vipLevel,
      experience: p.experience.toInt(),
      moreExpForNextLevel: p.moreExpForNextLevel.toInt(),
      totalExperience: p.totalExperience.toInt(),
    );
  }
}

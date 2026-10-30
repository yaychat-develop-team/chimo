import 'dart:async';

import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
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
      MeStatItem(label: 'Friends', value: formatCount(p.friendNum)),
      MeStatItem(label: 'Follows', value: formatCount(p.followNum)),
      MeStatItem(label: 'Fans', value: formatCount(p.fanNum)),
      MeStatItem(label: 'Visitors', value: formatCount(p.viewNum)),
    ];
  }

  List<QuickAccessItem> get quickAccess {
    if (hasBoundEmail.value) {
      return MeMenuData.quickAccess
          .where((item) => item.id != 'bind_email')
          .toList(growable: false);
    }
    return MeMenuData.quickAccess;
  }

  /// 拉资料 + 访客数。失败 toast。
  Future<void> load() async {
    try {
      final profileFuture = ChimoApis.user.profile();
      // Me「Visitors」= Visits 列表中的去重人数（不是 viewNum 总次数）。
      final visitsFuture = ChimoApis.relation.viewedBy();
      final res = await profileFuture;
      await visitsFuture;
      if (!res.ok || res.data == null) {
        loading.value = false;
        if (res.isNotLogin) AppJumper.toLoginAndClear();
        return;
      }

      profile.value = res.data!.user;
      hasBoundEmail.value = profile.value.email.isNotEmpty;
      loading.value = false;
    } catch (failure) {
      loading.value = false;
      AppToast.error('Failed to load profile: $failure');
    }
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
      'Fans' => 2,
      'Follows' => 1,
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

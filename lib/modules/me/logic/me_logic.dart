import 'dart:async';

import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/storage/user_store.dart';
import '../../../app/chimo_api.dart';
import '../../../app/network/network_bootstrap.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../friends/model/friends_tab.dart';
import '../model/me_menu_data.dart';

/// Me 页的资料、社交计数与快捷入口。
///
/// 由 [MainTabShell] 自持：`MePage` 是 `IndexedStack` 里的 `const` 子节点，
/// 加不了参数也不该自己管生命周期（见 `MainTabShell` 那段注释）。
///
/// 约定：一次性的 toast 文案由方法 `return` 给 View（Controller 不 import
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

  /// 拉资料 + 访客数。返回 `null` = 没什么要提示的，非 `null` = 要 toast 的文案。
  Future<String?> load() async {
    try {
      final profileFuture = ChimoApis.user.profileOrNull();
      // Me「Visitors」= Visits 列表中的去重人数（不是 viewNum 总次数）。
      final visitsFuture = ChimoApis.relation.viewedBy();
      final res = await profileFuture;
      final visitsRes = await visitsFuture;
      if (isClosed) return null;
      if (!res.ok || res.data == null) {
        loading.value = false;
        // 掉登录态就踢回登录页，这时候不要再 toast。
        if (res.isNotLogin) AppJumper.toLoginAndClear();
        return null;
      }
      final parsed = res.data!;
      final sessionEmail = UserStore.currentUser.email?.trim() ?? '';
      final loginMethod = UserStore.currentUser.method;
      final email = parsed.email.trim().isNotEmpty ? parsed.email.trim() : sessionEmail;
      final next = parsed.deepCopy();
      if (email.isNotEmpty && email != parsed.email) next.email = email;
      if (visitsRes.ok && visitsRes.data != null) {
        next.viewNum = visitsRes.data!.length;
      }
      profile.value = next;
      hasBoundEmail.value = email.isNotEmpty || loginMethod == 'email';
      loading.value = false;
      final avatar = next.avatar.trim();
      await UserStore.update(
        (cache) => cache.patch(
          nickname: next.nickname,
          avatarUrl: avatar.isEmpty ? null : avatar,
          userId: next.id.toString(),
          email: email.isEmpty ? null : email,
          gender: next.gender,
        ),
      );
      // 应用 token 刷新路径后保持 IM 在线。
      unawaited(NetworkBootstrap.connectImAfterLogin());
      return null;
    } catch (failure) {
      if (isClosed) return null;
      loading.value = false;
      return 'Failed to load profile: $failure';
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

  /// 点社交计数：Visitors 进访客页（回来要刷新计数），其余进好友页对应 Tab。
  Future<String?> openStat(MeStatItem item) async {
    if (item.label == 'Visitors') {
      await AppJumper.toVisits();
      if (isClosed) return null;
      return await load();
    }
    final tab = switch (item.label) {
      'Friends' => FriendsTab.friends,
      'Fans' => FriendsTab.followers,
      'Follows' => FriendsTab.follow,
      _ => null,
    };
    if (tab == null) return null;
    await AppJumper.toFriends(initialTab: tab);
    return null;
  }

  Future<String?> onQuickAccess(String id) async {
    switch (id) {
      case 'debug':
        await AppJumper.toDebug();
      case 'bind_email':
        final bound = await AppJumper.toBindEmail();
        // 绑定成功后要重新拉一次：邮箱变了，Bind Email 入口也该消失。
        if (isClosed || bound != true) return null;
        return await load();
      case 'about':
        await AppJumper.toAboutUs();
      case 'information':
        await openEditProfile();
      case 'help':
        await AppJumper.toHelp();
      case 'settings':
        await AppJumper.toSettings();
    }
    return null;
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

import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../app/global_config.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/text_fmt.dart';
import '../model/me_menu_data.dart';

/// Me 页：资料、社交计数、快捷入口。
class MeLogic extends GetxController {
  final profile = User().obs;
  final loading = true.obs;
  final coinText = '0'.obs;

  @override
  void onReady() {
    super.onReady();
    load();
  }

  List<MeStatItem> get stats {
    final p = profile.value;
    return [
      MeStatItem(
        label: 'Friends',
        value: TextFmt.compact(p.friendNum),
        badge: p.newFriendCount.toInt(),
      ),
      MeStatItem(label: 'Follow', value: TextFmt.compact(p.followNum)),
      MeStatItem(
        label: 'Followers',
        value: TextFmt.compact(p.fanNum),
        badge: p.newFollowerCount.toInt(),
      ),
      MeStatItem(
        label: 'Visitors',
        value: TextFmt.compact(p.viewNum),
        badge: p.newVisitorCount.toInt(),
      ),
    ];
  }

  String get wealthText => 'Lv.${profile.value.vipLevel}';

  String get peerageText {
    final level = profile.value.knightLevel;
    return level <= 0 ? 'No Title Yet' : 'Lv.$level';
  }

  String get inviteUrl => profile.value.inviteCodeEntrance.trim();

  /// 资料与余额并行；余额失败不挡资料。
  Future<void> load() async {
    try {
      final profileFuture = ChimoApis.user.profile();
      final cashFuture = ChimoApis.cash.balance();
      final res = await profileFuture;
      if (!res.ok || res.data == null) {
        if (res.isNotLogin) AppJumper.toLoginAndClear();
        return;
      }
      profile.value = res.data!.user;
      final cash = await cashFuture;
      if (cash.ok && cash.data != null) {
        final show = int.tryParse(cash.data!.showCoin.trim())?.toString() ?? '';
        coinText.value = show.isNotEmpty ? show : cashCoins(cash.data!).toString();
      }
    } catch (e) {
      AppToast.error('Failed to load profile: $e');
    } finally {
      loading.value = false;
    }
  }

  Future<void> openPersonalProfile() async {
    final updated = await AppJumper.toPersonalProfile(profile: profile.value);
    if (updated != null) profile.value = updated;
  }

  Future<void> openEditProfile() async {
    final updated = await AppJumper.toEditProfile();
    if (updated != null) {
      profile.value = updated;
    } else {
      await load();
    }
  }

  Future<void> openStat(MeStatItem item) async {
    if (item.label == 'Visitors') {
      await AppJumper.toVisits();
      await load();
      return;
    }
    final tab = switch (item.label) {
      'Friends' => 0,
      'Follow' => 1,
      'Followers' => 2,
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
      case 'frame':
        await AppJumper.toMyFrame();
      case 'echo':
        await AppJumper.toEchoHall();
      case 'bind_email':
        if (await AppJumper.toBindEmail() == true) await load();
      case 'about':
        await AppJumper.toAboutUs();
      case 'information':
        await openEditProfile();
      case 'reveal_card':
        await AppJumper.toEditRevealCard();
      case 'help':
        await AppJumper.toHelp();
      case 'settings':
        await AppJumper.toSettings();
      case 'magic':
        await _openUrl(GlobalConfig.settingsResp?.aiProfileUrl, title: 'Create Magic Photo');
      case 'verify':
        await _openUrl(GlobalConfig.confResp?.gsVerifyUrl, title: 'Verification Center');
      case 'workbench':
        await _openUrl(GlobalConfig.settingsResp?.handlerWorkUrl, title: 'Guest Workbench');
      case 'feedback':
        final emId = GlobalConfig.confResp?.feedbackEmUsername.trim() ?? '';
        if (emId.isEmpty) {
          AppToast.info('Coming soon');
          return;
        }
        await AppJumper.toChat(emId);
      case 'wallet':
        await AppJumper.toWallet();
        await load();
      case 'level':
        await openLevel();
      case 'invite':
        if (inviteUrl.isEmpty) {
          AppToast.info('Coming soon');
          return;
        }
        await AppJumper.toWeb(url: inviteUrl, title: 'Invite & Earn');
      default:
        AppToast.info('Coming soon');
    }
  }

  Future<void> openLevel() async {
    final p = profile.value;
    await AppJumper.toLevel(
      level: p.vipLevel,
      experience: p.experience.toInt(),
      moreExpForNextLevel: p.moreExpForNextLevel.toInt(),
      totalExperience: p.totalExperience.toInt(),
    );
  }

  Future<void> _openUrl(String? raw, {required String title}) async {
    final url = raw?.trim() ?? '';
    if (url.isEmpty) {
      AppToast.info('Coming soon');
      return;
    }
    await AppJumper.toWeb(url: url, title: title);
  }
}

import 'dart:async';
import 'dart:math' as math;

import 'package:fixnum/fixnum.dart';
import 'package:get/get.dart';

import '../../../../app/chimo_api.dart';
import '../../../../common/models/server_client/user.pb.dart';

/// 单对象取数，不用 [AsyncListLogic]（那个是列表页的）。四个初始值由
/// `LevelPage` 的构造参数传进来，只作首帧预填 —— `onReady` 会再拉一次盖掉。
class LevelLogic extends GetxController {
  LevelLogic({
    int initialLevel = 0,
    int initialExperience = 0,
    int initialMoreExpForNextLevel = 0,
    int initialTotalExperience = 0,
  }) : profile =
           (User()
                 ..vipLevel = initialLevel
                 ..experience = Int64(initialExperience)
                 ..moreExpForNextLevel = initialMoreExpForNextLevel
                 ..totalExperience = Int64(initialTotalExperience))
               .obs;

  final Rx<User> profile;

  /// 首帧就是加载中（原页面 `bool _loading = true`）。
  final RxBool loading = true.obs;

  bool get isMaxLevel => profile.value.vipLevel >= 60;

  /// 选择卡片/徽章色阶。
  int get levelIndex {
    final vipLevel = profile.value.vipLevel;
    if (vipLevel <= 5) return 0;
    if (vipLevel <= 10) return 1;
    if (vipLevel <= 20) return 2;
    if (vipLevel <= 30) return 3;
    if (vipLevel <= 40) return 4;
    return 5;
  }

  int get displayedExperience {
    final p = profile.value;
    if (isMaxLevel) return p.totalExperience.toInt();
    final v = p.experience.toInt() - p.moreExpForNextLevel.toInt();
    return v < 0 ? 0 : v;
  }

  String get experienceText {
    if (isMaxLevel) {
      return 'Current experience point:${profile.value.totalExperience.toInt()}';
    }
    return 'Current experience point:$displayedExperience';
  }

  String get levelUpText {
    if (isMaxLevel) return '';
    return '${profile.value.moreExpForNextLevel.toInt()} points to level up';
  }

  double get percent {
    final p = profile.value;
    if (isMaxLevel) return 1;
    final total = p.experience.toInt();
    if (total <= 0) return 0;
    return math.min(1.0, 1 - p.moreExpForNextLevel.toInt() / total.toDouble());
  }

  /// `onReady` = 首帧之后，等价于原页面 `initState` 里的
  /// `addPostFrameCallback`。
  @override
  void onReady() {
    super.onReady();
    unawaited(load());
  }

  Future<void> load() async {
    loading.value = true;
    try {
      final res = await ChimoApis.user.profileOrNull();
      if (isClosed) return;
      // 拿不到就保留预填值 —— 别把已经画出来的等级清成 0。
      final next = res.data;
      if (next != null) profile.value = next;
    } catch (_) {
      // 见类注释：等级页取数失败不打扰用户。
    } finally {
      if (!isClosed) loading.value = false;
    }
  }
}

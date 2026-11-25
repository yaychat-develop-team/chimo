import '../../app/app_config.dart';

/// 站外固定页面。协议、官网不要在各页面里再写一遍。
abstract final class AppLinks {
  static const String userAgreement = 'https://www.chimoapp.com/agreements/yonghufuwu.html';
  static const String privacyAgreement = 'https://www.chimoapp.com/agreements/yinsi.html';
  static const String accountCancellation = 'https://www.chimoapp.com/agreements/zhanghuzhuxiao.html';
  static const String officialWebsite = 'https://test-h5.chimoapp.com';

  /// H5 活动页根域名。
  ///
  /// 当前测试/正式环境活动页部署在 yaychat H5（与接口、`gsWorkbenchUrl` 同源）；
  /// `*.chimoapp.com` 仅有营销落地页，没有 `IntimacyMission` 等活动路由。
  static String get h5Host =>
      AppConfig.isOfficial ? 'https://h5.yaychat.net' : 'https://test-h5.yaychat.net';

  /// 21 日亲密任务页。对齐 joyride `UrlConfig.intimacyMission`。
  static String intimacyMission(String activityId) =>
      '$h5Host/IntimacyMission?activityId=$activityId&is_full_screen=1';
}

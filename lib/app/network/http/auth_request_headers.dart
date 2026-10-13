import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../storage/app_storage.dart';

/// forya `GlobalConfig.commonParam` 的尽力子集。
///
/// 写入 HTTP 时必须加 `df_` 前缀（见 Dio [HeaderInterceptor] / forya）。
abstract final class AuthRequestHeaders {
  static const _distinctIdKey = 'te_distinct_id';

  /// 未加前缀的公共参数（对齐 forya `GlobalConfig.commonParam`）。
  static Map<String, String> commonParam = {
    'accept_language': 'en_US',
    'system_language': 'en_US',
    'platform': 'android',
    'app_id': '1003',
  };

  static Future<void> initialize() async {
    final next = <String, String>{
      'accept_language': 'en_US',
      'system_language': 'en_US',
      'platform': Platform.isIOS ? 'ios' : 'android',
      'app_id': '1003',
      'timezone': '${DateTime.now().timeZoneName},${DateTime.now().timeZoneOffset.inMilliseconds}',
    };

    try {
      final info = await PackageInfo.fromPlatform();
      next['app_version'] = info.version;
      next['package_name'] = info.packageName;
    } catch (_) {
      // 包信息取不到就不带这两个头（服务端非必填）。
    }

    // 设备标识：首次生成后长期不变，之后每次冷启动都从 settings box 读回来。
    final stored = AppStorage.settings?.get(_distinctIdKey);
    var distinctId = stored is String ? stored : '';
    if (distinctId.isEmpty) {
      distinctId = '${DateTime.now().millisecondsSinceEpoch}_${Platform.operatingSystem}';
      await AppStorage.settings?.put(_distinctIdKey, distinctId);
    }
    next['te_distinct_id'] = distinctId;

    try {
      final plugin = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final info = await plugin.androidInfo;
        next['device_model'] = [
          info.manufacturer,
          info.brand,
          info.model,
        ].where((e) => e.isNotEmpty).join(' ');
        next['device_id'] = info.id;
        next['mac'] = info.fingerprint;
        next['channel'] = 'google';
      } else if (Platform.isIOS) {
        final info = await plugin.iosInfo;
        next['device_model'] = info.utsname.machine;
        next['device_id'] = info.identifierForVendor ?? '';
        next['mac'] = info.identifierForVendor ?? '';
        next['channel'] = 'App Store';
      }
    } catch (_) {
      // 设备信息 / IDFA 取不到就不带（ATT 拒绝授权时本来就取不到）。
    }

    commonParam = next;
  }
}

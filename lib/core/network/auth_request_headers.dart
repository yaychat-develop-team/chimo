import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      'timezone':
          '${DateTime.now().timeZoneName},${DateTime.now().timeZoneOffset.inMilliseconds}',
    };

    try {
      final info = await PackageInfo.fromPlatform();
      next['app_version'] = info.version;
      next['package_name'] = info.packageName;
    } catch (_) {}

    try {
      final prefs = await SharedPreferences.getInstance();
      var distinctId = prefs.getString(_distinctIdKey) ?? '';
      if (distinctId.isEmpty) {
        distinctId =
            '${DateTime.now().millisecondsSinceEpoch}_${Platform.operatingSystem}';
        await prefs.setString(_distinctIdKey, distinctId);
      }
      next['te_distinct_id'] = distinctId;
    } catch (_) {}

    try {
      final plugin = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final info = await plugin.androidInfo;
        next['device_model'] =
            [info.manufacturer, info.brand, info.model].where((e) => e.isNotEmpty).join(' ');
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
    } catch (_) {}

    commonParam = next;
  }
}

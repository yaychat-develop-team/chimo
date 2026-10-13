import 'package:dio/dio.dart';

import '../../storage/app_storage.dart';
import '../http/app_http_client.dart';

/// 调试代理（对齐 forya CacheUtil `ip` / `port` + `JRNetwork.updateProxy`）。
///
/// key 加了 `proxy_` 前缀：`settings` box 是共用的，裸 `ip` / `port` 太容易撞。
abstract final class ProxyStore {
  static const _ipKey = 'proxy_ip';
  static const _portKey = 'proxy_port';

  static String ip = '';
  static String port = '';

  static bool get isConfigured => ip.trim().isNotEmpty && port.trim().isNotEmpty;

  /// 同步：box 已在 `main()` 里打开，取值命中内存。
  static void load() {
    ip = _read(_ipKey);
    port = _read(_portKey);
  }

  static String _read(String key) {
    final value = AppStorage.settings?.get(key);
    return value is String ? value.trim() : '';
  }

  static Future<void> save({required String ip, required String port}) async {
    ProxyStore.ip = ip.trim();
    ProxyStore.port = port.trim();
    await AppStorage.settings?.putAll(<String, Object?>{
      _ipKey: ProxyStore.ip,
      _portKey: ProxyStore.port,
    });
  }

  static Future<void> clear() async {
    ip = '';
    port = '';
    await AppStorage.settings?.deleteAll(<String>[_ipKey, _portKey]);
  }

  /// 给 [Dio] 挂上 HttpClient（IPv4 轮换 + 可选 Charles 代理）。
  static void configureDio(Dio dio) {
    AppHttpClient.attach(dio, proxyIp: isConfigured ? ip : '', proxyPort: isConfigured ? port : '');
  }
}

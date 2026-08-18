import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_http_client.dart';

/// 调试代理（对齐 forya CacheUtil `ip` / `port` + `JRNetwork.updateProxy`）。
abstract final class ProxyConfigStore {
  static const _ipKey = 'ip';
  static const _portKey = 'port';

  static String ip = '';
  static String port = '';

  static bool get isConfigured =>
      ip.trim().isNotEmpty && port.trim().isNotEmpty;

  static Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      ip = (prefs.getString(_ipKey) ?? '').trim();
      port = (prefs.getString(_portKey) ?? '').trim();
    } catch (_) {
      ip = '';
      port = '';
    }
  }

  static Future<void> save({
    required String ip,
    required String port,
  }) async {
    ProxyConfigStore.ip = ip.trim();
    ProxyConfigStore.port = port.trim();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_ipKey, ProxyConfigStore.ip);
      await prefs.setString(_portKey, ProxyConfigStore.port);
    } catch (_) {}
  }

  static Future<void> clear() async {
    ip = '';
    port = '';
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_ipKey);
      await prefs.remove(_portKey);
    } catch (_) {}
  }

  /// 给 [Dio] 挂上 HttpClient（IPv4 轮换 + 可选 Charles 代理）。
  static void configureDio(Dio dio) {
    AppHttpClient.attach(
      dio,
      proxyIp: isConfigured ? ip : '',
      proxyPort: isConfigured ? port : '',
    );
  }
}

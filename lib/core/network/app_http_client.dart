import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

/// Cloudflare 多 A 记录时，坏 POP 会 TLS 成功但永不回包。
/// 记住最近超时的 IP，下次换一条。
final class AddressPool {
  AddressPool({this.quarantineFor = const Duration(minutes: 10)});

  final Duration quarantineFor;
  final Map<String, DateTime> _quarantine = {};
  int _rr = 0;
  String? lastKey;

  InternetAddress pick(
    String host,
    List<InternetAddress> addrs, [
    DateTime? now,
  ]) {
    if (addrs.isEmpty) {
      throw const SocketException('No address');
    }
    final t = now ?? DateTime.now();
    _quarantine.removeWhere((_, until) => !until.isAfter(t));
    var healthy = [
      for (final a in addrs)
        if (!_quarantine.containsKey('$host:${a.address}')) a,
    ];
    if (healthy.isEmpty) {
      _quarantine.removeWhere((k, _) => k.startsWith('$host:'));
      healthy = List<InternetAddress>.of(addrs);
    }
    final addr = healthy[_rr++ % healthy.length];
    lastKey = '$host:${addr.address}';
    return addr;
  }

  void quarantineLast([DateTime? now]) {
    final key = lastKey;
    if (key == null) return;
    _quarantine[key] = (now ?? DateTime.now()).add(quarantineFor);
  }
}

/// 默认 HttpClient：短 keep-alive + IPv4 轮换，避免粘在挂死的 Cloudflare POP。
abstract final class AppHttpClient {
  static final AddressPool pool = AddressPool();

  static void quarantineLast() => pool.quarantineLast();

  static void attach(
    Dio dio, {
    String proxyIp = '',
    String proxyPort = '',
  }) {
    final proxy = proxyIp.trim().isNotEmpty && proxyPort.trim().isNotEmpty
        ? '${proxyIp.trim()}:${proxyPort.trim()}'
        : '';
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient()
          ..idleTimeout = Duration.zero
          ..connectionTimeout = const Duration(seconds: 10);
        if (proxy.isNotEmpty) {
          client.findProxy = (url) {
            return HttpClient.findProxyFromEnvironment(
              url,
              environment: {
                'http_proxy': proxy,
                'https_proxy': proxy,
              },
            );
          };
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        }
        client.findProxy = (_) => 'DIRECT';
        client.connectionFactory = (uri, proxyHost, proxyPort) async {
          if (proxyHost != null && proxyPort != null) {
            return Socket.startConnect(proxyHost, proxyPort);
          }
          return ConnectionTask.fromSocket(
            _connect(uri.host, uri.port),
            () {},
          );
        };
        return client;
      },
    );
  }

  static Future<Socket> _connect(String host, int port) async {
    final looked = await InternetAddress.lookup(host);
    final ipv4 = [
      for (final a in looked)
        if (a.type == InternetAddressType.IPv4) a,
    ];
    final addrs = ipv4.isNotEmpty ? ipv4 : looked;
    final addr = pool.pick(host, addrs);
    // ignore: avoid_print
    print('AppHttpClient connect $host -> ${addr.address}:$port');
    final raw = await Socket.connect(
      addr,
      port,
      timeout: const Duration(seconds: 8),
    );
    try {
      // connectionFactory 不会自动升 TLS，必须自己按域名做 SNI。
      return await SecureSocket.secure(raw, host: host);
    } catch (_) {
      raw.destroy();
      rethrow;
    }
  }
}

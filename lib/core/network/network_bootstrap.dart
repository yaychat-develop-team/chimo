import 'dart:async';

import 'package:flutter/foundation.dart';

import '../auth/auth_session.dart';
import 'api_client.dart';
import 'api_config.dart';
import 'api_config_store.dart';
import 'chimo_api.dart';

/// App-wide network bootstrap: load env and optional heartbeat.
abstract final class NetworkBootstrap {
  static ApiClient? _client;
  static ChimoApi? _api;
  static Timer? _heartbeat;
  static String? authToken;

  static ApiClient get client => _client ??= ApiClient(
        tokenProvider: () => authToken,
      );

  static ChimoApi get api => _api ??= ChimoApi(client);

  static Future<ApiResponse> initialize({bool startHeartbeat = true}) async {
    await ApiConfigStore.load();
    authToken = await AuthSession.token();
    debugPrint(
      'NetworkBootstrap baseUrl=${ApiConfig.baseUrl} hasToken=${authToken != null}',
    );
    final result = await api.userOpen(open: false);
    if (startHeartbeat) {
      _heartbeat?.cancel();
      _heartbeat = Timer.periodic(const Duration(seconds: 30), (_) {
        unawaited(api.userOpen(open: false));
      });
    }
    return result;
  }

  static Future<void> applySessionToken(String? token) async {
    authToken = (token != null && token.isNotEmpty) ? token : null;
  }

  static Future<void> clearSession() async {
    authToken = null;
    await AuthSession.clear();
  }

  static void dispose() {
    _heartbeat?.cancel();
    _heartbeat = null;
    _client?.close();
    _client = null;
    _api = null;
  }
}

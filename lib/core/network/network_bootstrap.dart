import 'dart:async';

import 'package:flutter/foundation.dart';

import '../auth/auth_session.dart';
import '../im/im_service.dart';
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

    // Matches forya LoginManager auto-login: refresh token on cold start.
    if (authToken != null && authToken!.isNotEmpty) {
      await _tryRefreshToken(clearOnFailure: false);
    }

    final result = await api.userOpen(open: false);
    if (!result.success && result.message == 'user.not.login') {
      // Only wipe after open confirms the stored token is dead.
      await clearSession();
    } else if (result.success ||
        (authToken != null && authToken!.isNotEmpty)) {
      // Best-effort EaseMob login after app token is valid.
      unawaited(ImService.connectFromServer());
    }
    if (startHeartbeat) {
      _heartbeat?.cancel();
      _heartbeat = Timer.periodic(const Duration(seconds: 30), (_) {
        unawaited(_heartbeatTick());
      });
    }
    return result;
  }

  /// Rehydrate memory token from disk and optionally refresh once.
  static Future<bool> ensureSession({bool tryRefresh = true}) async {
    if (authToken == null || authToken!.isEmpty) {
      authToken = await AuthSession.token();
    }
    if (authToken == null || authToken!.isEmpty) return false;
    if (!tryRefresh) return true;
    return _tryRefreshToken(clearOnFailure: false);
  }

  /// Returns true when a usable token still exists after the attempt.
  static Future<bool> _tryRefreshToken({required bool clearOnFailure}) async {
    try {
      final refresh = await api.refreshToken();
      if (refresh.success) {
        final next = _tokenFromData(refresh.data);
        if (next != null) {
          await applySessionToken(next);
          await AuthSession.markLoggedIn(token: next);
          debugPrint('NetworkBootstrap token refreshed');
          return true;
        }
        // Refresh ok but no new token — keep current token.
        return authToken != null && authToken!.isNotEmpty;
      }

      // `unauthorized registration` and similar do not always mean the JWT is
      // dead; only clear on explicit not-login.
      if (refresh.message == 'user.not.login') {
        debugPrint('NetworkBootstrap refresh: user.not.login');
        if (clearOnFailure) await clearSession();
        return false;
      }
      debugPrint(
        'NetworkBootstrap refresh failed (keep token): '
        '${refresh.message} code=${refresh.code}',
      );
      return authToken != null && authToken!.isNotEmpty;
    } catch (error, stack) {
      debugPrint('NetworkBootstrap refresh error: $error\n$stack');
      return authToken != null && authToken!.isNotEmpty;
    }
  }

  static String? _tokenFromData(Object? data) {
    if (data is! Map) return null;
    final value = data['token'];
    if (value is String && value.isNotEmpty) return value;
    final text = '$value';
    return text.isEmpty || text == 'null' ? null : text;
  }

  static Future<void> _heartbeatTick() async {
    var res = await api.userOpen(open: false);
    if (res.success) return;
    if (res.message != 'user.not.login') return;

    // Soft recover: disk token / refresh, then re-probe once.
    final ok = await ensureSession(tryRefresh: true);
    if (!ok) {
      await clearSession();
      return;
    }
    res = await api.userOpen(open: false);
    if (!res.success && res.message == 'user.not.login') {
      await clearSession();
    }
  }

  /// Re-run [request] after a single session recovery when the first call
  /// returns `user.not.login`.
  static Future<ApiResponse> withSessionRetry(
    Future<ApiResponse> Function() request,
  ) async {
    final first = await request();
    if (first.success || first.message != 'user.not.login') return first;

    final recovered = await ensureSession(tryRefresh: true);
    if (!recovered) return first;
    return request();
  }

  static Future<void> applySessionToken(String? token) async {
    authToken = (token != null && token.isNotEmpty) ? token : null;
  }

  /// After successful OTP / token apply — pull EM creds and login.
  static Future<void> connectImAfterLogin() async {
    await ImService.connectFromServer();
  }

  /// Clears local session when the server reports the token is invalid.
  static Future<void> handleNotLogin() async {
    await clearSession();
  }

  static Future<void> clearSession() async {
    authToken = null;
    await AuthSession.clear();
    try {
      await ImService.logout();
    } catch (_) {}
  }

  static void dispose() {
    _heartbeat?.cancel();
    _heartbeat = null;
    _client?.close();
    _client = null;
    _api = null;
  }
}

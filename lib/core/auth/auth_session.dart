import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// Local auth session: cold start uses this to skip phone / OTP.
///
/// Stored as JSON under the application support directory.
abstract final class AuthSession {
  static const _fileName = 'auth_session.json';

  static Future<File> _sessionFile() async {
    final dir = await _storageDir();
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return File('${dir.path}/$_fileName');
  }

  static Future<Directory> _storageDir() async {
    try {
      return await getApplicationSupportDirectory();
    } catch (error, stack) {
      debugPrint('AuthSession path_provider failed: $error\n$stack');
      return Directory('${Directory.systemTemp.path}/chimo_auth');
    }
  }

  static Future<Map<String, dynamic>> _read() async {
    try {
      final file = await _sessionFile();
      if (!await file.exists()) return {};
      final raw = await file.readAsString();
      if (raw.trim().isEmpty) return {};
      final decoded = jsonDecode(raw);
      if (decoded is Map<String, dynamic>) return decoded;
      if (decoded is Map) {
        return decoded.map((key, value) => MapEntry('$key', value));
      }
    } catch (error, stack) {
      debugPrint('AuthSession read failed: $error\n$stack');
    }
    return {};
  }

  static Future<void> _write(Map<String, dynamic> data) async {
    final file = await _sessionFile();
    await file.writeAsString(jsonEncode(data), flush: true);
  }

  static Future<bool> isLoggedIn() async {
    final data = await _read();
    final token = data['token'];
    return data['loggedIn'] == true &&
        token is String &&
        token.isNotEmpty;
  }

  static Future<String?> phone() async {
    final data = await _read();
    final value = data['phone'];
    return value is String && value.isNotEmpty ? value : null;
  }

  static Future<String?> token() async {
    final data = await _read();
    final value = data['token'];
    return value is String && value.isNotEmpty ? value : null;
  }

  static Future<String?> userId() async {
    final data = await _read();
    final value = data['userId'];
    if (value is String && value.isNotEmpty) return value;
    if (value != null) {
      final text = '$value'.trim();
      if (text.isNotEmpty && text != 'null') return text;
    }
    // Recover uid from JWT when missing from session file.
    final t = data['token'];
    if (t is String && t.isNotEmpty) {
      final fromJwt = userIdFromJwt(t);
      if (fromJwt != null) {
        data['userId'] = fromJwt;
        await _write(data);
        return fromJwt;
      }
    }
    return null;
  }

  static Future<String?> nickname() async {
    final data = await _read();
    final value = data['nickname'];
    return value is String && value.isNotEmpty ? value : null;
  }

  static Future<String?> avatarUrl() async {
    final data = await _read();
    final value = data['avatarUrl'];
    return value is String && value.isNotEmpty ? value : null;
  }

  static Future<String?> emUsername() async {
    final data = await _read();
    final value = data['emUsername'];
    if (value is String && value.isNotEmpty) return value;
    final text = value == null ? '' : '$value'.trim();
    return text.isEmpty || text == 'null' ? null : text;
  }

  static Future<String?> emPassword() async {
    final data = await _read();
    final value = data['emPassword'];
    if (value is String && value.isNotEmpty) return value;
    final text = value == null ? '' : '$value'.trim();
    return text.isEmpty || text == 'null' ? null : text;
  }

  /// True when [otherId] is the logged-in user (group member, search hit…).
  static Future<bool> isCurrentUser(String? otherId) async {
    final a = (otherId ?? '').trim();
    if (a.isEmpty) return false;
    final me = await userId();
    if (me == null || me.isEmpty) return false;
    return me == a;
  }

  /// Best-effort uid from JWT (forya tokens put `uid` in the protected header).
  static String? userIdFromJwt(String token) {
    try {
      final parts = token.split('.');
      if (parts.length < 2) return null;
      for (final part in parts.take(2)) {
        final normalized = base64Url.normalize(part);
        final decoded = utf8.decode(base64Url.decode(normalized));
        final json = jsonDecode(decoded);
        if (json is! Map) continue;
        final uid = json['uid'] ?? json['userId'] ?? json['id'];
        if (uid == null) continue;
        final text = '$uid'.trim();
        if (text.isNotEmpty && text != 'null') return text;
      }
    } catch (_) {}
    return null;
  }

  static Future<String?> email() async {
    final data = await _read();
    final value = data['email'];
    return value is String && value.isNotEmpty ? value : null;
  }

  /// Persist last-used email without marking the session logged-in.
  static Future<void> rememberEmail(String email) async {
    final trimmed = email.trim();
    if (trimmed.isEmpty) return;
    final data = await _read();
    data['email'] = trimmed;
    await _write(data);
  }

  static Future<String?> loginMethod() async {
    final data = await _read();
    final value = data['method'];
    return value is String && value.isNotEmpty ? value : null;
  }

  /// [method]: `phone` / `email`. Omit to keep the previously stored method.
  static Future<void> markLoggedIn({
    String? method,
    String? phone,
    String? email,
    String? token,
    String? userId,
    String? nickname,
    String? avatarUrl,
    String? emUsername,
    String? emPassword,
  }) async {
    final data = await _read();
    data['loggedIn'] = true;
    if (method != null && method.isNotEmpty) data['method'] = method;
    if (phone != null && phone.isNotEmpty) data['phone'] = phone;
    if (email != null && email.isNotEmpty) data['email'] = email;
    if (token != null && token.isNotEmpty) {
      data['token'] = token;
      userId ??= userIdFromJwt(token);
    }
    if (userId != null && userId.isNotEmpty) data['userId'] = userId;
    if (nickname != null && nickname.isNotEmpty) data['nickname'] = nickname;
    if (avatarUrl != null && avatarUrl.isNotEmpty) {
      data['avatarUrl'] = avatarUrl;
    }
    if (emUsername != null && emUsername.isNotEmpty) {
      data['emUsername'] = emUsername;
    }
    if (emPassword != null && emPassword.isNotEmpty) {
      data['emPassword'] = emPassword;
    }
    await _write(data);
  }

  static Future<void> clear() async {
    try {
      final file = await _sessionFile();
      if (await file.exists()) await file.delete();
    } catch (error, stack) {
      debugPrint('AuthSession clear failed: $error\n$stack');
    }
  }
}

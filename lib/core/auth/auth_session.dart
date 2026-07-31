import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

/// Local auth session: cold start uses this to skip phone / OTP.
///
/// Stored as JSON under the app private directory to avoid native plugins that need symlinks.
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
    if (Platform.isAndroid) {
      // Matches Flutter default application-support path (see android applicationId).
      return Directory('/data/user/0/com.example.chimo/app_flutter');
    }
    if (Platform.isIOS) {
      // Writable temp fallback on simulator / device; switch to path_provider later.
      return Directory('${Directory.systemTemp.path}/chimo_auth');
    }
    return Directory('${Directory.systemTemp.path}/chimo_auth');
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
    return data['loggedIn'] == true;
  }

  static Future<String?> phone() async {
    final data = await _read();
    final value = data['phone'];
    return value is String && value.isNotEmpty ? value : null;
  }

  /// [method]: `phone` / `email`.
  static Future<void> markLoggedIn({
    String method = 'phone',
    String? phone,
  }) async {
    final data = await _read();
    data['loggedIn'] = true;
    data['method'] = method;
    if (phone != null && phone.isNotEmpty) {
      data['phone'] = phone;
    }
    await _write(data);
  }

  static Future<void> clear() async {
    try {
      final file = await _sessionFile();
      if (await file.exists()) {
        await file.delete();
      }
    } catch (error, stack) {
      debugPrint('AuthSession clear failed: $error\n$stack');
    }
  }
}

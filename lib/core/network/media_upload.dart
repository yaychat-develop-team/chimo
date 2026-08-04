import 'dart:io';

import 'package:http/http.dart' as http;

import 'network_bootstrap.dart';

/// Upload local media via `GET /aws/upload-url` then PUT to the signed URL.
///
/// Mirrors D:\forya `S3UploadApi` (sceneCode 101 = images by default).
abstract final class MediaUpload {
  static const _cdnDomain = 'https://cdn.echimo.com';

  /// Returns a CDN-facing URL on success; otherwise `null`.
  static Future<String?> uploadFile(
    String path, {
    int sceneCode = 101,
  }) async {
    var filePath = path;
    if (filePath.startsWith('file://')) {
      filePath = filePath.substring(7);
    }
    final file = File(filePath);
    if (!await file.exists()) return null;

    final length = await file.length();
    if (length <= 0 || length > 10 * 1024 * 1024) return null;

    final name = filePath.split(RegExp(r'[/\\]')).last;
    final signedRes = await NetworkBootstrap.client.get(
      '/aws/upload-url',
      query: {
        'sceneCode': '$sceneCode',
        'filename': name,
      },
    );
    if (!signedRes.success) return null;

    final signedUrl = _parseSignedUrl(signedRes.data);
    if (signedUrl == null || signedUrl.isEmpty) return null;

    final bytes = await file.readAsBytes();
    final put = await http.put(
      Uri.parse(signedUrl),
      headers: {
        'Content-Type': _guessMime(name),
        'Content-Length': '${bytes.length}',
      },
      body: bytes,
    );
    // ignore: avoid_print
    print('MediaUpload PUT ${put.statusCode} bytes=${bytes.length}');
    if (put.statusCode < 200 || put.statusCode >= 300) {
      // ignore: avoid_print
      print('MediaUpload PUT body=${put.body.length > 200 ? put.body.substring(0, 200) : put.body}');
      return null;
    }

    return _toCdnUrl(signedUrl);
  }

  static String? _parseSignedUrl(Object? data) {
    if (data is String && data.trim().isNotEmpty) return data.trim();
    if (data is Map) {
      for (final key in const ['value', 'url', 'uploadUrl', 'signedUrl']) {
        final v = data[key];
        if (v is String && v.trim().isNotEmpty) return v.trim();
      }
      final nested = data['data'];
      if (nested != null) return _parseSignedUrl(nested);
    }
    return null;
  }

  static String _toCdnUrl(String signedUrl) {
    try {
      final uri = Uri.parse(signedUrl);
      final path = uri.path.startsWith('/') ? uri.path : '/${uri.path}';
      return '$_cdnDomain$path';
    } catch (_) {
      final q = signedUrl.indexOf('?');
      return q > 0 ? signedUrl.substring(0, q) : signedUrl;
    }
  }

  static String _guessMime(String filename) {
    final lower = filename.toLowerCase();
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.webp')) return 'image/webp';
    if (lower.endsWith('.gif')) return 'image/gif';
    if (lower.endsWith('.heic') || lower.endsWith('.heif')) {
      return 'image/heic';
    }
    return 'image/jpeg';
  }
}

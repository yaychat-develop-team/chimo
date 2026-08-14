import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'api_gateway.dart';
import 'network_bootstrap.dart';

/// 通过 `GET /aws/upload-url` 获取签名 URL，再 PUT 上传本地媒体。
///
/// 对齐 D:\forya `S3UploadApi`（sceneCode 101 = 图片，102 = 语音，103 = 视频）。
/// 签名接口会按 **filename 扩展名** 决定场景文案；iOS 相册临时文件经常没有后缀，
/// 会被后端当成「将音频上传」。因此必须补齐扩展名，并显式传 sceneCode。
abstract final class MediaUpload {
  static const imageScene = 101;
  static const voiceScene = 102;
  static const videoScene = 103;

  static const _cdnDomain = 'https://cdn.echimo.com';
  static const _maxAttempts = 3;

  static Future<String?> uploadImage(String path) =>
      uploadFile(path, sceneCode: imageScene);

  static Future<String?> uploadVoice(String path) =>
      uploadFile(path, sceneCode: voiceScene);

  /// 成功返回面向 CDN 的 URL；否则 `null`。
  static Future<String?> uploadFile(
    String path, {
    int sceneCode = imageScene,
  }) async {
    var filePath = path;
    if (filePath.startsWith('file://')) {
      filePath = filePath.substring(7);
    }
    final file = File(filePath);
    if (!await file.exists()) return null;

    final length = await file.length();
    if (length <= 0 || length > 10 * 1024 * 1024) return null;

    final name = _filenameForScene(filePath, sceneCode);
    final signed = await ApiGateway.request(
      () => NetworkBootstrap.api.uploadUrl(
        sceneCode: sceneCode,
        filename: name,
      ),
      map: (res) => _parseSignedUrl(res.data) ?? '',
    );
    if (!signed.ok) return null;
    final signedUrl = signed.data;
    if (signedUrl == null || signedUrl.isEmpty) return null;

    // 语音/视频场景始终用 octet-stream——签名 URL 仅覆盖 `host` 时，
    // 模拟器上 audio/* 常导致 S3 重置连接。
    var contentType = (sceneCode == voiceScene || sceneCode == videoScene)
        ? 'application/octet-stream'
        : _guessMime(name);
    if (sceneCode == imageScene && contentType == 'application/octet-stream') {
      contentType = 'image/jpeg';
    }

    final ok = await _putWithRetry(
      signedUrl: signedUrl,
      file: file,
      length: length,
      contentType: contentType,
    );
    if (!ok) return null;

    return _toCdnUrl(signedUrl);
  }

  /// 给签名接口一个能识别场景的文件名（无后缀时补上）。
  static String _filenameForScene(String filePath, int sceneCode) {
    final raw = filePath.split(RegExp(r'[/\\]')).last.trim();
    final lower = raw.toLowerCase();
    if (sceneCode == voiceScene) {
      if (_hasExt(lower, const ['.m4a', '.aac', '.mp3', '.wav', '.caf'])) {
        return raw;
      }
      return _withExt(raw, 'voice.m4a');
    }
    if (sceneCode == videoScene) {
      if (_hasExt(lower, const ['.mp4', '.mov', '.m4v', '.webm'])) return raw;
      return _withExt(raw, 'video.mp4');
    }
    if (_hasExt(lower, const [
      '.jpg',
      '.jpeg',
      '.png',
      '.webp',
      '.gif',
      '.heic',
      '.heif',
    ])) {
      return raw;
    }
    return _withExt(raw, 'image.jpg');
  }

  static bool _hasExt(String lower, List<String> exts) =>
      exts.any(lower.endsWith);

  static String _withExt(String raw, String fallback) {
    if (raw.isEmpty || !raw.contains('.')) return fallback;
    return '$raw.${fallback.split('.').last}';
  }

  static Future<bool> _putWithRetry({
    required String signedUrl,
    required File file,
    required int length,
    required String contentType,
  }) async {
    Object? lastError;
    for (var attempt = 1; attempt <= _maxAttempts; attempt++) {
      try {
        final request = http.StreamedRequest('PUT', Uri.parse(signedUrl));
        request.headers['Content-Type'] = contentType;
        request.contentLength = length;

        // 与 forya Dio openRead() 一样流式读取；避免整文件加载两次。
        unawaited(
          file.openRead().pipe(request.sink).catchError((Object error, _) {
            // ignore: avoid_print
            print('MediaUpload stream error: $error');
          }),
        );

        final streamed = await request.send().timeout(
          const Duration(seconds: 60),
        );
        final status = streamed.statusCode;
        // 排空响应体，以便连接干净关闭。
        await streamed.stream.drain<void>();
        // ignore: avoid_print
        print('MediaUpload PUT attempt=$attempt status=$status bytes=$length');
        if (status >= 200 && status < 300) return true;
        lastError = 'HTTP $status';
      } catch (error) {
        lastError = error;
        // ignore: avoid_print
        print('MediaUpload PUT attempt=$attempt failed: $error');
        if (attempt < _maxAttempts) {
          await Future<void>.delayed(Duration(milliseconds: 400 * attempt));
        }
      }
    }
    // ignore: avoid_print
    print('MediaUpload giving up: $lastError');
    return false;
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
    if (lower.endsWith('.m4a') || lower.endsWith('.aac')) {
      return 'application/octet-stream';
    }
    if (lower.endsWith('.mp3')) return 'audio/mpeg';
    if (lower.endsWith('.wav')) return 'audio/wav';
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.webp')) return 'image/webp';
    if (lower.endsWith('.gif')) return 'image/gif';
    if (lower.endsWith('.heic') || lower.endsWith('.heif')) {
      return 'image/heic';
    }
    if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) {
      return 'image/jpeg';
    }
    return 'application/octet-stream';
  }
}

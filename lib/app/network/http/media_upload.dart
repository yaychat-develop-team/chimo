import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../common/utils/app_log.dart';
import '../../chimo_api.dart';
import '../config/proxy_store.dart';

/// 上传进度回调：[sent] / [total] 都是字节数。
typedef UploadProgress = void Function(int sent, int total);

/// 通过 `GET /aws/upload-url` 获取签名 URL，再通过 Dio PUT 上传本地媒体。
abstract final class MediaUpload {
  static const imageScene = 101;
  static const voiceScene = 102;
  static const videoScene = 103;

  /// 图片 / 媒体 CDN 域名。
  static const cdnDomain = 'https://cdn.echimo.com';
  static const _maxAttempts = 3;

  /// 单张图上传的并发上限（多图时用）。
  static const _maxConcurrent = 3;

  static Future<String?> uploadImage(
    String path, {
    UploadProgress? onProgress,
  }) =>
      uploadFile(path, sceneCode: imageScene, onProgress: onProgress);

  static Future<String?> uploadVoice(
    String path, {
    UploadProgress? onProgress,
  }) =>
      uploadFile(path, sceneCode: voiceScene, onProgress: onProgress);

  static Future<String?> uploadVideo(
    String path, {
    UploadProgress? onProgress,
  }) =>
      uploadFile(path, sceneCode: videoScene, onProgress: onProgress);

  /// 批量上传图片。保持原本并发限制。
  static Future<List<String>> uploadImages(
    List<String> paths, {
    void Function(int completed, int total)? onProgress,
  }) async {
    if (paths.isEmpty) return const [];
    final results = List<String?>.filled(paths.length, null);
    var cursor = 0;
    var done = 0;

    Future<void> worker() async {
      while (true) {
        final index = cursor++;
        if (index >= paths.length) break;
        final uploaded = await uploadImage(paths[index]);
        results[index] = uploaded;
        done++;
        onProgress?.call(done, paths.length);
      }
    }

    final workers = <Future<void>>[];
    final count = paths.length < _maxConcurrent ? paths.length : _maxConcurrent;
    for (var i = 0; i < count; i++) {
      workers.add(worker());
    }
    await Future.wait(workers);

    return [
      for (final r in results)
        if (r != null && r.isNotEmpty) r,
    ];
  }

  /// 获取上传凭证并直传 S3。
  static Future<String?> uploadFile(
    String localPath, {
    required int sceneCode,
    UploadProgress? onProgress,
  }) async {
    final file = File(localPath);
    if (!file.existsSync()) {
      AppLog.w('MediaUpload file not exists: $localPath');
      return null;
    }
    final length = await file.length();
    if (length <= 0) {
      AppLog.w('MediaUpload file is empty: $localPath');
      return null;
    }

    final name = _filenameForScene(localPath, sceneCode);

    // 1. 获取预签名上传 URL
    final signedUrl = await ChimoApis.upload.getUploadUrl(
      filename: name,
      sceneCode: sceneCode,
    );

    if (signedUrl == null || signedUrl.isEmpty) {
      AppLog.w('MediaUpload signedUrl is null');
      return null;
    }

    var contentType = (sceneCode == voiceScene || sceneCode == videoScene)
        ? 'application/octet-stream'
        : _guessMime(name);
    if (sceneCode == imageScene && contentType == 'application/octet-stream') {
      contentType = 'image/jpeg';
    }

    // 2. 通过 Dio PUT 流式上传到 S3
    final ok = await _putWithDioRetry(
      signedUrl: signedUrl,
      file: file,
      length: length,
      contentType: contentType,
      onProgress: onProgress,
    );
    if (!ok) return null;

    return _toCdnUrl(signedUrl);
  }

  static Future<bool> _putWithDioRetry({
    required String signedUrl,
    required File file,
    required int length,
    required String contentType,
    UploadProgress? onProgress,
  }) async {
    final uploadDio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    ProxyStore.configureDio(uploadDio);

    Object? lastError;
    for (var attempt = 1; attempt <= _maxAttempts; attempt++) {
      try {
        final stream = file.openRead();
        final response = await uploadDio.put(
          signedUrl,
          data: stream,
          options: Options(
            headers: {
              Headers.contentTypeHeader: contentType,
              Headers.contentLengthHeader: length,
            },
          ),
          onSendProgress: (sent, total) {
            onProgress?.call(sent, length);
          },
        );

        final status = response.statusCode ?? 0;
        AppLog.net(
          'MediaUpload Dio PUT attempt=$attempt status=$status bytes=$length',
        );
        if (status >= 200 && status < 300) {
          uploadDio.close();
          return true;
        }
        lastError = 'HTTP $status';
      } catch (error) {
        lastError = error;
        AppLog.w('MediaUpload Dio PUT attempt=$attempt failed', error: error);
        if (attempt < _maxAttempts) {
          await Future<void>.delayed(Duration(milliseconds: 400 * attempt));
        }
      }
    }
    uploadDio.close();
    AppLog.w('MediaUpload giving up', error: lastError);
    return false;
  }

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

  static String _toCdnUrl(String signedUrl) {
    try {
      final uri = Uri.parse(signedUrl);
      final path = uri.path.startsWith('/') ? uri.path : '/${uri.path}';
      return '$cdnDomain$path';
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

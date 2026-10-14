import 'dart:convert';

import '../http/http.dart';

/// 文件 / 媒体上传凭证相关接口。
class UploadApi {
  const UploadApi();

  /// 获取 AWS S3 预签名上传 URL。
  Future<String?> getUploadUrl({
    required String filename,
    required int sceneCode,
  }) async {
    try {
      final res = await Http.ins.get(
        '/aws/upload-url',
        query: {
          'filename': filename,
          'sceneCode': '$sceneCode',
        },
      );
      if (res.statusCode == 200 && res.data != null) {
        return _parseSignedUrl(res.data);
      }
    } catch (_) {}
    return null;
  }

  static String? _parseSignedUrl(Object? data) {
    if (data is String && data.trim().isNotEmpty) {
      try {
        final decoded = jsonDecode(data);
        return _parseSignedUrl(decoded);
      } catch (_) {
        return data.trim();
      }
    }
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
}

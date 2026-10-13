import 'dart:convert';

import 'package:protobuf/protobuf.dart';

import '../../../common/models/server_client/base.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import 'api_client.dart';

/// 一种响应 `data` 的生成模型。对齐 forya `asBaseRsp` 的 TypeRegistry + fromBuffer。
class PbUnpack<T extends GeneratedMessage> {
  const PbUnpack(this.sample, this.fromBuffer);

  final T sample;
  final T Function(List<int> bytes) fromBuffer;

  TypeRegistry get registry => TypeRegistry([sample]);
}

/// 把 HTTP body 解成 [BaseRsp]，再把 `data` 解成 [unpack] 指定的生成模型。
///
/// protobuf 二进制走 `fromBuffer`。JSON 走 `mergeFromProto3Json`。
/// 解不开内部消息时，JSON 分支保留原始 `data`，避免把现有字段解析打空。
ApiResponse decodeEnvelope({
  required Object? body,
  required bool isProto,
  PbUnpack? unpack,
  int? httpStatus,
}) {
  if (isProto) {
    final bytes = _asBytes(body);
    try {
      final envelope = BaseRsp.fromBuffer(bytes);
      return _fromEnvelope(envelope, unpack: unpack, httpStatus: httpStatus);
    } catch (error) {
      return ApiResponse(
        success: false,
        code: httpStatus,
        message: '$error',
        raw: {'httpStatus': httpStatus},
        httpStatus: httpStatus,
      );
    }
  }

  final json = _jsonMap(body);
  if (json == null) {
    return ApiResponse(
      success: false,
      code: httpStatus,
      message: 'invalid.response',
      raw: {'httpStatus': httpStatus},
      httpStatus: httpStatus,
    );
  }
  if (unpack == null) {
    return ApiResponse.fromJson(json, httpStatus: httpStatus);
  }
  try {
    final envelope = BaseRsp.create()
      ..mergeFromProto3Json(
        json,
        ignoreUnknownFields: true,
        typeRegistry: unpack.registry,
      );
    final unpacked =
        _payload(envelope, unpack) ?? _mergeInner(unpack, json['data']);
    if (unpacked != null) {
      return _response(
        envelope,
        data: unpacked,
        httpStatus: httpStatus,
        raw: json,
      );
    }
  } catch (_) {
    // JSON 不是 proto3 Any 时，沿用原始 data。
  }
  final fallback = ApiResponse.fromJson(json, httpStatus: httpStatus);
  final merged = _mergeInner(unpack, json['data']);
  if (merged == null) return fallback;
  return ApiResponse(
    success: fallback.success,
    code: fallback.code,
    message: fallback.message,
    data: merged,
    sysTime: fallback.sysTime,
    raw: fallback.raw,
    httpStatus: fallback.httpStatus,
  );
}

ApiResponse _fromEnvelope(
  BaseRsp envelope, {
  PbUnpack? unpack,
  int? httpStatus,
}) {
  return _response(
    envelope,
    data: _payload(envelope, unpack) ?? _infer(envelope),
    httpStatus: httpStatus,
    raw: {
      'success': envelope.success,
      'code': envelope.code,
      'message': envelope.message,
    },
  );
}

Object? _payload(BaseRsp envelope, PbUnpack? unpack) {
  if (unpack == null || !envelope.hasData() || envelope.data.value.isEmpty) {
    return null;
  }
  return unpack.fromBuffer(envelope.data.value);
}

/// 没指定模型时，按 Any 的 typeUrl 在用户资料和用户列表之间选。
/// 关系列表的测试封套不写 typeUrl，按列表解。
Object? _infer(BaseRsp envelope) {
  if (!envelope.hasData() || envelope.data.value.isEmpty) return null;
  final typeUrl = envelope.data.typeUrl;
  if (typeUrl.contains('UserInfoRsp')) {
    return UserInfoRsp.fromBuffer(envelope.data.value);
  }
  return UserListRsp.fromBuffer(envelope.data.value);
}

/// JSON 的 `data` 对象不是 Any 时，按 [unpack] 的模型合并字段。
GeneratedMessage? _mergeInner(PbUnpack unpack, Object? data) {
  if (data is! Map) return null;
  final message = unpack.sample.createEmptyInstance();
  try {
    message.mergeFromProto3Json(
      data.map((key, value) => MapEntry('$key', value)),
      ignoreUnknownFields: true,
    );
    return message;
  } catch (_) {
    return null;
  }
}

ApiResponse _response(
  BaseRsp envelope, {
  required Object? data,
  required int? httpStatus,
  required Map<String, dynamic> raw,
}) {
  final message = envelope.message.isEmpty && !envelope.success
      ? 'System error.'
      : envelope.message;
  return ApiResponse(
    success: envelope.success,
    code: envelope.code,
    message: message,
    data: data,
    sysTime: envelope.hasSysTime() ? envelope.sysTime.toString() : null,
    raw: raw,
    httpStatus: httpStatus,
  );
}

Map<String, dynamic>? _jsonMap(Object? body) {
  if (body is Map<String, dynamic>) return body;
  if (body is Map) {
    return body.map((key, value) => MapEntry('$key', value));
  }
  final text = body is String
      ? body
      : body is List<int>
      ? utf8.decode(body)
      : null;
  if (text == null || text.isEmpty) return null;
  final decoded = jsonDecode(text);
  if (decoded is Map<String, dynamic>) return decoded;
  if (decoded is Map) {
    return decoded.map((key, value) => MapEntry('$key', value));
  }
  return null;
}

List<int> _asBytes(Object? data) {
  if (data is List<int>) return data;
  if (data is String) return utf8.encode(data);
  return const [];
}

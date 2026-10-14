import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:protobuf/protobuf.dart';
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart';

import '../../../common/models/any_parser.dart';
import '../../../common/models/server_client/base.pb.dart';
import 'api_result.dart';

extension GeneratedMessageExt<T extends GeneratedMessage> on T {
  T decodePb(Object? data) {
    if (data != null) {
      if (data is Uint8List) {
        mergeFromBuffer(data);
      } else if (data is List<int>) {
        mergeFromBuffer(data);
      } else if (data is Map) {
        mergeFromProto3Json(
          data.map((key, value) => MapEntry('$key', value)),
          typeRegistry: AnyParser.typeRegistry,
          ignoreUnknownFields: true,
        );
      }
    }
    return this;
  }
}

typedef _Void = void;

extension ResponseExt on Response {
  /// 将响应解析为包含指定类型的 [ApiResult<T>]。
  ///
  /// 若 [T] 为 void 或响应中不包含业务 payload，将返回包含 null 载荷的成功结果。
  ApiResult<T> asApiResult<T>() {
    if (statusCode != 200) {
      return ApiResult.fail(
        '$statusCode ${statusMessage ?? ''}',
        code: statusCode ?? 400,
      );
    }

    if (data == null) {
      return ApiResult.fail(
        'Empty response from server',
        code: statusCode ?? 400,
      );
    }

    final envelope = _parseEnvelope(data);

    final sysTimeStr = envelope.sysTime;

    if (!envelope.success || envelope.code != 0) {
      final msg = envelope.message.isNotEmpty
          ? envelope.message
          : (envelope.success ? '' : 'System error.');
      return ApiResult.fail(
        msg,
        code: envelope.code,
        sysTime: sysTimeStr,
      );
    }

    final hasProtoData = envelope.baseRsp != null && envelope.baseRsp!.hasData();

    // 检查是否为 void 纯操作或者无数据载荷
    if (T == _Void || (!hasProtoData && envelope.data == null)) {
      return ApiResult.ok(
        null as T,
        envelope.message,
        envelope.code,
        sysTimeStr,
      );
    }

    // 优先尝试从 Protobuf Any 解析目标类型 T
    if (hasProtoData) {
      final Any any = envelope.baseRsp!.data;
      if (any.value.isNotEmpty) {
        final parsed = AnyParser.parse(any);
        if (parsed is T) {
          return ApiResult.ok(
            parsed as T,
            envelope.message,
            envelope.code,
            sysTimeStr,
          );
        }
      }
    }

    // 若载荷本身类型匹配（如普通 Map、List 等）
    if (envelope.data is T) {
      return ApiResult.ok(
        envelope.data as T,
        envelope.message,
        envelope.code,
        sysTimeStr,
      );
    }

    return ApiResult.fail(
      '${requestOptions.path} error: data type is unmatched',
      code: envelope.code,
      sysTime: sysTimeStr,
    );
  }

  /// 内部解析信封结构，兼容二进制 Protobuf、Proto3 JSON 及普通 JSON
  static _ResponseEnvelope _parseEnvelope(dynamic rawData) {
    // 1. 若是字节流，优先尝试从 Protobuf 反序列化 BaseRsp
    if (rawData is List<int>) {
      try {
        final rsp = BaseRsp.fromBuffer(rawData);
        return _ResponseEnvelope(
          success: rsp.success,
          code: rsp.code,
          message: rsp.message,
          sysTime: rsp.hasSysTime() ? rsp.sysTime.toString() : null,
          baseRsp: rsp,
          data: rsp.hasData() ? rsp.data : null,
        );
      } catch (_) {
        // 若从 protobuf 反序列化失败，说明可能是以字节流返回的 UTF-8 JSON 文本，向下继续解析
      }
    }

    // 2. 尝试提取为 JSON Map
    Map<String, dynamic>? json;
    if (rawData is Map<String, dynamic>) {
      json = rawData;
    } else if (rawData is Map) {
      json = rawData.map((key, value) => MapEntry('$key', value));
    } else {
      String? text;
      if (rawData is String) {
        text = rawData;
      } else if (rawData is List<int>) {
        try {
          text = utf8.decode(rawData);
        } catch (_) {}
      }
      if (text != null && text.isNotEmpty) {
        try {
          final decoded = jsonDecode(text);
          if (decoded is Map<String, dynamic>) {
            json = decoded;
          } else if (decoded is Map) {
            json = decoded.map((key, value) => MapEntry('$key', value));
          }
        } catch (_) {}
      }
    }

    // 3. 处理提取到的 JSON 结构
    if (json != null) {
      final rawCode = json['code'] ?? json['status'];
      final int code = rawCode is int
          ? rawCode
          : (int.tryParse('$rawCode') ?? (json['success'] == false ? -1 : 0));

      final String message = (json['message'] ?? json['msg'] ?? '').toString();
      final bool success = json.containsKey('success') && json['success'] is bool
          ? (json['success'] as bool)
          : code == 0;
      final String? sysTime = json['sysTime']?.toString();
      final dynamic rawPayload = json['data'];

      // 注意：BaseRsp.code 在 Proto 定义中为 uint32，负数会导致 ArgumentError。
      // 仅在 code >= 0 时尝试还原 BaseRsp 以供 AnyParser 解析
      BaseRsp? baseRsp;
      if (code >= 0) {
        try {
          baseRsp = BaseRsp.create()
            ..mergeFromProto3Json(
              json,
              typeRegistry: AnyParser.typeRegistry,
              ignoreUnknownFields: true,
            );
        } catch (_) {
          // 非标准 proto3 json 忽略，保留 rawPayload
        }
      }

      return _ResponseEnvelope(
        success: success,
        code: code,
        message: message,
        sysTime: sysTime,
        baseRsp: baseRsp,
        data: rawPayload,
        rawJson: json,
      );
    }

    // 4. 无法识别的格式时安全返回错误信封，避免构造 BaseRsp(code: -1) 导致崩溃
    return const _ResponseEnvelope(
      success: false,
      code: -1,
      message: 'Invalid response format',
    );
  }
}

/// 统一内部响应信封，解耦 Protobuf BaseRsp 与任意整型 code / JSON 格式
class _ResponseEnvelope {
  final bool success;
  final int code;
  final String message;
  final String? sysTime;
  final BaseRsp? baseRsp;
  final dynamic data;
  final Map<String, dynamic>? rawJson;

  const _ResponseEnvelope({
    required this.success,
    required this.code,
    required this.message,
    this.sysTime,
    this.baseRsp,
    this.data,
    this.rawJson,
  });
}

import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chimo/core/network/api_client.dart';
import 'package:chimo/core/network/proto/relation_list_proto.dart';

class _MockAdapter implements HttpClientAdapter {
  _MockAdapter(this.onFetch);

  final Future<ResponseBody> Function(RequestOptions options) onFetch;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) {
    return onFetch(options);
  }
}

void main() {
  group('RelationListProto', () {
    test('decodes BaseRsp envelope with userList', () {
      final bytes = encodeRelationListEnvelope(
        users: [
          {
            'id': '1011231',
            'nickname': 'Fan User',
            'avatar': 'https://cdn.example/avatar.png',
            'gender': 'male',
            'emUsername': 'yqdf-123',
            'relationType': 2,
          },
        ],
      );

      final parsed = RelationListProto.decode(bytes);
      expect(parsed.success, isTrue);
      expect(parsed.data, isA<Map>());
      final data = parsed.data! as Map;
      final list = data['userList'] as List;
      expect(list, hasLength(1));
      expect(list.first['nickname'], 'Fan User');
      expect(list.first['relationType'], 2);
    });

    test('ApiClient decodes protobuf search-fans response', () async {
      final bytes = encodeRelationListEnvelope(
        users: [
          {
            'id': '42',
            'nickname': 'Proto Fan',
            'relationType': 2,
          },
        ],
      );

      late RequestOptions captured;
      final dio = Dio(
        BaseOptions(
          baseUrl: 'https://test-api.echimo.com/api/v1',
          responseType: ResponseType.plain,
        ),
      );
      dio.httpClientAdapter = _MockAdapter((options) async {
        captured = options;
        return ResponseBody.fromBytes(
          bytes,
          200,
          headers: {
            Headers.contentTypeHeader: [ApiClient.acceptProto],
          },
        );
      });

      final client = ApiClient(dio: dio);
      final response = await client.get(
        '/user-relation/search-fans',
        query: {'pageNum': '1', 'pageSize': '20', 'keyword': ''},
        accept: ApiClient.acceptProto,
      );

      expect(
        captured.headers[Headers.acceptHeader],
        ApiClient.acceptProto,
      );
      expect(response.success, isTrue);
      final data = response.data! as Map;
      final list = data['userList'] as List;
      expect(list, hasLength(1));
      expect(list.first['nickname'], 'Proto Fan');
    });
  });
}

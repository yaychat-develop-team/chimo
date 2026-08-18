import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chimo/core/network/api_client.dart';
import 'package:chimo/core/network/proto/relation_list_proto.dart';
import 'package:chimo/features/me/data/user_dto.dart';

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

    test('decodes UserInfoRsp picList and FOLLOW relation', () {
      final bytes = encodeUserInfoEnvelope(
        user: {
          'id': '1001727',
          'nickname': '是',
          'gender': 'female',
          'personalSignature': 'hello',
          'relationType': 1,
          'picList': [
            {'content': 'https://cdn.example/a.jpg', 'ok': true},
            {'content': 'https://cdn.example/pending.jpg', 'ok': false},
          ],
        },
      );

      final parsed = RelationListProto.decode(bytes);
      expect(parsed.success, isTrue);
      final data = parsed.data! as Map;
      final user = Map<String, dynamic>.from(data['user'] as Map);
      expect(user['relationType'], 1);
      expect(user['picList'], hasLength(2));

      final profile = UserDto.chatFromUserMap(user);
      expect(profile.isFollowing, isTrue);
      expect(profile.momentUrls, ['https://cdn.example/a.jpg']);
    });

    test('FAN relationType is not treated as following', () {
      final profile = UserDto.chatFromUserMap({
        'id': '1',
        'nickname': 'fan',
        'relationType': 2,
      });
      expect(profile.isFollowing, isFalse);
    });
  });
}

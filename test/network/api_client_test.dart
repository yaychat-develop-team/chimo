import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:chimo/core/network/api_client.dart';
import 'package:chimo/core/network/api_config.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    ApiConfig.useEnvironment(ApiEnvironment.test);
  });

  group('ApiClient', () {
    test('wraps bizParam and parses envelope', () async {
      final mock = MockClient((request) async {
        expect(
          request.url.toString(),
          'https://test-api.echimo.com/api/v1/user/open',
        );
        expect(request.method, 'POST');
        expect(request.body, contains('"bizParam"'));
        expect(request.body, contains('"open":false'));
        return http.Response(
          '{"success":true,"code":0,"message":"success","data":{"agent":{}}}',
          200,
          headers: {'content-type': 'application/json'},
        );
      });

      final client = ApiClient(httpClient: mock);
      final response = await client.pingUserOpen(open: false);
      expect(response.success, isTrue);
      expect(response.message, 'success');
      client.close();
    });
  });
}

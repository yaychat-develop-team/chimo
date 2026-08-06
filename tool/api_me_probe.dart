import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

const _base = 'https://test-api.echimo.com/api/v1';

Future<Map<String, dynamic>> post(String path, Map<String, dynamic> biz) async {
  final r = await http.post(
    Uri.parse('$_base$path'),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'timestamp': '${DateTime.now().millisecondsSinceEpoch}',
    },
    body: jsonEncode({
      'bizParam': {
        ...biz,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
    }),
  );
  return jsonDecode(r.body) as Map<String, dynamic>;
}

Future<Map<String, dynamic>> get(String path, String token) async {
  final r = await http.get(
    Uri.parse('$_base$path'),
    headers: {
      'Accept': 'application/json',
      'timestamp': '${DateTime.now().millisecondsSinceEpoch}',
      'token': token,
    },
  );
  return jsonDecode(r.body) as Map<String, dynamic>;
}

Future<void> main() async {
  await post('/auth/sms-send', {'phone': '13800138000'});
  final auth = await post('/auth/sms-auth', {
    'phone': '13800138000',
    'code': '123456',
    'userInfoKey': '',
  });
  final token = '${(auth['data'] as Map)['token']}';
  final paths = <String>[
    '/user/info',
    '/user/conf',
    '/home_page/main',
  ];
  for (final p in paths) {
    final r = await get(p, token);
    stdout.writeln('--- $p success=${r['success']} msg=${r['message']}');
    final data = r['data'];
    if (data == null) {
      stdout.writeln('null data');
      continue;
    }
    final encoded = const JsonEncoder.withIndent('  ').convert(data);
    stdout.writeln(encoded.length > 1500 ? encoded.substring(0, 1500) : encoded);
  }
}

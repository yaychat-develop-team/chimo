import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> post(String path, Map<String, dynamic> biz) async {
  final base = 'https://test-api.echimo.com/api/v1';
  final r = await http.post(
    Uri.parse('$base$path'),
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
  final base = 'https://test-api.echimo.com/api/v1';
  final r = await http.get(
    Uri.parse('$base$path'),
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
  print('auth success=${auth['success']} msg=${auth['message']}');
  final data = auth['data'];
  if (data is! Map) {
    print('no data');
    return;
  }
  final token = '${data['token']}';
  print('token len=${token.length} nick=${data['nickName']}');
  final list = await get('/chat/group/list?pageNum=1&pageSize=5', token);
  print('list success=${list['success']} msg=${list['message']}');
  final gl = (list['data'] as Map?)?['groupList'] as List?;
  print('count=${gl?.length}');
  if (gl != null && gl.isNotEmpty) {
    print('first=${gl.first}');
  }
  final mine = await get('/chat/group/myGroups', token);
  print('mine success=${mine['success']} dataKeys=${(mine['data'] as Map?)?.keys}');
}

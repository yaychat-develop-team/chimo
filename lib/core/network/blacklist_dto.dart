import 'api_client.dart';

/// 黑名单用户（`/user-relation/get-black-list`）。
class BlacklistUser {
  const BlacklistUser({
    required this.id,
    required this.name,
    this.avatarUrl = '',
  });

  final String id;
  final String name;
  final String avatarUrl;
}

abstract final class BlacklistDto {
  static List<BlacklistUser> parseList(ApiResponse response) {
    if (!response.success) return const [];
    final data = response.data;
    if (data is! Map) return const [];
    final list = data['userList'] ?? data['list'] ?? data['blackList'];
    if (list is! List) return const [];
    final users = <BlacklistUser>[];
    for (final item in list) {
      if (item is! Map) continue;
      final id = '${item['id'] ?? item['userId'] ?? ''}'.trim();
      if (id.isEmpty) continue;
      final name =
          '${item['nickname'] ?? item['nickName'] ?? item['name'] ?? id}';
      final avatar = '${item['avatar'] ?? item['avatarUrl'] ?? ''}';
      users.add(BlacklistUser(id: id, name: name, avatarUrl: avatar));
    }
    return users;
  }

  static bool containsUid(Object? data, String uid) {
    if (uid.isEmpty) return false;
    if (data is! Map) return false;
    final list = data['userList'] ?? data['list'] ?? data['blackList'];
    if (list is! List) return false;
    for (final item in list) {
      if (item is! Map) continue;
      final id = '${item['id'] ?? item['userId'] ?? ''}'.trim();
      if (id == uid) return true;
    }
    return false;
  }
}

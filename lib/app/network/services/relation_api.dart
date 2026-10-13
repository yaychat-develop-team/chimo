import '../../../common/models/server_client/base.pbenum.dart';
import '../../../common/models/server_client/common/app.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../http/api_gateway.dart';
import '../http/api_result.dart';
import '../http/pb_specs.dart';
import '../network_bootstrap.dart';

/// 关注 / 搜索 / 黑名单 / 访客。
class RelationApi {
  const RelationApi();

  Future<ApiResult<List<User>>> searchUsers(String key) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/user-relation/searchUser',
        query: {'key': key},
        unpack: PbSpecs.userList,
      ),
      map: (res) => _users(res.data, RelationType.FAN),
    );
  }

  /// 首页 ID 搜索（`GET /search?no=`）。命中项是 [MsgListUserItem]。
  Future<ApiResult<List<MsgListUserItem>>> homeSearch(String no) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/search',
        query: {'no': no},
        unpack: PbSpecs.search,
      ),
      map: (res) {
        final data = res.data;
        if (data is! SearchResp) return const [];
        return data.users;
      },
    );
  }

  Future<ApiResult<List<User>>> searchFollowing({
    int pageNum = 1,
    int pageSize = 20,
    String keyword = '',
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/user-relation/search-followers',
        query: {
          'pageNum': '$pageNum',
          'pageSize': '$pageSize',
          'keyword': keyword,
        },
        unpack: PbSpecs.userList,
      ),
      map: (res) => _users(res.data, RelationType.FOLLOW),
    );
  }

  Future<ApiResult<List<User>>> searchFans({
    int pageNum = 1,
    int pageSize = 20,
    String keyword = '',
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/user-relation/search-fans',
        query: {
          'pageNum': '$pageNum',
          'pageSize': '$pageSize',
          'keyword': keyword,
        },
        unpack: PbSpecs.userList,
      ),
      map: (res) => _users(res.data, RelationType.FAN),
    );
  }

  Future<ApiResult<List<User>>> searchFriends({
    int pageNum = 1,
    int pageSize = 20,
    String keyword = '',
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/user-relation/search-friends',
        query: {
          'pageNum': '$pageNum',
          'pageSize': '$pageSize',
          'keyword': keyword,
        },
        unpack: PbSpecs.userList,
      ),
      map: (res) => _users(res.data, RelationType.FRIEND),
    );
  }

  Future<ApiResult<List<User>>> friendsGraph({
    int pageNum = 1,
    int pageSize = 50,
    String keyword = '',
  }) async {
    final results = await Future.wait([
      searchFriends(pageNum: pageNum, pageSize: pageSize, keyword: keyword),
      searchFollowing(pageNum: pageNum, pageSize: pageSize, keyword: keyword),
      searchFans(pageNum: pageNum, pageSize: pageSize, keyword: keyword),
    ]);
    for (final r in results) {
      if (!r.ok && r.isNotLogin) {
        return ApiResult.fail(r.message, code: r.code);
      }
    }
    return ApiResult.ok(
      _mergeGraphs(
        friends: results[0].data ?? const [],
        following: results[1].data ?? const [],
        fans: results[2].data ?? const [],
      ),
    );
  }

  Future<ApiResult<void>> follow(String uid) {
    return ApiGateway.action(
      () => NetworkBootstrap.client.get('/user-relation/follow/$uid'),
    );
  }

  Future<ApiResult<void>> unfollow(String uid) {
    return ApiGateway.action(
      () => NetworkBootstrap.client.post('/user-relation/unfollow/$uid'),
    );
  }

  Future<ApiResult<void>> setBlackList({
    required String userId,
    required bool isCancel,
  }) {
    return ApiGateway.action(
      () => NetworkBootstrap.client.post(
        '/user-relation/set-black-list',
        bizParam: {'userId': userId, 'isCancel': isCancel},
      ),
    );
  }

  Future<ApiResult<List<SimpleUser>>> blackList() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/user-relation/get-black-list',
        unpack: PbSpecs.blackList,
      ),
      map: (res) {
        final data = res.data;
        if (data is! GetBlackListResp) return const [];
        return data.users;
      },
    );
  }

  Future<ApiResult<bool>> isBlocked(String uid) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/user-relation/get-black-list',
        unpack: PbSpecs.blackList,
      ),
      map: (res) {
        final data = res.data;
        if (uid.isEmpty || data is! GetBlackListResp) return false;
        return data.users.any((user) => user.id.toString() == uid);
      },
    );
  }

  Future<ApiResult<List<ViewedByItem>>> viewedBy() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/user-relation/viewedBy',
        unpack: PbSpecs.viewedBy,
      ),
      map: (res) {
        final data = res.data;
        if (data is! ViewedByRsp) return const [];
        return data.viewedByList;
      },
    );
  }

  Future<ApiResult<void>> deleteVisitRecord(String visitorId) {
    return ApiGateway.action(
      () => NetworkBootstrap.client.post(
        '/user-relation/delete-visit-record',
        bizParam: {'visitorId': visitorId},
      ),
    );
  }

  Future<ApiResult<MsgListUserItem>> msgUser(String emUserName) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/user/msg-user',
        query: {'emUserName': emUserName},
        unpack: PbSpecs.msgUser,
      ),
      map: (res) {
        final data = res.data;
        if (data is! MsgListUserItem || data.id.toString() == '0') {
          throw StateError('msg-user empty');
        }
        return data;
      },
    );
  }
}

List<User> _users(Object? data, RelationType fallback) {
  if (data is! UserListRsp) return const [];
  return [
    for (final user in data.userList)
      user.relationType == RelationType.NONE
          ? (user.deepCopy()..relationType = fallback)
          : user,
  ];
}

List<User> _mergeGraphs({
  required List<User> friends,
  required List<User> following,
  required List<User> fans,
}) {
  final byId = <String, User>{};
  for (final user in friends) {
    byId[user.id.toString()] = user.deepCopy()
      ..relationType = RelationType.FRIEND;
  }
  for (final user in following) {
    byId.putIfAbsent(
      user.id.toString(),
      () => user.deepCopy()..relationType = RelationType.FOLLOW,
    );
  }
  for (final user in fans) {
    final id = user.id.toString();
    final existing = byId[id];
    if (existing == null) {
      byId[id] = user.deepCopy()..relationType = RelationType.FAN;
    } else if (existing.relationType == RelationType.FOLLOW) {
      existing.relationType = RelationType.FRIEND;
    }
  }
  return byId.values.toList(growable: false);
}

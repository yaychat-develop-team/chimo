import '../../../common/models/server_client/base.pbenum.dart';
import '../../../common/models/server_client/common/app.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 关注 / 搜索 / 黑名单 / 访客。
class RelationApi {
  const RelationApi();

  Future<ApiResult<List<User>>> searchUsers(String key) async {
    final res = await Http.ins.getAndParse<UserListRsp>(
      '/user-relation/searchUser',
      query: {'key': key},
    );
    return res.map((data) => _users(data, RelationType.FAN));
  }

  /// 首页 ID 搜索（`GET /search?no=`）。命中项是 [MsgListUserItem]。
  Future<ApiResult<List<MsgListUserItem>>> homeSearch(String no) async {
    final res = await Http.ins.getAndParse<SearchResp>(
      '/search',
      query: {'no': no},
    );
    return res.map((data) => data.users);
  }

  Future<ApiResult<List<User>>> searchFollowing({
    int pageNum = 1,
    int pageSize = 20,
    String keyword = '',
  }) async {
    final res = await Http.ins.getAndParse<UserListRsp>(
      '/user-relation/search-followers',
      query: {
        'pageNum': '$pageNum',
        'pageSize': '$pageSize',
        'keyword': keyword,
      },
    );
    return res.map((data) => _users(data, RelationType.FOLLOW));
  }

  Future<ApiResult<List<User>>> searchFans({
    int pageNum = 1,
    int pageSize = 20,
    String keyword = '',
  }) async {
    final res = await Http.ins.getAndParse<UserListRsp>(
      '/user-relation/search-fans',
      query: {
        'pageNum': '$pageNum',
        'pageSize': '$pageSize',
        'keyword': keyword,
      },
    );
    return res.map((data) => _users(data, RelationType.FAN));
  }

  Future<ApiResult<List<User>>> searchFriends({
    int pageNum = 1,
    int pageSize = 20,
    String keyword = '',
  }) async {
    final res = await Http.ins.getAndParse<UserListRsp>(
      '/user-relation/search-friends',
      query: {
        'pageNum': '$pageNum',
        'pageSize': '$pageSize',
        'keyword': keyword,
      },
    );
    return res.map((data) => _users(data, RelationType.FRIEND));
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
    return Http.ins.getAndParse('/user-relation/follow/$uid');
  }

  Future<ApiResult<void>> unfollow(String uid) {
    return Http.ins.postAndParse('/user-relation/unfollow/$uid');
  }

  Future<ApiResult<void>> setBlackList({
    required String userId,
    required bool isCancel,
  }) {
    return Http.ins.postAndParse(
      '/user-relation/set-black-list',
      data: {'userId': userId, 'isCancel': isCancel},
    );
  }

  Future<ApiResult<List<SimpleUser>>> blackList() async {
    final res = await Http.ins.getAndParse<GetBlackListResp>(
      '/user-relation/get-black-list',
    );
    return res.map((data) => data.users);
  }

  Future<ApiResult<bool>> isBlocked(String uid) async {
    final res = await Http.ins.getAndParse<GetBlackListResp>(
      '/user-relation/get-black-list',
    );
    return res.map((data) {
      if (uid.isEmpty) return false;
      return data.users.any((user) => user.id.toString() == uid);
    });
  }

  Future<ApiResult<List<ViewedByItem>>> viewedBy() async {
    final res = await Http.ins.getAndParse<ViewedByRsp>('/user-relation/viewedBy');
    return res.map((data) => data.viewedByList);
  }

  Future<ApiResult<void>> deleteVisitRecord(String visitorId) {
    return Http.ins.postAndParse(
      '/user-relation/delete-visit-record',
      data: {'visitorId': visitorId},
    );
  }

  Future<ApiResult<MsgListUserItem>> msgUser(String emUserName) async {
    final res = await Http.ins.getAndParse<MsgListUserItem>(
      '/user/msg-user',
      query: {'emUserName': emUserName},
    );
    return res.map((data) {
      if (data.id.toString() == '0') {
        throw StateError('msg-user empty');
      }
      return data;
    });
  }
}

List<User> _users(UserListRsp data, RelationType fallback) {
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

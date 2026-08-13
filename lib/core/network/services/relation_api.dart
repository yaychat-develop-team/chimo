import '../../../features/friends/data/friend_dto.dart';
import '../../../features/me/data/visit_dto.dart';
import '../../../shared/models/friend_user.dart';
import '../api_gateway.dart';
import '../api_result.dart';
import '../app_meta_dto.dart';
import '../blacklist_dto.dart';
import '../network_bootstrap.dart';

/// 关注 / 搜索 / 黑名单 / 访客。
class RelationApi {
  const RelationApi();

  Future<ApiResult<List<FriendUser>>> searchUsers(String key) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.searchUsers(key),
      map: (res) => FriendDto.parseList(
        res,
        relation: FriendRelation.follower,
      ),
    );
  }

  /// 首页 ID 搜索（`GET /search?no=`），对齐 forya；可命中自己。
  Future<ApiResult<List<FriendUser>>> homeSearch(String no) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.homeSearch(no),
      map: FriendDto.parseHomeSearch,
    );
  }

  Future<ApiResult<List<FriendUser>>> searchFollowing({
    int pageNum = 1,
    int pageSize = 20,
    String keyword = '',
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.searchFollowing(
        pageNum: pageNum,
        pageSize: pageSize,
        keyword: keyword,
      ),
      map: (res) => FriendDto.parseList(
        res,
        relation: FriendRelation.following,
      ),
    );
  }

  Future<ApiResult<List<FriendUser>>> searchFans({
    int pageNum = 1,
    int pageSize = 20,
    String keyword = '',
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.searchFans(
        pageNum: pageNum,
        pageSize: pageSize,
        keyword: keyword,
      ),
      map: (res) => FriendDto.parseList(
        res,
        relation: FriendRelation.follower,
      ),
    );
  }

  Future<ApiResult<List<FriendUser>>> searchFriends({
    int pageNum = 1,
    int pageSize = 20,
    String keyword = '',
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.searchFriends(
        pageNum: pageNum,
        pageSize: pageSize,
        keyword: keyword,
      ),
      map: (res) => FriendDto.parseList(
        res,
        relation: FriendRelation.mutual,
      ),
    );
  }

  Future<ApiResult<List<FriendUser>>> friendsGraph({
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
      FriendDto.mergeGraphs(
        friends: results[0].data ?? const [],
        following: results[1].data ?? const [],
        fans: results[2].data ?? const [],
      ),
    );
  }

  Future<ApiResult<void>> follow(String uid) {
    return ApiGateway.action(() => NetworkBootstrap.api.followUser(uid));
  }

  Future<ApiResult<void>> unfollow(String uid) {
    return ApiGateway.action(() => NetworkBootstrap.api.unfollowUser(uid));
  }

  Future<ApiResult<void>> setBlackList({
    required String userId,
    required bool isCancel,
  }) {
    return ApiGateway.action(
      () => NetworkBootstrap.api.setBlackList(
        userId: userId,
        isCancel: isCancel,
      ),
    );
  }

  Future<ApiResult<List<BlacklistUser>>> blackList() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.getBlackList(),
      map: BlacklistDto.parseList,
    );
  }

  Future<ApiResult<bool>> isBlocked(String uid) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.getBlackList(),
      map: (res) => BlacklistDto.containsUid(res.data, uid),
    );
  }

  Future<ApiResult<List<VisitRecord>>> viewedBy() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.viewedBy(),
      map: VisitDto.parseList,
    );
  }

  Future<ApiResult<void>> deleteVisitRecord(String visitorId) {
    return ApiGateway.action(
      () => NetworkBootstrap.api.deleteVisitRecord(visitorId),
    );
  }

  Future<ApiResult<MsgUserBrief>> msgUser(String emUserName) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.msgUser(emUserName),
      map: (res) {
        final brief = MsgUserBrief.fromResponse(res);
        if (brief == null) throw StateError('msg-user empty');
        return brief;
      },
    );
  }
}

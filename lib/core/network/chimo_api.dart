import 'api_client.dart';

/// Endpoints mirrored from D:\forya `lib_network` (login / user / group / app).
///
/// Source of truth:
/// - packages_local/lib_network/lib/src/api/*.dart
/// - api_endpoints.txt
class ChimoApi {
  ChimoApi(this._client);

  final ApiClient _client;

  // ---- auth / login ----
  Future<ApiResponse> sendSms({required String phone}) {
    return _client.post('/auth/sms-send', bizParam: {'phone': phone});
  }

  Future<ApiResponse> smsAuth({
    required String phone,
    required String code,
    String userInfoKey = '',
  }) {
    return _client.post(
      '/auth/sms-auth',
      bizParam: {
        'phone': phone,
        'code': code,
        'userInfoKey': userInfoKey,
      },
    );
  }

  Future<ApiResponse> loginPlatforms() => _client.get('/auth/login-platforms');

  Future<ApiResponse> refreshToken() => _client.get('/auth/refresh-token');

  // ---- user ----
  Future<ApiResponse> userOpen({bool open = false}) {
    return _client.post('/user/open', bizParam: {'open': open});
  }

  Future<ApiResponse> userInfo() => _client.get('/user/info');

  Future<ApiResponse> updateUserInfo(Map<String, dynamic> fields) {
    return _client.post('/user/info', bizParam: fields);
  }

  Future<ApiResponse> userInfoByUid(String uid, {int scene = 0}) {
    return _client.get('/user/info/$uid', query: {'scene': '$scene'});
  }

  Future<ApiResponse> userConf() => _client.get('/user/conf');

  Future<ApiResponse> searchUsers(String key) {
    return _client.get('/user-relation/searchUser', query: {'key': key});
  }

  /// People I follow (`Follow` tab). Empty keyword = full list.
  Future<ApiResponse> searchFollowing({
    int pageNum = 1,
    int pageSize = 50,
    String keyword = '',
  }) {
    return _client.get(
      '/user-relation/search-followers',
      query: {
        'pageNum': '$pageNum',
        'pageSize': '$pageSize',
        'keyword': keyword,
      },
    );
  }

  /// Fans who follow me (`Followers` tab).
  Future<ApiResponse> searchFans({
    int pageNum = 1,
    int pageSize = 50,
    String keyword = '',
  }) {
    return _client.get(
      '/user-relation/search-fans',
      query: {
        'pageNum': '$pageNum',
        'pageSize': '$pageSize',
        'keyword': keyword,
      },
    );
  }

  /// Mutual friends (`Friends` tab).
  Future<ApiResponse> searchFriends({
    int pageNum = 1,
    int pageSize = 50,
    String keyword = '',
  }) {
    return _client.get(
      '/user-relation/search-friends',
      query: {
        'pageNum': '$pageNum',
        'pageSize': '$pageSize',
        'keyword': keyword,
      },
    );
  }

  Future<ApiResponse> followUser(String uid) {
    return _client.get('/user-relation/follow/$uid');
  }

  Future<ApiResponse> unfollowUser(String uid) {
    return _client.post('/user-relation/unfollow/$uid');
  }

  // ---- group / chat ----
  Future<ApiResponse> groupTypeList() => _client.get('/chat/group/getTypeList');

  Future<ApiResponse> groupList({int pageNum = 1, int pageSize = 10}) {
    return _client.get(
      '/chat/group/list',
      query: {'pageNum': '$pageNum', 'pageSize': '$pageSize'},
    );
  }

  Future<ApiResponse> groupListByType(String type) {
    return _client.get(
      '/chat/group/listByType',
      query: {'typeList': type},
    );
  }

  Future<ApiResponse> myGroups() => _client.get('/chat/group/myGroups');

  Future<ApiResponse> groupDetail(String gid) {
    return _client.get('/chat/group/getDetail/$gid');
  }

  Future<ApiResponse> groupPhotos(String gid) {
    return _client.get('/chat/group/photoList/$gid');
  }

  Future<ApiResponse> groupMembers(String gid, {String searchKey = ''}) {
    return _client.get(
      '/chat/group/searchUsers/$gid',
      query: {'searchKey': searchKey},
    );
  }

  Future<ApiResponse> joinGroup(List<String> gids) {
    return _client.post(
      '/chat/group/join',
      bizParam: {'emGroupIdList': gids},
    );
  }

  Future<ApiResponse> leaveGroup(String gid) {
    return _client.post('/chat/group/leave/$gid');
  }

  // ---- app / home ----
  Future<ApiResponse> appSettings() => _client.get('/app/settings');

  Future<ApiResponse> splashList() => _client.get('/app/splash_list');

  Future<ApiResponse> versionCheck({String version = '1.0.0'}) {
    return _client.get('/app/version-check', query: {'version': version});
  }

  Future<ApiResponse> homeMain() => _client.get('/home_page/main');

  Future<ApiResponse> giftWallList(String uid) {
    return _client.get('/gift-wall/list', query: {'uid': uid});
  }

  Future<ApiResponse> homeList({
    required String tabId,
    int pageNum = 1,
    int pageSize = 10,
    String snapshotId = '',
  }) {
    return _client.get(
      '/home_page/list',
      query: {
        'tabId': tabId,
        'pageNum': '$pageNum',
        'pageSize': '$pageSize',
        'snapshotId': snapshotId,
      },
    );
  }

  Future<ApiResponse> bannerList({int type = 1}) {
    return _client.get('/banner/list', query: {'type': '$type'});
  }
}

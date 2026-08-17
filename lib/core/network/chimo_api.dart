import 'api_client.dart';

/// 接口与 D:\forya `lib_network`（login / user / group / app）对齐。
///
/// 权威来源：
/// - packages_local/lib_network/lib/src/api/*.dart
/// - api_endpoints.txt
class ChimoApi {
  ChimoApi(this._client);

  final ApiClient _client;

  // ---- 认证 / 登录 ----
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

  Future<ApiResponse> sendEmailCode({required String email}) {
    return _client.post('/auth/send-email-code', bizParam: {'email': email});
  }

  Future<ApiResponse> emailAuth({
    required String email,
    required String code,
  }) {
    return _client.post(
      '/auth/email-auth',
      bizParam: {'email': email, 'code': code},
    );
  }

  /// Apple ID 登录，对齐 forya `POST /auth/apple-auth`（AppleAuthReq）。
  Future<ApiResponse> appleAuth({
    required String idToken,
    String nickname = '',
  }) {
    return _client.post(
      '/auth/apple-auth',
      bizParam: {
        'idToken': idToken,
        if (nickname.isNotEmpty) 'nickname': nickname,
      },
    );
  }

  Future<ApiResponse> bindEmail({
    required String email,
    required String code,
  }) {
    return _client.post(
      '/user/bind-email',
      bizParam: {'email': email, 'code': code},
    );
  }

  // ---- 用户 ----
  Future<ApiResponse> userOpen({bool open = false}) {
    return _client.post('/user/open', bizParam: {'open': open});
  }

  Future<ApiResponse> userInfo() => _client.get('/user/info');

  Future<ApiResponse> updateUserInfo(Map<String, dynamic> fields) {
    return _client.post('/user/info', bizParam: fields);
  }

  Future<ApiResponse> accountSecurityInfo() {
    return _client.get('/user/account-security-info');
  }

  /// 申请注销账号。[code] 对仅邮箱账号可为空。
  Future<ApiResponse> cancelAccount({String code = ''}) {
    return _client.post('/user/cancel-account', bizParam: {'code': code});
  }

  Future<ApiResponse> userInfoByUid(String uid, {int scene = 0}) {
    return _client.get(
      '/user/info/$uid',
      query: {'scene': '$scene'},
      accept: ApiClient.acceptProto,
    );
  }

  Future<ApiResponse> userConf() => _client.get('/user/conf');

  /// 交友标签目录（对齐 forya `GET /user/make-friend-label-list`）。
  Future<ApiResponse> makeFriendLabelList() {
    return _client.get('/user/make-friend-label-list');
  }

  /// 保存交友标签（对齐 forya `POST /user/make-friend-label`，body.id 为标签 id 列表）。
  Future<ApiResponse> saveMakeFriendLabels(List<int> ids) {
    return _client.post('/user/make-friend-label', bizParam: {'id': ids});
  }

  Future<ApiResponse> searchUsers(String key) {
    return _client.get('/user-relation/searchUser', query: {'key': key});
  }

  /// 首页搜索（forya `getHomeSearchData`）：用户 + 房间，支持搜自己的 ID。
  Future<ApiResponse> homeSearch(String no) {
    return _client.get('/search', query: {'no': no});
  }

  /// 我关注的人（`Follow` 标签）。空关键字 = 完整列表。
  Future<ApiResponse> searchFollowing({
    int pageNum = 1,
    int pageSize = 20,
    String keyword = '',
  }) {
    return _client.get(
      '/user-relation/search-followers',
      query: {
        'pageNum': '$pageNum',
        'pageSize': '$pageSize',
        'keyword': keyword,
      },
      accept: ApiClient.acceptProto,
    );
  }

  /// 关注我的粉丝（`Followers` 标签）。
  Future<ApiResponse> searchFans({
    int pageNum = 1,
    int pageSize = 20,
    String keyword = '',
  }) {
    return _client.get(
      '/user-relation/search-fans',
      query: {
        'pageNum': '$pageNum',
        'pageSize': '$pageSize',
        'keyword': keyword,
      },
      accept: ApiClient.acceptProto,
    );
  }

  /// 互相关注好友（`Friends` 标签）。
  Future<ApiResponse> searchFriends({
    int pageNum = 1,
    int pageSize = 20,
    String keyword = '',
  }) {
    return _client.get(
      '/user-relation/search-friends',
      query: {
        'pageNum': '$pageNum',
        'pageSize': '$pageSize',
        'keyword': keyword,
      },
      accept: ApiClient.acceptProto,
    );
  }

  Future<ApiResponse> followUser(String uid) {
    return _client.get('/user-relation/follow/$uid');
  }

  Future<ApiResponse> unfollowUser(String uid) {
    return _client.post('/user-relation/unfollow/$uid');
  }

  Future<ApiResponse> setBlackList({
    required String userId,
    required bool isCancel,
  }) {
    return _client.post(
      '/user-relation/set-black-list',
      bizParam: {
        'userId': userId,
        'isCancel': isCancel,
      },
    );
  }

  Future<ApiResponse> getBlackList() =>
      _client.get('/user-relation/get-black-list');

  /// 谁看过我的资料（Visits 页面）。
  Future<ApiResponse> viewedBy() => _client.get('/user-relation/viewedBy');

  /// 从 Visits 列表删除一条访问记录。
  Future<ApiResponse> deleteVisitRecord(String visitorId) {
    return _client.post(
      '/user-relation/delete-visit-record',
      bizParam: {'visitorId': visitorId},
    );
  }

  Future<ApiResponse> cashCurrent() => _client.get('/cash/current');

  /// 钱包金币充值套餐。
  Future<ApiResponse> cashChargeProducts() =>
      _client.get('/cash/charge/product');

  /// 商城商品目录（可选钱包/商品来源）。
  Future<ApiResponse> cashGoods() => _client.get('/cash/goods');

  /// 房间/私聊礼物目录（标签页 + 商品）。
  Future<ApiResponse> cashItems({int version = 1, int rid = 0}) {
    return _client.get(
      '/cash/item',
      query: {
        'version': '$version',
        'rid': '$rid',
      },
    );
  }

  /// 向一个或多个用户赠送礼物。
  Future<ApiResponse> cashGift({
    required List<String> receiverIds,
    required String itemId,
    required int count,
    String? channelId,
  }) {
    return _client.post(
      '/cash/gift',
      bizParam: {
        'receiverId': receiverIds,
        'itemId': itemId,
        'count': count,
        if (channelId != null && channelId.isNotEmpty) 'channel': channelId,
      },
    );
  }

  /// 金币流水（近 [days] 天，分页）。对齐 forya `CashApi.getOpHistory`。
  Future<ApiResponse> cashOpHistory({
    required int pageNum,
    required int pageSize,
    int days = 30,
  }) {
    final nowSec = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return _client.post(
      '/cash/op-history',
      bizParam: {
        'beginTimestamp': nowSec - 60 * 60 * 24 * days,
        'endTimestamp': nowSec,
        'pageNum': pageNum,
        'pageSize': pageSize,
      },
    );
  }

  /// 对齐 forya `POST /cash/charge/create`。
  /// [payItemType]：4 = APPLE_APP_STORE，13 = GOOGLE_PLAY。
  Future<ApiResponse> cashChargeCreate({
    required String productId,
    required int payItemType,
  }) {
    return _client.post(
      '/cash/charge/create',
      bizParam: {
        'productId': int.tryParse(productId) ?? productId,
        'payItemType': payItemType,
        'v2': true,
      },
    );
  }

  /// 对齐 forya `POST /cash/charge/verify_receipt`。
  Future<ApiResponse> cashChargeVerifyReceipt({
    required String orderId,
    required String userId,
    required String extraJson,
  }) {
    return _client.post(
      '/cash/charge/verify_receipt',
      bizParam: {
        'orderId': orderId,
        'userId': userId,
        'extraJson': extraJson,
      },
    );
  }

  /// 批量获取会话列表用的用户头像 / 昵称。
  Future<ApiResponse> msgUsers(String emUserNames) {
    return _client.get(
      '/user/msglist-users',
      query: {'emUserNames': emUserNames},
    );
  }

  Future<ApiResponse> msgUser(String emUserName) {
    return _client.get(
      '/user/msg-user',
      query: {'emUserName': emUserName},
    );
  }

  // ---- 群组 / 聊天 ----
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

  // ---- 应用 / 首页 ----
  Future<ApiResponse> appSettings() => _client.get('/app/settings');

  Future<ApiResponse> updateAppSettings(Map<String, dynamic> fields) {
    return _client.post('/app/settings', bizParam: fields);
  }

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

  // ---- 表情 / 贴纸（forya EmoteApi） ----
  Future<ApiResponse> emoticonsList({String scene = 'CHAT'}) {
    return _client.get('/emote/emoticons-list', query: {'scene': scene});
  }

  Future<ApiResponse> emoteItemList(String emoticonId) {
    return _client.get(
      '/emote/item-list',
      query: {'emoticon_id': emoticonId},
    );
  }

  // ---- 举报 ----
  /// 对齐 forya `POST /report`（ReportReq）。
  Future<ApiResponse> report({
    required String reportedId,
    required String type,
    required String reason,
    required String description,
    List<String> evidenceImages = const [],
    List<String> evidenceVideos = const [],
  }) {
    return _client.post(
      '/report',
      bizParam: {
        'reportedId': reportedId,
        'type': type,
        'reason': reason,
        'description': description,
        'evidenceImages': evidenceImages,
        'evidenceVideos': evidenceVideos,
      },
    );
  }

  // ---- 媒体上传 ----
  Future<ApiResponse> uploadUrl({
    required int sceneCode,
    required String filename,
  }) {
    return _client.get(
      '/aws/upload-url',
      query: {
        'sceneCode': '$sceneCode',
        'filename': filename,
      },
    );
  }
}

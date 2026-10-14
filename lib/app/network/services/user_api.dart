import '../../../common/models/server_client/user.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 当前用户 / 资料相关接口。返回 `lib/common/models` 里的生成模型。
class UserApi {
  const UserApi();

  Future<ApiResult<UserInfoRsp>> profile() async {
    return await Http.ins.getAndParse<UserInfoRsp>('/user/info');
  }

  Future<ApiResult<UserInfoRsp>> profileByUid(String uid, {int scene = 0}) async {
    return await Http.ins.getAndParse<UserInfoRsp>(
      '/user/info/$uid',
      query: {'scene': '$scene'},
    );
  }

  /// 用户保活/探活请求（/user/open）
  Future<ApiResult<void>> pingOpen({bool open = false}) {
    return Http.ins.postAndParse(
      '/user/open',
      data: {'open': open},
    );
  }

  Future<ApiResult<void>> update(Map<String, dynamic> fields) {
    return Http.ins.postAndParse('/user/info', data: fields);
  }

  /// 交友标签目录（`GET /user/make-friend-label-list`）。
  Future<ApiResult<List<MakeFriendLabelRespEntry>>> makeFriendLabelList() async {
    final res = await Http.ins.getAndParse<MakeFriendLabelResp>(
      '/user/make-friend-label-list',
    );
    return res.map((data) => data.list);
  }

  Future<ApiResult<void>> saveMakeFriendLabels(List<int> ids) {
    return Http.ins.postAndParse(
      '/user/make-friend-label',
      data: {'id': ids},
    );
  }

  Future<ApiResult<bool>> hasApplyForCancel() async {
    final res = await Http.ins.getAndParse<AccountSecurityInfoResp>(
      '/user/account-security-info',
    );
    return res.map((data) => data.hasApplyForCancel);
  }

  Future<ApiResult<void>> cancelAccount({String code = ''}) {
    return Http.ins.postAndParse(
      '/user/cancel-account',
      data: {'code': code},
    );
  }

  Future<ApiResult<ConfResp>> conf() {
    return Http.ins.getAndParse<ConfResp>('/user/conf');
  }

  Future<ApiResult<String>> imAppKey() async {
    final res = await conf();
    return res.map((data) {
      final key = data.hasImConfig() ? data.imConfig.appKey : '';
      if (key.isEmpty) {
        throw StateError('imConfig.appKey missing from /user/conf');
      }
      return key;
    });
  }

}

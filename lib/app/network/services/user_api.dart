import 'package:fixnum/fixnum.dart';

import '../../../common/models/server_client/user.pb.dart';
import '../http/api_gateway.dart';
import '../http/api_result.dart';
import '../http/pb_specs.dart';
import '../network_bootstrap.dart';

/// 当前用户 / 资料相关接口。返回 `lib/common/models` 里的生成模型。
class UserApi {
  const UserApi();

  Future<ApiResult<User>> profile() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get('/user/info', unpack: PbSpecs.userInfo),
      map: (res) {
        final user = _user(res.data);
        if (user == null) throw StateError('Empty user profile');
        return user;
      },
    );
  }

  Future<ApiResult<User>> profileByUid(String uid, {int scene = 0}) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/user/info/$uid',
        query: {'scene': '$scene'},
        unpack: PbSpecs.userInfo,
      ),
      map: (res) {
        final user = _user(res.data);
        if (user == null) throw StateError('Empty user profile');
        return user;
      },
    );
  }

  /// 信封成功但没有用户时 `data` 为 null。
  ///
  /// [clearSessionOnNotLogin] 为 false 时，未登录只当作这次读取失败，不清本地会话。
  Future<ApiResult<User?>> profileOrNull({bool clearSessionOnNotLogin = true}) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get('/user/info', unpack: PbSpecs.userInfo),
      map: (res) => _user(res.data),
      clearSessionOnNotLogin: clearSessionOnNotLogin,
    );
  }

  Future<ApiResult<User?>> profileByUidOrNull(String uid, {int scene = 0}) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/user/info/$uid',
        query: {'scene': '$scene'},
        unpack: PbSpecs.userInfo,
      ),
      map: (res) => _user(res.data),
    );
  }

  Future<ApiResult<void>> update(Map<String, dynamic> fields) {
    return ApiGateway.action(
      () => NetworkBootstrap.client.post('/user/info', bizParam: fields),
    );
  }

  /// 交友标签目录（`GET /user/make-friend-label-list`）。
  Future<ApiResult<List<MakeFriendLabelRespEntry>>> makeFriendLabelList() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/user/make-friend-label-list',
        unpack: PbSpecs.makeFriendLabels,
      ),
      map: (res) {
        final data = res.data;
        if (data is! MakeFriendLabelResp) return const [];
        return data.list;
      },
    );
  }

  Future<ApiResult<void>> saveMakeFriendLabels(List<int> ids) {
    return ApiGateway.action(
      () => NetworkBootstrap.client.post(
        '/user/make-friend-label',
        bizParam: {'id': ids},
      ),
    );
  }

  Future<ApiResult<bool>> hasApplyForCancel() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/user/account-security-info',
        unpack: PbSpecs.accountSecurity,
      ),
      map: (res) {
        final data = res.data;
        if (data is! AccountSecurityInfoResp) return false;
        return data.hasApplyForCancel;
      },
    );
  }

  Future<ApiResult<void>> cancelAccount({String code = ''}) {
    return ApiGateway.action(
      () => NetworkBootstrap.client.post(
        '/user/cancel-account',
        bizParam: {'code': code},
      ),
    );
  }

  Future<ApiResult<ConfResp>> conf() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get('/user/conf', unpack: PbSpecs.conf),
      map: (res) {
        final data = res.data;
        if (data is! ConfResp) return ConfResp();
        return data;
      },
    );
  }

  Future<ApiResult<String>> imAppKey() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get('/user/conf', unpack: PbSpecs.conf),
      map: (res) {
        final data = res.data;
        final key = data is ConfResp && data.hasImConfig()
            ? data.imConfig.appKey
            : '';
        if (key.isEmpty) {
          throw StateError('imConfig.appKey missing from /user/conf');
        }
        return key;
      },
    );
  }

  Future<ApiResult<({String emUser, String emPwd, User profile})>>
  imCredentials() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get('/user/info', unpack: PbSpecs.userInfo),
      map: (res) {
        final user = _user(res.data);
        if (user == null) throw StateError('Empty user info');
        if (user.emUsername.isEmpty || user.emPwd.isEmpty) {
          throw StateError('EM credentials missing');
        }
        return (emUser: user.emUsername, emPwd: user.emPwd, profile: user);
      },
    );
  }
}

User? _user(Object? data) {
  if (data is UserInfoRsp) {
    return data.hasUser() ? data.user : null;
  }
  if (data is User) {
    return data.id != Int64.ZERO || data.nickname.isNotEmpty ? data : null;
  }
  return null;
}

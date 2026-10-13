import '../../../common/models/server_client/login.pb.dart';
import '../http/api_client.dart';
import '../http/api_gateway.dart';
import '../http/api_result.dart';
import '../http/pb_specs.dart';
import '../network_bootstrap.dart';

/// 认证 / 登录相关接口。
class AuthApi {
  const AuthApi();

  Future<ApiResult<void>> sendSms({required String phone}) {
    return ApiGateway.action(
      () => NetworkBootstrap.client.post(
        '/auth/send-phone-code',
        accept: ApiClient.acceptProto,
        bizParam: {'phone': phone},
      ),
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<AuthRsp>> smsAuth({
    required String phone,
    required String code,
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.post(
        '/auth/phone-auth',
        unpack: PbSpecs.externalAuth,
        bizParam: {'phone': phone, 'code': code},
      ),
      map: (res) => _auth(res.data),
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<void>> sendEmailCode({required String email}) {
    return ApiGateway.action(
      () => NetworkBootstrap.client.post(
        '/auth/send-email-code',
        accept: ApiClient.acceptProto,
        bizParam: {'email': email},
      ),
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<AuthRsp>> emailAuth({
    required String email,
    required String code,
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.post(
        '/auth/email-auth',
        unpack: PbSpecs.externalAuth,
        bizParam: {'email': email, 'code': code},
      ),
      map: (res) => _auth(res.data),
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<AuthRsp>> appleAuth({
    required String idToken,
    String nickname = '',
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.post(
        '/auth/apple-auth',
        unpack: PbSpecs.externalAuth,
        bizParam: {
          'idToken': idToken,
          if (nickname.isNotEmpty) 'nickname': nickname,
        },
      ),
      map: (res) => _auth(res.data),
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<LoginPlatformsRsp>> loginPlatforms() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/auth/login-platforms',
        unpack: PbSpecs.loginPlatforms,
      ),
      map: (res) {
        final data = res.data;
        if (data is! LoginPlatformsRsp) {
          throw StateError('Login platforms missing');
        }
        return data;
      },
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<void>> bindEmail({
    required String email,
    required String code,
  }) {
    return ApiGateway.action(
      () => NetworkBootstrap.client.post(
        '/user/bind-email',
        bizParam: {'email': email, 'code': code},
      ),
    );
  }
}

AuthRsp _auth(Object? data) {
  if (data is ExternalAuthRsp && data.hasAuthed()) {
    data = data.authed;
  }
  if (data is AuthRsp && data.token.isNotEmpty) return data;
  throw StateError('Login succeeded but token missing');
}

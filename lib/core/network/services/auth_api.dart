import '../api_gateway.dart';
import '../api_result.dart';
import '../app_meta_dto.dart';
import '../network_bootstrap.dart';

/// 认证 / 登录相关接口。
class AuthApi {
  const AuthApi();

  Future<ApiResult<void>> sendSms({required String phone}) {
    return ApiGateway.action(
      () => NetworkBootstrap.api.sendSms(phone: phone),
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<AuthTokenPayload>> smsAuth({
    required String phone,
    required String code,
    String userInfoKey = '',
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.smsAuth(
        phone: phone,
        code: code,
        userInfoKey: userInfoKey,
      ),
      map: (res) {
        final payload = AuthTokenPayload.fromResponse(res);
        if (payload == null) {
          throw StateError('Login succeeded but token missing');
        }
        return payload;
      },
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<void>> sendEmailCode({required String email}) {
    return ApiGateway.action(
      () => NetworkBootstrap.api.sendEmailCode(email: email),
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<AuthTokenPayload>> emailAuth({
    required String email,
    required String code,
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.emailAuth(email: email, code: code),
      map: (res) {
        final payload = AuthTokenPayload.fromResponse(res);
        if (payload == null) {
          throw StateError('Login succeeded but token missing');
        }
        return payload;
      },
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<AuthTokenPayload>> appleAuth({
    required String idToken,
    String nickname = '',
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.appleAuth(
        idToken: idToken,
        nickname: nickname,
      ),
      map: (res) {
        final payload = AuthTokenPayload.fromResponse(res);
        if (payload == null) {
          throw StateError('Login succeeded but token missing');
        }
        return payload;
      },
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<LoginPlatformsConfig>> loginPlatforms() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.loginPlatforms(),
      map: (res) {
        final config = LoginPlatformsConfig.fromResponse(res);
        if (config == null) {
          throw StateError('Login platforms missing');
        }
        return config;
      },
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<void>> bindEmail({
    required String email,
    required String code,
  }) {
    return ApiGateway.action(
      () => NetworkBootstrap.api.bindEmail(email: email, code: code),
    );
  }
}

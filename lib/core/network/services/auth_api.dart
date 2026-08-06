import '../api_gateway.dart';
import '../api_result.dart';
import '../app_meta_dto.dart';
import '../network_bootstrap.dart';

/// Auth / login endpoints.
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

  Future<ApiResult<void>> bindEmail({
    required String email,
    required String code,
  }) {
    return ApiGateway.action(
      () => NetworkBootstrap.api.bindEmail(email: email, code: code),
    );
  }
}

import '../../../common/models/server_client/login.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 认证 / 登录相关接口。
class AuthApi {
  const AuthApi();

  Future<ApiResult<void>> sendSms({required String phone}) {
    return Http.ins.postAndParse(
      '/auth/send-phone-code',
      data: {'phone': phone},
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<AuthRsp>> smsAuth({
    required String phone,
    required String code,
  }) async {
    final res = await Http.ins.postAndParse<ExternalAuthRsp>(
      '/auth/phone-auth',
      data: {'phone': phone, 'code': code},
      clearSessionOnNotLogin: false,
    );
    return res.map(_auth);
  }

  Future<ApiResult<void>> sendEmailCode({required String email}) {
    return Http.ins.postAndParse(
      '/auth/send-email-code',
      data: {'email': email},
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<AuthRsp>> emailAuth({
    required String email,
    required String code,
  }) async {
    final res = await Http.ins.postAndParse<ExternalAuthRsp>(
      '/auth/email-auth',
      data: {'email': email, 'code': code},
      clearSessionOnNotLogin: false,
    );
    return res.map(_auth);
  }

  Future<ApiResult<AuthRsp>> appleAuth({
    required String idToken,
    String nickname = '',
  }) async {
    final res = await Http.ins.postAndParse<ExternalAuthRsp>(
      '/auth/apple-auth',
      data: {
        'idToken': idToken,
        if (nickname.isNotEmpty) 'nickname': nickname,
      },
      clearSessionOnNotLogin: false,
    );
    return res.map(_auth);
  }

  Future<ApiResult<LoginPlatformsRsp>> loginPlatforms() {
    return Http.ins.getAndParse<LoginPlatformsRsp>(
      '/auth/login-platforms',
      clearSessionOnNotLogin: false,
    );
  }

  Future<ApiResult<void>> bindEmail({
    required String email,
    required String code,
  }) {
    return Http.ins.postAndParse(
      '/user/bind-email',
      data: {'email': email, 'code': code},
    );
  }

  /// 刷新用户 Token
  Future<ApiResult<RefreshTokenData>> refreshToken() async {
    return Http.ins.getAndParse<RefreshTokenData>(
      '/auth/refresh-token',
    );
  }
}

AuthRsp _auth(ExternalAuthRsp data) {
  if (data.hasAuthed()) {
    return data.authed;
  }
  throw StateError('Login succeeded but token missing');
}

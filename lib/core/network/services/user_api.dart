import '../../../features/me/data/user_dto.dart';
import '../../../features/me/models/me_models.dart';
import '../../../shared/models/chat_user_profile.dart';
import '../api_gateway.dart';
import '../api_result.dart';
import '../app_meta_dto.dart';
import '../network_bootstrap.dart';

/// Current user / profile endpoints.
class UserApi {
  const UserApi();

  Future<ApiResult<MeProfile>> profile() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userInfo(),
      map: (res) {
        final profile = UserDto.parseProfile(res);
        if (profile == null) throw StateError('Empty user profile');
        return profile;
      },
    );
  }

  Future<ApiResult<ChatUserProfile>> chatProfile() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userInfo(),
      map: (res) {
        final profile = UserDto.parseChatProfile(res);
        if (profile == null) throw StateError('Empty user profile');
        return profile;
      },
    );
  }

  Future<ApiResult<ChatUserProfile>> profileByUid(
    String uid, {
    int scene = 0,
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userInfoByUid(uid, scene: scene),
      map: (res) {
        final profile = UserDto.parseChatProfile(res);
        if (profile == null) throw StateError('Empty user profile');
        return profile;
      },
    );
  }

  /// Soft profile fetch — `ok` with null data when envelope succeeds but body empty.
  Future<ApiResult<MeProfile?>> profileOrNull() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userInfo(),
      map: UserDto.parseProfile,
    );
  }

  Future<ApiResult<ChatUserProfile?>> profileByUidOrNull(
    String uid, {
    int scene = 0,
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userInfoByUid(uid, scene: scene),
      map: UserDto.parseChatProfile,
    );
  }

  Future<ApiResult<void>> update(Map<String, dynamic> fields) {
    return ApiGateway.action(
      () => NetworkBootstrap.api.updateUserInfo(fields),
    );
  }

  Future<ApiResult<Map<String, dynamic>>> conf() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userConf(),
      map: (res) {
        final data = res.data;
        if (data is Map) return Map<String, dynamic>.from(data);
        return <String, dynamic>{};
      },
    );
  }

  Future<ApiResult<String>> imAppKey() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userConf(),
      map: (res) {
        final key = UserConfDto.parseAppKey(res.data);
        if (key == null || key.isEmpty) {
          throw StateError('imConfig.appKey missing from /user/conf');
        }
        return key;
      },
    );
  }

  Future<ApiResult<({String emUser, String emPwd, MeProfile profile})>>
      imCredentials() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.userInfo(),
      map: (res) {
        final data = res.data;
        if (data is! Map) throw StateError('Empty user info');
        final root = Map<String, dynamic>.from(data);
        final user = root['user'] is Map
            ? Map<String, dynamic>.from(root['user'] as Map)
            : root;
        final emUser =
            '${user['emUsername'] ?? user['emUserName'] ?? ''}'.trim();
        final emPwd = '${user['emPwd'] ?? user['emPassword'] ?? ''}'.trim();
        if (emUser.isEmpty || emPwd.isEmpty) {
          throw StateError('EM credentials missing');
        }
        return (
          emUser: emUser,
          emPwd: emPwd,
          profile: UserDto.fromUserMap(user),
        );
      },
    );
  }
}

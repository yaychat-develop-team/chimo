import '../../../common/models/server_client/common/app.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 应用设置与版本检查。
class AppSettingsApi {
  const AppSettingsApi();

  Future<ApiResult<GetSettingsResp>> settings() {
    return Http.ins.getAndParse<GetSettingsResp>('/app/settings');
  }

  Future<ApiResult<void>> updateSettings(Map<String, dynamic> fields) {
    return Http.ins.postAndParse('/app/settings', data: fields);
  }

  Future<ApiResult<VersionUpdateData>> versionCheck({String version = '1.0.0'}) {
    return Http.ins.getAndParse<VersionUpdateData>(
      '/app/version-check',
      query: {'version': version},
    );
  }
}

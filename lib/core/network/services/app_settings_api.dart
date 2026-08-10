import '../../../features/home/data/banner_dto.dart';
import '../api_gateway.dart';
import '../api_result.dart';
import '../app_meta_dto.dart';
import '../network_bootstrap.dart';

/// 应用设置、版本、首页横幅。
class AppSettingsApi {
  const AppSettingsApi();

  Future<ApiResult<AppPrivacySettings>> settings() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.appSettings(),
      map: AppPrivacySettings.fromResponse,
    );
  }

  Future<ApiResult<void>> updateSettings(Map<String, dynamic> fields) {
    return ApiGateway.action(
      () => NetworkBootstrap.api.updateAppSettings(fields),
    );
  }

  Future<ApiResult<AppVersionInfo>> versionCheck({
    String version = '1.0.0',
    String fallbackWebsite = '',
  }) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.versionCheck(version: version),
      map: (res) => AppVersionDto.parse(
        res,
        fallbackVersion: version,
        fallbackWebsite: fallbackWebsite,
      ),
    );
  }

  Future<ApiResult<List<HomeBannerItem>>> homeBanners() {
    return ApiGateway.request(
      () => NetworkBootstrap.api.homeMain(),
      map: (res) => BannerDto.parseHomeMain(res.data),
    );
  }

  Future<ApiResult<List<HomeBannerItem>>> bannerList({int type = 1}) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.bannerList(type: type),
      map: (res) {
        final data = res.data;
        if (data is Map) {
          return BannerDto.parseList(data['list'] ?? data['banners']);
        }
        return BannerDto.parseList(data);
      },
    );
  }
}

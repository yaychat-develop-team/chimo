import '../../../common/models/server_client/banner.pb.dart';
import '../../../common/models/server_client/common/app.pb.dart';
import '../../../common/models/server_client/home_page/home_page_main.pb.dart';
import '../http/api_gateway.dart';
import '../http/api_result.dart';
import '../http/pb_specs.dart';
import '../network_bootstrap.dart';

/// 应用设置、版本、首页横幅。
class AppSettingsApi {
  const AppSettingsApi();

  Future<ApiResult<GetSettingsResp>> settings() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/app/settings',
        unpack: PbSpecs.settings,
      ),
      map: (res) {
        final data = res.data;
        if (data is! GetSettingsResp) return GetSettingsResp();
        return data;
      },
    );
  }

  Future<ApiResult<void>> updateSettings(Map<String, dynamic> fields) {
    return ApiGateway.action(
      () => NetworkBootstrap.client.post('/app/settings', bizParam: fields),
    );
  }

  Future<ApiResult<VersionUpdateData>> versionCheck({String version = '1.0.0'}) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/app/version-check',
        query: {'version': version},
        unpack: PbSpecs.version,
      ),
      map: (res) {
        final data = res.data;
        if (data is! VersionUpdateData) return VersionUpdateData();
        return data;
      },
    );
  }

  Future<ApiResult<List<HomeBannerItem>>> homeBanners() {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/home_page/main',
        unpack: PbSpecs.homeMain,
      ),
      map: (res) {
        final data = res.data;
        if (data is! HomeMainData) return const [];
        return [
          for (final banner in data.banners)
            if (banner.type == HomeBannerItem_Type.image ||
                banner.type == HomeBannerItem_Type.unknown)
              banner,
        ];
      },
    );
  }

  Future<ApiResult<List<BannerItem>>> bannerList({int type = 1}) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/banner/list',
        query: {'type': '$type'},
        unpack: PbSpecs.banners,
      ),
      map: (res) {
        final data = res.data;
        if (data is! BannerListResp) return const [];
        return data.list;
      },
    );
  }
}

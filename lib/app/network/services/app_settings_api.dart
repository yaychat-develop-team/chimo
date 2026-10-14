import '../../../common/models/server_client/banner.pb.dart';
import '../../../common/models/server_client/common/app.pb.dart';
import '../../../common/models/server_client/home_page/home_page_main.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 应用设置、版本、首页横幅。
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

  Future<ApiResult<List<HomeBannerItem>>> homeBanners() async {
    final res = await Http.ins.getAndParse<HomeMainData>('/home_page/main');
    return res.map(
      (data) => [
        for (final banner in data.banners)
          if (banner.type == HomeBannerItem_Type.image ||
              banner.type == HomeBannerItem_Type.unknown)
            banner,
      ],
    );
  }

  Future<ApiResult<List<BannerItem>>> bannerList({int type = 1}) async {
    final res = await Http.ins.getAndParse<BannerListResp>(
      '/banner/list',
      query: {'type': '$type'},
    );
    return res.map((data) => data.list);
  }
}

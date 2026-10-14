import '../../../common/models/server_client/banner.pb.dart';
import '../../../common/models/server_client/home_page/home_page_main.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 首页主数据、房间列表和横幅。
class HomeApi {
  const HomeApi();

  Future<ApiResult<HomeMainData>> homeMain() {
    return Http.ins.getAndParse<HomeMainData>('/home_page/main');
  }

  /// 首页某个 Tab 的列表。房间 Tab 的 [tabId] 来自 [homeMain] 里 `type == room` 的项。
  ///
  /// `snapshotId` 第一页也要带上（空串）。服务端把它标成必填，缺参会在登录校验之后直接报错。
  Future<ApiResult<HomePageListData>> homeTabList({
    required String tabId,
    int pageNum = 1,
    int pageSize = 8,
    String? snapshotId,
  }) {
    return Http.ins.getAndParse<HomePageListData>(
      '/home_page/list',
      query: {
        'tabId': tabId,
        'pageNum': '$pageNum',
        'pageSize': '$pageSize',
        'snapshotId': snapshotId ?? '',
      },
    );
  }

  Future<ApiResult<List<HomeBannerItem>>> homeBanners() async {
    final res = await homeMain();
    return res.map(
      (data) => [
        for (final banner in data.banners)
          if (banner.type == HomeBannerItem_Type.image || banner.type == HomeBannerItem_Type.unknown) banner,
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

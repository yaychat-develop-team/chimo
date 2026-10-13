import '../../../common/models/server_client/emote.pb.dart';
import '../http/api_gateway.dart';
import '../http/api_result.dart';
import '../http/pb_specs.dart';
import '../network_bootstrap.dart';

/// 表情 / 贴纸包。
class EmoteApi {
  const EmoteApi();

  Future<ApiResult<List<Emoticons>>> packs({String scene = 'CHAT'}) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/emote/emoticons-list',
        query: {'scene': scene},
        unpack: PbSpecs.emotePacks,
      ),
      map: (res) {
        final data = res.data;
        if (data is! EmoticonsListResp) return const [];
        return [for (final pack in data.list) if (pack.id.isNotEmpty) pack];
      },
    );
  }

  Future<ApiResult<List<EmoteItem>>> stickers(String emoticonId) {
    return ApiGateway.request(
      () => NetworkBootstrap.client.get(
        '/emote/item-list',
        query: {'emoticon_id': emoticonId},
        unpack: PbSpecs.emoteItems,
      ),
      map: (res) {
        final data = res.data;
        if (data is! EmoteItemList) return const [];
        return [
          for (final item in data.items)
            if (item.url.isNotEmpty || item.showUrl.isNotEmpty) item,
        ];
      },
    );
  }
}

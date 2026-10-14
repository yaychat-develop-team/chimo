import '../../../common/models/server_client/emote.pb.dart';
import '../http/api_result.dart';
import '../http/http.dart';

/// 表情 / 贴纸包。
class EmoteApi {
  const EmoteApi();

  Future<ApiResult<List<Emoticons>>> packs({String scene = 'CHAT'}) async {
    final res = await Http.ins.getAndParse<EmoticonsListResp>(
      '/emote/emoticons-list',
      query: {'scene': scene},
    );
    return res.map(
      (data) => [for (final pack in data.list) if (pack.id.isNotEmpty) pack],
    );
  }

  Future<ApiResult<List<EmoteItem>>> stickers(String emoticonId) async {
    final res = await Http.ins.getAndParse<EmoteItemList>(
      '/emote/item-list',
      query: {'emoticon_id': emoticonId},
    );
    return res.map(
      (data) => [
        for (final item in data.items)
          if (item.url.isNotEmpty || item.showUrl.isNotEmpty) item,
      ],
    );
  }
}

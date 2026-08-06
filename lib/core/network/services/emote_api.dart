import '../../../features/chats/data/emote_dto.dart';
import '../api_gateway.dart';
import '../api_result.dart';
import '../network_bootstrap.dart';

/// Emote / sticker packs.
class EmoteApi {
  const EmoteApi();

  Future<ApiResult<List<EmotePack>>> packs({String scene = 'CHAT'}) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.emoticonsList(scene: scene),
      map: (res) => EmoteDto.parsePacks(res.data),
    );
  }

  Future<ApiResult<List<EmoteSticker>>> stickers(String emoticonId) {
    return ApiGateway.request(
      () => NetworkBootstrap.api.emoteItemList(emoticonId),
      map: (res) => EmoteDto.parseStickers(res.data),
    );
  }
}

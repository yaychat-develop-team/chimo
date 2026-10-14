import 'package:get/get.dart';

import '../../../common/models/server_client/common/car.pbenum.dart';
import '../../../common/models/server_client/message.pb.dart';
import '../../../common/models/server_client/rtc.pb.dart';
import '../../../common/utils/app_log.dart';
import '../model/room_fx.dart';
import '../socket/room_msg_handler.dart';

/// 礼物、座驾、歌词、排行。历史消息不进这里。
class RoomEffectLogic extends GetxController {
  final ranks = <RoomRankUser>[].obs;
  final lyric = ''.obs;
  final banner = Rxn<RoomGiftFx>();
  final join = Rxn<RoomJoinFx>();
  final pag = Rxn<String>();

  final List<RoomGiftFx> _gifts = [];
  final List<RoomJoinFx> _joins = [];
  final List<String> _pags = [];
  int _seq = 0;

  void showLyric(String text) {
    final next = text.trim();
    if (next.isEmpty) return;
    lyric.value = next;
  }

  void hideLyric() => lyric.value = '';

  /// 换房间时清空，包括榜和歌词。
  void reset() {
    clearPlayback();
    ranks.clear();
    lyric.value = '';
  }

  /// 最小化或退房时停掉正在播的队列。榜保留到 [reset]。
  void clearPlayback() {
    _gifts.clear();
    _joins.clear();
    _pags.clear();
    banner.value = null;
    join.value = null;
    pag.value = null;
  }

  void finishBanner() {
    final playing = banner.value;
    if (playing == null) return;
    banner.value = null;
    if (_gifts.isNotEmpty && _gifts.first.id == playing.id) _gifts.removeAt(0);
    _advanceBanner();
  }

  void finishJoin() {
    final playing = join.value;
    if (playing == null) return;
    join.value = null;
    if (_joins.isNotEmpty && _joins.first.id == playing.id) _joins.removeAt(0);
    _advanceJoin();
  }

  void finishPag() {
    final playing = pag.value;
    if (playing == null) return;
    pag.value = null;
    if (_pags.isNotEmpty && _pags.first == playing) _pags.removeAt(0);
    _advancePag();
  }

  RoomMsgHandler handler() => _EffectMsgHandler(this);

  void _onMessage(Message message) {
    if (message.type == MessageTypeEnum.chat) {
      final chat = message.data.content.unpackInto(ChatContent());
      if (!chat.hasGiftMsgShow()) return;
      final gift = chat.giftMsgShow;
      final icon = gift.giftIcon.trim();
      if (roomIsPag(icon)) {
        _enqueuePag(icon);
        return;
      }
      _enqueueBanner(RoomGiftFx(
        id: 'gift-${message.id.toInt()}-${_seq++}',
        fromName: chat.hasSender() ? chat.sender.nickname : '',
        toName: gift.nickName,
        giftName: gift.giftName,
        icon: icon,
        count: gift.count,
      ));
      return;
    }
    if (message.data.scene == Scene.USER_JOIN) {
      final joined = message.data.content.unpackInto(RoomUserJoin());
      final effectUrl = joined.hasEffect() ? joined.effect.url.trim() : '';
      if (roomIsPag(effectUrl)) _enqueuePag(effectUrl);
      if (!joined.hasUser() || !joined.user.hasCar()) return;
      final user = joined.user;
      _enqueueJoin(RoomJoinFx(
        id: 'join-${_seq++}',
        name: user.nickname,
        avatar: user.avatar,
        carName: _carName(user),
        carImage: _carImage(user),
        level: _carLevel(user),
      ));
      return;
    }
    if (message.data.scene == Scene.REAL_TIME_RANK_CHANGE) {
      final change = message.data.content.unpackInto(RoomRealTimeRankChange());
      ranks.assignAll(change.rank.map((user) {
        return RoomRankUser(name: user.nickname, avatar: user.avatar, value: user.contributionValue);
      }));
    }
  }

  void _enqueueBanner(RoomGiftFx fx) {
    _gifts.add(fx);
    _advanceBanner();
  }

  void _enqueueJoin(RoomJoinFx fx) {
    _joins.add(fx);
    _advanceJoin();
  }

  void _enqueuePag(String url) {
    _pags.add(url);
    _advancePag();
  }

  void _advanceBanner() {
    if (banner.value != null || _gifts.isEmpty) return;
    banner.value = _gifts.first;
  }

  void _advanceJoin() {
    if (join.value != null || _joins.isEmpty) return;
    join.value = _joins.first;
  }

  void _advancePag() {
    if (pag.value != null || _pags.isEmpty) return;
    pag.value = _pags.first;
  }
}

String _carName(SimpleChannelUser user) {
  if (!user.hasCar() || !user.car.hasCarMetaInfo()) return '';
  return user.car.carMetaInfo.name.trim();
}

String _carImage(SimpleChannelUser user) {
  if (!user.hasCar() || !user.car.hasCarMetaInfo()) return '';
  return user.car.carMetaInfo.rightImgLink.trim();
}

String _carLevel(SimpleChannelUser user) {
  if (!user.hasCar() || !user.car.hasCarMetaInfo()) return '';
  return switch (user.car.carMetaInfo.level) {
    CarLevel.SSS => 'SSS',
    CarLevel.SS => 'SS',
    CarLevel.S => 'S',
    CarLevel.A => 'A',
    CarLevel.B => 'B',
    _ => '',
  };
}

class _EffectMsgHandler implements RoomMsgHandler {
  _EffectMsgHandler(this.logic);

  final RoomEffectLogic logic;

  @override
  bool supports(Message message) {
    if (message.type == MessageTypeEnum.chat) return true;
    final scene = message.data.scene;
    return scene == Scene.USER_JOIN || scene == Scene.REAL_TIME_RANK_CHANGE;
  }

  @override
  void handle(Message message) {
    try {
      logic._onMessage(message);
    } catch (error) {
      AppLog.w('RoomEffect frame skipped', error: error);
    }
  }
}

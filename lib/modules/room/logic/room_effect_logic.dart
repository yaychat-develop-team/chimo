import 'package:get/get.dart';

import '../../../common/models/server_client/common/car.pbenum.dart';
import '../../../common/models/server_client/message.pb.dart';
import '../../../common/models/server_client/rtc.pb.dart';
import '../../../common/utils/app_log.dart';
import '../model/room_fx.dart';
import '../model/room_gift_display.dart';
import '../service/room_service.dart';
import '../socket/room_msg_handler.dart';

/// 礼物、座驾、歌词、排行。历史消息不进这里。
class RoomEffectLogic extends GetxController {
  final ranks = <RoomRankUser>[].obs;
  final lyric = ''.obs;
  final banner = Rxn<RoomGiftFx>();
  final join = Rxn<RoomJoinFx>();

  /// 全屏礼物队列（含麦位飞入飞出）。对齐 joyride GiftDisplay。
  final playingGifts = <RoomGiftDisplay>[].obs;

  /// 入队时自增，驱动 [RoomGiftPag]（避免仅依赖 RxList 时 UI 不刷）。
  final flyEpoch = 0.obs;

  final List<RoomGiftFx> _gifts = [];
  final List<RoomJoinFx> _joins = [];
  final List<RoomGiftDisplay> _giftBuffer = [];
  int _seq = 0;
  static const _maxPlaying = 1;

  /// 飞行动画去重窗口：覆盖飞入 + PAG + 飞出整段，避免重复 SEND_GIFT 连播。
  static const _flyDedupMs = 8000;

  final List<_FlyDedup> _recentFly = [];

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
    _giftBuffer.clear();
    _recentFly.clear();
    banner.value = null;
    join.value = null;
    playingGifts.clear();
    flyEpoch.value++;
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

  void finishGiftDisplay(RoomGiftDisplay config) {
    playingGifts.removeWhere((item) => item.id == config.id);
    playingGifts.refresh();
    flyEpoch.value++;
    _advanceGiftDisplay();
  }

  /// 送礼 API 成功后立刻播飞麦；随后 WS `SEND_GIFT` 会被 [_isDuplicateFly] 挡掉，避免双播。
  /// （仅 WS 时若播放层尚未订上 ever，会出现「点了没动画」。）
  void playLocalSendGift({
    required int senderUid,
    required List<int> receiverUids,
    required String iconUrl,
    String giftUrl = '',
    String micRes = '',
    int count = 1,
    int giftId = 0,
    int price = 0,
    String fromName = '',
    String toName = '',
    String giftName = '',
  }) {
    AppLog.d(
      'GiftFly local',
      body: {'sender': senderUid, 'receivers': receiverUids, 'giftId': giftId},
    );
    _playFly(
      id: 'local-${_seq++}',
      senderUid: senderUid,
      receiverUids: receiverUids,
      iconUrl: iconUrl,
      giftUrl: giftUrl,
      micRes: micRes,
      count: count,
      giftId: giftId,
      price: price,
      fromName: fromName,
      toName: toName,
      giftName: giftName,
    );
  }

  RoomMsgHandler handler() => _EffectMsgHandler(this);

  void _onMessage(Message message) {
    // 按 scene 识别，不强制 type==cmd（JSON 帧偶发 type 缺省时仍可播特效）。
    if (message.data.scene == Scene.SEND_GIFT) {
      _onSendGift(message);
      return;
    }
    if (message.data.scene == Scene.USER_JOIN) {
      final joined = message.data.content.unpackInto(RoomUserJoin());
      // 顶栏在线人数 / 头像：进房推送即时刷新（与公屏侧 _syncOnline 互补，防漏）。
      if (Get.isRegistered<RoomService>()) {
        Get.find<RoomService>().applyUserJoin(joined);
      }
      final effectUrl = joined.hasEffect() ? joined.effect.url.trim() : '';
      if (roomIsPag(effectUrl)) {
        _enqueueGiftDisplay(RoomGiftDisplay(
          id: 'join-fx-${_seq++}',
          giftUrl: effectUrl,
          showAnimation: false,
          imgList: joined.effect.imgList.toList(),
          textList: joined.effect.textList.toList(),
        ));
      }
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
      if (Get.isRegistered<RoomService>()) {
        Get.find<RoomService>().applyGiftRank(change.rank);
      }
      return;
    }
    if (message.data.scene == Scene.GIFT_VALUE_CHANGE) {
      final change = message.data.content.unpackInto(RoomGiftValueChange());
      if (Get.isRegistered<RoomService>()) {
        Get.find<RoomService>().applyHotValue(change.hotValue.toInt());
      }
    }
  }

  void _onSendGift(Message message) {
    AppLog.d('GiftFly socket SEND_GIFT');
    final gift = message.data.content.unpackInto(RoomSendGift());
    if (!gift.hasItem()) {
      AppLog.w('GiftFly socket: missing item');
      return;
    }
    final item = gift.item;
    final receivers = gift.receivers.isNotEmpty
        ? gift.receivers
        : (gift.hasReceiver() ? [gift.receiver] : const <SimpleChannelUser>[]);
    final uidList = [for (final user in receivers) user.id.toInt()].where((id) => id > 0).toList();
    final pagUrl = item.dynamicResource.trim();
    final icon = item.icon.trim();
    if (icon.isEmpty && pagUrl.isEmpty) return;
    final toName = receivers.isEmpty
        ? ''
        : receivers.map((user) => user.nickname).where((name) => name.isNotEmpty).join(', ');
    // SEND_GIFT 只播飞入飞出；侧边条交给公屏 GiftMsgShow，避免双条。
    _playFly(
      id: 'send-${message.id.toInt()}-${_seq++}',
      senderUid: gift.hasSend() ? gift.send.id.toInt() : 0,
      receiverUids: uidList,
      iconUrl: icon,
      giftUrl: pagUrl,
      micRes: item.micRes.trim(),
      count: gift.itemCount,
      giftId: item.id.toInt(),
      price: item.price.toInt(),
      showPrice: gift.showPrice,
      imgList: gift.images.toList(),
      textList: gift.texts.toList(),
      fromName: gift.hasSend() ? gift.send.nickname : '',
      toName: toName,
      giftName: item.name,
    );
  }

  void _playFly({
    required String id,
    required int senderUid,
    required List<int> receiverUids,
    required String iconUrl,
    String giftUrl = '',
    String micRes = '',
    int count = 1,
    int giftId = 0,
    int price = 0,
    bool showPrice = false,
    List<String> imgList = const [],
    List<String> textList = const [],
    String fromName = '',
    String toName = '',
    String giftName = '',
  }) {
    final receivers = [
      for (final uid in receiverUids)
        if (uid > 0) uid,
    ]..sort();
    if (senderUid <= 0 && receivers.isEmpty) return;

    final now = DateTime.now().millisecondsSinceEpoch;
    _recentFly.removeWhere((item) => now - item.at > _flyDedupMs);
    if (_isDuplicateFly(
      senderUid: senderUid,
      receivers: receivers,
      giftId: giftId,
      count: count,
      iconUrl: iconUrl,
      now: now,
    )) {
      AppLog.d(
        'GiftFly dedup',
        body: {'sender': senderUid, 'receivers': receivers, 'giftId': giftId, 'count': count},
      );
      return;
    }
    _recentFly.add(_FlyDedup(
      senderUid: senderUid,
      receivers: receivers,
      giftId: giftId,
      count: count,
      iconHash: iconUrl.hashCode,
      at: now,
    ));

    _enqueueGiftDisplay(RoomGiftDisplay(
      id: id,
      giftUrl: giftUrl,
      iconUrl: iconUrl,
      senderUid: senderUid,
      receiverUids: receivers,
      count: count,
      giftId: giftId,
      micRes: micRes,
      showAnimation: true,
      showPrice: showPrice,
      price: price,
      imgList: imgList,
      textList: textList,
      fromName: fromName,
      toName: toName,
      giftName: giftName,
    ));
  }

  /// SEND_GIFT 字段偶发不一致（giftId / 收礼人顺序），用软匹配挡连播。
  bool _isDuplicateFly({
    required int senderUid,
    required List<int> receivers,
    required int giftId,
    required int count,
    required String iconUrl,
    required int now,
  }) {
    final iconHash = iconUrl.hashCode;
    for (final item in _recentFly) {
      if (now - item.at > _flyDedupMs) continue;
      if (item.senderUid != senderUid) continue;
      if (item.count != count) continue;
      if (!_sameReceivers(item.receivers, receivers)) continue;
      // giftId 都有效且不同 → 不同礼物，放行。
      if (giftId > 0 && item.giftId > 0 && giftId != item.giftId) continue;
      // 一侧 giftId 缺失时，再用 icon 辅助。
      if (giftId > 0 && item.giftId > 0) return true;
      if (iconHash != 0 && iconHash == item.iconHash) return true;
      if (giftId == 0 || item.giftId == 0) return true;
    }
    // 队列里已有相同礼物也不再入队。
    bool sameQueued(RoomGiftDisplay config) {
      if (config.senderUid != senderUid || config.count != count) return false;
      final queued = [...config.receiverUids]..sort();
      if (!_sameReceivers(queued, receivers)) return false;
      if (giftId > 0 && config.giftId > 0) return giftId == config.giftId;
      return config.iconUrl.hashCode == iconHash;
    }

    if (playingGifts.any(sameQueued)) return true;
    if (_giftBuffer.any(sameQueued)) return true;
    return false;
  }

  bool _sameReceivers(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  void _enqueueJoin(RoomJoinFx fx) {
    _joins.add(fx);
    _advanceJoin();
  }

  void _enqueueGiftDisplay(RoomGiftDisplay config) {
    if (playingGifts.length < _maxPlaying) {
      playingGifts.add(config);
      playingGifts.refresh();
      flyEpoch.value++;
    } else {
      _giftBuffer.add(config);
    }
  }

  void _advanceGiftDisplay() {
    var changed = false;
    while (playingGifts.length < _maxPlaying && _giftBuffer.isNotEmpty) {
      playingGifts.add(_giftBuffer.removeAt(0));
      changed = true;
    }
    if (changed) {
      playingGifts.refresh();
      flyEpoch.value++;
    }
  }

  void _advanceBanner() {
    if (banner.value != null || _gifts.isEmpty) return;
    banner.value = _gifts.first;
  }

  void _advanceJoin() {
    if (join.value != null || _joins.isEmpty) return;
    join.value = _joins.first;
  }
}

class _FlyDedup {
  const _FlyDedup({
    required this.senderUid,
    required this.receivers,
    required this.giftId,
    required this.count,
    required this.iconHash,
    required this.at,
  });

  final int senderUid;
  final List<int> receivers;
  final int giftId;
  final int count;
  final int iconHash;
  final int at;
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
    final scene = message.data.scene;
    return scene == Scene.USER_JOIN ||
        scene == Scene.REAL_TIME_RANK_CHANGE ||
        scene == Scene.GIFT_VALUE_CHANGE ||
        scene == Scene.SEND_GIFT;
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

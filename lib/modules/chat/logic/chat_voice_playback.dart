import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

import '../../../common/utils/app_audio_playback.dart';
import '../../../app/service/im_service.dart';
import '../../../common/utils/app_log.dart';

/// 语音播放要碰的平台侧：环信附件（下载/取本地路径）+ audioplayers。
///
/// 抽成接口**只为了能测**：MethodChannel 在 widget test 里一律抛
/// `MissingPluginException`，而 `stop()` 是 `unawaited` 出去的 —— 未捕获的异步异常
/// 会直接把用例判红。用例换掉 [ChatVoicePlayback.audioFactory] 就能把这层挡住。
abstract class ChatVoiceAudio {
  /// 拿到能直接喂给播放器的地址（本地缓存 / 已下载文件 / 可直播 URL）。
  Future<String?> resolve({required String mediaSource, required String msgId});

  Future<void> play(String playable);

  Future<void> stop();

  /// 一条放完了。
  Stream<void> get onComplete;
}

/// 真机实现：环信 + audioplayers。
///
/// 但两边从来不会同时响（[AppVoiceExclusive] 保证），所以共用一个不改变行为，
/// 还省掉一路「另一个播放器还在后台放」的隐患。
class ImVoiceAudio implements ChatVoiceAudio {
  static final AudioPlayer _player = AudioPlayer();

  @override
  Future<String?> resolve({required String mediaSource, required String msgId}) =>
      ImService.resolvePlayableMedia(mediaSource: mediaSource, msgId: msgId);

  @override
  Future<void> play(String playable) => AppAudioPlayback.play(_player, playable);

  @override
  Future<void> stop() => _player.stop();

  @override
  Stream<void> get onComplete => _player.onPlayerComplete;
}

/// 一条语音气泡的播放状态机：播 / 停 / 剩几秒 / 全局互斥。
///
/// **为什么不是塞进 `ChatBaseLogic`**：
/// 页面级 Controller 一个页面只有一份，而「哪条在播、还剩几秒」是每条气泡各自
/// 一份的状态。今天气泡滚出屏幕会被 `ListView` 回收 → `State.dispose` → 停播；
/// 的硬要求是「行为完全一致」，所以这里是**每条气泡一个**的 [ChangeNotifier]。
///
/// 直连 `ImService.` —— 播放要下载附件，这段逻辑天然不属于 widget。这个类不碰
/// `BuildContext` 也不碰 material，照样能单测。
class ChatVoicePlayback extends ChangeNotifier {
  ChatVoicePlayback({required this.seconds, this.mediaSource = '', this.msgId = ''})
    : _audio = audioFactory();

  /// 平台侧的注入点。用例在 `setUp` 里换成替身、`tearDown` 里复位
  /// （和 `AppImage.cdnBase` 一个套路）。
  @visibleForTesting
  static ChatVoiceAudio Function() audioFactory = ImVoiceAudio.new;

  /// 这三个字段跟着 widget 走：`ListView` 复用 State 时（本地消息还没 msgId，
  /// `KeyedSubtree` 就没 key）widget 可能换成另一条消息，由 [retarget] 同步。
  int seconds;
  String mediaSource;
  String msgId;

  final ChatVoiceAudio _audio;

  /// [AppVoiceExclusive] 用 `identical` 认人，所以 tear-off 只取一次存下来。
  late final void Function() _exclusiveStop = stop;

  Timer? _playTimer;
  StreamSubscription<void>? _completeSub;
  bool _disposed = false;

  bool _playing = false;
  int _remaining = 0;

  bool get playing => _playing;

  /// 播放中显示倒计时，否则显示总时长。
  int get remaining => _remaining;

  String get source => mediaSource.trim();

  /// 既没有音频也没有时长 —— 环信附件过期，气泡显示 `Voice expired`。
  bool get expired => source.isEmpty && seconds <= 0;

  /// widget 侧 `didUpdateWidget` 调。不 `notifyListeners`：调用方本来就在重建。
  void retarget({required int seconds, required String mediaSource, required String msgId}) {
    this.seconds = seconds;
    this.mediaSource = mediaSource;
    this.msgId = msgId;
  }

  Future<void> toggle() async {
    if (seconds <= 0 && source.isEmpty) return;
    if (_playing) {
      stop();
      return;
    }
    AppVoiceExclusive.claim(_exclusiveStop);
    _playing = true;
    _remaining = seconds > 0 ? seconds : 1;
    notifyListeners();

    final src = source;
    try {
      final playable = await _audio.resolve(mediaSource: src, msgId: msgId);
      // 期间被 dispose 或被别人抢走了播放权 —— 什么都别做。
      if (_disposed || !_playing) return;
      if (playable == null || playable.isEmpty) {
        AppLog.w('Voice play failed: no local file');
        stop();
        return;
      }
      await _audio.play(playable);
      await _completeSub?.cancel();
      _completeSub = _audio.onComplete.listen((_) {
        if (!_disposed) stop();
      });
    } catch (error) {
      AppLog.w('Voice play failed', error: error);
      if (!_disposed) stop();
      return;
    }

    // 即使音频失败也做 UI 倒计时（保持波形条动画）。
    _playTimer?.cancel();
    if (seconds > 0) {
      _playTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_disposed) {
          timer.cancel();
          return;
        }
        if (_remaining <= 1) {
          timer.cancel();
          _playTimer = null;
          stop();
          return;
        }
        _remaining -= 1;
        notifyListeners();
      });
    }
  }

  void stop() {
    _playTimer?.cancel();
    _playTimer = null;
    unawaited(_completeSub?.cancel() ?? Future<void>.value());
    _completeSub = null;
    unawaited(_audio.stop());
    AppVoiceExclusive.release(_exclusiveStop);
    _playing = false;
    _remaining = 0;
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    // 顺序照旧：先摘互斥登记，再停播放器，最后拆订阅与定时器。
    AppVoiceExclusive.release(_exclusiveStop);
    if (_playing) unawaited(_audio.stop());
    unawaited(_completeSub?.cancel() ?? Future<void>.value());
    _completeSub = null;
    _playTimer?.cancel();
    _playTimer = null;
    _playing = false;
    _remaining = 0;
    _disposed = true;
    super.dispose();
  }
}

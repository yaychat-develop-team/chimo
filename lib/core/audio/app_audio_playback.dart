import 'package:audioplayers/audioplayers.dart';

/// 全局同一时间只播一条语音：点下一条时先停上一条（私聊 / 群聊 / 资料 / 录音预览）。
abstract final class AppVoiceExclusive {
  static void Function()? _activeStop;

  /// 登记当前播放方；若已有其它播放中，立即回调其 stop。
  static void claim(void Function() stop) {
    final prev = _activeStop;
    if (identical(prev, stop)) return;
    _activeStop = stop;
    prev?.call();
  }

  /// 仅当 [stop] 仍是当前持有者时释放（避免误清后来者）。
  static void release(void Function() stop) {
    if (identical(_activeStop, stop)) {
      _activeStop = null;
    }
  }

  /// 强制停止当前语音（不登记新播放方）。
  static void stopActive() {
    final prev = _activeStop;
    _activeStop = null;
    prev?.call();
  }
}

/// 统一资料 / 聊天语音播放：外放、mediaPlayer、补齐 MIME（CDN 常为 octet-stream）。
abstract final class AppAudioPlayback {
  static bool _globalContextReady = false;

  /// 播放前准备：扬声器 + media 焦点；远程 m4a 显式声明 MIME。
  static Future<void> prepare(AudioPlayer player) async {
    if (!_globalContextReady) {
      await AudioPlayer.global.setAudioContext(_mediaContext);
      _globalContextReady = true;
    }
    await player.setAudioContext(_mediaContext);
    await player.setPlayerMode(PlayerMode.mediaPlayer);
    await player.setReleaseMode(ReleaseMode.stop);
    await player.setVolume(1);
  }

  static Source sourceFrom(String raw) {
    var s = raw.trim();
    if (s.startsWith('//')) s = 'https:$s';
    if (s.startsWith('http://') || s.startsWith('https://')) {
      return UrlSource(s, mimeType: _guessMime(s));
    }
    if (s.startsWith('file://')) {
      s = Uri.parse(s).toFilePath();
    }
    return DeviceFileSource(s, mimeType: _guessMime(s));
  }

  static Future<void> play(AudioPlayer player, String raw) async {
    await prepare(player);
    await player.stop();
    await player.play(sourceFrom(raw));
  }

  static final AudioContext _mediaContext = AudioContext(
    android: const AudioContextAndroid(
      isSpeakerphoneOn: true,
      stayAwake: false,
      contentType: AndroidContentType.music,
      usageType: AndroidUsageType.media,
      audioFocus: AndroidAudioFocus.gain,
    ),
    iOS: AudioContextIOS(
      category: AVAudioSessionCategory.playback,
    ),
  );

  /// 资料语音固定 AAC/m4a；无扩展名时也按 m4a（上传 Content-Type 为 octet-stream）。
  static String _guessMime(String pathOrUrl) {
    final lower = pathOrUrl.toLowerCase();
    final path = lower.split('?').first;
    if (path.endsWith('.mp3')) return 'audio/mpeg';
    if (path.endsWith('.wav')) return 'audio/wav';
    if (path.endsWith('.ogg') || path.endsWith('.opus')) return 'audio/ogg';
    if (path.endsWith('.aac')) return 'audio/aac';
    // .m4a / .mp4 / 无后缀 CDN → AAC in MP4
    return 'audio/mp4';
  }
}

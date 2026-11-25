/// 语音录制确认后回传的结果。单独放，避免调用方为了这个类型去 import 弹层。
class VoiceNoteResult {
  const VoiceNoteResult({required this.path, required this.seconds});

  final String path;
  final int seconds;
}

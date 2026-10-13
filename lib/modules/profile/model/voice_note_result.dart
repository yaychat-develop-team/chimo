/// 语音签名录制页确认后回传的结果。
///
/// 放在 `shared/models`（而不是 `voice_note_page.dart`）的理由同 [FriendsTab]：
/// 它是**路由回传类型**，留在页面文件里会逼着调用方为了一个类型 import 页面。
class VoiceNoteResult {
  const VoiceNoteResult({required this.path, required this.seconds});

  final String path;
  final int seconds;
}

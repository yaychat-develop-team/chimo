import '../../../common/models/server_client/rtc.pb.dart';

/// 房间音视频。本期只有腾讯语聊实现。
abstract class RoomRtc {
  /// 正在说话的用户 id。音量低于阈值的不出现。
  void Function(Set<int> uids)? onSpeaking;

  Future<void> init();

  Future<void> enter(TencentConfig config, {required String userId});

  Future<void> openMic();

  Future<void> closeMic();

  Future<void> leave();
}

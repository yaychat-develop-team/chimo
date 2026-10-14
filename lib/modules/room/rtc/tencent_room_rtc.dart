import 'package:tencent_rtc_sdk/trtc_cloud.dart';
import 'package:tencent_rtc_sdk/trtc_cloud_def.dart';
import 'package:tencent_rtc_sdk/trtc_cloud_listener.dart';

import '../../../common/models/server_client/rtc.pb.dart';
import '../../../common/utils/app_log.dart';
import 'room_rtc.dart';

/// 腾讯 TRTC 语聊。UserSig 只用服务端下发的 [TencentConfig.token]。
class TencentRoomRtc implements RoomRtc {
  TRTCCloud? _engine;
  TRTCCloudListener? _listener;
  var _entered = false;

  @override
  void Function(Set<int> uids)? onSpeaking;

  @override
  Future<void> init() async {
    _engine ??= await TRTCCloud.sharedInstance();
  }

  @override
  Future<void> enter(TencentConfig config, {required String userId}) async {
    await init();
    final appId = config.appId.toInt();
    final roomId = config.rid.toInt();
    if (appId <= 0 || roomId <= 0 || config.token.isEmpty || userId.isEmpty) {
      AppLog.w('TencentRoomRtc skip enter appId=$appId roomId=$roomId');
      return;
    }
    _listener = TRTCCloudListener(
      onEnterRoom: (code) => AppLog.i('TencentRoomRtc enter $code'),
      onUserVoiceVolume: (volumes, _) {
        final speaking = <int>{};
        for (final item in volumes) {
          final uid = int.tryParse(item.userId) ?? -1;
          if (uid >= 0 && item.volume >= 4) speaking.add(uid);
        }
        onSpeaking?.call(speaking);
      },
    );
    _engine!.registerListener(_listener!);
    _engine!.enterRoom(
      TRTCParams(
        sdkAppId: appId,
        userId: userId,
        userSig: config.token,
        roomId: roomId,
      ),
      TRTCAppScene.voiceChatRoom,
    );
    _engine!.enableAudioVolumeEvaluation(
      true,
      TRTCAudioVolumeEvaluateParams(interval: 500),
    );
    _entered = true;
  }

  @override
  Future<void> openMic() async {
    if (!_entered) return;
    _engine?.startLocalAudio(TRTCAudioQuality.music);
  }

  @override
  Future<void> closeMic() async {
    _engine?.stopLocalAudio();
  }

  @override
  Future<void> leave() async {
    if (_listener != null) {
      _engine?.unRegisterListener(_listener!);
      _listener = null;
    }
    if (_entered) {
      _engine?.exitRoom();
      _entered = false;
    }
  }
}

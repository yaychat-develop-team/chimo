import '../http/api_result.dart';
import '../http/http.dart';

/// 举报（用户 / 群聊）。
class ReportApi {
  const ReportApi();

  /// [type]：`USER` 或 `CHANNEL`（群聊，对齐 forya ReportType）。
  Future<ApiResult<void>> submit({
    required String reportedId,
    required String type,
    required String reason,
    required String description,
    List<String> evidenceImages = const [],
    List<String> evidenceVideos = const [],
  }) {
    return Http.ins.postAndParse(
      '/report',
      data: {
        'reportedId': reportedId,
        'type': type,
        'reason': reason,
        'description': description,
        'evidenceImages': evidenceImages,
        'evidenceVideos': evidenceVideos,
      },
    );
  }
}

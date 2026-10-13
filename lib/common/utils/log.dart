import 'package:talker_flutter/talker_flutter.dart';

Talker? _logger;

/// 线上 Talker。未 [initTalker] 时为 null。
Talker? get loggerOrNull => _logger;

Talker get logger => _logger!;

bool get talkerReady => _logger != null;

void initTalker() {
  _logger = TalkerFlutter.init(
    settings: TalkerSettings(
      enabled: true,
      useHistory: true,
      useConsoleLogs: true,
      maxHistoryItems: 1000,
    ),
    logger: TalkerLogger(),
  );
}

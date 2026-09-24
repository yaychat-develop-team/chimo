import 'package:talker_flutter/talker_flutter.dart';

late Talker logger;

void initTalker() {
  logger = TalkerFlutter.init(
    settings: TalkerSettings(
      /// You can enable/disable all talker processes with this field
      enabled: true,

      /// You can enable/disable saving logs data in history
      useHistory: true,

      /// You can enable/disable console logs
      useConsoleLogs: true,

      /// Length of history that saving logs data
      maxHistoryItems: 1000,
    ),

    /// Setup your implementation of logger
    logger: TalkerLogger(),
  );
}

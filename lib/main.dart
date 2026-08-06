import 'package:flutter/material.dart';

import 'app/chimo_app.dart';
import 'core/network/network_bootstrap.dart';

/// App entry: initialize Flutter bindings, then run [ChimoApp].
Future<void> main() async {
  // Ensure plugins and platform channels are ready before runApp.
  WidgetsFlutterBinding.ensureInitialized();
  try {
    final ping = await NetworkBootstrap.initialize();
    debugPrint(
      'API ping success=${ping.success} code=${ping.code} message=${ping.message}',
    );
  } catch (error, stack) {
    debugPrint('API bootstrap failed: $error\n$stack');
  }
  runApp(const ChimoApp());
}

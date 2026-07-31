import 'package:flutter/material.dart';

import 'app/chimo_app.dart';

/// App entry: initialize Flutter bindings, then run [ChimoApp].
void main() {
  // Ensure plugins and platform channels are ready before runApp.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ChimoApp());
}

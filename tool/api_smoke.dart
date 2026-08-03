import 'dart:io';

import 'package:chimo/core/network/api_config.dart';
import 'package:chimo/core/network/api_probe_suite.dart';

/// Probe core D:\forya endpoints against test-api.echimo.com.
///
/// Run: `dart run tool/api_smoke.dart`
Future<void> main() async {
  ApiConfig.useEnvironment(ApiEnvironment.test);
  stdout.writeln('Base: ${ApiConfig.baseUrl}');
  stdout.writeln('Probing core endpoints from D:\\forya lib_network…');

  final results = await ApiProbeSuite.runDefault(loadPrefs: false);
  var failed = 0;
  for (final r in results) {
    stdout.writeln(r.summary);
    if (!r.ok) failed++;
  }

  stdout.writeln('—');
  stdout.writeln('${results.length - failed}/${results.length} reachable');
  if (failed > 0) {
    stderr.writeln('Some probes failed (often auth-gated).');
    exit(failed == results.length ? 1 : 0);
  }
  stdout.writeln('Smoke passed.');
}

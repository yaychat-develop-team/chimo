import 'package:flutter_test/flutter_test.dart';

import 'package:chimo/app/chimo_app.dart';

void main() {
  /// Smoke test: after splash, home should render main section titles.
  testWidgets('Home tab renders brand and sections', (tester) async {
    await tester.pumpWidget(const ChimoApp());
    // Skip past the splash display duration.
    await tester.pump(const Duration(milliseconds: 1800));
    await tester.pumpAndSettle();

    expect(find.text('My Groups'), findsOneWidget);
    expect(find.text('Popular Groups'), findsOneWidget);
    expect(find.text('Home'), findsWidgets);
  });
}

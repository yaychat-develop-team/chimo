import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chimo/app/chimo_app.dart';

void main() {
  testWidgets('App mounts MaterialApp.router', (tester) async {
    await tester.pumpWidget(const ChimoApp());
    await tester.pump();
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';

import 'package:joyride_flutter/app/oumi_app.dart';

void main() {
  /// 冒烟测试：启动页结束后首页应渲染主要区块标题。
  testWidgets('Home tab renders brand and sections', (tester) async {
    await tester.pumpWidget(const OumiApp());
    // 越过 Splash 展示时长。
    await tester.pump(const Duration(milliseconds: 1800));
    await tester.pumpAndSettle();

    expect(find.text('My Groups'), findsOneWidget);
    expect(find.text('Popular Groups'), findsOneWidget);
    expect(find.text('Home'), findsWidgets);
  });
}

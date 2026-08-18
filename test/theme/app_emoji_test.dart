import 'package:flutter/painting.dart' show TextSpan;
import 'package:flutter_test/flutter_test.dart';

import 'package:chimo/core/theme/app_emoji.dart';

void main() {
  test('normalize restores escaped PUA glyphs', () {
    expect(AppEmoji.normalize(r'\ue601\ue602'), '\ue601\ue602');
    expect(AppEmoji.isCustomEmojiOnly(r'\ue601\ue602'), isTrue);
  });

  test('toSpan forces Emoji fontFamily on PUA', () {
    final TextSpan span = AppEmoji.toSpan('\ue601');
    expect(span.style?.fontFamily, AppEmoji.fontFamily);
  });
}

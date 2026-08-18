import 'package:chimo/core/utils/personal_effect_card_cache.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  tearDown(() => PersonalEffectCardCache.clear('1002031'));

  test('requestShow marks cooldown immediately', () {
    expect(PersonalEffectCardCache.requestShow('1002031'), isTrue);
    expect(PersonalEffectCardCache.requestShow('1002031'), isFalse);
  });

  test('clear resets cooldown for uid', () {
    expect(PersonalEffectCardCache.requestShow('1002031'), isTrue);
    PersonalEffectCardCache.clear('1002031');
    expect(PersonalEffectCardCache.requestShow('1002031'), isTrue);
  });
}

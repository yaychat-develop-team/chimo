import 'package:flutter_test/flutter_test.dart';

import 'package:chimo/core/utils/zodiac.dart';

void main() {
  test('does not treat 7-digit user ids as unix birthdays', () {
    expect(parseBirthday('1011231'), isNull);
    expect(zodiacFromBirthday('1011231'), isEmpty);
  });

  test('yyyy-MM-dd birthday maps to Scorpio', () {
    expect(zodiacFromBirthday('2004-10-23'), 'Scorpio');
  });

  test('empty birthday has no constellation chip', () {
    expect(zodiacFromBirthday(''), isEmpty);
    expect(zodiacChipLabel(''), isEmpty);
    expect(zodiacChipLabel('Capricorn'), isNotEmpty);
  });
}

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:chimo/core/network/app_http_client.dart';

void main() {
  test('quarantines last IP and picks the other one', () {
    final pool = AddressPool(quarantineFor: const Duration(minutes: 10));
    final a = InternetAddress('104.21.34.118');
    final b = InternetAddress('172.67.204.196');
    final now = DateTime(2026, 8, 17, 13);

    final first = pool.pick('test-api.echimo.com', [a, b], now);
    expect(first.address, a.address);
    pool.quarantineLast(now);

    final second = pool.pick('test-api.echimo.com', [a, b], now);
    expect(second.address, b.address);
  });
}

import 'package:flutter/material.dart';

/// CP 麦位编号色。对齐 joyride `CPUtil`。
abstract final class CpUtil {
  static Color colorOf(int index) =>
      index <= 3 ? const Color(0xFF5BBBF9) : const Color(0xFFEB588E);
}

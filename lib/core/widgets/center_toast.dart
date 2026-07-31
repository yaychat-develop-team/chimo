import 'dart:async';

import 'package:flutter/material.dart';

/// Centered short toast (e.g. copy success).
void showCenterToast(
  BuildContext context, {
  required String message,
  Duration duration = const Duration(seconds: 2),
}) {
  final overlay = Overlay.maybeOf(context);
  if (overlay == null) return;

  late OverlayEntry entry;
  entry = OverlayEntry(
    builder: (_) => IgnorePointer(
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 48),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xE62A2A2A),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(entry);
  Timer(duration, () {
    entry.remove();
  });
}

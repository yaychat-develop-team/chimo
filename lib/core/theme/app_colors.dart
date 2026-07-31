import 'package:flutter/material.dart';

/// Design palette sampled from the home mock; shared app-wide.
abstract final class AppColors {
  // ---------- Background / surface ----------
  /// Page background (pure black).
  static const Color background = Color(0xFF000000);

  /// Secondary surface.
  static const Color surface = Color(0xFF0F0F0F);

  /// Card fill.
  static const Color card = Color(0xFF151815);

  /// Card border / edge.
  static const Color cardEdge = Color(0xFF1C2420);

  // ---------- Brand accent ----------
  /// Primary: selected tab, accents.
  static const Color primary = Color(0xFF24B572);

  /// Brighter primary: join buttons, etc.
  static const Color primaryBright = Color(0xFF1BBA77);

  // ---------- Text ----------
  /// Primary text (white).
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// Secondary text (grey).
  static const Color textSecondary = Color(0xFF9A9A9A);

  /// Tertiary text / stats.
  static const Color textTertiary = Color(0xFF6E6E6E);

  // ---------- Functional ----------
  /// Unread badge red.
  static const Color badge = Color(0xFFE44E50);

  /// Search button fill.
  static const Color searchButton = Color(0xFF1A1A1A);

  /// Category tag fill.
  static const Color tagBackground = Color(0xFF2A2A2A);

  /// Joined button fill.
  static const Color joinedButton = Color(0xFF2C2C2C);

  /// Level badge gradient start / end.
  static const Color levelBadgeStart = Color(0xFF9B6BFF);
  static const Color levelBadgeEnd = Color(0xFF6B4EFF);

  /// My Groups card background gradient (green to black).
  static const LinearGradient myGroupCardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1A2A22), Color(0xFF0A0C0B)],
  );

  /// Popular Groups card background gradient.
  static const LinearGradient popularCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A221C), Color(0xFF101210)],
  );
}

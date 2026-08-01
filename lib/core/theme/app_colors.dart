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

  /// Chats / brand gradient start (Figma #00FEA8).
  static const Color accentMint = Color(0xFF00FEA8);

  /// Chats / brand gradient end (Figma #00F875).
  static const Color accentLime = Color(0xFF00F875);

  /// Official name / selected tab label gradient (left → right in UI).
  static const LinearGradient brandTextGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [accentLime, accentMint],
  );

  /// Promo banner fill (Figma: left lime → right mint).
  static const LinearGradient promoBannerGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [accentLime, accentMint],
  );

  // ---------- Text ----------
  /// Primary text (white).
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// Secondary text (grey).
  static const Color textSecondary = Color(0xFF9A9A9A);

  /// Tertiary text / stats.
  static const Color textTertiary = Color(0xFF6E6E6E);

  /// Conversation preview (Figma white 70%).
  static const Color textPreview = Color(0xB3FFFFFF);

  /// Conversation timestamp (Figma white 36%).
  static const Color textTime = Color(0x5CFFFFFF);

  /// Promo banner body text.
  static const Color promoText = Color(0xFF232518);

  // ---------- Functional ----------
  /// Unread badge red (Figma #FD4B4B).
  static const Color badge = Color(0xFFFD4B4B);

  /// Search button fill.
  static const Color searchButton = Color(0xFF1A1A1A);

  /// Chats header icon / conversation row fill (white 8%).
  static const Color chatsRowFill = Color(0x14FFFFFF);

  /// Online status dot (matches brand lime).
  static const Color onlineDot = accentLime;

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

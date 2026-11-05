import 'package:flutter/material.dart';

/// Brand palette. Existing names are unchanged so current code keeps working;
/// new semantic colors are added at the bottom.
class AppColors {
  // Brand Primaries
  static const Color primaryTeal = Color(0xFF00ADFF);
  static const Color accentCyan = Color(0xFF00C3D9);
  static const Color darkTeal = Color(0xFF006670);
  static const Color emeraldTeal = Color(0xFF36C5BC);

  // Backgrounds
  static const Color heroBgLight = Color(0xFFE8F7FF);
  static const Color bgWhite = Color(0xFFFFFFFF);
  static const Color bgOffWhite = Color(0xFFF8FAFC);
  static const Color bgLightGrey = Color(0xFFF1F5F9);
  static const Color bgDarkSlate = Color(0xFF1B232A);
  static const Color bgDarkMedium = Color(0xFF232B32);
  static const Color bgOliveDark = Color(0xFF1E2818);
  static const Color bgCardLight = Color(0xFFFFFFFF);
  static const Color bgCardDark = Color(0xFF2A343D);

  // Text Colors
  static const Color textDark = Color(0xFF0F172A);
  static const Color textMedium = Color(0xFF334155);
  static const Color textMuted = Color(0xFF64748B);
  static const Color textLight = Color(0xFFF8FAFC);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Accents & Borders
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color borderDark = Color(0xFF334155);
  static const Color starGold = Color(0xFFFFB800);

  // ── New: tinted primary surfaces (use instead of ad-hoc withOpacity) ──
  static const Color primarySoft = Color(0xFFE6F6FF); // light tint for chips/icon tiles
  static const Color primaryDeep = Color(0xFF0086C9); // AA-contrast text/links on white

  // ── New: semantic status colors ──
  static const Color success = Color(0xFF15803D);
  static const Color successSoft = Color(0xFFECFDF3);
  static const Color successOnDark = Color(0xFF4ADE80);

  // ── New: dark-surface helpers ──
  static const Color surfaceDark = Color(0xFF111A22);   // page-level dark section
  static const Color surfaceDarkRaised = Color(0xFF18232D); // cards on dark
  static const Color hairlineOnDark = Color(0x1FFFFFFF);    // 12% white
  static const Color textOnDarkMuted = Color(0xFFA8B3C2);

  // ── New: category accents (one place instead of scattered hex values) ──
  static const Color accentViolet = Color(0xFF6D4FD8);
  static const Color accentAmber = Color(0xFFB45309); // AA on white with white text
  static const Color accentOrange = Color(0xFFC2410C);
  static const Color accentTealDeep = Color(0xFF0F766E);
  static const Color accentBlueDeep = Color(0xFF0369A1);
}
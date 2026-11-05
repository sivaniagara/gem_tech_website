import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Type system: Poppins for headings/UI, Inter for reading text.
/// Large headings get slight negative tracking; small labels stay at 0 and are
/// written in sentence case (no tracked ALL CAPS).
class AppTextStyles {
  static TextStyle navLink({bool isSelected = false}) {
    return GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
      color: isSelected ? AppColors.primaryTeal : AppColors.textDark,
    );
  }

  static TextStyle heroHeading({required bool isDesktop}) {
    return GoogleFonts.poppins(
      fontSize: isDesktop ? 48 : 30,
      fontWeight: FontWeight.w700,
      height: 1.18,
      letterSpacing: isDesktop ? -1.0 : -0.5,
      color: AppColors.textDark,
    );
  }

  static TextStyle heroSubheading({required bool isDesktop}) {
    return GoogleFonts.inter(
      fontSize: isDesktop ? 18 : 16,
      fontWeight: FontWeight.w400,
      height: 1.65,
      color: AppColors.textMedium,
    );
  }

  static TextStyle sectionTitle({required bool isDesktop, Color color = AppColors.textDark}) {
    return GoogleFonts.poppins(
      fontSize: isDesktop ? 36 : 26,
      fontWeight: FontWeight.w600,
      height: 1.25,
      letterSpacing: isDesktop ? -0.7 : -0.4,
      color: color,
    );
  }

  static TextStyle sectionSubtitle({required bool isDesktop, Color color = AppColors.textMuted}) {
    return GoogleFonts.inter(
      fontSize: isDesktop ? 17 : 15,
      fontWeight: FontWeight.w400,
      height: 1.6,
      color: color,
    );
  }

  static TextStyle cardTitle({Color color = AppColors.textDark}) {
    return GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.35,
      letterSpacing: -0.2,
      color: color,
    );
  }

  static TextStyle cardDescription({Color color = AppColors.textMuted}) {
    return GoogleFonts.inter(
      fontSize: 14,
      height: 1.6,
      color: color,
    );
  }

  static TextStyle buttonText({Color color = Colors.white}) {
    return GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle badgeText({Color color = AppColors.primaryTeal}) {
    return GoogleFonts.inter(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  // ── New ──

  /// Small label above a section title. Sentence case, no tracking.
  static TextStyle eyebrow({Color color = AppColors.primaryDeep}) {
    return GoogleFonts.inter(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      height: 1.2,
      color: color,
    );
  }

  /// Field / table-column label.
  static TextStyle label({Color color = AppColors.textMuted}) {
    return GoogleFonts.inter(
      fontSize: 12.5,
      fontWeight: FontWeight.w600,
      height: 1.3,
      color: color,
    );
  }

  /// Large figure in a stat tile.
  static TextStyle statValue({Color color = AppColors.textDark}) {
    return GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      height: 1.1,
      letterSpacing: -0.5,
      color: color,
    );
  }
}
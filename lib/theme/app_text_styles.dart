import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

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
      fontSize: isDesktop ? 44 : 28,
      fontWeight: FontWeight.w700,
      height: 1.25,
      color: AppColors.textDark,
    );
  }

  static TextStyle heroSubheading({required bool isDesktop}) {
    return GoogleFonts.inter(
      fontSize: isDesktop ? 18 : 15,
      fontWeight: FontWeight.w400,
      height: 1.6,
      color: AppColors.textMedium,
    );
  }

  static TextStyle sectionTitle({required bool isDesktop, Color color = AppColors.textDark}) {
    return GoogleFonts.poppins(
      fontSize: isDesktop ? 34 : 24,
      fontWeight: FontWeight.w700,
      height: 1.3,
      color: color,
    );
  }

  static TextStyle sectionSubtitle({required bool isDesktop, Color color = AppColors.textMuted}) {
    return GoogleFonts.inter(
      fontSize: isDesktop ? 17 : 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle cardTitle({Color color = AppColors.textDark}) {
    return GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle cardDescription({Color color = AppColors.textMuted}) {
    return GoogleFonts.inter(
      fontSize: 14,
      height: 1.5,
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
}

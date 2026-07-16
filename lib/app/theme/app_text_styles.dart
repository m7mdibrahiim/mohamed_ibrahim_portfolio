import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../localization/app_localizations.dart';
import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextTheme themeTextTheme(Locale locale) {
    final base = locale.languageCode == 'ar'
        ? GoogleFonts.cairoTextTheme()
        : GoogleFonts.interTextTheme();
    return base.apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    );
  }

  static TextStyle font(
    BuildContext context, {
    required double size,
    FontWeight weight = FontWeight.w500,
    Color color = AppColors.textPrimary,
    double? height,
    double? letterSpacing,
  }) {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final style = TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: isAr ? null : letterSpacing,
    );
    return isAr ? GoogleFonts.cairo(textStyle: style) : GoogleFonts.inter(textStyle: style);
  }

  static TextStyle hero(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isAr = AppLocalizations.of(context).isAr;
    final size = _clamp(width * (isAr ? 0.083 : 0.079), isAr ? 30 : 31, isAr ? 58 : 64);
    return font(
      context,
      size: size,
      weight: FontWeight.w900,
      height: isAr ? 1.12 : 1.02,
      letterSpacing: -2.2,
    );
  }

  static TextStyle sectionTitle(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isAr = AppLocalizations.of(context).isAr;
    final size = _clamp(width * 0.040, isAr ? 26 : 28, isAr ? 43 : 46);
    return font(
      context,
      size: size,
      weight: FontWeight.w900,
      height: isAr ? 1.18 : 1.08,
      letterSpacing: -1.1,
    );
  }

  static TextStyle body(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return font(
      context,
      size: _clamp(width * 0.016, 15, 17),
      weight: FontWeight.w500,
      color: AppColors.textSecondary,
      height: 1.75,
    );
  }

  static TextStyle small(BuildContext context) => font(
        context,
        size: 13,
        weight: FontWeight.w700,
        color: AppColors.textSecondary,
      );

  static TextStyle button(BuildContext context) => font(
        context,
        size: 14,
        weight: FontWeight.w900,
        color: AppColors.textPrimary,
        height: 1.1,
      );

  static TextStyle eyebrow(BuildContext context) => font(
        context,
        size: 12.5,
        weight: FontWeight.w900,
        color: AppColors.cyan,
        height: 1.1,
        letterSpacing: .6,
      );

  static double _clamp(double value, double min, double max) => math.max(min, math.min(max, value));
}

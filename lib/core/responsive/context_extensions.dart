import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../app/localization/app_localizations.dart';
import 'breakpoints.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
  bool get isAr => l10n.isAr;

  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  bool get isSmallMobile => screenWidth < 380;
  bool get isTinyPhone => screenWidth < 340;
  bool get isCompactPhone => isSmallMobile;
  bool get isMobile => screenWidth < AppBreakpoints.mobile;
  bool get isTablet => screenWidth >= AppBreakpoints.mobile && screenWidth < AppBreakpoints.tablet;
  bool get isDesktop => screenWidth >= AppBreakpoints.tablet;
  bool get isLargeDesktop => screenWidth >= AppBreakpoints.desktop;

  double get horizontalPadding {
    final width = screenWidth;
    if (width < 360) return 16;
    if (width < AppBreakpoints.mobile) return 20;
    if (width < AppBreakpoints.tablet) return 32;
    if (width < AppBreakpoints.desktop) return 44;
    return 56;
  }

  double clampWidth(double value, {required double min, required double max}) {
    return math.max(min, math.min(max, value));
  }

  double fluid(double min, double max) {
    final width = screenWidth;
    final normalized = ((width - 320) / (1440 - 320)).clamp(0.0, 1.0).toDouble();
    return min + ((max - min) * normalized);
  }

  T responsive<T>({required T mobile, T? tablet, T? desktop, T? largeDesktop}) {
    if (isLargeDesktop && largeDesktop != null) return largeDesktop;
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }
}

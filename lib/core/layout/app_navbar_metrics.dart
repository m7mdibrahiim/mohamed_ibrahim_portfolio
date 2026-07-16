import 'package:flutter/material.dart';

class AppNavbarMetrics {
  const AppNavbarMetrics._();

  static const double topMargin = 14;
  static const double bottomGap = 14;
  static const double mobileBarHeight = 64;
  static const double desktopBarHeight = 68;
  static const double desktopViewportBreakpoint = 1280;

  static double barHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).width < desktopViewportBreakpoint
        ? mobileBarHeight
        : desktopBarHeight;
  }

  static double overlayExtent(BuildContext context) {
    return MediaQuery.paddingOf(context).top +
        topMargin +
        barHeight(context) +
        bottomGap;
  }

  static double sectionScrollOffset(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final breathingRoom = width < 380 ? 10.0 : width < 600 ? 12.0 : 16.0;
    return overlayExtent(context) + breathingRoom;
  }

  static double firstSectionTopPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 380) return 22;
    if (width < 600) return 28;
    if (width < 1024) return 34;
    return 44;
  }
}

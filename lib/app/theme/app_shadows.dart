import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadows {
  const AppShadows._();

  static List<BoxShadow> ambient({Color color = AppColors.cyan, double opacity = 0.18, bool soft = false}) {
    return [
      BoxShadow(
        color: color.withOpacity(opacity),
        blurRadius: soft ? 30 : 48,
        spreadRadius: soft ? -18 : -20,
        offset: Offset(0, soft ? 14 : 22),
      ),
      BoxShadow(
        color: Colors.black.withOpacity(soft ? 0.18 : 0.26),
        blurRadius: soft ? 24 : 38,
        offset: Offset(0, soft ? 12 : 24),
      ),
    ];
  }

  static List<BoxShadow> glow({Color color = AppColors.cyan, double opacity = 0.22, bool soft = false}) {
    return [
      BoxShadow(
        color: color.withOpacity(opacity),
        blurRadius: soft ? 28 : 42,
        spreadRadius: soft ? -16 : -14,
        offset: Offset(0, soft ? 14 : 18),
      ),
      BoxShadow(
        color: Colors.black.withOpacity(soft ? 0.16 : 0.22),
        blurRadius: soft ? 24 : 32,
        offset: Offset(0, soft ? 12 : 18),
      ),
    ];
  }

  static List<BoxShadow> soft({Color color = AppColors.blue, double opacity = 0.10}) {
    return [
      BoxShadow(
        color: color.withOpacity(opacity),
        blurRadius: 28,
        spreadRadius: -18,
        offset: const Offset(0, 16),
      ),
      BoxShadow(
        color: Colors.black.withOpacity(0.18),
        blurRadius: 22,
        offset: const Offset(0, 12),
      ),
    ];
  }
}

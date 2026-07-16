import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradients {
  const AppGradients._();

  static const LinearGradient accent = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.cyan, AppColors.blue, AppColors.violet],
  );

  static const LinearGradient accentSoft = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x5535D8FF), Color(0x331296F5), Color(0x447C3AED)],
  );

  static const LinearGradient premiumBorder = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xCC35D8FF), Color(0x881296F5), Color(0xB37C3AED)],
  );

  static const LinearGradient glass = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x2DFFFFFF), Color(0x0AFFFFFF)],
  );

  static const LinearGradient premiumGlass = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x33FFFFFF), Color(0x1004BFFF), Color(0x0D8B5CFF), Color(0x08FFFFFF)],
  );

  static const LinearGradient glassQuiet = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x18FFFFFF), Color(0x05000000)],
  );

  static const LinearGradient surface = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF101D33), Color(0xFF071020)],
  );

  static const LinearGradient dark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF061022), Color(0xFF030815)],
  );

  static const LinearGradient darkDiagonal = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0B1426), Color(0xFF050B18), Color(0xFF0B1020)],
  );

  static const LinearGradient heroMesh = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x221296F5), Color(0x0A35D8FF), Color(0x187C3AED)],
  );
}

import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class PremiumProMaxMockup extends StatelessWidget {
  const PremiumProMaxMockup({
    super.key,
    required this.screen,
    this.width = 272,
    this.semanticLabel,
  });

  final Widget screen;
  final double width;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final safeWidth = width.clamp(150.0, 340.0).toDouble();
    final height = safeWidth * 2.145;
    final outerRadius = safeWidth * 0.148;
    final bezel = safeWidth * 0.031;
    final screenRadius = safeWidth * 0.112;
    final compact = safeWidth < 220;

    final phone = Container(
      width: safeWidth,
      height: height,
      padding: EdgeInsets.all(safeWidth * 0.012),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(outerRadius),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE0E2E5),
            Color(0xFF777D86),
            Color(0xFF272C34),
            Color(0xFF0B0E13),
            Color(0xFF8C929B),
          ],
          stops: [0, 0.18, 0.43, 0.76, 1],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.52),
            blurRadius: compact ? 38 : 58,
            spreadRadius: -18,
            offset: Offset(0, compact ? 26 : 34),
          ),
          BoxShadow(
            color: AppColors.cyan.withOpacity(compact ? 0.12 : 0.18),
            blurRadius: compact ? 34 : 54,
            spreadRadius: -20,
            offset: const Offset(-14, 4),
          ),
          BoxShadow(
            color: AppColors.violet.withOpacity(compact ? 0.10 : 0.15),
            blurRadius: compact ? 36 : 58,
            spreadRadius: -22,
            offset: const Offset(16, 10),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(bezel),
        decoration: BoxDecoration(
          color: const Color(0xFF020308),
          borderRadius: BorderRadius.circular(outerRadius - 2),
          border: Border.all(color: Colors.white.withOpacity(0.10), width: 0.8),
        ),
        child: Column(
          children: [
            SizedBox(
              height: safeWidth * 0.12,
              child: Center(
                child: Container(
                  width: safeWidth * 0.31,
                  height: safeWidth * 0.085,
                  decoration: BoxDecoration(
                    color: const Color(0xFF020307),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: Colors.white.withOpacity(0.045)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.55),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: const Alignment(0.58, 0),
                    child: Container(
                      width: safeWidth * 0.018,
                      height: safeWidth * 0.018,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF111A2B),
                        border: Border.all(
                          color: const Color(0xFF24334D),
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(screenRadius),
                child: ColoredBox(
                  color: const Color(0xFF080B12),
                  child: screen,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Semantics(
      label: semanticLabel,
      image: semanticLabel != null,
      child: RepaintBoundary(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            phone,
            Positioned(
              left: -safeWidth * 0.013,
              top: height * 0.20,
              child: _SideButton(
                width: safeWidth * 0.018,
                height: height * 0.115,
                radius: 4,
              ),
            ),
            Positioned(
              left: -safeWidth * 0.013,
              top: height * 0.34,
              child: _SideButton(
                width: safeWidth * 0.018,
                height: height * 0.075,
                radius: 4,
              ),
            ),
            Positioned(
              right: -safeWidth * 0.013,
              top: height * 0.27,
              child: _SideButton(
                width: safeWidth * 0.018,
                height: height * 0.16,
                radius: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SideButton extends StatelessWidget {
  const _SideButton({
    required this.width,
    required this.height,
    required this.radius,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF5D626A),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.white.withOpacity(0.12), width: 0.5),
      ),
    );
  }
}

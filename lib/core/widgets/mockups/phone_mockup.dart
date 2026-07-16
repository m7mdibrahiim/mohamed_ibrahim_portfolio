import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_gradients.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_shadows.dart';
import '../loading_image.dart';

class PhoneMockup extends StatelessWidget {
  const PhoneMockup({
    super.key,
    required this.image,
    this.width = 250,
    this.aspectRatio = 9 / 19.5,
    this.imageFit,
    this.fit,
    this.alignment = Alignment.center,
  });

  final String image;
  final double width;
  final double aspectRatio;
  final BoxFit? imageFit;
  final BoxFit? fit;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    final safeWidth = width.clamp(104.0, 340.0).toDouble();
    final height = safeWidth / aspectRatio;
    final outerRadius = safeWidth * 0.12;
    final innerRadius = safeWidth * 0.083;
    final isSmallMockup = safeWidth < 190;
    final isMobileViewport = MediaQuery.sizeOf(context).width < 600;
    final resolvedFit = imageFit ?? fit ?? BoxFit.cover;

    return RepaintBoundary(
      child: Container(
        width: safeWidth,
        height: height,
        padding: EdgeInsets.all(safeWidth * 0.012),
        decoration: BoxDecoration(
          gradient: AppGradients.premiumBorder,
          borderRadius: BorderRadius.circular(outerRadius),
          boxShadow: [
            ...AppShadows.glow(
              color: AppColors.cyan,
              opacity: isMobileViewport ? 0.10 : (isSmallMockup ? 0.13 : 0.20),
              soft: isMobileViewport,
            ),
            if (!isMobileViewport)
              BoxShadow(
                color: AppColors.violet.withOpacity(isSmallMockup ? 0.08 : 0.14),
                blurRadius: isSmallMockup ? 28 : 54,
                spreadRadius: -20,
                offset: const Offset(18, 22),
              ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(safeWidth * 0.032),
          decoration: BoxDecoration(
            color: const Color(0xFF04070E),
            borderRadius: BorderRadius.circular(outerRadius - 2),
            border: Border.all(color: Colors.white.withOpacity(0.12), width: 1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(innerRadius),
            child: LoadingImage(
              assetPath: image,
              fit: resolvedFit,
              alignment: alignment,
              borderRadius: innerRadius,
              backgroundColor: const Color(0xFF0A0D14),
            ),
          ),
        ),
      ),
    );
  }
}

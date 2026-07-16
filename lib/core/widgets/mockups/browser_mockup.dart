import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_gradients.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_shadows.dart';
import '../loading_image.dart';

class BrowserMockup extends StatelessWidget {
  const BrowserMockup({
    super.key,
    required this.image,
    this.width = 620,
    this.height,
    this.imageFit,
    this.fit,
    this.imageAlignment = Alignment.topCenter,
    this.compactChrome = false,
  });

  final String image;
  final double width;
  final double? height;
  final BoxFit? imageFit;
  final BoxFit? fit;
  final AlignmentGeometry imageAlignment;
  final bool compactChrome;

  @override
  Widget build(BuildContext context) {
    final safeWidth = width.clamp(190.0, 900.0).toDouble();
    final resolvedHeight = height ?? safeWidth * 0.62;
    final chromeHeight = compactChrome || safeWidth < 420 ? 34.0 : 42.0;
    final isSmall = safeWidth < 420;
    final isMobileViewport = MediaQuery.sizeOf(context).width < 600;
    final resolvedFit = imageFit ?? fit ?? BoxFit.cover;

    return RepaintBoundary(
      child: Container(
        width: safeWidth,
        height: resolvedHeight,
        padding: const EdgeInsets.all(1.2),
        decoration: BoxDecoration(
          gradient: AppGradients.premiumBorder,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          boxShadow: AppShadows.ambient(
            color: AppColors.violet,
            opacity: isMobileViewport ? 0.08 : (isSmall ? 0.10 : 0.16),
            soft: isMobileViewport,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.xl - 1),
            border: Border.all(color: AppColors.borderStrong),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.xl - 1),
            child: Column(
              children: [
                Container(
                  height: chromeHeight,
                  padding: EdgeInsets.symmetric(horizontal: isSmall ? 12 : 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.065),
                    border: Border(bottom: BorderSide(color: AppColors.border)),
                  ),
                  child: Row(
                    children: [
                      _dot(const Color(0xFFFF5F57), isSmall),
                      SizedBox(width: isSmall ? 5 : 7),
                      _dot(const Color(0xFFFFBD2E), isSmall),
                      SizedBox(width: isSmall ? 5 : 7),
                      _dot(const Color(0xFF28C840), isSmall),
                      SizedBox(width: isSmall ? 10 : 16),
                      Expanded(
                        child: Container(
                          height: isSmall ? 18 : 22,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.07),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white.withOpacity(0.05)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: LoadingImage(
                    assetPath: image,
                    fit: resolvedFit,
                    alignment: imageAlignment,
                    borderRadius: 0,
                    backgroundColor: Colors.white.withOpacity(0.05),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dot(Color color, bool compact) => Container(
        width: compact ? 8 : 10,
        height: compact ? 8 : 10,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
}

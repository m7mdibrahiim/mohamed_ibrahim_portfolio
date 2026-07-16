import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_gradients.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_shadows.dart';
import '../loading_image.dart';

class DesktopMockup extends StatelessWidget {
  const DesktopMockup({
    super.key,
    required this.image,
    this.width = 650,
    this.imageFit,
    this.fit,
  });

  final String image;
  final double width;
  final BoxFit? imageFit;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final safeWidth = width.clamp(240.0, 900.0).toDouble();
    final screenHeight = safeWidth * 0.58;
    final isSmall = safeWidth < 520;
    final isMobileViewport = MediaQuery.sizeOf(context).width < 600;
    final resolvedFit = imageFit ?? fit ?? BoxFit.contain;

    return RepaintBoundary(
      child: SizedBox(
        width: safeWidth,
        child: Column(
          children: [
            Container(
              width: safeWidth,
              height: screenHeight,
              padding: EdgeInsets.all(isSmall ? 8 : 12),
              decoration: BoxDecoration(
                gradient: AppGradients.premiumBorder,
                borderRadius: BorderRadius.circular(AppRadius.xl),
                boxShadow: AppShadows.ambient(
                  color: AppColors.blue,
                  opacity: isMobileViewport ? 0.08 : (isSmall ? 0.10 : 0.18),
                  soft: isMobileViewport,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(1.2),
                decoration: BoxDecoration(
                  color: const Color(0xFF05070C),
                  borderRadius: BorderRadius.circular(AppRadius.xl - 2),
                  border: Border.all(color: AppColors.borderStrong, width: 1.5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  child: LoadingImage(
                    assetPath: image,
                    fit: resolvedFit,
                    alignment: Alignment.topCenter,
                    borderRadius: AppRadius.lg,
                    backgroundColor: Colors.white.withOpacity(0.04),
                  ),
                ),
              ),
            ),
            Container(
              width: safeWidth * 0.28,
              height: isSmall ? 14 : 20,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),
            Container(
              width: safeWidth * 0.50,
              height: isSmall ? 8 : 10,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.10),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

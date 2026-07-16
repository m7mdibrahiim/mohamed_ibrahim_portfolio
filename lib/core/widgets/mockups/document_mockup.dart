import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_shadows.dart';
import '../loading_image.dart';

/// A neutral, sharp preview stage for receipts, reports, and print-oriented UI.
/// Decorations remain outside the document pixels; the image itself is not
/// filtered, dimmed, blurred, or covered by an overlay.
class DocumentMockup extends StatelessWidget {
  const DocumentMockup({
    super.key,
    required this.image,
    this.width = 620,
    this.imageFit = BoxFit.contain,
    this.alignment = Alignment.topCenter,
  });

  final String image;
  final double width;
  final BoxFit imageFit;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    final safeWidth = width.clamp(220.0, 860.0).toDouble();
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return RepaintBoundary(
      child: Container(
        width: safeWidth,
        constraints: BoxConstraints(
          minHeight: safeWidth * 0.56,
          maxHeight: safeWidth * 0.76,
        ),
        padding: EdgeInsets.all(isMobile ? 10 : 16),
        decoration: BoxDecoration(
          color: const Color(0xFF0A0F18),
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(color: AppColors.borderStrong),
          boxShadow: AppShadows.ambient(
            color: AppColors.cyan,
            opacity: isMobile ? 0.05 : 0.09,
            soft: true,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(isMobile ? 8 : 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F6F8),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: Colors.white.withOpacity(0.18)),
          ),
          child: LoadingImage(
            assetPath: image,
            fit: imageFit,
            alignment: alignment,
            borderRadius: AppRadius.md,
            backgroundColor: const Color(0xFFF4F6F8),
          ),
        ),
      ),
    );
  }
}

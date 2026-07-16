import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_radius.dart';

class LoadingImage extends StatelessWidget {
  const LoadingImage({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = AppRadius.md,
    this.alignment = Alignment.center,
    this.semanticLabel,
    this.backgroundColor,
    this.cacheWidth,
    this.cacheHeight,
    this.filterQuality = FilterQuality.high,
  });

  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final AlignmentGeometry alignment;
  final String? semanticLabel;
  final Color? backgroundColor;
  final int? cacheWidth;
  final int? cacheHeight;
  final FilterQuality filterQuality;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        assetPath,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        gaplessPlayback: true,
        filterQuality: filterQuality,
        semanticLabel: semanticLabel,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded || frame != null) return child;
          return _Placeholder(width: width, height: height, backgroundColor: backgroundColor);
        },
        errorBuilder: (context, error, stackTrace) => _Placeholder(
          width: width,
          height: height,
          label: 'Image TODO',
          showIcon: true,
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({this.width, this.height, this.label = 'Loading', this.showIcon = false, this.backgroundColor});

  final double? width;
  final double? height;
  final String label;
  final bool showIcon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: backgroundColor == null
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF0C1628), Color(0xFF07101D)],
              )
            : null,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.border),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon) ...[
            const Icon(Icons.image_not_supported_rounded, color: AppColors.textMuted, size: 22),
            const SizedBox(height: 8),
          ],
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_gradients.dart';
import '../constants/app_assets.dart';
import 'mi_logo.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.size = 44,
    this.borderRadius,
    this.assetPath = AppAssets.profilePhoto,
  });

  final double size;
  final double? borderRadius;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? size * 0.30;
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(1.4),
      decoration: BoxDecoration(
        gradient: AppGradients.premiumBorder,
        borderRadius: BorderRadius.circular(radius + 1.4),
        boxShadow: [
          BoxShadow(
            color: AppColors.cyan.withOpacity(0.16),
            blurRadius: 18,
            spreadRadius: -8,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.asset(
          assetPath,
          width: size,
          height: size,
          fit: BoxFit.cover,
          alignment: const Alignment(0, -0.18),
          filterQuality: FilterQuality.high,
          errorBuilder: (context, error, stackTrace) => MiLogo(size: size),
        ),
      ),
    );
  }
}

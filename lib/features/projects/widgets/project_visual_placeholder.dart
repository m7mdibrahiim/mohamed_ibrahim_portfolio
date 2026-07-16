import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_gradients.dart';
import '../../../app/theme/app_radius.dart';
import '../../../core/responsive/context_extensions.dart';
import '../models/project_model.dart';

class ProjectVisualPlaceholder extends StatelessWidget {
  const ProjectVisualPlaceholder({
    super.key,
    required this.project,
    this.width = 320,
    this.height,
  });

  final ProjectModel project;
  final double width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final safeWidth = width.clamp(180.0, 860.0).toDouble();
    final resolvedHeight = height ?? switch (project.type) {
      ProjectType.mobile => safeWidth * 1.7,
      ProjectType.web => safeWidth * 0.62,
      ProjectType.desktop => safeWidth * 0.62,
    };

    final icon = switch (project.type) {
      ProjectType.mobile => Icons.phone_iphone_rounded,
      ProjectType.web => Icons.language_rounded,
      ProjectType.desktop => Icons.desktop_windows_rounded,
    };

    return Semantics(
      label: context.l10n.text('visualUnavailable'),
      child: Container(
        key: ValueKey<String>('project-visual-fallback-${project.id}'),
        width: safeWidth,
        height: resolvedHeight.clamp(190.0, 560.0).toDouble(),
        padding: const EdgeInsets.all(1.2),
        decoration: BoxDecoration(
          gradient: AppGradients.premiumBorder,
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: AppGradients.darkDiagonal,
            borderRadius: BorderRadius.circular(AppRadius.xl - 1),
            border: Border.all(color: AppColors.borderStrong),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 66,
                height: 66,
                decoration: BoxDecoration(
                  color: AppColors.cyan.withOpacity(0.10),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.cyan.withOpacity(0.32)),
                ),
                child: Icon(icon, color: AppColors.cyan, size: 30),
              ),
              const SizedBox(height: 18),
              Text(
                project.title(context),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                context.l10n.text('visualUnavailable'),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

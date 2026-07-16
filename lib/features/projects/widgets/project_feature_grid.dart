import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/glass_card.dart';

class ProjectFeatureGrid extends StatelessWidget {
  const ProjectFeatureGrid({super.key, required this.features});

  final List<String> features;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth > 900 ? 3 : constraints.maxWidth > 560 ? 2 : 1;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: features.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            mainAxisExtent: columns == 1 ? (context.isTinyPhone ? 112 : (context.isSmallMobile ? 108 : 100)) : 118,
          ),
          itemBuilder: (context, index) {
            return GlassCard(
              padding: EdgeInsets.all(context.isSmallMobile ? 14 : 16),
              borderRadius: AppRadius.lg,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.cyan.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      border: Border.all(color: AppColors.cyan.withOpacity(0.25)),
                    ),
                    child: const Icon(Icons.auto_awesome_rounded, color: AppColors.cyan, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      features[index],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w800,
                            height: 1.28,
                          ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_gradients.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_shadows.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/router/route_names.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/app_outlined_button.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/responsive_action_group.dart';
import '../../../core/widgets/technology_chip.dart';
import '../models/project_model.dart';
import 'project_links.dart';
import 'project_mockup_view.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.project,
    this.compact = false,
  });

  final ProjectModel project;
  final bool compact;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final isMobile = context.isMobile;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: isMobile ? null : (_) => setState(() => _hovered = true),
      onExit: isMobile ? null : (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered && !isMobile ? 1.012 : 1,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            boxShadow: _hovered ? AppShadows.glow(color: AppColors.cyan, opacity: 0.16) : AppShadows.glow(color: AppColors.violet, opacity: 0.05, soft: isMobile),
          ),
          child: GlassCard(
            padding: EdgeInsets.all(isMobile ? 16 : 22),
            borderRadius: AppRadius.xxl,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(_hovered ? 0.12 : 0.085),
                Colors.white.withOpacity(0.03),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProjectVisualStage(project: project, hovered: _hovered, compact: widget.compact),
                const SizedBox(height: AppSpacing.lg),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    TechnologyChip(label: project.status(context), dense: true, highlight: true),
                    TechnologyChip(label: project.category(context), dense: true),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  project.title(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  project.shortDescription(context),
                  maxLines: widget.compact ? 3 : 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.58,
                      ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final tech in project.techStack.take(5)) TechnologyChip(label: tech, dense: true),
                  ],
                ),
                const SizedBox(height: 18),
                ...project.highlights(context).take(3).map(
                      (highlight) => Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.check_circle_rounded, color: AppColors.teal, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                highlight,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.textSecondary,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                const SizedBox(height: 18),
                ResponsiveActionGroup(
                  stackBelow: 600,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    AppOutlinedButton(
                      label: context.l10n.text('viewCaseStudy'),
                      icon: context.isAr
                          ? Icons.arrow_back_rounded
                          : Icons.arrow_forward_rounded,
                      onPressed: () => context.goNamed(
                        AppRouteNames.projectDetails,
                        pathParameters: {'id': project.id},
                      ),
                    ),
                    ProjectLinks(
                      project: project,
                      compact: true,
                      primaryFirst: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProjectVisualStage extends StatelessWidget {
  const _ProjectVisualStage({required this.project, required this.hovered, required this.compact});

  final ProjectModel project;
  final bool hovered;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = _stageHeight(context, constraints.maxWidth);
        return AnimatedContainer(
          duration: const Duration(milliseconds: 260),
          height: height,
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 12 : 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.xl),
            gradient: AppGradients.dark,
            border: Border.all(color: hovered ? AppColors.cyan.withOpacity(0.28) : AppColors.border),
            boxShadow: [
              BoxShadow(
                color: (project.type == ProjectType.desktop ? AppColors.blue : AppColors.violet).withOpacity(hovered ? 0.16 : 0.08),
                blurRadius: hovered ? 40 : 28,
                spreadRadius: -18,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -50,
                right: context.isAr ? null : -40,
                left: context.isAr ? -40 : null,
                child: Container(
                  width: isMobile ? 120 : 160,
                  height: isMobile ? 120 : 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: AppColors.cyan.withOpacity(isMobile ? 0.10 : 0.16), blurRadius: isMobile ? 58 : 80, spreadRadius: 10)],
                  ),
                ),
              ),
              Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeOutCubic,
                  child: FittedBox(
                    key: ValueKey('${project.id}-${project.primaryImage}-$height'),
                    fit: BoxFit.scaleDown,
                    child: ProjectMockupView(
                      project: project,
                      image: project.primaryImage,
                      width: _mockupWidth(project, isMobile, context.isTinyPhone, constraints.maxWidth),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  double _stageHeight(BuildContext context, double availableWidth) {
    if (compact) {
      if (context.isTinyPhone) return 218;
      if (context.isSmallMobile) return 226;
      if (context.isMobile) return 244;
      return 260;
    }
    if (context.isTinyPhone) return 236;
    if (context.isSmallMobile) return 248;
    if (context.isMobile) return math.min(300.0, math.max(264.0, availableWidth * 0.90));
    return 352;
  }

  double _mockupWidth(ProjectModel project, bool isMobile, bool isTinyPhone, double availableWidth) {
    switch (project.mediaKindFor(project.primaryImage)) {
      case ProjectMediaKind.phone:
        return isMobile
            ? math.min(isTinyPhone ? 198.0 : 220.0, availableWidth * 0.70)
            : 242.0;
      case ProjectMediaKind.browser:
      case ProjectMediaKind.desktop:
      case ProjectMediaKind.document:
        return isMobile
            ? math.min(500.0, math.max(260.0, availableWidth - 24))
            : 600.0;
    }
  }
}

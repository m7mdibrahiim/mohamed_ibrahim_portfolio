import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_gradients.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_shadows.dart';
import '../../../app/router/route_names.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/app_outlined_button.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/responsive_action_group.dart';
import '../../../core/widgets/technology_chip.dart';
import '../data/projects_data.dart';
import '../models/project_model.dart';
import 'project_links.dart';
import 'project_mockup_view.dart';

class InteractiveProjectShowcase extends StatefulWidget {
  const InteractiveProjectShowcase({super.key});

  @override
  State<InteractiveProjectShowcase> createState() => _InteractiveProjectShowcaseState();
}

class _InteractiveProjectShowcaseState extends State<InteractiveProjectShowcase> {
  int _selectedIndex = 0;

  List<ProjectModel> get _projects => ProjectsData.flutterAppLabProjects;

  @override
  Widget build(BuildContext context) {
    final projects = _projects;
    if (projects.isEmpty) return const SizedBox.shrink();
    final safeIndex = _selectedIndex.clamp(0, projects.length - 1).toInt();
    final selected = projects[safeIndex];
    final isNarrow = MediaQuery.sizeOf(context).width < 940;

    final visual = _VisualPanel(project: selected);
    final details = _DetailsPanel(project: selected);
    final list = _ProjectSelector(
      projects: projects,
      selectedIndex: safeIndex,
      onSelected: (index) {
        if (index < 0 || index >= projects.length || index == safeIndex) return;
        final nextImage = projects[index].primaryImage;
        if (nextImage != null && nextImage.isNotEmpty) {
          precacheImage(
            AssetImage(nextImage),
            context,
            onError: (_, __) {},
          );
        }
        setState(() => _selectedIndex = index);
      },
    );

    if (isNarrow) {
      return Column(
        children: [
          visual,
          const SizedBox(height: 16),
          list,
          const SizedBox(height: 16),
          details,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 6, child: visual),
        const SizedBox(width: 24),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              list,
              const SizedBox(height: 18),
              details,
            ],
          ),
        ),
      ],
    );
  }
}

class _VisualPanel extends StatelessWidget {
  const _VisualPanel({required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 700;
    return GlassCard(
      padding: EdgeInsets.all(isMobile ? 14 : 22),
      borderRadius: AppRadius.xxl,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.white.withOpacity(0.10), Colors.white.withOpacity(0.025)],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final height = isMobile
              ? (context.isTinyPhone
                  ? math.min(380.0, math.max(308.0, constraints.maxWidth * 1.02))
                  : math.min(430.0, math.max(330.0, constraints.maxWidth * 1.06)))
              : 635.0;
          return RepaintBoundary(
            child: SizedBox(
              height: height,
              width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.xl),
                        gradient: AppGradients.dark,
                        border: Border.all(color: AppColors.border),
                      ),
                    ),
                  ),
                  Positioned(
                    top: isMobile ? -48 : -70,
                    right: context.isAr ? null : -50,
                    left: context.isAr ? -50 : null,
                    child: Container(
                      width: isMobile ? 190 : 260,
                      height: isMobile ? 190 : 260,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: AppColors.cyan.withOpacity(isMobile ? 0.12 : 0.20), blurRadius: isMobile ? 82 : 120, spreadRadius: isMobile ? 12 : 28)],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: isMobile ? -48 : -70,
                    left: context.isAr ? null : -50,
                    right: context.isAr ? -50 : null,
                    child: Container(
                      width: isMobile ? 180 : 240,
                      height: isMobile ? 180 : 240,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: AppColors.violet.withOpacity(isMobile ? 0.12 : 0.20), blurRadius: isMobile ? 82 : 120, spreadRadius: isMobile ? 12 : 26)],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: context.isAr ? null : 16,
                    right: context.isAr ? 16 : null,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        TechnologyChip(label: _mockupLabel(context, project), dense: true, highlight: true),
                        if (!context.isSmallMobile) TechnologyChip(label: project.category(context), dense: true),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: isMobile ? 30 : 26),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        switchInCurve: Curves.easeOutCubic,
                        switchOutCurve: Curves.easeInCubic,
                        transitionBuilder: (child, animation) => FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(begin: const Offset(0.012, 0.018), end: Offset.zero).animate(animation),
                            child: ScaleTransition(
                              scale: Tween<double>(begin: .985, end: 1).animate(animation),
                              child: child,
                            ),
                          ),
                        ),
                        child: FittedBox(
                          key: ValueKey('${project.id}-${project.primaryImage}'),
                          fit: BoxFit.scaleDown,
                          child: ProjectMockupView(
                            project: project,
                            image: project.primaryImage,
                            width: _mockupWidth(project, isMobile, context.isTinyPhone, constraints.maxWidth),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _mockupLabel(BuildContext context, ProjectModel project) {
    switch (project.mediaKindFor(project.primaryImage)) {
      case ProjectMediaKind.phone:
        return context.l10n.text('mobileMockup');
      case ProjectMediaKind.browser:
        return context.l10n.text('browserMockup');
      case ProjectMediaKind.desktop:
      case ProjectMediaKind.document:
        return context.l10n.text('desktopMockup');
    }
  }

  double _mockupWidth(ProjectModel project, bool isMobile, bool isTinyPhone, double availableWidth) {
    switch (project.mediaKindFor(project.primaryImage)) {
      case ProjectMediaKind.phone:
        return isMobile
            ? math.min(isTinyPhone ? 216.0 : 240.0, availableWidth * 0.66)
            : 296.0;
      case ProjectMediaKind.browser:
      case ProjectMediaKind.desktop:
      case ProjectMediaKind.document:
        return isMobile
            ? math.min(540.0, math.max(280.0, availableWidth - 24))
            : 750.0;
    }
  }
}

class _ProjectSelector extends StatelessWidget {
  const _ProjectSelector({
    required this.projects,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<ProjectModel> projects;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 700;
    return GlassCard(
      padding: EdgeInsets.all(compact ? 10 : 12),
      borderRadius: AppRadius.xxl,
      child: compact
          ? SizedBox(
              height: 92,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: projects.length,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) => SizedBox(
                  width: math.min(220.0, MediaQuery.sizeOf(context).width * 0.66),
                  child: _SelectorTile(
                    project: projects[index],
                    selected: index == selectedIndex,
                    onTap: () => onSelected(index),
                    compact: true,
                  ),
                ),
              ),
            )
          : Column(
              children: [
                for (var i = 0; i < projects.length; i++)
                  _SelectorTile(
                    project: projects[i],
                    selected: i == selectedIndex,
                    onTap: () => onSelected(i),
                  ),
              ],
            ),
    );
  }
}

class _SelectorTile extends StatelessWidget {
  const _SelectorTile({
    required this.project,
    required this.selected,
    required this.onTap,
    this.compact = false,
  });

  final ProjectModel project;
  final bool selected;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      mouseCursor: SystemMouseCursors.click,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        margin: EdgeInsets.only(bottom: compact ? 0 : 8),
        padding: EdgeInsets.all(compact ? 12 : 14),
        decoration: BoxDecoration(
          color: selected ? AppColors.cyan.withOpacity(0.12) : Colors.white.withOpacity(0.025),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: selected ? AppColors.cyan.withOpacity(0.42) : AppColors.border),
          boxShadow: selected ? AppShadows.glow(color: AppColors.cyan, opacity: 0.07, soft: true) : [],
        ),
        child: Row(
          children: [
            Container(
              width: compact ? 38 : 44,
              height: compact ? 38 : 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: selected ? AppGradients.accent : null,
                color: selected ? null : Colors.white.withOpacity(0.06),
              ),
              child: Icon(
                switch (project.type) {
                  ProjectType.mobile => Icons.phone_iphone_rounded,
                  ProjectType.web => Icons.language_rounded,
                  ProjectType.desktop => Icons.desktop_windows_rounded,
                },
                color: selected ? Colors.white : AppColors.textSecondary,
                size: compact ? 18 : 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title(context),
                    maxLines: compact ? 2 : 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  if (!compact) ...[
                    const SizedBox(height: 4),
                    Text(
                      project.category(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                    ),
                  ],
                ],
              ),
            ),
            if (!compact) Icon(context.isAr ? Icons.chevron_left_rounded : Icons.chevron_right_rounded, color: selected ? AppColors.cyan : AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}

class _DetailsPanel extends StatelessWidget {
  const _DetailsPanel({required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 380),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      child: GlassCard(
        key: ValueKey(project.id),
        padding: EdgeInsets.all(isMobile ? 18 : 22),
        borderRadius: AppRadius.xxl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TechnologyChip(label: project.status(context), dense: true, highlight: true),
            const SizedBox(height: 14),
            Text(
              project.title(context),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              project.shortDescription(context),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.62,
                  ),
            ),
            const SizedBox(height: 18),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [for (final tech in project.techStack.take(isMobile ? 6 : 8)) TechnologyChip(label: tech, dense: true)],
            ),
            const SizedBox(height: 20),
            _InfoBlock(title: context.l10n.text('labChallenge'), text: project.challenge(context)),
            const SizedBox(height: 14),
            _InfoBlock(title: context.l10n.text('labSolution'), text: project.solution(context)),
            const SizedBox(height: 20),
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
    );
  }
}

class _InfoBlock extends StatelessWidget {
  const _InfoBlock({required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.isMobile ? 12 : 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.cyan,
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.55,
                ),
          ),
        ],
      ),
    );
  }
}

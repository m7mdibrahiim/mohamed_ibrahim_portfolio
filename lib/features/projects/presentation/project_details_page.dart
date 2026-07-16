import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_gradients.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../app/router/route_names.dart';
import '../../../core/layout/app_navbar_metrics.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/app_outlined_button.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/footer.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/section_container.dart';
import '../../../core/widgets/technology_chip.dart';
import '../data/projects_data.dart';
import '../models/project_model.dart';
import '../widgets/architecture_diagram.dart';
import '../widgets/project_feature_grid.dart';
import '../widgets/project_gallery.dart';
import '../widgets/project_links.dart';
import '../widgets/project_mockup_view.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({super.key, required this.projectId});

  final String projectId;

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant ProjectDetailsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.projectId == widget.projectId) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) return;
      _scrollController.jumpTo(0);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final project = ProjectsData.byId(widget.projectId);
    if (project == null) {
      return _ProjectNotFoundPage(projectId: widget.projectId);
    }

    final gallerySubtitle = !project.hasScreenshots || project.usesPlaceholder
        ? context.l10n.text('missingAssets')
        : (context.isAr
            ? 'معرض صور داخل mockups مناسبة لنوع المشروع.'
            : 'Screenshots presented in mockups that match the project type.');

    return AppPageScaffold(
      activeNav: 'projects',
      child: CustomScrollView(
        key: ValueKey<String>('project-details-scroll-${project.id}'),
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: SectionContainer(
              topPadding: AppNavbarMetrics.firstSectionTopPadding(context),
              bottomPadding: context.isMobile ? 38 : 58,
              child: _ProjectHero(project: project),
            ),
          ),
          SliverToBoxAdapter(
            child: SectionContainer(
              topPadding: 22,
              child: _OverviewGrid(project: project),
            ),
          ),
          if (project.workflow(context).isNotEmpty)
            SliverToBoxAdapter(
              child: SectionContainer(
                title: context.l10n.text('visualJourney'),
                subtitle: context.isAr
                    ? 'ترتيب الصور ومسار الاستخدام مبنيان على المعلومات المؤكدة وما يظهر بوضوح في الشاشات.'
                    : 'The sequence follows owner-confirmed information and workflows that are clearly visible in the supplied screens.',
                topPadding: 40,
                child: _WorkflowJourney(steps: project.workflow(context)),
              ),
            ),
          SliverToBoxAdapter(
            child: SectionContainer(
              title: context.l10n.text('keyFeatures'),
              subtitle: context.isAr
                  ? 'مميزات مختارة توضّح نطاق المشروع وتجربة الاستخدام الأساسية.'
                  : 'Selected features that show the app scope and core user experience.',
              topPadding: 40,
              child: ProjectFeatureGrid(features: project.features(context)),
            ),
          ),
          if (project.ownerConfirmedFeatures(context).isNotEmpty ||
              project.screenshotConfirmedFeatures(context).isNotEmpty ||
              project.hasUnconfirmedDetails)
            SliverToBoxAdapter(
              child: SectionContainer(
                topPadding: 40,
                child: _EvidencePanel(project: project),
              ),
            ),
          if (!project.hasUnconfirmedDetails)
            SliverToBoxAdapter(
              child: SectionContainer(
                title: context.l10n.text('architecture'),
                subtitle: context.isAr
                    ? 'تمثيل مبسط للتقنيات والطبقات المؤكدة في المشروع.'
                    : 'A simplified view of the project’s confirmed technologies and delivery layers.',
                topPadding: 44,
                child: ArchitectureDiagram(techStack: project.techStack),
              ),
            ),
          SliverToBoxAdapter(
            child: SectionContainer(
              title: context.l10n.text('gallery'),
              subtitle: gallerySubtitle,
              topPadding: 44,
              child: ProjectGallery(
                key: ValueKey<String>('gallery-${project.id}'),
                project: project,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SectionContainer(
              title: context.l10n.text('links'),
              subtitle: context.isAr
                  ? 'روابط التحميل أو الموقع أو العرض متاحة حسب ما تم توفيره.'
                  : 'Available download, website, or demo links are attached where provided.',
              topPadding: 44,
              child: GlassCard(
                padding: EdgeInsets.all(context.isCompactPhone ? 18 : 22),
                borderRadius: AppRadius.xl,
                child: ProjectLinks(project: project),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SectionContainer(
              topPadding: 22,
              bottomPadding: 64,
              child: _ProjectNavigation(project: project),
            ),
          ),
          const SliverToBoxAdapter(child: AppFooter()),
        ],
      ),
    );
  }
}

class _ProjectHero extends StatelessWidget {
  const _ProjectHero({required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.all(context.isCompactPhone ? 18 : (context.isMobile ? 22 : 32)),
      borderRadius: context.isCompactPhone ? AppRadius.xl : AppRadius.xxl,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth > 880;
          final copy = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppOutlinedButton(
                label: context.l10n.text('backToProjects'),
                icon: context.isAr ? Icons.arrow_forward_rounded : Icons.arrow_back_rounded,
                isExpanded: context.isCompactPhone,
                onPressed: () => context.goNamed(AppRouteNames.projects),
              ),
              const SizedBox(height: 22),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  TechnologyChip(label: project.status(context), highlight: true),
                  TechnologyChip(label: project.category(context)),
                  if (project.isSourcePrivate) TechnologyChip(label: context.l10n.text('sourcePrivate')),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                project.title(context),
                style: AppTextStyles.sectionTitle(context).copyWith(
                  fontSize: context.isCompactPhone ? 30 : (context.isMobile ? 34 : 56),
                ),
              ),
              const SizedBox(height: 16),
              Text(project.shortDescription(context), style: AppTextStyles.body(context)),
              const SizedBox(height: 20),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [for (final tech in project.techStack.take(context.isMobile ? 7 : 10)) TechnologyChip(label: tech, dense: true)],
              ),
              const SizedBox(height: 24),
              ProjectLinks(project: project),
            ],
          );

          final visual = _ProjectHeroVisual(project: project, wide: wide);

          if (!wide) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [copy, const SizedBox(height: 28), visual],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 5, child: copy),
              const SizedBox(width: 32),
              Expanded(flex: 5, child: visual),
            ],
          );
        },
      ),
    );
  }
}

class _ProjectHeroVisual extends StatelessWidget {
  const _ProjectHeroVisual({required this.project, required this.wide});

  final ProjectModel project;
  final bool wide;

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final compact = context.isCompactPhone;
    final height = wide ? 548.0 : (context.isTinyPhone ? 318.0 : (compact ? 334.0 : (isMobile ? 402.0 : 470.0)));
    return Container(
      height: height,
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 12 : 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        gradient: AppGradients.dark,
        border: Border.all(color: AppColors.border),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Stack(
          children: [
            Positioned(
              top: -80,
              right: context.isAr ? null : -60,
              left: context.isAr ? -60 : null,
              child: _VisualGlow(color: _accentFor(project), size: isMobile ? 190 : 250),
            ),
            Positioned(
              bottom: -92,
              left: context.isAr ? null : -72,
              right: context.isAr ? -72 : null,
              child: _VisualGlow(color: AppColors.violet, size: isMobile ? 190 : 250),
            ),
            Center(
              child: RepaintBoundary(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: ProjectMockupView(
                    project: project,
                    image: project.primaryImage,
                    width: _mockupWidth(project, context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _accentFor(ProjectModel project) {
    return switch (project.type) {
      ProjectType.mobile => AppColors.cyan,
      ProjectType.web => AppColors.violet,
      ProjectType.desktop => AppColors.blue,
    };
  }

  double _mockupWidth(ProjectModel project, BuildContext context) {
    final isMobile = context.isMobile;
    final compact = context.isCompactPhone;
    switch (project.mediaKindFor(project.primaryImage)) {
      case ProjectMediaKind.phone:
        return context.isTinyPhone
            ? 198
            : (compact ? 210 : (isMobile ? 250 : 300));
      case ProjectMediaKind.browser:
      case ProjectMediaKind.desktop:
      case ProjectMediaKind.document:
        return context.isTinyPhone
            ? 430
            : (compact ? 500 : (isMobile ? 620 : 760));
    }
  }
}

class _VisualGlow extends StatelessWidget {
  const _VisualGlow({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: color.withOpacity(0.16), blurRadius: 100, spreadRadius: 18)],
      ),
    );
  }
}

class _OverviewGrid extends StatelessWidget {
  const _OverviewGrid({required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final cards = [
      _CaseStudyCardData(context.l10n.text('overview'), project.overview(context), Icons.view_agenda_rounded),
      _CaseStudyCardData(context.l10n.text('problem'), project.problem(context), Icons.report_problem_rounded),
      _CaseStudyCardData(context.l10n.text('myRole'), project.role(context), Icons.engineering_rounded),
      _CaseStudyCardData(context.l10n.text('challenges'), project.challenge(context), Icons.extension_rounded),
      _CaseStudyCardData(context.l10n.text('solutions'), project.solution(context), Icons.check_circle_rounded),
      _CaseStudyCardData(context.l10n.text('techStack'), project.techStack.join(' • '), Icons.memory_rounded),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth > 900 ? 2 : 1;
        final itemWidth = columns == 1 ? constraints.maxWidth : (constraints.maxWidth - 16) / 2;
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            for (final card in cards)
              SizedBox(
                width: itemWidth,
                child: _CaseStudyCard(data: card),
              ),
          ],
        );
      },
    );
  }
}

class _CaseStudyCardData {
  const _CaseStudyCardData(this.title, this.text, this.icon);

  final String title;
  final String text;
  final IconData icon;
}

class _CaseStudyCard extends StatelessWidget {
  const _CaseStudyCard({required this.data});

  final _CaseStudyCardData data;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.all(context.isCompactPhone ? 18 : 20),
      borderRadius: AppRadius.xl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.cyan.withOpacity(0.12),
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(color: AppColors.cyan.withOpacity(0.25)),
            ),
            child: Icon(data.icon, color: AppColors.cyan, size: 21),
          ),
          const SizedBox(height: 14),
          Text(
            data.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          Text(
            data.text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
          ),
        ],
      ),
    );
  }
}


class _WorkflowJourney extends StatelessWidget {
  const _WorkflowJourney({required this.steps});

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontal = constraints.maxWidth > 920;
        if (!horizontal) {
          return Column(
            children: [
              for (var index = 0; index < steps.length; index++) ...[
                _WorkflowStep(index: index, text: steps[index]),
                if (index < steps.length - 1)
                  Container(
                    width: 2,
                    height: 18,
                    color: AppColors.cyan.withOpacity(0.25),
                  ),
              ],
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var index = 0; index < steps.length; index++) ...[
              Expanded(child: _WorkflowStep(index: index, text: steps[index])),
              if (index < steps.length - 1)
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Icon(
                    context.isAr
                        ? Icons.arrow_back_rounded
                        : Icons.arrow_forward_rounded,
                    color: AppColors.cyan.withOpacity(0.55),
                    size: 20,
                  ),
                ),
            ],
          ],
        );
      },
    );
  }
}

class _WorkflowStep extends StatelessWidget {
  const _WorkflowStep({required this.index, required this.text});

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      borderRadius: AppRadius.lg,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: AppGradients.accent,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Text(
              '${index + 1}',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                    height: 1.45,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EvidencePanel extends StatelessWidget {
  const _EvidencePanel({required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final owner = project.ownerConfirmedFeatures(context);
    final screenshots = project.screenshotConfirmedFeatures(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth > 780;
        final cards = <Widget>[
          if (owner.isNotEmpty)
            _EvidenceCard(
              title: context.l10n.text('ownerConfirmed'),
              icon: Icons.verified_rounded,
              items: owner,
            ),
          if (screenshots.isNotEmpty)
            _EvidenceCard(
              title: context.l10n.text('screenshotConfirmed'),
              icon: Icons.photo_library_rounded,
              items: screenshots,
            ),
          if (project.hasUnconfirmedDetails)
            _EvidenceCard(
              title: 'TODO',
              icon: Icons.info_outline_rounded,
              items: <String>[context.l10n.text('detailsTodo')],
            ),
        ];
        if (!wide) {
          return Column(
            children: [
              for (var index = 0; index < cards.length; index++) ...[
                if (index > 0) const SizedBox(height: 14),
                cards[index],
              ],
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var index = 0; index < cards.length; index++) ...[
              if (index > 0) const SizedBox(width: 14),
              Expanded(child: cards[index]),
            ],
          ],
        );
      },
    );
  }
}

class _EvidenceCard extends StatelessWidget {
  const _EvidenceCard({
    required this.title,
    required this.icon,
    required this.items,
  });

  final String title;
  final IconData icon;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      borderRadius: AppRadius.xl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.cyan, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.success,
                      size: 15,
                    ),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.45,
                          ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ProjectNavigation extends StatelessWidget {
  const _ProjectNavigation({required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final previous = ProjectsData.previousBefore(project);
    final next = ProjectsData.nextAfter(project);
    if (previous == null && next == null) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth > 820;
        final cards = <Widget>[
          if (previous != null)
            _ProjectNavigationCard(
              project: previous,
              actionKey: const ValueKey('previous-project-button'),
              label: context.l10n.text('previousProject'),
              icon: context.isAr
                  ? Icons.arrow_forward_rounded
                  : Icons.arrow_back_rounded,
            ),
          if (next != null)
            _ProjectNavigationCard(
              project: next,
              actionKey: const ValueKey('next-project-button'),
              label: context.l10n.text('nextProject'),
              icon: context.isAr
                  ? Icons.arrow_back_rounded
                  : Icons.arrow_forward_rounded,
              emphasize: true,
            ),
        ];

        if (!wide) {
          return Column(
            children: [
              for (var index = 0; index < cards.length; index++) ...[
                if (index > 0) const SizedBox(height: 14),
                cards[index],
              ],
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var index = 0; index < cards.length; index++) ...[
              if (index > 0) const SizedBox(width: 16),
              Expanded(child: cards[index]),
            ],
          ],
        );
      },
    );
  }
}

class _ProjectNavigationCard extends StatelessWidget {
  const _ProjectNavigationCard({
    super.key,
    required this.project,
    required this.label,
    required this.icon,
    required this.actionKey,
    this.emphasize = false,
  });

  final ProjectModel project;
  final String label;
  final IconData icon;
  final Key actionKey;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.all(context.isMobile ? 20 : 24),
      borderRadius: AppRadius.xl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TechnologyChip(label: label, highlight: emphasize),
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
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.55,
                ),
          ),
          const SizedBox(height: 20),
          if (emphasize)
            GradientButton(
              key: actionKey,
              label: context.l10n.text('viewCaseStudy'),
              icon: icon,
              isExpanded: context.isMobile,
              onPressed: () => _open(context),
            )
          else
            AppOutlinedButton(
              key: actionKey,
              label: context.l10n.text('viewCaseStudy'),
              icon: icon,
              isExpanded: context.isMobile,
              onPressed: () => _open(context),
            ),
        ],
      ),
    );
  }

  void _open(BuildContext context) {
    context.goNamed(
      AppRouteNames.projectDetails,
      pathParameters: {'id': project.id},
    );
  }
}

class _ProjectNotFoundPage extends StatelessWidget {
  const _ProjectNotFoundPage({required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      activeNav: 'projects',
      child: Center(
        key: const ValueKey('project-not-found'),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: GlassCard(
            padding: const EdgeInsets.all(28),
            borderRadius: AppRadius.xl,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.search_off_rounded, color: AppColors.cyan, size: 42),
                const SizedBox(height: 14),
                Text(
                  context.l10n.text('noProject'),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                if (projectId.trim().isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    projectId,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                        ),
                  ),
                ],
                const SizedBox(height: 18),
                GradientButton(
                  label: context.l10n.text('backToProjects'),
                  icon: context.isAr ? Icons.arrow_forward_rounded : Icons.arrow_back_rounded,
                  isExpanded: context.isMobile,
                  onPressed: () => context.goNamed(AppRouteNames.projects),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

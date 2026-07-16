import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_gradients.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/layout/app_navbar_metrics.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/footer.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/section_container.dart';
import '../../../core/widgets/technology_chip.dart';
import '../data/projects_data.dart';
import '../models/project_model.dart';
import '../widgets/project_card.dart';

enum _ProjectFilter { all, mobile, windows, web }

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  _ProjectFilter _filter = _ProjectFilter.all;

  List<ProjectModel> get _projects => switch (_filter) {
        _ProjectFilter.all => ProjectsData.orderedProjects,
        _ProjectFilter.mobile => ProjectsData.mobileProjects,
        _ProjectFilter.windows => ProjectsData.windowsProjects,
        _ProjectFilter.web => ProjectsData.webProjects,
      };

  @override
  Widget build(BuildContext context) {
    final projects = _projects;
    return AppPageScaffold(
      activeNav: 'projects',
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SectionContainer(
              topPadding: AppNavbarMetrics.firstSectionTopPadding(context),
              bottomPadding: context.isMobile ? 38 : 56,
              child: const _ProjectsHeroBand(),
            ),
          ),
          SliverToBoxAdapter(
            child: SectionContainer(
              title: context.l10n.text('allProjects'),
              subtitle: context.isAr
                  ? 'كل مشروع مخزن في مصدر البيانات الرئيسي يظهر هنا، بترتيب محدد للموبايل وWindows والويب.'
                  : 'Every project in the master data source appears here, with deterministic mobile, Windows, and web ordering.',
              topPadding: 14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _ProjectFilters(
                    selected: _filter,
                    onSelected: (value) => setState(() => _filter = value),
                  ),
                  SizedBox(height: context.isMobile ? 22 : 30),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 240),
                    child: _ProjectGrid(
                      key: ValueKey<_ProjectFilter>(_filter),
                      projects: projects,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: AppFooter()),
        ],
      ),
    );
  }
}

class _ProjectFilters extends StatelessWidget {
  const _ProjectFilters({required this.selected, required this.onSelected});

  final _ProjectFilter selected;
  final ValueChanged<_ProjectFilter> onSelected;

  @override
  Widget build(BuildContext context) {
    final items = <(_ProjectFilter, String, IconData)>[
      (_ProjectFilter.all, context.l10n.text('filterAll'), Icons.grid_view_rounded),
      (_ProjectFilter.mobile, context.l10n.text('filterMobile'), Icons.phone_iphone_rounded),
      (_ProjectFilter.windows, context.l10n.text('filterWindows'), Icons.desktop_windows_rounded),
      (_ProjectFilter.web, context.l10n.text('filterWeb'), Icons.language_rounded),
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final item in items)
          Semantics(
            selected: item.$1 == selected,
            button: true,
            child: InkWell(
              onTap: () => onSelected(item.$1),
              borderRadius: BorderRadius.circular(999),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                padding: EdgeInsets.symmetric(
                  horizontal: context.isTinyPhone ? 13 : 16,
                  vertical: 11,
                ),
                decoration: BoxDecoration(
                  gradient: item.$1 == selected ? AppGradients.accent : null,
                  color: item.$1 == selected
                      ? null
                      : Colors.white.withOpacity(0.045),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: item.$1 == selected
                        ? AppColors.cyan.withOpacity(0.46)
                        : AppColors.border,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(item.$3, size: 17, color: AppColors.textPrimary),
                    const SizedBox(width: 8),
                    Text(
                      item.$2,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.textPrimary,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _ProjectGrid extends StatelessWidget {
  const _ProjectGrid({super.key, required this.projects});

  final List<ProjectModel> projects;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth > 1120
            ? 3
            : constraints.maxWidth > 760
                ? 2
                : 1;
        final totalSpacing = 18.0 * (columns - 1);
        final itemWidth = (constraints.maxWidth - totalSpacing) / columns;
        return Wrap(
          spacing: 18,
          runSpacing: 18,
          children: [
            for (final project in projects)
              SizedBox(
                width: itemWidth,
                child: ProjectCard(
                  project: project,
                  compact: !project.isFeatured,
                ),
              ),
          ],
        );
      },
    );
  }
}

class _ProjectsHeroBand extends StatelessWidget {
  const _ProjectsHeroBand();

  @override
  Widget build(BuildContext context) {
    final featuredCount = ProjectsData.featuredProjects.length;
    final totalCount = ProjectsData.orderedProjects.length;
    return GlassCard(
      padding: EdgeInsets.all(context.isMobile ? 22 : 34),
      borderRadius: AppRadius.xxl,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth > 850;
          final copy = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TechnologyChip(
                label: 'Flutter Portfolio System',
                highlight: true,
              ),
              const SizedBox(height: 18),
              Text(
                context.isAr
                    ? 'مشاريع تُعرض كمنتجات حقيقية، لا كقائمة صور.'
                    : 'Projects presented as real products, not a screenshot dump.',
                style: AppTextStyles.sectionTitle(context).copyWith(
                  fontSize: context.isMobile ? 32 : 48,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                context.isAr
                    ? 'الموبايل أولاً بالترتيب المعتمد، ثم تطبيقات Windows والديسكتوب، ثم مشاريع الويب responsive.'
                    : 'Mobile work leads in the approved priority, followed by Windows and desktop applications, then responsive web projects.',
                style: AppTextStyles.body(context),
              ),
            ],
          );
          final stats = GlassCard(
            padding: const EdgeInsets.all(20),
            borderRadius: AppRadius.xl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Stat(
                  label: context.isAr ? 'دراسات حالة' : 'Case studies',
                  value: '$totalCount',
                ),
                const SizedBox(height: 16),
                _Stat(
                  label: context.isAr ? 'مشاريع رئيسية' : 'Flagship projects',
                  value: '$featuredCount',
                ),
                const SizedBox(height: 16),
                _Stat(
                  label: context.isAr ? 'المنصات' : 'Platforms',
                  value: 'Mobile • Windows • Web',
                ),
              ],
            ),
          );
          if (!wide) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [copy, const SizedBox(height: 24), stats],
            );
          }
          return Row(
            children: [
              Expanded(flex: 6, child: copy),
              const SizedBox(width: 28),
              Expanded(flex: 4, child: stats),
            ],
          );
        },
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.cyan.withOpacity(0.12),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: const Icon(
              Icons.auto_awesome_rounded,
              color: AppColors.cyan,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textMuted,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
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

import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/animated_section.dart';
import '../../../core/widgets/section_container.dart';
import '../../projects/data/projects_data.dart';
import '../../projects/models/project_model.dart';
import '../../projects/widgets/project_card.dart';

class MoreProjectsSection extends StatelessWidget {
  const MoreProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: context.l10n.text('moreProjectsTitle'),
      subtitle: context.l10n.text('moreProjectsSubtitle'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ProjectGroup(
            title: context.l10n.text('mobileApplications'),
            subtitle: context.isAr
                ? 'المشاريع التالية في ترتيب الموبايل المعتمد، مع إبقاء كل تطبيق متاحًا في صفحة المشاريع الكاملة.'
                : 'The remaining mobile work follows the approved priority; every application also remains available on the full Projects page.',
            projects: ProjectsData.moreMobileProjects,
          ),
          const SizedBox(height: 54),
          _ProjectGroup(
            title: context.l10n.text('windowsApplications'),
            subtitle: context.isAr
                ? 'تطبيقات عمليات وفواتير وروشتات مصممة لشاشات الديسكتوب والطباعة.'
                : 'Operations, invoicing, and prescription tools presented with desktop-scale workflows and printing outputs.',
            projects: ProjectsData.windowsProjects,
          ),
          const SizedBox(height: 54),
          _ProjectGroup(
            title: context.l10n.text('webProjects'),
            subtitle: context.isAr
                ? 'واجهات ويب responsive تُعرض داخل browser mockups مع نسخ الديسكتوب والموبايل المتاحة.'
                : 'Responsive web experiences shown in browser mockups with their available desktop and mobile journeys.',
            projects: ProjectsData.webProjects,
          ),
        ],
      ),
    );
  }
}

class _ProjectGroup extends StatelessWidget {
  const _ProjectGroup({
    required this.title,
    required this.subtitle,
    required this.projects,
  });

  final String title;
  final String subtitle;
  final List<ProjectModel> projects;

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 4,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.cyan,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.55,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth > 1050
                ? 3
                : constraints.maxWidth > 700
                    ? 2
                    : 1;
            final totalSpacing = 18.0 * (columns - 1);
            final itemWidth = (constraints.maxWidth - totalSpacing) / columns;
            return Wrap(
              spacing: 18,
              runSpacing: 18,
              children: [
                for (var index = 0; index < projects.length; index++)
                  SizedBox(
                    width: itemWidth,
                    child: AnimatedSection(
                      delay: Duration(milliseconds: index * 55),
                      child: ProjectCard(
                        project: projects[index],
                        compact: true,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

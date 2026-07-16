import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/route_names.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/animated_section.dart';
import '../../../core/widgets/app_outlined_button.dart';
import '../../../core/widgets/section_container.dart';
import '../../projects/data/projects_data.dart';
import '../../projects/widgets/project_card.dart';

class FeaturedProjectsSection extends StatelessWidget {
  const FeaturedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = ProjectsData.featured;
    return SectionContainer(
      title: context.l10n.text('featuredTitle'),
      subtitle: context.l10n.text('featuredSubtitle'),
      headerAction: AppOutlinedButton(
        label: context.l10n.text('allProjects'),
        icon: Icons.grid_view_rounded,
        onPressed: () => context.goNamed(AppRouteNames.projects),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth > 1050 ? 2 : 1;
          final itemWidth = columns == 1 ? constraints.maxWidth : (constraints.maxWidth - 22) / 2;
          return Wrap(
            spacing: 22,
            runSpacing: 22,
            children: [
              for (var index = 0; index < projects.length; index++)
                SizedBox(
                  width: itemWidth,
                  child: AnimatedSection(
                    delay: Duration(milliseconds: index * 80),
                    child: ProjectCard(project: projects[index]),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

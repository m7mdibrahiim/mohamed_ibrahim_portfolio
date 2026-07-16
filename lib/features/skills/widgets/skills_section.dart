import 'package:flutter/material.dart';

import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/animated_section.dart';
import '../../../core/widgets/section_container.dart';
import '../data/skills_data.dart';
import 'skill_group_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = SkillsData.groups;
    return SectionContainer(
      title: context.l10n.text('skillsTitle'),
      subtitle: context.l10n.text('skillsSubtitle'),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth > 1050 ? 3 : constraints.maxWidth > 700 ? 2 : 1;
          final totalSpacing = 18 * (columns - 1);
          final itemWidth = (constraints.maxWidth - totalSpacing) / columns;
          return Wrap(
            spacing: 18,
            runSpacing: 18,
            children: [
              for (var index = 0; index < groups.length; index++)
                SizedBox(
                  width: itemWidth,
                  child: AnimatedSection(
                    delay: Duration(milliseconds: index * 70),
                    child: SkillGroupCard(group: groups[index]),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/technology_chip.dart';
import '../models/skill_group_model.dart';

class SkillGroupCard extends StatelessWidget {
  const SkillGroupCard({super.key, required this.group});

  final SkillGroupModel group;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(18),
      borderRadius: AppRadius.xl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.cyan.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(color: AppColors.cyan.withOpacity(0.25)),
                ),
                child: Icon(group.icon, color: AppColors.cyan),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  group.title(context),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [for (final skill in group.skills) TechnologyChip(label: skill, dense: true)],
          ),
        ],
      ),
    );
  }
}

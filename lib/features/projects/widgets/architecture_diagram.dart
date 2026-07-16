import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/technology_chip.dart';

class ArchitectureDiagram extends StatelessWidget {
  const ArchitectureDiagram({super.key, required this.techStack});

  final List<String> techStack;

  @override
  Widget build(BuildContext context) {
    final labels = [
      ('UI', context.isAr ? 'Widgets + Responsive Screens' : 'Widgets + Responsive Screens'),
      ('State', 'Provider / Bloc'),
      ('Domain', 'Models • Use Cases • Validation'),
      ('Data', 'Repositories • APIs • Services'),
      ('Storage', 'Firebase • Supabase • SQLite • Hive'),
    ];

    return GlassCard(
      padding: const EdgeInsets.all(20),
      borderRadius: AppRadius.xl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final tech in techStack.take(9)) TechnologyChip(label: tech, dense: true),
            ],
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final vertical = constraints.maxWidth < 780;
              final nodes = labels.map((entry) => _Node(title: entry.$1, subtitle: entry.$2)).toList();
              if (vertical) {
                return Column(
                  children: [
                    for (var i = 0; i < nodes.length; i++) ...[
                      nodes[i],
                      if (i != nodes.length - 1) const _Arrow(vertical: true),
                    ],
                  ],
                );
              }
              return Row(
                children: [
                  for (var i = 0; i < nodes.length; i++) ...[
                    Expanded(child: nodes[i]),
                    if (i != nodes.length - 1) const _Arrow(vertical: false),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Node extends StatelessWidget {
  const _Node({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 90),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface2.withOpacity(0.78),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.borderStrong),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.cyan,
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.45,
                ),
          ),
        ],
      ),
    );
  }
}

class _Arrow extends StatelessWidget {
  const _Arrow({required this.vertical});

  final bool vertical;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: vertical ? 0 : 8, vertical: vertical ? 10 : 0),
      child: Icon(
        vertical ? Icons.keyboard_arrow_down_rounded : Icons.chevron_right_rounded,
        color: AppColors.cyan,
      ),
    );
  }
}

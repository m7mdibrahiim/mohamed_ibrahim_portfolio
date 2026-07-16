import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/section_container.dart';
import '../../../core/widgets/technology_chip.dart';

class TechStrip extends StatelessWidget {
  const TechStrip({super.key});

  static const _tech = ['Flutter', 'Dart', 'Firebase', 'Supabase', 'REST APIs', 'Paymob', 'Stripe', 'PayPal', 'Bloc', 'Provider', 'SQLite', 'Hive', 'MVVM', 'Clean Architecture'];

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      topPadding: 0,
      bottomPadding: context.isMobile ? 50 : 70,
      child: GlassCard(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            if (!context.isMobile) ...[
              const Icon(Icons.bolt_rounded, color: AppColors.cyan),
              const SizedBox(width: 12),
              SizedBox(
                width: 230,
                child: Text(
                  context.l10n.text('techStripTitle'),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
              const SizedBox(width: 18),
            ],
            Expanded(
              child: Wrap(
                spacing: 9,
                runSpacing: 9,
                children: [for (final tech in _tech) TechnologyChip(label: tech, dense: true, highlight: tech == 'Flutter')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

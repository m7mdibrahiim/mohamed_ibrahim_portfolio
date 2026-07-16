import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/section_container.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      _ProcessStep('Understand', 'فهم', 'Understand the product idea, users, business goals, and core app flows.', 'فهم الفكرة، المستخدمين، أهداف المنتج، ومسارات التطبيق الأساسية.', Icons.psychology_rounded),
      _ProcessStep('Structure', 'تخطيط', 'Plan screens, user flows, responsive layouts, and reusable components.', 'تخطيط الشاشات، تجربة المستخدم، التصميم responsive، والمكونات القابلة لإعادة الاستخدام.', Icons.dashboard_customize_rounded),
      _ProcessStep('Architect', 'معمارية', 'Build clean layers for UI, state management, repositories, APIs, local storage, and services.', 'بناء طبقات منظمة للواجهة، إدارة الحالة، repositories، APIs، التخزين المحلي، والخدمات.', Icons.account_tree_rounded),
      _ProcessStep('Integrate', 'تكامل', 'Connect Firebase, REST APIs, payments, authentication, databases, and external services.', 'ربط Firebase، REST APIs، أنظمة الدفع، المصادقة، قواعد البيانات، والخدمات الخارجية.', Icons.hub_rounded),
      _ProcessStep('Polish', 'تحسين', 'Add animations, optimize performance, improve UX, and test across multiple screen sizes.', 'إضافة الأنيميشن، تحسين الأداء، تحسين تجربة المستخدم، والاختبار على أحجام شاشات مختلفة.', Icons.auto_awesome_rounded),
      _ProcessStep('Ship', 'تسليم', 'Prepare release builds, web deployments, APK delivery, and final handoff.', 'تجهيز نسخ release، نشر الويب، تسليم APK، والتسليم النهائي للمشروع.', Icons.rocket_launch_rounded),
    ];

    return SectionContainer(
      title: context.l10n.text('processTitle'),
      subtitle: context.l10n.text('processSubtitle'),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final vertical = constraints.maxWidth < 850;
          if (vertical) {
            return Column(
              children: [for (var i = 0; i < steps.length; i++) _ProcessCard(step: steps[i], index: i, vertical: true)],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < steps.length; i++)
                Expanded(child: _ProcessCard(step: steps[i], index: i, vertical: false)),
            ],
          );
        },
      ),
    );
  }
}

class _ProcessStep {
  const _ProcessStep(this.titleEn, this.titleAr, this.bodyEn, this.bodyAr, this.icon);
  final String titleEn;
  final String titleAr;
  final String bodyEn;
  final String bodyAr;
  final IconData icon;
}

class _ProcessCard extends StatelessWidget {
  const _ProcessCard({required this.step, required this.index, required this.vertical});

  final _ProcessStep step;
  final int index;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    final isAr = context.isAr;
    return Padding(
      padding: EdgeInsets.only(
        right: !vertical && !isAr ? 12 : 0,
        left: !vertical && isAr ? 12 : 0,
        bottom: vertical ? 12 : 0,
      ),
      child: GlassCard(
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
                    border: Border.all(color: AppColors.cyan.withOpacity(0.28)),
                  ),
                  child: Icon(step.icon, color: AppColors.cyan),
                ),
                const SizedBox(width: 12),
                Text(
                  '${index + 1}'.padLeft(2, '0'),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              isAr ? step.titleAr : step.titleEn,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            Text(
              isAr ? step.bodyAr : step.bodyEn,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

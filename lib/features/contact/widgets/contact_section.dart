import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/constants/app_links.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/section_container.dart';
import '../../../core/services/url_launcher_service.dart';
import 'contact_card.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      topPadding: context.isMobile ? 70 : 96,
      bottomPadding: context.isMobile ? 70 : 96,
      child: GlassCard(
        padding: EdgeInsets.all(context.isMobile ? 22 : 34),
        borderRadius: AppRadius.xxl,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth > 860;
            final intro = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.11),
                    borderRadius: BorderRadius.circular(AppRadius.xl),
                    border: Border.all(color: AppColors.success.withOpacity(0.25)),
                  ),
                  child: Text(
                    context.l10n.text('availableFor'),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  context.l10n.text('contactTitle'),
                  style: AppTextStyles.sectionTitle(context).copyWith(fontSize: context.isMobile ? 32 : 46),
                ),
                const SizedBox(height: 14),
                Text(context.l10n.text('contactText'), style: AppTextStyles.body(context)),
                const SizedBox(height: 20),
                Text(
                  context.l10n.text('privacyNote'),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted, height: 1.5),
                ),
                const SizedBox(height: 24),
                GradientButton(
                  label: context.l10n.text('emailMe'),
                  icon: Icons.mail_rounded,
                  isExpanded: context.isMobile,
                  onPressed: () => UrlLauncherService.open(AppLinks.email, context: context),
                ),
              ],
            );
            final cards = Column(
              children: [
                ContactCard(label: context.l10n.text('emailMe'), value: 'm7mdibrahiim7@gmail.com', icon: Icons.mail_rounded, url: AppLinks.email),
                const SizedBox(height: 12),
                ContactCard(label: context.l10n.text('linkedin'), value: 'mohamed-ibrahim-305550318', icon: Icons.business_center_rounded, url: AppLinks.linkedin),
                const SizedBox(height: 12),
                ContactCard(label: context.l10n.text('github'), value: 'github.com/m7mdibrahiim', icon: Icons.code_rounded, url: AppLinks.github),
                const SizedBox(height: 12),
                ContactCard(label: context.l10n.text('behance'), value: 'behance.net/mohamedibrahiim', icon: Icons.palette_rounded, url: AppLinks.behance),
              ],
            );
            if (!wide) {
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [intro, const SizedBox(height: 28), cards]);
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: intro),
                const SizedBox(width: 34),
                Expanded(flex: 4, child: cards),
              ],
            );
          },
        ),
      ),
    );
  }
}

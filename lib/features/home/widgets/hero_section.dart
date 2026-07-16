import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_durations.dart';
import '../../../app/theme/app_shadows.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/constants/app_links.dart';
import '../../../core/layout/app_navbar_metrics.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/services/url_launcher_service.dart';
import '../../../core/widgets/app_outlined_button.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/responsive_action_group.dart';
import '../../../core/widgets/section_container.dart';
import '../../../core/widgets/technology_chip.dart';
import 'hero_visual.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    return SectionContainer(
      topPadding: AppNavbarMetrics.firstSectionTopPadding(context),
      bottomPadding: isMobile ? 56 : 92,
      maxWidth: 1260,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final split = constraints.maxWidth > 960;
          final text = _HeroText(
            onProjectsTap: onProjectsTap,
            onContactTap: onContactTap,
          );
          const visual = HeroVisual();

          if (!split) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text,
                SizedBox(height: context.isTinyPhone ? 34 : 46),
                const Center(child: visual),
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 6, child: text),
              const SizedBox(width: 44),
              const Expanded(flex: 5, child: Center(child: visual)),
            ],
          );
        },
      ),
    );
  }
}

class _HeroText extends StatefulWidget {
  const _HeroText({required this.onProjectsTap, required this.onContactTap});

  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  @override
  State<_HeroText> createState() => _HeroTextState();
}

class _HeroTextState extends State<_HeroText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.heroEntrance,
    )..forward();
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.032),
      end: Offset.zero,
    ).animate(_fade);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isMobile = context.isMobile;
    final stats = [
      l10n.text('statProjects'),
      l10n.text('statPlatforms'),
      l10n.text('statIntegrations'),
      l10n.text('statArchitecture'),
    ];

    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _AvailabilityPill(label: l10n.text('openTo')),
            SizedBox(height: context.isSmallMobile ? 20 : 26),
            Text(
              l10n.text('heroName'),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.cyan,
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 7),
            Text(
              l10n.text('heroRole'),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            SizedBox(height: context.isSmallMobile ? 16 : 20),
            ShaderMask(
              shaderCallback: (rect) => const LinearGradient(
                colors: [Colors.white, AppColors.cyan, AppColors.violet],
              ).createShader(rect),
              child: Text(
                l10n.text('heroHeadline'),
                style: AppTextStyles.hero(context).copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 690),
              child: Text(
                l10n.text('heroDescription'),
                style: AppTextStyles.body(context),
              ),
            ),
            SizedBox(height: isMobile ? 24 : 30),
            ResponsiveActionGroup(
              stackBelow: 600,
              children: [
                GradientButton(
                  label: l10n.text('viewProjects'),
                  icon: Icons.auto_awesome_rounded,
                  onPressed: widget.onProjectsTap,
                ),
                AppOutlinedButton(
                  label: l10n.text('downloadCv'),
                  icon: Icons.download_rounded,
                  onPressed: () => UrlLauncherService.open(
                    AppLinks.cvWebPath,
                    context: context,
                  ),
                ),
                AppOutlinedButton(
                  label: l10n.text('contactMe'),
                  icon: Icons.mail_rounded,
                  onPressed: widget.onContactTap,
                ),
              ],
            ),
            const SizedBox(height: 26),
            Wrap(
              spacing: 9,
              runSpacing: 9,
              children: [
                for (final stat in stats)
                  TechnologyChip(
                    label: stat,
                    dense: context.isSmallMobile,
                    highlight: stat == stats.first,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AvailabilityPill extends StatefulWidget {
  const _AvailabilityPill({required this.label});

  final String label;

  @override
  State<_AvailabilityPill> createState() => _AvailabilityPillState();
}

class _AvailabilityPillState extends State<_AvailabilityPill>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1900),
    );
    _pulse = Tween<double>(begin: 0.58, end: 1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.of(context).disableAnimations) {
      _pulseController.stop();
    } else if (!_pulseController.isAnimating) {
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: context.isMobile
            ? MediaQuery.sizeOf(context).width -
                (context.horizontalPadding * 2)
            : 360,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.success.withOpacity(0.34)),
        boxShadow: AppShadows.glow(
          color: AppColors.success,
          opacity: 0.045,
          soft: true,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeTransition(
            opacity: _pulse,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.success,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 9),
          Flexible(
            child: Text(
              widget.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

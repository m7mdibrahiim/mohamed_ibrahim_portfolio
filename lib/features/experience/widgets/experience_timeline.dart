import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/animated_section.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/section_container.dart';
import '../../../core/widgets/technology_chip.dart';
import '../data/experience_data.dart';
import '../models/experience_model.dart';

class ExperienceTimeline extends StatelessWidget {
  const ExperienceTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final roles = ExperienceData.roles;
    return SectionContainer(
      title: context.l10n.text('experienceTitle'),
      subtitle: context.l10n.text('experienceSubtitle'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < roles.length; i++)
            AnimatedSection(
              delay: Duration(milliseconds: i * 80),
              child: _TimelineItem(
                role: roles[i],
                isLast: i == roles.length - 1,
              ),
            ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.role, required this.isLast});

  final ExperienceModel role;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final isCompact = context.screenWidth < 376;
    final railWidth = isCompact ? 34.0 : context.isMobile ? 42.0 : 62.0;
    final cardPadding = isCompact ? 15.0 : context.isMobile ? 18.0 : 22.0;

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 18),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PositionedDirectional(
            start: 0,
            top: 0,
            bottom: 0,
            width: railWidth,
            child: CustomPaint(
              painter: _TimelineRailPainter(isLast: isLast),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: railWidth),
            child: GlassCard(
              padding: EdgeInsets.all(cardPadding),
              borderRadius: AppRadius.xl,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      TechnologyChip(
                        label: role.period,
                        highlight: true,
                        dense: true,
                      ),
                      TechnologyChip(label: role.company, dense: true),
                    ],
                  ),
                  SizedBox(height: isCompact ? 12 : 14),
                  Text(
                    '${role.role(context)} — ${role.company}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: isCompact ? 20 : null,
                          height: isCompact ? 1.2 : null,
                          fontWeight: FontWeight.w900,
                          letterSpacing: context.isAr ? null : -0.4,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    role.summary(context),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: isCompact ? 14 : null,
                          color: AppColors.textSecondary,
                          height: 1.58,
                        ),
                  ),
                  const SizedBox(height: 14),
                  for (final bullet in role.bullets(context))
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Icon(
                              Icons.circle,
                              color: AppColors.teal,
                              size: 7,
                            ),
                          ),
                          const SizedBox(width: 9),
                          Expanded(
                            child: Text(
                              bullet,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: isCompact ? 13 : null,
                                    color: AppColors.textSecondary,
                                    height: 1.52,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final tech in role.techStack)
                        TechnologyChip(label: tech, dense: true),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineRailPainter extends CustomPainter {
  const _TimelineRailPainter({required this.isLast});

  final bool isLast;

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    const dotRadius = 9.0;
    const dotCenterY = 10.0;

    if (!isLast) {
      final linePaint = Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.cyan, AppColors.violet],
        ).createShader(
          Rect.fromLTWH(centerX - 1, dotCenterY + dotRadius + 7, 2, size.height),
        )
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(
        Offset(centerX, dotCenterY + dotRadius + 7),
        Offset(centerX, size.height + 18),
        linePaint,
      );
    }

    final glowPaint = Paint()
      ..color = AppColors.cyan.withOpacity(0.22)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    canvas.drawCircle(Offset(centerX, dotCenterY), dotRadius + 5, glowPaint);
    canvas.drawCircle(
      Offset(centerX, dotCenterY),
      dotRadius,
      Paint()..color = AppColors.cyan,
    );
  }

  @override
  bool shouldRepaint(covariant _TimelineRailPainter oldDelegate) =>
      oldDelegate.isLast != isLast;
}

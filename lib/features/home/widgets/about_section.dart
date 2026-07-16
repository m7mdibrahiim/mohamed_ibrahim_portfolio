import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/loading_image.dart';
import '../../../core/widgets/section_container.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final highlights = [
      (
        Icons.devices_rounded,
        context.isAr ? 'تطوير متعدد المنصات' : 'Cross-platform development'
      ),
      (
        Icons.account_tree_rounded,
        context.isAr ? 'Clean Architecture' : 'Clean architecture'
      ),
      (
        Icons.cloud_sync_rounded,
        context.isAr ? 'Firebase & APIs' : 'Firebase & APIs'
      ),
      (
        Icons.payments_rounded,
        context.isAr
            ? 'Payments & production features'
            : 'Payments & production features'
      ),
    ];

    return SectionContainer(
      title: context.l10n.text('aboutTitle'),
      subtitle: context.l10n.text('aboutSubtitle'),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth > 840;
          final photo =
              _PhotoFrame(isCompact: !wide, maxWidth: constraints.maxWidth);
          final body = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.l10n.text('aboutBody'),
                  style: AppTextStyles.body(context)),
              const SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: highlights.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: wide ? 2 : 1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: context.isSmallMobile ? 82 : 76,
                ),
                itemBuilder: (context, index) {
                  final item = highlights[index];
                  return GlassCard(
                    padding: const EdgeInsets.all(16),
                    borderRadius: AppRadius.lg,
                    child: Row(
                      children: [
                        Icon(item.$1, color: AppColors.cyan),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item.$2,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              const GlassCard(
                padding: const EdgeInsets.all(8),
                borderRadius: AppRadius.xl,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: LoadingImage(
                    assetPath: AppAssets.flutterCapability,
                    fit: BoxFit.contain,
                    borderRadius: AppRadius.lg,
                    semanticLabel: 'Flutter capability presentation',
                  ),
                ),
              ),
            ],
          );

          if (!wide) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [photo, const SizedBox(height: 24), body],
            );
          }
          return Row(
            children: [
              Expanded(flex: 4, child: photo),
              const SizedBox(width: 32),
              Expanded(flex: 6, child: body),
            ],
          );
        },
      ),
    );
  }
}

class _PhotoFrame extends StatelessWidget {
  const _PhotoFrame({required this.isCompact, required this.maxWidth});

  final bool isCompact;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final width = isCompact
        ? math.min(context.isTinyPhone ? 238.0 : 280.0,
            math.max(210.0, maxWidth - 24.0))
        : 360.0;
    final height = width * 1.28;
    return Center(
      child: SizedBox(
        width: width + 20,
        height: height + 20,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.xxl),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.cyan
                            .withOpacity(context.isMobile ? 0.10 : 0.18),
                        blurRadius: context.isMobile ? 46 : 70),
                    BoxShadow(
                        color: AppColors.violet
                            .withOpacity(context.isMobile ? 0.10 : 0.16),
                        blurRadius: context.isMobile ? 46 : 70),
                  ],
                ),
              ),
            ),
            GlassCard(
              padding: const EdgeInsets.all(10),
              borderRadius: AppRadius.xxl,
              child: LoadingImage(
                assetPath: AppAssets.profilePhoto,
                width: width,
                height: height,
                fit: BoxFit.cover,
                borderRadius: AppRadius.xl,
                semanticLabel: 'Mohamed Ibrahim portrait',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

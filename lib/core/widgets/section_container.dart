import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_text_styles.dart';
import '../responsive/breakpoints.dart';
import '../responsive/context_extensions.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    this.title,
    this.subtitle,
    required this.child,
    this.maxWidth = AppBreakpoints.maxContent,
    this.topPadding,
    this.bottomPadding,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.headerAction,
  });

  final String? title;
  final String? subtitle;
  final Widget child;
  final double maxWidth;
  final double? topPadding;
  final double? bottomPadding;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget? headerAction;

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final top = topPadding ?? (isMobile ? AppSpacing.sectionMobile : AppSpacing.section);
    final bottom = bottomPadding ?? (isMobile ? AppSpacing.sectionMobile : AppSpacing.section);

    return Padding(
      padding: EdgeInsets.only(top: top, bottom: bottom),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.horizontalPadding),
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              children: [
                if (title != null || subtitle != null || headerAction != null) ...[
                  _SectionHeader(
                    title: title,
                    subtitle: subtitle,
                    headerAction: headerAction,
                    crossAxisAlignment: crossAxisAlignment,
                  ),
                  SizedBox(height: isMobile ? 26 : 34),
                ],
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.subtitle,
    required this.headerAction,
    required this.crossAxisAlignment,
  });

  final String? title;
  final String? subtitle;
  final Widget? headerAction;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final text = Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (title != null)
          Text(
            title!,
            style: AppTextStyles.sectionTitle(context),
          ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Text(
              subtitle!,
              style: AppTextStyles.body(context).copyWith(color: AppColors.textSecondary),
            ),
          ),
        ],
      ],
    );

    if (headerAction == null) return text;
    if (context.isMobile) {
      return Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          text,
          const SizedBox(height: 18),
          Align(
            alignment: context.isAr ? Alignment.centerRight : Alignment.centerLeft,
            child: headerAction,
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(child: text),
        const SizedBox(width: 18),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: headerAction!,
        ),
      ],
    );
  }
}

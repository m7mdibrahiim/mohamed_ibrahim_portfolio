import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_radius.dart';
import '../../app/theme/app_spacing.dart';
import '../responsive/context_extensions.dart';
import 'profile_avatar.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final identity = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ProfileAvatar(size: 32),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            context.l10n.text('footerText'),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w700,
                  height: 1.45,
                ),
          ),
        ),
      ],
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.horizontalPadding,
        AppSpacing.xl,
        context.horizontalPadding,
        AppSpacing.xl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.isTinyPhone ? 14 : 20,
              vertical: 18,
            ),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.border)),
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 620) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      identity,
                      const SizedBox(height: 12),
                      Text(
                        'Flutter Web',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: AppColors.cyan,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ],
                  );
                }
                return Row(
                  children: [
                    Expanded(child: identity),
                    const SizedBox(width: 16),
                    Text(
                      'Flutter Web',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.cyan,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

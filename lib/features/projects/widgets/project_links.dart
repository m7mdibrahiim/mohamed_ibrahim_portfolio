import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/services/url_launcher_service.dart';
import '../../../core/widgets/app_outlined_button.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/responsive_action_group.dart';
import '../models/project_link_model.dart';
import '../models/project_model.dart';
import 'project_showcase_launcher.dart';

class ProjectLinks extends StatelessWidget {
  const ProjectLinks({
    super.key,
    required this.project,
    this.compact = false,
    this.primaryFirst = true,
  });

  final ProjectModel project;
  final bool compact;
  final bool primaryFirst;

  @override
  Widget build(BuildContext context) {
    final links = project.visibleLinks;
    if (links.isEmpty && !project.hasShowcase) {
      return Text(
        context.l10n.text('sourcePrivate'),
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.textMuted),
      );
    }

    final actions = <Widget>[
      for (var index = 0; index < links.length; index++)
        _ProjectLinkButton(
          link: links[index],
          isPrimary: primaryFirst && index == 0,
          compact: compact,
        ),
      if (project.hasShowcase)
        ProjectShowcaseLauncher(
          project: project,
          primary: primaryFirst && links.isEmpty,
        ),
    ];

    return ResponsiveActionGroup(
      stackBelow: 560,
      spacing: 10,
      runSpacing: 10,
      maxWideChildWidth: 360,
      children: actions,
    );
  }
}

class _ProjectLinkButton extends StatelessWidget {
  const _ProjectLinkButton({
    required this.link,
    required this.isPrimary,
    required this.compact,
  });

  final ProjectLinkModel link;
  final bool isPrimary;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final label = context.isAr ? link.labelAr : link.labelEn;
    final icon = switch (link.type) {
      ProjectLinkType.apk => Icons.android_rounded,
      ProjectLinkType.website => Icons.open_in_new_rounded,
      ProjectLinkType.github => Icons.code_rounded,
      ProjectLinkType.demo => Icons.play_circle_fill_rounded,
      ProjectLinkType.file => Icons.archive_rounded,
    };

    final effectiveLabel = compact ? _compactLabel(context, link) : label;
    if (isPrimary) {
      return GradientButton(
        label: effectiveLabel,
        icon: icon,
        onPressed: () => UrlLauncherService.open(link.url, context: context),
      );
    }
    return AppOutlinedButton(
      label: effectiveLabel,
      icon: icon,
      onPressed: () => UrlLauncherService.open(link.url, context: context),
    );
  }

  String _compactLabel(BuildContext context, ProjectLinkModel link) {
    return switch (link.type) {
      ProjectLinkType.apk => context.l10n.text('downloadApk'),
      ProjectLinkType.website => context.l10n.text('visitWebsite'),
      ProjectLinkType.github => context.l10n.text('viewGithub'),
      ProjectLinkType.demo => context.l10n.text('watchDemo'),
      ProjectLinkType.file => context.l10n.text('downloadFile'),
    };
  }
}

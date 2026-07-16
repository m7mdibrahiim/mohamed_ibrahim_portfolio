import 'package:flutter/material.dart';

import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/app_outlined_button.dart';
import '../../../core/widgets/gradient_button.dart';
import '../models/project_model.dart';
import 'project_showcase_dialog.dart';

class ProjectShowcaseLauncher extends StatelessWidget {
  const ProjectShowcaseLauncher({
    super.key,
    required this.project,
    this.primary = false,
  });

  final ProjectModel project;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    if (!project.hasShowcase) return const SizedBox.shrink();

    final label = context.l10n.text('watchShowcase');
    final onPressed = () => ProjectShowcaseDialog.show(
          context,
          project: project,
        );

    if (primary) {
      return GradientButton(
        label: label,
        icon: Icons.play_circle_fill_rounded,
        onPressed: onPressed,
      );
    }
    return AppOutlinedButton(
      label: label,
      icon: Icons.play_circle_fill_rounded,
      onPressed: onPressed,
    );
  }
}

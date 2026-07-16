import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/loading_image.dart';
import '../models/project_model.dart';
import 'cinematic_project_showcase.dart';
import 'project_video_surface.dart';

class ProjectShowcaseDialog extends StatefulWidget {
  const ProjectShowcaseDialog({
    super.key,
    required this.project,
  });

  final ProjectModel project;

  static Future<void> show(
    BuildContext context, {
    required ProjectModel project,
  }) {
    return showGeneralDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Project showcase',
      barrierColor: Colors.black.withOpacity(0.82),
      transitionDuration: const Duration(milliseconds: 240),
      pageBuilder: (_, __, ___) => ProjectShowcaseDialog(project: project),
      transitionBuilder: (_, animation, __, child) => FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.985, end: 1).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
          ),
          child: child,
        ),
      ),
    );
  }

  @override
  State<ProjectShowcaseDialog> createState() => _ProjectShowcaseDialogState();
}

class _ProjectShowcaseDialogState extends State<ProjectShowcaseDialog> {
  bool _playRequested = false;
  bool _videoFailed = false;

  @override
  void didUpdateWidget(covariant ProjectShowcaseDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.project.id != widget.project.id ||
        oldWidget.project.showcaseVideoPath !=
            widget.project.showcaseVideoPath) {
      _playRequested = false;
      _videoFailed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final size = MediaQuery.sizeOf(context);
    final compact = size.width < 600;
    final poster = project.showcasePosterPath?.trim();

    return Material(
      color: Colors.transparent,
      child: CallbackShortcuts(
        bindings: <ShortcutActivator, VoidCallback>{
          const SingleActivator(LogicalKeyboardKey.escape): () {
            if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          },
        },
        child: Focus(
          autofocus: true,
          child: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 1180,
                  maxHeight: size.height * 0.92,
                ),
                child: Container(
                  margin: EdgeInsets.all(compact ? 10 : 24),
                  padding: EdgeInsets.all(compact ? 12 : 18),
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldDeep,
                    borderRadius: BorderRadius.circular(AppRadius.xxl),
                    border: Border.all(color: AppColors.borderStrong),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.55),
                        blurRadius: 48,
                        offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  project.title(context),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w900),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  context.l10n.text('showcaseTitle'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: AppColors.textMuted),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            tooltip: context.l10n.text('closePreview'),
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.close_rounded),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Flexible(
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(AppRadius.xl),
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Color(0xFF040A14),
                              ),
                              child: _buildMedia(project, poster),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMedia(ProjectModel project, String? poster) {
    final canUseVideo = kIsWeb &&
        project.showcaseType == ProjectShowcaseType.video &&
        (project.showcaseVideoPath?.trim().isNotEmpty ?? false);

    if (_videoFailed || !canUseVideo) {
      return CinematicProjectShowcase(project: project);
    }

    if (!_playRequested) {
      return Column(
        children: [
          Expanded(
            child: poster != null && poster.isNotEmpty
                ? LoadingImage(
                    assetPath: poster,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    borderRadius: 0,
                    backgroundColor: const Color(0xFF040A14),
                  )
                : CinematicProjectShowcase(
                    project: project,
                    interactive: false,
                  ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: const Color(0xFF07101D),
            alignment: AlignmentDirectional.centerEnd,
            child: FilledButton.icon(
              key: ValueKey<String>('play-showcase-${project.id}'),
              onPressed: () => setState(() => _playRequested = true),
              icon: const Icon(Icons.play_arrow_rounded),
              label: Text(context.l10n.text('playShowcase')),
            ),
          ),
        ],
      );
    }

    return ProjectVideoSurface(
      key: ValueKey<String>(
        '${project.id}-${project.showcaseVideoPath}',
      ),
      videoPath: project.showcaseVideoPath!,
      posterPath: poster,
      loadingLabel: context.l10n.text('showcaseLoading'),
      onError: () {
        if (mounted) setState(() => _videoFailed = true);
      },
    );
  }
}

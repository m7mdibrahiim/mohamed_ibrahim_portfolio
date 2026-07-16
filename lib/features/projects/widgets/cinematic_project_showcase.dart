import 'dart:async';

import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/loading_image.dart';
import '../models/project_model.dart';

class CinematicProjectShowcase extends StatefulWidget {
  const CinematicProjectShowcase({
    super.key,
    required this.project,
    this.interactive = true,
  });

  final ProjectModel project;
  final bool interactive;

  @override
  State<CinematicProjectShowcase> createState() =>
      _CinematicProjectShowcaseState();
}

class _CinematicProjectShowcaseState
    extends State<CinematicProjectShowcase> {
  Timer? _timer;
  int _index = 0;
  bool _paused = false;

  List<String> get _slides => widget.project.effectiveShowcaseSlides;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _restartTimer();
  }

  @override
  void didUpdateWidget(covariant CinematicProjectShowcase oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.project.id != widget.project.id ||
        oldWidget.interactive != widget.interactive) {
      _index = 0;
      _paused = false;
      _restartTimer();
    }
  }

  void _restartTimer() {
    _timer?.cancel();
    if (!widget.interactive ||
        _paused ||
        _slides.length < 2 ||
        MediaQuery.of(context).disableAnimations) {
      return;
    }
    _timer = Timer.periodic(const Duration(milliseconds: 3600), (_) {
      if (!mounted || _slides.isEmpty) return;
      setState(() => _index = (_index + 1) % _slides.length);
    });
  }

  void _setIndex(int value) {
    if (_slides.isEmpty) return;
    setState(() => _index = (value + _slides.length) % _slides.length);
    _restartTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slides = _slides;
    if (slides.isEmpty) {
      return Center(
        child: Text(
          context.l10n.text('visualUnavailable'),
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.textMuted),
        ),
      );
    }

    final safeIndex = _index.clamp(0, slides.length - 1).toInt();
    final captions = widget.project.showcaseCaptions(context);
    final mediaCaption =
        widget.project.mediaItemFor(slides[safeIndex])?.caption(context).trim();
    final caption = captions.isNotEmpty
        ? captions[safeIndex.clamp(0, captions.length - 1).toInt()]
        : (mediaCaption?.isNotEmpty ?? false)
            ? mediaCaption!
            : widget.project.shortDescription(context);

    return Column(
      children: [
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 520),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.015, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
            child: LoadingImage(
              key: ValueKey<String>(
                'cinematic-${widget.project.id}-$safeIndex-${slides[safeIndex]}',
              ),
              assetPath: slides[safeIndex],
              fit: BoxFit.contain,
              alignment: Alignment.center,
              borderRadius: 0,
              backgroundColor: const Color(0xFF040A14),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: context.isTinyPhone ? 10 : 14,
            vertical: context.isTinyPhone ? 8 : 10,
          ),
          color: const Color(0xFF07101D),
          child: Row(
            children: [
              if (widget.interactive && slides.length > 1) ...[
                IconButton(
                  tooltip: context.l10n.text('previousImage'),
                  onPressed: () => _setIndex(safeIndex - 1),
                  icon: Icon(
                    context.isAr
                        ? Icons.chevron_right_rounded
                        : Icons.chevron_left_rounded,
                  ),
                ),
                IconButton(
                  tooltip: _paused ? 'Play' : 'Pause',
                  onPressed: () {
                    setState(() => _paused = !_paused);
                    _restartTimer();
                  },
                  icon: Icon(
                    _paused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                  ),
                ),
              ],
              Expanded(
                child: Text(
                  caption,
                  maxLines: context.isTinyPhone ? 2 : 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: context.isAr ? TextAlign.right : TextAlign.left,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textPrimary,
                        height: 1.35,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              if (slides.length > 1) ...[
                const SizedBox(width: 10),
                Text(
                  context.isAr
                      ? '${safeIndex + 1} من ${slides.length}'
                      : '${safeIndex + 1} / ${slides.length}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                if (widget.interactive)
                  IconButton(
                    tooltip: context.l10n.text('nextImage'),
                    onPressed: () => _setIndex(safeIndex + 1),
                    icon: Icon(
                      context.isAr
                          ? Icons.chevron_left_rounded
                          : Icons.chevron_right_rounded,
                    ),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

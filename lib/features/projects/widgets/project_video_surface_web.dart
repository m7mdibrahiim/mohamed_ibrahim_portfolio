import 'dart:async';
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class ProjectVideoSurface extends StatefulWidget {
  const ProjectVideoSurface({
    super.key,
    required this.videoPath,
    required this.loadingLabel,
    required this.onError,
    this.posterPath,
  });

  final String videoPath;
  final String? posterPath;
  final String loadingLabel;
  final VoidCallback onError;

  @override
  State<ProjectVideoSurface> createState() => _ProjectVideoSurfaceState();
}

class _ProjectVideoSurfaceState extends State<ProjectVideoSurface> {
  html.VideoElement? _video;
  StreamSubscription<html.Event>? _canPlaySubscription;
  StreamSubscription<html.Event>? _errorSubscription;
  String _viewType = '';
  bool _loading = true;
  bool _reportedError = false;

  @override
  void initState() {
    super.initState();
    _createVideoElement();
  }

  @override
  void didUpdateWidget(covariant ProjectVideoSurface oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoPath != widget.videoPath ||
        oldWidget.posterPath != widget.posterPath) {
      _replaceVideoElement();
    }
  }

  void _replaceVideoElement() {
    _disposeVideoElement();
    _loading = true;
    _reportedError = false;
    _createVideoElement();
    if (mounted) setState(() {});
  }

  void _createVideoElement() {
    _viewType =
        'project-showcase-${identityHashCode(this)}-${DateTime.now().microsecondsSinceEpoch}';

    final video = html.VideoElement()
      ..src = _assetUrl(widget.videoPath)
      ..controls = true
      ..autoplay = false
      ..muted = true
      ..preload = 'metadata'
      ..setAttribute('playsinline', 'true')
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.objectFit = 'contain'
      ..style.backgroundColor = '#040A14';

    final poster = widget.posterPath?.trim();
    if (poster != null && poster.isNotEmpty) {
      video.poster = _assetUrl(poster);
    }

    _canPlaySubscription = video.onCanPlay.listen((_) {
      if (mounted) setState(() => _loading = false);
    });
    _errorSubscription = video.onError.listen((_) => _reportError());

    ui_web.platformViewRegistry.registerViewFactory(
      _viewType,
      (_) => video,
    );
    _video = video;
  }

  String _assetUrl(String assetKey) {
    final normalized =
        assetKey.startsWith('/') ? assetKey.substring(1) : assetKey;
    return Uri.base.resolve('assets/$normalized').toString();
  }

  void _reportError() {
    if (_reportedError) return;
    _reportedError = true;
    widget.onError();
  }

  void _disposeVideoElement() {
    unawaited(_canPlaySubscription?.cancel());
    unawaited(_errorSubscription?.cancel());
    _canPlaySubscription = null;
    _errorSubscription = null;

    final video = _video;
    _video = null;
    if (video == null) return;
    video.pause();
    video.removeAttribute('src');
    video.load();
    video.remove();
  }

  @override
  void dispose() {
    _disposeVideoElement();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        HtmlElementView(
          key: ValueKey<String>(_viewType),
          viewType: _viewType,
        ),
        if (_loading)
          ColoredBox(
            color: const Color(0xFF040A14),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(color: AppColors.cyan),
                  const SizedBox(height: 12),
                  Text(
                    widget.loadingLabel,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

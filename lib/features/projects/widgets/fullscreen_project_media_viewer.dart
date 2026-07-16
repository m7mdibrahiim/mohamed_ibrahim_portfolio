import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_durations.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/loading_image.dart';
import '../models/project_model.dart';

class FullscreenProjectMediaViewer extends StatefulWidget {
  const FullscreenProjectMediaViewer({
    super.key,
    required this.project,
    this.mediaItems = const <ProjectMediaItem>[],
    this.images = const <String>[],
    this.initialIndex = 0,
  });

  final ProjectModel project;
  final List<ProjectMediaItem> mediaItems;

  /// Compatibility input for tests and legacy callers.
  final List<String> images;
  final int initialIndex;

  @override
  State<FullscreenProjectMediaViewer> createState() =>
      _FullscreenProjectMediaViewerState();
}

class _FullscreenProjectMediaViewerState
    extends State<FullscreenProjectMediaViewer> {
  late PageController _controller;
  late int _index;

  List<ProjectMediaItem> get _items {
    final explicit = widget.mediaItems
        .where((item) => item.path.trim().isNotEmpty)
        .toList(growable: false);
    if (explicit.isNotEmpty) return explicit;
    return widget.images
        .map((path) => path.trim())
        .where((path) => path.isNotEmpty)
        .indexed
        .map(
          (entry) => ProjectMediaItem(
            path: entry.$2,
            kind: widget.project.mediaKindFor(entry.$2),
            captionEn: '',
            captionAr: '',
            workflowOrder: entry.$1 + 1,
          ),
        )
        .toList(growable: false);
  }

  @override
  void initState() {
    super.initState();
    _index = _safeIndex(widget.initialIndex, _items.length);
    _controller = PageController(initialPage: _index);
  }

  @override
  void didUpdateWidget(covariant FullscreenProjectMediaViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldPaths = <String>[
      ...oldWidget.mediaItems.map((item) => item.path),
      ...oldWidget.images,
    ];
    final newPaths = <String>[
      ...widget.mediaItems.map((item) => item.path),
      ...widget.images,
    ];
    if (oldWidget.project.id == widget.project.id &&
        oldPaths.join('|') == newPaths.join('|')) {
      return;
    }
    _index = _safeIndex(widget.initialIndex, _items.length);
    _controller.dispose();
    _controller = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _safeIndex(int value, int length) {
    if (length <= 0) return 0;
    return value.clamp(0, length - 1).toInt();
  }

  void _goTo(int value) {
    if (_items.isEmpty) return;
    final next = _safeIndex(value, _items.length);
    if (next == _index) return;
    setState(() => _index = next);
    if (_controller.hasClients) {
      _controller.animateToPage(
        next,
        duration: AppDurations.medium,
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 700;

    if (items.isEmpty) return const SizedBox.shrink();

    final selected = items[_safeIndex(_index, items.length)];
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.escape): () =>
            Navigator.of(context).maybePop(),
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () =>
            _goTo(_index + (context.isAr ? 1 : -1)),
        const SingleActivator(LogicalKeyboardKey.arrowRight): () =>
            _goTo(_index + (context.isAr ? -1 : 1)),
      },
      child: Focus(
        autofocus: true,
        child: Material(
          key: ValueKey<String>('fullscreen-viewer-${widget.project.id}'),
          color: const Color(0xFF020306),
          child: SafeArea(
            child: Column(
              children: [
                _TopBar(
                  projectId: widget.project.id,
                  title: widget.project.title(context),
                  onClose: () => Navigator.of(context).maybePop(),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: items.length,
                    onPageChanged: (value) => setState(() => _index = value),
                    itemBuilder: (context, itemIndex) {
                      final item = items[itemIndex];
                      final dpr = MediaQuery.devicePixelRatioOf(context);
                      final viewportWidth =
                          size.width - (isMobile ? 20 : 88);
                      final viewportHeight =
                          size.height - (isMobile ? 190 : 210);
                      final nativeLogicalWidth = item.pixelWidth == null
                          ? 1500.0
                          : item.pixelWidth! / dpr;
                      final nativeLogicalHeight = item.pixelHeight == null
                          ? 1100.0
                          : item.pixelHeight! / dpr;
                      final previewWidth = mathMin(
                        viewportWidth,
                        mathMin(nativeLogicalWidth, 1500),
                      );
                      final previewHeight = mathMin(
                        viewportHeight,
                        mathMin(nativeLogicalHeight, 1100),
                      );

                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 10 : 44,
                          vertical: isMobile ? 8 : 18,
                        ),
                        child: InteractiveViewer(
                          minScale: 0.8,
                          maxScale: 5,
                          boundaryMargin: const EdgeInsets.all(72),
                          child: Center(
                            child: RepaintBoundary(
                              child: LoadingImage(
                                key: ValueKey<String>(
                                  'fullscreen-${widget.project.id}-$itemIndex-${item.path}',
                                ),
                                assetPath: item.path,
                                width: previewWidth,
                                height: previewHeight,
                                fit: BoxFit.contain,
                                alignment: Alignment.topCenter,
                                borderRadius: 0,
                                backgroundColor: const Color(0xFF020306),
                                semanticLabel: item.caption(context),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                _BottomBar(
                  projectId: widget.project.id,
                  item: selected,
                  index: _safeIndex(_index, items.length),
                  count: items.length,
                  onPrevious: _index > 0 ? () => _goTo(_index - 1) : null,
                  onNext: _index + 1 < items.length
                      ? () => _goTo(_index + 1)
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

double mathMin(double a, double b) => a < b ? a : b;

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.projectId,
    required this.title,
    required this.onClose,
  });

  final String projectId;
  final String title;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 10, 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
          const SizedBox(width: 12),
          _ControlButton(
            key: ValueKey<String>('fullscreen-close-$projectId'),
            tooltip: context.l10n.text('closePreview'),
            icon: Icons.close_rounded,
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.projectId,
    required this.item,
    required this.index,
    required this.count,
    required this.onPrevious,
    required this.onNext,
  });

  final String projectId;
  final ProjectMediaItem item;
  final int index;
  final int count;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final caption = item.caption(context).trim();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
      decoration: const BoxDecoration(
        color: Color(0xFF070B12),
        border: Border(top: BorderSide(color: AppColors.borderStrong)),
      ),
      child: Row(
        children: [
          _ControlButton(
            key: ValueKey<String>('fullscreen-previous-$projectId'),
            tooltip: context.l10n.text('previousImage'),
            icon: context.isAr
                ? Icons.chevron_right_rounded
                : Icons.chevron_left_rounded,
            onPressed: onPrevious,
          ),
          const SizedBox(width: 8),
          _ControlButton(
            key: ValueKey<String>('fullscreen-next-$projectId'),
            tooltip: context.l10n.text('nextImage'),
            icon: context.isAr
                ? Icons.chevron_left_rounded
                : Icons.chevron_right_rounded,
            onPressed: onNext,
          ),
          if (caption.isNotEmpty) ...[
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                caption,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: context.isAr ? TextAlign.right : TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ] else
            const Spacer(),
          const SizedBox(width: 12),
          Container(
            key: ValueKey<String>('fullscreen-counter-$projectId'),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF0A0D14),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: AppColors.borderStrong),
            ),
            child: Text(
              context.isAr
                  ? '${index + 1} من $count'
                  : '${index + 1} / $count',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
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

class _ControlButton extends StatelessWidget {
  const _ControlButton({
    super.key,
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        color: AppColors.textPrimary,
        disabledColor: AppColors.textMuted.withOpacity(0.35),
        style: IconButton.styleFrom(
          backgroundColor: const Color(0xFF0A0D14),
          side: const BorderSide(color: AppColors.borderStrong),
          minimumSize: const Size(44, 44),
        ),
      ),
    );
  }
}

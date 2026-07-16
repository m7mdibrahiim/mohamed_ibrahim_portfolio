import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_durations.dart';
import '../../../app/theme/app_gradients.dart';
import '../../../app/theme/app_radius.dart';
import '../../../app/theme/app_shadows.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/loading_image.dart';
import '../models/project_model.dart';
import 'fullscreen_project_media_viewer.dart';
import 'project_mockup_view.dart';
import 'project_visual_placeholder.dart';

class ProjectGallery extends StatefulWidget {
  const ProjectGallery({super.key, required this.project});

  final ProjectModel project;

  @override
  State<ProjectGallery> createState() => _ProjectGalleryState();
}

class _ProjectGalleryState extends State<ProjectGallery> {
  late final PageController _pageController;
  int _selectedIndex = 0;

  List<ProjectMediaItem> get _items => widget.project.validMediaItems;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _preloadAround(0));
  }

  @override
  void didUpdateWidget(covariant ProjectGallery oldWidget) {
    super.didUpdateWidget(oldWidget);
    final projectChanged = oldWidget.project.id != widget.project.id;
    final galleryChanged = oldWidget.project.validScreenshots.join('|') !=
        widget.project.validScreenshots.join('|');
    if (!projectChanged && !galleryChanged) return;

    _selectedIndex = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (_pageController.hasClients) _pageController.jumpToPage(0);
      _preloadAround(0);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _preloadAround(int index) {
    if (!mounted || _items.isEmpty) return;
    final candidates = <int>{
      index,
      if (index > 0) index - 1,
      if (index + 1 < _items.length) index + 1,
    };
    for (final candidate in candidates) {
      precacheImage(
        AssetImage(_items[candidate].path),
        context,
        onError: (_, __) {},
      );
    }
  }

  Future<void> _goTo(int index) async {
    if (_items.isEmpty) return;
    final safeIndex = index.clamp(0, _items.length - 1).toInt();
    if (safeIndex == _selectedIndex && _pageController.hasClients) return;
    setState(() => _selectedIndex = safeIndex);
    _preloadAround(safeIndex);
    if (_pageController.hasClients) {
      await _pageController.animateToPage(
        safeIndex,
        duration: AppDurations.medium,
        curve: Curves.easeOutCubic,
      );
    }
  }

  Future<void> _openFullscreen() async {
    if (_items.isEmpty) return;
    await showDialog<void>(
      context: context,
      barrierColor: const Color(0xFF020306),
      useSafeArea: false,
      builder: (dialogContext) => Dialog.fullscreen(
        backgroundColor: Colors.transparent,
        child: FullscreenProjectMediaViewer(
          key: ValueKey<String>(
            'fullscreen-gallery-${widget.project.id}-${_safeSelectedIndex}',
          ),
          project: widget.project,
          mediaItems: _items,
          initialIndex: _safeSelectedIndex,
        ),
      ),
    );
  }

  int get _safeSelectedIndex {
    if (_items.isEmpty) return 0;
    return _selectedIndex.clamp(0, _items.length - 1).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;
    final isMobile = MediaQuery.sizeOf(context).width < 700;

    final gallery = GlassCard(
      key: ValueKey<String>('project-gallery-${widget.project.id}'),
      padding: EdgeInsets.all(isMobile ? 12 : 18),
      borderRadius: AppRadius.xxl,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final stageHeight = _stageHeightFor(
            items: items,
            isMobile: isMobile,
            isTinyPhone: context.isTinyPhone,
            availableWidth: constraints.maxWidth,
          );

          if (items.isEmpty) {
            return SizedBox(
              key: ValueKey<String>('gallery-fallback-${widget.project.id}'),
              height: stageHeight,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: ProjectVisualPlaceholder(
                    project: widget.project,
                    width: math.min(520.0, constraints.maxWidth - 24),
                  ),
                ),
              ),
            );
          }

          final selectedItem = items[_safeSelectedIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _GalleryStage(
                project: widget.project,
                items: items,
                pageController: _pageController,
                selectedIndex: _safeSelectedIndex,
                height: stageHeight,
                onChanged: (index) {
                  setState(() => _selectedIndex = index);
                  _preloadAround(index);
                },
                onPrevious: _safeSelectedIndex > 0
                    ? () => _goTo(_safeSelectedIndex - 1)
                    : null,
                onNext: _safeSelectedIndex + 1 < items.length
                    ? () => _goTo(_safeSelectedIndex + 1)
                    : null,
                onFullscreen: _openFullscreen,
                isMobile: isMobile,
                isTinyPhone: context.isTinyPhone,
                availableWidth: constraints.maxWidth,
              ),
              if (selectedItem.caption(context).trim().isNotEmpty) ...[
                const SizedBox(height: 14),
                _GalleryCaption(
                  key: ValueKey<String>(
                    'gallery-caption-${widget.project.id}-${selectedItem.path}',
                  ),
                  item: selectedItem,
                ),
              ],
              if (items.length > 1) ...[
                const SizedBox(height: 16),
                _ThumbnailStrip(
                  projectId: widget.project.id,
                  items: items,
                  selectedIndex: _safeSelectedIndex,
                  onSelected: _goTo,
                ),
              ],
            ],
          );
        },
      ),
    );

    if (isMobile || items.length < 2) return gallery;
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          final delta = context.isAr ? 1 : -1;
          _goTo(_safeSelectedIndex + delta);
        },
        const SingleActivator(LogicalKeyboardKey.arrowRight): () {
          final delta = context.isAr ? -1 : 1;
          _goTo(_safeSelectedIndex + delta);
        },
      },
      child: Focus(autofocus: true, child: gallery),
    );
  }
}

double _stageHeightFor({
  required List<ProjectMediaItem> items,
  required bool isMobile,
  required bool isTinyPhone,
  required double availableWidth,
}) {
  final allPhone = items.isNotEmpty &&
      items.every((item) => item.kind == ProjectMediaKind.phone);
  if (isMobile) {
    if (allPhone) {
      return math.min(
        isTinyPhone ? 440.0 : 500.0,
        math.max(isTinyPhone ? 390.0 : 430.0, availableWidth * 1.28),
      );
    }
    return math.min(390.0, math.max(292.0, availableWidth * 0.78));
  }
  return allPhone ? 650.0 : 610.0;
}

double _mockupWidthFor(
  ProjectModel project,
  ProjectMediaItem item,
  bool isMobile,
  bool isTinyPhone,
  double availableWidth,
) {
  final usableWidth = math.max(180.0, availableWidth - (isMobile ? 20 : 48));
  switch (item.kind) {
    case ProjectMediaKind.phone:
      return math.min(
        isMobile ? (isTinyPhone ? 205.0 : 245.0) : 310.0,
        usableWidth * (isMobile ? 0.72 : 0.42),
      );
    case ProjectMediaKind.browser:
      return math.min(isMobile ? 520.0 : 820.0, usableWidth);
    case ProjectMediaKind.desktop:
      return math.min(isMobile ? 520.0 : 850.0, usableWidth);
    case ProjectMediaKind.document:
      return math.min(isMobile ? 500.0 : 780.0, usableWidth);
  }
}

class _GalleryStage extends StatelessWidget {
  const _GalleryStage({
    required this.project,
    required this.items,
    required this.pageController,
    required this.selectedIndex,
    required this.height,
    required this.onChanged,
    required this.onPrevious,
    required this.onNext,
    required this.onFullscreen,
    required this.isMobile,
    required this.isTinyPhone,
    required this.availableWidth,
  });

  final ProjectModel project;
  final List<ProjectMediaItem> items;
  final PageController pageController;
  final int selectedIndex;
  final double height;
  final ValueChanged<int> onChanged;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final VoidCallback onFullscreen;
  final bool isMobile;
  final bool isTinyPhone;
  final double availableWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 10 : 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xl),
        gradient: AppGradients.dark,
        border: Border.all(color: AppColors.border),
        boxShadow: AppShadows.glow(
          color: AppColors.violet,
          opacity: isMobile ? 0.04 : 0.07,
          soft: isMobile,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              _GalleryIconButton(
                key: ValueKey<String>('gallery-fullscreen-${project.id}'),
                tooltip: context.l10n.text('openFullscreen'),
                icon: Icons.open_in_full_rounded,
                onPressed: onFullscreen,
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: height,
            width: double.infinity,
            child: RepaintBoundary(
              child: PageView.builder(
                controller: pageController,
                itemCount: items.length,
                physics: const PageScrollPhysics(),
                onPageChanged: onChanged,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Center(
                    child: FittedBox(
                      key: ValueKey<String>(
                        'gallery-${project.id}-$index-${item.path}',
                      ),
                      fit: BoxFit.scaleDown,
                      child: ProjectMockupView(
                        project: project,
                        image: item.path,
                        width: _mockupWidthFor(
                          project,
                          item,
                          isMobile,
                          isTinyPhone,
                          availableWidth,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              if (items.length > 1) ...[
                _GalleryIconButton(
                  key: ValueKey<String>('gallery-previous-${project.id}'),
                  tooltip: context.l10n.text('previousImage'),
                  icon: context.isAr
                      ? Icons.chevron_right_rounded
                      : Icons.chevron_left_rounded,
                  onPressed: onPrevious,
                ),
                const SizedBox(width: 8),
                _GalleryIconButton(
                  key: ValueKey<String>('gallery-next-${project.id}'),
                  tooltip: context.l10n.text('nextImage'),
                  icon: context.isAr
                      ? Icons.chevron_left_rounded
                      : Icons.chevron_right_rounded,
                  onPressed: onNext,
                ),
              ],
              const Spacer(),
              _GalleryCounter(
                key: ValueKey<String>('gallery-counter-${project.id}'),
                selectedIndex: selectedIndex,
                count: items.length,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GalleryCounter extends StatelessWidget {
  const _GalleryCounter({
    super.key,
    required this.selectedIndex,
    required this.count,
  });

  final int selectedIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFF070B12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.borderStrong),
      ),
      child: Text(
        context.isAr
            ? '${selectedIndex + 1} من $count'
            : '${selectedIndex + 1} / $count',
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w900,
            ),
      ),
    );
  }
}

class _GalleryCaption extends StatelessWidget {
  const _GalleryCaption({super.key, required this.item});

  final ProjectMediaItem item;

  @override
  Widget build(BuildContext context) {
    final description = item.description(context).trim();
    return AnimatedSwitcher(
      duration: AppDurations.fast,
      child: Container(
        key: ValueKey<String>('caption-body-${item.path}'),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.caption(context),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w900,
                  ),
            ),
            if (description.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.45,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ThumbnailStrip extends StatelessWidget {
  const _ThumbnailStrip({
    required this.projectId,
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final String projectId;
  final List<ProjectMediaItem> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final compact = context.isSmallMobile;
    return SizedBox(
      height: compact ? 84 : 102,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final item = items[index];
          final selected = index == selectedIndex;
          final logicalWidth = selected
              ? (compact ? 96.0 : 112.0)
              : (compact ? 82.0 : 96.0);
          final requestedDecodeWidth =
              (logicalWidth * MediaQuery.devicePixelRatioOf(context)).round();
          final decodeWidth = item.pixelWidth == null
              ? requestedDecodeWidth
              : math.min(requestedDecodeWidth, item.pixelWidth!);
          return Semantics(
            label: item.caption(context),
            button: true,
            selected: selected,
            child: InkWell(
              key: ValueKey<String>('gallery-thumbnail-$projectId-$index'),
              onTap: () => onSelected(index),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              child: AnimatedContainer(
                duration: AppDurations.fast,
                width: logicalWidth,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(
                    color: selected ? AppColors.cyan : AppColors.borderStrong,
                    width: selected ? 2 : 1,
                  ),
                  color: selected
                      ? AppColors.cyan.withOpacity(0.10)
                      : Colors.white.withOpacity(0.04),
                ),
                child: LoadingImage(
                  assetPath: item.path,
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                  borderRadius: AppRadius.md,
                  backgroundColor: AppColors.scaffoldDeep,
                  cacheWidth: decodeWidth,
                  semanticLabel: item.caption(context),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _GalleryIconButton extends StatelessWidget {
  const _GalleryIconButton({
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
        icon: Icon(icon, size: 20),
        color: onPressed == null ? AppColors.textMuted : AppColors.textPrimary,
        style: IconButton.styleFrom(
          backgroundColor: const Color(0xFF070B12),
          side: const BorderSide(color: AppColors.borderStrong),
          minimumSize: const Size(42, 42),
        ),
      ),
    );
  }
}

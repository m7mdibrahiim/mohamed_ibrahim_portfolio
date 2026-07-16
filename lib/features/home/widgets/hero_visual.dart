import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_durations.dart';
import '../../../app/theme/app_shadows.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/loading_image.dart';
import '../../../core/widgets/mockups/premium_pro_max_mockup.dart';
import '../../../core/widgets/technology_chip.dart';

class HeroVisual extends StatefulWidget {
  const HeroVisual({super.key});

  @override
  State<HeroVisual> createState() => _HeroVisualState();
}

class _HeroVisualState extends State<HeroVisual>
    with SingleTickerProviderStateMixin {
  static const List<String> _screens = [
    AppAssets.drYasmeenCover,
    AppAssets.nogaMobileCover,
    AppAssets.sharksAcademyCover,
    AppAssets.targetxCover,
    AppAssets.farahServicesCover,
    AppAssets.trelixiCover,
  ];

  late final AnimationController _floatController;
  Timer? _carouselTimer;
  int _index = 0;
  bool _isVisible = true;
  bool _preloadedInitialImages = false;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: AppDurations.heroFloat,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_preloadedInitialImages) {
      _preloadedInitialImages = true;
      _preloadCurrentAndNext();
    }
    _syncMotion();
  }

  @override
  void dispose() {
    _carouselTimer?.cancel();
    _floatController.dispose();
    super.dispose();
  }

  void _syncMotion() {
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final tickerEnabled = TickerMode.of(context);
    final shouldAnimate = _isVisible && tickerEnabled && !reduceMotion;

    if (shouldAnimate) {
      if (!_floatController.isAnimating) {
        _floatController.repeat(reverse: true);
      }
      _startCarousel();
    } else {
      _floatController.stop();
      _carouselTimer?.cancel();
      _carouselTimer = null;
    }
  }

  void _startCarousel() {
    if (_carouselTimer != null || _screens.length < 2) return;
    _carouselTimer = Timer.periodic(AppDurations.heroCycle, (_) {
      if (!mounted || !_isVisible || !TickerMode.of(context)) return;
      setState(() => _index = (_index + 1) % _screens.length);
      _preloadCurrentAndNext();
    });
  }

  int get _safeIndex {
    if (_screens.isEmpty) return 0;
    if (_index < 0) return 0;
    if (_index >= _screens.length) return _screens.length - 1;
    return _index;
  }

  void _preloadCurrentAndNext() {
    if (!mounted || _screens.isEmpty) return;
    final current = _screens[_safeIndex];
    final next = _screens[(_index + 1) % _screens.length];
    precacheImage(AssetImage(current), context, onError: (_, __) {});
    if (next != current) {
      precacheImage(AssetImage(next), context, onError: (_, __) {});
    }
  }

  void _handleVisibility(VisibilityInfo info) {
    final visible = info.visibleFraction > 0.12;
    if (visible == _isVisible) return;
    _isVisible = visible;
    _syncMotion();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const ValueKey('hero-device-visibility'),
      onVisibilityChanged: _handleVisibility,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = MediaQuery.sizeOf(context).width;
          final compactLayout = screenWidth < 1024;
          final availableWidth = constraints.maxWidth.isFinite
              ? constraints.maxWidth
              : screenWidth - (context.horizontalPadding * 2);
          final maxWidth = compactLayout ? 460.0 : 570.0;
          final visualWidth = math.min(maxWidth, math.max(250.0, availableWidth));
          final phoneWidth = compactLayout
              ? math.min(
                  context.isTinyPhone ? 202.0 : (context.isMobile ? 226.0 : 254.0),
                  visualWidth * 0.72,
                )
              : math.min(282.0, visualWidth * 0.51);
          final amplitude = MediaQuery.of(context).disableAnimations
              ? 0.0
              : (context.isMobile ? 2.0 : 5.0);

          return RepaintBoundary(
            child: AnimatedBuilder(
              animation: _floatController,
              child: _DeviceComposition(
                width: visualWidth,
                phoneWidth: phoneWidth,
                compactLayout: compactLayout,
                image: _screens[_safeIndex],
              ),
              builder: (context, child) {
                final eased = Curves.easeInOut.transform(_floatController.value);
                final dy = math.sin(eased * math.pi) * amplitude;
                return Transform.translate(
                  offset: Offset(0, dy),
                  child: child,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _DeviceComposition extends StatelessWidget {
  const _DeviceComposition({
    required this.width,
    required this.phoneWidth,
    required this.compactLayout,
    required this.image,
  });

  final double width;
  final double phoneWidth;
  final bool compactLayout;
  final String image;

  @override
  Widget build(BuildContext context) {
    final phone = PremiumProMaxMockup(
      width: phoneWidth,
      semanticLabel: context.isAr
          ? 'معاينة متحركة لتطبيقات Mohamed Ibrahim'
          : 'Animated preview of Mohamed Ibrahim Flutter applications',
      screen: _AnimatedScreenshot(image: image),
    );

    if (compactLayout) {
      return SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DeviceGlow(child: phone, compact: true),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.isTinyPhone ? 2 : 10),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: const [
                  TechnologyChip(label: 'Flutter', dense: true, highlight: true),
                  TechnologyChip(label: 'Firebase', dense: true),
                  TechnologyChip(label: 'Supabase', dense: true),
                  TechnologyChip(label: 'Paymob', dense: true),
                  TechnologyChip(label: 'Clean Architecture', dense: true),
                ],
              ),
            ),
          ],
        ),
      );
    }

    final phoneHeight = phoneWidth * 2.145;
    final stackHeight = phoneHeight + 82;
    return SizedBox(
      width: width,
      height: stackHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: _DeviceGlow(child: phone, compact: false),
          ),
          const PositionedDirectional(
            start: 2,
            top: 74,
            child: _OrbitChip(label: 'Flutter', highlight: true),
          ),
          const PositionedDirectional(
            start: 0,
            top: 254,
            child: _OrbitChip(label: 'Firebase'),
          ),
          const PositionedDirectional(
            start: 12,
            bottom: 118,
            child: _OrbitChip(label: 'Supabase'),
          ),
          const PositionedDirectional(
            end: 2,
            top: 154,
            child: _OrbitChip(label: 'Paymob'),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: _OrbitChip(label: 'Clean Architecture'),
          ),
        ],
      ),
    );
  }
}

class _AnimatedScreenshot extends StatelessWidget {
  const _AnimatedScreenshot({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppDurations.heroScreenshotTransition,
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      layoutBuilder: (currentChild, previousChildren) => Stack(
        fit: StackFit.expand,
        children: [
          ...previousChildren,
          if (currentChild != null) currentChild,
        ],
      ),
      transitionBuilder: (child, animation) {
        final offset = Tween<Offset>(
          begin: const Offset(0.035, 0.018),
          end: Offset.zero,
        ).animate(animation);
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offset, child: child),
        );
      },
      child: SizedBox.expand(
        key: ValueKey<String>('hero-screenshot-$image'),
        child: LoadingImage(
          assetPath: image,
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
          borderRadius: 0,
          backgroundColor: const Color(0xFF080B12),
          semanticLabel: context.isAr ? 'صورة تطبيق Flutter' : 'Flutter app screenshot',
        ),
      ),
    );
  }
}

class _DeviceGlow extends StatelessWidget {
  const _DeviceGlow({required this.child, required this.compact});

  final Widget child;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: AppShadows.glow(
          color: AppColors.cyan,
          opacity: compact ? 0.08 : 0.12,
          soft: compact,
        ),
      ),
      child: child,
    );
  }
}

class _OrbitChip extends StatelessWidget {
  const _OrbitChip({required this.label, this.highlight = false});

  final String label;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        boxShadow: AppShadows.glow(
          color: AppColors.cyan,
          opacity: 0.045,
          soft: true,
        ),
      ),
      child: TechnologyChip(
        label: label,
        dense: true,
        highlight: highlight,
      ),
    );
  }
}

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/layout/app_navbar_metrics.dart';
import '../../../core/responsive/context_extensions.dart';
import '../../../core/widgets/animated_section.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/footer.dart';
import '../../../core/widgets/section_container.dart';
import '../../contact/widgets/contact_section.dart';
import '../../experience/widgets/experience_timeline.dart';
import '../../projects/widgets/interactive_project_showcase.dart';
import '../../skills/widgets/skills_section.dart';
import '../navigation/home_section.dart';
import '../widgets/about_section.dart';
import '../widgets/featured_projects_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/more_projects_section.dart';
import '../widgets/process_section.dart';
import '../widgets/tech_strip.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.initialSection});

  final String? initialSection;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double _sectionHysteresis = 18;

  final ScrollController _scrollController = ScrollController();
  final HomeSectionRegistry _registry = HomeSectionRegistry();
  final ValueNotifier<HomeSection> _activeSection =
      ValueNotifier<HomeSection>(HomeSection.home);

  bool _scrollEvaluationScheduled = false;
  HomeSection? _programmaticTarget;
  Timer? _initialSectionTimer;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scheduleScrollEvaluation);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scheduleInitialSection();
      _scheduleScrollEvaluation();
    });
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSection != widget.initialSection) {
      _scheduleInitialSection();
    }
  }

  void _scheduleInitialSection() {
    _initialSectionTimer?.cancel();
    final requested = HomeSectionX.fromId(widget.initialSection);
    if (requested == null || requested == HomeSection.home) return;
    _initialSectionTimer = Timer(const Duration(milliseconds: 420), () {
      if (mounted) unawaited(_scrollToSection(requested));
    });
  }

  void _scheduleScrollEvaluation() {
    if (_scrollEvaluationScheduled || !mounted) return;
    _scrollEvaluationScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollEvaluationScheduled = false;
      if (mounted) _evaluateActiveSection();
    });
  }

  void _evaluateActiveSection() {
    if (!_scrollController.hasClients || _programmaticTarget != null) return;

    final position = _scrollController.position;
    if (position.pixels <= 24) {
      _setActive(HomeSection.home);
      return;
    }

    if (position.maxScrollExtent > 0 &&
        position.pixels >= position.maxScrollExtent - 72) {
      _setActive(HomeSection.contact);
      return;
    }

    final viewportHeight = MediaQuery.sizeOf(context).height;
    final anchor = AppNavbarMetrics.overlayExtent(context) +
        math.max(64, viewportHeight * 0.22);

    HomeSection candidate = HomeSection.home;
    for (final entry in _registry.entries) {
      final sectionContext = entry.key.currentContext;
      if (sectionContext == null) continue;
      final renderObject = sectionContext.findRenderObject();
      if (renderObject is! RenderBox || !renderObject.hasSize) continue;
      final top = renderObject.localToGlobal(Offset.zero).dy;
      if (top <= anchor + _sectionHysteresis) {
        candidate = entry.section;
      }
    }
    _setActive(candidate);
  }

  void _setActive(HomeSection section) {
    if (_activeSection.value != section) _activeSection.value = section;
  }

  Future<void> _handleNavTap(String id) async {
    final section = HomeSectionX.fromId(id) ?? HomeSection.home;
    await _scrollToSection(section);
  }

  Future<void> _scrollToSection(HomeSection section) async {
    _setActive(section);
    _programmaticTarget = section;

    if (section == HomeSection.home) {
      if (_scrollController.hasClients) {
        await _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 620),
          curve: Curves.easeInOutCubic,
        );
      }
      _programmaticTarget = null;
      _scheduleScrollEvaluation();
      return;
    }

    await WidgetsBinding.instance.endOfFrame;
    final targetContext = _registry.keyOf(section).currentContext;
    if (!mounted || targetContext == null || !_scrollController.hasClients) {
      _programmaticTarget = null;
      return;
    }

    final renderObject = targetContext.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) {
      _programmaticTarget = null;
      return;
    }

    final currentOffset = _scrollController.offset;
    final targetTop = renderObject.localToGlobal(Offset.zero).dy;
    final navbarOffset = AppNavbarMetrics.sectionScrollOffset(context);
    final desired = (currentOffset + targetTop - navbarOffset)
        .clamp(0.0, _scrollController.position.maxScrollExtent)
        .toDouble();

    await _scrollController.animateTo(
      desired,
      duration: const Duration(milliseconds: 680),
      curve: Curves.easeInOutCubic,
    );
    _programmaticTarget = null;
    _scheduleScrollEvaluation();
  }

  @override
  void dispose() {
    _initialSectionTimer?.cancel();
    _scrollController
      ..removeListener(_scheduleScrollEvaluation)
      ..dispose();
    _activeSection.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<HomeSection>(
      valueListenable: _activeSection,
      builder: (context, active, _) {
        return AppPageScaffold(
          activeNav: active.id,
          onSectionTap: _handleNavTap,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _registry.keyOf(HomeSection.home),
                  child: HeroSection(
                    onProjectsTap: () =>
                        _scrollToSection(HomeSection.projects),
                    onContactTap: () =>
                        _scrollToSection(HomeSection.contact),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: TechStrip()),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _registry.keyOf(HomeSection.projects),
                  child: const FeaturedProjectsSection(),
                ),
              ),
              SliverToBoxAdapter(
                child: AnimatedSection(
                  child: SectionContainer(
                    title: context.l10n.text('labTitle'),
                    subtitle: context.l10n.text('labSubtitle'),
                    child: const InteractiveProjectShowcase(),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: AboutSection()),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _registry.keyOf(HomeSection.experience),
                  child: const ExperienceTimeline(),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _registry.keyOf(HomeSection.skills),
                  child: const SkillsSection(),
                ),
              ),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _registry.keyOf(HomeSection.process),
                  child: const ProcessSection(),
                ),
              ),
              const SliverToBoxAdapter(child: MoreProjectsSection()),
              SliverToBoxAdapter(
                child: KeyedSubtree(
                  key: _registry.keyOf(HomeSection.contact),
                  child: const ContactSection(),
                ),
              ),
              const SliverToBoxAdapter(child: AppFooter()),
            ],
          ),
        );
      },
    );
  }
}

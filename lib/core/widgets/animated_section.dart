import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../app/theme/app_durations.dart';

class AnimatedSection extends StatefulWidget {
  const AnimatedSection({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.slideOffset = 28,
  });

  final Widget child;
  final Duration delay;
  final double slideOffset;

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey('animated-section-${widget.hashCode}'),
      onVisibilityChanged: (info) async {
        if (!_visible && info.visibleFraction > 0.08) {
          if (widget.delay != Duration.zero) await Future<void>.delayed(widget.delay);
          if (mounted) setState(() => _visible = true);
        }
      },
      child: AnimatedOpacity(
        duration: AppDurations.reveal,
        curve: Curves.easeOutCubic,
        opacity: _visible ? 1 : 0,
        child: AnimatedSlide(
          duration: AppDurations.reveal,
          curve: Curves.easeOutCubic,
          offset: _visible ? Offset.zero : Offset(0, widget.slideOffset / 100),
          child: widget.child,
        ),
      ),
    );
  }
}

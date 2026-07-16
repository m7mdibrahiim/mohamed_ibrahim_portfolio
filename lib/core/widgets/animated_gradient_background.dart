import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class AnimatedGradientBackground extends StatefulWidget {
  const AnimatedGradientBackground({super.key});

  @override
  State<AnimatedGradientBackground> createState() => _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 16),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final media = MediaQuery.of(context);
    final shouldAnimate = media.size.width >= 600 &&
        !media.disableAnimations &&
        TickerMode.of(context);
    if (shouldAnimate) {
      if (!_controller.isAnimating) _controller.repeat(reverse: true);
    } else {
      _controller.stop();
      _controller.value = 0.45;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 600;
    if (compact || MediaQuery.of(context).disableAnimations) {
      return CustomPaint(
        painter: const _GradientMeshPainter(0.45, compact: true),
        isComplex: true,
        willChange: false,
        child: const SizedBox.expand(),
      );
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => CustomPaint(
        painter: _GradientMeshPainter(_controller.value, compact: false),
        isComplex: true,
        willChange: true,
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _GradientMeshPainter extends CustomPainter {
  const _GradientMeshPainter(this.t, {required this.compact});

  final double t;
  final bool compact;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final basePaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF050B18), Color(0xFF061326), Color(0xFF050B18)],
      ).createShader(rect);
    canvas.drawRect(rect, basePaint);

    void drawGlow(Offset center, double radius, Color color) {
      final paint = Paint()
        ..shader = RadialGradient(
          colors: [
            color.withOpacity(compact ? 0.15 : 0.24),
            color.withOpacity(0.0),
          ],
        ).createShader(Rect.fromCircle(center: center, radius: radius));
      canvas.drawCircle(center, radius, paint);
    }

    drawGlow(
      Offset(size.width * (0.12 + 0.08 * math.sin(t * math.pi)), size.height * 0.18),
      size.width * (compact ? 0.46 : 0.34),
      AppColors.cyan,
    );
    drawGlow(
      Offset(size.width * (0.82 - 0.07 * math.cos(t * math.pi)), size.height * 0.26),
      size.width * (compact ? 0.52 : 0.42),
      AppColors.violet,
    );
    drawGlow(
      Offset(size.width * 0.52, size.height * (0.95 - 0.04 * math.sin(t * math.pi))),
      size.width * (compact ? 0.44 : 0.32),
      AppColors.blue,
    );

    final gridPaint = Paint()
      ..color = Colors.white.withOpacity(0.025)
      ..strokeWidth = 1;
    for (double x = 0; x < size.width; x += 80) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (double y = 0; y < size.height; y += 80) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _GradientMeshPainter oldDelegate) =>
      oldDelegate.t != t || oldDelegate.compact != compact;
}

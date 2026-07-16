import 'package:flutter/material.dart';

import '../layout/app_navbar_metrics.dart';
import 'animated_gradient_background.dart';
import 'app_navbar.dart';

class AppPageScaffold extends StatelessWidget {
  const AppPageScaffold({
    super.key,
    required this.child,
    this.activeNav = 'home',
    this.onSectionTap,
  });

  final Widget child;
  final String activeNav;
  final ValueChanged<String>? onSectionTap;

  @override
  Widget build(BuildContext context) {
    final bodyTopInset = AppNavbarMetrics.overlayExtent(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const RepaintBoundary(
            child: IgnorePointer(child: AnimatedGradientBackground()),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(top: bodyTopInset),
              child: child,
            ),
          ),
          AppNavbar(
            activeNav: activeNav,
            onSectionTap: onSectionTap,
          ),
        ],
      ),
    );
  }
}

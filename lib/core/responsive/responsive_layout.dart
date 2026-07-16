import 'package:flutter/material.dart';

import 'breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < AppBreakpoints.mobile) return mobile;
        if (constraints.maxWidth < AppBreakpoints.tablet) return tablet ?? mobile;
        return desktop;
      },
    );
  }
}

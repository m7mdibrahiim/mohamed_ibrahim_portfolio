import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_gradients.dart';
import '../../app/theme/app_radius.dart';
import 'responsive_button_content.dart';

class GradientButton extends StatefulWidget {
  const GradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isExpanded = false,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isExpanded;

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final hasBoundedWidth = constraints.hasBoundedWidth;
        final availableWidth =
            hasBoundedWidth ? constraints.maxWidth : double.infinity;
        final narrow = hasBoundedWidth && availableWidth < 228;
        final fillWidth =
            widget.isExpanded || (hasBoundedWidth && availableWidth < 272);
        final canHover = MediaQuery.sizeOf(context).width >= 700;
        final activeHover = _hovered && canHover;
        final horizontalPadding = narrow ? 12.0 : 22.0;

        final button = AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          width: fillWidth && hasBoundedWidth ? availableWidth : null,
          constraints: const BoxConstraints(minHeight: 48),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: narrow ? 10 : 12,
          ),
          decoration: BoxDecoration(
            gradient: AppGradients.accent,
            borderRadius: BorderRadius.circular(AppRadius.md),
            boxShadow: [
              BoxShadow(
                color: AppColors.cyan.withOpacity(activeHover ? 0.34 : 0.20),
                blurRadius: activeHover ? 28 : 18,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: ResponsiveButtonContent(
            label: widget.label,
            icon: widget.icon,
            expand: fillWidth,
            labelColor: Colors.white,
            iconColor: Colors.white,
            textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  height: 1.2,
                ),
          ),
        );

        return Semantics(
          button: true,
          label: widget.label,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: canHover ? (_) => setState(() => _hovered = true) : null,
            onExit: canHover ? (_) => setState(() => _hovered = false) : null,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onPressed,
                borderRadius: BorderRadius.circular(AppRadius.md),
                child: button,
              ),
            ),
          ),
        );
      },
    );
  }
}

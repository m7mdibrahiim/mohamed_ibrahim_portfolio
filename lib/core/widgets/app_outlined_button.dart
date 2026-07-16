import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_radius.dart';
import 'responsive_button_content.dart';

class AppOutlinedButton extends StatefulWidget {
  const AppOutlinedButton({
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
  State<AppOutlinedButton> createState() => _AppOutlinedButtonState();
}

class _AppOutlinedButtonState extends State<AppOutlinedButton> {
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
        final horizontalPadding = narrow ? 12.0 : 20.0;

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
            color: activeHover
                ? Colors.white.withOpacity(0.08)
                : Colors.white.withOpacity(0.035),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(
              color: activeHover ? AppColors.cyan : AppColors.borderStrong,
            ),
          ),
          child: ResponsiveButtonContent(
            label: widget.label,
            icon: widget.icon,
            expand: fillWidth,
            labelColor: AppColors.textPrimary,
            iconColor: AppColors.cyan,
            textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.textPrimary,
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

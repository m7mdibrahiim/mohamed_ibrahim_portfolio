import 'package:flutter/material.dart';

/// Shared, constraint-aware content used by the portfolio's primary and
/// secondary buttons.
///
/// The widget deliberately reacts to the width supplied by its parent rather
/// than the global screen width. This keeps icon/label combinations safe in
/// cards, dialogs, wrapped action groups, and RTL layouts.
class ResponsiveButtonContent extends StatelessWidget {
  const ResponsiveButtonContent({
    super.key,
    required this.label,
    required this.labelColor,
    required this.iconColor,
    required this.textStyle,
    this.icon,
    this.expand = false,
  });

  final String label;
  final IconData? icon;
  final Color labelColor;
  final Color iconColor;
  final TextStyle? textStyle;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final hasBoundedWidth = constraints.hasBoundedWidth;
        final availableWidth =
            hasBoundedWidth ? constraints.maxWidth : double.infinity;
        final narrow = hasBoundedWidth && availableWidth < 228;
        final shouldFill = expand || (hasBoundedWidth && availableWidth < 272);
        final gap = narrow ? 7.0 : 9.0;

        final labelWidget = Text(
          label,
          textAlign: TextAlign.center,
          softWrap: narrow,
          maxLines: narrow ? null : 1,
          overflow: narrow ? TextOverflow.visible : TextOverflow.ellipsis,
          style: textStyle?.copyWith(color: labelColor),
        );

        final hasLabel = label.trim().isNotEmpty;
        final children = <Widget>[
          if (icon != null)
            Icon(icon, color: iconColor, size: narrow ? 17 : 18),
          if (icon != null && hasLabel) SizedBox(width: gap),
          if (hasLabel)
            if (hasBoundedWidth)
              Flexible(
                fit: shouldFill ? FlexFit.tight : FlexFit.loose,
                child: labelWidget,
              )
            else
              labelWidget,
        ];

        return Row(
          mainAxisSize:
              shouldFill && hasBoundedWidth ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        );
      },
    );
  }
}

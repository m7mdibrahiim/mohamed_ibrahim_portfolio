import 'package:flutter/material.dart';

/// Places actions in a full-width vertical stack when horizontal space is
/// limited and in a wrapping row otherwise.
///
/// This prevents long localized labels from being forced into rigid mobile
/// rows while preserving compact desktop buttons.
class ResponsiveActionGroup extends StatelessWidget {
  const ResponsiveActionGroup({
    super.key,
    required this.children,
    this.stackBelow = 560,
    this.spacing = 12,
    this.runSpacing = 12,
    this.maxWideChildWidth = 360,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
  });

  final List<Widget> children;
  final double stackBelow;
  final double spacing;
  final double runSpacing;
  final double maxWideChildWidth;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final stack = constraints.hasBoundedWidth &&
            constraints.maxWidth < stackBelow;

        if (stack) {
          return Column(
            crossAxisAlignment: crossAxisAlignment,
            children: [
              for (var index = 0; index < children.length; index++) ...[
                if (index > 0) SizedBox(height: runSpacing),
                SizedBox(width: double.infinity, child: children[index]),
              ],
            ],
          );
        }

        return Wrap(
          spacing: spacing,
          runSpacing: runSpacing,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            for (final child in children)
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWideChildWidth),
                child: child,
              ),
          ],
        );
      },
    );
  }
}

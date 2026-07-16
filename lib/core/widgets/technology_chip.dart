import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_radius.dart';
import '../responsive/context_extensions.dart';

class TechnologyChip extends StatelessWidget {
  const TechnologyChip({
    super.key,
    required this.label,
    this.dense = false,
    this.highlight = false,
    this.icon,
  });

  final String label;
  final bool dense;
  final bool highlight;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final maxLabelWidth = context.isMobile ? 230.0 : 320.0;
    return Container(
      constraints: BoxConstraints(maxWidth: maxLabelWidth + (icon == null ? 0 : 24)),
      padding: EdgeInsets.symmetric(
        horizontal: dense ? 10 : 13,
        vertical: dense ? 6 : 8,
      ),
      decoration: BoxDecoration(
        color: (highlight ? AppColors.cyan : Colors.white).withOpacity(highlight ? 0.13 : 0.055),
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(
          color: (highlight ? AppColors.cyan : Colors.white).withOpacity(highlight ? 0.34 : 0.12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: dense ? 14 : 16, color: highlight ? AppColors.cyan : AppColors.textSecondary),
            const SizedBox(width: 7),
          ],
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: highlight ? AppColors.cyan : AppColors.textSecondary,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

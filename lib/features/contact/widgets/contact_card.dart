import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_radius.dart';
import '../../../core/services/url_launcher_service.dart';
import '../../../core/widgets/glass_card.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.url,
  });

  final String label;
  final String value;
  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(18),
      borderRadius: AppRadius.xl,
      onTap: () => UrlLauncherService.open(url, context: context),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.cyan.withOpacity(0.12),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: AppColors.cyan.withOpacity(0.25)),
            ),
            child: Icon(icon, color: AppColors.cyan),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          const Icon(Icons.open_in_new_rounded, color: AppColors.textMuted, size: 18),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_gradients.dart';
import '../../app/theme/app_radius.dart';
import '../constants/app_links.dart';
import '../responsive/context_extensions.dart';
import '../services/url_launcher_service.dart';
import 'gradient_button.dart';
import 'profile_avatar.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    super.key,
    required this.activeNav,
    required this.onItemTap,
  });

  final String activeNav;
  final ValueChanged<String> onItemTap;

  @override
  Widget build(BuildContext context) {
    final items = [
      ('home', context.l10n.text('navHome'), Icons.home_rounded),
      ('projects', context.l10n.text('navProjects'), Icons.apps_rounded),
      ('experience', context.l10n.text('navExperience'), Icons.timeline_rounded),
      ('skills', context.l10n.text('navSkills'), Icons.auto_awesome_rounded),
      ('process', context.l10n.text('navProcess'), Icons.schema_rounded),
      ('contact', context.l10n.text('navContact'), Icons.mail_rounded),
    ];

    return Material(
      color: AppColors.scaffoldDeep.withOpacity(0.98),
      child: CallbackShortcuts(
        bindings: <ShortcutActivator, VoidCallback>{
          const SingleActivator(LogicalKeyboardKey.escape): () {
            if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          },
        },
        child: Focus(
          autofocus: true,
          child: SafeArea(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.of(context).pop(),
              child: Padding(
                padding: EdgeInsets.all(context.isTinyPhone ? 10 : 16),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    onTap: () {},
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 460),
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.sizeOf(context).height -
                              MediaQuery.paddingOf(context).vertical -
                              (context.isTinyPhone ? 20 : 32),
                        ),
                        decoration: BoxDecoration(
                          gradient: AppGradients.glass,
                          color: AppColors.scaffoldDeep,
                          borderRadius: BorderRadius.circular(AppRadius.xl),
                          border: Border.all(color: AppColors.borderStrong),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 40,
                              offset: const Offset(0, 18),
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          padding:
                              EdgeInsets.all(context.isTinyPhone ? 16 : 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  const ProfileAvatar(size: 40),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      context.l10n.text('heroName'),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w900,
                                          ),
                                    ),
                                  ),
                                  IconButton(
                                    key: const Key('drawer-close-button'),
                                    tooltip:
                                        context.l10n.text('closePreview'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    icon: const Icon(Icons.close_rounded),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              for (final item in items)
                                _DrawerItem(
                                  id: item.$1,
                                  label: item.$2,
                                  icon: item.$3,
                                  active: item.$1 == activeNav,
                                  onTap: () => onItemTap(item.$1),
                                ),
                              const SizedBox(height: 16),
                              GradientButton(
                                key: const ValueKey<String>(
                                  'drawer-download-cv',
                                ),
                                label: context.l10n.text('downloadCv'),
                                icon: Icons.download_rounded,
                                isExpanded: true,
                                onPressed: () => UrlLauncherService.open(
                                  AppLinks.cvWebPath,
                                  context: context,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.id,
    required this.label,
    required this.icon,
    required this.active,
    required this.onTap,
  });

  final String id;
  final String label;
  final IconData icon;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey<String>('drawer-$id'),
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: AnimatedContainer(
        key: active
            ? ValueKey<String>('drawer-active-$id')
            : ValueKey<String>('drawer-inactive-$id'),
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: active
              ? AppColors.cyan.withOpacity(0.12)
              : Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: active
                ? AppColors.cyan.withOpacity(0.4)
                : AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: active ? AppColors.cyan : AppColors.textSecondary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: active
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

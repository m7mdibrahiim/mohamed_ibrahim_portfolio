import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/localization/language_cubit.dart';
import '../../app/router/route_names.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_radius.dart';
import '../../app/theme/app_shadows.dart';
import '../constants/app_links.dart';
import '../layout/app_navbar_metrics.dart';
import '../responsive/context_extensions.dart';
import '../services/url_launcher_service.dart';
import 'app_outlined_button.dart';
import 'glass_card.dart';
import 'mobile_drawer.dart';
import 'profile_avatar.dart';

class AppNavbar extends StatelessWidget {
  const AppNavbar({
    super.key,
    required this.activeNav,
    this.onSectionTap,
  });

  final String activeNav;
  final ValueChanged<String>? onSectionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: LayoutBuilder(
        builder: (context, viewportConstraints) {
          final viewportWidth = viewportConstraints.maxWidth;
          final horizontalMargin = _horizontalMargin(viewportWidth);

          return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                horizontalMargin,
                AppNavbarMetrics.topMargin,
                horizontalMargin,
                0,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1240),
                child: LayoutBuilder(
                  builder: (context, cardConstraints) {
                    final textScale = MediaQuery.textScalerOf(context).scale(1);
                    final desktopCandidate =
                        cardConstraints.maxWidth >= 1160 && textScale <= 1.15;

                    return GlassCard(
                      padding: EdgeInsets.symmetric(
                        horizontal: desktopCandidate ? 18 : 10,
                        vertical: desktopCandidate ? 12 : 10,
                      ),
                      borderRadius: AppRadius.xl,
                      child: LayoutBuilder(
                        builder: (context, contentConstraints) {
                          final showDesktopNavigation =
                              contentConstraints.maxWidth >= 1100 &&
                                  textScale <= 1.15;

                          if (showDesktopNavigation) {
                            return _DesktopNavbarContent(
                              activeNav: activeNav,
                              onNavigate: (id) => _navigate(context, id),
                            );
                          }

                          return _CompactNavbarContent(
                            availableWidth: contentConstraints.maxWidth,
                            onHomeTap: () => _navigate(context, 'home'),
                            onLanguageTap: () => context
                                .read<LanguageCubit>()
                                .toggleLanguage(),
                            onMenuTap: () => _openMobileMenu(context),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  double _horizontalMargin(double width) {
    if (width < 360) return 8;
    if (width < 600) return 10;
    if (width < 1024) return 20;
    if (width < 1440) return 32;
    return 48;
  }

  void _navigate(BuildContext context, String id) {
    if (onSectionTap != null) {
      onSectionTap!(id);
      return;
    }

    final currentPath = GoRouterState.of(context).uri.path;
    if (id == 'home') {
      context.goNamed(AppRouteNames.home);
      return;
    }

    if (id == 'projects' && currentPath == '/projects') return;
    if (id == 'contact' && currentPath == '/contact') return;

    context.goNamed(
      AppRouteNames.home,
      queryParameters: <String, String>{'section': id},
    );
  }

  void _openMobileMenu(BuildContext context) {
    showGeneralDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Navigation menu',
      barrierColor: Colors.black.withOpacity(0.55),
      transitionDuration: const Duration(milliseconds: 260),
      pageBuilder: (dialogContext, animation, secondaryAnimation) {
        return MobileDrawer(
          activeNav: activeNav,
          onItemTap: (id) {
            Navigator.of(dialogContext).pop();
            _navigate(context, id);
          },
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -0.03),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            ),
            child: child,
          ),
        );
      },
    );
  }
}

class _CompactNavbarContent extends StatelessWidget {
  const _CompactNavbarContent({
    required this.availableWidth,
    required this.onHomeTap,
    required this.onLanguageTap,
    required this.onMenuTap,
  });

  final double availableWidth;
  final VoidCallback onHomeTap;
  final VoidCallback onLanguageTap;
  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    const controlSize = 42.0;
    const controlGap = 8.0;
    final identitySpace =
        availableWidth - (controlSize * 2) - (controlGap * 2);
    final showName = identitySpace >= 176;
    final avatarSize = availableWidth < 300 ? 38.0 : 40.0;

    return Row(
      key: const Key('compact-navigation'),
      children: [
        Expanded(
          child: Semantics(
            button: true,
            label: context.l10n.text('heroName'),
            child: InkWell(
              onTap: onHomeTap,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Row(
                  children: [
                    ProfileAvatar(
                      key: const Key('navbar-profile-avatar'),
                      size: avatarSize,
                    ),
                    if (showName) ...[
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          context.l10n.text('heroName'),
                          key: const Key('navbar-name'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: controlGap),
        _LanguageToggle(
          controlKey: const Key('language-toggle-button'),
          onTap: onLanguageTap,
        ),
        const SizedBox(width: controlGap),
        _NavbarIconButton(
          buttonKey: const Key('mobile-menu-button'),
          icon: Icons.menu_rounded,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          onPressed: onMenuTap,
        ),
      ],
    );
  }
}

class _DesktopNavbarContent extends StatelessWidget {
  const _DesktopNavbarContent({
    required this.activeNav,
    required this.onNavigate,
  });

  final String activeNav;
  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const Key('desktop-navigation'),
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 220),
          child: Semantics(
            button: true,
            label: context.l10n.text('heroName'),
            child: InkWell(
              onTap: () => onNavigate('home'),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ProfileAvatar(
                    key: Key('navbar-profile-avatar'),
                    size: 44,
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      context.l10n.text('heroName'),
                      key: const Key('navbar-name'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
        _NavItem(
          id: 'home',
          label: context.l10n.text('navHome'),
          active: activeNav == 'home',
          onTap: () => onNavigate('home'),
        ),
        _NavItem(
          id: 'projects',
          label: context.l10n.text('navProjects'),
          active: activeNav == 'projects',
          onTap: () => onNavigate('projects'),
        ),
        _NavItem(
          id: 'experience',
          label: context.l10n.text('navExperience'),
          active: activeNav == 'experience',
          onTap: () => onNavigate('experience'),
        ),
        _NavItem(
          id: 'skills',
          label: context.l10n.text('navSkills'),
          active: activeNav == 'skills',
          onTap: () => onNavigate('skills'),
        ),
        _NavItem(
          id: 'process',
          label: context.l10n.text('navProcess'),
          active: activeNav == 'process',
          onTap: () => onNavigate('process'),
        ),
        _NavItem(
          id: 'contact',
          label: context.l10n.text('navContact'),
          active: activeNav == 'contact',
          onTap: () => onNavigate('contact'),
        ),
        const SizedBox(width: 10),
        _LanguageToggle(
          controlKey: const Key('language-toggle-button'),
          onTap: () => context.read<LanguageCubit>().toggleLanguage(),
        ),
        const SizedBox(width: 10),
        AppOutlinedButton(
          label: context.l10n.text('downloadCv'),
          icon: Icons.download_rounded,
          onPressed: () => UrlLauncherService.open(
            AppLinks.cvWebPath,
            context: context,
          ),
        ),
      ],
    );
  }
}

class _NavItem extends StatefulWidget {
  const _NavItem({
    required this.id,
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String id;
  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final selected = widget.active || _hovered;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        child: AnimatedContainer(
          key: widget.active
              ? ValueKey<String>('nav-active-${widget.id}')
              : ValueKey<String>('nav-inactive-${widget.id}'),
          duration: const Duration(milliseconds: 180),
          margin: const EdgeInsets.symmetric(horizontal: 1),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color:
                selected ? Colors.white.withOpacity(0.07) : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                maxLines: 1,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: selected
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: 3),
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: widget.active ? 18 : 0,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.cyan,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageToggle extends StatelessWidget {
  const _LanguageToggle({required this.controlKey, required this.onTap});

  final Key controlKey;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LanguageCubit>().state;
    final isAr = locale.languageCode == 'ar';

    return SizedBox(
      width: 42,
      height: 42,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          key: controlKey,
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.md),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(color: AppColors.border),
              boxShadow:
                  AppShadows.glow(color: AppColors.violet, opacity: 0.08),
            ),
            child: Text(
              isAr ? 'EN' : 'AR',
              maxLines: 1,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.cyan,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavbarIconButton extends StatelessWidget {
  const _NavbarIconButton({
    required this.buttonKey,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final Key buttonKey;
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      height: 42,
      child: IconButton(
        key: buttonKey,
        tooltip: tooltip,
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        iconSize: 24,
        style: IconButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          backgroundColor: Colors.white.withOpacity(0.06),
          side: BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
        icon: Icon(icon),
      ),
    );
  }
}

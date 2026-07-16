# Scroll-Spy Implementation Report

## Implementation files

- `lib/features/home/navigation/home_section.dart`
- `lib/features/home/presentation/home_page.dart`
- `lib/core/layout/app_navbar_metrics.dart`
- `lib/core/widgets/app_navbar.dart`
- `lib/core/widgets/mobile_drawer.dart`
- `lib/core/widgets/app_page_scaffold.dart`
- `lib/app/router/app_router.dart`
- `test/home_navigation_test.dart`

## Section registry architecture

`lib/features/home/navigation/home_section.dart` defines `HomeSection` (`home`, `projects`, `experience`, `skills`, `process`, `contact`) plus one `HomeSectionRegistry`. The registry owns the deterministic order and one `GlobalKey` per section. Navbar labels continue to come from the existing English/Arabic localization system.

## Single controller and source of truth

The homepage owns one `ScrollController` and one `ValueNotifier<HomeSection>`. `AppPageScaffold.activeNav` is rebuilt only when the notifier changes. Route pages continue to supply route-aware active values (`projects` for `/projects` and `/projects/:id`, `contact` for `/contact`). Route state and homepage scroll state therefore do not compete.

## Active-section algorithm

1. Scroll events schedule at most one post-frame calculation.
2. The viewport anchor is `navbar overlay extent + max(64px, 22% of viewport height)`.
3. The active section is the latest registered section whose top has crossed the anchor.
4. An 18px hysteresis margin reduces boundary flicker.
5. At the top, Home is forced active.
6. Within 72px of maximum scroll extent, Contact is forced active.
7. The notifier updates only when the section actually changes; no `setState` runs on every scroll pixel.

## Sticky-navbar offset handling

`AppNavbarMetrics.overlayExtent(context)` centralizes SafeArea, top margin, navbar height, and bottom gap. Programmatic scrolling computes the target’s global top and subtracts the navbar extent plus 12px, preventing section headings from being hidden.

## Navbar click behavior

`_scrollToSection(HomeSection)` immediately highlights the requested item, enables a short programmatic-scroll lock, animates for 680ms with `easeInOutCubic`, then releases the lock and reevaluates scroll state. This prevents feedback loops while still restoring automatic scroll-spy behavior after the animation.

## Route-to-section navigation

On project/details/contact route pages, navbar section clicks navigate to `/?section=<id>`. `HomePage` waits until its section keys are mounted, then performs the same offset-aware scroll. It never attempts to use homepage `GlobalKey` objects before the homepage exists.

## Mobile drawer

The drawer closes before navigation. It receives the same active ID as the desktop navbar and uses matching active keys/visual treatment. The header now uses Mohamed’s real photo with the same MI error fallback as the navbar and footer.

## Performance choices

- Frame-throttled geometry calculation.
- One notifier update only when the active section changes.
- No new package.
- No per-pixel widget rebuild.
- Programmatic-scroll lock prevents state oscillation.
- Existing lightweight navbar transitions retained.

## Tests added

`test/home_navigation_test.dart` covers Home at top, Contact near page bottom, automatic Projects/Experience/Skills/Process activation, direct navbar clicks, project-details to homepage section handoff, mobile drawer closure, footer profile/fallback behavior, and responsive English/Arabic pumps.

## Execution status

The tests are structurally included but were **NOT RUN — Flutter SDK unavailable** in the packaging environment.

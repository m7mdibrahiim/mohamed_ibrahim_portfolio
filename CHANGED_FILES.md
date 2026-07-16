# Changed Files — Zero-Overflow Runtime Stabilization

## Baseline

This is an exact SHA-256 content comparison between:

- the untouched project extracted from `mohamed_ibrahim_flutter_portfolio_all_approved_media_final(1).zip`; and
- the corrected stabilization working tree.

Build output, IDE metadata, caches, archives, and operating-system files are excluded.

## Totals

- Added: **7**
- Modified: **16**
- Removed: **0**
- Final project-tree files: **390**

## Added

- `PRE_FIX_BASELINE.md`
- `REGRESSION_PRESERVATION_REPORT.md`
- `RESPONSIVE_TEST_REPORT.md`
- `RUNTIME_STABILIZATION_REPORT.md`
- `lib/core/widgets/responsive_action_group.dart`
- `lib/core/widgets/responsive_button_content.dart`
- `test/responsive_controls_test.dart`

## Modified

- `CHANGED_FILES.md`
- `FINAL_RELEASE_MANIFEST.md`
- `RESPONSIVE_QA_CHECKLIST.md`
- `lib/core/layout/app_navbar_metrics.dart`
- `lib/core/widgets/app_navbar.dart`
- `lib/core/widgets/app_outlined_button.dart`
- `lib/core/widgets/gradient_button.dart`
- `lib/core/widgets/mobile_drawer.dart`
- `lib/features/contact/widgets/contact_section.dart`
- `lib/features/home/widgets/hero_section.dart`
- `lib/features/projects/presentation/project_details_page.dart`
- `lib/features/projects/widgets/interactive_project_showcase.dart`
- `lib/features/projects/widgets/project_card.dart`
- `lib/features/projects/widgets/project_links.dart`
- `test/home_navigation_test.dart`
- `test/project_routes_test.dart`

## Removed

None. No approved source, project, image, video, CV, route, or content file was removed.

## Change boundary

The implementation delta is limited to:

- actual-inner-width navbar layout and stable control keys;
- constraint-aware primary/secondary button internals;
- responsive mobile/desktop action grouping;
- keyed mobile drawer items and hit-test regression protection;
- expanded route/home/navbar/button responsive test coverage; and
- stabilization documentation and release metadata.

No package dependency, project definition, approved screenshot, showcase video, CV, route ID, project order, localization copy, or SEO asset was replaced.

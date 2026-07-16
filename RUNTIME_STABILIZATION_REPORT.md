# Runtime Stabilization Report

## Scope

This stabilization pass uses the supplied local Flutter test output as the failure baseline. The supplied run ended at **53 passed / 32 failed** and exposed three root rendering failures: the internal rows of `AppOutlinedButton`, `GradientButton`, and `AppNavbar`. The remaining failed route, homepage, Arabic, and mobile-drawer tests were downstream effects of those layout failures.

No visual redesign, media replacement, project-content rewrite, route reordering, or package addition was performed.

## Supplied failures and root causes

### 1. `AppOutlinedButton` horizontal overflow

- **Source:** `lib/core/widgets/app_outlined_button.dart`
- **Observed overflow:** 65 px, 50 px, 35 px, and 21 px.
- **Root cause:** the old widget sized its label from the global `MediaQuery` width, not from the finite width assigned by the parent card/action area. The icon, gap, outer padding, and constrained label could therefore exceed the actual 188–218 px row constraint. The non-expanded row also used `MainAxisSize.min`, so it attempted to retain its natural content width inside a smaller finite parent.
- **Correction:** the button now uses a top-level `LayoutBuilder`, fills narrow finite constraints, reduces horizontal padding only when necessary, preserves a 48 px minimum tap height, and delegates icon/label composition to a shared constraint-aware content widget. The label receives the remaining width through `Flexible`; narrow labels wrap instead of forcing the row wider.

### 2. `GradientButton` horizontal overflow

- **Source:** `lib/core/widgets/gradient_button.dart`
- **Observed overflow:** 38 px, 23 px, and 8.4 px.
- **Root cause:** the same global-width/natural-row mismatch as the outlined button. Its hover transform also changed paint position even though the visual did not need movement to communicate hover state.
- **Correction:** the button now shares the same `LayoutBuilder`-driven content pattern, finite-width filling behavior, responsive padding, wrapping label behavior, and minimum tap height as `AppOutlinedButton`. Hover animation is limited to safe color/shadow changes and does not alter width, padding, or layout position.

### 3. `AppNavbar` overflow and off-screen menu control

- **Source:** `lib/core/widgets/app_navbar.dart`
- **Observed overflow:** 168 px, 148 px, 128 px, 120 px, 113 px, 100 px, 98 px, 80 px, 65 px, 58 px, 50 px, and 10 px.
- **Observed interaction failure:** at 390×900, the menu icon center was reported at x=420.5, outside the 390 px render surface.
- **Root cause:** the old navbar selected its branch from global viewport width while its row was subsequently reduced by responsive page padding, max-width constraints, glass-card padding, and text scaling. Its identity group was naturally sized, the name was not flexibly constrained, and fixed controls were added after a spacer. The resulting row could be much narrower than the branch assumed.
- **Correction:** the navbar is rebuilt around nested `LayoutBuilder` constraints. Its compact/full branch is selected from the width actually available inside the glass card. The compact identity occupies `Expanded`, the name is optional and ellipsized, and the language/menu controls remain fixed 42 px hit targets inside the row. The full desktop navigation is emitted only when the inner width safely supports identity, all links, language selector, and CV action.
- **Stable keys added:** `navbar-profile-avatar`, `navbar-name`, `language-toggle-button`, `mobile-menu-button`, `compact-navigation`, and `desktop-navigation`.

### 4. Mobile drawer test failure

- **Source:** `test/home_navigation_test.dart`, with production trigger in `app_navbar.dart`.
- **Root cause:** the modal implementation existed, but the trigger was laid out beyond the viewport and could not receive the tap. The drawer therefore never opened, so the test correctly found zero `MobileDrawer` widgets.
- **Correction:** the keyed menu `IconButton` is now inside the compact navbar's finite row. The test verifies its rectangle is inside the viewport, makes hit-test warnings fatal, opens the drawer by key, selects a keyed drawer destination, verifies closure, and verifies the active drawer state after reopening.

### 5. Noga route and homepage responsive failures

- **Affected supplied tests:** Noga at 360, 375, 390, and 430 px; Arabic project routes; homepage at 320, 340, 360, 375, 390, and 430 px in English and Arabic.
- **Root cause:** these tests surfaced the same three reusable component failures while rendering route actions and the shared navbar.
- **Correction:** shared actions now use `ResponsiveActionGroup`: narrow layouts stack full-width actions with vertical spacing, while wider layouts use a wrapping row. This is applied to hero actions, project cards, project links, Flutter App Lab, project navigation, contact CTA behavior, and details-page actions.

## Files changed for stabilization

### Added

- `lib/core/widgets/responsive_button_content.dart`
- `lib/core/widgets/responsive_action_group.dart`
- `test/responsive_controls_test.dart`
- `PRE_FIX_BASELINE.md`
- `RUNTIME_STABILIZATION_REPORT.md`
- `REGRESSION_PRESERVATION_REPORT.md`
- `RESPONSIVE_TEST_REPORT.md`

### Modified

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
- `RESPONSIVE_QA_CHECKLIST.md`
- `CHANGED_FILES.md`
- `FINAL_RELEASE_MANIFEST.md`

## Tests added or strengthened

- Reusable button tests at 160, 188, 218, and 320 px.
- Long English and Arabic labels.
- Text scales 1.0, 1.3, and 1.5.
- Icon + text, text-only, and icon-only states.
- Navbar bounds and branch tests at 320, 340, 360, 375, 390, 393, 412, 430, 480, 768, 1024, 1280, 1366, and 1440 px in English and Arabic.
- Homepage responsive coverage expanded through 480, 768, 1024, and 1440 px.
- New-project route coverage expanded to the same mobile/tablet/desktop widths.
- Arabic Noga route coverage at 320, 360, 375, 390, 393, 412, and 430 px.
- The mobile-drawer interaction uses intentional keys and fatal hit-test warnings; no `warnIfMissed: false`, skipped test, or Flutter-error suppression was introduced.

## Static validation performed

- `pubspec.yaml` parsed successfully.
- 82 Dart files under `lib/` and 8 Dart test files were checked.
- All relative/internal package imports resolve.
- Delimiters, strings, and block comments are balanced in all 90 Dart files.
- 270 `AppAssets` paths exist.
- All 25 declared asset directories exist.
- 94 English and 94 Arabic localization keys match.
- 18 project IDs are unique and URL-safe.
- TargetX, Noga Mobile, Al Raqi, A2H, and Game Zone IDs remain present.
- Noga Mobile contains 24 approved screenshots; Al Raqi contains 32; TargetX contains 13.
- No unsafe `firstWhere` remains in `lib/`.
- No debug `print`/`debugPrint`, duplicate literal Hero tag, obsolete public `10+ Projects` copy, nested archive, build/cache/IDE directory, or missing required CV/video/profile asset was found.
- Static validation result: **0 errors / 0 warnings**.

## Command execution status

This execution environment does not contain Flutter or Dart.

- `flutter clean`: **NOT RUN — Flutter SDK unavailable**
- `flutter pub get`: **NOT RUN — Flutter SDK unavailable**
- `dart format .`: **NOT RUN — Flutter SDK unavailable**
- `flutter analyze`: **NOT RUN — Flutter SDK unavailable**
- Focused project-route test: **NOT RUN — Flutter SDK unavailable**
- Focused home-navigation test: **NOT RUN — Flutter SDK unavailable**
- Full `flutter test`: **NOT RUN — Flutter SDK unavailable**
- `flutter test --platform chrome`: **NOT RUN — Flutter SDK unavailable**
- `flutter build web --release`: **NOT RUN — Flutter SDK unavailable**

No passing runtime result is claimed. The included fail-fast `qa_portfolio.ps1` is the certification path on a machine with Flutter and Chrome.

## Remaining risk

The source corrections directly address every rendering source named by the supplied real test log, but the corrected tree still requires execution of the Flutter analyze/test/Chrome/build loop and manual browser matrix on the user's Flutter machine before it can be called runtime-certified or deployment-ready.

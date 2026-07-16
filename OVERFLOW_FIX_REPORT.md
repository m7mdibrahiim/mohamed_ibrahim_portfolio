# Overflow Fix Report

## Scope

This report covers the runtime layout failures visible in the supplied Chrome screenshots and the source-level corrections applied to the existing working tree. No clipping-based workaround was used to hide the failures.

## Runtime failures shown in the supplied screenshots

| Runtime symptom | Observed result | Root cause | Source/widget | Implemented correction |
|---|---|---|---|---|
| Experience card overflow | `BOTTOM OVERFLOWED BY 51 PIXELS` on the Tawr Company card | The timeline used an `IntrinsicHeight`-wrapped stretched `Row`, while the rail used an `Expanded` child and the content card contained variable wrapping text/chips. At narrow widths, this coupled intrinsic rail measurement to content that needed more vertical space. | `lib/features/experience/widgets/experience_timeline.dart`, `_TimelineItem` | Removed `IntrinsicHeight`, the stretched row, and the rail `Expanded`; the card now sizes naturally in `Column(mainAxisSize: MainAxisSize.min)`. The visual rail is painted independently with `_TimelineRailPainter`, so it no longer constrains content height. |
| Experience card overflow | `BOTTOM OVERFLOWED BY 42 PIXELS` on the Fastweb Company card | Same intrinsic/stretched layout failure, amplified by wrapped bullet copy and technology chips. | `lib/features/experience/widgets/experience_timeline.dart`, `_TimelineItem` | Bullet copy wraps in an `Expanded` text child inside a horizontal bullet row; the card itself remains vertically content-driven. Technology/date/company chips use `Wrap` with explicit `spacing` and `runSpacing`. |
| Clipped technology chips | Bottom chips crossed the card boundary | Card height was effectively influenced by the rail/intrinsic composition rather than only by the card’s content. | `ExperienceTimeline` / `_TimelineItem` | Removed the layout coupling; added compact responsive padding and typography below 376 px; retained all content. |
| A2H shown in a desktop monitor | Portrait mobile screens appeared tiny inside a large landscape mockup | A2H was classified as a desktop project in the earlier presentation path. | `lib/features/projects/data/projects_data.dart`; `ProjectModel`; `ProjectMockupView`; `ProjectGallery` | A2H is now `ProjectType.mobile`, uses `ProjectMediaKind.phone`, appears in Mobile collections/filters, and uses a phone mockup for cover, hero, gallery, and App Lab presentation. |
| Project content too close to/behind navbar | First content and project detail hero could start beneath the sticky navbar | Navbar height and section offsets were handled in multiple places rather than through one responsive source. | `lib/core/layout/app_navbar_metrics.dart`; `lib/core/widgets/app_page_scaffold.dart`; `lib/features/home/presentation/home_page.dart`; project/contact pages | Added centralized top margin, responsive bar height, overlay extent, first-section padding, and section-scroll offset. Every `AppPageScaffold` body starts below the overlay, and homepage anchor scrolling subtracts the same centralized offset. |
| Drawer did not feel fully modal | Underlying CTAs remained visually competitive and the page could appear active behind the menu | The former surface was presented as a lightweight overlay without a sufficiently opaque modal composition and complete input/focus behavior. | `lib/core/widgets/app_navbar.dart`; `lib/core/widgets/mobile_drawer.dart` | Drawer opens through `showGeneralDialog` with a modal barrier. The surface is nearly opaque, uses `SafeArea`, constrained height, internal scrolling, focus capture, outside-tap dismissal, and Escape handling. The drawer closes before section navigation. |
| Duplicate-looking Download CV action through drawer | Underlying page action remained visible beneath the translucent surface | Modal surface opacity and separation were insufficient; no test key enforced a single drawer CTA. | `MobileDrawer` | Added one keyed `drawer-download-cv` button inside the modal, stronger background separation, and a widget test that asserts exactly one drawer CV action. |
| Portrait screenshots too small in desktop frames | Mobile screenshots had excessive black/empty space | Mockup selection was based only on broad project type and not the current media item. | `lib/features/projects/models/project_model.dart`; `lib/features/projects/widgets/project_gallery.dart`; `lib/features/projects/widgets/project_mockup_view.dart` | Added `ProjectMediaKind`, per-project default media kind, and per-image overrides. Gallery stage height and mockup width now react to phone/browser/desktop media. Portrait content uses `BoxFit.contain` and realistic phone dimensions. |
| Large thumbnail rows could force width | Many images risked a fixed-row overflow | Fixed multi-item arrangements do not scale to 20+ images. | `ProjectGallery` | Uses a horizontally scrolling `ListView.separated` thumbnail strip with stable item dimensions and no page-width forcing. |
| Project switch could retain stale gallery index | TargetX previously opened with an index from a prior larger gallery, causing a red `RangeError` | `ProjectGallery` state survived project replacement and directly indexed a shorter screenshot list. | `lib/features/projects/widgets/project_gallery.dart`; `lib/features/projects/presentation/project_details_page.dart`; router | `didUpdateWidget` resets selection when project ID/screens change, all index paths clamp/check bounds, empty lists have a fallback, galleries use project-ID keys, and project detail pages use project-ID page keys. |

## Experience timeline solution

The corrected `_TimelineItem` now uses:

- `Column(mainAxisSize: MainAxisSize.min)` for natural card height.
- `Wrap(spacing: 8, runSpacing: 8)` for period/company chips.
- A second `Wrap(spacing: 8, runSpacing: 8)` for technology chips.
- Naturally wrapping bullet text with responsive font size and line height.
- Compact padding at 320-375 px.
- A fixed rail-width allocation, with the line and dot painted by `CustomPainter` instead of participating in intrinsic height.
- RTL-aware rail placement.

No `Spacer`, vertically unsafe `Expanded`, fixed card height, `OverflowBox`, or clipping workaround remains in the Experience card composition.

## Navbar offset solution

`AppNavbarMetrics` is the single source for:

- top margin,
- mobile/desktop navbar height,
- total overlay extent,
- first-section top padding,
- section-scroll offset.

`AppPageScaffold` applies `overlayExtent(context)` to every page body. `HomePage` uses `sectionScrollOffset(context)` when scrolling to Home, Projects, Experience, Skills, Process, or Contact. This prevents headings from landing under the sticky navbar.

## Drawer solution

The mobile drawer now:

- uses a modal route and barrier,
- blocks pointer interaction with the page behind it,
- captures focus,
- closes with Escape,
- supports outside-tap dismissal,
- uses `SafeArea`,
- scrolls internally on short-height screens,
- keeps the close button and Download CV action accessible,
- closes before navigation begins,
- shows exactly one drawer Download CV button,
- preserves active-section highlighting and RTL ordering.

## Gallery solution

The gallery now supports:

- phone, browser, and desktop media selection,
- per-image media overrides for mixed projects,
- empty-gallery fallback,
- one-image mode without thumbnail/navigation assumptions,
- multi-image `PageView.builder`,
- bounded/clamped selected index,
- selected-index reset when project changes,
- horizontally scrolling thumbnails,
- touch swipe and desktop arrow-key navigation,
- fullscreen `SafeArea`, Escape, and close controls,
- adjacent-image preloading only,
- project-specific keys without duplicate Hero tags.

## A2H platform correction

A2H is now explicitly:

```text
ProjectType.mobile
ProjectMediaKind.phone
```

It is included in `ProjectsData.mobileProjects`, excluded from `windowsProjects`, and appears after the ten primary Mobile projects. Game Zone remains `ProjectType.desktop` with a desktop default media kind and browser overrides for its customer tracking pages.

## Responsive widths represented by widget tests

The test source represents these viewport widths:

```text
320, 340, 360, 375, 390, 393, 412, 430,
480, 600, 768, 820, 1024, 1280, 1366, 1440
```

It also includes an Arabic Experience timeline case at text scale `1.5`.

## Runtime status versus static-only status

- Supplied Chrome screenshots were used to identify the concrete runtime failures.
- The final source was statically inspected for layout structure, index safety, imports, assets, routes, and test setup.
- Flutter, Dart, Chrome widget tests, and Web build were **not executed in the final packaging environment because the Flutter SDK was unavailable**.
- Therefore no claim is made that the final width matrix passed at runtime in this environment.
- `qa_portfolio.ps1` and `RESPONSIVE_QA_CHECKLIST.md` are included for the mandatory local runtime pass.

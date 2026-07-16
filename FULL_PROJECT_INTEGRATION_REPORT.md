# Full Project Integration Report — Authoritative Media V4 Addendum

## Scope

The established 18-project Flutter portfolio remains the source of truth. This release replaces only the Al Raqi Mobile and Noga Mobile screenshot collections with the newly approved authoritative sets, extends the media model and galleries to support them correctly, updates acceptance tests and documentation, and preserves all prior runtime fixes.

Project order, routes, localization, CV content, Experience overflow fixes, A2H Mobile classification, Game Zone Desktop classification, sticky-navbar offsets, modal drawer, scroll-spy behavior, and TargetX gallery safeguards were not redesigned or removed.

## Current inventory

- **18 projects** in one data source.
- **262 project gallery images** referenced by active project records.
- **32 approved Al Raqi Mobile screenshots** in `authoritative_v4`.
- **24 approved Noga Mobile screenshots** in `authoritative_v4`.
- **56 of 56 approved screenshots integrated and reachable**.
- **0 approved screenshots excluded, blurred, redacted, deduplicated, or substituted**.
- **2 approved showcase videos** retained under current `_v3.mp4` cache-busting paths.
- **266 image files** in the complete portfolio image tree.
- **0 corrupted images** detected by static image verification.

| Order | ID | Project | Platform | Gallery images |
|---:|---|---|---|---:|
| 1 | `dr-yasmeen-pharmacy` | Dr. Yasmeen Pharmacy | Mobile | 14 |
| 2 | `noga-mobile` | Noga Mobile | Mobile | 24 |
| 3 | `sharks-academy` | Sharks Academy | Mobile | 25 |
| 4 | `targetx-app` | TargetX | Mobile | 13 |
| 5 | `farah-services` | Farah Services | Mobile | 13 |
| 6 | `trelixi-learning-app` | Trelixi Learning App | Mobile | 20 |
| 7 | `education-app` | Education App | Mobile | 7 |
| 8 | `cleany-app` | Cleany | Mobile | 6 |
| 9 | `fitness-app` | Fitness App | Mobile | 7 |
| 10 | `kanzoon-app` | Kanzoon App | Mobile | 8 |
| 11 | `recast-food-app` | Recast Food App | Mobile | 4 |
| 12 | `shop-smart` | Shop Smart | Mobile | 2 |
| 13 | `game-zone` | Game Zone | Windows / Desktop | 1 |
| 14 | `a2h-inventory-invoicing` | A2H Inventory & Invoicing | Mobile | 6 |
| 15 | `rusheta-windows-app` | Rusheta Windows | Windows / Desktop | 10 |
| 16 | `ahla-beauty` | Ahla Beauty Storefront | Web | 42 |
| 17 | `gypsum-home` | Gypsum Home | Web | 28 |
| 18 | `al-raqi-mobile` | Al Raqi Mobile | Cross-platform business operations | 32 |

## Authoritative screenshot integration

- The two supplied archives were treated as the only approved Noga and Al Raqi screenshot sources.
- All 56 final files are byte-for-byte copies of the uploads.
- Original JPEG/PNG formats and source dimensions were preserved.
- No automatic perceptual deduplication was applied.
- Previous Noga and Al Raqi screenshot folders were removed.
- New cache-busting paths use:
  - `assets/images/projects/noga_mobile/authoritative_v4/`
  - `assets/images/projects/al_raqi_mobile/authoritative_v4/`
- `AppAssets`, `ProjectModel`, project data, homepage/project-card covers, Flutter App Lab, case-study heroes, galleries, fullscreen viewer, tests, and documentation reference the new sets.

## Media-model and gallery changes

`ProjectMediaItem` now provides image-level metadata:

- path
- phone/browser/desktop/document media kind
- English and Arabic caption
- workflow order
- optional bilingual description
- source pixel dimensions

The gallery system now:

- uses `PageView.builder` for lazy full-resolution previews;
- uses `ListView.separated` for an internally scrolling thumbnail strip;
- preloads only current and adjacent images;
- resets and clamps selected indices after project changes;
- supports swipe/drag and desktop arrow keys;
- displays exact English and Arabic counters;
- opens the complete media list in a fullscreen `InteractiveViewer`;
- keeps controls, counters, and captions outside image pixels;
- uses the original asset path for main and fullscreen previews;
- uses DPR-aware decoding only for thumbnails.

## Al Raqi image-level presentation

The 32 approved images are classified as:

- **27** desktop application captures
- **4** browser/public-tracking captures
- **1** document/print-preview capture

The correct desktop, browser, or document presentation is selected per image rather than forcing the whole project into one device frame.

## Noga presentation

All 24 approved Noga screenshots are 576×1280 portrait mobile captures. They use phone presentation, preserve their natural aspect ratio, and remain accessible through the complete gallery and fullscreen sequence.

## Runtime-safety preservation

- Nullable project lookup and invalid-slug handling remain intact.
- Project-detail pages retain project-ID page keys.
- Named `go_router` navigation and safe next/previous traversal remain intact.
- Project pages scroll to the top after navigation.
- `ProjectGallery.didUpdateWidget` resets and clamps stale state.
- Empty and one-image galleries remain safe.
- Noga Mobile and Al Raqi Mobile retain no APK action.
- A2H remains Mobile with a phone mockup.
- Game Zone remains Desktop.
- TargetX direct-route and stale-gallery safeguards remain present.

## Acceptance-test source added or updated

- Exact assertions for Al Raqi `32`, Noga `24`, and total `56`.
- Every approved path exists and is unique within its project gallery.
- Every approved media item has workflow order and media metadata.
- Counters reach `32 / 32` and `24 / 24`.
- Fullscreen tests traverse all 32 Al Raqi and all 24 Noga items.
- Empty, one-image, and large galleries remain covered.
- Selected-index reset/clamp regression coverage remains present.
- Noga/Al APK absence, A2H Mobile classification, TargetX route safeguards, localization parity, and Hero-tag checks remain present.
- Responsive widget-test source covers 320, 340, 360, 375, 390, 430, 768, 1024, and 1440 pixels.

## Static validation

The final static validation measured:

- **87 Dart files**: 80 under `lib/`, 7 under `test/`.
- **270 unique AppAssets paths**, all present.
- **25 declared pubspec asset entries/directories**, all present.
- **94 English and 94 Arabic localization keys**, synchronized.
- **18 unique URL-safe project IDs**.
- **266 readable image files**.
- **262 active project gallery images**.
- **56/56 approved screenshots byte-for-byte preserved**.
- No unresolved relative/package imports.
- No delimiter-balance issue detected by static lexical inspection.
- No unsafe `firstWhere`, debug print, Hero widget/tag, obsolete public Noga/Al media folder, raw archive, build/cache directory, or plaintext credential signature detected.

Flutter is required to confirm compiler semantics, widget execution, browser rendering, and performance.

## Command and runtime status

- `flutter analyze`: **NOT RUN — Flutter SDK unavailable**
- `flutter test`: **NOT RUN — Flutter SDK unavailable**
- `flutter test --platform chrome`: **NOT RUN — Flutter SDK unavailable**
- `flutter build web --release`: **NOT RUN — Flutter SDK unavailable**
- Browser responsive and DevTools Network verification: **NOT RUN — Flutter SDK unavailable**

Run `qa_portfolio.ps1` and complete `RESPONSIVE_QA_CHECKLIST.md` before deployment.

# Mohamed Ibrahim — Flutter Developer Portfolio

A bilingual Flutter Web portfolio for **Mohamed Ibrahim**, presenting real mobile, Windows/Desktop, web, and cross-platform work through responsive product mockups, data-driven case studies, safe shareable routes, sharp galleries, and lazy showcase videos.

## Authoritative Media V4 release

- **18 project case studies** from one master data source.
- **262 project gallery images** referenced by active project records.
- **32 approved Al Raqi Mobile screenshots** integrated, publicly reachable, and excluded: **0**.
- **24 approved Noga Mobile screenshots** integrated, publicly reachable, and excluded: **0**.
- The 56 newly approved screenshots remain byte-for-byte copies of the supplied PNG/JPEG files; no lossy conversion, blur, redaction, deduplication, or placeholder substitution was applied.
- New cache-busting folders and filenames:
  - `assets/images/projects/al_raqi_mobile/authoritative_v4/`
  - `assets/images/projects/noga_mobile/authoritative_v4/`
- Al Raqi uses image-level media classification for desktop, browser, and document presentation.
- Noga Mobile uses a portrait phone presentation for every approved screenshot.
- Both projects retain **View Case Study** and **Watch Showcase**, with no APK action.
- Existing route safety, gallery reset/clamping, TargetX stale-index fix, Experience overflow fix, A2H Mobile classification, sticky-navbar offsets, modal drawer, scroll-spy, localization, and updated CV remain preserved.

Current authoritative documentation:

- `AUTHORITATIVE_MEDIA_INTEGRATION_REPORT.md`
- `ZERO_BLUR_FINAL_AUDIT.md`
- `PROJECT_ASSET_MAP.md`
- `FULL_PROJECT_INTEGRATION_REPORT.md`
- `RESPONSIVE_QA_CHECKLIST.md`
- `CHANGED_FILES.md`
- `FINAL_RELEASE_MANIFEST.md`

## Product features

- Flutter Web only.
- English default; Arabic RTL with locally persisted language selection.
- Premium dark design system with centralized colors, typography, spacing, radius, shadows, gradients, breakpoints, and animation durations.
- Code-built Pro Max-style hero device with real app screenshots and no large hero portrait.
- Mohamed’s approved photo in Navbar, About, and Footer, with MI only as an image-error fallback.
- `30+ Projects` / `+30 مشروعًا` localized consistently.
- Scroll-spy navbar with sticky-offset-aware smooth scrolling and route-to-section handoff.
- Complete Projects page with All, Mobile, Windows, and Web filters.
- Deterministic project priority fields rather than insertion-order assumptions.
- Phone, browser, desktop, and document presentation selected from project-level or image-level media metadata.
- Large galleries with lazy `PageView.builder`, scrollable thumbnails, swipe/drag, keyboard arrows, counters, fullscreen zoom/pan, RTL controls, and adjacent-image preloading.
- Safe empty and one-image gallery states.
- Bilingual case studies with evidence-grounded public copy.
- Responsive Flutter App Lab for the strongest projects.
- Bundled updated CV in PDF and DOCX, SEO metadata, manifest, favicon, and Open Graph cover.

## Project order

### Mobile applications

1. Dr. Yasmeen Pharmacy — `dr-yasmeen-pharmacy`
2. Noga Mobile — `noga-mobile`
3. Sharks Academy — `sharks-academy`
4. TargetX — `targetx-app`
5. Farah Services — `farah-services`
6. Trelixi Learning App — `trelixi-learning-app`
7. Education App — `education-app`
8. Cleany — `cleany-app`
9. Fitness App — `fitness-app`
10. Kanzoon App — `kanzoon-app`
11. Recast Food App — `recast-food-app`
12. Shop Smart — `shop-smart`
13. A2H Inventory & Invoicing — `a2h-inventory-invoicing`

### Windows & Desktop applications

1. Game Zone — `game-zone`
2. Rusheta Windows — `rusheta-windows-app`

### Web and cross-platform projects

1. Ahla Beauty Storefront — `ahla-beauty`
2. Gypsum Home — `gypsum-home`
3. Al Raqi Mobile — Repair Center Management System — `al-raqi-mobile`

## Routes

| Route | Purpose |
|---|---|
| `/` | Scroll-spy homepage |
| `/?section=projects` | Homepage, then scroll safely to Projects after layout |
| `/?section=experience` | Homepage Experience section |
| `/?section=skills` | Homepage Skills section |
| `/?section=process` | Homepage Process section |
| `/?section=contact` | Homepage Contact section |
| `/projects` | Complete project collection; All selected by default |
| `/projects/:id` | Shareable project case study |
| `/contact` | Dedicated contact page |

Project-detail pages use keys derived from `project.id`. Invalid slugs render a branded not-found state rather than throwing.

## Runtime-safety architecture

`lib/features/projects/data/projects_data.dart` provides ordered project collections, nullable `byId`, and safe next/previous traversal. `ProjectGallery` resets its selected index in `didUpdateWidget`, clamps requested indices, and never assumes media is non-empty. Project-detail pages use project-ID-based keys, named `go_router` navigation, and scroll-to-top behavior.

The authoritative screenshot metadata lives in:

```text
lib/features/projects/data/authoritative_media_data.dart
```

Each `ProjectMediaItem` can define:

- asset path
- phone/browser/desktop/document media kind
- English and Arabic captions
- workflow order
- source pixel dimensions

## Authoritative image folders

```text
assets/images/projects/al_raqi_mobile/authoritative_v4/
  al_raqi_01_v4.jpg ... al_raqi_29_v4.jpg
  al_raqi_30_v4.png ... al_raqi_32_v4.png

assets/images/projects/noga_mobile/authoritative_v4/
  noga_01_v4.jpg ... noga_24_v4.jpg
```

Do not replace these with thumbnails or compressed derivatives. Main previews and fullscreen views use the original files. Thumbnails may request a DPR-aware decode size without altering the source file.

## Showcase videos

```text
assets/videos/noga_mobile_showcase_v3.mp4
assets/videos/al_raqi_mobile_showcase_v3.mp4
```

Video controllers initialize only after **Watch Showcase** is clicked, are keyed by project/video path, and are disposed when the path changes or the dialog closes. Playback failure falls back to the current sharp screenshot presentation.

## Folder structure

```text
mohamed_ibrahim_portfolio/
  pubspec.yaml
  analysis_options.yaml
  README.md
  TODO.md
  qa_portfolio.ps1
  AUTHORITATIVE_MEDIA_INTEGRATION_REPORT.md
  ZERO_BLUR_FINAL_AUDIT.md
  PROJECT_ASSET_MAP.md
  FULL_PROJECT_INTEGRATION_REPORT.md
  RESPONSIVE_QA_CHECKLIST.md
  CHANGED_FILES.md
  FINAL_RELEASE_MANIFEST.md
  OVERFLOW_FIX_REPORT.md
  SCROLLSPY_IMPLEMENTATION_REPORT.md
  SECURITY_SANITIZATION_REPORT.md
  UPDATED_CV_CONTENT.md
  CV_CHANGELOG.md
  SOURCE_EVIDENCE_REPORT.md
  lib/
  assets/
  test/
  web/
```

## Project data and asset updates

Project content:

```text
lib/features/projects/data/projects_data.dart
```

Authoritative media metadata:

```text
lib/features/projects/data/authoritative_media_data.dart
```

Asset constants:

```text
lib/core/constants/app_assets.dart
```

External URLs:

```text
lib/core/constants/app_links.dart
```

When adding a new project image:

1. Put the full-resolution file in the correct project folder.
2. Use a stable, meaningful filename.
3. Register the path in `AppAssets`.
4. Add a `ProjectMediaItem` when image-level type/caption metadata is needed.
5. Ensure `pubspec.yaml` declares the directory.
6. Update `PROJECT_ASSET_MAP.md` and count/path tests.
7. Do not guess technologies, ownership, release status, or public links.

## Localization and RTL

Language state:

```text
lib/app/localization/language_cubit.dart
```

Synchronized strings:

```text
lib/app/localization/app_localizations.dart
lib/l10n/app_en.arb
lib/l10n/app_ar.arb
```

English is the default. Arabic switches the application to RTL while retaining technical names such as Flutter, Firebase, API, and Clean Architecture where appropriate. The selected language is persisted with `SharedPreferences`.

## Updated CV

The package includes:

```text
assets/cv/Mohamed_Ibrahim_Updated_CV.pdf
assets/cv/Mohamed_Ibrahim_Updated_CV.docx
```

The Download CV action opens the updated PDF.

## Run locally

```bash
flutter pub get
flutter run -d chrome
```

Profile performance:

```bash
flutter run -d chrome --profile
```

## Required Windows QA

```powershell
cd mohamed_ibrahim_portfolio
.\qa_portfolio.ps1
```

The fail-fast script runs:

```text
flutter --version
flutter clean
flutter pub get
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
flutter test --platform chrome
flutter build web --release
```

Then complete every item in `RESPONSIVE_QA_CHECKLIST.md` in English and Arabic.

## Build and deploy

Release build:

```bash
flutter build web --release
```

Output:

```text
build/web
```

Firebase Hosting:

```bash
npm install -g firebase-tools
firebase login
firebase init hosting
flutter build web --release
firebase deploy
```

Use `build/web` as the public directory, configure it as a single-page app, and do not overwrite Flutter’s generated `index.html`.

GitHub Pages for a repository named `portfolio`:

```bash
flutter build web --release --base-href /portfolio/
```

Publish `build/web` and replace `/portfolio/` with the actual repository name.

## Acceptance-test source included

- Exact Al Raqi count: **32**.
- Exact Noga count: **24**.
- Exact approved total: **56**.
- Every approved path exists and is unique within its project gallery.
- All approved media is reachable through gallery and fullscreen data flow.
- Gallery counters reach `32 / 32` and `24 / 24`.
- Fullscreen tests traverse every approved image.
- Empty, one-image, and large galleries remain safe.
- Gallery selected index resets and clamps after project changes.
- TargetX route safeguards remain intact.
- Noga and Al Raqi contain no APK action.
- A2H remains Mobile; Game Zone remains Desktop.
- English and Arabic localization keys match.
- Responsive widget-test source covers 320, 340, 360, 375, 390, 430, 768, 1024, and 1440 pixels.

## Command status in this packaging environment

Flutter and Dart were not installed, so no runtime command is represented as passing:

- `flutter analyze`: **NOT RUN — Flutter SDK unavailable**
- `flutter test`: **NOT RUN — Flutter SDK unavailable**
- `flutter test --platform chrome`: **NOT RUN — Flutter SDK unavailable**
- `flutter build web --release`: **NOT RUN — Flutter SDK unavailable**
- Browser responsive/runtime verification: **NOT RUN — Flutter SDK unavailable**

The strongest available static validation is recorded in `FULL_PROJECT_INTEGRATION_REPORT.md` and `FINAL_RELEASE_MANIFEST.md`.

# Authoritative Media Integration Report

## Release decision

The two newly supplied archives are the only authoritative screenshot sources for Al Raqi Mobile and Noga Mobile. All visible business and customer information in these 56 screenshots is owner-approved synthetic demonstration data. No approved screenshot was blurred, redacted, cropped to conceal data, deduplicated, substituted, or omitted.

## Mandatory count reconciliation

| Project | Expected | Supplied | Integrated | Publicly accessible | Excluded |
|---|---:|---:|---:|---:|---:|
| Al Raqi Mobile | 32 | 32 | 32 | 32 | 0 |
| Noga Mobile | 24 | 24 | 24 | 24 | 0 |
| **Total** | **56** | **56** | **56** | **56** | **0** |

All 56 final files are byte-for-byte copies of the approved uploads. Original PNG/JPEG formats were preserved; no lossy conversion or AI regeneration was performed.

## Public integration points

- `AppAssets` registers the full ordered lists.
- `AuthoritativeMediaData` assigns image-level media type, bilingual caption, source dimensions, and workflow order.
- `ProjectModel.validMediaItems` exposes the complete ordered gallery without a first-N limit.
- Project cards, homepage/Flutter App Lab surfaces, case-study heroes, and showcase posters use approved full-resolution cover images.
- `ProjectGallery` provides lazy `PageView.builder` navigation, previous/next controls, an internally scrolling thumbnail strip, counters, keyboard arrows, swipe/drag, and adjacent-image preloading.
- `FullscreenProjectMediaViewer` receives the same complete list and supports zoom, pan, swipe, arrows, Escape-to-close, bilingual counters, and safe index reset/clamping.
- Flutter runtime commands were unavailable in this environment. “Publicly accessible” here means statically registered and reachable through the project route/gallery/fullscreen data flow; browser execution remains a local QA step.

## Cover selections

- **Al Raqi Mobile:** `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_23_v4.jpg` — inventory report dashboard.
- **Noga Mobile:** `assets/images/projects/noga_mobile/authoritative_v4/noga_15_v4.jpg` — accounting operations dashboard.

## Al Raqi Mobile — exact 32-file mapping

| # | Original filename | Final filename | Dimensions | Final path | Media type | Visible workflow | Cover | Runtime availability |
|---:|---|---|---:|---|---|---|---|---|
| 1 | `photo_10_2026-06-19_04-42-38.jpg` | `al_raqi_01_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_01_v4.jpg` | `browser` | authentication or entry | No | Statically mapped to gallery and fullscreen |
| 2 | `photo_1_2026-06-19_04-42-38.jpg` | `al_raqi_02_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_02_v4.jpg` | `desktop` | dashboard and repair records | No | Statically mapped to gallery and fullscreen |
| 3 | `photo_2_2026-06-19_04-42-38.jpg` | `al_raqi_03_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_03_v4.jpg` | `desktop` | status queue | No | Statically mapped to gallery and fullscreen |
| 4 | `WhatsApp Image 2026-06-16 at 1.22.51 AM.jpeg` | `al_raqi_04_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_04_v4.jpg` | `desktop` | customers | No | Statically mapped to gallery and fullscreen |
| 5 | `WhatsApp Image 2026-06-16 at 1.22.52 AM.jpeg` | `al_raqi_05_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_05_v4.jpg` | `desktop` | customer details | No | Statically mapped to gallery and fullscreen |
| 6 | `WhatsApp Image 2026-06-16 at 1.22.45 AM (1).jpeg` | `al_raqi_06_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_06_v4.jpg` | `desktop` | customer repair history | No | Statically mapped to gallery and fullscreen |
| 7 | `photo_4_2026-06-19_04-42-38.jpg` | `al_raqi_07_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_07_v4.jpg` | `desktop` | device intake | No | Statically mapped to gallery and fullscreen |
| 8 | `photo_5_2026-06-19_04-42-38.jpg` | `al_raqi_08_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_08_v4.jpg` | `desktop` | device intake details | No | Statically mapped to gallery and fullscreen |
| 9 | `photo_6_2026-06-19_04-42-38.jpg` | `al_raqi_09_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_09_v4.jpg` | `desktop` | repair setup | No | Statically mapped to gallery and fullscreen |
| 10 | `photo_7_2026-06-19_04-42-38.jpg` | `al_raqi_10_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_10_v4.jpg` | `desktop` | repair intake notes | No | Statically mapped to gallery and fullscreen |
| 11 | `photo_8_2026-06-19_04-42-38.jpg` | `al_raqi_11_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_11_v4.jpg` | `desktop` | multi-device intake | No | Statically mapped to gallery and fullscreen |
| 12 | `WhatsApp Image 2026-06-16 at 1.22.50 AM (1).jpeg` | `al_raqi_12_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_12_v4.jpg` | `desktop` | multi-device batch | No | Statically mapped to gallery and fullscreen |
| 13 | `WhatsApp Image 2026-06-16 at 1.22.49 AM (2).jpeg` | `al_raqi_13_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_13_v4.jpg` | `desktop` | repair record | No | Statically mapped to gallery and fullscreen |
| 14 | `WhatsApp Image 2026-06-16 at 1.22.49 AM.jpeg` | `al_raqi_14_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_14_v4.jpg` | `desktop` | communication | No | Statically mapped to gallery and fullscreen |
| 15 | `WhatsApp Image 2026-06-16 at 1.22.50 AM.jpeg` | `al_raqi_15_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_15_v4.jpg` | `desktop` | repair workflow | No | Statically mapped to gallery and fullscreen |
| 16 | `WhatsApp Image 2026-06-16 at 1.22.49 AM (1).jpeg` | `al_raqi_16_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_16_v4.jpg` | `document` | tracking and document | No | Statically mapped to gallery and fullscreen |
| 17 | `WhatsApp Image 2026-06-16 at 1.22.51 AM (1).jpeg` | `al_raqi_17_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_17_v4.jpg` | `desktop` | technicians | No | Statically mapped to gallery and fullscreen |
| 18 | `WhatsApp Image 2026-06-16 at 1.22.51 AM (2).jpeg` | `al_raqi_18_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_18_v4.jpg` | `desktop` | technician operations | No | Statically mapped to gallery and fullscreen |
| 19 | `WhatsApp Image 2026-06-16 at 1.22.52 AM (1).jpeg` | `al_raqi_19_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_19_v4.jpg` | `desktop` | technician details | No | Statically mapped to gallery and fullscreen |
| 20 | `WhatsApp Image 2026-06-16 at 1.22.46 AM.jpeg` | `al_raqi_20_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_20_v4.jpg` | `desktop` | returns | No | Statically mapped to gallery and fullscreen |
| 21 | `WhatsApp Image 2026-06-16 at 1.22.44 AM.jpeg` | `al_raqi_21_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_21_v4.jpg` | `desktop` | communication center | No | Statically mapped to gallery and fullscreen |
| 22 | `WhatsApp Image 2026-06-16 at 1.22.47 AM (1).jpeg` | `al_raqi_22_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_22_v4.jpg` | `desktop` | customer messaging | No | Statically mapped to gallery and fullscreen |
| 23 | `WhatsApp Image 2026-06-16 at 1.22.44 AM (1).jpeg` | `al_raqi_23_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_23_v4.jpg` | `desktop` | inventory dashboard | Yes | Statically mapped to gallery and fullscreen |
| 24 | `WhatsApp Image 2026-06-16 at 1.22.45 AM.jpeg` | `al_raqi_24_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_24_v4.jpg` | `desktop` | inventory filters | No | Statically mapped to gallery and fullscreen |
| 25 | `WhatsApp Image 2026-06-16 at 1.22.46 AM (2).jpeg` | `al_raqi_25_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_25_v4.jpg` | `desktop` | inventory results | No | Statically mapped to gallery and fullscreen |
| 26 | `WhatsApp Image 2026-06-16 at 1.22.47 AM.jpeg` | `al_raqi_26_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_26_v4.jpg` | `desktop` | inventory records | No | Statically mapped to gallery and fullscreen |
| 27 | `photo_9_2026-06-19_04-42-38.jpg` | `al_raqi_27_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_27_v4.jpg` | `desktop` | reports | No | Statically mapped to gallery and fullscreen |
| 28 | `photo_3_2026-06-19_04-42-38.jpg` | `al_raqi_28_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_28_v4.jpg` | `desktop` | operational utility | No | Statically mapped to gallery and fullscreen |
| 29 | `WhatsApp Image 2026-06-16 at 1.22.46 AM (1).jpeg` | `al_raqi_29_v4.jpg` | 1280×800 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_29_v4.jpg` | `desktop` | settings and administration | No | Statically mapped to gallery and fullscreen |
| 30 | `2026-06-19.png` | `al_raqi_30_v4.png` | 1920×1080 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_30_v4.png` | `browser` | public web tracking | No | Statically mapped to gallery and fullscreen |
| 31 | `2026-06-19 (1).png` | `al_raqi_31_v4.png` | 1920×1080 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_31_v4.png` | `browser` | public tracking journey | No | Statically mapped to gallery and fullscreen |
| 32 | `2026-06-19 (2).png` | `al_raqi_32_v4.png` | 1920×1080 | `assets/images/projects/al_raqi_mobile/authoritative_v4/al_raqi_32_v4.png` | `browser` | delivery confirmation | No | Statically mapped to gallery and fullscreen |

### Al Raqi media-type totals

- Desktop application captures: **27**
- Browser/public-tracking captures: **4**
- Document/print-preview captures: **1**
- Phone captures: **0** in this approved archive

## Noga Mobile — exact 24-file mapping

| # | Original filename | Final filename | Dimensions | Final path | Media type | Visible workflow | Cover | Runtime availability |
|---:|---|---|---:|---|---|---|---|---|
| 1 | `splash.jpg` | `noga_01_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_01_v4.jpg` | `phone` | splash or entry | No | Statically mapped to gallery and fullscreen |
| 2 | `photo_1_2026-06-18_02-26-48.jpg` | `noga_02_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_02_v4.jpg` | `phone` | home and work orders | No | Statically mapped to gallery and fullscreen |
| 3 | `photo_2_2026-06-18_02-26-48.jpg` | `noga_03_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_03_v4.jpg` | `phone` | main navigation | No | Statically mapped to gallery and fullscreen |
| 4 | `photo_3_2026-06-18_02-26-48.jpg` | `noga_04_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_04_v4.jpg` | `phone` | management navigation | No | Statically mapped to gallery and fullscreen |
| 5 | `photo_4_2026-06-18_02-26-48.jpg` | `noga_05_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_05_v4.jpg` | `phone` | technicians | No | Statically mapped to gallery and fullscreen |
| 6 | `photo_5_2026-06-18_02-26-48.jpg` | `noga_06_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_06_v4.jpg` | `phone` | customers | No | Statically mapped to gallery and fullscreen |
| 7 | `photo_6_2026-06-18_02-26-48.jpg` | `noga_07_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_07_v4.jpg` | `phone` | returns | No | Statically mapped to gallery and fullscreen |
| 8 | `photo_13_2026-06-18_02-26-48.jpg` | `noga_08_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_08_v4.jpg` | `phone` | single-device intake | No | Statically mapped to gallery and fullscreen |
| 9 | `photo_14_2026-06-18_02-26-48.jpg` | `noga_09_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_09_v4.jpg` | `phone` | device details | No | Statically mapped to gallery and fullscreen |
| 10 | `photo_15_2026-06-18_02-26-48.jpg` | `noga_10_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_10_v4.jpg` | `phone` | fault intake | No | Statically mapped to gallery and fullscreen |
| 11 | `photo_16_2026-06-18_02-26-48.jpg` | `noga_11_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_11_v4.jpg` | `phone` | attachments and customer communication | No | Statically mapped to gallery and fullscreen |
| 12 | `photo_17_2026-06-18_02-26-48.jpg` | `noga_12_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_12_v4.jpg` | `phone` | multi-device intake | No | Statically mapped to gallery and fullscreen |
| 13 | `photo_18_2026-06-18_02-26-48.jpg` | `noga_13_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_13_v4.jpg` | `phone` | multi-device details | No | Statically mapped to gallery and fullscreen |
| 14 | `photo_19_2026-06-18_02-26-48.jpg` | `noga_14_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_14_v4.jpg` | `phone` | operational utility | No | Statically mapped to gallery and fullscreen |
| 15 | `photo_20_2026-06-18_02-26-48.jpg` | `noga_15_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_15_v4.jpg` | `phone` | accounting dashboard | Yes | Statically mapped to gallery and fullscreen |
| 16 | `photo_21_2026-06-18_02-26-48.jpg` | `noga_16_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_16_v4.jpg` | `phone` | accounting summary | No | Statically mapped to gallery and fullscreen |
| 17 | `photo_22_2026-06-18_02-26-48.jpg` | `noga_17_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_17_v4.jpg` | `phone` | operational filters | No | Statically mapped to gallery and fullscreen |
| 18 | `photo_23_2026-06-18_02-26-48.jpg` | `noga_18_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_18_v4.jpg` | `phone` | technician settlements | No | Statically mapped to gallery and fullscreen |
| 19 | `photo_10_2026-06-18_02-26-48.jpg` | `noga_19_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_19_v4.jpg` | `phone` | end-of-day summary | No | Statically mapped to gallery and fullscreen |
| 20 | `photo_11_2026-06-18_02-26-48.jpg` | `noga_20_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_20_v4.jpg` | `phone` | end-of-day actions | No | Statically mapped to gallery and fullscreen |
| 21 | `photo_12_2026-06-18_02-26-48.jpg` | `noga_21_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_21_v4.jpg` | `phone` | daily results | No | Statically mapped to gallery and fullscreen |
| 22 | `photo_7_2026-06-18_02-26-48.jpg` | `noga_22_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_22_v4.jpg` | `phone` | backup creation | No | Statically mapped to gallery and fullscreen |
| 23 | `photo_8_2026-06-18_02-26-48.jpg` | `noga_23_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_23_v4.jpg` | `phone` | backup management | No | Statically mapped to gallery and fullscreen |
| 24 | `photo_9_2026-06-18_02-26-48.jpg` | `noga_24_v4.jpg` | 576×1280 | `assets/images/projects/noga_mobile/authoritative_v4/noga_24_v4.jpg` | `phone` | settings and administration | No | Statically mapped to gallery and fullscreen |

### Noga media-type totals

- Phone captures: **24**
- Desktop, browser, and document captures: **0**

## Automated acceptance coverage added

- Exact assertions for 32 Al Raqi screenshots, 24 Noga screenshots, and 56 total.
- Existence, non-empty file, deterministic folder, and uniqueness assertions.
- Exact workflow-order and media-kind assertions.
- Gallery-counter tests reaching `32 / 32` and `24 / 24`.
- Fullscreen tests that pass the complete media list and navigate every approved image.
- Gallery reset/clamp, empty gallery, one-image gallery, TargetX route safeguards, APK absence, A2H Mobile classification, localization parity, and duplicate-Hero checks.

## Runtime command status

- `flutter analyze`: **NOT RUN — Flutter SDK unavailable**
- `flutter test`: **NOT RUN — Flutter SDK unavailable**
- `flutter test --platform chrome`: **NOT RUN — Flutter SDK unavailable**
- `flutter build web --release`: **NOT RUN — Flutter SDK unavailable**

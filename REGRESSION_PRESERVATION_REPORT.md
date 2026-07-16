# Regression Preservation Report

## Baseline and scope

The untouched latest supplied project was extracted separately before stabilization and compared with the corrected tree. The stabilization changes are limited to responsive controls, shared action layout, related tests, and release documentation. Project content, approved media, routes, ordering, videos, CV files, and prior runtime safeguards were not replaced.

## Before/after inventory

| Item | Before | After |
|---|---:|---:|
| Projects | 18 | 18 |
| Project gallery images | 262 | 262 |
| Al Raqi approved screenshots | 32 | 32 |
| Noga approved screenshots | 24 | 24 |
| TargetX screenshots | 13 | 13 |
| Showcase videos | 2 | 2 |
| Dart library files | 80 | 82 |
| Dart test files | 7 | 8 |

### Project screenshot counts preserved

| Project ID | Count |
|---|---:|
| `dr-yasmeen-pharmacy` | 14 |
| `noga-mobile` | 24 |
| `sharks-academy` | 25 |
| `targetx-app` | 13 |
| `farah-services` | 13 |
| `trelixi-learning-app` | 20 |
| `education-app` | 7 |
| `cleany-app` | 6 |
| `fitness-app` | 7 |
| `kanzoon-app` | 8 |
| `recast-food-app` | 4 |
| `shop-smart` | 2 |
| `game-zone` | 1 |
| `a2h-inventory-invoicing` | 6 |
| `rusheta-windows-app` | 10 |
| `ahla-beauty` | 42 |
| `gypsum-home` | 28 |
| `al-raqi-mobile` | 32 |

## Preserved routes and IDs

Routes remain:

- `/`
- `/projects`
- `/projects/:id`
- `/contact`

Project IDs remain unchanged:

`dr-yasmeen-pharmacy`, `noga-mobile`, `sharks-academy`, `targetx-app`, `farah-services`, `trelixi-learning-app`, `education-app`, `cleany-app`, `fitness-app`, `kanzoon-app`, `recast-food-app`, `shop-smart`, `game-zone`, `a2h-inventory-invoicing`, `rusheta-windows-app`, `ahla-beauty`, `gypsum-home`, `al-raqi-mobile`.

## Prior safeguards confirmed intact

1. **TargetX stale-gallery crash fix:** project-specific route/page/gallery keys remain.
2. **Project-ID-based page keys:** router still uses `project-page-$projectId` and details keys based on the ID.
3. **Safe nullable project lookup:** `ProjectsData.byId` iterates safely and returns `null`; project details render a branded not-found page.
4. **Safe next/previous traversal:** empty-list and invalid-index guards remain before modulo navigation.
5. **Gallery reset:** `ProjectGallery.didUpdateWidget` resets to page/index zero when the project or gallery changes.
6. **Gallery clamping:** requested and selected indices remain clamped.
7. **Empty gallery:** fallback stage remains and no unchecked first item is read.
8. **One-image gallery:** controls are conditionally omitted and the sole image remains safe.
9. **Invalid slug handling:** branded project-not-found behavior remains.
10. **Scroll-to-top after project navigation:** details-page navigation still creates project-specific state and resets its scroll position.
11. **Sticky-navbar offsets:** centralized `AppNavbarMetrics` remains and was aligned with the new 1280 px full-navigation breakpoint.
12. **Scroll-spy navigation:** homepage section registry/state behavior is unchanged.
13. **Modal mobile drawer:** `showGeneralDialog`, modal barrier, SafeArea, internal scrolling, and close-before-navigation behavior remain.
14. **Experience natural height:** content-driven timeline cards remain.
15. **Experience chips:** technology lists continue to use `Wrap` with spacing/run spacing.
16. **A2H classification:** remains `ProjectType.mobile`.
17. **A2H mockup:** remains phone-based through its mobile type/default media kind.
18. **Game Zone classification:** remains `ProjectType.desktop` with desktop media presentation.
19. **Game Zone approved gallery:** unchanged.
20. **Al Raqi count:** exactly 32 approved screenshots remain.
21. **Noga count:** exactly 24 approved screenshots remain.
22. **Approved-media inclusion:** no Al Raqi/Noga screenshot was removed or excluded.
23. **Zero-blur policy:** project media widgets and authoritative assets are unchanged.
24. **Current showcase videos:** `assets/videos/noga_mobile_showcase_v3.mp4` and `assets/videos/al_raqi_mobile_showcase_v3.mp4` remain.
25. **Noga APK removal:** `showApkButton` remains false and no APK link is present.
26. **Al Raqi APK removal:** `showApkButton` remains false and no APK link is present.
27. **Updated profile photo:** `assets/images/profile/mohamed_ibrahim.jpg` remains the navbar/footer identity source with MI fallback.
28. **Updated CV PDF/DOCX:** both remain under `assets/cv/`.
29. **CV link:** the portfolio continues to use the updated PDF path.
30. **30+ Projects copy:** English and Arabic localized copies remain.
31. **English/Arabic localization:** 94/94 keys remain synchronized.
32. **Arabic RTL typography:** direction/localization architecture is unchanged.
33. **Project ordering and filters:** deterministic master data and platform filters are unchanged.
34. **Project routes:** all IDs and route mappings are unchanged.
35. **Screenshot galleries:** all project lists/media items are unchanged.
36. **Fullscreen viewer:** zoom/pan/navigation implementation remains.
37. **AssetManifest and fonts:** asset declarations and Google Fonts dependency remain.
38. **SEO metadata:** Web title/description/manifest assets are unchanged.
39. **CV and project content:** no public project claims or employment content changed.
40. **Secret exposure:** no new credentials, token values, raw source archives, or private configuration were introduced.

## New stabilization-only protections

- Constraint-aware buttons shared by primary and secondary styles.
- Actual-inner-width navbar branching and keyed fixed controls.
- Responsive action groups that stack at narrow widths.
- Fatal hit-test behavior in the mobile drawer test.
- Dedicated button/navbar regression tests across English, Arabic, constrained widths, and increased text scaling.

## Verification status

All preservation checks above were confirmed statically against the exact baseline and corrected source tree. Flutter execution remains **NOT RUN — Flutter SDK unavailable**.

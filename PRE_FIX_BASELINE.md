# Pre-fix Baseline

Baseline source: `mohamed_ibrahim_flutter_portfolio_all_approved_media_final(1).zip`, the exact project supplied with the authoritative local Flutter failure log.

## Project IDs

- `dr-yasmeen-pharmacy`
- `noga-mobile`
- `sharks-academy`
- `targetx-app`
- `farah-services`
- `trelixi-learning-app`
- `education-app`
- `cleany-app`
- `fitness-app`
- `kanzoon-app`
- `recast-food-app`
- `shop-smart`
- `game-zone`
- `a2h-inventory-invoicing`
- `rusheta-windows-app`
- `ahla-beauty`
- `gypsum-home`
- `al-raqi-mobile`

Project count: **18**

## Screenshot counts

- `drYasmeenScreenshots`: 14
- `nogaMobileScreenshots`: 24
- `sharksAcademyScreenshots`: 25
- `targetxScreenshots`: 13
- `farahServicesScreenshots`: 13
- `trelixiScreenshots`: 20
- `educationScreenshots`: 7
- `cleanyScreenshots`: 6
- `fitnessScreenshots`: 7
- `kanzoonScreenshots`: 8
- `recastScreenshots`: 4
- `shopSmartScreenshots`: 2
- `gameZoneScreenshots`: 1
- `a2hScreenshots`: 6
- `rushetaScreenshots`: 10
- `ahlaBeautyScreenshots`: 42
- `gypsumHomeScreenshots`: 28
- `alRaqiMobileScreenshots`: 32

## Routes

- `/`
- `/projects`
- `/projects/:id`
- `/contact`

## Test files before stabilization

- `test/completion_regression_test.dart`
- `test/home_navigation_test.dart`
- `test/localization_sync_test.dart`
- `test/media_replacement_test.dart`
- `test/project_data_test.dart`
- `test/project_gallery_test.dart`
- `test/project_routes_test.dart`

## Preserved release assets

- Al Raqi authoritative screenshots: **32**
- Noga authoritative screenshots: **24**
- Noga showcase: `assets/videos/noga_mobile_showcase_v3.mp4`
- Al Raqi showcase: `assets/videos/al_raqi_mobile_showcase_v3.mp4`
- Updated CV PDF: `assets/cv/Mohamed_Ibrahim_Updated_CV.pdf`
- Updated CV DOCX: `assets/cv/Mohamed_Ibrahim_Updated_CV.docx`
- Profile image: `assets/images/profile/mohamed_ibrahim.jpg`

## Authoritative failing run

- Result: **53 passed, 32 failed**.
- The only rendered overflow sources reported were `AppOutlinedButton`, `GradientButton`, and `AppNavbar`.
- The mobile drawer interaction failed because the navbar menu control was laid out beyond the 390 px test viewport.
- Responsive homepage and Noga route tests failed as downstream consequences of those layout faults.

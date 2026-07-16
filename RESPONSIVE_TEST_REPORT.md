# Responsive Test Report

## Status definitions

- **Source coverage added:** the corrected project contains a widget test for the stated case.
- **Runtime result:** whether that test executed against the corrected tree in this environment.

Flutter and Dart are not installed in this execution environment. Therefore all corrected-tree runtime entries below are **NOT RUN — Flutter SDK unavailable**. No row is represented as passing.

## Authoritative pre-fix runtime evidence

The user-supplied local run ended at **53 passed / 32 failed**. Its rendering failures came from:

- `AppOutlinedButton` row overflow.
- `GradientButton` row overflow.
- `AppNavbar` row overflow.
- Off-screen mobile menu hit target, which prevented the modal drawer from opening.

The failed Noga route, Arabic route, and homepage responsive tests were downstream consumers of those shared controls.

## Corrected-tree automated coverage

### Homepage: English and Arabic

| Width | English source coverage | Arabic source coverage | Corrected-tree runtime |
|---:|:---:|:---:|---|
| 320 | Yes | Yes | NOT RUN — Flutter SDK unavailable |
| 340 | Yes | Yes | NOT RUN — Flutter SDK unavailable |
| 360 | Yes | Yes | NOT RUN — Flutter SDK unavailable |
| 375 | Yes | Yes | NOT RUN — Flutter SDK unavailable |
| 390 | Yes | Yes | NOT RUN — Flutter SDK unavailable |
| 393 | Yes | Yes | NOT RUN — Flutter SDK unavailable |
| 412 | Yes | Yes | NOT RUN — Flutter SDK unavailable |
| 430 | Yes | Yes | NOT RUN — Flutter SDK unavailable |
| 480 | Yes | Yes | NOT RUN — Flutter SDK unavailable |
| 768 | Yes | Yes | NOT RUN — Flutter SDK unavailable |
| 1024 | Yes | Yes | NOT RUN — Flutter SDK unavailable |
| 1440 | Yes | Yes | NOT RUN — Flutter SDK unavailable |

### New/high-risk project routes

The project-route matrix renders Noga Mobile, Al Raqi Mobile, Sharks Academy, Game Zone, and A2H at:

`320, 340, 360, 375, 390, 393, 412, 430, 480, 768, 1024, 1440`.

Corrected-tree runtime result for every width: **NOT RUN — Flutter SDK unavailable**.

Arabic Noga coverage exists at:

`320, 360, 375, 390, 393, 412, 430`.

Corrected-tree runtime result: **NOT RUN — Flutter SDK unavailable**.

### Navbar bounds

English and Arabic navbar source coverage exists at:

`320, 340, 360, 375, 390, 393, 412, 430, 480, 768, 1024, 1280, 1366, 1440`.

Each case checks:

- real profile avatar exists;
- compact/full branch is correct;
- mobile menu exists only in compact branch;
- menu rectangle starts at or after x=0;
- menu rectangle ends at or before the viewport width;
- `tester.takeException()` is null.

Corrected-tree runtime result: **NOT RUN — Flutter SDK unavailable**.

### Buttons

Both button styles have source coverage for:

| Constraint | Language | Text scale | Content |
|---:|---|---:|---|
| 160 px | English | 1.0 | Long icon + label |
| 188 px | English | 1.3 | Long icon + label |
| 218 px | Arabic | 1.5 | Long icon + label |
| 320 px | Arabic | 1.5 | Long icon + label |

Additional source coverage includes icon-only and text-only states and verifies a minimum height of 48 px.

Corrected-tree runtime result: **NOT RUN — Flutter SDK unavailable**.

### Mobile drawer interaction

The test now:

1. enables fatal hit-test warnings;
2. locates `Key('mobile-menu-button')`;
3. verifies the control rectangle is inside 390 px;
4. taps the control;
5. expects exactly one `MobileDrawer`;
6. taps `Key('drawer-projects')`;
7. expects the drawer to close;
8. reopens and verifies the Projects active state;
9. closes with the keyed close button.

Corrected-tree runtime result: **NOT RUN — Flutter SDK unavailable**.

## Manual browser matrix

`RESPONSIVE_QA_CHECKLIST.md` retains the full manual matrix:

`320, 340, 360, 375, 390, 393, 412, 430, 480, 600, 768, 820, 1024, 1280, 1366, 1440, 1536, 1920, above 1920`.

It separately covers English LTR, Arabic RTL, text scale 1.0/1.3, browser zoom 100%/125%/150%, navbar, hero, project routes, gallery, fullscreen viewer, contact, footer, horizontal overflow, RenderFlex overflow, and animation smoothness.

## Exact runtime-tested widths for the corrected tree

**None.** Flutter/Chrome execution was unavailable here. The supplied failing run is authoritative pre-fix evidence, not a post-fix certification result.

# Responsive QA Checklist — Zero-Overflow Runtime Stabilization

> Corrected-tree runtime status in this packaging environment: **NOT RUN — Flutter SDK unavailable.** The supplied local run was the pre-fix failure baseline. Complete this checklist with the included fail-fast `qa_portfolio.ps1` before deployment.

## Stabilization-specific controls

- ☐ `mobile-menu-button` rectangle is fully inside every mobile viewport and receives taps without hit-test warnings.
- ☐ `compact-navigation` is used whenever the actual inner navbar width cannot safely fit desktop navigation.
- ☐ `desktop-navigation` appears only when identity, links, language selector, and CV action fit.
- ☐ `AppOutlinedButton` fits 160, 188, and 218 px constraints with long English/Arabic labels.
- ☐ `GradientButton` fits 160, 188, and 218 px constraints with long English/Arabic labels.
- ☐ Both button styles remain safe at text scales 1.0, 1.3, and 1.5.
- ☐ Multi-action groups stack full-width below 560–600 px instead of using rigid rows.
- ☐ Mobile drawer opens from the keyed menu control and closes after a keyed section selection.


## Required viewport matrix

| Width | English LTR | Arabic RTL | Text 1.0 | Text 1.3 | Zoom 100% | Zoom 125% | Zoom 150% | Notes |
|---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|---|
| 320px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 340px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 360px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 375px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 390px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 393px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 412px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 430px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 480px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 600px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 768px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 820px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 1024px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 1280px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 1366px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 1440px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 1536px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| 1920px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | |
| Above 1920px | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ | Centered max-width layout |

## Global checks at every width

- ☐ No RenderFlex overflow warning, exception, or striped debug banner.
- ☐ No unintended horizontal page scrolling.
- ☐ No clipped heading, chip, button, counter, thumbnail, or modal control.
- ☐ No content hidden behind the sticky navbar.
- ☐ No media stretched, cropped destructively, softened, or enlarged beyond a reasonable source size.
- ☐ English LTR and Arabic RTL alignment, icon direction, wrapping, and control order are correct.
- ☐ Animation remains smooth; no visible layout jump when images or projects change.

## Navbar

- ☐ Profile photo loads sharply; MI appears only when image loading fails.
- ☐ Name, language switch, menu, and Download CV remain accessible.
- ☐ Active section/route indicator is correct.
- ☐ Section navigation accounts for the sticky-navbar offset.
- ☐ Mobile drawer blocks page input and page scrolling, closes with Escape/outside tap, and closes before navigation.
- ☐ No duplicate Download CV button is visible through the modal drawer.

## Hero

- ☐ Text precedes the device on narrow mobile.
- ☐ The Pro Max-style phone fits within viewport width.
- ☐ Technology chips remain outside the phone screen and do not overlap each other.
- ☐ “Open to Opportunities” remains in the text column and wraps safely.
- ☐ CTA buttons remain tappable and unclipped.
- ☐ Stats wrap without horizontal overflow.
- ☐ Hero screenshots remain sharp and unobstructed.

## Projects page

- ☐ All filter is selected initially.
- ☐ Mobile, Windows, and Web filters show the correct projects.
- ☐ Every stored project appears in the All view.
- ☐ Cards use correct phone/browser/desktop presentation.
- ☐ No card width exceeds the viewport.
- ☐ Project links wrap and remain tappable.

## TargetX details

- ☐ `/projects/targetx-app` renders without a red screen.
- ☐ Direct navigation and Next/Previous navigation both work.
- ☐ Gallery state does not retain a stale index from the previous project.
- ☐ All TargetX screenshots render with valid controls and counter.

## Noga Mobile details

- ☐ Exactly **24** approved screenshots are available.
- ☐ Counter progresses from `1 / 24` to `24 / 24`; Arabic uses `1 من 24` through `24 من 24`.
- ☐ Every thumbnail is reachable through internal horizontal scrolling.
- ☐ Every screenshot opens in fullscreen.
- ☐ Phone mockup remains portrait-friendly without a giant empty frame.
- ☐ No APK action appears.
- ☐ Watch Showcase uses `assets/videos/noga_mobile_showcase_v3.mp4`.

## Al Raqi Mobile details

- ☐ Exactly **32** approved screenshots are available.
- ☐ Counter progresses from `1 / 32` to `32 / 32`; Arabic uses `1 من 32` through `32 من 32`.
- ☐ Desktop images use desktop presentation.
- ☐ Public tracking images use browser presentation.
- ☐ QR report uses document presentation.
- ☐ Every screenshot opens in fullscreen.
- ☐ No APK action appears.
- ☐ Watch Showcase uses `assets/videos/al_raqi_mobile_showcase_v3.mp4`.

## Main gallery

- ☐ Empty, one-image, and multi-image galleries render safely.
- ☐ Selected index resets when the project changes.
- ☐ Requested and current indices remain clamped.
- ☐ Main preview uses the original full-resolution path and `BoxFit.contain`.
- ☐ Main preview never substitutes a thumbnail asset.
- ☐ Thumbnail strip uses `ListView` and scrolls internally.
- ☐ Previous/Next controls remain visible and tappable.
- ☐ Keyboard arrows work on desktop where focus is available.
- ☐ Adjacent images preload without loading all 56 approved images at once.

## Fullscreen viewer

- ☐ Every approved screenshot opens.
- ☐ Original aspect ratio is preserved.
- ☐ Zoom and pan work through `InteractiveViewer`.
- ☐ Swipe and Previous/Next navigation work.
- ☐ Counter remains visible and accurate.
- ☐ Close button remains inside SafeArea and accessible at 320px.
- ☐ Escape closes on desktop.
- ☐ RTL navigation order is natural.
- ☐ No blur, dark mask, gradient, opacity wash, or oversized play control covers media pixels.

## Technology chips, availability, CTA buttons, and stats

- ☐ Technology chips wrap without clipping.
- ☐ Availability pill remains compact in English and Arabic.
- ☐ Primary and secondary CTA labels fit at text scale 1.3.
- ☐ Stats wrap rather than forcing page width.

## Experience, Contact, and Footer

- ☐ Experience cards size from content; bullets and technology chips remain inside card bounds.
- ☐ Experience technology chips use Wrap with spacing and runSpacing.
- ☐ Contact cards and labels fit in English and Arabic.
- ☐ Footer avatar, identity text, and links wrap or stack cleanly.

## Animation smoothness

- ☐ Hero screenshot transitions do not alter layout size.
- ☐ Gallery transitions do not flash a low-resolution image.
- ☐ Flutter App Lab transitions use stable dimensions.
- ☐ Reduced-motion mode removes or reduces non-essential movement.
- ☐ No uncontrolled timer or animation continues after leaving a section/dialog.

## Cache and deployment verification

- ☐ Run `flutter clean` and `flutter build web --release`.
- ☐ Confirm `authoritative_v4` assets exist under `build/web/assets/assets/images/projects/...`.
- ☐ Search `build/web` for obsolete Noga/Al Raqi image folders; result must be empty.
- ☐ Confirm Network requests include `authoritative_v4` image URLs.
- ☐ Confirm Network requests use `noga_mobile_showcase_v3.mp4` and `al_raqi_mobile_showcase_v3.mp4`.
- ☐ Unregister the old service worker, clear site data, hard reload, and retest in Incognito.
- ☐ Deploy one clean `build/web`; do not merge with an older build directory.

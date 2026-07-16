# Source Evidence Report

This report separates public portfolio/CV claims by evidence strength. Unconfirmed claims are omitted from public copy or retained only as internal TODOs.

## Evidence definitions

| Evidence level | Definition |
|---|---|
| CV-confirmed | Present in Mohamed Ibrahim’s supplied CV. |
| Source-confirmed | Visible in the supplied Dart/source archives. |
| Owner-confirmed | Explicitly stated by Mohamed in the supplied requirements. |
| Screenshot-confirmed | Clearly visible in supplied project screenshots or presentation boards. |
| Unconfirmed | Not proved by the CV, source, owner statement, or screenshots. |

## CV-confirmed information

### Identity and employment

- Mohamed Ibrahim - Flutter Developer.
- Mansoura, Egypt.
- Bachelor’s Degree in Computer Science, Misr Higher Institute for Commerce & Computers (M.E.T Academy), 2020-2024.
- Flutter Developer at GROZA, Aug 2025-Present.
- Flutter Developer at Tawr Company, Aug 2024-Jul 2025.
- Flutter Developer at Fastweb Company, Feb 2024-Jul 2024.
- Freelance Flutter Developer, 2022-2024.

### CV-confirmed capabilities

- Flutter and Dart.
- Responsive UI and reusable widgets.
- Provider and Bloc.
- Clean Architecture and MVVM.
- REST APIs.
- Firebase Authentication, Firestore, Realtime Database, and Storage.
- Supabase.
- SQLite, Hive, and shared_preferences.
- Paymob, Stripe, and PayPal.
- PDF generation and printing.
- Git/GitHub, JSON, Agile, and Scrum.

### CV-confirmed projects/workflows

- Dr. Yasmeen Pharmacy: Flutter, Firebase, Supabase, Arabic/English, dark/light themes, Paymob, catalog/search/favorites/cart and offers.
- Trelixi Learning: Arabic learning for ages 5-12, five educational levels, animation, audio feedback, and progress tracking.
- Kanzoon: family allowances, savings goals, challenges, child profiles, dashboards, badges, rewards, and progress tracking.
- TargetX: Flutter e-commerce, API integration, state management, responsive UI, catalog/search/favorites/cart/checkout, Clean Architecture, and performance work.
- Farah Services: Provider, FirebaseAuth, Firestore, FirebaseStorage, PayPal, responsive UI, and admin panel.
- Education App: Provider, responsive UI, and Clean Architecture.
- Cleany: GoRouter, Provider, responsive UI, and API integration.
- Fitness App: pedometer, fl_chart, shimmer, and responsive UI.
- Rusheta Windows: Provider, sqflite, shared_preferences, PDF generation, and printing.

## Source-confirmed information

### Al Raqi Mobile source archive

Confirmed in the supplied Al Raqi Dart source:

- Flutter and Dart.
- Provider and GoRouter.
- Supabase Auth, Database, and Storage configuration/usage.
- Repository and service layers.
- shared_preferences and flutter_secure_storage.
- Role-aware access flows.
- Customer/device intake and history.
- Single-device and multi-device workflows.
- Repair lifecycle, technician assignment, parts requests, inventory, returned devices, financial adjustments, commissions, settlements, audit logs, and end-of-day reporting.
- Public repair tracking and QR/barcode workflows.
- WhatsApp/email customer communication.
- Image attachments.
- Bluetooth thermal printing and PDF/printing workflows.
- Backup/restore, trial/license controls, and Gemini-assisted image analysis.

### Game Zone source archive

Confirmed in the supplied Game Zone Dart source:

- Flutter Windows and Dart.
- Provider and GoRouter.
- SQLite through sqflite_common_ffi.
- shared_preferences.
- Local HTTP tracking server and Vercel status-page publishing workflow.
- Repair intake and staged repair status.
- PlayStation/Xbox and controller-specific device details.
- Inventory, used parts, stock alerts, warranty, revenue dashboard, backup/restore, and trial controls.
- QR/barcode tracking.
- Receipt/PDF generation, Bluetooth thermal printing, Windows raw printing, and XPrinter TSPL sticker printing.

### A2H source archive

Confirmed in the supplied A2H Dart source:

- Mobile-oriented Flutter layout using flutter_screenutil.
- Provider.
- Hive and Hive Flutter local persistence.
- Product add/edit/delete.
- Purchase, wholesale, and selling prices.
- Stock quantities.
- Sales and purchase invoice entry.
- Customer/source details, line quantities, unit prices, discounts, delivery charges, and live totals.
- Automatic sales stock deduction and insufficient-stock validation.
- Arabic PDF generation, local saving, and printing.

The source does **not** prove cloud synchronization, multi-user permissions, tax/accounting modules, or automatic stock increases from purchase invoices.

### Sharks Academy source archive

Confirmed from the supplied Sharks Academy source listing and UI files:

- Flutter/Dart.
- Material 3.
- flutter_screenutil.
- Intl localization.
- Google Fonts.
- Device Preview.
- Reusable form/UI widgets.
- Splash, motivational entry, three-step onboarding, Arabic-first login, remember-me UI, detailed student registration, guardian contact, school, grade, teacher, identity/birth-certificate field, terms acceptance, and password recovery through email or SMS choice.

No Firebase, API, streaming, live-session, certificate, or payment claim is made from this source.

## Owner-confirmed information

- Game Zone manages PlayStation maintenance/service-center operations and includes device intake, repair workflow, customer status tracking, receipt printing, and device-label printing.
- A2H manages inventory items/stock and supports fast sales and purchase invoices.
- Sharks Academy includes courses, educational content, and examinations.
- Noga Mobile and Al Raqi Mobile must not expose public APK actions.
- Noga Mobile and Al Raqi Mobile use Watch Showcase actions.
- A2H is a Mobile application, not Windows/Desktop.
- Game Zone remains Windows/Desktop.
- Phone/WhatsApp must not be exposed publicly without explicit approval.

## Screenshot-confirmed information

### Noga Mobile

Twenty-four supplied visuals show:

- Splash/app identity.
- Work orders.
- Primary and secondary navigation menus.
- Technician and customer dashboards.
- Customer/device intake steps.
- Fault and pricing forms.
- Daily-session opening/summary/closing.
- Management and accounting summaries.
- Inventory activity.
- Technician account views.

Screenshots do not prove the backend/database stack, deployment ownership, module ownership, or release status.

### Al Raqi Mobile

Twenty-six supplied visuals show:

- Record tables, filters, search, forms, dialogs, and case details.
- Repair/customer/device operational workflows.
- QR/report presentation.
- Summary dashboards.
- User/role management surfaces.

### Game Zone

Ten supplied visuals show:

- Desktop service-center dashboard and maintenance cases.
- Device intake/repair records.
- QR receipt/barcode/printing-related presentation.
- Customer-facing Web tracking pages.

### A2H

Six supplied portrait screenshots show:

- Mobile operations dashboard.
- Quick-invoice menu.
- Sales invoice entry and print preview.
- Purchase invoice entry and print preview.

### Sharks Academy

Twenty-five supplied visuals show:

- Splash and onboarding.
- Arabic login and registration.
- Student/guardian/school/grade/teacher information fields.
- Password recovery.
- Course/exam/educational presentation boards and student-facing flows.

### Other projects

The project asset map records screenshot-confirmed UI for Dr. Yasmeen Pharmacy, TargetX, Farah Services, Trelixi, Education App, Cleany, Fitness App, Kanzoon, Recast, Shop Smart, Rusheta Windows, Ahla Beauty, and Gypsum Home.

## Genuinely unconfirmed information

The following are intentionally not asserted publicly as facts:

- Noga Mobile backend/database technology, exact module ownership, deployment responsibility, or public release status.
- Sharks Academy backend/API/authentication implementation beyond the supplied UI source, and release status.
- Game Zone public deployment URL, public release status, or repository availability.
- A2H public release status or repository/demo availability.
- Recast final product name, implementation scope, full technology stack, and shipped-versus-concept status.
- Shop Smart detailed technical scope, release status, and approval of the generic APK link for public promotion.
- Al Raqi public/commercial release status or shareable repository/live deployment.
- Exact implementation/backend/deployment ownership for Ahla Beauty and Gypsum Home.
- User counts, download counts, revenue impact, client names, testimonials, production scale, or app-store status for any project unless future evidence is supplied.

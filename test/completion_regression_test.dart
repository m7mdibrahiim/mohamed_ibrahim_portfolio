import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mohamed_ibrahim_portfolio/app/localization/app_localizations.dart';
import 'package:mohamed_ibrahim_portfolio/core/widgets/mobile_drawer.dart';
import 'package:mohamed_ibrahim_portfolio/core/widgets/mockups/desktop_mockup.dart';
import 'package:mohamed_ibrahim_portfolio/core/widgets/mockups/phone_mockup.dart';
import 'package:mohamed_ibrahim_portfolio/features/experience/widgets/experience_timeline.dart';
import 'package:mohamed_ibrahim_portfolio/features/projects/data/projects_data.dart';
import 'package:mohamed_ibrahim_portfolio/features/projects/widgets/project_links.dart';
import 'package:mohamed_ibrahim_portfolio/features/projects/widgets/project_mockup_view.dart';
import 'package:mohamed_ibrahim_portfolio/features/projects/widgets/project_showcase_dialog.dart';

Widget _localizedApp(
  Widget child, {
  Locale locale = const Locale('en'),
  double textScale = 1,
}) {
  return MaterialApp(
    locale: locale,
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    theme: ThemeData.dark(useMaterial3: true),
    builder: (context, widget) => MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(textScale),
      ),
      child: Directionality(
        textDirection:
            locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: widget ?? const SizedBox.shrink(),
      ),
    ),
    home: Scaffold(body: child),
  );
}

void main() {
  testWidgets('A2H selects a phone mockup and Game Zone a desktop mockup', (
    tester,
  ) async {
    final a2h = ProjectsData.byId('a2h-inventory-invoicing')!;
    final gameZone = ProjectsData.byId('game-zone')!;

    await tester.pumpWidget(
      _localizedApp(
        Column(
          children: [
            ProjectMockupView(
              project: a2h,
              image: a2h.primaryImage,
              width: 220,
            ),
            ProjectMockupView(
              project: gameZone,
              image: gameZone.primaryImage,
              width: 620,
            ),
          ],
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(PhoneMockup), findsOneWidget);
    expect(find.byType(DesktopMockup), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  for (final locale in <Locale>[const Locale('en'), const Locale('ar')]) {
    testWidgets(
      'Experience cards remain content-driven at 320px ${locale.languageCode}',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(320, 1200));
        addTearDown(() => tester.binding.setSurfaceSize(null));

        await tester.pumpWidget(
          _localizedApp(
            const SingleChildScrollView(child: ExperienceTimeline()),
            locale: locale,
            textScale: locale.languageCode == 'ar' ? 1.5 : 1.0,
          ),
        );
        await tester.pump(const Duration(milliseconds: 500));
        expect(tester.takeException(), isNull);
      },
    );
  }

  testWidgets('mobile drawer exposes one Download CV action', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 780));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      _localizedApp(
        MobileDrawer(
          activeNav: 'home',
          onItemTap: (_) {},
        ),
      ),
    );
    await tester.pump();

    expect(
      find.byKey(const ValueKey<String>('drawer-download-cv')),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });

  for (final id in <String>['noga-mobile', 'al-raqi-mobile']) {
    testWidgets('$id opens and closes its showcase safely', (tester) async {
      final project = ProjectsData.byId(id)!;
      await tester.binding.setSurfaceSize(const Size(390, 820));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        _localizedApp(
          Center(child: ProjectLinks(project: project)),
        ),
      );
      await tester.pump();
      await tester.tap(find.text('Watch Showcase'));
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(ProjectShowcaseDialog), findsOneWidget);
      expect(tester.takeException(), isNull);

      await tester.tap(find.byIcon(Icons.close_rounded).first);
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byType(ProjectShowcaseDialog), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }
}

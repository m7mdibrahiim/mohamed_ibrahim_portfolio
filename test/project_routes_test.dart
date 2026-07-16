import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mohamed_ibrahim_portfolio/app/localization/app_localizations.dart';
import 'package:mohamed_ibrahim_portfolio/app/localization/language_cubit.dart';
import 'package:mohamed_ibrahim_portfolio/app/router/app_router.dart';
import 'package:mohamed_ibrahim_portfolio/features/projects/data/projects_data.dart';
import 'package:visibility_detector/visibility_detector.dart';

Widget _testApp({Locale locale = const Locale('en')}) {
  return BlocProvider<LanguageCubit>(
    create: (_) => LanguageCubit(initialLocale: locale),
    child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF35D8FF),
          brightness: Brightness.dark,
        ),
      ),
      routerConfig: AppRouter.router,
      builder: (context, child) => Directionality(
        textDirection:
            locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: child ?? const SizedBox.shrink(),
      ),
    ),
  );
}

Future<void> _pumpRoute(
  WidgetTester tester,
  String location, {
  Size size = const Size(1440, 1200),
  Locale locale = const Locale('en'),
}) async {
  await tester.binding.setSurfaceSize(size);
  AppRouter.router.go(location);
  await tester.pumpWidget(_testApp(locale: locale));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 760));
}

void main() {
  setUpAll(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  tearDown(() {
    AppRouter.router.go('/');
  });

  testWidgets('every project route renders without an exception', (tester) async {
    addTearDown(() => tester.binding.setSurfaceSize(null));
    for (final project in ProjectsData.orderedProjects) {
      await _pumpRoute(tester, '/projects/${project.id}');
      expect(find.text(project.titleEn), findsWidgets, reason: project.id);
      expect(tester.takeException(), isNull, reason: project.id);
    }
  });

  for (final id in <String>[
    'game-zone',
    'a2h-inventory-invoicing',
    'sharks-academy',
    'targetx-app',
    'noga-mobile',
    'al-raqi-mobile',
  ]) {
    testWidgets('$id renders directly', (tester) async {
      addTearDown(() => tester.binding.setSurfaceSize(null));
      final project = ProjectsData.byId(id)!;
      await _pumpRoute(tester, '/projects/$id');
      expect(find.text(project.titleEn), findsWidgets);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('invalid project slug shows the branded not-found page', (
    tester,
  ) async {
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await _pumpRoute(tester, '/projects/not-a-real-project');
    expect(find.byKey(const ValueKey<String>('project-not-found')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Next Project cycles safely through all projects', (tester) async {
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final projects = ProjectsData.orderedProjects;
    await _pumpRoute(
      tester,
      '/projects/${projects.first.id}',
      size: const Size(1280, 1000),
    );

    for (var index = 0; index < projects.length; index++) {
      final expected = projects[(index + 1) % projects.length];
      final scrollable = find.byType(CustomScrollView).first;
      await tester.dragUntilVisible(
        find.byKey(const ValueKey<String>('next-project-button')),
        scrollable,
        const Offset(0, -760),
      );
      await tester.tap(
        find.byKey(const ValueKey<String>('next-project-button')),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 760));
      expect(find.text(expected.titleEn), findsWidgets, reason: expected.id);
      expect(tester.takeException(), isNull, reason: expected.id);
    }

    expect(find.text(projects.first.titleEn), findsWidgets);
  });

  testWidgets('Projects page defaults to All and renders every project', (
    tester,
  ) async {
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await _pumpRoute(tester, '/projects', size: const Size(1440, 1600));
    for (final project in ProjectsData.orderedProjects) {
      expect(find.text(project.titleEn), findsWidgets, reason: project.id);
    }
    expect(tester.takeException(), isNull);
  });

  for (final width in <double>[320, 340, 360, 375, 390, 393, 412, 430, 480, 768, 1024, 1440]) {
    testWidgets('new routes have no layout exception at ${width.toInt()}px', (
      tester,
    ) async {
      addTearDown(() => tester.binding.setSurfaceSize(null));
      for (final id in <String>[
        'noga-mobile',
        'al-raqi-mobile',
        'sharks-academy',
        'game-zone',
        'a2h-inventory-invoicing',
      ]) {
        await _pumpRoute(
          tester,
          '/projects/$id',
          size: Size(width, 1200),
        );
        expect(tester.takeException(), isNull, reason: '$id @ $width');
      }
    });
  }


  for (final width in <double>[320, 360, 375, 390, 393, 412, 430]) {
    testWidgets('Arabic Noga route has no layout exception at ${width.toInt()}px', (
      tester,
    ) async {
      addTearDown(() => tester.binding.setSurfaceSize(null));
      await _pumpRoute(
        tester,
        '/projects/noga-mobile',
        size: Size(width, 1200),
        locale: const Locale('ar'),
      );
      expect(tester.takeException(), isNull, reason: 'noga-mobile ar @ $width');
    });
  }

  testWidgets('Arabic new-project routes render without exceptions', (
    tester,
  ) async {
    addTearDown(() => tester.binding.setSurfaceSize(null));
    for (final id in <String>[
      'noga-mobile',
      'al-raqi-mobile',
      'sharks-academy',
      'game-zone',
      'a2h-inventory-invoicing',
    ]) {
      await _pumpRoute(
        tester,
        '/projects/$id',
        size: const Size(390, 1200),
        locale: const Locale('ar'),
      );
      expect(tester.takeException(), isNull, reason: id);
    }
  });
}

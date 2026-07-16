import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mohamed_ibrahim_portfolio/app/localization/app_localizations.dart';
import 'package:mohamed_ibrahim_portfolio/app/localization/language_cubit.dart';
import 'package:mohamed_ibrahim_portfolio/app/router/app_router.dart';
import 'package:mohamed_ibrahim_portfolio/core/widgets/footer.dart';
import 'package:mohamed_ibrahim_portfolio/core/widgets/mi_logo.dart';
import 'package:mohamed_ibrahim_portfolio/core/widgets/mobile_drawer.dart';
import 'package:mohamed_ibrahim_portfolio/core/widgets/profile_avatar.dart';
import 'package:visibility_detector/visibility_detector.dart';

Widget _routerApp({Locale locale = const Locale('en')}) {
  return BlocProvider<LanguageCubit>(
    create: (_) => LanguageCubit(initialLocale: locale),
    child: MaterialApp.router(
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData.dark(useMaterial3: true),
      routerConfig: AppRouter.router,
      builder: (context, child) => Directionality(
        textDirection:
            locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: child ?? const SizedBox.shrink(),
      ),
    ),
  );
}

Future<void> _pump(
  WidgetTester tester,
  String location, {
  Size size = const Size(1440, 1000),
  Locale locale = const Locale('en'),
  Duration wait = const Duration(milliseconds: 900),
}) async {
  await tester.binding.setSurfaceSize(size);
  AppRouter.router.go(location);
  await tester.pumpWidget(_routerApp(locale: locale));
  await tester.pump();
  await tester.pump(wait);
}

void main() {
  setUpAll(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  tearDown(() => AppRouter.router.go('/'));

  testWidgets('scroll-spy marks Home at the top and Contact at page bottom', (
    tester,
  ) async {
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await _pump(tester, '/');

    expect(
      find.byKey(const ValueKey<String>('nav-active-home')),
      findsOneWidget,
    );

    final scrollable = find.byType(CustomScrollView).first;
    await tester.drag(scrollable, const Offset(0, -20000));
    await tester.pump(const Duration(milliseconds: 400));
    expect(
      find.byKey(const ValueKey<String>('nav-active-contact')),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('scroll-spy follows Projects, Experience, Skills, and Process', (
    tester,
  ) async {
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await _pump(tester, '/');
    final scrollable = find.byType(CustomScrollView).first;

    final checks = <(String, String)>[
      ('Featured Projects', 'projects'),
      ('Experience Timeline', 'experience'),
      ('Skills', 'skills'),
      ('How I Build Apps', 'process'),
    ];

    for (final check in checks) {
      await tester.scrollUntilVisible(
        find.text(check.$1).first,
        520,
        scrollable: scrollable,
      );
      await tester.drag(scrollable, const Offset(0, -260));
      await tester.pump(const Duration(milliseconds: 320));
      expect(
        find.byKey(ValueKey<String>('nav-active-${check.$2}')),
        findsOneWidget,
        reason: check.$2,
      );
      expect(tester.takeException(), isNull, reason: check.$2);
    }
  });

  testWidgets('navbar click scrolls and highlights each homepage section', (
    tester,
  ) async {
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await _pump(tester, '/');

    for (final item in <(String, String)>[
      ('Projects', 'projects'),
      ('Experience', 'experience'),
      ('Skills', 'skills'),
      ('Process', 'process'),
      ('Contact', 'contact'),
      ('Home', 'home'),
    ]) {
      await tester.tap(find.text(item.$1).first);
      await tester.pump(const Duration(milliseconds: 780));
      expect(
        find.byKey(ValueKey<String>('nav-active-${item.$2}')),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);
    }
  });

  testWidgets('project details navigation defers scrolling until home mounts', (
    tester,
  ) async {
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await _pump(tester, '/projects/targetx-app');

    await tester.tap(find.text('Experience').first);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1900));

    expect(
      find.byKey(const ValueKey<String>('nav-active-experience')),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('mobile drawer closes after selecting a section', (tester) async {
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final previousHitTestPolicy =
        WidgetController.hitTestWarningShouldBeFatal;
    WidgetController.hitTestWarningShouldBeFatal = true;
    addTearDown(
      () => WidgetController.hitTestWarningShouldBeFatal =
          previousHitTestPolicy,
    );

    await _pump(tester, '/', size: const Size(390, 900));

    final menuButton = find.byKey(const Key('mobile-menu-button'));
    expect(menuButton, findsOneWidget);
    final menuRect = tester.getRect(menuButton);
    expect(menuRect.left, greaterThanOrEqualTo(0));
    expect(menuRect.right, lessThanOrEqualTo(390));

    await tester.tap(menuButton);
    await tester.pump(const Duration(milliseconds: 320));
    expect(find.byType(MobileDrawer), findsOneWidget);

    await tester.tap(find.byKey(const Key('drawer-projects')));
    await tester.pump(const Duration(milliseconds: 900));
    expect(find.byType(MobileDrawer), findsNothing);
    expect(tester.takeException(), isNull);

    await tester.tap(menuButton);
    await tester.pump(const Duration(milliseconds: 320));
    expect(
      find.byKey(const ValueKey<String>('drawer-active-projects')),
      findsOneWidget,
    );
    await tester.tap(find.byKey(const Key('drawer-close-button')));
    await tester.pump(const Duration(milliseconds: 320));
    expect(find.byType(MobileDrawer), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('footer uses the real profile avatar and keeps MI as fallback', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Scaffold(body: AppFooter()),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    expect(
      find.descendant(
        of: find.byType(AppFooter),
        matching: find.byType(ProfileAvatar),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byType(AppFooter),
        matching: find.byType(MiLogo),
      ),
      findsNothing,
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProfileAvatar(assetPath: 'assets/does-not-exist.png'),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.byType(MiLogo), findsOneWidget);
  });

  for (final width in <double>[320, 340, 360, 375, 390, 393, 412, 430, 480, 768, 1024, 1440]) {
    for (final locale in <Locale>[const Locale('en'), const Locale('ar')]) {
      testWidgets(
        'homepage is structurally responsive at ${width.toInt()}px ${locale.languageCode}',
        (tester) async {
          addTearDown(() => tester.binding.setSurfaceSize(null));
          await _pump(
            tester,
            '/',
            size: Size(width, 1100),
            locale: locale,
          );
          expect(tester.takeException(), isNull);
        },
      );
    }
  }
}

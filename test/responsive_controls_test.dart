import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mohamed_ibrahim_portfolio/app/localization/app_localizations.dart';
import 'package:mohamed_ibrahim_portfolio/app/localization/language_cubit.dart';
import 'package:mohamed_ibrahim_portfolio/core/widgets/app_navbar.dart';
import 'package:mohamed_ibrahim_portfolio/core/widgets/app_outlined_button.dart';
import 'package:mohamed_ibrahim_portfolio/core/widgets/gradient_button.dart';

Widget _localizedShell({
  required Widget child,
  Locale locale = const Locale('en'),
  double textScale = 1,
}) {
  return BlocProvider<LanguageCubit>(
    create: (_) => LanguageCubit(initialLocale: locale),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData.dark(useMaterial3: true),
      builder: (context, appChild) {
        final mediaQuery = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: TextScaler.linear(textScale),
          ),
          child: Directionality(
            textDirection: locale.languageCode == 'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: appChild ?? const SizedBox.shrink(),
          ),
        );
      },
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  group('constraint-aware buttons', () {
    final cases = <({double width, double scale, Locale locale, String label})>[
      (
        width: 160,
        scale: 1,
        locale: const Locale('en'),
        label: 'View the complete project case study',
      ),
      (
        width: 188,
        scale: 1.3,
        locale: const Locale('en'),
        label: 'Watch the complete project showcase',
      ),
      (
        width: 218,
        scale: 1.5,
        locale: const Locale('ar'),
        label: 'عرض دراسة الحالة الكاملة للمشروع',
      ),
      (
        width: 320,
        scale: 1.5,
        locale: const Locale('ar'),
        label: 'شاهد العرض الكامل للمشروع',
      ),
    ];

    for (final testCase in cases) {
      testWidgets(
        'AppOutlinedButton fits ${testCase.width}px at ${testCase.scale}x ${testCase.locale.languageCode}',
        (tester) async {
          await tester.pumpWidget(
            _localizedShell(
              locale: testCase.locale,
              textScale: testCase.scale,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: testCase.width,
                  child: AppOutlinedButton(
                    label: testCase.label,
                    icon: Icons.arrow_forward_rounded,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          );
          await tester.pump();
          expect(tester.takeException(), isNull);
          expect(
            tester.getSize(find.byType(AppOutlinedButton)).height,
            greaterThanOrEqualTo(48),
          );
        },
      );

      testWidgets(
        'GradientButton fits ${testCase.width}px at ${testCase.scale}x ${testCase.locale.languageCode}',
        (tester) async {
          await tester.pumpWidget(
            _localizedShell(
              locale: testCase.locale,
              textScale: testCase.scale,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: testCase.width,
                  child: GradientButton(
                    label: testCase.label,
                    icon: Icons.play_circle_fill_rounded,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          );
          await tester.pump();
          expect(tester.takeException(), isNull);
          expect(
            tester.getSize(find.byType(GradientButton)).height,
            greaterThanOrEqualTo(48),
          );
        },
      );
    }

    testWidgets('buttons support icon-only and text-only constrained states', (
      tester,
    ) async {
      await tester.pumpWidget(
        _localizedShell(
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 160,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppOutlinedButton(
                    label: '',
                    icon: Icons.download_rounded,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 12),
                  GradientButton(
                    label: 'Contact Mohamed Ibrahim',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(tester.takeException(), isNull);
    });
  });

  group('navbar uses its actual available width', () {
    for (final width in <double>[
      320,
      340,
      360,
      375,
      390,
      393,
      412,
      430,
      480,
      768,
      1024,
      1280,
      1366,
      1440,
    ]) {
      for (final locale in <Locale>[const Locale('en'), const Locale('ar')]) {
        testWidgets(
          'navbar remains in bounds at ${width.toInt()}px ${locale.languageCode}',
          (tester) async {
            addTearDown(() => tester.binding.setSurfaceSize(null));
            await tester.binding.setSurfaceSize(Size(width, 900));
            await tester.pumpWidget(
              _localizedShell(
                locale: locale,
                textScale: width <= 430 ? 1.3 : 1,
                child: AppNavbar(
                  activeNav: 'home',
                  onSectionTap: (_) {},
                ),
              ),
            );
            await tester.pump();

            expect(
              find.byKey(const Key('navbar-profile-avatar')),
              findsOneWidget,
            );

            if (width < 1280) {
              final menuButton =
                  find.byKey(const Key('mobile-menu-button'));
              expect(menuButton, findsOneWidget);
              expect(
                find.byKey(const Key('compact-navigation')),
                findsOneWidget,
              );
              final menuRect = tester.getRect(menuButton);
              expect(menuRect.left, greaterThanOrEqualTo(0));
              expect(menuRect.right, lessThanOrEqualTo(width));

              final languageButton =
                  find.byKey(const Key('language-toggle-button'));
              expect(languageButton, findsOneWidget);
              final languageRect = tester.getRect(languageButton);
              expect(languageRect.left, greaterThanOrEqualTo(0));
              expect(languageRect.right, lessThanOrEqualTo(width));
            } else {
              expect(
                find.byKey(const Key('desktop-navigation')),
                findsOneWidget,
              );
              expect(
                find.byKey(const Key('mobile-menu-button')),
                findsNothing,
              );
            }

            expect(tester.takeException(), isNull);
          },
        );
      }
    }
  });
}

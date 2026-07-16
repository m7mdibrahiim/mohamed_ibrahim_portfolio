import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mohamed_ibrahim_portfolio/app/localization/app_localizations.dart';
import 'package:mohamed_ibrahim_portfolio/features/projects/data/projects_data.dart';
import 'package:mohamed_ibrahim_portfolio/features/projects/models/project_link_model.dart';
import 'package:mohamed_ibrahim_portfolio/features/projects/models/project_model.dart';
import 'package:mohamed_ibrahim_portfolio/features/projects/widgets/fullscreen_project_media_viewer.dart';
import 'package:mohamed_ibrahim_portfolio/features/projects/widgets/project_gallery.dart';

ProjectModel _project({
  required String id,
  required List<String> screenshots,
  String coverImage = '',
}) {
  return ProjectModel(
    id: id,
    displayPriority: 1,
    platformOrder: 1,
    titleEn: 'Test project',
    titleAr: 'مشروع تجريبي',
    categoryEn: 'Mobile app',
    categoryAr: 'تطبيق موبايل',
    shortDescriptionEn: 'Test description',
    shortDescriptionAr: 'وصف تجريبي',
    overviewEn: 'Overview',
    overviewAr: 'نظرة عامة',
    problemEn: 'Problem',
    problemAr: 'التحدي',
    roleEn: 'Role',
    roleAr: 'الدور',
    challengeEn: 'Challenge',
    challengeAr: 'التحدي',
    solutionEn: 'Solution',
    solutionAr: 'الحل',
    statusEn: 'Test',
    statusAr: 'تجريبي',
    type: ProjectType.mobile,
    techStack: const <String>['Flutter'],
    featuresEn: const <String>['Feature'],
    featuresAr: const <String>['ميزة'],
    highlightsEn: const <String>['Highlight'],
    highlightsAr: const <String>['ميزة'],
    screenshots: screenshots,
    coverImage: coverImage,
    links: const <ProjectLinkModel>[],
  );
}

Widget _app(ProjectModel project, {Locale locale = const Locale('en')}) {
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
    home: Directionality(
      textDirection:
          locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: 430,
            child: ProjectGallery(project: project),
          ),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('empty screenshot gallery renders a fallback', (tester) async {
    final project = _project(id: 'zero-screens', screenshots: const <String>[]);
    await tester.binding.setSurfaceSize(const Size(430, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(_app(project));
    await tester.pump(const Duration(milliseconds: 80));

    expect(
      find.byKey(const ValueKey<String>('gallery-fallback-zero-screens')),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('one-image gallery renders safely', (tester) async {
    const image = 'assets/images/placeholders/generic_placeholder.jpg';
    final project = _project(
      id: 'one-screen',
      screenshots: const <String>[image],
      coverImage: image,
    );
    await tester.binding.setSurfaceSize(const Size(430, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(_app(project));
    await tester.pump(const Duration(milliseconds: 140));

    expect(find.text('1 / 1'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('large 20+ image gallery builds lazily and changes page safely', (
    tester,
  ) async {
    const image = 'assets/images/placeholders/generic_placeholder.jpg';
    final project = _project(
      id: 'large-gallery',
      screenshots: List<String>.filled(24, image),
      coverImage: image,
    );
    await tester.binding.setSurfaceSize(const Size(430, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(_app(project));
    await tester.pump(const Duration(milliseconds: 140));
    expect(find.text('1 / 24'), findsOneWidget);

    await tester.drag(find.byType(PageView), const Offset(-300, 0));
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.text('2 / 24'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Arabic gallery count uses RTL wording', (tester) async {
    const image = 'assets/images/placeholders/generic_placeholder.jpg';
    final project = _project(
      id: 'arabic-gallery',
      screenshots: const <String>[image, image],
      coverImage: image,
    );
    await tester.binding.setSurfaceSize(const Size(430, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(_app(project, locale: const Locale('ar')));
    await tester.pump(const Duration(milliseconds: 140));
    expect(find.text('1 من 2'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('selected index resets when the project changes', (tester) async {
    const image = 'assets/images/placeholders/generic_placeholder.jpg';
    final first = _project(
      id: 'first-gallery',
      screenshots: const <String>[image, image, image],
      coverImage: image,
    );
    final second = _project(
      id: 'targetx-regression-single',
      screenshots: const <String>[image],
      coverImage: image,
    );
    await tester.binding.setSurfaceSize(const Size(430, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(_app(first));
    await tester.pump(const Duration(milliseconds: 140));
    await tester.drag(find.byType(PageView), const Offset(-320, 0));
    await tester.pump(const Duration(milliseconds: 350));
    await tester.drag(find.byType(PageView), const Offset(-320, 0));
    await tester.pump(const Duration(milliseconds: 350));

    await tester.pumpWidget(_app(second));
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.text('1 / 1'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  for (final entry in <(String, int)>[
    ('al-raqi-mobile', 32),
    ('noga-mobile', 24),
  ]) {
    testWidgets(
      '${entry.$1} exposes every approved image in fullscreen',
      (tester) async {
        final project = ProjectsData.byId(entry.$1)!;
        await tester.binding.setSurfaceSize(const Size(430, 1100));
        addTearDown(() => tester.binding.setSurfaceSize(null));

        await tester.pumpWidget(_app(project));
        await tester.pump(const Duration(milliseconds: 180));
        expect(find.text('1 / ${entry.$2}'), findsOneWidget);

        await tester.tap(
          find.byKey(ValueKey<String>('gallery-fullscreen-${entry.$1}')),
        );
        await tester.pump(const Duration(milliseconds: 260));

        final viewer = tester.widget<FullscreenProjectMediaViewer>(
          find.byType(FullscreenProjectMediaViewer),
        );
        expect(viewer.mediaItems.length, entry.$2);
        expect(
          viewer.mediaItems.map((item) => item.path).toList(),
          project.validScreenshots,
        );

        for (var index = 0; index < entry.$2; index++) {
          final path = project.validScreenshots[index];
          expect(
            find.byKey(
              ValueKey<String>('fullscreen-${entry.$1}-$index-$path'),
            ),
            findsOneWidget,
            reason: '${entry.$1} fullscreen image ${index + 1}',
          );
          expect(
            find.descendant(
              of: find.byKey(
                ValueKey<String>('fullscreen-counter-${entry.$1}'),
              ),
              matching: find.text('${index + 1} / ${entry.$2}'),
            ),
            findsOneWidget,
          );
          expect(tester.takeException(), isNull);

          if (index + 1 < entry.$2) {
            await tester.tap(
              find.byKey(
                ValueKey<String>('fullscreen-next-${entry.$1}'),
              ),
            );
            await tester.pump(const Duration(milliseconds: 320));
          }
        }

        await tester.tap(
          find.byKey(ValueKey<String>('fullscreen-close-${entry.$1}')),
        );
        await tester.pump(const Duration(milliseconds: 260));
        expect(find.byType(FullscreenProjectMediaViewer), findsNothing);
        expect(tester.takeException(), isNull);
      },
    );
  }

  testWidgets('authoritative gallery counters reach 32/32 and 24/24', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(430, 1100));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    for (final entry in <(String, int)>[
      ('al-raqi-mobile', 32),
      ('noga-mobile', 24),
    ]) {
      final project = ProjectsData.byId(entry.$1)!;
      await tester.pumpWidget(_app(project));
      await tester.pump(const Duration(milliseconds: 180));

      for (var index = 1; index < entry.$2; index++) {
        await tester.tap(
          find.byKey(ValueKey<String>('gallery-next-${entry.$1}')),
        );
        await tester.pump(const Duration(milliseconds: 320));
      }
      expect(find.text('${entry.$2} / ${entry.$2}'), findsOneWidget);
      expect(tester.takeException(), isNull);
    }
  });

}

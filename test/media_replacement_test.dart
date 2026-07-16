import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mohamed_ibrahim_portfolio/core/constants/app_assets.dart';
import 'package:mohamed_ibrahim_portfolio/features/projects/data/projects_data.dart';
import 'package:mohamed_ibrahim_portfolio/features/projects/models/project_model.dart';

Iterable<File> _publicTextFiles() sync* {
  const extensions = <String>{
    '.dart',
    '.yaml',
    '.yml',
    '.html',
    '.json',
    '.md',
    '.ps1',
  };
  final root = Directory.current;
  for (final entity in root.listSync(recursive: true, followLinks: false)) {
    if (entity is! File) continue;
    final normalized = entity.path.replaceAll('\\', '/');
    if (normalized.contains('/build/') ||
        normalized.contains('/.dart_tool/') ||
        normalized.contains('/.git/') ||
        normalized.endsWith('/CHANGED_FILES.md')) {
      continue;
    }
    if (extensions.any(normalized.endsWith)) yield entity;
  }
}

void main() {
  test('authoritative v4 sets contain exactly 32 Al Raqi and 24 Noga files', () {
    final alRaqiDirectory = Directory(
      'assets/images/projects/al_raqi_mobile/authoritative_v4',
    );
    final nogaDirectory = Directory(
      'assets/images/projects/noga_mobile/authoritative_v4',
    );

    final alRaqiFiles = alRaqiDirectory
        .listSync()
        .whereType<File>()
        .where((file) => RegExp(r'al_raqi_\d{2}_v4\.(?:jpg|png)$')
            .hasMatch(file.uri.pathSegments.last))
        .toList();
    final nogaFiles = nogaDirectory
        .listSync()
        .whereType<File>()
        .where((file) => RegExp(r'noga_\d{2}_v4\.jpg$')
            .hasMatch(file.uri.pathSegments.last))
        .toList();

    expect(alRaqiFiles.length, 32);
    expect(nogaFiles.length, 24);
    expect(alRaqiFiles.length + nogaFiles.length, 56);
    expect(
      Directory(
        'assets/images/projects/al_raqi_mobile/' 'final_v3',
      ).existsSync(),
      isFalse,
    );
    expect(
      Directory(
        'assets/images/projects/noga_mobile/' 'final_v3',
      ).existsSync(),
      isFalse,
    );
  });

  test('every approved screenshot is referenced exactly once in its gallery', () {
    final alRaqi = ProjectsData.byId('al-raqi-mobile')!;
    final noga = ProjectsData.byId('noga-mobile')!;

    expect(alRaqi.validScreenshots, AppAssets.alRaqiMobileScreenshots);
    expect(noga.validScreenshots, AppAssets.nogaMobileScreenshots);
    expect(alRaqi.validScreenshots.toSet().length, 32);
    expect(noga.validScreenshots.toSet().length, 24);

    for (final project in <ProjectModel>[alRaqi, noga]) {
      for (final path in project.validScreenshots) {
        expect(
          project.validScreenshots.where((candidate) => candidate == path).length,
          1,
          reason: '${project.id}: $path',
        );
        final file = File(path);
        expect(file.existsSync(), isTrue, reason: path);
        expect(file.lengthSync(), greaterThan(0), reason: path);
      }
    }
  });

  test('authoritative covers and showcase posters use full-resolution v4 images', () {
    final alRaqi = ProjectsData.byId('al-raqi-mobile')!;
    final noga = ProjectsData.byId('noga-mobile')!;

    expect(alRaqi.coverImage, AppAssets.alRaqiMobileScreenshots[22]);
    expect(noga.coverImage, AppAssets.nogaMobileScreenshots[14]);
    expect(alRaqi.showcasePosterPath, alRaqi.coverImage);
    expect(noga.showcasePosterPath, noga.coverImage);
    expect(alRaqi.coverImage, contains('/authoritative_v4/'));
    expect(noga.coverImage, contains('/authoritative_v4/'));
  });

  test('Al Raqi uses image-level phone/browser/desktop/document metadata', () {
    final project = ProjectsData.byId('al-raqi-mobile')!;
    expect(project.validMediaItems.length, 32);
    expect(
      project.validMediaItems
          .where((item) => item.kind == ProjectMediaKind.desktop)
          .length,
      27,
    );
    expect(
      project.validMediaItems
          .where((item) => item.kind == ProjectMediaKind.browser)
          .length,
      4,
    );
    expect(
      project.validMediaItems
          .where((item) => item.kind == ProjectMediaKind.document)
          .length,
      1,
    );
    expect(
      project.validMediaItems.every(
        (item) => item.pixelWidth != null && item.pixelHeight != null,
      ),
      isTrue,
    );
  });

  test('all Noga media are portrait phone screenshots with source dimensions', () {
    final project = ProjectsData.byId('noga-mobile')!;
    expect(project.validMediaItems.length, 24);
    for (final item in project.validMediaItems) {
      expect(item.kind, ProjectMediaKind.phone);
      expect(item.pixelWidth, 576);
      expect(item.pixelHeight, 1280);
    }
  });

  test('Noga and Al Raqi expose showcase without APK actions', () {
    for (final id in <String>['noga-mobile', 'al-raqi-mobile']) {
      final project = ProjectsData.byId(id)!;
      expect(project.apkUrl, isNull, reason: id);
      expect(project.showApkButton, isFalse, reason: id);
      expect(project.showcaseType, ProjectShowcaseType.video, reason: id);
      expect(project.hasShowcase, isTrue, reason: id);
      expect(project.showcaseVideoPath, endsWith('_showcase_v3.mp4'));
      expect(project.showcasePosterPath, contains('/authoritative_v4/'));
    }
  });

  test('approved showcase videos exist and old variants are absent', () {
    for (final path in <String>[
      AppAssets.nogaMobileShowcaseVideo,
      AppAssets.alRaqiMobileShowcaseVideo,
    ]) {
      final file = File(path);
      expect(file.existsSync(), isTrue, reason: path);
      expect(file.lengthSync(), greaterThan(0), reason: path);
    }

    final publicVideos = Directory('assets/videos')
        .listSync()
        .whereType<File>()
        .map((file) => file.uri.pathSegments.last)
        .where(
          (name) => name.startsWith('noga_mobile_showcase') ||
              name.startsWith('al_raqi_mobile_showcase'),
        )
        .toSet();
    expect(
      publicVideos,
      <String>{
        'noga_mobile_showcase_v3.mp4',
        'al_raqi_mobile_showcase_v3.mp4',
      },
    );
  });

  test('video surface is path-keyed and resets stale media state', () {
    final dialog = File(
      'lib/features/projects/widgets/project_showcase_dialog.dart',
    ).readAsStringSync();
    final surface = File(
      'lib/features/projects/widgets/project_video_surface_web.dart',
    ).readAsStringSync();

    expect(dialog, contains("'\${project.id}-\${project.showcaseVideoPath}'"));
    expect(surface, contains('void didUpdateWidget'));
    expect(surface, contains('oldWidget.videoPath != widget.videoPath'));
    expect(surface, contains('_disposeVideoElement();'));
    expect(surface, contains("video.removeAttribute('src')"));
  });

  test('project media widgets do not apply blur, masking, or low quality', () {
    final mediaFiles = <String>[
      'lib/core/widgets/loading_image.dart',
      'lib/core/widgets/mockups/phone_mockup.dart',
      'lib/core/widgets/mockups/browser_mockup.dart',
      'lib/core/widgets/mockups/desktop_mockup.dart',
      'lib/core/widgets/mockups/document_mockup.dart',
      'lib/core/widgets/mockups/premium_pro_max_mockup.dart',
      'lib/features/projects/widgets/project_gallery.dart',
      'lib/features/projects/widgets/project_mockup_view.dart',
      'lib/features/projects/widgets/fullscreen_project_media_viewer.dart',
      'lib/features/projects/widgets/project_showcase_dialog.dart',
      'lib/features/projects/widgets/project_video_surface_web.dart',
    ];
    final forbidden = <String>[
      'ImageFilter.blur',
      'ImageFiltered',
      'BackdropFilter',
      'ShaderMask',
      'ColorFiltered',
      'FilterQuality.low',
      'sigmaX',
      'sigmaY',
    ];

    for (final path in mediaFiles) {
      final text = File(path).readAsStringSync();
      for (final pattern in forbidden) {
        expect(text.contains(pattern), isFalse, reason: '$path: $pattern');
      }
    }
    final loadingImage =
        File('lib/core/widgets/loading_image.dart').readAsStringSync();
    expect(loadingImage, contains('FilterQuality.high'));
    expect(loadingImage, contains('BoxFit'));
  });

  test('main preview and fullscreen consume original paths, not thumbnails', () {
    final gallery = File(
      'lib/features/projects/widgets/project_gallery.dart',
    ).readAsStringSync();
    final fullscreen = File(
      'lib/features/projects/widgets/fullscreen_project_media_viewer.dart',
    ).readAsStringSync();

    expect(gallery, contains('image: item.path'));
    expect(gallery, contains('assetPath: item.path'));
    expect(gallery, contains('cacheWidth: decodeWidth'));
    expect(fullscreen, contains('assetPath: item.path'));
    expect(fullscreen, contains('fit: BoxFit.contain'));
    expect(fullscreen, isNot(contains('cacheWidth:')));
  });

  test('obsolete Noga and Al Raqi image references are absent from public tree', () {
    final forbidden = <String>[
      'assets/images/projects/noga_mobile/' 'final_v3/',
      'assets/images/projects/al_raqi_mobile/' 'final_v3/',
      'assets/images/projects/noga_mobile/showcase_poster',
      'assets/images/projects/al_raqi_mobile/showcase_poster',
    ];

    for (final file in _publicTextFiles()) {
      final text = file.readAsStringSync();
      for (final pattern in forbidden) {
        expect(text.contains(pattern), isFalse, reason: '${file.path}: $pattern');
      }
    }
  });

  test('A2H remains mobile and TargetX route safeguard source remains intact', () {
    final a2h = ProjectsData.byId('a2h-inventory-invoicing')!;
    expect(a2h.type, ProjectType.mobile);
    expect(a2h.resolvedDefaultMediaKind, ProjectMediaKind.phone);

    final router = File('lib/app/router/app_router.dart').readAsStringSync();
    final projectPage = File(
      'lib/features/projects/presentation/project_details_page.dart',
    ).readAsStringSync();
    final gallery = File(
      'lib/features/projects/widgets/project_gallery.dart',
    ).readAsStringSync();

    expect(router, contains("path: '/projects/:id'"));
    expect(projectPage, contains('ProjectsData.byId'));
    expect(projectPage, contains("'project-details-\${project.id}'"));
    expect(gallery, contains('void didUpdateWidget'));
    expect(gallery, contains('clamp(0, _items.length - 1)'));
  });

  test('route and gallery source retain safe lookup and index handling', () {
    final source = <String, String>{
      for (final path in <String>[
        'lib/app/router/app_router.dart',
        'lib/features/projects/data/projects_data.dart',
        'lib/features/projects/presentation/project_details_page.dart',
        'lib/features/projects/widgets/project_gallery.dart',
        'lib/features/projects/widgets/fullscreen_project_media_viewer.dart',
      ])
        path: File(path).readAsStringSync(),
    };

    expect(source.values.join('\n').contains('firstWhere('), isFalse);
    expect(
      source['lib/features/projects/presentation/project_details_page.dart'],
      contains('ProjectsData.byId'),
    );
    expect(
      source['lib/features/projects/widgets/project_gallery.dart'],
      contains('_safeSelectedIndex'),
    );
    expect(
      source['lib/features/projects/widgets/project_gallery.dart'],
      contains('if (items.isEmpty)'),
    );
    expect(
      source['lib/features/projects/widgets/fullscreen_project_media_viewer.dart'],
      contains('_safeIndex'),
    );
  });

  test('no duplicate Hero tags are declared in project media source', () {
    final heroPattern = RegExp(r'\bHero\s*\(');
    for (final file in Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'))) {
      expect(heroPattern.hasMatch(file.readAsStringSync()), isFalse,
          reason: file.path);
    }
  });

}

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mohamed_ibrahim_portfolio/core/constants/app_assets.dart';
import 'package:mohamed_ibrahim_portfolio/features/projects/data/projects_data.dart';
import 'package:mohamed_ibrahim_portfolio/features/projects/models/project_model.dart';

void main() {
  test('every project ID is unique, stable, and URL-safe', () {
    expect(ProjectsData.orderedProjects, isNotEmpty);
    expect(ProjectsData.duplicateIds, isEmpty);

    final urlSafe = RegExp(r'^[a-z0-9]+(?:-[a-z0-9]+)*$');
    for (final project in ProjectsData.orderedProjects) {
      expect(project.id, matches(urlSafe), reason: project.id);
      expect(ProjectsData.byId(project.id)?.id, project.id);
    }
  });

  test('mobile priority matches the approved exact order', () {
    expect(
      ProjectsData.mobileProjects.take(10).map((project) => project.id).toList(),
      const <String>[
        'dr-yasmeen-pharmacy',
        'noga-mobile',
        'sharks-academy',
        'targetx-app',
        'farah-services',
        'trelixi-learning-app',
        'education-app',
        'cleany-app',
        'fitness-app',
        'kanzoon-app',
      ],
    );
  });

  test('Windows order keeps Game Zone and Rusheta while A2H is mobile', () {
    expect(
      ProjectsData.windowsProjects.map((project) => project.id).toList(),
      const <String>[
        'game-zone',
        'rusheta-windows-app',
      ],
    );
  });

  test('Flutter App Lab uses the required priority', () {
    expect(
      ProjectsData.flutterAppLabProjects.map((project) => project.id).toList(),
      ProjectsData.flutterAppLabIds,
    );
  });

  test('authoritative screenshot counts are exact', () {
    final noga = ProjectsData.byId('noga-mobile')!;
    final alRaqi = ProjectsData.byId('al-raqi-mobile')!;

    expect(noga.validScreenshots.length, 24);
    expect(alRaqi.validScreenshots.length, 32);
    expect(noga.validScreenshots.length + alRaqi.validScreenshots.length, 56);
    expect(noga.validScreenshots.toSet().length, 24);
    expect(alRaqi.validScreenshots.toSet().length, 32);

    expect(ProjectsData.byId('targetx-app')?.validScreenshots.length, 13);
    expect(ProjectsData.byId('sharks-academy')?.validScreenshots.length, 25);
    expect(ProjectsData.byId('game-zone')?.validScreenshots.length, 1);
    expect(
      ProjectsData.byId('a2h-inventory-invoicing')?.validScreenshots.length,
      6,
    );
    expect(ProjectsData.byId('rusheta-windows-app')?.validScreenshots.length, 10);
    expect(
      ProjectsData.orderedProjects.fold<int>(
        0,
        (total, project) => total + project.validScreenshots.length,
      ),
      262,
    );
  });

  test('every mapped project image exists on disk', () {
    for (final project in ProjectsData.orderedProjects) {
      final paths = <String>{
        if (project.primaryImage case final image?) image,
        ...project.validScreenshots,
      };
      for (final path in paths) {
        expect(File(path).existsSync(), isTrue, reason: '${project.id}: $path');
      }
    }
  });

  test('authoritative media metadata preserves workflow order and kinds', () {
    final noga = ProjectsData.byId('noga-mobile')!;
    final alRaqi = ProjectsData.byId('al-raqi-mobile')!;

    expect(
      noga.validMediaItems.map((item) => item.workflowOrder).toList(),
      List<int>.generate(24, (index) => index + 1),
    );
    expect(
      alRaqi.validMediaItems.map((item) => item.workflowOrder).toList(),
      List<int>.generate(32, (index) => index + 1),
    );
    expect(
      noga.validMediaItems.every((item) => item.kind == ProjectMediaKind.phone),
      isTrue,
    );
    expect(
      alRaqi.validMediaItems
          .where((item) => item.kind == ProjectMediaKind.browser)
          .length,
      4,
    );
    expect(
      alRaqi.validMediaItems
          .where((item) => item.kind == ProjectMediaKind.desktop)
          .length,
      27,
    );
    expect(
      alRaqi.validMediaItems
          .where((item) => item.kind == ProjectMediaKind.document)
          .length,
      1,
    );
  });

  test('next-project cycle visits every project and returns to the first', () {
    final projects = ProjectsData.orderedProjects;
    var current = projects.first;
    final visited = <String>{current.id};

    for (var index = 0; index < projects.length; index++) {
      final next = ProjectsData.nextAfter(current);
      expect(next, isNotNull);
      current = next!;
      if (index < projects.length - 1) visited.add(current.id);
    }

    expect(current.id, projects.first.id);
    expect(visited.length, projects.length);
  });

  test('previous-project cycle is safe', () {
    final projects = ProjectsData.orderedProjects;
    var current = projects.first;
    for (var index = 0; index < projects.length; index++) {
      final previous = ProjectsData.previousBefore(current);
      expect(previous, isNotNull);
      current = previous!;
    }
    expect(current.id, projects.first.id);
  });

  test('A2H is mobile and Noga/Al Raqi expose showcase without APK', () {
    final a2h = ProjectsData.byId('a2h-inventory-invoicing')!;
    final gameZone = ProjectsData.byId('game-zone')!;
    final noga = ProjectsData.byId('noga-mobile')!;
    final alRaqi = ProjectsData.byId('al-raqi-mobile')!;

    expect(a2h.type, ProjectType.mobile);
    expect(a2h.resolvedDefaultMediaKind, ProjectMediaKind.phone);
    expect(gameZone.type, ProjectType.desktop);
    expect(gameZone.resolvedDefaultMediaKind, ProjectMediaKind.desktop);
    expect(noga.showApkButton, isFalse);
    expect(noga.apkUrl, isNull);
    expect(noga.hasShowcase, isTrue);
    expect(alRaqi.showApkButton, isFalse);
    expect(alRaqi.apkUrl, isNull);
    expect(alRaqi.hasShowcase, isTrue);
  });

  test('updated CV and approved showcase videos exist', () {
    for (final path in <String>[
      AppAssets.updatedCvPdf,
      AppAssets.updatedCvDocx,
      AppAssets.nogaMobileShowcaseVideo,
      AppAssets.alRaqiMobileShowcaseVideo,
    ]) {
      final file = File(path);
      expect(file.existsSync(), isTrue, reason: path);
      expect(file.lengthSync(), greaterThan(0), reason: path);
    }
  });
}

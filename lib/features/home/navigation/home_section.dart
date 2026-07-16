import 'package:flutter/widgets.dart';

enum HomeSection { home, projects, experience, skills, process, contact }

extension HomeSectionX on HomeSection {
  String get id => name;

  String get localizationKey => switch (this) {
        HomeSection.home => 'navHome',
        HomeSection.projects => 'navProjects',
        HomeSection.experience => 'navExperience',
        HomeSection.skills => 'navSkills',
        HomeSection.process => 'navProcess',
        HomeSection.contact => 'navContact',
      };

  static HomeSection? fromId(String? value) {
    final normalized = value?.trim().toLowerCase();
    if (normalized == null || normalized.isEmpty) return null;
    for (final section in HomeSection.values) {
      if (section.id == normalized) return section;
    }
    return null;
  }
}

class HomeSectionEntry {
  const HomeSectionEntry({
    required this.section,
    required this.key,
    required this.order,
  });

  final HomeSection section;
  final GlobalKey key;
  final int order;
}

/// Owns the homepage section keys and their deterministic display order.
class HomeSectionRegistry {
  HomeSectionRegistry()
      : entries = List<HomeSectionEntry>.unmodifiable(
          <HomeSectionEntry>[
            for (var i = 0; i < HomeSection.values.length; i++)
              HomeSectionEntry(
                section: HomeSection.values[i],
                key: GlobalKey(
                  debugLabel: 'home-section-${HomeSection.values[i].id}',
                ),
                order: i,
              ),
          ],
        );

  final List<HomeSectionEntry> entries;

  HomeSectionEntry entry(HomeSection section) => entries[section.index];

  GlobalKey keyOf(HomeSection section) => entry(section).key;
}

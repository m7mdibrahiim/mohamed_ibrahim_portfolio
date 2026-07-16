import 'package:flutter/widgets.dart';

import '../../../core/responsive/context_extensions.dart';
import 'project_link_model.dart';

enum ProjectType { mobile, web, desktop }

enum ProjectMediaKind { phone, browser, desktop, document }

enum ProjectShowcaseType { none, video, cinematicSlides }

class ProjectMediaItem {
  const ProjectMediaItem({
    required this.path,
    required this.kind,
    required this.captionEn,
    required this.captionAr,
    required this.workflowOrder,
    this.descriptionEn = '',
    this.descriptionAr = '',
    this.pixelWidth,
    this.pixelHeight,
  });

  final String path;
  final ProjectMediaKind kind;
  final String captionEn;
  final String captionAr;
  final int workflowOrder;
  final String descriptionEn;
  final String descriptionAr;
  final int? pixelWidth;
  final int? pixelHeight;

  double? get sourceAspectRatio {
    final width = pixelWidth;
    final height = pixelHeight;
    if (width == null || height == null || width <= 0 || height <= 0) {
      return null;
    }
    return width / height;
  }

  String caption(BuildContext context) => context.isAr ? captionAr : captionEn;
  String description(BuildContext context) =>
      context.isAr ? descriptionAr : descriptionEn;
}

class ProjectModel {
  const ProjectModel({
    required this.id,
    required this.displayPriority,
    required this.platformOrder,
    required this.titleEn,
    required this.titleAr,
    required this.categoryEn,
    required this.categoryAr,
    required this.shortDescriptionEn,
    required this.shortDescriptionAr,
    required this.overviewEn,
    required this.overviewAr,
    required this.problemEn,
    required this.problemAr,
    required this.roleEn,
    required this.roleAr,
    required this.challengeEn,
    required this.challengeAr,
    required this.solutionEn,
    required this.solutionAr,
    required this.statusEn,
    required this.statusAr,
    required this.type,
    required this.techStack,
    required this.featuresEn,
    required this.featuresAr,
    required this.highlightsEn,
    required this.highlightsAr,
    required this.screenshots,
    required this.coverImage,
    required this.links,
    this.mediaItems = const <ProjectMediaItem>[],
    this.featuredPriority,
    this.workflowEn = const <String>[],
    this.workflowAr = const <String>[],
    this.ownerConfirmedFeaturesEn = const <String>[],
    this.ownerConfirmedFeaturesAr = const <String>[],
    this.screenshotConfirmedFeaturesEn = const <String>[],
    this.screenshotConfirmedFeaturesAr = const <String>[],
    this.icon,
    this.isSourcePrivate = true,
    this.hasUnconfirmedDetails = false,
    this.defaultMediaKind,
    this.mediaKindOverrides = const <String, ProjectMediaKind>{},
    this.showApkButton = true,
    this.showcaseType = ProjectShowcaseType.none,
    this.showcaseVideoPath,
    this.showcasePosterPath,
    this.showcaseSlides = const <String>[],
    this.showcaseCaptionsEn = const <String>[],
    this.showcaseCaptionsAr = const <String>[],
  });

  final String id;
  final int displayPriority;
  final int platformOrder;
  final int? featuredPriority;
  final String titleEn;
  final String titleAr;
  final String categoryEn;
  final String categoryAr;
  final String shortDescriptionEn;
  final String shortDescriptionAr;
  final String overviewEn;
  final String overviewAr;
  final String problemEn;
  final String problemAr;
  final String roleEn;
  final String roleAr;
  final String challengeEn;
  final String challengeAr;
  final String solutionEn;
  final String solutionAr;
  final String statusEn;
  final String statusAr;
  final ProjectType type;
  final List<String> techStack;
  final List<String> featuresEn;
  final List<String> featuresAr;
  final List<String> highlightsEn;
  final List<String> highlightsAr;
  final List<String> workflowEn;
  final List<String> workflowAr;
  final List<String> ownerConfirmedFeaturesEn;
  final List<String> ownerConfirmedFeaturesAr;
  final List<String> screenshotConfirmedFeaturesEn;
  final List<String> screenshotConfirmedFeaturesAr;

  /// Legacy path-only gallery input retained for existing projects.
  /// New mixed-media projects should prefer [mediaItems].
  final List<String> screenshots;

  /// Image-level metadata used by mixed mobile/desktop/web/document galleries.
  final List<ProjectMediaItem> mediaItems;
  final String coverImage;
  final String? icon;
  final List<ProjectLinkModel> links;
  final bool isSourcePrivate;
  final bool hasUnconfirmedDetails;
  final ProjectMediaKind? defaultMediaKind;
  final Map<String, ProjectMediaKind> mediaKindOverrides;
  final bool showApkButton;
  final ProjectShowcaseType showcaseType;
  final String? showcaseVideoPath;
  final String? showcasePosterPath;
  final List<String> showcaseSlides;
  final List<String> showcaseCaptionsEn;
  final List<String> showcaseCaptionsAr;

  bool get isFeatured => featuredPriority != null;

  List<String> get _validLegacyScreenshots => screenshots
      .map((path) => path.trim())
      .where((path) => path.isNotEmpty)
      .toList(growable: false);

  List<ProjectMediaItem> get validMediaItems {
    final explicit = mediaItems
        .where((item) => item.path.trim().isNotEmpty)
        .toList(growable: false)
      ..sort((a, b) => a.workflowOrder.compareTo(b.workflowOrder));
    if (explicit.isNotEmpty) return explicit;

    return _validLegacyScreenshots.indexed
        .map(
          (entry) => ProjectMediaItem(
            path: entry.$2,
            kind: mediaKindOverrides[entry.$2] ?? resolvedDefaultMediaKind,
            captionEn: '',
            captionAr: '',
            workflowOrder: entry.$1 + 1,
          ),
        )
        .toList(growable: false);
  }

  List<String> get validScreenshots => validMediaItems
      .map((item) => item.path.trim())
      .where((path) => path.isNotEmpty)
      .toList(growable: false);

  String? get primaryImage {
    final cover = coverImage.trim();
    if (cover.isNotEmpty) return cover;
    final gallery = validScreenshots;
    return gallery.isEmpty ? null : gallery.first;
  }

  bool get hasScreenshots => validMediaItems.isNotEmpty;
  bool get hasAnyVisual => primaryImage != null;
  bool get usesPlaceholder =>
      primaryImage?.contains('/placeholders/') ?? false;

  ProjectMediaKind get resolvedDefaultMediaKind {
    final explicit = defaultMediaKind;
    if (explicit != null) return explicit;
    return switch (type) {
      ProjectType.mobile => ProjectMediaKind.phone,
      ProjectType.web => ProjectMediaKind.browser,
      ProjectType.desktop => ProjectMediaKind.desktop,
    };
  }

  ProjectMediaItem? mediaItemFor(String? path) {
    final normalized = path?.trim();
    if (normalized == null || normalized.isEmpty) return null;
    for (final item in validMediaItems) {
      if (item.path == normalized) return item;
    }
    return null;
  }

  ProjectMediaKind mediaKindFor(String? path) {
    final normalized = path?.trim();
    if (normalized == null || normalized.isEmpty) {
      return resolvedDefaultMediaKind;
    }
    return mediaItemFor(normalized)?.kind ??
        mediaKindOverrides[normalized] ??
        resolvedDefaultMediaKind;
  }

  List<ProjectLinkModel> get visibleLinks => links
      .where((link) => showApkButton || link.type != ProjectLinkType.apk)
      .toList(growable: false);

  String? get apkUrl {
    if (!showApkButton) return null;
    for (final link in links) {
      if (link.type == ProjectLinkType.apk && link.url.trim().isNotEmpty) {
        return link.url;
      }
    }
    return null;
  }

  bool get hasShowcase {
    if (showcaseType == ProjectShowcaseType.none) return false;
    if (showcaseType == ProjectShowcaseType.video) {
      return showcaseVideoPath?.trim().isNotEmpty ?? false;
    }
    return effectiveShowcaseSlides.isNotEmpty;
  }

  List<String> get effectiveShowcaseSlides => showcaseSlides.isNotEmpty
      ? showcaseSlides
      : validScreenshots;

  String title(BuildContext context) => context.isAr ? titleAr : titleEn;
  String category(BuildContext context) =>
      context.isAr ? categoryAr : categoryEn;
  String shortDescription(BuildContext context) =>
      context.isAr ? shortDescriptionAr : shortDescriptionEn;
  String overview(BuildContext context) =>
      context.isAr ? overviewAr : overviewEn;
  String problem(BuildContext context) =>
      context.isAr ? problemAr : problemEn;
  String role(BuildContext context) => context.isAr ? roleAr : roleEn;
  String challenge(BuildContext context) =>
      context.isAr ? challengeAr : challengeEn;
  String solution(BuildContext context) =>
      context.isAr ? solutionAr : solutionEn;
  String status(BuildContext context) => context.isAr ? statusAr : statusEn;
  List<String> features(BuildContext context) =>
      context.isAr ? featuresAr : featuresEn;
  List<String> highlights(BuildContext context) =>
      context.isAr ? highlightsAr : highlightsEn;
  List<String> workflow(BuildContext context) =>
      context.isAr ? workflowAr : workflowEn;
  List<String> ownerConfirmedFeatures(BuildContext context) => context.isAr
      ? ownerConfirmedFeaturesAr
      : ownerConfirmedFeaturesEn;
  List<String> screenshotConfirmedFeatures(BuildContext context) => context.isAr
      ? screenshotConfirmedFeaturesAr
      : screenshotConfirmedFeaturesEn;
  List<String> showcaseCaptions(BuildContext context) =>
      context.isAr ? showcaseCaptionsAr : showcaseCaptionsEn;
}
